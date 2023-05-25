# Clonar repositório
function Copy-Repository {
    # Ler opção do usuário
    $defaultRepositoryLink = "https://gitlab.com/inatel1/p1/code-troopers.git"
    $defaultRepositoryName = "code-troopers"

    $option = Read-Host "Selecione uma opcao para o link do repositorio Git:
    [1] https://gitlab.com/inatel1/p1/code-troopers.git (padrão)
    [2] https://gitlab.com/inatel1/p1/algoritmos-1/algoritmos-1.git
    [3] Outro (Digite o link manualmente)
Opção"
    switch ($option) {
        1 {
            $repositoryLink = "https://gitlab.com/inatel1/p1/code-troopers.git"
            $repositoryName = "code-troopers"
            break
        }
        2 {
            $repositoryLink = "https://gitlab.com/inatel1/p1/algoritmos-1/algoritmos-1.git"
            $repositoryName = "algoritmos-1"
            break
        }
        3 {
            $repositoryLink = Read-Host "Digite o LINK do repositório Git ($defaultRepositoryLink):"
            $repositoryName = Read-Host "Digite o NOME do repositório Git ($defaultRepositoryName):"
            break
        }
        default {
            if ([string]::IsNullOrEmpty($repositoryLink)) {
                $repositoryLink = $defaultRepositoryLink
                $repositoryName = $defaultRepositoryName
            }
            else {
                Write-Error "Opção inválida."
            }
        }
    }
    # Clonar repositório
    Start-Process git -ArgumentList "clone $repositoryLink $env:USERPROFILE\Desktop\$repositoryName" -Wait

    # Abrir pasta do repositório
    Start-Process code -ArgumentList "$env:USERPROFILE\Desktop\$repositoryName"
}
Copy-Repository

# Log status
Write-Host -ForegroundColor Yellow "(1/2) Repositorio Clonado"

# Configurar usuario
function Set-User {
    Set-Location "$env:USERPROFILE\Desktop\$repositoryName"
    Start-Process git -ArgumentList "config user.name 'Yam Sol Bertamini'" -Wait
    Start-Process git -ArgumentList "config user.email 'yambertamini.sol@gmail.com'" -Wait
}
Set-User

Write-Host -ForegroundColor Yellow "(2/2) Git Configurado"
  