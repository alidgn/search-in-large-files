param (
    [string]$File, # The path to the input file to search through
    [string]$Search, # The keyword or pattern to search for in the file
    [string]$OutputFile = 'results.txt', # The output file where results will be saved (default is 'results.txt')
    [int]$ResultCount = 10  # Maximum number of results to return (default is 10)
)

# Check if both File and Search parameters are provided
if (-not $File -or -not $Search) {
    Write-Host "Error: Please specify all parameters correctly." -ForegroundColor Red
    $scriptName = $MyInvocation.MyCommand.Name  # Get the name of the current script
    Write-Host "Example: $scriptName -File 'file.txt' -Search 'search keyword' -OutputFile (optional) 'results.txt' -ResultCount (optional) 1000" -ForegroundColor Yellow
    return  # Exit the script if parameters are missing
}

# Check if the specified input file exists
if (-not (Test-Path $File)) {
    Write-Host "Error: The file '$File' was not found." -ForegroundColor Red
    return  # Exit if the file does not exist
}

$pattern = $Search  # Store the search pattern in a variable
$found = 0  # Initialize a counter for found results

# Read the content of the file line by line
Get-Content $File | ForEach-Object {
    # Check if the current line matches the search pattern
    if ($_ -match $pattern) {
        $_ | Out-File -FilePath $OutputFile -Append  # Append the matching line to the output file

        # Increment the found results counter
        if (++$found -eq $ResultCount) {
            # Write-Host "$found matches have been saved to '$OutputFile'." -ForegroundColor Green
            break; # Exit the loop if the result count limit is reached
        }
    }
}

Write-Host "$found matches have been saved to '$OutputFile'." -ForegroundColor Green