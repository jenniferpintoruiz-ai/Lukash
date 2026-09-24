$files = @(
    "C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\antesdelRegistro.html",
    "C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\cuentasclaras.html",
    "C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\categoriasCarrusel.html",
    "C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\cero-enredor.html",
    "C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\invertir.html",
    "C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\modoAhorrointro.html",
    "C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\opcionesdeModoAhorro.html",
    "C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\Registro.html",
    "C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\ruletica.html",
    "C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\ruleta.html"
)

foreach ($file in $files) {
    $content = Get-Content $file -Raw
    
    # Remove background-image from body style attributes
    $content = $content -replace '(?s)<body([^>]*style="[^"]*)background-image:\s*url\([^)]+\)[^"]*("[^>]*>)', '<body$1$2'
    
    # Clean up style attributes - remove empty or trailing semicolons
    $content = $content -replace 'style="([^"]*);\s*"', 'style="$1"'
    $content = $content -replace 'style="\s*;\s*"', ''
    $content = $content -replace 'style=""', ''
    
    # Ensure body has min-height if not present
    $content = $content -replace '(<body[^>]*class="[^"]*)"(?!\s*style=)', '$1" style="min-height: 100vh; margin: 0px;"'
    
    Set-Content $file -Value $content -Encoding UTF8
    Write-Host "Fixed: $file"
}

Write-Host "All done!"