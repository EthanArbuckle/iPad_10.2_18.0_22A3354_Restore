@implementation PLResourceGenerator

+ (void)_continueGeneratingResourcesForAsset:(id)a3 versions:(id)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 remainingRecipes:(id)a8 storedRecipes:(id)a9 attemptedRecipes:(id)a10 errorsEncountered:(id)a11 progress:(id)a12 reason:(id)a13 completion:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void (**v27)(id, id, id);
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void (**v70)(id, id, id);
  id v71;
  id v72;
  _QWORD v73[3];
  _QWORD v74[5];

  v74[3] = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v19 = a4;
  v20 = a5;
  v56 = a6;
  v55 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v26 = a13;
  v27 = (void (**)(id, id, id))a14;
  objc_msgSend(v21, "firstObject");
  v28 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v28;
  if (v28)
  {
    v29 = (void *)v28;
    v53 = v20;
    if (objc_msgSend(v25, "isCancelled"))
    {
      v30 = v25;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 47002, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v31);
      v27[2](v27, v24, v22);

      v32 = v57;
      v20 = v53;
    }
    else
    {
      v50 = v26;
      objc_msgSend(v21, "removeObjectAtIndex:", 0);
      objc_msgSend(v23, "addObject:", v29);
      v33 = (void *)objc_msgSend(v19, "mutableCopy");
      v34 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v29, "supportedVersionsForLocalResourceGeneration");
      v51 = v21;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setWithArray:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "intersectSet:", v36);

      v49 = v22;
      v48 = v33;
      if (objc_msgSend(v33, "count") == 1)
      {
        objc_msgSend(v33, "anyObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v37, "integerValue");

        v72 = 0;
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __231__PLResourceGenerator__continueGeneratingResourcesForAsset_versions_imageConversionClient_videoConversionClient_conversionServiceOptions_remainingRecipes_storedRecipes_attemptedRecipes_errorsEncountered_progress_reason_completion___block_invoke;
        v58[3] = &unk_1E3675988;
        v59 = v22;
        v60 = v23;
        v61 = v51;
        v45 = v25;
        v62 = v45;
        v63 = v24;
        v71 = a1;
        v64 = v57;
        v65 = v19;
        v66 = v53;
        v67 = v56;
        v68 = v55;
        v69 = v50;
        v70 = v27;
        objc_msgSend(v29, "generateAndStoreForAsset:version:imageConversionClient:videoConversionClient:conversionServiceOptions:deferredPhotoFinalizer:progress:reason:completion:", v64, v46, v66, v67, v68, 0, &v72, v69, v58);
        v38 = v72;
        if (v38)
          objc_msgSend(v45, "addChild:withPendingUnitCount:", v38, 1);
        v30 = v25;

        v21 = v51;
        v26 = v50;
      }
      else
      {
        objc_msgSend(v25, "setCompletedUnitCount:", objc_msgSend(v25, "completedUnitCount") + 1);
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v47 = *MEMORY[0x1E0D74498];
        v73[0] = *MEMORY[0x1E0CB2D50];
        NSStringFromPLErrorCode();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = v40;
        v74[1] = v29;
        v73[1] = CFSTR("recipe");
        v73[2] = CFSTR("versions");
        objc_msgSend(v19, "allObjects");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v74[2] = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
        v42 = v19;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", v47, 47004, v43);
        v38 = (id)objc_claimAutoreleasedReturnValue();

        v22 = v49;
        objc_msgSend(v24, "addObject:", v38);
        v26 = v50;
        v30 = v25;
        v19 = v42;
        v44 = v42;
        v21 = v51;
        objc_msgSend(a1, "_continueGeneratingResourcesForAsset:versions:imageConversionClient:videoConversionClient:conversionServiceOptions:remainingRecipes:storedRecipes:attemptedRecipes:errorsEncountered:progress:reason:completion:", v57, v44, v53, v56, v55, v51, v49, v23, v24, v25, v50, v27);
      }

      v20 = v53;
      v32 = v57;
    }
  }
  else
  {
    v30 = v25;
    v27[2](v27, v24, v22);
    v32 = v57;
  }

}

+ (id)fileAndTableBackedThumbnailManagerRecipesForLibraryID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  PLDataStoreForClassIDAndLibraryID(1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isTable") & 1) == 0)
        {
          +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", (2 * objc_msgSend(v11, "formatID")) | 0x40001);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        if (objc_msgSend(v18, "isTable", (_QWORD)v21))
        {
          +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", (2 * objc_msgSend(v18, "formatID")) | 0x30001);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v5, "addObject:", v19);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  return v5;
}

+ (id)expectedLocalResourceRecipesForAssetWithLibraryID:(id)a3 versions:(id)a4 assetHasAdjustments:(BOOL)a5 isDefaultAdjustedSlomo:(BOOL)a6 assetIsRAWOrRawPlugJPEGWithRawOnTop:(BOOL)a7 assetWidth:(int64_t)a8 assetHeight:(int64_t)a9 assetKind:(signed __int16)a10 assetkindSubtype:(signed __int16)a11 deferredProcessingNeeded:(unsigned __int16)a12 videoDeferredProcessingNeeded:(unsigned __int16)a13
{
  _BOOL4 v13;
  _BOOL4 v14;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v30;
  char v31;
  int v32;

  v13 = a7;
  LODWORD(v30) = a6;
  v14 = a5;
  HIDWORD(v30) = a11;
  v17 = a3;
  v18 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") != 1
    && (objc_msgSend(v19, "count") != 2 || (objc_msgSend(v19, "containsObject:", &unk_1E3760DD0) & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceGenerator.m"), 178, CFSTR("Valid versions include: ([(empty)], [current], [current, original], [current, adjusted])"));

  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", 10, v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "containsObject:", &unk_1E3760DE8))
  {
    if (v13 && !v14)
    {
      +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65737);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v22);

    }
    if (a13)
    {
      +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 131280);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v23);

    }
    if (a12 == 10 || a12 == 1)
    {
      +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65944);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v24);

    }
  }
  if (objc_msgSend(v18, "containsObject:", &unk_1E3760E00) && v14)
  {
    if (a10 == 1)
    {
      if ((v31 & 1) != 0)
        goto LABEL_23;
      v26 = 0x20000;
      goto LABEL_22;
    }
    if (!a10)
    {
      +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65938);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v25);

      if (v32 == 2)
      {
        v26 = 131272;
LABEL_22:
        +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v27);

      }
    }
  }
LABEL_23:
  if (objc_msgSend(v18, "containsObject:", &unk_1E3760DD0))
  {
    objc_msgSend(a1, "fileAndTableBackedThumbnailManagerRecipesForLibraryID:", v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unionOrderedSet:", v28);

  }
  return v21;
}

+ (id)expectedLocalResourceRecipesForAsset:(id)a3 versions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  void *v16;
  uint64_t v18;
  unsigned int v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "assetID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v5, "hasAdjustments");
  v9 = objc_msgSend(v5, "isDefaultAdjustedSlomo");
  if ((objc_msgSend(v5, "isRAWOnly") & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v5, "isRAWPlusJPEGWithRAWOnTop");
  v11 = objc_msgSend(v5, "width");
  v12 = objc_msgSend(v5, "height");
  v13 = objc_msgSend(v5, "kind");
  v14 = objc_msgSend(v5, "kindSubtype");
  v15 = objc_msgSend(v5, "deferredProcessingNeeded");
  HIWORD(v18) = objc_msgSend(v5, "videoDeferredProcessingNeeded");
  WORD2(v18) = v15;
  WORD1(v18) = v14;
  LOWORD(v18) = v13;
  objc_msgSend(a1, "expectedLocalResourceRecipesForAssetWithLibraryID:versions:assetHasAdjustments:isDefaultAdjustedSlomo:assetIsRAWOrRawPlugJPEGWithRawOnTop:assetWidth:assetHeight:assetKind:assetkindSubtype:deferredProcessingNeeded:videoDeferredProcessingNeeded:", v8, v6, v19, v9, v10, v11, v12, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)locallyUnavailableRecipesFromRecipes:(id)a3 versions:(id)a4 asset:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "resourcesSortedByQuality");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3880];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __75__PLResourceGenerator_locallyUnavailableRecipesFromRecipes_versions_asset___block_invoke;
  v27[3] = &unk_1E36759B0;
  v11 = v8;
  v28 = v11;
  objc_msgSend(v10, "predicateWithBlock:", v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v13, "reverseObjectEnumerator", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "recipeID"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v21, "minusOrderedSet:", v14);

  return v21;
}

+ (id)generateAndStoreMissingExpectedLocalResourcesForAsset:(id)a3 versions:(id)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 reason:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;

  v16 = a3;
  v54 = a5;
  v17 = a6;
  v18 = a7;
  v52 = a8;
  v19 = a9;
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = a4;
  objc_msgSend(v20, "setWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "containsObject:", &unk_1E3760E00))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceGenerator.m"), 291, CFSTR("Generating adjusted versions is not currently supported"));

  }
  v53 = v18;
  v51 = v17;
  if (objc_msgSend(v22, "count") != 1
    && (objc_msgSend(v22, "count") != 2 || (objc_msgSend(v22, "containsObject:", &unk_1E3760DD0) & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceGenerator.m"), 292, CFSTR("Generating adjusted & unadjusted at the same time is not currently supported."));

  }
  v50 = v22;
  objc_msgSend((id)objc_opt_class(), "expectedLocalResourceRecipesForAsset:versions:", v16, v21);
  v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = (void *)v24;
  objc_msgSend(a1, "locallyUnavailableRecipesFromRecipes:versions:asset:", v24, v25, v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v27, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v27, "count"));
  v29 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v27, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v27, "count"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v16;
  v48 = v28;
  if (objc_msgSend(v27, "count"))
  {
    v46 = v19;
    v32 = v19;
    v33 = v51;
    v34 = v52;
    v45 = v28;
    v44 = v29;
    v35 = a1;
    v36 = v16;
    v37 = (void *)v29;
    v38 = v50;
    v39 = v54;
    v40 = v53;
    objc_msgSend(v35, "_continueGeneratingResourcesForAsset:versions:imageConversionClient:videoConversionClient:conversionServiceOptions:remainingRecipes:storedRecipes:attemptedRecipes:errorsEncountered:progress:reason:completion:", v36, v50, v54, v51, v53, v27, v44, v30, v31, v45, v52, v46, v47, v48);
  }
  else
  {
    objc_msgSend(v28, "setTotalUnitCount:", 1);
    objc_msgSend(v28, "setCompletedUnitCount:", objc_msgSend(v28, "totalUnitCount"));
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v19 + 2))(v19, 0, v41);

    v39 = v54;
    v40 = v53;
    v32 = v19;
    v33 = v51;
    v34 = v52;
    v37 = (void *)v29;
    v38 = v50;
  }

  return v48;
}

uint64_t __75__PLResourceGenerator_locallyUnavailableRecipesFromRecipes_versions_asset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if ((int)objc_msgSend(v3, "localAvailability") >= 1 && objc_msgSend(v3, "recipeID"))
  {
    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", objc_msgSend(v3, "recipeID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "version"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "containsObject:", v6);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __231__PLResourceGenerator__continueGeneratingResourcesForAsset_versions_imageConversionClient_videoConversionClient_conversionServiceOptions_remainingRecipes_storedRecipes_attemptedRecipes_errorsEncountered_progress_reason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = *(void **)(a1 + 32);
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "unionSet:", v10);
  objc_msgSend(*(id *)(a1 + 40), "unionSet:", v10);
  v11 = objc_msgSend(*(id *)(a1 + 48), "count");
  objc_msgSend(*(id *)(a1 + 48), "minusSet:", v10);

  v12 = v11 - objc_msgSend(*(id *)(a1 + 48), "count");
  v13 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v13, "minusSet:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "unionOrderedSet:", v13);
  objc_msgSend(*(id *)(a1 + 56), "setTotalUnitCount:", objc_msgSend(*(id *)(a1 + 56), "totalUnitCount") + objc_msgSend(v13, "count"));
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "completedUnitCount") + 1);
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", v12 + objc_msgSend(*(id *)(a1 + 56), "completedUnitCount"));
  if (v14)
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v14);
  objc_msgSend(*(id *)(a1 + 128), "_continueGeneratingResourcesForAsset:versions:imageConversionClient:videoConversionClient:conversionServiceOptions:remainingRecipes:storedRecipes:attemptedRecipes:errorsEncountered:progress:reason:completion:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120));

}

@end
