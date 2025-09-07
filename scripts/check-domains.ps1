param(
  [string[]]$Names = @('kurnox','kurnova','kurniq','noolix','chillio','chilora','chilux','chillix','dustra','dustora','dustiq','dustyx','duston','docore','doctra','doctro','doctix','docura','docnix','dociq'),
  [string[]]$Tlds = @('com','io','dev','tech','ai')
)

$ErrorActionPreference = 'SilentlyContinue'

# Normalize comma-separated inputs passed as a single argument
if ($Names.Count -eq 1 -and $Names[0] -is [string] -and $Names[0].Contains(',')) {
  $Names = $Names[0].Split(',') | ForEach-Object { $_.Trim() } | Where-Object { $_ }
}
if ($Tlds.Count -eq 1 -and $Tlds[0] -is [string] -and $Tlds[0].Contains(',')) {
  $Tlds = $Tlds[0].Split(',') | ForEach-Object { $_.Trim() } | Where-Object { $_ }
}

function Test-DomainExists {
  param([string]$Domain)
  $server = '1.1.1.1'
  $types = @('NS','SOA','A','AAAA','CNAME','TXT')
  foreach ($t in $types) {
    try {
      $res = Resolve-DnsName -Name $Domain -Type $t -Server $server -ErrorAction Stop
      if ($res) { return $true }
    } catch {
      # ignore and try next type
    }
  }
  # Fallback to nslookup string parsing
  $out = nslookup $Domain $server 2>$null | Out-String
  if ($out -match 'Address:' -or $out -match 'origin =' -or $out -match 'nameserver') { return $true }
  return $false
}

$results = foreach($n in $Names){
  foreach($t in $Tlds){
    $domain = "$n.$t"
    [pscustomobject]@{
      Domain = $domain
      Exists = (Test-DomainExists -Domain $domain)
    }
  }
}

$results | Sort-Object Domain | Format-Table -AutoSize
