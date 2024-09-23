@implementation TRIFBClientTreatmentStorage

- (TRIFBClientTreatmentStorage)initWithPaths:(id)a3
{
  id v4;
  TRIRemoteAssetExtractor *v5;
  TRIFBClientTreatmentStorage *v6;

  v4 = a3;
  v5 = -[TRIRemoteAssetExtractor initWithMonitoredActivity:]([TRIRemoteAssetExtractor alloc], "initWithMonitoredActivity:", 0);
  v6 = -[TRIFBClientTreatmentStorage initWithPaths:extractor:](self, "initWithPaths:extractor:", v4, v5);

  return v6;
}

- (TRIFBClientTreatmentStorage)initWithPaths:(id)a3 extractor:(id)a4
{
  id v7;
  id v8;
  TRIFBClientTreatmentStorage *v9;
  TRIFBClientTreatmentStorage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIFBClientTreatmentStorage;
  v9 = -[TRIFBClientTreatmentStorage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_extractor, a4);
  }

  return v10;
}

- (void)useNamespaceIdInSchema:(BOOL)a3
{
  populateNamespaceIdInTreatmentSchema = a3;
}

- (id)loadTreatmentWithTreatmentId:(id)a3 isFilePresent:(BOOL *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D8232A5C]();
  if (a4)
    *a4 = 1;
  v8 = objc_alloc(MEMORY[0x1E0C99D50]);
  -[TRIFBClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v10 = (void *)objc_msgSend(v8, "initWithContentsOfURL:options:error:", v9, 1, &v21);
  v11 = v21;

  if (!v10)
  {
    objc_msgSend(v11, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 == (void *)*MEMORY[0x1E0CB28A8])
    {
      v18 = objc_msgSend(v11, "code");

      if (a4 && v18 == 260)
        *a4 = 0;
    }
    else
    {

    }
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[TRIFBClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v6;
      v24 = 2112;
      v25 = v20;
      v26 = 2114;
      v27 = v11;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Unable to read treatment with ID %@ from %@: %{public}@", buf, 0x20u);

    }
    goto LABEL_16;
  }
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A68]), "initVerifiedRootObjectFromData:", v10);
  if (!v12)
  {
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Failed to verify content of factor levels: %{public}@", buf, 0xCu);
    }

    v13 = 0;
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  v13 = v12;
  -[TRIFBClientTreatmentStorage _convertFastFactorLevelToClientTreatment:](self, "_convertFastFactorLevelToClientTreatment:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  objc_autoreleasePoolPop(v7);
  return v14;
}

- (id)saveTreatment:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
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
  char v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  __int128 v39;
  void *context;
  TRIFBClientTreatmentStorage *v41;
  NSObject *v42;
  void *v43;
  id obj;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  if (!objc_msgSend(v5, "hasTreatmentId")
    || (objc_msgSend(v5, "treatmentId"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        !v8))
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "TRIClientTreatmentArtifact has nil or empty treatmentId", buf, 2u);
    }
LABEL_40:
    v37 = 0;
    goto LABEL_41;
  }
  v9 = objc_msgSend(v5, "copy");
  if (-[NSObject factorLevelArray_Count](v9, "factorLevelArray_Count"))
  {
    v41 = self;
    v43 = v6;
    context = (void *)MEMORY[0x1D8232A5C]();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v42 = v9;
    -[NSObject factorLevelArray](v9, "factorLevelArray");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    v11 = 0;
    if (!v47)
      goto LABEL_33;
    v46 = *(_QWORD *)v49;
    *(_QWORD *)&v10 = 138543362;
    v39 = v10;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v49 != v46)
          objc_enumerationMutation(obj);
        v13 = v5;
        v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
        if (!v11)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v12), "factor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "namespaceName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRIClientFactorPackUtils aliasesInNamespace:](TRIClientFactorPackUtils, "aliasesInNamespace:", v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v14, "factor", v39);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (!v19)
        {
          objc_msgSend(v14, "factor");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "name");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v3;
        }
        objc_msgSend(v14, "factor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setName:", v20);

        if (!v19)
        {

        }
        v5 = v13;
        if (objc_msgSend(v14, "hasLevel"))
        {
          objc_msgSend(v14, "level");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "fileOrDirectoryLevelWithIsDir:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v13, "hasTreatmentId"))
          {
            if (objc_msgSend(v23, "hasAsset"))
            {
              objc_msgSend(v23, "asset");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "hasTreatmentId");

              if ((v25 & 1) == 0)
              {
                TRILogCategory_Server();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v13, "treatmentId");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "factor");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "name");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v53 = v32;
                  v54 = 2114;
                  v55 = v34;
                  _os_log_debug_impl(&dword_1D207F000, v26, OS_LOG_TYPE_DEBUG, "Populating treatmentId %@ on asset for \"%{public}@\", buf, 0x16u);

                  v5 = v13;
                }

                objc_msgSend(v5, "treatmentId");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "asset");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setTreatmentId:", v27);

              }
            }
          }
          if (objc_msgSend(v5, "hasTreatmentId") && objc_msgSend(v23, "hasAsset"))
          {
            objc_msgSend(v23, "asset");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v29, "hasCloudKitContainer") & 1) != 0)
              goto LABEL_29;
            v30 = objc_msgSend(v23, "isOnDemand");

            if (v30)
            {
              TRILogCategory_Server();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v14, "factor");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "name");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v39;
                v53 = v36;
                _os_log_debug_impl(&dword_1D207F000, v31, OS_LOG_TYPE_DEBUG, "Populating system default cloudKitContainer on asset for \"%{public}@\", buf, 0xCu);

              }
              objc_msgSend(v23, "asset");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setCloudKitContainer:", 1);
LABEL_29:

            }
          }

        }
        ++v12;
      }
      while (v47 != v12);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (!v47)
      {
LABEL_33:

        objc_autoreleasePoolPop(context);
        v9 = v42;
        v6 = v43;
        self = v41;
        break;
      }
    }
  }
  if (!-[TRIFBClientTreatmentStorage _linkAssetsUpdatingTreatment:](self, "_linkAssetsUpdatingTreatment:", v9)
    || !-[TRIFBClientTreatmentStorage _saveNamespacePartitionedTreatmentsForTreatment:forNamespaceNames:forRollouts:](self, "_saveNamespacePartitionedTreatmentsForTreatment:forNamespaceNames:forRollouts:", v9, 0, 0)|| !-[TRIFBClientTreatmentStorage _savePersistedTreatment:](self, "_savePersistedTreatment:", v9))
  {
    goto LABEL_40;
  }
  v9 = v9;
  v37 = v9;
LABEL_41:

  objc_autoreleasePoolPop(v6);
  return v37;
}

- (id)_convertFastFactorLevelToClientTreatment:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *context;
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1D8232A5C]();
  v5 = objc_alloc_init(MEMORY[0x1E0DC0EA8]);
  objc_msgSend(v4, "sourceAsTreatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  objc_msgSend(v5, "setTreatmentId:", v6);

  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "levels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  objc_msgSend(v4, "namespaceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceAsTreatmentId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFBClientTreatmentStorage _baseUrlForTreatment:namespaceName:](self, "_baseUrlForTreatment:namespaceName:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = v4;
  objc_msgSend(v4, "levels");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1D8232A5C](v13);
        v19 = (void *)MEMORY[0x1E0DC0AA8];
        objc_msgSend(v12, "path", context);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "convertFBFactorLevelToProtoFactorLevel:parentDir:namespaceName:isRelativePath:", v17, v20, v10, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "addObject:", v21);
        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v14 != v16);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v14 = v13;
    }
    while (v13);
  }

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", v9, 1);
  objc_msgSend(v25, "setFactorLevelArray:", v22);

  objc_autoreleasePoolPop(context);
  return v25;
}

- (id)updateSavedTreatmentWithTreatmentId:(id)a3 linkingNewAssetIds:(id)a4 forNamespaceNames:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v17;
  void *v18;
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D8232A5C]();
  v19 = 0;
  -[TRIFBClientTreatmentStorage loadTreatmentWithTreatmentId:isFilePresent:](self, "loadTreatmentWithTreatmentId:isFilePresent:", v8, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (!v19)
    {
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[TRIFBClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = (uint64_t)v18;
        _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "updateSavedTreatmentWithTreatmentId failed because preexisting treatment is not present: %@", buf, 0xCu);

      }
    }
    goto LABEL_12;
  }
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v17 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134218242;
    v21 = v17;
    v22 = 2112;
    v23 = v8;
    _os_log_debug_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEBUG, "Merging %tu assets for treatment %@.", buf, 0x16u);
  }

  if (!-[TRIFBClientTreatmentStorage _linkAssetsWithIds:updatingTreatment:](self, "_linkAssetsWithIds:updatingTreatment:", v9, v12)|| !-[TRIFBClientTreatmentStorage _saveNamespacePartitionedTreatmentsForTreatment:forNamespaceNames:forRollouts:](self, "_saveNamespacePartitionedTreatmentsForTreatment:forNamespaceNames:forRollouts:", v12, v10, 0)|| !-[TRIFBClientTreatmentStorage _savePersistedTreatment:](self, "_savePersistedTreatment:", v12))
  {
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  v14 = v12;
LABEL_13:

  objc_autoreleasePoolPop(v11);
  return v14;
}

- (BOOL)_linkAssetsWithIds:(id)a3 updatingTreatment:(id)a4
{
  id v6;
  TRIAssetStore *v7;
  TRIPaths *paths;
  TRIAssetExtracting *extractor;
  TRIRemoteAssetPatcher *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  TRIFBClientTreatmentStorage *v30;
  TRIAssetStore *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v6 = a4;
  v7 = [TRIAssetStore alloc];
  paths = self->_paths;
  extractor = self->_extractor;
  v30 = self;
  v10 = -[TRIRemoteAssetPatcher initWithMonitoredActivity:]([TRIRemoteAssetPatcher alloc], "initWithMonitoredActivity:", 0);
  v31 = -[TRIAssetStore initWithPaths:extractor:patcher:](v7, "initWithPaths:extractor:patcher:", paths, extractor, v10);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = v6;
  objc_msgSend(v6, "factorLevelArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(v16, "level");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileOrDirectoryLevelWithIsDir:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          if ((objc_msgSend(v19, "hasPath") & 1) == 0)
          {
            if (objc_msgSend(v19, "hasAsset"))
            {
              objc_msgSend(v19, "asset");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "hasAssetId");

              if (v21)
              {
                objc_msgSend(v19, "asset");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "assetId");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                TRIValidateAssetId();
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v24 && objc_msgSend(v33, "containsObject:", v24))
                {
                  objc_msgSend(v32, "treatmentId");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "factor");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TRIFBClientTreatmentStorage _linkAssetWithId:treatmentId:assetStore:factor:forRollouts:](v30, "_linkAssetWithId:treatmentId:assetStore:factor:forRollouts:", v24, v25, v31, v26, 0);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v27)
                  {

                    objc_autoreleasePoolPop(v17);
                    v28 = 0;
                    goto LABEL_19;
                  }
                  objc_msgSend(v19, "setPath:", v27);

                }
              }
            }
          }
        }

        objc_autoreleasePoolPop(v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v13)
        continue;
      break;
    }
  }
  v28 = 1;
LABEL_19:

  return v28;
}

- (id)_linkAssetWithId:(id)a3 treatmentId:(id)a4 assetStore:(id)a5 factor:(id)a6 forRollouts:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void *)MEMORY[0x1D8232A5C]();
  if (a7)
    -[TRIFBClientTreatmentStorage _defaultsAssetURLForFactor:](self, "_defaultsAssetURLForFactor:", v16);
  else
    -[TRIFBClientTreatmentStorage _assetURLForFactor:treatmentId:](self, "_assetURLForFactor:treatmentId:", v16, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URLByDeletingLastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 276, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[assetURL URLByDeletingLastPathComponent].path"));

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v20);
  objc_msgSend(v18, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 279, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetURL.path"));

  }
  if (objc_msgSend(v15, "linkAssetWithIdentifier:toCurrentPath:futurePath:", v13, v21, v21))
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  objc_autoreleasePoolPop(v17);
  return v23;
}

- (id)updateSavedTreatmentWithTreatmentId:(id)a3 deletingAssetsWithFactorNames:(id)a4 forNamespaceName:(id)a5 forRollouts:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  NSObject *v18;
  void *v20;
  char v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v6 = a6;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1D8232A5C]();
  v21 = 0;
  -[TRIFBClientTreatmentStorage loadTreatmentWithTreatmentId:isFilePresent:](self, "loadTreatmentWithTreatmentId:isFilePresent:", v10, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (!v21)
    {
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        -[TRIFBClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v20;
        _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "updateSavedTreatmentWithTreatmentId failed because preexisting treatment is not present: %@", buf, 0xCu);

      }
    }
    goto LABEL_9;
  }
  -[TRIFBClientTreatmentStorage _deleteOnDemandAssetsWithFactorNames:treatment:namespace:forRollouts:](self, "_deleteOnDemandAssetsWithFactorNames:treatment:namespace:forRollouts:", v11, v14, v12, v6);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v12, 0);
  v16 = -[TRIFBClientTreatmentStorage _saveNamespacePartitionedTreatmentsForTreatment:forNamespaceNames:forRollouts:](self, "_saveNamespacePartitionedTreatmentsForTreatment:forNamespaceNames:forRollouts:", v14, v15, v6);

  v17 = 0;
  if (v16)
  {
    if (-[TRIFBClientTreatmentStorage _savePersistedTreatment:](self, "_savePersistedTreatment:", v14))
    {
      v17 = v14;
      goto LABEL_10;
    }
LABEL_9:
    v17 = 0;
  }
LABEL_10:

  objc_autoreleasePoolPop(v13);
  return v17;
}

- (BOOL)removeUnreferencedTreatmentsWithRemovedCount:(unsigned int *)a3
{
  void *v4;
  TRITempDirScopeGuard *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
  int v28;
  __int128 v30;
  void *context;
  TRINamespaceDescriptorSetStorage *v32;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  uint64_t *v40;
  __int128 *p_buf;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  __int128 buf;
  uint64_t v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[TRIFBClientTreatmentStorage _collectTreatments](self, "_collectTreatments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [TRITempDirScopeGuard alloc];
    -[TRIPaths localTempDir](self->_paths, "localTempDir");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TRITempDirScopeGuard initWithPath:](v5, "initWithPath:", v6);

    v34 = (void *)v7;
    if (v7)
    {
      v32 = -[TRINamespaceDescriptorSetStorage initWithPaths:]([TRINamespaceDescriptorSetStorage alloc], "initWithPaths:", self->_paths);
      -[TRINamespaceDescriptorSetStorage parentDirForNamespaceDescriptorSets](v32, "parentDirForNamespaceDescriptorSets");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "fileExistsAtPath:", v35);

      if ((v9 & 1) != 0)
      {
        v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        context = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v35, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v11, 0, 0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(v12, "nextObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          *(_QWORD *)&v15 = 138412290;
          v30 = v15;
          do
          {
            objc_msgSend(v14, "path", v30);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "hasSuffix:", CFSTR(".plist"));

            if (v17)
            {
              v18 = (void *)MEMORY[0x1E0C99D80];
              objc_msgSend(v14, "path");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "dictionaryWithContentsOfFile:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0AD8]), "initWithDictionary:", v20);
                -[NSObject factorsURL](v21, "factorsURL");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "path");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "stringByDeletingLastPathComponent");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "addObject:", v24);

              }
              else
              {
                TRILogCategory_Server();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v14, "path");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(buf) = v30;
                  *(_QWORD *)((char *)&buf + 4) = v25;
                  _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "failed to parse dictionary from file: %@", (uint8_t *)&buf, 0xCu);

                }
              }

            }
            objc_autoreleasePoolPop(v13);
            v13 = (void *)MEMORY[0x1D8232A5C]();
            objc_msgSend(v12, "nextObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          while (v14);
        }
        objc_autoreleasePoolPop(v13);

        objc_autoreleasePoolPop(context);
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v47 = 0x2020000000;
        v48 = 0;
        v42 = 0;
        v43 = &v42;
        v44 = 0x2020000000;
        v45 = 1;
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __76__TRIFBClientTreatmentStorage_removeUnreferencedTreatmentsWithRemovedCount___block_invoke;
        v37[3] = &unk_1E9335E98;
        v27 = v36;
        v38 = v27;
        v40 = &v42;
        v39 = v34;
        p_buf = &buf;
        v28 = objc_msgSend(v4, "enumerateStringsWithBlock:", v37);
        if (a3)
          *a3 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);
        if (v28)
          v26 = *((_BYTE *)v43 + 24) != 0;
        else
          v26 = 0;

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&buf, 8);
      }
      else
      {
        TRILogCategory_Server();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v35;
          _os_log_impl(&dword_1D207F000, v27, OS_LOG_TYPE_DEFAULT, "Experiment namespace descriptor directory does not exist at %{public}@", (uint8_t *)&buf, 0xCu);
        }
        v26 = 1;
      }

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

void __76__TRIFBClientTreatmentStorage_removeUnreferencedTreatmentsWithRemovedCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Treatment managed-dir %@ is referenced. Looking to see if there are any deferred-deletion items to remove", (uint8_t *)&v12, 0xCu);
    }

    v5 = +[TRIReferenceManagedDir collectDeferredDeletionItemsWithManagedDir:](TRIReferenceManagedDir, "collectDeferredDeletionItemsWithManagedDir:", v3);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_BYTE *)(v6 + 24))
      v7 = v5;
    else
      v7 = 0;
    *(_BYTE *)(v6 + 24) = v7;
  }
  else
  {
    LOBYTE(v12) = 0;
    objc_msgSend(*(id *)(a1 + 40), "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[TRIReferenceManagedDir collectGarbageForManagedDir:withExternalReferenceStore:usingTempDir:managedDirWasDeleted:](TRIReferenceManagedDir, "collectGarbageForManagedDir:withExternalReferenceStore:usingTempDir:managedDirWasDeleted:", v3, 0, v8, &v12);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_BYTE *)(v10 + 24))
      v11 = v9;
    else
      v11 = 0;
    *(_BYTE *)(v10 + 24) = v11;

    if ((_BYTE)v12)
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }

}

- (id)_collectTreatments
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  id v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (v3)
  {
    -[TRIPaths treatmentsDir](self->_paths, "treatmentsDir");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    v40 = (void *)v4;
    objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v50);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v50;

    if (v6)
    {
      v35 = v7;
      v37 = v3;
      v43 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v36 = v6;
      obj = v6;
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v41)
      {
        v39 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v47 != v39)
              objc_enumerationMutation(obj);
            v9 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            v10 = (void *)MEMORY[0x1D8232A5C]();
            objc_msgSend(v40, "stringByAppendingPathComponent:", v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            buf[0] = 0;
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v11, buf);

            if (buf[0])
            {
              v42 = v10;
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 1);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v14, 0, 1, 0);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v16 = (void *)MEMORY[0x1D8232A5C]();
              objc_msgSend(v15, "nextObject");
              v17 = objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                v18 = (void *)v17;
                while (1)
                {
                  objc_msgSend(v18, "URLByAppendingPathComponent:", CFSTR("treatment.fb"), v35);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "path");
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (v20)
                  {
                    v21 = (void *)v20;
                    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "path");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = objc_msgSend(v22, "fileExistsAtPath:", v23);

                    if (!v24)
                      break;
                  }
                  objc_msgSend(v18, "path");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v25)
                  {
                    objc_msgSend(v18, "path");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "addObject:", v26);

                  }
                  objc_autoreleasePoolPop(v16);
                  v16 = (void *)MEMORY[0x1D8232A5C]();
                  objc_msgSend(v15, "nextObject");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v18)
                    goto LABEL_18;
                }

              }
LABEL_18:
              objc_autoreleasePoolPop(v16);

              v10 = v42;
            }

            objc_autoreleasePoolPop(v10);
          }
          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v41);
      }

      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __49__TRIFBClientTreatmentStorage__collectTreatments__block_invoke;
      v44[3] = &unk_1E9335EC0;
      v3 = v37;
      v27 = v37;
      v45 = v27;
      objc_msgSend(v43, "enumerateObjectsUsingBlock:", v44);
      v28 = v27;

      v7 = v35;
      v6 = v36;
      goto LABEL_32;
    }
    objc_msgSend(v7, "domain");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29 == (void *)*MEMORY[0x1E0CB28A8])
    {
      v31 = objc_msgSend(v7, "code");

      if (v31 == 260)
      {
        TRILogCategory_Server();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v53 = v40;
          _os_log_impl(&dword_1D207F000, v32, OS_LOG_TYPE_DEFAULT, "Treatments folder does not exist at %{public}@. Treating as empty", buf, 0xCu);
        }

        v28 = v3;
        goto LABEL_32;
      }
    }
    else
    {

    }
    TRILogCategory_Server();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v53 = v40;
      v54 = 2112;
      v55 = v7;
      _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "Unable to gather contents of treatment directory %{public}@: %@", buf, 0x16u);
    }

    v28 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v28 = 0;
LABEL_33:

  return v28;
}

void __49__TRIFBClientTreatmentStorage__collectTreatments__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "addString:", v3) & 1) == 0)
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "Failed to add string %@ to file-backed mutable array", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (BOOL)removeTreatmentFromLayer:(unint64_t)a3 withNamespaceName:(id)a4 upgradeNCVs:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  BOOL v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  char v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  int v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if ((uint64_t)a3 <= 3)
  {
    if (a3 == 1)
    {
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        TRILoggedNamespaceName(v8);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v32;
        _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "cannot remove treatment from 'installed' layer for namespace %{public}@", buf, 0xCu);

      }
      goto LABEL_18;
    }
    if (a3 != 2)
      goto LABEL_18;
    -[TRIPaths namespaceDescriptorsRolloutDir](self->_paths, "namespaceDescriptorsRolloutDir");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 4)
    {
LABEL_5:
      -[TRIPaths namespaceDescriptorsExperimentDir](self->_paths, "namespaceDescriptorsExperimentDir");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (a3 != 16)
    {
      if (a3 == 32)
        goto LABEL_5;
LABEL_18:
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v41) = a3;
        _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "cannot remove treatment from unknown treatment layer %u", buf, 8u);
      }
      v19 = 0;
      goto LABEL_44;
    }
    -[TRIPaths namespaceDescriptorsBMLTDir](self->_paths, "namespaceDescriptorsBMLTDir");
    v10 = objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  v11 = v10;
  if (!v10)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0DC0AD8], "loadWithNamespaceName:fromDirectory:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DC0AE0], "factorProviderWithNamespaceDescriptor:paths:faultOnMissingFactors:shouldLockFactorDirectory:", v12, self->_paths, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a3 == 4)
    {
      objc_msgSend(v13, "treatmentId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v14, "treatmentId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[TRIFBClientTreatmentStorage removeTreatmentWithTreatmentId:](self, "removeTreatmentWithTreatmentId:", v16);

      }
      else
      {
        v17 = 1;
      }
    }
    else if (v9)
    {
      v34 = v13;
      v20 = objc_msgSend(v13, "namespaceCompatibilityVersion");
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v35 = v9;
      v21 = v9;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v37 != v24)
              objc_enumerationMutation(v21);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "intValue") > v20)
            {
              TRILogCategory_Server();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                TRILoggedNamespaceName(v8);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v41 = v33;
                v42 = 2112;
                v43 = v21;
                v44 = 1024;
                v45 = v20;
                _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "Error for namespace %{public}@. Every element of Namespace Upgrade Compatibility Versions %@ must be less than or equal to the current rollout Namespace Compatibility Version %u", buf, 0x1Cu);

              }
              v19 = 0;
              v9 = v35;
              goto LABEL_43;
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
          if (v23)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v21, "containsObject:", v26);

      v17 = (v27 & 1) != 0
         || -[TRIFBClientTreatmentStorage _removeFactorsWithDescriptor:descriptorDir:treatmentLayer:namespaceName:](self, "_removeFactorsWithDescriptor:descriptorDir:treatmentLayer:namespaceName:", v12, v11, a3, v8);
      TRILogCategory_Server();
      v29 = objc_claimAutoreleasedReturnValue();
      v14 = v34;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        TRILoggedNamespaceName(v8);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v30;
        v42 = 2114;
        v43 = v21;
        _os_log_impl(&dword_1D207F000, v29, OS_LOG_TYPE_DEFAULT, "Not deleting rollout for namespace %{public}@ due to upgrade NCVS %{public}@", buf, 0x16u);

      }
      v9 = v35;
    }
    else
    {
      v17 = -[TRIFBClientTreatmentStorage _removeFactorsWithDescriptor:descriptorDir:treatmentLayer:namespaceName:](self, "_removeFactorsWithDescriptor:descriptorDir:treatmentLayer:namespaceName:", v12, v11, a3, v8);
    }

    v19 = v17;
  }
  else
  {
    v19 = 1;
  }
LABEL_43:

LABEL_44:
  return v19;
}

- (BOOL)removeTreatmentWithTreatmentId:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v25;
  id v26;
  char v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v27 = 0;
  -[TRIFBClientTreatmentStorage loadTreatmentWithTreatmentId:isFilePresent:](self, "loadTreatmentWithTreatmentId:isFilePresent:", v5, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "factorLevelArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "factor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "namespaceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[TRIFBClientTreatmentStorage _removeFactorsWithTreatmentId:namespaceName:](self, "_removeFactorsWithTreatmentId:namespaceName:", v5, v12);

    if (v13)
    {
      -[TRIFBClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 552, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("artifactPath"));

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      v17 = objc_msgSend(v16, "triForceRemoveItemAtPath:error:", v15, &v26);
      v18 = v26;

      if ((v17 & 1) != 0)
        goto LABEL_6;
      objc_msgSend(v18, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20 == (void *)*MEMORY[0x1E0CB28A8])
      {
        v22 = objc_msgSend(v18, "code");

        if (v22 == 4)
        {
LABEL_6:
          v19 = 1;
LABEL_15:

          goto LABEL_16;
        }
      }
      else
      {

      }
      TRILogCategory_Server();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v18;
        _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "Failed to remove artifact: %{public}@", buf, 0xCu);
      }

      v19 = 0;
      goto LABEL_15;
    }
    v19 = 0;
  }
  else
  {
    v19 = v27 == 0;
  }
LABEL_16:

  objc_autoreleasePoolPop(v6);
  return v19;
}

- (BOOL)_removeFactorsWithTreatmentId:(id)a3 namespaceName:(id)a4
{
  TRIFBClientTreatmentStorage *v4;
  void *v5;

  v4 = self;
  -[TRIFBClientTreatmentStorage urlForFactorsWithTreatmentId:namespaceName:](self, "urlForFactorsWithTreatmentId:namespaceName:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = -[TRIFBClientTreatmentStorage _removeFactorsWithURL:](v4, "_removeFactorsWithURL:", v5);

  return (char)v4;
}

- (BOOL)_removeFactorsWithDescriptor:(id)a3 descriptorDir:(id)a4 treatmentLayer:(unint64_t)a5 namespaceName:(id)a6
{
  int v7;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  _DWORD v18[2];
  __int16 v19;
  void *v20;
  uint64_t v21;

  v7 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = objc_msgSend(v10, "removeFromDirectory:", a4);
  objc_msgSend(v10, "factorsURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v10, "factorsURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 &= -[TRIFBClientTreatmentStorage _removeFactorsWithURL:](self, "_removeFactorsWithURL:", v14);

  }
  else
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      TRILoggedNamespaceName(v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = 67109378;
      v18[1] = v7;
      v19 = 2114;
      v20 = v17;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "descriptor in layer %u is missing factors URL for namespace %{public}@", (uint8_t *)v18, 0x12u);

    }
  }

  return v12;
}

- (BOOL)_removeFactorsWithURL:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint8_t buf[4];
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 596, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorsURL"));

  }
  -[NSObject triPathAsOwner:](v5, "triPathAsOwner:", 0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v5 = v7;
      -[NSObject URLByDeletingLastPathComponent](v7, "URLByDeletingLastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 618, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentURL"));

      }
      objc_msgSend(v8, "triPathAsOwner:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 620, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentPath"));

      }
      v24 = 0;
      -[NSObject path](v5, "path");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        -[NSObject path](v5, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[TRIReferenceManagedDir isPathInManagedDir:](TRIReferenceManagedDir, "isPathInManagedDir:", v12))
        {
          -[NSObject path](v5, "path");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 1;
          v15 = +[TRIReferenceManagedDir removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:](TRIReferenceManagedDir, "removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:", v13, 1, &v24);

          if (!v15)
          {
            TRILogCategory_Server();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v26 = v6;
              _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Failed to remove factors path %{public}@ in managed dir", buf, 0xCu);
            }

            v14 = 0;
          }
          goto LABEL_27;
        }

      }
      v14 = 1;
LABEL_27:

      goto LABEL_28;
    }
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = 0;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Failed to resolve url: %{public}@", buf, 0xCu);
    }
    goto LABEL_24;
  }
  v17 = -[NSObject triIsContainerURL](v5, "triIsContainerURL");
  TRILogCategory_Server();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v5;
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Failed to resolve url: %{public}@", buf, 0xCu);
    }

LABEL_24:
    v14 = 0;
    goto LABEL_28;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v5;
    _os_log_impl(&dword_1D207F000, v19, OS_LOG_TYPE_DEFAULT, "Failed to resolve container url: %{public}@", buf, 0xCu);
  }

  v14 = 1;
LABEL_28:

  return v14;
}

- (id)urlForFactorsWithTreatmentId:(id)a3 namespaceName:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[TRIFBClientTreatmentStorage _baseUrlForTreatment:namespaceName:](self, "_baseUrlForTreatment:namespaceName:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = CFSTR("treatment.fb");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPathComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 637, CFSTR("urlForFactorsWithTreatmentId is nil"));

  }
  return v10;
}

- (id)urlForDefaultFactorsWithNamespaceName:(id)a3
{
  return -[TRIFBClientTreatmentStorage urlForFactorsWithTreatmentId:namespaceName:](self, "urlForFactorsWithTreatmentId:namespaceName:", CFSTR("defaults"), a3);
}

- (BOOL)_savePersistedTreatment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  BOOL v17;
  NSObject *v18;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v5, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFBClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 650, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentDirURL"));

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v22);
  v12 = v22;

  if ((v11 & 1) == 0)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Failed to create directory: %{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(v8, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14
    && (objc_msgSend(v8, "path"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = -[TRIFBClientTreatmentStorage _writeFactorLevelsToDisk:namespaceName:writeToPath:](self, "_writeFactorLevelsToDisk:namespaceName:writeToPath:", v5, CFSTR("0"), v15), v15, v16))
  {
    v17 = 1;
  }
  else
  {
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "treatmentId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v20;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Unable to write persisted treatment for treatment id:%@", buf, 0xCu);

    }
    v17 = 0;
  }

  objc_autoreleasePoolPop(v6);
  return v17;
}

- (BOOL)_deleteOnDemandAssetsWithFactorNames:(id)a3 treatment:(id)a4 namespace:(id)a5 forRollouts:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  SEL v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  id v64;
  id v65;
  void *v66;
  TRIFBClientTreatmentStorage *v67;
  void *v68;
  id v69;
  unsigned int v70;
  char v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  int buf;
  void *v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  uint64_t v87;

  v63 = a6;
  v87 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "treatmentId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = self;
  v61 = v11;
  -[TRIFBClientTreatmentStorage _baseUrlForTreatment:namespaceName:](self, "_baseUrlForTreatment:namespaceName:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v62 = v10;
  objc_msgSend(v10, "factorLevelArray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
  if (!v15)
  {
    LOBYTE(v18) = 1;
    goto LABEL_40;
  }
  v16 = v15;
  v60 = a2;
  v17 = *(_QWORD *)v78;
  v18 = 1;
  v68 = v14;
  do
  {
    v19 = 0;
    do
    {
      if (*(_QWORD *)v78 != v17)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v19);
      v21 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v20, "level");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fileOrDirectoryLevelWithIsDir:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        objc_msgSend(v20, "level");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "levelOneOfCase");

        if (v33 != 104)
          goto LABEL_27;
        objc_msgSend(v20, "level");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "mobileAssetReferenceValue");
        v24 = objc_claimAutoreleasedReturnValue();

        if (!-[NSObject isOnDemand](v24, "isOnDemand"))
          goto LABEL_26;
        v70 = v18;
        objc_msgSend(v20, "factor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v69, "containsObject:", v36);

        if (v37)
        {
          v38 = (void *)objc_opt_class();
          objc_msgSend(v20, "factor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "name");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "relPathForMAReferenceWithFactorName:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v66, "stringByAppendingPathComponent:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v40) = objc_msgSend(v43, "fileExistsAtPath:", v42);

          if ((_DWORD)v40)
          {
            objc_msgSend(v64, "addObject:", v42);
            v44 = (void *)objc_opt_new();
            v76 = 0;
            v45 = objc_msgSend(v44, "writeToFile:options:error:", v42, 0x10000000, &v76);
            v65 = v76;

            if ((v45 & 1) == 0)
            {
              TRILogCategory_Server();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                buf = 138543362;
                v83 = v42;
                _os_log_error_impl(&dword_1D207F000, v46, OS_LOG_TYPE_ERROR, "Unable to nil out MARef by creating a blank file at %{public}@", (uint8_t *)&buf, 0xCu);
              }

            }
          }

        }
        v18 = v70;
        goto LABEL_25;
      }
      if (!objc_msgSend(v23, "hasAsset"))
        goto LABEL_27;
      objc_msgSend(v23, "asset");
      v24 = objc_claimAutoreleasedReturnValue();
      if (!-[NSObject hasCloudKitIndex](v24, "hasCloudKitIndex"))
        goto LABEL_26;
      v25 = objc_msgSend(v23, "hasPath");

      if (!v25)
        goto LABEL_27;
      v26 = v18;
      objc_msgSend(v20, "factor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v69, "containsObject:", v28);

      if (v29)
      {
        if ((objc_msgSend(v23, "isOnDemand") & 1) != 0)
        {
          objc_msgSend(v20, "factor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v63)
          {
            -[TRIFBClientTreatmentStorage _defaultsAssetURLForFactor:](v67, "_defaultsAssetURLForFactor:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v62, "treatmentId");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRIFBClientTreatmentStorage _assetURLForFactor:treatmentId:](v67, "_assetURLForFactor:treatmentId:", v30, v47);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v18 = v26;

          objc_msgSend(v31, "path");
          v24 = objc_claimAutoreleasedReturnValue();
          v14 = v68;
          if (!v24)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", v60, v67, CFSTR("TRIFBClientTreatmentStorage.m"), 711, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

          }
          objc_msgSend(v64, "addObject:", v24);
          objc_msgSend(v23, "setPath:", 0);
          goto LABEL_26;
        }
        TRILogCategory_Server();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v20, "factor");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "name");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "treatmentId");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          buf = 138543618;
          v83 = v49;
          v84 = 2112;
          v85 = v50;
          _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "Factor %{public}@ for treatment %@ is not on-demand.", (uint8_t *)&buf, 0x16u);

        }
        v18 = 0;
LABEL_25:
        v14 = v68;
LABEL_26:

        goto LABEL_27;
      }
      v18 = v26;
      v14 = v68;
LABEL_27:

      objc_autoreleasePoolPop(v21);
      ++v19;
    }
    while (v16 != v19);
    v52 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    v16 = v52;
  }
  while (v52);
LABEL_40:

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v53 = v64;
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v73 != v56)
          objc_enumerationMutation(v53);
        v58 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        v71 = 0;
        if (!+[TRIReferenceManagedDir removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:](TRIReferenceManagedDir, "removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:", v58, 1, &v71))
        {
          TRILogCategory_Server();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
          {
            buf = 138543362;
            v83 = v58;
            _os_log_error_impl(&dword_1D207F000, (os_log_t)v18, OS_LOG_TYPE_ERROR, "Failed to remove file %{public}@ in managed dir", (uint8_t *)&buf, 0xCu);
          }

          LOBYTE(v18) = 0;
        }
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    }
    while (v55);
  }

  return v18 & 1;
}

- (BOOL)_linkAssetsUpdatingTreatment:(id)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  NSObject *v29;
  int v30;
  char v31;
  void *v32;
  int v33;
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
  uint64_t v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  char v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  BOOL v64;
  BOOL v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  NSObject *v80;
  NSObject *v81;
  SEL v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  TRIFBClientTreatmentStorage *v87;
  void *v88;
  TRIAssetStore *v89;
  NSObject *v90;
  uint64_t v91;
  uint64_t v92;
  void *context;
  id v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t buf[4];
  NSObject *v101;
  __int16 v102;
  NSObject *v103;
  __int16 v104;
  void *v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v89 = -[TRIAssetStore initWithPaths:]([TRIAssetStore alloc], "initWithPaths:", self->_paths);
  -[NSObject factorLevelArray](v5, "factorLevelArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject treatmentId](v5, "treatmentId");
      v66 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v101 = v66;
      _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "Treatment %@ has no factor levels. Proceeding without linking assets.", buf, 0xCu);

    }
    v65 = 1;
    goto LABEL_73;
  }
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[NSObject factorLevelArray](v5, "factorLevelArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
  if (!v92)
  {

LABEL_56:
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[NSObject treatmentId](v5, "treatmentId");
      v67 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v101 = v67;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Unable to find a namespace name from factor levels in treatment %{public}@", buf, 0xCu);

    }
LABEL_72:
    v65 = 0;
    goto LABEL_73;
  }
  v82 = a2;
  v87 = self;
  v9 = 0;
  v91 = *(_QWORD *)v97;
  v86 = v5;
  v88 = v8;
  do
  {
    v10 = 0;
    v11 = v9;
    do
    {
      if (*(_QWORD *)v97 != v91)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v10);
      context = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v12, "factor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "namespaceName");
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "level");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileOrDirectoryLevelWithIsDir:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(v12, "level");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "levelOneOfCase");

        if (v33 == 104)
        {
          v90 = v9;
          objc_msgSend(v12, "factor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "namespaceString");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v35)
          {
            TRILogCategory_Server();
            v20 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              goto LABEL_65;
            -[NSObject treatmentId](v5, "treatmentId");
            v68 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "factor");
            v69 = objc_claimAutoreleasedReturnValue();
            -[NSObject name](v69, "name");
            v70 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v101 = v68;
            v102 = 2114;
            v103 = v70;
            _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has factor %{public}@ with missing namespaceString.", buf, 0x16u);
            goto LABEL_75;
          }
          objc_msgSend(v12, "level");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "mobileAssetReferenceValue");
          v20 = objc_claimAutoreleasedReturnValue();

          if (!-[NSObject hasAssetType](v20, "hasAssetType")
            || !-[NSObject hasAssetSpecifier](v20, "hasAssetSpecifier")
            || (-[NSObject hasAssetVersion](v20, "hasAssetVersion") & 1) == 0)
          {
            TRILogCategory_Server();
            v68 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
LABEL_59:

              goto LABEL_65;
            }
            -[NSObject treatmentId](v5, "treatmentId");
            v69 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "factor");
            v70 = objc_claimAutoreleasedReturnValue();
            -[NSObject name](v70, "name");
            v80 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v101 = v69;
            v102 = 2114;
            v103 = v80;
            _os_log_error_impl(&dword_1D207F000, v68, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has factor %{public}@ with incomplete MobileAssetReference.", buf, 0x16u);

LABEL_75:
            v8 = v88;

            goto LABEL_59;
          }
          objc_msgSend(v12, "factor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject treatmentId](v5, "treatmentId");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "namespaceName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIFBClientTreatmentStorage _baseUrlForTreatment:namespaceName:](v87, "_baseUrlForTreatment:namespaceName:", v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v83 = v40;
          objc_msgSend(v40, "path");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v41)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", v82, v87, CFSTR("TRIFBClientTreatmentStorage.m"), 845, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("targetURL.path"));

          }
          v42 = (void *)objc_opt_class();
          v85 = v37;
          objc_msgSend(v37, "name");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "relPathForMAReferenceWithFactorName:", v43);
          v44 = objc_claimAutoreleasedReturnValue();

          v84 = (void *)v44;
          objc_msgSend(v41, "stringByAppendingPathComponent:", v44);
          v45 = objc_claimAutoreleasedReturnValue();
          -[NSObject stringByDeletingLastPathComponent](v45, "stringByDeletingLastPathComponent");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_alloc(MEMORY[0x1E0DC0AB0]);
          -[NSObject assetType](v20, "assetType");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject assetSpecifier](v20, "assetSpecifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject assetVersion](v20, "assetVersion");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)objc_msgSend(v47, "initWithType:specifier:version:", v48, v49, v50);

          objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v46);
          if (-[NSObject hasIsFileFactor](v20, "hasIsFileFactor"))
            v52 = -[NSObject isFileFactor](v20, "isFileFactor");
          else
            v52 = 0;
          v5 = v86;
          if (!-[TRIAssetStore referenceMAAutoAssetWithId:isFileFactor:usingCurrentPath:futurePath:](v89, "referenceMAAutoAssetWithId:isFileFactor:usingCurrentPath:futurePath:", v51, v52, v45, v45))
          {
            TRILogCategory_Server();
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v101 = v45;
              _os_log_error_impl(&dword_1D207F000, v71, OS_LOG_TYPE_ERROR, "Unable to reference maAutoAsset at %{public}@", buf, 0xCu);
            }

            v8 = v88;
LABEL_65:
            v72 = context;
LABEL_70:

            objc_autoreleasePoolPop(v72);
            v9 = v90;
LABEL_71:

            goto LABEL_72;
          }

          v9 = v90;
          v8 = v88;
        }
LABEL_38:

        objc_autoreleasePoolPop(context);
        goto LABEL_39;
      }
      if (!objc_msgSend(v15, "hasAsset"))
        goto LABEL_38;
      objc_msgSend(v15, "asset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hasAssetId");

      if (!v17)
        goto LABEL_38;
      v90 = v9;
      objc_msgSend(v15, "asset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "assetId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateAssetId();
      v20 = objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        TRILogCategory_Server();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          -[NSObject treatmentId](v5, "treatmentId");
          v74 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "asset");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "assetId");
          v76 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "factor");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "name");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v101 = v74;
          v102 = 2114;
          v103 = v76;
          v104 = 2114;
          v105 = v78;
          _os_log_error_impl(&dword_1D207F000, v73, OS_LOG_TYPE_ERROR, "Treatment %@ has unsuitable asset id \"%{public}@\" for factor %{public}@.", buf, 0x20u);

          v8 = v88;
          goto LABEL_77;
        }
LABEL_69:
        v72 = context;

        goto LABEL_70;
      }
      if ((objc_msgSend(v12, "hasFactor") & 1) == 0)
      {
        TRILogCategory_Server();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          -[NSObject treatmentId](v5, "treatmentId");
          v74 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v101 = v74;
          _os_log_error_impl(&dword_1D207F000, v73, OS_LOG_TYPE_ERROR, "Treatment %@ has missing factor.", buf, 0xCu);
LABEL_77:

        }
        goto LABEL_69;
      }
      objc_msgSend(v12, "factor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject treatmentId](v5, "treatmentId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIFBClientTreatmentStorage _assetURLForFactor:treatmentId:](v87, "_assetURLForFactor:treatmentId:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", v82, v87, CFSTR("TRIFBClientTreatmentStorage.m"), 797, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("targetURL.path"));

      }
      objc_msgSend(v24, "stringByDeletingLastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = 0;
      v27 = objc_msgSend(v26, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v25, 1, 0, &v95);
      v28 = v95;

      if ((v27 & 1) == 0)
      {
        TRILogCategory_Server();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v101 = v28;
          _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Failed to create directory for factor: %{public}@", buf, 0xCu);
        }

      }
      if (objc_msgSend(v15, "hasIsOnDemand")
        && objc_msgSend(v15, "isOnDemand")
        && !-[TRIAssetStore hasAssetWithIdentifier:type:](v89, "hasAssetWithIdentifier:type:", v20, 0))
      {
        v31 = 0;
        v30 = 1;
      }
      else if (-[TRIAssetStore linkAssetWithIdentifier:toPath:](v89, "linkAssetWithIdentifier:toPath:", v20, v24))
      {
        objc_msgSend(v15, "setPath:", v24);
        v30 = 0;
        v31 = 1;
      }
      else
      {
        v31 = 0;
        v30 = 0;
      }

      v5 = v86;
      v9 = v90;
      v8 = v88;
      if ((v31 & 1) != 0)
        goto LABEL_38;

      objc_autoreleasePoolPop(context);
      if (!v30)
        goto LABEL_71;
LABEL_39:
      ++v10;
      v11 = v9;
    }
    while (v92 != v10);
    v55 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
    v92 = v55;
  }
  while (v55);

  if (!v9)
    goto LABEL_56;
  -[NSObject treatmentId](v5, "treatmentId");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFBClientTreatmentStorage _baseUrlForTreatment:namespaceName:](v87, "_baseUrlForTreatment:namespaceName:", v56, v9);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "path");
  v58 = objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = 0;
    v60 = objc_msgSend(v59, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v58, 1, 0, &v94);
    v61 = v94;

    if ((v60 & 1) == 0)
    {
      TRILogCategory_Server();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v101 = v58;
        v102 = 2114;
        v103 = v61;
        _os_log_error_impl(&dword_1D207F000, v62, OS_LOG_TYPE_ERROR, "Failed to create directory for treatment at %{public}@: %{public}@", buf, 0x16u);
      }

    }
    v63 = v58;
    v64 = +[TRIReferenceManagedDir createFromDir:](TRIReferenceManagedDir, "createFromDir:", v63);

    if (v64)
    {
      v65 = 1;
      goto LABEL_84;
    }
    TRILogCategory_Server();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v101 = v63;
      _os_log_error_impl(&dword_1D207F000, v81, OS_LOG_TYPE_ERROR, "Failed to create reference-managed directory at %{public}@ for factor", buf, 0xCu);
    }

  }
  else
  {
    TRILogCategory_Server();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v101 = v5;
      _os_log_error_impl(&dword_1D207F000, v61, OS_LOG_TYPE_ERROR, "Could not get base URL path for treatment %{public}@", buf, 0xCu);
    }
  }
  v65 = 0;
LABEL_84:

LABEL_73:
  return v65;
}

+ (id)relPathForMAReferenceWithFactorName:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "triFilenameForFactorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("maRefs"), "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_saveNamespacePartitionedTreatmentsForTreatment:(id)a3 forNamespaceNames:(id)a4 forRollouts:(BOOL)a5
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  void *v24;
  void *v25;
  id obj;
  _QWORD v27[5];
  id v28;
  __int128 *p_buf;
  SEL v30;
  BOOL v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 buf;
  uint64_t v37;
  char v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = v6;
  objc_msgSend(v6, "treatmentId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v8 = objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v6, "factorLevelArray");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(v12, "factor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "namespaceString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            TRILogCategory_Server();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v12;
              _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Can't save namespace-partitioned treatments: namespaceString is nil for %{public}@", (uint8_t *)&buf, 0xCu);
            }

            objc_autoreleasePoolPop(v13);
            goto LABEL_21;
          }
          if (!v7 || objc_msgSend(v7, "containsObject:", v15))
          {
            -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              v16 = (void *)objc_opt_new();
              objc_msgSend(v16, "setTreatmentId:", v25);
              -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v16, v15);
            }
            objc_msgSend(v16, "factorLevelArray");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v12);

          }
          objc_autoreleasePoolPop(v13);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        if (v9)
          continue;
        break;
      }
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v37 = 0x2020000000;
    v38 = 1;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __109__TRIFBClientTreatmentStorage__saveNamespacePartitionedTreatmentsForTreatment_forNamespaceNames_forRollouts___block_invoke;
    v27[3] = &unk_1E9335EE8;
    v31 = a5;
    v27[4] = self;
    p_buf = &buf;
    v30 = a2;
    v28 = v25;
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v27);
    v18 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Can't save namespace-partitioned treatments: treatmentId is nil", (uint8_t *)&buf, 2u);
    }
LABEL_21:
    v18 = 0;
  }

  return v18;
}

void __109__TRIFBClientTreatmentStorage__saveNamespacePartitionedTreatmentsForTreatment_forNamespaceNames_forRollouts___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1D8232A5C]();
  v10 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v10, "urlForDefaultFactorsWithNamespaceName:", v7);
  else
    objc_msgSend(v10, "urlForFactorsWithTreatmentId:namespaceName:", *(_QWORD *)(a1 + 40), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIFBClientTreatmentStorage.m"), 937, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("referenceURL"));

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_resolveAssetPathsInTreatment:usingReferenceURL:", v8, v12) & 1) != 0)
  {
    v28 = v9;
    objc_msgSend(v8, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIFBClientTreatmentStorage.m"), 948, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v15 = objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v29);
    v16 = v29;

    if ((v15 & 1) == 0)
    {
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v31 = v16;
        _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Failed to create directory: %{public}@", buf, 0xCu);
      }

    }
    objc_msgSend(v11, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18
      && (v19 = *(void **)(a1 + 32),
          objc_msgSend(v11, "path"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v19) = objc_msgSend(v19, "_writeFactorLevelsToDisk:namespaceName:writeToPath:", v8, v7, v20),
          v20,
          (v19 & 1) != 0))
    {
      TRILogCategory_Server();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(void **)(a1 + 40);
        objc_msgSend(v11, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v22;
        v32 = 2114;
        v33 = v23;
        _os_log_impl(&dword_1D207F000, v21, OS_LOG_TYPE_DEFAULT, "Wrote treament %{public}@ --> %{public}@", buf, 0x16u);

      }
    }
    else
    {
      TRILogCategory_Server();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v31 = v16;
        _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Unable to write serialized namespace treatment: %{public}@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      *a4 = 1;
    }
    v9 = v28;

  }
  else
  {
    TRILogCategory_Server();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v12;
      _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "Unable to resolve asset paths with reference URL %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }

  objc_autoreleasePoolPop(v9);
}

- (BOOL)_writeFactorLevelsToDisk:(id)a3 namespaceName:(id)a4 writeToPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v29;
  void *v30;
  id v31;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  NSObject *v44;
  uint64_t *v45;
  _BYTE *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[3];
  int v53;
  id v54;
  uint8_t v55[4];
  void *v56;
  __int16 v57;
  id v58;
  _BYTE buf[24];
  char v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a4;
  v9 = a5;
  objc_msgSend(v8, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 2 * objc_msgSend(v10, "length");

  v54 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCED8]), "initWithFileAtPath:capacity:error:", v9, v11, &v54);
  v34 = v54;
  if (v12)
  {
    v13 = (void *)objc_opt_new();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v60 = 0;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2020000000;
    v53 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    objc_msgSend(v8, "factorLevelArray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke;
    v41[3] = &unk_1E9335F38;
    v45 = &v48;
    v15 = v8;
    v42 = v15;
    v46 = buf;
    v16 = v12;
    v43 = v16;
    v47 = v52;
    v17 = v13;
    v44 = v17;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v41);

    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v18 = 0;
    }
    else
    {
      v19 = -[NSObject count](v17, "count");
      if (v19 != v49[3])
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 1217, CFSTR("Failed to serialize one or more factor levels"));

      }
      objc_msgSend(v16, "trifbCreateSortedVectorOfFactorLevelWithOffsets:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "treatmentId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "createString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "createString:", v35);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_98;
      v37[3] = &unk_1E9335F60;
      v31 = v20;
      v38 = v31;
      v33 = v22;
      v39 = v33;
      v24 = v23;
      v40 = v24;
      objc_msgSend(v16, "trifbCreateFastFactorLevelsUsingBlock:", v37);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v18 = objc_msgSend(v16, "trifbFinishBufferWithRootFastFactorLevelsOfs:error:", v25, &v36);
      v26 = v36;
      if ((v18 & 1) == 0)
      {
        TRILogCategory_Server();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v15, "treatmentId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v55 = 138543618;
          v56 = v29;
          v57 = 2114;
          v58 = v26;
          _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Failed to write factor levels for treatment %{public}@: %{public}@", v55, 0x16u);

        }
      }

    }
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(v52, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v34;
      _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Failed to create factor levels fb at %{public}@: %{public}@", buf, 0x16u);
    }
    v18 = 0;
  }

  return v18;
}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  void *v6;
  char v7;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  _QWORD v131[4];
  id v132;
  id v133;
  _QWORD v134[4];
  id v135;
  id v136;
  id v137;
  id v138;
  _QWORD v139[4];
  id v140;
  id v141;
  _QWORD v142[4];
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  _QWORD v149[4];
  id v150;
  id v151;
  _QWORD v152[4];
  id v153;
  id v154;
  _QWORD v155[4];
  id v156;
  id v157;
  _QWORD v158[4];
  id v159;
  id v160;
  _QWORD v161[4];
  id v162;
  id v163;
  _QWORD v164[4];
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  uint64_t v170;
  _BYTE *v171;
  _QWORD v172[4];
  id v173;
  id v174;
  uint8_t v175[4];
  void *v176;
  __int16 v177;
  void *v178;
  _BYTE buf[24];
  char v180;
  uint64_t v181;

  v181 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (!objc_msgSend(v5, "hasFactor")
    || (objc_msgSend(v5, "factor"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hasName"),
        v6,
        (v7 & 1) == 0))
  {
    TRILogCategory_Server();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "treatmentId");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v71;
      _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "Factor level has missing factor name in treatment %{public}@.", buf, 0xCu);

    }
    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "hasLevel") & 1) == 0)
  {
    TRILogCategory_Server();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "factor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "name");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "treatmentId");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v111;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v112;
      _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "Factor %{public}@ has missing level in treatment %{public}@.", buf, 0x16u);

    }
LABEL_8:

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_9;
  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v5, "factor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(void **)(a1 + 40);
  objc_msgSend(v5, "factor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "namespaceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(void **)(a1 + 40);
  objc_msgSend(v5, "factor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "id_p");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "level");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithCapacity:", objc_msgSend(v21, "metadata_Count"));

  objc_msgSend(v5, "level");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "metadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v172[0] = MEMORY[0x1E0C809B0];
  v172[1] = 3221225472;
  v172[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_80;
  v172[3] = &unk_1E93310B0;
  v173 = *(id *)(a1 + 40);
  v174 = v22;
  v25 = v22;
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v172);

  objc_msgSend(*(id *)(a1 + 40), "trifbCreateSortedVectorOfFactorMetadataKeyValueWithOffsets:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v180 = 0;
  v164[0] = MEMORY[0x1E0C809B0];
  v164[1] = 3221225472;
  v164[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_3;
  v164[3] = &unk_1E9335F10;
  v127 = v19;
  v165 = v127;
  v125 = v11;
  v166 = v125;
  v126 = v15;
  v167 = v126;
  v27 = v26;
  v28 = *(_QWORD *)(a1 + 72);
  v128 = v27;
  v168 = v27;
  v170 = v28;
  v129 = v5;
  v169 = v129;
  v171 = buf;
  v29 = (void *)MEMORY[0x1D8232C48](v164);
  objc_msgSend(v129, "level");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "levelOneOfCase");

  switch(v31)
  {
    case 10:
      v32 = objc_alloc(MEMORY[0x1E0DC0A48]);
      objc_msgSend(v129, "level");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (id)objc_msgSend(v32, "initWithVal:", objc_msgSend(v33, "BOOLeanValue"));

      objc_msgSend(*(id *)(a1 + 40), "trifbCreateBoxedBoolFromBoxedBool:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(void **)(a1 + 40);
      v161[0] = MEMORY[0x1E0C809B0];
      v161[1] = 3221225472;
      v161[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_4;
      v161[3] = &unk_1E9331100;
      v37 = v35;
      v162 = v37;
      v163 = v29;
      objc_msgSend(v36, "trifbCreateFactorLevelUsingBlock:", v161);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v38);

      goto LABEL_30;
    case 11:
      v92 = *(void **)(a1 + 40);
      objc_msgSend(v129, "level");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "stringValue");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "createString:", v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      v96 = *(void **)(a1 + 40);
      v158[0] = MEMORY[0x1E0C809B0];
      v158[1] = 3221225472;
      v158[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_5;
      v158[3] = &unk_1E9331100;
      v34 = v95;
      v159 = v34;
      v160 = v29;
      objc_msgSend(v96, "trifbCreateFactorLevelUsingBlock:", v158);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v97);

      v37 = v159;
      goto LABEL_30;
    case 12:
    case 14:
      goto LABEL_31;
    case 13:
      v98 = objc_alloc(MEMORY[0x1E0DC0A58]);
      objc_msgSend(v129, "level");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (id)objc_msgSend(v98, "initWithVal:", objc_msgSend(v99, "longValue"));

      objc_msgSend(*(id *)(a1 + 40), "trifbCreateBoxedInt64FromBoxedInt64:", v34);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = *(void **)(a1 + 40);
      v155[0] = MEMORY[0x1E0C809B0];
      v155[1] = 3221225472;
      v155[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_6;
      v155[3] = &unk_1E9331100;
      v37 = v100;
      v156 = v37;
      v157 = v29;
      objc_msgSend(v101, "trifbCreateFactorLevelUsingBlock:", v155);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v102);

      goto LABEL_30;
    case 15:
      v103 = objc_alloc(MEMORY[0x1E0DC0A50]);
      objc_msgSend(v129, "level");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "doubleValue");
      v34 = (id)objc_msgSend(v103, "initWithVal:");

      objc_msgSend(*(id *)(a1 + 40), "trifbCreateBoxedDoubleFromBoxedDouble:", v34);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = *(void **)(a1 + 40);
      v152[0] = MEMORY[0x1E0C809B0];
      v152[1] = 3221225472;
      v152[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_7;
      v152[3] = &unk_1E9331100;
      v37 = v105;
      v153 = v37;
      v154 = v29;
      objc_msgSend(v106, "trifbCreateFactorLevelUsingBlock:", v152);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v107);

      goto LABEL_30;
    default:
      if ((v31 - 100) < 2)
      {
        objc_msgSend(v129, "level");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "fileOrDirectoryLevelWithIsDir:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v41, "hasAsset"))
        {
          objc_msgSend(v41, "asset");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v42, "hasCloudKitContainer") & 1) != 0)
          {
LABEL_20:

            goto LABEL_21;
          }
          v43 = objc_msgSend(v41, "isOnDemand");

          if (v43)
          {
            TRILogCategory_Server();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v129, "factor");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v120, "name");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v175 = 138543362;
              v176 = v121;
              _os_log_debug_impl(&dword_1D207F000, v44, OS_LOG_TYPE_DEBUG, "Populating system default cloudKitContainer on asset for \"%{public}@\", v175, 0xCu);

            }
            objc_msgSend(v41, "asset");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setCloudKitContainer:", 1);
            goto LABEL_20;
          }
        }
LABEL_21:
        v45 = *(void **)(a1 + 40);
        objc_msgSend(v41, "path");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "createString:", v46);
        v123 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = *(void **)(a1 + 40);
        objc_msgSend(v41, "asset");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "assetId");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "createString:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = *(void **)(a1 + 40);
        objc_msgSend(v41, "asset");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "treatmentId");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "createString:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = *(void **)(a1 + 40);
        objc_msgSend(v41, "asset");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "name");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "createString:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = v29;
        v60 = *(void **)(a1 + 40);
        v61 = MEMORY[0x1E0C809B0];
        v149[0] = MEMORY[0x1E0C809B0];
        v149[1] = 3221225472;
        v149[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_87;
        v149[3] = &unk_1E9331128;
        v62 = v41;
        v150 = v62;
        v122 = v54;
        v151 = v122;
        objc_msgSend(v60, "trifbCreateCloudKitTreatmentRecordAssetUsingBlock:", v149);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = *(void **)(a1 + 40);
        v142[0] = v61;
        v142[1] = 3221225472;
        v142[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_2_89;
        v142[3] = &unk_1E9331150;
        v34 = v62;
        v143 = v34;
        v37 = v123;
        v144 = v37;
        v145 = v129;
        v124 = v50;
        v146 = v124;
        v65 = v63;
        v147 = v65;
        v66 = v58;
        v148 = v66;
        objc_msgSend(v64, "trifbCreateTrialManagedAssetUsingBlock:", v142);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = *(void **)(a1 + 40);
        v139[0] = v61;
        v139[1] = 3221225472;
        v139[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_3_91;
        v139[3] = &unk_1E9331100;
        v69 = v67;
        v140 = v69;
        v29 = v59;
        v141 = v59;
        objc_msgSend(v68, "trifbCreateFactorLevelUsingBlock:", v139);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v70);

LABEL_30:
LABEL_31:
        if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        {
          TRILogCategory_Server();
          v108 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v129, "factor");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "name");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "level");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = objc_msgSend(v115, "levelOneOfCase");
            *(_DWORD *)v175 = 138543618;
            v176 = v114;
            v177 = 1024;
            LODWORD(v178) = v116;
            _os_log_error_impl(&dword_1D207F000, v108, OS_LOG_TYPE_ERROR, "Factor %{public}@ has unsupported factor level with type %d.", v175, 0x12u);

          }
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          *a4 = 1;
        }
        goto LABEL_38;
      }
      if (v31 != 104)
        goto LABEL_31;
      objc_msgSend(v129, "level");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "mobileAssetReferenceValue");
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v73, "hasAssetType")
        && objc_msgSend(v73, "hasAssetSpecifier")
        && (objc_msgSend(v73, "hasAssetVersion") & 1) != 0)
      {
        v74 = *(void **)(a1 + 40);
        objc_msgSend(v73, "assetType");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "createString:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        v77 = *(void **)(a1 + 40);
        objc_msgSend(v73, "assetSpecifier");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "createString:", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        v80 = *(void **)(a1 + 40);
        objc_msgSend(v73, "assetVersion");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "createString:", v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        v83 = v29;
        v84 = *(void **)(a1 + 40);
        v85 = MEMORY[0x1E0C809B0];
        v134[0] = MEMORY[0x1E0C809B0];
        v134[1] = 3221225472;
        v134[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_92;
        v134[3] = &unk_1E9331178;
        v37 = v76;
        v135 = v37;
        v86 = v79;
        v136 = v86;
        v87 = v82;
        v137 = v87;
        v34 = v73;
        v138 = v34;
        objc_msgSend(v84, "trifbCreateMobileAssetReferenceUsingBlock:", v134);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = *(void **)(a1 + 40);
        v131[0] = v85;
        v131[1] = 3221225472;
        v131[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_2_94;
        v131[3] = &unk_1E9331100;
        v90 = v88;
        v132 = v90;
        v29 = v83;
        v133 = v83;
        objc_msgSend(v89, "trifbCreateFactorLevelUsingBlock:", v131);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v91);

        goto LABEL_30;
      }
      TRILogCategory_Server();
      v109 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v129, "factor");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "name");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "treatmentId");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v175 = 138543618;
        v176 = v118;
        v177 = 2114;
        v178 = v119;
        _os_log_error_impl(&dword_1D207F000, v109, OS_LOG_TYPE_ERROR, "Factor %{public}@ has missing MAAutoAsset metadata in treatment %{public}@.", v175, 0x16u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      *a4 = 1;

LABEL_38:
      _Block_object_dispose(buf, 8);

      break;
  }
LABEL_9:

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_80(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "createString:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "createString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_2;
  v13[3] = &unk_1E9331088;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v12 = v7;
  objc_msgSend(v9, "trifbCreateFactorMetadataKeyValueUsingBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setKey:", v3);
  objc_msgSend(v4, "setVal:", *(_QWORD *)(a1 + 40));

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setFactorId:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "setName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setFactorNamespaceName:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "setMetadata:", *(_QWORD *)(a1 + 56));
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  objc_msgSend(v6, "setCacheKey:");
  if (populateNamespaceIdInTreatmentSchema)
  {
    objc_msgSend(*(id *)(a1 + 64), "factor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasNamespaceId");

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 64), "factor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setNamespaceId:", objc_msgSend(v5, "namespaceId"));

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevelWithBoolVal:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevelWithStringVal:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevelWithInt64Val:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevelWithDoubleVal:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_87(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cloudKitContainer");

  if (v4 == 1)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "cloudKitContainer");

    if (v7 != 2)
      goto LABEL_6;
    v5 = 2;
  }
  objc_msgSend(v11, "setContainer:", v5);
LABEL_6:
  objc_msgSend(v11, "setTreatmentId:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasCloudKitIndex");

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAssetIndex:", objc_msgSend(v10, "cloudKitIndex"));

    objc_msgSend(v11, "setHasCkIndex:", 1);
  }

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_2_89(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasPath"))
    objc_msgSend(v10, "setPath:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "level");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "levelOneOfCase") != 101;

  objc_msgSend(v10, "setFileType:", v4);
  objc_msgSend(v10, "setAssetId:", *(_QWORD *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 32), "hasAsset"))
    objc_msgSend(v10, "setCloudKitMetadataWithTreatment:", *(_QWORD *)(a1 + 64));
  if (objc_msgSend(*(id *)(a1 + 32), "hasIsOnDemand"))
  {
    objc_msgSend(v10, "setIsOnDemand:", objc_msgSend(*(id *)(a1 + 32), "isOnDemand"));
    objc_msgSend(v10, "setHasOnDemandFlag:", 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSize");

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDownloadSize:", objc_msgSend(v7, "size"));

  }
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasName");

  if (v9)
    objc_msgSend(v10, "setAssetName:", *(_QWORD *)(a1 + 72));

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_3_91(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevelWithTrialAssetVal:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setType:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setSpecifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setVersion:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setFileType:", objc_msgSend(*(id *)(a1 + 56), "isFileFactor"));
  objc_msgSend(v3, "setIsOnDemand:", objc_msgSend(*(id *)(a1 + 56), "isOnDemand"));
  if (objc_msgSend(*(id *)(a1 + 56), "hasSize"))
    objc_msgSend(v3, "setDownloadSize:", objc_msgSend(*(id *)(a1 + 56), "size"));

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_2_94(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevelWithMaRefVal:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__TRIFBClientTreatmentStorage__writeFactorLevelsToDisk_namespaceName_writeToPath___block_invoke_98(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setLevels:", v3);
  objc_msgSend(v4, "setSourceWithTreatmentId:", a1[5]);
  objc_msgSend(v4, "setNamespaceName:", a1[6]);

}

- (id)_defaultsAssetURLForFactor:(id)a3
{
  return -[TRIFBClientTreatmentStorage _assetURLForFactor:treatmentId:](self, "_assetURLForFactor:treatmentId:", a3, CFSTR("defaults"));
}

- (id)_assetURLForFactor:(id)a3 treatmentId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "namespaceString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 1247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  -[TRIFBClientTreatmentStorage _baseUrlForTreatment:namespaceName:](self, "_baseUrlForTreatment:namespaceName:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC0AE0];
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 1249, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("dir.path"));

  }
  objc_msgSend(v11, "pathForFactor:directory:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_baseUrlForTreatment:(id)a3 namespaceName:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0DC0BA0];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithPaths:", self->_paths);
  objc_msgSend(v9, "baseUrlForTreatment:namespaceName:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_copyFileFromURL:(id)a3 to:(id)a4
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x1E0C99D50];
  v9 = a3;
  v24 = 0;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithContentsOfURL:options:error:", v9, 1, &v24);

  v11 = v24;
  if (!v10)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failed to read source URL: %{public}@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 1269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentURL"));

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v14 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v23);
  v15 = v23;

  if ((v14 & 1) == 0)
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Failed to create directory for target file: %{public}@", buf, 0xCu);
    }

  }
  v22 = 0;
  v17 = objc_msgSend(v10, "writeToURL:options:error:", v7, 268435457, &v22);
  v11 = v22;
  if ((v17 & 1) == 0)
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Failed to write to target URL: %{public}@", buf, 0xCu);
    }

LABEL_15:
    v18 = 0;
    goto LABEL_16;
  }
  v18 = v7;
LABEL_16:

  return v18;
}

- (id)urlForTreatmentWithTreatmentId:(id)a3
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v5 = (objc_class *)MEMORY[0x1E0DC0BA0];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithPaths:", self->_paths);
  objc_msgSend(v7, "baseUrlForTreatment:namespaceName:", v6, CFSTR("0"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 1294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentBasename"));

  }
  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("fb"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 1296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  return v9;
}

- (BOOL)_resolveAssetPathsInTreatment:(id)a3 usingReferenceURL:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "hasDirectoryPath") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBClientTreatmentStorage.m"), 1301, CFSTR("referenceURL must be a directory"));

  }
  objc_msgSend(v8, "triPathAsOwner:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v7, "factorLevelArray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v27 = v8;
      v28 = v7;
      v13 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "level", v27, v28);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "fileOrDirectoryLevelWithIsDir:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 && objc_msgSend(v16, "hasPath"))
          {
            v17 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v16, "path");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "triParseURLFromString:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
              goto LABEL_20;
            objc_msgSend(v19, "triPathAsOwner:", 0);
            v20 = objc_claimAutoreleasedReturnValue();
            if (!v20)
            {

LABEL_20:
              v24 = 0;
              goto LABEL_21;
            }
            v21 = (void *)v20;
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "triPath:relativeToParentPath:", v21, v9);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "setPath:", v23);
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v12)
          continue;
        break;
      }
      v24 = 1;
LABEL_21:
      v8 = v27;
      v7 = v28;
    }
    else
    {
      v24 = 1;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
