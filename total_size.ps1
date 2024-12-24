# size per file within dir

$dirr = Get-ChildItem

$dirr | Select-Object Name, @{
    Name='Size (MB)';
    Expression={
        if ($_.PSIsContainer) {
            [math]::Round((Get-ChildItem -Path $_.FullName -File -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB, 2)
        } else {
            [math]::Round($_.Length / 1MB, 2)
        }
    }
} | Format-Table -AutoSize
