$code = {
    $shapeStyleDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\ShapeStyleData.cs
    Add-Type -Language CSharp $shapeStyleDataCsCode

    $mountainTopStyle = New-Object CodeFactory.ShapeStyleData -Property @{
        Name = "mountainTopStyle";
        Target = "path";
        Fill = "#FFFFFF";
        Stroke = "#1A7C93";
        StrokeThickness = 1;
    };
    $mountainMiddleStyle = New-Object CodeFactory.ShapeStyleData -Property @{
        Name = "mountainMiddleStyle";
        Target = "path";
        Fill = "#C8B7A1";
        Stroke = "#64777C";
        StrokeThickness = 1;
    };
    $mountainBottomStyle = New-Object CodeFactory.ShapeStyleData -Property @{
        Name = "mountainBottomStyle";
        Target = "path";
        Fill = "#8FD821";
        Stroke = "#6BAD0C";
        StrokeThickness = 1;
    };
    $mountainPathStyle = New-Object CodeFactory.ShapeStyleData -Property @{
        Name = "mountainPathStyle";
        Target = "path";
        Fill = "#EE9624";
        Stroke = "#BD700D";
        StrokeThickness = 1;
    };

    $firStyle = New-Object CodeFactory.ShapeStyleData -Property @{
        Name = "firStyle";
        Target = "path";
        Fill = "#548B00";
        Stroke = "#284200";
        StrokeThickness = 1;
    };
    $script:Styles = @(
        $mountainTopStyle; 
        $mountainMiddleStyle;
        $mountainBottomStyle;
        $mountainPathStyle;
        $firStyle )

    $shapeDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\ShapeData.cs
    Add-Type -Language CSharp $shapeDataCsCode
    $mountainTop = New-Object CodeFactory.ShapeData -Property @{
        StyleDataName = $mountainTopStyle.Name;
        PathData = "
            M 1,131 
            L 1,191 
            L 421,191 
            L 421,131 
            L 351,91 
            L 311,81 
            L 291,51 
            L 271,71 
            L 251,51 
            L 231,61 
            L 201,41 
            L 181,51 
            L 161,21 
            L 151,41 
            L 131,11 
            L 111,51 
            L 101,21 
            L 91,41 
            L 71,1 
            L 41,71 
            L 31,51 
            1,131 Z";
    }
    $mountainMiddle = New-Object CodeFactory.ShapeData -Property @{
        StyleDataName = $mountainMiddleStyle.Name;
        PathData = "
            M 1,91 
            L 1,191 
            L 421,191 
            L 421,131 
            C 397.667,114.333 374.333,97.6666 357.667,89.3333 
            C 341,80.9999 331,80.9999 321,77.6666 
            C 311,74.3333 301,67.6666 292.667,65.9999 
            C 284.333,64.3333 277.667,67.6666 271,67.6666 
            C 264.333,67.6666 257.667,64.3333 251,62.6666 
            C 244.333,60.9999 237.667,60.9999 229.333,59.3333 
            C 221,57.6667 211,54.3333 202.667,56 
            C 194.333,57.6667 187.667,64.3333 181,62.6667 
            C 174.333,61 167.667,51 162.667,52.6667 
            C 157.667,54.3333 154.333,67.6666 149.333,67.6666 
            C 144.333,67.6666 137.667,54.3333 131,54.3333 
            C 124.333,54.3333 117.667,67.6666 112.667,67.6666 
            C 107.667,67.6666 104.333,54.3333 101,52.6667 
            C 97.6667,51 94.3334,60.9999 89.3334,59.3333 
            C 84.3334,57.6667 77.6667,44.3333 71,47.6667 
            C 64.3334,51 57.6667,70.9999 47.6667,77.6666 
            C 37.6667,84.3333 24.3334,77.6666 16,77.6666 
            C 7.6667,77.6666 4.33337,84.3333 
            1,91 Z";
    }
    $mountainBottom = New-Object CodeFactory.ShapeData -Property @{
        StyleDataName = $mountainBottomStyle.Name;
        PathData = "
            M 1,131 
            L 1,191 
            L 421,191 
            L 421,131 
            C 407.667,117.667 394.333,104.333 377.667,96 
            C 361,87.6666 341,84.3333 326,85.9999 
            C 311,87.6666 301,94.3333 289.333,101 
            C 277.667,107.667 264.333,114.333 249.333,109.333 
            C 234.333,104.333 217.667,87.6666 202.667,84.3333 
            C 187.667,80.9999 174.333,91 166,92.6666 
            C 157.667,94.3333 154.333,87.6666 146,84.3333 
            C 137.667,80.9999 124.333,80.9999 111,82.6666 
            C 97.6667,84.3333 84.3334,87.6666 74.3334,89.3333 
            C 64.3334,91 57.6667,91 46,97.6666 
            C 34.3334,104.333 17.6667,117.667 
            1,131 Z";
    }
    $mountainPath = New-Object CodeFactory.ShapeData -Property @{
        StyleDataName = $mountainPathStyle.Name;
        PathData = "
            M 121,191
            C 136.333,187 151.667,183 154,178.333
            C 156.333,173.667 145.667,168.333 140.333,163
            C 135,157.667 135,152.333 136.667,148.333
            C 138.333,144.333 141.667,141.667 153,139.333
            C 164.333,137 183.667,135 198.333,133.722
            C 213,132.444 223,131.889 231.75,131.148
            C 240.5,130.407 248,129.481 253.741,128.64
            C 259.481,127.799 263.463,127.043 266.579,126.316
            C 269.694,125.589 271.944,124.892 273.642,124.116
            C 275.34,123.339 276.485,122.485 276.521,121.521
            C 276.558,120.558 275.486,119.486 273.696,118.696
            C 271.905,117.905 269.395,117.395 266.669,116.947
            C 263.942,116.498 260.999,116.11 257.907,115.685
            C 254.815,115.259 251.574,114.796 251.065,114.009
            C 250.556,113.222 252.778,112.111 255,111L 259,111
            C 257.508,111.633 256.017,112.266 255.458,112.686
            C 254.9,113.107 255.275,113.315 256.65,113.545
            C 258.025,113.774 260.4,114.024 262.4,114.274
            C 264.4,114.524 266.025,114.774 267.983,115.065
            C 269.941,115.357 272.233,115.69 274.458,116.353
            C 276.683,117.016 278.842,118.008 280.254,118.837
            C 281.667,119.667 282.333,120.333 282.333,121.667
            C 282.333,123 281.667,125 278.167,126.833
            C 274.667,128.667 268.333,130.333 260.611,131.722
            C 252.889,133.111 243.778,134.222 233.944,135.056
            C 224.111,135.889 213.556,136.444 199.944,138.056
            C 186.333,139.667 169.667,142.333 160.667,144.333
            C 151.667,146.333 150.333,147.667 150.333,150
            C 150.333,152.333 151.667,155.667 158.667,159.333
            C 165.667,163 178.333,167 186.333,170.667
            C 194.333,174.333 197.667,177.667 198.667,180
            C 199.667,182.333 198.333,183.667 197,185.333
            C 195.667,187 194.333,189 193,191
            L 121,191 Z";
    }
    $transformDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\TransformData.cs
    Add-Type -Language CSharp $transformDataCsCode
    $transformData1 = New-Object CodeFactory.TransformData -Property @{
        Name = "transformData1";
        TranslateX = 205;
        TranslateY = 76;
        ScaleX = 0.45;
        ScaleY = 0.5;
    }
    $transformData2 = New-Object CodeFactory.TransformData -Property @{
        Name = "transformData2";
        TranslateX = 99;
        TranslateY = 127;
        ScaleX = 0.9;
    }
    $transformData3 = New-Object CodeFactory.TransformData -Property @{
        Name = "transformData3";
        TranslateX = 311;
        TranslateY = 115;
    }
    $transformData4 = New-Object CodeFactory.TransformData -Property @{
        Name = "transformData4";
        TranslateX = 43;
        TranslateY = 106;
        ScaleX = 0.82;
    }
    $transformData5 = New-Object CodeFactory.TransformData -Property @{
        Name = "transformData5";
        TranslateX = 176;
        TranslateY = 114;
    }
    $transformData6 = New-Object CodeFactory.TransformData -Property @{
        Name = "transformData6";
        TranslateX = 131;
        TranslateY = 83;
        ScaleX = 0.5;
        ScaleY = 0.6;
    }
    $script:Transforms = @(
        $transformData1; 
        $transformData2;
        $transformData3;
        $transformData4;
        $transformData5;
        $transformData6 )

    $firPathData = "
        M 20.5,0.5
        L 24.5,4.5
        L 22.5,4.5
        L 28.5,10.5
        L 24.5,10.5 
        L 32.5,18.5 
        L 26.5,18.5 
        L 36.5,28.5 
        L 28.5,28.5 
        L 40.5,40.5 
        L 22.5,40.500 
        L 22.5,44.500 
        L 18.5,44.500 
        L 18.5,40.500 
        L 0.5,40.500 
        L 12.5,28.500 
        L 4.5,28.500 
        L 14.5,18.500 
        L 8.5,18.500 
        L 16.5,10.500 
        L 12.5,10.500 
        L 18.5,4.5000 
        L 16.5,4.5000 
        L 20.5,0.5 Z";
    $firDef = New-Object CodeFactory.ShapeData -Property @{
        Name = "firDef";
        PathData = $firPathData;
        StyleDataName = $firStyle.Name;
    }
    $script:shapeDefs = @(
        $firDef; 
    )
    $firRef1 = New-Object CodeFactory.ShapeData -Property @{
        DefName = $firDef.Name;
        TransformDataName = $transformData1.Name;
    }
    $firRef2 = New-Object CodeFactory.ShapeData -Property @{
        DefName = $firDef.Name;
        TransformDataName = $transformData2.Name;
    }
    $firRef3 = New-Object CodeFactory.ShapeData -Property @{
        DefName = $firDef.Name;
        TransformDataName = $transformData3.Name;
    }
    $firRef4 = New-Object CodeFactory.ShapeData -Property @{
        DefName = $firDef.Name;
        TransformDataName = $transformData4.Name;
    }
    $firRef5 = New-Object CodeFactory.ShapeData -Property @{
        DefName = $firDef.Name;
        TransformDataName = $transformData5.Name;
    }
    $firRef6 = New-Object CodeFactory.ShapeData -Property @{
        DefName = $firDef.Name;
        TransformDataName = $transformData6.Name;
    }            
    $script:shapes = @(
        $mountainTop; 
        $mountainMiddle;
        $mountainBottom;
        $mountainPath )
    $script:shapeRefs = @(
        $firRef1;
        $firRef2;
        $firRef3;
        $firRef4;
        $firRef5;
        $firRef6 )
    $shapeboardDataCsCode = Import-CodeTemplate $PSScriptRoot\..\CsCode\ShapeboardData.cs
    Add-Type -Language CSharp $shapeboardDataCsCode
    $script:shapeboard = New-Object CodeFactory.ShapeboardData -Property @{
        Width = 422;
        Height = 192;
    }
}

$OutDir = "$PSScriptRoot\Export"
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
$svg = Export-FileFromTemplate $PSScriptRoot\landscape.svg.template $code $OutDir\landscape.svg
$xaml = Export-FileFromTemplate $PSScriptRoot\landscape.xaml.template $code $OutDir\landscape.xaml