$rg = Get-AzResourceGroup -Name psgsan-ga-rg
$tags = $rg.Tags;

$Name = $rg.ResourceGroupName;
$Description = Read-Host -Prompt "Description for $Name"
$Purpose = Read-Host -Prompt "Purpose for $Name"
$BusinessUnit = Read-Host "Business Unit for $Name (e.g Wealth)"
$Environment = Read-Host "Environment for $Name (e.g development/production)"
$CostCenter = Read-Host "Cost Center for $Name"


$tags += @{Name = $Name }
$tags += @{Description = $Description }
$tags += @{Purpose = $Purpose }
$tags += @{BusinessUnit = $BusinessUnit }
$tags += @{Environment = $Environment }
$tags += @{CostCenter = $CostCenter }

Set-AzResourceGroup -Name psgsan-ga-rg -Tag $tags
