# function to get full size of a dir:

# function:
function get-size($dir)
{

    $summary = Get-ChildItem $dir -Recurse | Measure-Object -Property Length -Sum
    return [math]::round(($summary).Sum /1GB, 5)

}

# call the function:
get-size -dir D:\Jobs\ICRC\VDI
