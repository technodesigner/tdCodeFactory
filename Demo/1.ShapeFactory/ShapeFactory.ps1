$code = {
    $shapeStyleDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\ShapeStyleData.cs
    Add-Type -Language CSharp $shapeStyleDataCsCode

    $script:shapeStyle = New-Object CodeFactory.ShapeStyleData -Property @{
        Name = "rectStyle";
        Target = "rect";
        Fill = "#F5331F";
        Stroke = "#28282A";
        StrokeThickness = 2;
    };

    $rectDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\RectData.cs
    Add-Type -Language CSharp $rectDataCsCode

    $script:rect = New-Object CodeFactory.RectData -Property @{
        Name = "shape";
        StyleDataName = $script:shapeStyle.Name;
        X = 10;
        Y = 10;
        Width = 120;
        Height = 60;
        RadiusX = 8;
        RadiusY = 8;
    }
 
    $shapeboardDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\ShapeboardData.cs
    Add-Type -Language CSharp $shapeboardDataCsCode
    $script:shapeboard = New-Object CodeFactory.ShapeboardData -Property @{
        Width = 160;
        Height = 120;
    }
}
$OutDir = "$PSScriptRoot\Export"
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
$svg = Export-FileFromTemplate $PSScriptRoot\rect.svg.template $code $OutDir\rect.svg