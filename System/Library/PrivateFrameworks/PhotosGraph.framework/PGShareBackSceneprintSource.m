@implementation PGShareBackSceneprintSource

- (PGShareBackSceneprintSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4
{
  id v7;
  PGShareBackSceneprintSource *v8;
  PGShareBackSceneprintSource *v9;
  NSCache *v10;
  NSCache *assetsInMomentCache;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGShareBackSceneprintSource;
  v8 = -[PGShareBackSource initWithLoggingConnection:](&v13, sel_initWithLoggingConnection_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photoLibrary, a4);
    v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    assetsInMomentCache = v9->_assetsInMomentCache;
    v9->_assetsInMomentCache = v10;

    -[NSCache setCountLimit:](v9->_assetsInMomentCache, "setCountLimit:", 50);
  }

  return v9;
}

- (BOOL)prepareSourceWithGraph:(id)a3
{
  return 1;
}

- (id)validInputsForSource:(id)a3 givenSuggesterResults:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "processingValue", (_QWORD)v15) & 8) != 0)
        {
          objc_msgSend(v12, "suggesterInputs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "removeObjectsInArray:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)getAssetsInMomentNode:(id)a3 inGraph:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSCache *assetsInMomentCache;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSCache *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  assetsInMomentCache = self->_assetsInMomentCache;
  objc_msgSend(v8, "localIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](assetsInMomentCache, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D77F18], "requiredFetchPropertySets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFetchPropertySets:", v14);

    objc_msgSend(v9, "momentForMomentNode:inPhotoLibrary:", v8, self->_photoLibrary);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v15, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(v17, "fetchedObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v18, "initWithArray:copyItems:", v19, 0);

      v20 = self->_assetsInMomentCache;
      objc_msgSend(v8, "localIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCache setObject:forKey:](v20, "setObject:forKey:", v12, v21);

    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Error while getting the PHMoment associated to moment node %@"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDescription:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (a5)
        *a5 = objc_retainAutorelease(v26);
      -[PGShareBackSource loggingConnection](self, "loggingConnection");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v26, "description");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v28;
        _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "[PGShareBackSceneprintSource] %@", buf, 0xCu);

      }
      v12 = 0;
    }
  }

  return v12;
}

- (BOOL)isSimilarSuggesterInput:(id)a3 toMomentNode:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v10 = a3;
  -[PGShareBackSceneprintSource getAssetsInMomentNode:inGraph:error:](self, "getAssetsInMomentNode:inGraph:error:", a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v10, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v14);

    if (objc_msgSend(v13, "count"))
    {
      v15 = (void *)MEMORY[0x1E0D77F18];
      objc_msgSend(v10, "asset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isAsset:similarToAnyAssets:withinThresholdType:", v16, v13, 2);

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  PGShareBackSuggesterResult *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id obj;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v39 = a5;
  if (objc_msgSend(v11, "count"))
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v12 = v10;
    v33 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    v13 = 0;
    if (!v33)
    {
      v15 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_27;
    }
    v14 = *(_QWORD *)v46;
    v15 = (void *)MEMORY[0x1E0C9AA60];
    v36 = v11;
    v37 = v10;
    v35 = v12;
    v32 = *(_QWORD *)v46;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v46 != v14)
          objc_enumerationMutation(v12);
        v34 = v16;
        v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v16);
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        obj = v11;
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        if (!v18)
          goto LABEL_17;
        v19 = v18;
        v20 = *(_QWORD *)v42;
        while (2)
        {
          v21 = 0;
          v22 = v13;
          do
          {
            if (*(_QWORD *)v42 != v20)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v21);
            v40 = v22;
            v24 = -[PGShareBackSceneprintSource isSimilarSuggesterInput:toMomentNode:inGraph:error:](self, "isSimilarSuggesterInput:toMomentNode:inGraph:error:", v17, v23, v39, &v40);
            v13 = v40;

            if (a6 && v13)
            {
              v13 = objc_retainAutorelease(v13);
              v15 = 0;
              *a6 = v13;
              v11 = v36;
              v10 = v37;
              v12 = v35;
              v25 = obj;
LABEL_26:

              goto LABEL_27;
            }
            if (v24)
            {
              -[PGShareBackSource loggingConnection](self, "loggingConnection");
              v26 = objc_claimAutoreleasedReturnValue();
              v10 = v37;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v17, "asset");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "uuid");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "uuid");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v50 = v28;
                v51 = 2112;
                v52 = v29;
                _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "[PGShareBackSceneprintSource] Input asset %@ is identified as having a common staging similarity to moment node %@", buf, 0x16u);

              }
              v12 = v35;
              v25 = obj;
              v30 = -[PGShareBackSuggesterResult initWithInputs:processingValue:momentNodes:]([PGShareBackSuggesterResult alloc], "initWithInputs:processingValue:momentNodes:", v35, 0x2000, obj);
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v30);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v11 = v36;
              goto LABEL_26;
            }
            ++v21;
            v22 = v13;
          }
          while (v19 != v21);
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
          v11 = v36;
          v10 = v37;
          v12 = v35;
          v15 = (void *)MEMORY[0x1E0C9AA60];
          if (v19)
            continue;
          break;
        }
LABEL_17:

        v16 = v34 + 1;
        v14 = v32;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (!v33)
      {
LABEL_27:

        goto LABEL_28;
      }
    }
  }
  v15 = (void *)MEMORY[0x1E0C9AA60];
LABEL_28:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsInMomentCache, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
