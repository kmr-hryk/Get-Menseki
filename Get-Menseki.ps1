#初期設定
#大字のカラム番号
$o = 1

#区画名称のカラム番号
$k = 2

#座標面積のカラム番号
$z= 6

#=====================================
#これ以降は変更しない

$Filename = $ARGS[0]
$Filename = $(Get-ChildItem $Filename).FullName
$rec = @()
$rec += "町・大字,地番,地積,丁目・字"

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