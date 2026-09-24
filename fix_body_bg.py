import re

files = [
    r'C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\antesdelRegistro.html',
    r'C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\cuentasclaras.html',
    r'C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\categoriasCarrusel.html',
    r'C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\cero-enredor.html',
    r'C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\invertir.html',
    r'C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\modoAhorrointro.html',
    r'C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\opcionesdeModoAhorro.html',
    r'C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\Registro.html',
    r'C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\ruletica.html',
    r'C:\Users\CONTENIDOS DIGITALES\Downloads\Proyecto_\ruleta.html',
]

for file_path in files:
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace any body tag with background-image inline style
    # Pattern matches body with style containing background-image
    new_content = re.sub(
        r'(<body[^>]*style="[^"]*)background-image:\s*url\([^)]+\)[^"]*(")',
        r'\1\2',
        content
    )
    
    # Clean up any empty style attributes or trailing semicolons
    new_content = re.sub(r'style="([^"]*);\s*"', r'style="\1"', new_content)
    new_content = re.sub(r'style="\s*;\s*"', r'', new_content)
    new_content = re.sub(r'style=""', '', new_content)
    
    # Ensure min-height and margin are preserved
    if 'min-height: 100vh' not in new_content and 'min-h-screen' not in new_content:
        # Add min-height if body doesn't have it
        new_content = re.sub(r'(<body[^>]*class="[^"]*)"', r'\1" style="min-height: 100vh; margin: 0px;"', new_content)
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print(f'Fixed: {file_path}')

print('All done!')