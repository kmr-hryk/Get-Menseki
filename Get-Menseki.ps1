#�����ݒ�
#�厚�̃J�����ԍ�
$o = 1

#��於�̂̃J�����ԍ�
$k = 2

#���W�ʐς̃J�����ԍ�
$z= 6

#=====================================
#����ȍ~�͕ύX���Ȃ�

$Filename = $ARGS[0]
$Filename = $(Get-ChildItem $Filename).FullName
$rec = @()
$rec += "���E�厚,�n��,�n��,���ځE��"

Get-Content $Filename | ForEach-Object {
   $tmp = -Split $_
   if ( $tmp[$z].Length -ne 0 ) {
   $address = $tmp[$o]
   $chiban = $tmp[$k]
   $menseki = $tmp[$z].SubString(0,$tmp[$z].IndexOf(".") + 3) + ","
   $tmp = $address,$chiban,$menseki
   $rec += $tmp -join ","
   }
}

Write-Output $rec | Out-File $Filename".arrange.csv" -Encoding default