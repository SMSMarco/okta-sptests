# start docker container -> ./docker-run.ps1

$thispath = Get-Location

Set-Location $thispath

Write-Host $thispath

Write-Host " "

docker container run --rm `
-p 8801:80 `
--volume "${PWD}:/app" `
--name test-sp `
test-sp

Write-Host " "
docker ps -a
Write-Host " "

# start-process http://localhost:4000
# start-process http://localhost