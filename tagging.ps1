$rgName = Get-AzResourceGroup -Name psgsan-ga-rg
$resources = Get-AzResource -ResourceGroupName psgsan-ga-rg
foreach($resource in $resources){
     $resourceName = $resource.Name 
     if($resourceName -contains '*Failure*') {
        continue;
     }
     $tags = $resource.Tags
     $Description = Read-Host -Prompt "Description for $resourceName"
     $Purpose = Read-Host -Prompt "Purpose for $resourceName"
     $BusinessUnit = Read-Host -Prompt "BusinessUnit (e.g Wealth) for $resourceName"
     $Application = Read-Host -Prompt "Application Type (e.g Jira) for $resourceName"
     $AppComponent = Read-Host -Prompt "Appication Component (e.g Web/Db) for $resourceName"
     $BusinessCriticality = Read-Host -Prompt "BusinessCriticality for $resourceName"
     $DefaultAvailability = Read-Host -Prompt "DefaultCriticality for $resourceName"
     $Environment = Read-Host -Prompt "Environment for $resourceName"
     $BusinessOwner = Read-Host -Prompt "Business Owner for $resourceName"
     $TechnicalOwner = Read-Host -Prompt "Technical Owner for $resourceName"
     $CostCenter = Read-Host -Prompt "Cost Center for $resourceName"
     $ResourceType = $resource.ResourceType;

     $tags += @{Description=$Description }
     $tags += @{Name=$resourceName }
     $tags += @{Purpose=$Purpose }
     $tags += @{BusinessUnit=$BusinessUnit }
     $tags += @{Application=$Application }
     $tags += @{AppComponent=$AppComponent }
     $tags += @{BusinessCriticality=$BusinessCriticality }
     $tags += @{DefaultAvailability=$DefaultAvailability }
     $tags += @{Environment=$Environment }
     $tags += @{BusinessOwner=$BusinessOwner }
     $tags += @{TechnicalOwner=$TechnicalOwner }
     $tags += @{CostCenter=$CostCenter }
     $tags += @{ResourceType=$ResourceType}

     Set-AzResource -ResourceId $resource.Id -Tag $tags
}