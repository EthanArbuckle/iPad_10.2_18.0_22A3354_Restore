@implementation PLMomentGenerationUtils

+ (void)processLocationIfNecessaryInMoment:(id)a3 usingManager:(id)a4 frequentLocations:(id)a5 frequentLocationsDidChange:(BOOL)a6
{
  id v10;
  id v11;
  unsigned int v12;
  unsigned int v14;
  int v15;
  BOOL v16;
  char v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v20, "processedLocation");
  if (v12 > 0xA || ((1 << v12) & 0x49C) == 0)
  {
    v14 = v12;
    v15 = objc_msgSend(v10, "routineIsAvailable");
    if (v11)
      v16 = v14 == 9;
    else
      v16 = 0;
    v17 = v16;
    if (!v14 || a6 || (v17 & 1) != 0 || v15 && (v14 == 8 || v14 == 1))
    {
      objc_msgSend(v10, "locationsOfInterest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(a1, "locationTypeForMoment:locationsOfInterest:frequentLocations:", v20, v18, v11);

      objc_msgSend(v20, "setProcessedLocation:", v19);
    }
  }

}

+ (unsigned)locationTypeForAsset:(id)a3 locationsOfInterest:(id)a4 frequentLocations:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gpsHorizontalAccuracy");
  v13 = v12;
  objc_msgSend(v10, "dateCreated");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateCreated");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v10) = objc_msgSend(a1, "_locationTypeForLocation:horizontalAccuracy:startDate:endDate:locationsOfInterest:frequentLocations:", v11, v14, v15, v9, v8, v13);
  return (unsigned __int16)v10;
}

+ (unsigned)locationTypeForMoment:(id)a3 locationsOfInterest:(id)a4 frequentLocations:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "approximateLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gpsHorizontalAccuracy");
  v13 = v12;
  objc_msgSend(v10, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v10) = objc_msgSend(a1, "_locationTypeForLocation:horizontalAccuracy:startDate:endDate:locationsOfInterest:frequentLocations:", v11, v14, v15, v9, v8, v13);
  return (unsigned __int16)v10;
}

+ (unsigned)_locationTypeForLocation:(id)a3 horizontalAccuracy:(double)a4 startDate:(id)a5 endDate:(id)a6 locationsOfInterest:(id)a7 frequentLocations:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unsigned __int16 v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  char v25;
  uint64_t i;
  void *v27;
  double v28;
  double v29;
  uint64_t v31;
  int v32;
  __int16 v33;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v14)
  {
    v19 = 2;
    goto LABEL_39;
  }
  if (+[PLLocationUtils horizontalAccuracyIsCoarse:](PLLocationUtils, "horizontalAccuracyIsCoarse:", a4))
  {
    v19 = 7;
    goto LABEL_39;
  }
  if (!v17)
  {
    v19 = 8;
    goto LABEL_28;
  }
  v38 = a1;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v20 = v17;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v21)
  {

    v19 = 6;
    a1 = v38;
    if (v18)
      goto LABEL_29;
    goto LABEL_36;
  }
  v22 = v21;
  v35 = v18;
  v36 = v16;
  v37 = v15;
  v23 = *MEMORY[0x1E0C9E318];
  v24 = *(_QWORD *)v40;
  v25 = 1;
  v19 = 6;
  do
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v40 != v24)
        objc_enumerationMutation(v20);
      v27 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      objc_msgSend(v27, "distanceFromLocation:", v14, v35, v36, v37);
      v29 = v28;
      if (v28 <= 50.0 && v28 < v23)
      {
        v31 = objc_msgSend(v27, "type");
        switch(v31)
        {
          case -1:
            v19 = 6;
            break;
          case 1:
            v25 = 0;
            v19 = 4;
            break;
          case 0:
            v25 = 0;
            v19 = 3;
            break;
        }
        v23 = v29;
      }
    }
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v22);

  v16 = v36;
  v15 = v37;
  v18 = v35;
  a1 = v38;
  if ((v25 & 1) != 0)
  {
LABEL_28:
    if (v18)
    {
LABEL_29:
      objc_msgSend(v14, "coordinate");
      v32 = objc_msgSend(a1, "isTopFrequentLocationForCoordinate:startDate:endDate:frequentLocations:", v15, v16, v18);
      if (v17)
        v33 = 5;
      else
        v33 = 1;
      if (v32)
        v19 = v33;
      goto LABEL_39;
    }
LABEL_36:
    if (v19 == 8)
      v19 = 8;
    else
      v19 = 9;
  }
LABEL_39:

  return v19;
}

+ (BOOL)isTopFrequentLocationForMoment:(id)a3 frequentLocations:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "pl_coordinate");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(a1, "isTopFrequentLocationForCoordinate:startDate:endDate:frequentLocations:", v12, v13, v6, v9, v11);
  return (char)v7;
}

+ (BOOL)isTopFrequentLocationForCoordinate:(CLLocationCoordinate2D)a3 startDate:(id)a4 endDate:(id)a5 frequentLocations:(id)a6
{
  double longitude;
  double latitude;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "frequentLocationsOverlappingStartDate:endDate:frequentLocations:", a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sortedOverlappingFrequentLocations:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11 >= 2)
    v12 = 2;
  else
    v12 = v11;
  objc_msgSend(v10, "subarrayWithRange:", 0, v12);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v13);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "isWithinDistance:toCoordinate:", 100.0, latitude, longitude, (_QWORD)v18) & 1) != 0)
        {
          LOBYTE(v14) = 1;
          goto LABEL_14;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_14:

  return v14;
}

+ (id)_sortedOverlappingFrequentLocations:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_101886);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)frequentLocationsOverlappingStartDate:(id)a3 endDate:(id)a4 frequentLocations:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v21 = v7;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v8);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "dateInterval");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v10, "intersectsDateInterval:", v18);

        if (v19)
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  return v11;
}

+ (id)frequentLocationNearMoment:(id)a3 withFrequentLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  id v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v7;
  objc_msgSend(a1, "frequentLocationsOverlappingStartDate:endDate:frequentLocations:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v30;
    v16 = 1.79769313e308;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v18, "momentsSet");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "containsObject:", v6);

        if (v21)
        {
          v26 = v18;

          objc_autoreleasePoolPop(v19);
          v14 = v26;
          goto LABEL_15;
        }
        objc_msgSend(v18, "coordinate");
        objc_msgSend(v6, "approximateLocation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "coordinate");

        CLLocationCoordinate2DGetDistanceFrom();
        if (v23 < v16)
        {
          v24 = v23;
          if (v23 < 100.0)
          {
            v25 = v18;

            v16 = v24;
            v14 = v25;
          }
        }
        objc_autoreleasePoolPop(v19);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_15:

  return v14;
}

+ (signed)originatorStateForAsset:(id)a3
{
  id v4;
  unsigned int v5;
  signed __int16 v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "shareState");
  if (v5 >= 3)
    v6 = 0;
  else
    v6 = 0x400020001uLL >> (16 * v5);
  if (_os_feature_enabled_impl()
    && objc_msgSend(a1, "shouldConsiderAssetAsOutlierForMomentClustering:", v4))
  {
    v6 |= objc_msgSend(a1, "externalOriginatorStateForAsset:", v4);
  }

  return v6;
}

+ (BOOL)shouldConsiderAssetAsOutlierForMomentClustering:(id)a3
{
  id v4;
  char v5;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isScreenRecording") & 1) != 0 || objc_msgSend(v4, "kindSubtype") == 10)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset");
    objc_msgSend(v4, "savedAssetType");
    if ((PLValidatedSavedAssetTypeApplies() & 1) != 0 || objc_msgSend(v4, "syndicationHistory"))
    {
      v5 = (objc_msgSend(v4, "syndicationProcessingValue") & 0x3CF1) == 0;
    }
    else
    {
      objc_msgSend(v4, "importedByBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(a1, "importedByBundleIdentifiersAllowListForMomentGeneration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", v7);

        v5 = v9 ^ 1;
      }
      else
      {
        v5 = 0;
      }

    }
  }

  return v5;
}

+ (signed)externalOriginatorStateForAsset:(id)a3
{
  id v4;
  signed __int16 v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if ((objc_msgSend(v4, "syndicationProcessingValue") & 0x3CF1) == 0)
  {
    objc_msgSend(a1, "importedByBundleIdentifiersToIncludeIfNotProcessed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "importedByBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsObject:", v7))
    {
      v8 = objc_msgSend(v4, "syndicationProcessingVersion");

      if (!v8)
      {
        v5 = 16;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v5 = 8;
    goto LABEL_8;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

+ (id)importedByBundleIdentifiersToIncludeIfNotProcessed
{
  if (importedByBundleIdentifiersToIncludeIfNotProcessed_onceToken != -1)
    dispatch_once(&importedByBundleIdentifiersToIncludeIfNotProcessed_onceToken, &__block_literal_global_34);
  return (id)importedByBundleIdentifiersToIncludeIfNotProcessed_allowList;
}

+ (id)importedByBundleIdentifiersAllowListForMomentGeneration
{
  if (importedByBundleIdentifiersAllowListForMomentGeneration_onceToken != -1)
    dispatch_once(&importedByBundleIdentifiersAllowListForMomentGeneration_onceToken, &__block_literal_global_36_101869);
  return (id)importedByBundleIdentifiersAllowListForMomentGeneration_allowList;
}

+ (id)internalPredicateToIncludeExternalAssetsEligibleForProcessing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3880];
  +[PLMomentGenerationUtils importedByBundleIdentifiersAllowListForMomentGeneration](PLMomentGenerationUtils, "importedByBundleIdentifiersAllowListForMomentGeneration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K != nil && NOT %K IN %@"), CFSTR("additionalAttributes.importedByBundleIdentifier"), CFSTR("additionalAttributes.importedByBundleIdentifier"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("additionalAttributes.syndicationHistory"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype = %d"), 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype = %d"), 103);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v4;
  v12[1] = v5;
  v12[2] = v6;
  v12[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)today
{
  if (PLMomentGenerationUtilsOverridenToday)
    return (id)PLMomentGenerationUtilsOverridenToday;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)overrideTodayWithDate:(id)a3
{
  objc_storeStrong((id *)&PLMomentGenerationUtilsOverridenToday, a3);
}

void __82__PLMomentGenerationUtils_importedByBundleIdentifiersAllowListForMomentGeneration__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("com.apple.mobileslideshow");
  v6[1] = CFSTR("com.apple.Photos");
  v6[2] = CFSTR("com.apple.camera.CameraMessagesApp");
  v6[3] = CFSTR("com.apple.share.System.add-to-iphoto");
  v6[4] = CFSTR("com.apple.camera");
  v6[5] = CFSTR("com.apple.camera.lockscreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x19AEC04BC]())
  {
    v5[0] = CFSTR("com.apple.PhotoKitEntitledTests.xctrunner");
    v5[1] = CFSTR("com.apple.photosgraph.tests.xctrunner");
    v5[2] = CFSTR("com.apple.photosctl");
    v5[3] = CFSTR("com.apple.plphotosctl");
    v5[4] = CFSTR("com.apple.PhotosIntelligenceTests.xctrunner");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v1);
    v2 = objc_claimAutoreleasedReturnValue();

    v0 = (void *)v2;
  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v0);
  v4 = (void *)importedByBundleIdentifiersAllowListForMomentGeneration_allowList;
  importedByBundleIdentifiersAllowListForMomentGeneration_allowList = v3;

}

void __77__PLMomentGenerationUtils_importedByBundleIdentifiersToIncludeIfNotProcessed__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.sharingd"), 0);
  v1 = (void *)importedByBundleIdentifiersToIncludeIfNotProcessed_allowList;
  importedByBundleIdentifiersToIncludeIfNotProcessed_allowList = v0;

}

uint64_t __63__PLMomentGenerationUtils__sortedOverlappingFrequentLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "sortedMoments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v5, "sortedMoments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 > v9)
    goto LABEL_4;
  if (v9 > v7)
  {
LABEL_6:
    v16 = 1;
    goto LABEL_7;
  }
  objc_msgSend(v4, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "duration");
  v12 = v11;

  objc_msgSend(v5, "dateInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "duration");
  v15 = v14;

  if (v12 <= v15)
  {
    if (v15 <= v12)
    {
      objc_msgSend(v5, "dateInterval");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dateInterval");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v19, "compare:", v21);

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_4:
  v16 = -1;
LABEL_7:

  return v16;
}

@end
