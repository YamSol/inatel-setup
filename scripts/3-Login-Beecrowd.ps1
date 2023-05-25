# Login Beecrowd
function Connect-Beecrowd {
    # Importando Windows.Forms
    Add-Type -AssemblyName 'System.Windows.Forms'
    
    # Iniciar chrome e Abrir pagina do Beecrowd 
    Start-Process "chrome" -ArgumentList "--guest https://beecrowd.com.br" -PassThru
    Start-Sleep 6

    # Preencher campo de e-mail
    [System.Windows.Forms.SendKeys]::SendWait("yambertamini.sol@gmail.com{TAB}")

    # Prencher Senha
    Pause # preencha manualmente

    # Fechar navegador
    Stop-Process -Name chrome
}
Connect-Beecrowd

# Log status
Write-Host -ForegroundColor Yellow "(1/1) Logado com sucesso em Beecrowd"