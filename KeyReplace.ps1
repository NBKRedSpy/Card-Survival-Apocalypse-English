cd "C:\src\CardSurvival\English Translations\Apocalypse\DisasterBeacons" -ErrorAction Stop

$keys = @(
    "DisasterBeasons_Gs_DisasterBeasons_AirToxicity_Statuses[3].GameName",
    "DisasterBeacons_Gs_DiasterBeasons_NutrientAbsorption_Statuses[1].GameName",
    "DisasterBeasons_Gs_GeeseSouth_PresenceCount_GameName",
    "DisasterBeasons_Gs_VolcanicEruption_EventResetCount_GameName",
    "DisasterBeasons_Gs_VolcanicEruption_MagmaCount_GameName",
    "DisasterBeasons_Gs_VolcanicEruption_MagmaFumesCount_GameName",
    "DisasterBeasons_Gs_VolcanicEruption_VolcanicEriptionPresenceCount_GameName",
    "DisasterBeasons_Lq_Snow_CardInteractions[0].ActionName",
    "DisasterBeasons_Nc_GeeseSouth_Bird_MissileBird_CustomDestroyMessage",
    "DisasterBeasons_Nc_GeeseSouth_Bird_MissileBird_DismantleActions[7].ActionName",
    "DisasterBeasons_Nc_Hail_HailStone_CardInteractions[0].ActionName",
    "DisasterBeasons_Nc_Hail_HailStone_TypeFour_CardInteractions[0].ActionName",
    "DisasterBeasons_Nc_Hail_HailStone_TypeThree_CardInteractions[0].ActionName",
    "DisasterBeasons_Nc_Hail_HailStone_TypeTwo_CardInteractions[0].ActionName",
    "DisasterBeasons_Nc_Hail_SnowBank_TypeFour_CardInteractions[0].ActionName",
    "DisasterBeasons_Nc_Hail_SnowBank_TypeOne_CardInteractions[0].ActionName",
    "DisasterBeasons_Nc_Hail_SnowBank_TypeThree_CardInteractions[0].ActionName",
    "DisasterBeasons_Nc_Hail_SnowBank_TypeTwo_CardInteractions[0].ActionName",
    "DisasterBeasons_Nc_HiddenReamins_Altar_CardInteractions[1].ActionName",
    "DisasterBeasons_Nc_HiddenReamins_CampFire_CardInteractions[2].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[0].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[1].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[10].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[10].CannotCookText",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[11].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[12].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[13].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[15].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[16].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[17].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[18].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[19].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[2].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[23].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[3].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[4].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[5].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[6].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[7].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[8].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[9].ActionName",
    "DisasterBeasons_Nc_VolcanicEruption_FireBall_Hell_CookingRecipes[9].CannotCookText",
    "DisasterBeasons_Nc_VolcanicEruption_Magma_CardInteractions"
)

# $keys = $keys | %{[Regex]::Escape($_)} | Sort-Object {$_.Length} -Descending 

dir -Recurse -File *.json | 
%{

    $_.FullName

    $content = [System.IO.File]::ReadAllText($_.FullName)

    $modified = $false

    foreach ($key in $keys) {
        
        $quotedText = "`""+ $key + "`""

        # x.IndexOf("", StringComparison.OrdinalIgnoreCase);
        # x.Replace("","", StringComparison.OrdinalIgnoreCase)

        if($content.IndexOf($key, [System.StringComparison]::OrdinalIgnoreCase) -ne -1)
        {
            $modified = $true
            $content = $content.Replace($quotedText,"`"`"", [System.StringComparison]::OrdinalIgnoreCase)
        }

        # $content = $content.Replace($key,"")
   }

   if($modified)
   {
    "Writing..."
    [System.IO.File]::WriteAllText($_.FullName,$content)
   }

    # Set-Content -NoNewLine -Path $_.FullName -Value $content
}

