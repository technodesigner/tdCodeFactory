function Import-CodeTemplate
{
    <# 
    .SYNOPSIS 
        Loads a code generation template file. 
    .DESCRIPTION 
        Loads a code generation template file, or a C# file. 
    .PARAMETER FilePath 
        Template file path. 
    .EXAMPLE 
        This example shows how to load a file containing a code generation template :
        $code = Import-CodeTemplate $TemplateFilePath     
    .EXAMPLE
        This example shows how to load a file containing a C# class definition :
        $TransformCsCode = Import-CodeTemplate .\CsCode\Transform.cs
        Add-Type -Language CSharp $TransformCsCode
    #> 
    [CmdletBinding()]
    Param([string]$FilePath)
    begin 
    {
        $mask = "{0}`n"
        $hereStr = $mask -f "@`""
    }
    process 
    {
        $hereStr += $mask -f (Get-Content $FilePath -Raw)
    } 
    end 
    {
        $hereStr += "`"@"
        Invoke-Command -ScriptBlock ([ScriptBlock]::Create($hereStr))
    } 
}

function Export-FileFromTemplate
{
    <# 
    .SYNOPSIS 
        Generates a file from a template. 
    .DESCRIPTION 
        Generates a file from a template and an initialization block. 
    .PARAMETER TemplateFilePath 
        Template file path. 
    .PARAMETER InitializationBlock
        Script block containing data and initialization code. Data must match templates.
    .PARAMETER OutFilePath 
        Generated file path.
    .EXAMPLE
        This example shows how to generate a SVG file from a template file (graphics.svg.template) :
        $svg = Export-FileFromTemplate $PSScriptRoot\Templates\graphics.svg.template $code $PSScriptRoot\graphics.svg 
    #> 
    [CmdletBinding()]
    param([string]$TemplateFilePath,
        [scriptblock]$InitializationBlock,
        [string]$OutFilePath)

    [int]$global:indentIncrement = 0
    [int]$global:currentIndentSize = 0
    [string]$global:currentIndent = ""

    function Init-Indent
    {
        Param([int]$indentSize = 2)
        $global:indentIncrement = $indentSize
        #$global:indentString = " " * $spaces
        Clear-Indent
    }  

    function Get-Indent
    {
        if($global:currentIndentSize -le 0)
        {
            $global:currentIndent = ""
        }
        else
        {
            $global:currentIndent = " " * $global:currentIndentSize
        }
        $global:currentIndent
    }
    New-Alias -Name i= -Value Get-Indent

    function Push-Indent
    {
        $global:currentIndentSize += $global:indentIncrement
        Get-Indent
    }
    New-Alias -Name i+ -Value Push-Indent
    
    function Pop-Indent
    {
        $global:currentIndentSize -= $global:indentIncrement
        Get-Indent
    }
    New-Alias -Name i- -Value Pop-Indent

    function Clear-Indent
    {
        $global:currentIndentSize = 0
        Get-Indent
    }
    New-Alias -Name i0 -Value Clear-Indent

    Init-Indent 4
    & $InitializationBlock

    $code = Import-CodeTemplate $TemplateFilePath    

    # Empty rows deletion
    $newCode = ""
    foreach ($line in $code -split [environment]::newline)
    {
        if ($line.Trim().Length -ne 0)
        {
            $newCode += "{0}{1}" -f ($line),[environment]::newline 
        }
    }
    $code = $newCode

    if ($OutFilePath)
    {
        if (Test-Path $OutFilePath)
        {
            Remove-Item $OutFilePath
        }
        New-Item -Path $OutFilePath -ItemType "file" -Value $code
    }
    else
    {
        $code
    }
}