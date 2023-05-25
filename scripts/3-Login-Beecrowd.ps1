# Login Beecrowd
function Connect-Beecrowd {
    # Iniciar chrome
    Start-Process "chrome" -ArgumentList "--guest" -PassThru
    Start-Sleep 2

    # Importando Windows.Forms
    Add-Type -AssemblyName 'System.Windows.Forms'

    # Abrir pagina do Beecrowd 
    [System.Windows.Forms.SendKeys]::SendWait("^l")
    Start-Sleep -Milliseconds 100
    [System.Windows.Forms.SendKeys]::SendWait("https://beecrowd.com.br{ENTER}")
    Start-Sleep -Seconds 6

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