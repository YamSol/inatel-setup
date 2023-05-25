# Executar script e apresentar resultado
function Invoke-Script {
    param (
        [Parameter(Mandatory = $true)]
        [ValidateScript({ Test-Path $_ -PathType Leaf })]
        [string]$ScriptPath
    )

    Write-Host "Executando script: $ScriptPath"
    try {
        & $ScriptPath
        Write-Host -ForegroundColor Green "($contador/$total) Script '$ScriptPath': executado com sucesso!"
    }
    catch {
        $errorMessage = $_.Exception.Message
        Write-Host -ForegroundColor Red "($contador/$total) Script '$ScriptPath': erro ao executar script:"
        Write-Host -ForegroundColor Red "$errorMessage"
    }
}


# Obter lista de scripts
function Get-Scripts {
    $scripts = Get-ChildItem -Path ".\scripts" | Select-Object -ExpandProperty name
    for ($i = 0; $i -lt $scripts.Count; $i++) {
        $scripts[$i] = ".\scripts\" + $scripts[$i]
    }
    return $scripts
}
$scripts = Get-Scripts

# Selecionar Scripts
function Get-SelectedScripts {

    for ($i = 0; $i -lt $scripts.Count; $i++) {
        Write-Host "[$($i+1)] - $($scripts[$i])"
    }
    Write-Host "[Enter] - Todos (recomendado)"
    Write-Host "------------------------------"
    $posicoes = Read-Host "Quais Scripts deseja rodar (Ex: 1 2 3)"
    if ([string]::IsNullOrEmpty($posicoes)) {
        $selecionados = $scripts
    }
    else {
        $posicoes = $posicoes.Split(' ') | ForEach-Object { [int]$_ }
        $selecionados = New-Object Collections.Generic.List[String]
        foreach ($posicao in $posicoes) {
            $selecionados.Add($scripts[$posicao - 1])
        }
    }
    return $selecionados
}
$selecionados = Get-SelectedScripts

# Executar Scripts
$contador = 0
$total = $selecionados.Length
function Invoke-Scripts {

    
    
    Executa cada script da lista
    foreach ($selecionado in $selecionados) {
        $contador++
        Invoke-Script -ScriptPath $selecionado
        Pause
    }
}
Invoke-Scripts

# Log status
Write-Host -ForegroundColor Green -BackgroundColor White "------------- PROGRAMA EXECUTADO COM SUCESSO -------------"