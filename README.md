# Search in Large Files Script

This PowerShell script searches for a specified keyword or pattern in a given file and saves the matching lines to an output file.

## Features

- Search for a keyword or pattern in a specified text file.
- Specify the number of results to return.
- Append results to a designated output file.

## Prerequisites

- PowerShell installed on your system.

## Usage

To run the script, use the following syntax:

```powershell
.\script.ps1 -File 'file.txt' -Search 'search keyword' [-OutputFile 'results.txt'] [-ResultCount 10]
```

### Parameters

- `-File`: The path to the input file to search through. **(Required)**
- `-Search`: The keyword or pattern to search for in the file. **(Required)**
- `-OutputFile`: The output file where results will be saved. Defaults to `results.txt`. **(Optional)**
- `-ResultCount`: The maximum number of results to return. Defaults to 10. **(Optional)**

### Example

```powershell
.\script.ps1 -File 'example.txt' -Search 'keyword' -OutputFile 'results.txt' -ResultCount 5
```

## Error Handling

The script includes error handling for the following scenarios:

- Missing required parameters: The script will prompt the user to provide all necessary parameters.
- Non-existent input file: The script will notify the user if the specified input file is not found.

## Output

The script will append matching lines to the specified output file. If the maximum result count is reached, a message will be displayed indicating the number of matches saved.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Feel free to modify any section to better fit your project's specifics or add additional information as needed!
