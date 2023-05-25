# Login Gitlab
function Connect-Gitlab {
    # Iniciar chrome
    Start-Process "chrome" -ArgumentList "--guest" -PassThru
    Start-Sleep 2

    # Importando Windows.Forms
    Add-Type -AssemblyName 'System.Windows.Forms'

    # Apagar coockies do site existentes (no modo convidado já nao existem)
    # function Remove-Cookies {
    #     [System.Windows.Forms.SendKeys]::SendWait("^l")
    #     Start-Sleep -Milliseconds 100
    #     [System.Windows.Forms.SendKeys]::SendWait("chrome://settings/content/all?searchSubpage=gitlab.com{ENTER}")
    # }
    # Remove-Coockies # chamando funcao

    # Abrir pagina do Gitlab 
    [System.Windows.Forms.SendKeys]::SendWait("^l")
    Start-Sleep -Milliseconds 100
    [System.Windows.Forms.SendKeys]::SendWait("https://gitlab.com{ENTER}")
    Start-Sleep -Seconds 8

    # Aceitar coockies
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{ENTER}")

    # Abrir pagina de login
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 10}{ENTER}")
    Start-Sleep -Seconds 7

    # Preencher campo de e-mail
    [System.Windows.Forms.SendKeys]::SendWait("yambertamini.sol@gmail.com{TAB}")

    # Prencher Senha
    Pause # preencha manualmente

    # Fechar navegador
    Stop-Process -Name chrome
}
Connect-Gitlab

# Log status
Write-Host -ForegroundColor Yellow "(1/1) Logado com sucesso em Gitlab"