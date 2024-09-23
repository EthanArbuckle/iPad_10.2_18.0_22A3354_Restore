@implementation PLCloudResourcePrefetchPredicates

+ (id)_missingThumbnailPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d || %K == %d"), CFSTR("asset.thumbnailIndex"), 0xFFFFFFFFLL, CFSTR("asset.thumbnailIndex"), 4294967293);
}

+ (id)_predicateForMaxFilesize:(unint64_t)a3
{
  return +[PLInternalResource predicateForMaxFilesize:](PLInternalResource, "predicateForMaxFilesize:", a3);
}

+ (id)_predicateForResourceCreatedAfterDate:(id)a3
{
  return +[PLInternalResource predicateForResourceCreatedAfterDate:](PLInternalResource, "predicateForResourceCreatedAfterDate:", a3);
}

+ (id)_predicateForImageResourcePixelsLessOrEqual:(int64_t)a3
{
  return +[PLInternalResource predicateForImageResourcePixelsLessOrEqual:](PLInternalResource, "predicateForImageResourcePixelsLessOrEqual:", a3);
}

+ (id)_irisConditionPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("asset.kindSubtype"), 2);
}

+ (id)_excludeMomentShareAssetsPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:keyPathPrefix:", objc_msgSend(MEMORY[0x1E0D73310], "maskForMomentSharedAsset"), 1, CFSTR("asset"));
}

+ (id)_assetIsUnadjustedPredicate
{
  return +[PLManagedAsset predicateForUnadjustedAssetsWithKeyPathToAsset:](PLManagedAsset, "predicateForUnadjustedAssetsWithKeyPathToAsset:", CFSTR("asset"));
}

+ (id)_assetPredicateForCPLResourceType:(unint64_t)a3 additionalAssetPredicates:(id)a4 additionalResourcePredicates:(id)a5 options:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v11 = a6;
  v12 = a5;
  v13 = objc_alloc_init(v10);
  objc_msgSend(v11, "prefetchConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "cloudResourceMaxPrefetchRetry");
  v16 = objc_msgSend(v11, "excludeDynamicResources");

  +[PLInternalResource prefetchResourcePredicateForCPLResourceType:isAssetResource:maxRetry:excludeDynamicResources:additionalResourcePredicates:](PLInternalResource, "prefetchResourcePredicateForCPLResourceType:isAssetResource:maxRetry:excludeDynamicResources:additionalResourcePredicates:", a3, 1, v15, v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObject:", v17);
  +[PLManagedAsset predicateForAdjustedAssetsWithKeyPathToAsset:](PLManagedAsset, "predicateForAdjustedAssetsWithKeyPathToAsset:", CFSTR("asset"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v18);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("asset.cloudLocalState"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v19);

  if (objc_msgSend(v9, "count"))
    objc_msgSend(v13, "addObjectsFromArray:", v9);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_masterPredicateForCPLResourceType:(unint64_t)a3 additionalAssetPredicates:(id)a4 additionalResourcePredicates:(id)a5 options:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v11 = a6;
  v12 = a5;
  v13 = objc_alloc_init(v10);
  objc_msgSend(v11, "prefetchConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "cloudResourceMaxPrefetchRetry");
  v16 = objc_msgSend(v11, "excludeDynamicResources");

  +[PLInternalResource prefetchResourcePredicateForCPLResourceType:isAssetResource:maxRetry:excludeDynamicResources:additionalResourcePredicates:](PLInternalResource, "prefetchResourcePredicateForCPLResourceType:isAssetResource:maxRetry:excludeDynamicResources:additionalResourcePredicates:", a3, 0, v15, v16, v12);
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObject:", v17);
  +[PLInternalResource originalCPLResourceTypesForMaster](PLInternalResource, "originalCPLResourceTypesForMaster");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = objc_msgSend(v18, "containsObject:", v19);

  if ((v17 & 1) == 0)
  {
    +[PLManagedAsset predicateForUnadjustedAssetsWithKeyPathToAsset:](PLManagedAsset, "predicateForUnadjustedAssetsWithKeyPathToAsset:", CFSTR("asset"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v20);

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("asset.cloudLocalState"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v21);

  if (objc_msgSend(v9, "count"))
    objc_msgSend(v13, "addObjectsFromArray:", v9);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (double)_resourceLastPrunedPrefetchTimeInterval
{
  double v2;

  v2 = 86400.0;
  if (MEMORY[0x19AEC04BC](a1, a2))
  {
    if (_resourceLastPrunedPrefetchTimeInterval_onceToken != -1)
      dispatch_once(&_resourceLastPrunedPrefetchTimeInterval_onceToken, &__block_literal_global_81615);
    if (*(double *)&_resourceLastPrunedPrefetchTimeInterval_lastPrunedPrefetchTimeIntervalDefault > 0.0)
      return *(double *)&_resourceLastPrunedPrefetchTimeInterval_lastPrunedPrefetchTimeIntervalDefault;
  }
  return v2;
}

+ (id)_prefetchResourceForAsset:(id)a3 inResourceTypes:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v12)
  {
    v13 = v12;
    v38 = a1;
    v14 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v17 = objc_msgSend(v8, "hasAdjustments");
        v18 = objc_msgSend(v16, "unsignedIntegerValue");
        if ((v17 & 1) != 0)
          objc_msgSend(v8, "assetResourceForCPLType:", v18);
        else
          objc_msgSend(v8, "masterResourceForCPLType:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isLocallyAvailable") & 1) != 0)
        {
          v23 = 0;
          goto LABEL_26;
        }
        if (!objc_msgSend(v10, "excludeDynamicResources")
          || (v20 = (void *)MEMORY[0x1E0D11440],
              objc_msgSend(v19, "fingerprint"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              LOBYTE(v20) = objc_msgSend(v20, "isDynamicFingerprint:", v21),
              v21,
              (v20 & 1) == 0))
        {
          if (objc_msgSend(v19, "isRemotelyAvailable"))
          {
            objc_msgSend(v19, "scopedIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v19, "cloudPrunedAt");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v19, "dataLength");
              objc_msgSend(v10, "prefetchConfiguration");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25 > objc_msgSend(v26, "cloudResourcePrefetchMaxFileSize"))
                goto LABEL_23;
              v27 = objc_msgSend(v19, "cloudPrefetchCount");
              objc_msgSend(v10, "prefetchConfiguration");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27 > (int)objc_msgSend(v28, "cloudResourceMaxPrefetchRetry"))
                goto LABEL_22;
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "cloudLastPrefetchDate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "timeIntervalSinceDate:", v30);
              if (v31 >= 86400.0)
              {
                if (v24)
                {
                  objc_msgSend(MEMORY[0x1E0C99D68], "date");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "timeIntervalSinceDate:", v24);
                  v35 = v34;
                  objc_msgSend(v38, "_resourceLastPrunedPrefetchTimeInterval");
                  v37 = v36;

                  if (v35 < v37)
                    goto LABEL_24;
                }
                else
                {

                }
                objc_msgSend(v19, "objectID");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {

LABEL_22:
LABEL_23:

LABEL_24:
                v23 = 0;
              }

LABEL_26:
              goto LABEL_27;
            }
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v13)
        continue;
      break;
    }
  }
  v23 = 0;
LABEL_27:

  return v23;
}

+ (id)_resourcesToPrefetchForAsset:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  if (objc_msgSend(v7, "prefetchOptimizeMode"))
  {
    objc_msgSend(v6, "isVideo");
  }
  else
  {
    objc_msgSend(v9, "addObject:", &unk_1E3760110);
    if (objc_msgSend(v6, "hdrType") == 5
      && objc_msgSend(MEMORY[0x1E0D75128], "currentDeviceIsEligibleForHDRPlayback"))
    {
      v11 = &unk_1E3760128;
    }
    else
    {
      v11 = &unk_1E3760140;
    }
    objc_msgSend(v10, "addObject:", v11);
  }
  objc_msgSend(v9, "addObjectsFromArray:", &unk_1E3763F08);
  objc_msgSend(v10, "addObjectsFromArray:", &unk_1E3763F20);
  objc_msgSend(a1, "_prefetchResourceForAsset:inResourceTypes:options:", v6, v9, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v8, "addObject:", v12);
  objc_msgSend(a1, "_prefetchResourceForAsset:inResourceTypes:options:", v6, v10, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v8, "addObject:", v13);

  return v8;
}

+ (id)_predicateToPrefetchSuggestions:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__81586;
  v24 = __Block_byref_object_dispose__81587;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__PLCloudResourcePrefetchPredicates__predicateToPrefetchSuggestions_photoLibrary_options___block_invoke;
  v15[3] = &unk_1E3674DF8;
  v11 = v8;
  v16 = v11;
  v19 = a1;
  v12 = v10;
  v17 = v12;
  v18 = &v20;
  objc_msgSend(v9, "performBlockAndWait:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

+ (id)_predicateToPrefetchMemoryKeyAssets:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__81586;
  v24 = __Block_byref_object_dispose__81587;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94__PLCloudResourcePrefetchPredicates__predicateToPrefetchMemoryKeyAssets_photoLibrary_options___block_invoke;
  v15[3] = &unk_1E3674DF8;
  v11 = v8;
  v16 = v11;
  v19 = a1;
  v12 = v10;
  v17 = v12;
  v18 = &v20;
  objc_msgSend(v9, "performBlockAndWait:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

+ (id)predicateToPrefetchMemories:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__81586;
  v24 = __Block_byref_object_dispose__81587;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__PLCloudResourcePrefetchPredicates_predicateToPrefetchMemories_photoLibrary_options___block_invoke;
  v15[3] = &unk_1E3674DF8;
  v11 = v8;
  v16 = v11;
  v12 = v10;
  v18 = &v20;
  v19 = a1;
  v17 = v12;
  objc_msgSend(v9, "performBlockAndWait:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

+ (id)predicateToPrefetchHighlightWithUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__81586;
  v19 = __Block_byref_object_dispose__81587;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__PLCloudResourcePrefetchPredicates_predicateToPrefetchHighlightWithUUIDs_photoLibrary___block_invoke;
  v11[3] = &unk_1E3676EA0;
  v7 = v5;
  v12 = v7;
  v8 = v6;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v8, "performBlockAndWait:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (id)predicatesForThumbnails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PLIsEDUMode() & 1) == 0)
  {
    objc_msgSend(a1, "_missingThumbnailPredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_assetPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 5, v7, 0, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    objc_msgSend(a1, "_missingThumbnailPredicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_masterPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 5, v10, 0, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  return v5;
}

+ (id)predicatesForOriginalResources:(id)a3 additionalResourcePredicates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLInternalResource originalCPLResourceTypesForMaster](PLInternalResource, "originalCPLResourceTypesForMaster");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObject:", &unk_1E3760170);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(a1, "_masterPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v15), "unsignedIntegerValue"), 0, v7, v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v13);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  +[PLInternalResource originalCPLResourceTypesForAsset](PLInternalResource, "originalCPLResourceTypesForAsset", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(a1, "_assetPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "unsignedIntegerValue"), 0, v7, v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v19);
  }

  return v8;
}

+ (id)predicatesForNonThumbnails:(id)a3 lastCompletePrefetchDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  float v10;
  float v11;
  unint64_t v12;
  float v13;
  float v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v56;
  void *context;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "prefetchMode");
  if (v9 == 1)
  {
    objc_msgSend(a1, "predicatesForOriginalResources:additionalResourcePredicates:", v6, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v43);

  }
  else if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0D11440], "derivativeGenerationThreshold");
    v11 = v10;
    v12 = objc_msgSend(MEMORY[0x1E0D11440], "maxPixelSizeForResourceType:", 4);
    objc_msgSend(MEMORY[0x1E0D11440], "derivativeGenerationThreshold");
    v14 = v13;
    v15 = objc_msgSend(MEMORY[0x1E0D11440], "maxPixelSizeForResourceType:", 3);
    context = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "prefetchOptimizeMode") != 2)
    {
      objc_msgSend(v6, "prefetchConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_predicateForMaxFilesize:", objc_msgSend(v17, "cloudResourcePrefetchMaxFileSize"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v18);

    }
    if (v7)
    {
      objc_msgSend(v7, "dateByAddingTimeInterval:", -3600.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_predicateForResourceCreatedAfterDate:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v20);

    }
    v21 = objc_msgSend(v6, "prefetchOptimizeMode");
    if (v21 == 2)
    {
      objc_msgSend(a1, "predicatesForOriginalResources:additionalResourcePredicates:", v6, v16);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v40);
    }
    else
    {
      if (v21 == 1)
      {
        objc_msgSend(a1, "_assetPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 2, 0, v16, v6);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v44);

        objc_msgSend(a1, "_assetPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 16, 0, v16, v6);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v45);

        objc_msgSend(a1, "_predicateForImageResourcePixelsLessOrEqual:", (unint64_t)(float)(v14 * (float)v15));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "arrayByAddingObject:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "_assetIsUnadjustedPredicate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v48;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_masterPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 1, v49, v47, v6);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v50);

        objc_msgSend(a1, "_assetPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 19, 0, v16, v6);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v51);

        objc_msgSend(a1, "_assetIsUnadjustedPredicate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v52;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_masterPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 18, v53, v16, v6);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v54);

        goto LABEL_15;
      }
      if (v21)
      {
LABEL_15:

        objc_autoreleasePoolPop(context);
        goto LABEL_16;
      }
      v56 = (unint64_t)(float)(v11 * (float)v12);
      +[PLInternalResource predicateForResourceIsNotLocallyAvailableWithCPLResourceType:version:](PLInternalResource, "predicateForResourceIsNotLocallyAvailableWithCPLResourceType:version:", 2, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObject:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_assetPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 4, 0, v23, v6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v24);

      +[PLInternalResource predicateForResourceIsNotLocallyAvailableWithCPLResourceType:version:](PLInternalResource, "predicateForResourceIsNotLocallyAvailableWithCPLResourceType:version:", 1, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObject:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_masterPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 4, 0, v26, v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v27);

      objc_msgSend(a1, "_irisConditionPredicate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLInternalResource predicateForResourceIsNotLocallyAvailableWithCPLResourceType:version:](PLInternalResource, "predicateForResourceIsNotLocallyAvailableWithCPLResourceType:version:", 19, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObject:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_assetPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 6, v29, v31, v6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v32);

      objc_msgSend(a1, "_irisConditionPredicate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLInternalResource predicateForResourceIsNotLocallyAvailableWithCPLResourceType:version:](PLInternalResource, "predicateForResourceIsNotLocallyAvailableWithCPLResourceType:version:", 18, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObject:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_masterPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 6, v34, v36, v6);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v37);

      objc_msgSend(a1, "_predicateForImageResourcePixelsLessOrEqual:", v56);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v38);

      objc_msgSend(a1, "_assetPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 2, 0, v16, v6);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v39);

      objc_msgSend(a1, "_assetIsUnadjustedPredicate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_masterPredicateForCPLResourceType:additionalAssetPredicates:additionalResourcePredicates:options:", 1, v41, v16, v6);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v42);

    }
    goto LABEL_15;
  }
LABEL_16:

  return v8;
}

+ (id)predicatesForMemories:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "prefetchMode"))
  {
    objc_msgSend(v6, "prefetchConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLMemory memoriesToPrefetchInPhotoLibrary:prefetchConfiguration:](PLMemory, "memoriesToPrefetchInPhotoLibrary:prefetchConfiguration:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "predicateToPrefetchMemories:photoLibrary:options:", v10, v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v8, "addObject:", v11);

  }
  return v8;
}

+ (id)predicatesForWidget:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "prefetchMode"))
  {
    objc_msgSend(v7, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSuggestion suggestionsToPrefetchInManagedObjectContext:](PLSuggestion, "suggestionsToPrefetchInManagedObjectContext:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_predicateToPrefetchSuggestions:photoLibrary:options:", v10, v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v8, "addObject:", v11);
    objc_msgSend(v7, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLMemory memoriesToPrefetchForWidgetInManagedObjectContext:](PLMemory, "memoriesToPrefetchForWidgetInManagedObjectContext:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_predicateToPrefetchMemoryKeyAssets:photoLibrary:options:", v13, v7, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v8, "addObject:", v14);

  }
  return v8;
}

+ (id)predicatesForComputeSync:(id)a3 photoLibrary:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[9];

  v24[8] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -86400.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("dataStoreClassID"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("resourceType"), 14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("recipeID"), 327689);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("localAvailability"), 0xFFFFFFFFLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("remoteAvailability"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v10;
  v11 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v5, "prefetchConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K <= %d"), CFSTR("cloudPrefetchCount"), objc_msgSend(v12, "cloudResourceMaxPrefetchRetry"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("cloudLastPrefetchDate"), v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v14;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("cloudPrunedAt"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)predicateToPrefetchMediaMetadataResourcesWithOptions:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __103__PLCloudResourcePrefetchPredicates_predicateToPrefetchMediaMetadataResourcesWithOptions_photoLibrary___block_invoke;
  v19[3] = &unk_1E3677C18;
  v8 = v6;
  v20 = v8;
  v9 = v7;
  v21 = v9;
  objc_msgSend(v8, "performBlockAndWait:", v19);
  if (!objc_msgSend(v9, "count"))
    goto LABEL_4;
  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("asset"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("cloudLocalState"), 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(v5, "prefetchConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLInternalResource prefetchResourcePredicateForCPLResourceType:isAssetResource:maxRetry:excludeDynamicResources:additionalResourcePredicates:](PLInternalResource, "prefetchResourcePredicateForCPLResourceType:isAssetResource:maxRetry:excludeDynamicResources:additionalResourcePredicates:", 10, 0, objc_msgSend(v13, "cloudResourceMaxPrefetchRetry"), objc_msgSend(v5, "excludeDynamicResources"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v22 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v17 = 0;
  }

  return v17;
}

+ (id)predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __111__PLCloudResourcePrefetchPredicates_predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions_photoLibrary___block_invoke;
  v19[3] = &unk_1E3677C18;
  v8 = v6;
  v20 = v8;
  v9 = v7;
  v21 = v9;
  objc_msgSend(v8, "performBlockAndWait:", v19);
  if (!objc_msgSend(v9, "count"))
    goto LABEL_4;
  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("asset"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("cloudLocalState"), 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(v5, "prefetchConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLInternalResource prefetchResourcePredicateForCPLResourceType:isAssetResource:maxRetry:excludeDynamicResources:additionalResourcePredicates:](PLInternalResource, "prefetchResourcePredicateForCPLResourceType:isAssetResource:maxRetry:excludeDynamicResources:additionalResourcePredicates:", 27, 1, objc_msgSend(v13, "cloudResourceMaxPrefetchRetry"), objc_msgSend(v5, "excludeDynamicResources"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v22 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v17 = 0;
  }

  return v17;
}

+ (id)predicateForOriginalResourcesForPrefetchLocallyAvailableOnly:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v29 = a3;
  v35[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  v4 = (void *)MEMORY[0x1E0CB3880];
  +[PLInternalResource originalCPLResourceTypesForMaster](PLInternalResource, "originalCPLResourceTypesForMaster");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("dataStoreSubtype"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("version"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  v11 = (void *)MEMORY[0x1E0CB3880];
  +[PLInternalResource originalCPLResourceTypesForAsset](PLInternalResource, "originalCPLResourceTypesForAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("dataStoreSubtype"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v13;
  v14 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("version"), 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("version"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "orPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("localAvailability"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3528];
    v31[0] = v9;
    v31[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "orPredicateWithSubpredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v24;
    v32[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "andPredicateWithSubpredicates:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB3528];
    v30[0] = v9;
    v30[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "orPredicateWithSubpredicates:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

void __111__PLCloudResourcePrefetchPredicates_predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions_photoLibrary___block_invoke(uint64_t a1)
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
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  const __CFString *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("additionalAssetAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = NULL"), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v7);

  objc_msgSend(v2, "setResultType:", 2);
  v20[0] = CFSTR("additionalAssetAttributes");
  v20[1] = CFSTR("additionalAssetAttributes.asset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v8);

  v19 = CFSTR("additionalAssetAttributes.asset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v9);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v2, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;

  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __111__PLCloudResourcePrefetchPredicates_predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions_photoLibrary___block_invoke_2;
    v14[3] = &unk_1E3673250;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);
    v13 = v15;
  }
  else
  {
    PLResourceCachingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch internal resources for metadata overflow: %@", buf, 0xCu);
    }
  }

}

void __111__PLCloudResourcePrefetchPredicates_predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions_photoLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("additionalAssetAttributes.asset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __103__PLCloudResourcePrefetchPredicates_predicateToPrefetchMediaMetadataResourcesWithOptions_photoLibrary___block_invoke(uint64_t a1)
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
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t buf[4];
  id v29;
  _BYTE v30[128];
  _QWORD v31[2];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("cloudMaster"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = NULL"), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v7);

  v31[0] = CFSTR("cloudMaster");
  v31[1] = CFSTR("cloudMaster.assets");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v8);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v2, &v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;

  if (v10)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v10;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v13)
    {
      v14 = v13;
      v21 = v11;
      v22 = v2;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "cloudMaster");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "assets");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "anyObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      }
      while (v14);
      v11 = v21;
      v2 = v22;
    }
  }
  else
  {
    PLResourceCachingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch internal resources for metadata overflow: %@", buf, 0xCu);
    }
  }

}

void __88__PLCloudResourcePrefetchPredicates_predicateToPrefetchHighlightWithUUIDs_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id obj;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), *(_QWORD *)(a1 + 32));
    v2 = objc_claimAutoreleasedReturnValue();
    v36 = a1;
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v38 = (void *)v2;
    +[PLPhotosHighlight allPhotosHighlightsInManagedObjectContext:predicate:keyPathsForPrefetching:error:](PLPhotosHighlight, "allPhotosHighlightsInManagedObjectContext:predicate:keyPathsForPrefetching:error:", v3, v2, 0, &v59);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v59;

    if (v4)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v35 = v4;
      obj = v4;
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
      if (v42)
      {
        v41 = *(_QWORD *)v56;
        do
        {
          v5 = 0;
          do
          {
            if (*(_QWORD *)v56 != v41)
              objc_enumerationMutation(obj);
            v44 = v5;
            v6 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v5);
            v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            switch(objc_msgSend(v6, "kind"))
            {
              case 0u:
              case 3u:
                objc_msgSend(v6, "assets");
                v8 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "allObjects");
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObjectsFromArray:", v9);

                goto LABEL_14;
              case 1u:
                objc_msgSend(v6, "monthKeyAssetPrivate");
                v10 = objc_claimAutoreleasedReturnValue();
                goto LABEL_12;
              case 2u:
                objc_msgSend(v6, "yearKeyAssetPrivate");
                v10 = objc_claimAutoreleasedReturnValue();
LABEL_12:
                v8 = (void *)v10;
                if (v10)
                  objc_msgSend(v7, "addObject:", v10);
LABEL_14:

                break;
              default:
                break;
            }
            v43 = v6;
            v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v51 = 0u;
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v45 = v7;
            v12 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
            if (v12)
            {
              v13 = v12;
              v46 = *(_QWORD *)v52;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v52 != v46)
                    objc_enumerationMutation(v45);
                  v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
                  v47 = 0u;
                  v48 = 0u;
                  v49 = 0u;
                  v50 = 0u;
                  objc_msgSend(v15, "modernResources");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
                  if (v17)
                  {
                    v18 = v17;
                    v19 = *(_QWORD *)v48;
                    do
                    {
                      for (j = 0; j != v18; ++j)
                      {
                        if (*(_QWORD *)v48 != v19)
                          objc_enumerationMutation(v16);
                        v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
                        if ((objc_msgSend(v21, "isLocallyAvailable") & 1) == 0)
                        {
                          if (objc_msgSend(v21, "isCPLOriginalResource")
                            && (objc_msgSend(v21, "uniformTypeIdentifier"),
                                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                                v23 = objc_msgSend(v22, "conformsToRawImage"),
                                v22,
                                !v23)
                            || objc_msgSend(v21, "cplType") == 2)
                          {
                            objc_msgSend(v21, "objectID");
                            v24 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v11, "addObject:", v24);

                          }
                        }
                      }
                      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
                    }
                    while (v18);
                  }

                }
                v13 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
              }
              while (v13);
            }

            if (objc_msgSend(v11, "count"))
            {
              PLResourceCachingGetLog();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v26 = objc_msgSend(v11, "count");
                objc_msgSend(v43, "uuid");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218242;
                v61 = v26;
                v62 = 2112;
                v63 = v27;
                _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Will prefetch %lu resources for highlight %@", buf, 0x16u);

              }
              objc_msgSend(v11, "allObjects");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addObjectsFromArray:", v28);

            }
            v5 = v44 + 1;
          }
          while (v44 + 1 != v42);
          v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
        }
        while (v42);
      }

      v4 = v35;
      v29 = v37;
      if (!objc_msgSend(v40, "count"))
        goto LABEL_48;
      PLResourceCachingGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = objc_msgSend(v40, "count");
        *(_DWORD *)buf = 134217984;
        v61 = v31;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "Will prefetch %lu highlight resources", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), v40);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(*(_QWORD *)(v36 + 48) + 8);
      v34 = *(NSObject **)(v33 + 40);
      *(_QWORD *)(v33 + 40) = v32;
    }
    else
    {
      PLResourceCachingGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v37;
        v61 = (uint64_t)v37;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Failed to fetch highlights: %@", buf, 0xCu);
      }
      else
      {
        v29 = v37;
      }
    }

LABEL_48:
  }
}

void __86__PLCloudResourcePrefetchPredicates_predicateToPrefetchMemories_photoLibrary_options___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = *(id *)(a1 + 32);
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v54;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v54 != v36)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v3);
        objc_msgSend(v4, "userCuratedAssets");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v3;
        if (objc_msgSend(v5, "count"))
          objc_msgSend(v4, "userCuratedAssets");
        else
          objc_msgSend(v4, "curatedAssets");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("dateCreated"), 1);
        v61 = v38;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v6;
        objc_msgSend(v6, "sortedArrayUsingDescriptors:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v42 = v8;
        v9 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = 0;
          v43 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v50 != v43)
                objc_enumerationMutation(v42);
              v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
              if (objc_msgSend(v14, "isVideo")
                && (objc_msgSend(*(id *)(a1 + 40), "prefetchConfiguration"),
                    v15 = (void *)objc_claimAutoreleasedReturnValue(),
                    v16 = objc_msgSend(v15, "memoryMaxPrefetchVideosCount"),
                    v15,
                    v12 < v16))
              {
                objc_msgSend(v41, "addObject:", v14);
                ++v12;
              }
              else if (objc_msgSend(v14, "isPhoto")
                     && (objc_msgSend(*(id *)(a1 + 40), "prefetchConfiguration"),
                         v17 = (void *)objc_claimAutoreleasedReturnValue(),
                         v18 = objc_msgSend(v17, "memoryMaxPrefetchPhotosCount"),
                         v17,
                         v11 < v18))
              {
                objc_msgSend(v41, "addObject:", v14);
                ++v11;
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 40), "prefetchConfiguration");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v11 >= (int)objc_msgSend(v19, "memoryMaxPrefetchPhotosCount"))
                {
                  objc_msgSend(*(id *)(a1 + 40), "prefetchConfiguration");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v20, "memoryMaxPrefetchVideosCount");

                  if (v12 >= v21)
                    goto LABEL_25;
                }
                else
                {

                }
              }
            }
            v10 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
          }
          while (v10);
        }
LABEL_25:

        objc_msgSend(v4, "keyAsset");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v41, "addObject:", v22);
        v44 = (void *)v22;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v23 = v41;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v46;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v46 != v26)
                objc_enumerationMutation(v23);
              objc_msgSend(*(id *)(a1 + 56), "_resourcesToPrefetchForAsset:options:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j), *(_QWORD *)(a1 + 40));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v28, "count"))
              {
                PLResourceCachingGetLog();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v4, "uuid");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v58 = v30;
                  _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "Will prefetch resources for memory %{public}@", buf, 0xCu);

                }
                PLResourceCachingGetLog();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v58 = v28;
                  _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEBUG, "Memory asset resources to prefetch: %@", buf, 0xCu);
                }

                objc_msgSend(v2, "addObjectsFromArray:", v28);
              }

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
          }
          while (v25);
        }

        v3 = v40 + 1;
      }
      while (v40 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    }
    while (v37);
  }

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), v2);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

  }
}

void __94__PLCloudResourcePrefetchPredicates__predicateToPrefetchMemoryKeyAssets_photoLibrary_options___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "keyAsset");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 56), "_resourcesToPrefetchForAsset:options:", v9, *(_QWORD *)(a1 + 40));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count"))
          {
            PLResourceCachingGetLog();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v8, "uuid");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v22 = v12;
              _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Will prefetch resources for widget memory %{public}@", buf, 0xCu);

            }
            PLResourceCachingGetLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v22 = v10;
              _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Widget Memory asset resources to prefetch: %@", buf, 0xCu);
            }

            objc_msgSend(v2, "addObjectsFromArray:", v10);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), v2);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

void __90__PLCloudResourcePrefetchPredicates__predicateToPrefetchSuggestions_photoLibrary_options___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(a1 + 32);
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v23 = v3;
        v4 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v3);
        objc_msgSend(v4, "keyAssets");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "keyAssets");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(a1 + 56), "_resourcesToPrefetchForAsset:options:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), *(_QWORD *)(a1 + 40));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v13, "count"))
              {
                PLResourceCachingGetLog();
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v4, "uuid");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v33 = v15;
                  _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Will prefetch resources for suggestion %{public}@", buf, 0xCu);

                }
                PLResourceCachingGetLog();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v33 = v13;
                  _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Suggestion asset resources to prefetch: %@", buf, 0xCu);
                }

                objc_msgSend(v2, "addObjectsFromArray:", v13);
              }

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
          }
          while (v10);
        }

        v3 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v22);
  }

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), v2);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
}

double __76__PLCloudResourcePrefetchPredicates__resourceLastPrunedPrefetchTimeInterval__block_invoke()
{
  double result;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  *(double *)&_resourceLastPrunedPrefetchTimeInterval_lastPrunedPrefetchTimeIntervalDefault = (double)objc_msgSend(v1, "integerForKey:", CFSTR("PLResourceLastPrunedPrefetchTimeInterval"));

  return result;
}

@end
