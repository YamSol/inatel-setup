# Definir navegador padrão
function Set-DefaultBrowser {
    # Importar Windows.Forms
    Add-Type -AssemblyName 'System.Windows.Forms'

    # Abrir janela de configuração
    $process = Start-Process $env:windir\system32\control.exe -LoadUserProfile -PassThru -ArgumentList '/name Microsoft.DefaultPrograms /page pageDefaultProgram\pageAdvancedSettings?pszAppName=MSEdgeHTM'
  
    # Aguardar a página carregar
    $process.WaitForInputIdle()  
    Start-Sleep -Seconds 2  # Atraso de 1 segundo

    # Ir para Navegador padrao
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}")
    Start-Sleep -Milliseconds 500

    # Selecionar Navegador padrao
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{ENTER}")
    Start-Sleep -Milliseconds 500
  
    # Fechar janela de configuração
    Stop-Process -Name SystemSettings
}
Set-DefaultBrowser

# Log status
Write-Host -ForegroundColor Yellow "(1/1) Chrome definido como padrao"