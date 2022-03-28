<#
 .SYNOPSIS
     .     
 .EXAMPLE
     PS .\UpdateVariableGroupVariables.ps1 -organization "allscriptshealthcare" -excelfile "C:\Users\R807600\rohan\allscripts\powershell_scripts\metaexcel.csv" -project "transaction-systems" -AzureDevOpsPAT "blgvexdinyylbzdbihrhfztgerxa2dwzjgz7jsy5qx24fypaqdja" -varvalue 'true' -group_id 3
     Creates the metajson file
 #>

[CmdletBinding()]
Param(
    [Parameter(Mandatory = $True)]
    [string]$organization,
    [Parameter(Mandatory = $True)]
    [string]$excelfile,
    [Parameter(Mandatory = $True)]
    [string]$project,
    [Parameter(Mandatory = $True)]
    [string]$varvalue,
    [Parameter(Mandatory = $True)]
    [string]$group_id             
)
$ErrorActionPreference = "Stop"  
 $Token = $env:GithubToken_ENV_VAR
    $stores = Import-csv $excelfile

    foreach($data in $stores)
    {
        $varname = $data.Build_Name
        az pipelines variable-group variable update --group-id $group_id --name $varname --value "$varvalue" --org https://dev.azure.com/$organization --project $project

    }
