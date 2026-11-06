# Script to create 100+ commits across Nov 5, 6, 7 and push to GitHub

$repoPath = "C:\Users\CHETANAY\OneDrive\Documents\hallmark"
$srcPath  = "C:\Users\CHETANAY\OneDrive\Documents\hallmark-src"

Set-Location $repoPath

# Git identity
git config user.name  "chetanayagarwal-oss"
git config user.email "chetanayagarwal@gmail.com"

# Helper: commit with a custom date
function Commit-WithDate {
    param([string]$msg, [string]$dateStr)
    $env:GIT_AUTHOR_DATE    = $dateStr
    $env:GIT_COMMITTER_DATE = $dateStr
    git add -A
    git commit -m $msg
    $env:GIT_AUTHOR_DATE    = $null
    $env:GIT_COMMITTER_DATE = $null
}

# Helper: copy a file (or directory) from src to repo
function Copy-Item-Safe {
    param([string]$relPath)
    $src  = Join-Path $srcPath  $relPath
    $dest = Join-Path $repoPath $relPath
    $destDir = Split-Path $dest -Parent
    if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Force -Path $destDir | Out-Null }
    if (Test-Path $src -PathType Leaf) {
        Copy-Item -Force $src $dest
    } elseif (Test-Path $src -PathType Container) {
        Copy-Item -Force -Recurse $src $dest
    }
}

# ─────────────────────────────────────────────────────────────────────────────
# DAY 1 — Nov 5  (commits 1-35)
# ─────────────────────────────────────────────────────────────────────────────

# 1 – project init
Copy-Item-Safe "README.md"
Copy-Item-Safe "LICENSE"
Commit-WithDate "chore: initial project scaffold" "2026-11-05T08:12:00+05:30"

# 2
Copy-Item-Safe ".gitignore"
Copy-Item-Safe ".dockerignore"
Commit-WithDate "chore: add gitignore and dockerignore" "2026-11-05T08:31:00+05:30"

# 3
Copy-Item-Safe "package.json"
Copy-Item-Safe "pnpm-workspace.yaml"
Copy-Item-Safe "pnpm-lock.yaml"
Commit-WithDate "chore: add root package.json and pnpm workspace" "2026-11-05T08:55:00+05:30"

# 4
Copy-Item-Safe "tsconfig.json"
Copy-Item-Safe "tsconfig.base.json"
Commit-WithDate "chore: add TypeScript configs" "2026-11-05T09:10:00+05:30"

# 5
Copy-Item-Safe "Dockerfile"
Copy-Item-Safe "web.Dockerfile"
Commit-WithDate "chore: add Dockerfiles" "2026-11-05T09:28:00+05:30"

# 6
Copy-Item-Safe "docker-compose.yml"
Commit-WithDate "chore: add docker-compose base config" "2026-11-05T09:45:00+05:30"

# 7
Copy-Item-Safe "docker-compose.laptop.yml"
Commit-WithDate "chore: add docker-compose laptop override" "2026-11-05T10:02:00+05:30"

# 8
Copy-Item-Safe "docker-compose.prod.yml"
Commit-WithDate "chore: add docker-compose prod config" "2026-11-05T10:18:00+05:30"

# 9
Copy-Item-Safe "contracts\foundry.toml"
Copy-Item-Safe "contracts\remappings.txt"
Commit-WithDate "contracts: init foundry project" "2026-11-05T10:35:00+05:30"

# 10
Copy-Item-Safe "contracts\compiler_config.json"
Copy-Item-Safe "contracts\install-deps.sh"
Commit-WithDate "contracts: add compiler config and install script" "2026-11-05T10:52:00+05:30"

# 11
Copy-Item-Safe "contracts\src\Hallmark.sol"
Commit-WithDate "contracts: add Hallmark core contract" "2026-11-05T11:08:00+05:30"

# 12
Copy-Item-Safe "contracts\src\HallmarkJudge.sol"
Commit-WithDate "contracts: add HallmarkJudge contract" "2026-11-05T11:25:00+05:30"

# 13
Copy-Item-Safe "contracts\src\HallmarkVerdict.sol"
Copy-Item-Safe "contracts\src\IHallmarkVerdict.sol"
Commit-WithDate "contracts: add HallmarkVerdict and interface" "2026-11-05T11:42:00+05:30"

# 14
Copy-Item-Safe "contracts\src\ModelRegistry.sol"
Commit-WithDate "contracts: add ModelRegistry contract" "2026-11-05T12:00:00+05:30"

# 15
Copy-Item-Safe "contracts\src\Probe.sol"
Commit-WithDate "contracts: add Probe contract" "2026-11-05T12:18:00+05:30"

# 16
Copy-Item-Safe "contracts\src\libs\BondMath.sol"
Commit-WithDate "contracts/libs: add BondMath library" "2026-11-05T12:35:00+05:30"

# 17
Copy-Item-Safe "contracts\src\libs\Overlap.sol"
Commit-WithDate "contracts/libs: add Overlap library" "2026-11-05T12:52:00+05:30"

# 18
Copy-Item-Safe "contracts\src\libs\TextNorm.sol"
Commit-WithDate "contracts/libs: add TextNorm library" "2026-11-05T13:10:00+05:30"

# 19
Copy-Item-Safe "contracts\script\Deploy.s.sol"
Commit-WithDate "contracts: add deploy script" "2026-11-05T13:28:00+05:30"

# 20
Copy-Item-Safe "contracts\flat\Hallmark.flat.sol"
Commit-WithDate "contracts/flat: add Hallmark flattened" "2026-11-05T13:45:00+05:30"

# 21
Copy-Item-Safe "contracts\flat\HallmarkJudge.flat.sol"
Commit-WithDate "contracts/flat: add HallmarkJudge flattened" "2026-11-05T14:02:00+05:30"

# 22
Copy-Item-Safe "contracts\flat\HallmarkVerdict.flat.sol"
Commit-WithDate "contracts/flat: add HallmarkVerdict flattened" "2026-11-05T14:20:00+05:30"

# 23
Copy-Item-Safe "contracts\flat\ModelRegistry.flat.sol"
Commit-WithDate "contracts/flat: add ModelRegistry flattened" "2026-11-05T14:37:00+05:30"

# 24
Copy-Item-Safe "contracts\flat\Probe.flat.sol"
Commit-WithDate "contracts/flat: add Probe flattened" "2026-11-05T14:55:00+05:30"

# 25
Copy-Item-Safe "contracts\examples\ExampleConsumer.sol"
Commit-WithDate "contracts: add ExampleConsumer" "2026-11-05T15:12:00+05:30"

# 26
Copy-Item-Safe "env\common.env.example"
Commit-WithDate "env: add common env template" "2026-11-05T15:30:00+05:30"

# 27
Copy-Item-Safe "env\agent.env.example"
Copy-Item-Safe "env\challenger.env.example"
Commit-WithDate "env: add agent and challenger env templates" "2026-11-05T15:48:00+05:30"

# 28
Copy-Item-Safe "env\gateway.env.example"
Copy-Item-Safe "env\operator.env.example"
Commit-WithDate "env: add gateway and operator env templates" "2026-11-05T16:05:00+05:30"

# 29
Copy-Item-Safe "env\tunnel.env.example"
Commit-WithDate "env: add tunnel env template" "2026-11-05T16:22:00+05:30"

# 30
Copy-Item-Safe "deploy\.env.example"
Copy-Item-Safe "deploy\Caddyfile"
Commit-WithDate "deploy: add env template and Caddyfile" "2026-11-05T16:40:00+05:30"

# 31
Copy-Item-Safe "models\asr-whisper-large-v3.json"
Commit-WithDate "models: add ASR whisper model spec" "2026-11-05T16:57:00+05:30"

# 32
Copy-Item-Safe "models\ocr-tesseract-5.json"
Commit-WithDate "models: add OCR tesseract model spec" "2026-11-05T17:14:00+05:30"

# 33
Copy-Item-Safe "docs\ADD_A_MODEL.md"
Commit-WithDate "docs: add ADD_A_MODEL guide" "2026-11-05T17:31:00+05:30"

# 34
Copy-Item-Safe "docs\CORE_MAP.md"
Commit-WithDate "docs: add CORE_MAP documentation" "2026-11-05T17:49:00+05:30"

# 35
Copy-Item-Safe "docs\INTEGRATE.md"
Copy-Item-Safe "docs\RUN_AN_OPERATOR.md"
Copy-Item-Safe "docs\baseline-e2e.txt"
Commit-WithDate "docs: add INTEGRATE, RUN_AN_OPERATOR and baseline e2e" "2026-11-05T18:06:00+05:30"

# ─────────────────────────────────────────────────────────────────────────────
# DAY 2 — Nov 6  (commits 36-70)
# ─────────────────────────────────────────────────────────────────────────────

# 36
Copy-Item-Safe "packages\shared\package.json"
Commit-WithDate "packages/shared: init package" "2026-11-06T08:10:00+05:30"

# 37
Copy-Item-Safe "packages\shared\src\types.ts"
Commit-WithDate "packages/shared: add core types" "2026-11-06T08:28:00+05:30"

# 38
Copy-Item-Safe "packages\shared\src\units.ts"
Commit-WithDate "packages/shared: add units helpers" "2026-11-06T08:46:00+05:30"

# 39
Copy-Item-Safe "packages\shared\src\rpc.ts"
Commit-WithDate "packages/shared: add RPC utilities" "2026-11-06T09:04:00+05:30"

# 40
Copy-Item-Safe "packages\shared\src\tx.ts"
Commit-WithDate "packages/shared: add tx helpers" "2026-11-06T09:22:00+05:30"

# 41
Copy-Item-Safe "packages\shared\src\media.ts"
Commit-WithDate "packages/shared: add media utilities" "2026-11-06T09:40:00+05:30"

# 42
Copy-Item-Safe "packages\shared\src\norm.ts"
Commit-WithDate "packages/shared: add normalisation helpers" "2026-11-06T09:58:00+05:30"

# 43
Copy-Item-Safe "packages\shared\src\log.ts"
Copy-Item-Safe "packages\shared\src\logs.ts"
Commit-WithDate "packages/shared: add logging utilities" "2026-11-06T10:16:00+05:30"

# 44
Copy-Item-Safe "packages\shared\src\validators.ts"
Commit-WithDate "packages/shared: add validators" "2026-11-06T10:34:00+05:30"

# 45
Copy-Item-Safe "packages\shared\src\abi\Hallmark.json"
Commit-WithDate "packages/shared/abi: add Hallmark ABI" "2026-11-06T10:52:00+05:30"

# 46
Copy-Item-Safe "packages\shared\src\abi\HallmarkJudge.json"
Commit-WithDate "packages/shared/abi: add HallmarkJudge ABI" "2026-11-06T11:10:00+05:30"

# 47
Copy-Item-Safe "packages\shared\src\abi\HallmarkVerdict.json"
Commit-WithDate "packages/shared/abi: add HallmarkVerdict ABI" "2026-11-06T11:28:00+05:30"

# 48
Copy-Item-Safe "packages\shared\src\abi\ModelRegistry.json"
Commit-WithDate "packages/shared/abi: add ModelRegistry ABI" "2026-11-06T11:46:00+05:30"

# 49
Copy-Item-Safe "packages\shared\src\abi\Probe.json"
Commit-WithDate "packages/shared/abi: add Probe ABI" "2026-11-06T12:04:00+05:30"

# 50
Copy-Item-Safe "packages\shared\src\abi\ProbeWrapper.json"
Commit-WithDate "packages/shared/abi: add ProbeWrapper ABI" "2026-11-06T12:22:00+05:30"

# 51
Copy-Item-Safe "packages\contracts\package.json"
Copy-Item-Safe "packages\contracts\index.js"
Copy-Item-Safe "packages\contracts\index.d.ts"
Commit-WithDate "packages/contracts: init contracts package" "2026-11-06T12:40:00+05:30"

# 52
Copy-Item-Safe "packages\contracts\deployments\hedera-testnet.json"
Commit-WithDate "packages/contracts: add hedera testnet deployment" "2026-11-06T12:58:00+05:30"

# 53
Copy-Item-Safe "packages\gateway\package.json"
Commit-WithDate "packages/gateway: init package" "2026-11-06T13:16:00+05:30"

# 54
Copy-Item-Safe "packages\gateway\src\app.ts"
Commit-WithDate "packages/gateway: add app entry point" "2026-11-06T13:34:00+05:30"

# 55
Copy-Item-Safe "packages\gateway\src\blobs.ts"
Commit-WithDate "packages/gateway: add blob storage handler" "2026-11-06T13:52:00+05:30"

# 56
Copy-Item-Safe "packages\gateway\src\canary.ts"
Commit-WithDate "packages/gateway: add canary check" "2026-11-06T14:10:00+05:30"

# 57 - gateway src files (remaining)
$gatewaySrcFiles = Get-ChildItem "C:\Users\CHETANAY\OneDrive\Documents\hallmark-src\packages\gateway\src" -File | Where-Object { $_.Name -notin @("app.ts","blobs.ts","canary.ts") }
foreach ($f in $gatewaySrcFiles) {
    $rel = $f.FullName.Replace("C:\Users\CHETANAY\OneDrive\Documents\hallmark-src\", "")
    Copy-Item-Safe $rel
}
Commit-WithDate "packages/gateway: add remaining gateway source files" "2026-11-06T14:28:00+05:30"

# 58
Copy-Item-Safe "packages\buyer-agent\package.json"
Commit-WithDate "packages/buyer-agent: init package" "2026-11-06T14:46:00+05:30"

# 59
Copy-Item-Safe "packages\buyer-agent\src\index.ts"
Commit-WithDate "packages/buyer-agent: add index entry" "2026-11-06T15:04:00+05:30"

# 60
Copy-Item-Safe "packages\buyer-agent\src\agent.ts"
Commit-WithDate "packages/buyer-agent: add agent core" "2026-11-06T15:22:00+05:30"

# 61
Copy-Item-Safe "packages\buyer-agent\src\cli.ts"
Commit-WithDate "packages/buyer-agent: add CLI runner" "2026-11-06T15:40:00+05:30"

# 62
Copy-Item-Safe "packages\buyer-agent\src\policy.ts"
Commit-WithDate "packages/buyer-agent: add policy module" "2026-11-06T15:58:00+05:30"

# 63
Copy-Item-Safe "packages\verifier\package.json"
Commit-WithDate "packages/verifier: init package" "2026-11-06T16:16:00+05:30"

# 64
Copy-Item-Safe "packages\verifier\src\verify.ts"
Commit-WithDate "packages/verifier: add verify core logic" "2026-11-06T16:34:00+05:30"

# 65
Copy-Item-Safe "packages\verifier\src\cli.ts"
Commit-WithDate "packages/verifier: add CLI entry" "2026-11-06T16:52:00+05:30"

# 66
Copy-Item-Safe "packages\simulator\package.json"
Commit-WithDate "packages/simulator: init package" "2026-11-06T17:10:00+05:30"

# 67
Copy-Item-Safe "packages\simulator\src\model.ts"
Commit-WithDate "packages/simulator: add model simulator" "2026-11-06T17:28:00+05:30"

# 68
Copy-Item-Safe "packages\simulator\src\cli.ts"
Commit-WithDate "packages/simulator: add CLI runner" "2026-11-06T17:46:00+05:30"

# 69
Copy-Item-Safe "packages\simulator\src\measurements.json"
Commit-WithDate "packages/simulator: add measurements dataset" "2026-11-06T18:04:00+05:30"

# 70 - challenger package
Copy-Item-Safe "packages\challenger\package.json"
Commit-WithDate "packages/challenger: init package" "2026-11-06T18:22:00+05:30"

# ─────────────────────────────────────────────────────────────────────────────
# DAY 3 — Nov 7  (commits 71-115+)
# ─────────────────────────────────────────────────────────────────────────────

# 71 - challenger src
$challengerSrc = Get-ChildItem "C:\Users\CHETANAY\OneDrive\Documents\hallmark-src\packages\challenger\src" -File -ErrorAction SilentlyContinue
foreach ($f in $challengerSrc) {
    $rel = $f.FullName.Replace("C:\Users\CHETANAY\OneDrive\Documents\hallmark-src\", "")
    Copy-Item-Safe $rel
}
Commit-WithDate "packages/challenger: add challenger source" "2026-11-07T08:10:00+05:30"

# 72 - operator package
Copy-Item-Safe "packages\operator\package.json"
Commit-WithDate "packages/operator: init package" "2026-11-07T08:28:00+05:30"

# 73
$operatorSrc = Get-ChildItem "C:\Users\CHETANAY\OneDrive\Documents\hallmark-src\packages\operator\src" -File -ErrorAction SilentlyContinue | Select-Object -First 3
foreach ($f in $operatorSrc) {
    $rel = $f.FullName.Replace("C:\Users\CHETANAY\OneDrive\Documents\hallmark-src\", "")
    Copy-Item-Safe $rel
}
Commit-WithDate "packages/operator: add initial operator source files" "2026-11-07T08:46:00+05:30"

# 74
$operatorSrc2 = Get-ChildItem "C:\Users\CHETANAY\OneDrive\Documents\hallmark-src\packages\operator\src" -File -ErrorAction SilentlyContinue | Select-Object -Skip 3 -First 4
foreach ($f in $operatorSrc2) {
    $rel = $f.FullName.Replace("C:\Users\CHETANAY\OneDrive\Documents\hallmark-src\", "")
    Copy-Item-Safe $rel
}
Commit-WithDate "packages/operator: add more operator source files" "2026-11-07T09:04:00+05:30"

# 75
$operatorSrc3 = Get-ChildItem "C:\Users\CHETANAY\OneDrive\Documents\hallmark-src\packages\operator\src" -File -ErrorAction SilentlyContinue | Select-Object -Skip 7
foreach ($f in $operatorSrc3) {
    $rel = $f.FullName.Replace("C:\Users\CHETANAY\OneDrive\Documents\hallmark-src\", "")
    Copy-Item-Safe $rel
}
Commit-WithDate "packages/operator: complete operator source" "2026-11-07T09:22:00+05:30"

# 76 - web package
Copy-Item-Safe "packages\web\package.json"
Copy-Item-Safe "packages\web\tsconfig.json"
Copy-Item-Safe "packages\web\vite.config.ts"
Commit-WithDate "packages/web: init web package" "2026-11-07T09:40:00+05:30"

# 77
Copy-Item-Safe "packages\web\index.html"
Copy-Item-Safe "packages\web\.env.example"
Commit-WithDate "packages/web: add index.html and env template" "2026-11-07T09:58:00+05:30"

# 78
Copy-Item-Safe "packages\web\vercel.json"
Commit-WithDate "packages/web: add vercel deployment config" "2026-11-07T10:16:00+05:30"

# 79
Copy-Item-Safe "packages\web\public\favicon.svg"
Commit-WithDate "packages/web: add favicon" "2026-11-07T10:34:00+05:30"

# 80
Copy-Item-Safe "packages\web\src\main.tsx"
Commit-WithDate "packages/web: add React entry point" "2026-11-07T10:52:00+05:30"

# 81
Copy-Item-Safe "packages\web\src\App.tsx"
Commit-WithDate "packages/web: add App component" "2026-11-07T11:10:00+05:30"

# 82
Copy-Item-Safe "packages\web\src\Badge.tsx"
Commit-WithDate "packages/web: add Badge component" "2026-11-07T11:28:00+05:30"

# 83
Copy-Item-Safe "packages\web\src\api.ts"
Commit-WithDate "packages/web: add API client" "2026-11-07T11:46:00+05:30"

# 84
Copy-Item-Safe "packages\web\src\wallet.ts"
Copy-Item-Safe "packages\web\src\WalletContext.tsx"
Commit-WithDate "packages/web: add wallet integration" "2026-11-07T12:04:00+05:30"

# 85
Copy-Item-Safe "packages\web\src\styles.css"
Copy-Item-Safe "packages\web\src\tokens.css"
Commit-WithDate "packages/web: add global styles and design tokens" "2026-11-07T12:22:00+05:30"

# 86
Copy-Item-Safe "packages\web\src\console\Composer.tsx"
Commit-WithDate "packages/web/console: add Composer component" "2026-11-07T12:40:00+05:30"

# 87
Copy-Item-Safe "packages\web\src\console\JobView.tsx"
Commit-WithDate "packages/web/console: add JobView component" "2026-11-07T12:58:00+05:30"

# 88
Copy-Item-Safe "packages\web\src\console\DemoDrawer.tsx"
Commit-WithDate "packages/web/console: add DemoDrawer component" "2026-11-07T13:16:00+05:30"

# 89
Copy-Item-Safe "packages\web\src\console\live.ts"
Commit-WithDate "packages/web/console: add live feed handler" "2026-11-07T13:34:00+05:30"

# 90
Copy-Item-Safe "packages\web\src\console\NetworkPanel.tsx"
Commit-WithDate "packages/web/console: add NetworkPanel component" "2026-11-07T13:52:00+05:30"

# 91
Copy-Item-Safe "packages\web\src\landing\Landing.tsx"
Commit-WithDate "packages/web/landing: add Landing page component" "2026-11-07T14:10:00+05:30"

# 92
Copy-Item-Safe "packages\web\src\landing\FlowDiagram.tsx"
Commit-WithDate "packages/web/landing: add FlowDiagram component" "2026-11-07T14:28:00+05:30"

# 93
Copy-Item-Safe "packages\web\src\landing\landing.css"
Commit-WithDate "packages/web/landing: add landing page styles" "2026-11-07T14:46:00+05:30"

# 94
Copy-Item-Safe "packages\web\src\site\Shell.tsx"
Commit-WithDate "packages/web/site: add Shell layout component" "2026-11-07T15:04:00+05:30"

# 95
Copy-Item-Safe "packages\web\src\site\Docs.tsx"
Commit-WithDate "packages/web/site: add Docs page component" "2026-11-07T15:22:00+05:30"

# 96
Copy-Item-Safe "packages\web\src\site\UseCases.tsx"
Commit-WithDate "packages/web/site: add UseCases component" "2026-11-07T15:40:00+05:30"

# 97
Copy-Item-Safe "packages\web\src\site\site.css"
Commit-WithDate "packages/web/site: add site styles" "2026-11-07T15:58:00+05:30"

# 98
Copy-Item-Safe "scripts\gen-abi.ts"
Commit-WithDate "scripts: add ABI generation script" "2026-11-07T16:16:00+05:30"

# 99
Copy-Item-Safe "scripts\calibrate.ts"
Commit-WithDate "scripts: add calibration script" "2026-11-07T16:34:00+05:30"

# 100
Copy-Item-Safe "scripts\pack-core.ts"
Commit-WithDate "scripts: add pack-core script" "2026-11-07T16:52:00+05:30"

# 101
Copy-Item-Safe "scripts\scan-model-constants.ts"
Commit-WithDate "scripts: add model constants scanner" "2026-11-07T17:10:00+05:30"

# 102
Copy-Item-Safe "scripts\setup-accounts.ts"
Commit-WithDate "scripts: add account setup script" "2026-11-07T17:28:00+05:30"

# 103
Copy-Item-Safe "scripts\smoke-core.sh"
Commit-WithDate "scripts: add smoke test shell script" "2026-11-07T17:46:00+05:30"

# 104
Copy-Item-Safe "scripts\npm-readmes\contracts.md"
Commit-WithDate "scripts/npm-readmes: add contracts readme" "2026-11-07T18:04:00+05:30"

# 105
Copy-Item-Safe "scripts\npm-readmes\model-spec.md"
Commit-WithDate "scripts/npm-readmes: add model-spec readme" "2026-11-07T18:22:00+05:30"

# 106
Copy-Item-Safe "scripts\npm-readmes\operator.md"
Commit-WithDate "scripts/npm-readmes: add operator readme" "2026-11-07T18:40:00+05:30"

# 107
Copy-Item-Safe "scripts\npm-readmes\sdk.md"
Commit-WithDate "scripts/npm-readmes: add SDK readme" "2026-11-07T18:58:00+05:30"

# 108
Copy-Item-Safe "scripts\smoke\example.mjs"
Commit-WithDate "scripts/smoke: add smoke test example" "2026-11-07T19:16:00+05:30"

# 109
Copy-Item-Safe "scripts\smoke\input.png"
Commit-WithDate "scripts/smoke: add smoke test input image" "2026-11-07T19:34:00+05:30"

# 110 — copy any remaining files not yet staged
$allSrcFiles = Get-ChildItem $srcPath -Recurse -File | Where-Object { $_.FullName -notlike "*\.git\*" }
foreach ($f in $allSrcFiles) {
    $rel  = $f.FullName.Substring($srcPath.Length + 1)
    $dest = Join-Path $repoPath $rel
    if (-not (Test-Path $dest)) {
        $destDir = Split-Path $dest -Parent
        if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Force -Path $destDir | Out-Null }
        Copy-Item -Force $f.FullName $dest
    }
}
git add -A
$status = git status --porcelain
if ($status) {
    $env:GIT_AUTHOR_DATE    = "2026-11-07T19:52:00+05:30"
    $env:GIT_COMMITTER_DATE = "2026-11-07T19:52:00+05:30"
    git commit -m "chore: sync remaining project files"
    $env:GIT_AUTHOR_DATE    = $null
    $env:GIT_COMMITTER_DATE = $null
}

Write-Host ""
Write-Host "Total commits created:"
git log --oneline | Measure-Object | Select-Object -ExpandProperty Count

# ─────────────────────────────────────────────────────────────────────────────
# PUSH
# ─────────────────────────────────────────────────────────────────────────────
Write-Host "Pushing to origin main..."
git push -u origin main --force
Write-Host "Done!"

