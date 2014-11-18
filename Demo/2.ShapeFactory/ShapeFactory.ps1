﻿$code = {
    $shapeStyleDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\ShapeStyleData.cs
    Add-Type -Language CSharp $shapeStyleDataCsCode

    $rectStyle1 = New-Object CodeFactory.ShapeStyleData -Property @{
        Name = "rectStyle1";
        Target = "rect";
        Fill = "#FFA500";
        Stroke = "#28282A";
        StrokeThickness = 2;
    };
    $rectStyle2 = New-Object CodeFactory.ShapeStyleData -Property @{
        Name = "rectStyle2";
        Target = "rect";
        Fill = "#F5331F";
        Stroke = "#28282A";
        StrokeThickness = 2;
    };
    
    $script:styles = @(
        $rectStyle1;
        $rectStyle2 )

    $rectDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\RectData.cs
    Add-Type -Language CSharp $rectDataCsCode

    $rect1 = New-Object CodeFactory.RectData -Property @{
        Name = "rect1";
        StyleDataName = $rectStyle1.Name;
        X = 10;
        Y = 10;
        Width = 80;
        Height = 40;
        RadiusX = 4;
        RadiusY = 4;
    }

    $rect2 = New-Object CodeFactory.RectData -Property @{
        Name = "rect2";
        StyleDataName = $rectStyle1.Name;
        X = 20;
        Y = 20;
        Width = 100;
        Height = 50;
        RadiusX = 5;
        RadiusY = 5;
    }

    $rect3 = New-Object CodeFactory.RectData -Property @{
        Name = "rect3";
        StyleDataName = $rectStyle2.Name;
        X = 40;
        Y = 40;
        Width = 140;
        Height = 70;
        RadiusX = 8;
        RadiusY = 8;
    }     
    $script:shapes = @(
        $rect1;
        $rect2;
        $rect3 )

    $shapeboardDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\ShapeboardData.cs
    Add-Type -Language CSharp $shapeboardDataCsCode
    $script:shapeboard = New-Object CodeFactory.ShapeboardData -Property @{
        Width = 200;
        Height = 150;
    }
}
$OutDir = "$PSScriptRoot\Export"
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
# $svg = Export-FileFromTemplate $PSScriptRoot\rect.svg.template $code $OutDir\rect.svg
$svg = Export-FileFromTemplate $PSScriptRoot\rect2.svg.template $code $OutDir\rect.svg