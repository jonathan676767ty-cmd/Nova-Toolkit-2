$ErrorActionPreference = "Stop"

dotnet publish .\Toolkit.csproj -c Release -r win-x64 --self-contained true `
    -p:PublishSingleFile=true `
    -p:IncludeNativeLibrariesForSelfExtract=true `
    -p:PublishTrimmed=false `
    -p:DebugType=None `
    -o .\dist

if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

$publishArtifacts = @(
    "NovaToolkit.pdb",
    "Microsoft.Web.WebView2.Core.xml",
    "Microsoft.Web.WebView2.WinForms.xml",
    "Microsoft.Web.WebView2.Wpf.xml"
)
foreach ($artifact in $publishArtifacts) {
    $artifactPath = Join-Path .\dist $artifact
    if (Test-Path $artifactPath) {
        Remove-Item $artifactPath -ErrorAction Stop
    }
}

Write-Output "Executable created at .\dist\NovaToolkit.exe"
