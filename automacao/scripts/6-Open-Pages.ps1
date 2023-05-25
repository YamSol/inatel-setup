# Abrir paginas
function Open-Pages {
    if (Test-Path "~/Desktop/code-troopers") {
        Start-Process "chrome.exe" -ArgumentList "https://docs.google.com/spreadsheets/d/1k-TV2paltaIIn9QwuFvgbYSzRWcfIfH47WaXlr3lrCU/edit --guest" 
        Start-Sleep 2
    } 

    if (Test-Path "~/Desktop/algoritmos-1") {
        Start-Process "chrome.exe" -ArgumentList "https://graduacao.inatel.br/login/index.php --guest"
        Start-Sleep 2

        # Importando Windows.Forms
        Add-Type -AssemblyName 'System.Windows.Forms'

        # Selecionar campo de e-mail
        [System.Windows.Forms.SendKeys]::SendWait("{TAB 2}")

        # Preencher email
        [System.Windows.Forms.SendKeys]::SendWait("yam.s@ges.inatel.br{TAB}")
    }
}
Open-Pages

# Log status
Write-Host -ForegroundColor Yellow "(1/1) Paginas Abertas"