$list = Get-ChildItem -Path F:\Mexico
$list | ForEach-Object{
if ($_.Name -match "^IMG")
{
    $newname = $_.NAme.Replace("IMG","Mexico").Insert(11,".").Insert(14,".").Insert(17,".").Insert(21,"_").Insert(24,"_")
    Rename-Item -Path $_.FullName -Newname $newname
    echo "Rename-Item -Path $($_.FullName) -Newname $newname"
}
if ($_.Name -match "^Mexico_\d{4}.\d{2}.\d{2}._\d_")
{
    $newname = $_.Name.Insert(19,"0")
    Rename-Item -Path $_.FullName -Newname $newname
    echo "Rename-Item -Path $($_.FullName) -Newname $newname"
}
}