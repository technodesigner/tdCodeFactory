$code = {
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

    $transformDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\TransformData.cs
    Add-Type -Language CSharp $transformDataCsCode
    
    $transformData1 = New-Object CodeFactory.TransformData -Property @{
        Name = "transformData1";
        TranslateX = 80;
        TranslateY = 10;
    }

    $transformData2 = New-Object CodeFactory.TransformData -Property @{
        Name = "transformData2";
        ScaleX = 0.5;
        ScaleY = 0.5;
        TranslateX = 10;
        TranslateY = 10;
    }

    $transformData3 = New-Object CodeFactory.TransformData -Property @{
        Name = "transformData3";
        TranslateX = 80;
        TranslateY = 70;
    }

    $transformData4 = New-Object CodeFactory.TransformData -Property @{
        Name = "transformData4";
        ScaleX = 0.5;
        ScaleY = 0.5;
        TranslateX = 10;
        TranslateY = 70;
    }

    $script:transforms = @(
        $transformData1; 
        $transformData2; 
        $transformData3; 
        $transformData4 )

    $rectDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\RectData.cs
    Add-Type -Language CSharp $rectDataCsCode

    $rectDef1 = New-Object CodeFactory.RectData -Property @{
        Name = "rectDef1";
        StyleDataName = $rectStyle1.Name;
        Width = 80;
        Height = 40;
        RadiusX = 4;
        RadiusY = 4;
    }
    $rectDef2 = New-Object CodeFactory.RectData -Property @{
        Name = "rectDef2";
        StyleDataName = $rectStyle2.Name;
        Width = 100;
        Height = 50;
        RadiusX = 5;
        RadiusY = 5;
    }

    $script:rectDefs = @(
        $rectDef1;
        $rectDef2 )

    $rectRef1 = New-Object CodeFactory.RectData -Property @{
        DefName = $rectDef1.Name;
        TransformDataName = $transformData1.Name;
    }
    $rectRef2 = New-Object CodeFactory.RectData -Property @{
        DefName = $rectDef1.Name;
        TransformDataName = $transformData2.Name;
    }
    $rectRef3 = New-Object CodeFactory.RectData -Property @{
        DefName = $rectDef2.Name;
        TransformDataName = $transformData3.Name;
    }
    $rectRef4 = New-Object CodeFactory.RectData -Property @{
        DefName = $rectDef2.Name;
        TransformDataName = $transformData4.Name;
    }

    $script:rectRefs = @(
        $rectRef1;
        $rectRef2;
        $rectRef3;
        $rectRef4 )

    $shapeboardDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\ShapeboardData.cs
    Add-Type -Language CSharp $shapeboardDataCsCode
    $script:shapeboard = New-Object CodeFactory.ShapeboardData -Property @{
        Width = 200;
        Height = 150;
    }
}
$OutDir = "$PSScriptRoot\Export"
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
$svg = Export-FileFromTemplate $PSScriptRoot\rect.svg.template $code $OutDir\rect.svg
$xaml = Export-FileFromTemplate $PSScriptRoot\rect.xaml.template $code $OutDir\rect.xaml