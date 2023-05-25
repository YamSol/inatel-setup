# Instalar extensões
function Install-Extensions {
  code --install-extension danielpinto8zz6.c-cpp-compile-run --force
  code --install-extension ms-vscode.cpptools-extension-pack --force
}
Install-Extensions

# Log status
Write-Host -ForegroundColor Yellow "(1/2) Extensoes Instaladas"

# Copiar Configurações
function Copy-Configs {
  # Caminhos das configurações
  $paths = @(
    ".\configs\cpp.json",
    ".\configs\keybindings.json"
  )
  $destinations = @(
    "$env:APPDATA\Code\User\snippets\",
    "$env:APPDATA\Code\User\"
  )
    
  # Copiando configurações
  for ($i = 0; $i -lt $paths.Count; $i++) {
    if (Test-Path $paths[$i]) { 
      Copy-Item -Path $paths[$i] -Destination $destinations[$i]
    }
    else {
      Throw "Arquivo '$file' não encontrado."
    }
  }
}
Copy-Configs

# Log status
Write-Host -ForegroundColor Yellow "(2/2) Configurações do VS Code copiadas"