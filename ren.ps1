$id = 0;
$add=""
$meta = $true;
$list = get-childitem | where-object {$_.name -match "\d{8}.jpg$"}
$list | ForEach-Object {
    $path = $_.FullName
    if ($_.length -lt (10*1024*1024)){
        if ($meta -eq $false){
        Rename-Item -Path $path -NewName $_".jpg"}
#        echo "Rename-Item -Path $path -NewName $_.jpg"}
        if ($meta -eq $true){
#        echo "get-filemetadata "$path
        $dat = get-filemetadata $path
        $datstr = $dat."Készítés dátuma"
        $datstr=$datstr.replace("‎","").replace("‏","").replace(" ","_").replace(":","_")
        $newname = "Mexico_$datstr"
        echo "Test: $($path.Substring(0,10))$newname$add.jpg"
        
        while (Test-Path "$($path.Substring(0,10))$newname$add.jpg"){
        $id=$id+1
        $add=("_"+$id.ToString())
        echo "Test: $($path.Substring(0,10))$newname$add.jpg"}
        
        if ($id -eq 0) {echo "OK"}
        
        Rename-Item -Path $path -NewName "$newname$add.jpg"
        echo "Rename-Item -Path $path -NewName $newname$add.jpg"
        $id=0
        $add=""}
    }
    else
    {
        if ($meta -eq $false){
        $newname = "Mexico_2018.02.11-02.21_"+$id.ToString()+".avi"
        Rename-Item -Path $path -NewName $newname
#        echo "Rename-Item -Path $path -NewName $newname"
        $id = $id +1
        }
    }
}