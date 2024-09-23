@implementation _PSPhotoUtils

+ (void)prewarmPhotosFrameworks
{
  if (prewarmPhotosFrameworks_prewarmOnce != -1)
    dispatch_once(&prewarmPhotosFrameworks_prewarmOnce, &__block_literal_global_27);
}

+ (id)assetsWithIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  id v25[2];

  v25[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v4 = (void *)getPHFetchOptionsClass_softClass;
  v24 = getPHFetchOptionsClass_softClass;
  if (!getPHFetchOptionsClass_softClass)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __getPHFetchOptionsClass_block_invoke;
    v19 = &unk_1E43FEA00;
    v20 = &v21;
    __getPHFetchOptionsClass_block_invoke((uint64_t)&v16);
    v4 = (void *)v22[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v5, "fetchOptionsWithInclusiveDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v7 = (id *)getPHAssetPropertySetSceneAnalysisSymbolLoc_ptr;
  v24 = getPHAssetPropertySetSceneAnalysisSymbolLoc_ptr;
  if (!getPHAssetPropertySetSceneAnalysisSymbolLoc_ptr)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __getPHAssetPropertySetSceneAnalysisSymbolLoc_block_invoke;
    v19 = &unk_1E43FEA00;
    v20 = &v21;
    __getPHAssetPropertySetSceneAnalysisSymbolLoc_block_invoke((uint64_t)&v16);
    v7 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v7)
  {
    -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    __break(1u);
  }
  v25[0] = *v7;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = v25[0];
  objc_msgSend(v8, "arrayWithObjects:count:", v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFetchPropertySets:", v10);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v11 = (void *)getPHAssetClass_softClass;
  v24 = getPHAssetClass_softClass;
  if (!getPHAssetClass_softClass)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __getPHAssetClass_block_invoke;
    v19 = &unk_1E43FEA00;
    v20 = &v21;
    __getPHAssetClass_block_invoke((uint64_t)&v16);
    v11 = (void *)v22[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v12, "fetchAssetsWithLocalIdentifiers:options:", v3, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchedObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)sceneAnalysisFromAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("blacklistedScenes"), CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v4, "arrayWithContentsOfURL:error:", v6, &v45);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v45;

  if (v8)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[_PSPhotoUtils sceneAnalysisFromAssets:].cold.1((uint64_t)v8, v9);
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v36 = objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v31 = v3;
    obj = v3;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v34)
    {
      v33 = *(_QWORD *)v42;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v42 != v33)
            objc_enumerationMutation(obj);
          v35 = v11;
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v11), "sceneClassifications");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v38 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                objc_msgSend(v17, "confidence");
                v19 = v18;
                v20 = objc_msgSend(v17, "sceneIdentifier");
                objc_msgSend(getPFSceneTaxonomyClass(), "sharedTaxonomy");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "nodeForSceneClassId:", v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22)
                {
                  objc_msgSend(v22, "name");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v7, "containsObject:", v23);

                  if ((v24 & 1) == 0)
                  {
                    objc_msgSend(v22, "highRecallThreshold");
                    if (v19 >= v25)
                    {
                      objc_msgSend(v22, "highPrecisionThreshold");
                      v27 = v26;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "stringValue");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v29 && v19 >= v27)
                        -[NSObject addObject:](v36, "addObject:", v29);

                    }
                  }
                }

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            }
            while (v14);
          }

          v11 = v35 + 1;
        }
        while (v35 + 1 != v34);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v34);
    }

    v9 = v36;
    -[NSObject allObjects](v36, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v3 = v31;
  }

  return v10;
}

+ (id)candidateContactsIdentifiersFromPhotoSuggestedPeople:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("contactIdentifier"), (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  return v4;
}

+ (id)candidateLocalIdentifiersFromPhotoSuggestedPeople:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("localIdentifier"), (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  return v4;
}

+ (void)sceneAnalysisFromAssets:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Error loading scene backlist = %@", (uint8_t *)&v2, 0xCu);
}

@end
