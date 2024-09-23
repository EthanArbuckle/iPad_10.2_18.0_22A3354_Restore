@implementation TRIClientTreatmentStorage

- (TRIClientTreatmentStorage)initWithPaths:(id)a3
{
  id v4;
  TRIRemoteAssetExtractor *v5;
  TRIClientTreatmentStorage *v6;

  v4 = a3;
  v5 = -[TRIRemoteAssetExtractor initWithMonitoredActivity:]([TRIRemoteAssetExtractor alloc], "initWithMonitoredActivity:", 0);
  v6 = -[TRIClientTreatmentStorage initWithPaths:extractor:](self, "initWithPaths:extractor:", v4, v5);

  return v6;
}

- (TRIClientTreatmentStorage)initWithPaths:(id)a3 extractor:(id)a4
{
  id v7;
  id v8;
  TRIClientTreatmentStorage *v9;
  TRIClientTreatmentStorage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIClientTreatmentStorage;
  v9 = -[TRIClientTreatmentStorage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_extractor, a4);
  }

  return v10;
}

- (id)loadTreatmentWithTreatmentId:(id)a3 isFilePresent:(BOOL *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D8232A5C]();
  if (a4)
    *a4 = 1;
  v8 = objc_alloc(MEMORY[0x1E0C99D50]);
  -[TRIClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v10 = (void *)objc_msgSend(v8, "initWithContentsOfURL:options:error:", v9, 1, &v32);
  v11 = v32;

  if (v10)
  {

    v31 = 0;
    +[TRIPBMessage parseFromData:error:](TRIPersistedTreatment, "parseFromData:error:", v10, &v31);
    v12 = objc_claimAutoreleasedReturnValue();
    v11 = v31;
    if (v12)
    {
      if ((-[NSObject hasTreatment](v12, "hasTreatment") & 1) != 0)
      {
        -[NSObject treatment](v12, "treatment");
        v13 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject hasTreatmentId](v13, "hasTreatmentId")
          && (-[NSObject treatmentId](v13, "treatmentId"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "length"),
              v14,
              v15))
        {
          -[NSObject treatmentId](v13, "treatmentId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v6, "isEqualToString:", v16);

          if ((v17 & 1) != 0)
          {
            v13 = v13;
            v18 = v13;
LABEL_26:

            goto LABEL_27;
          }
          TRILogCategory_Server();
          v26 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          -[TRIClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v6);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject treatmentId](v13, "treatmentId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v34 = v28;
          v35 = 2112;
          v36 = v6;
          v37 = 2112;
          v38 = v29;
          _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "TRIClientTreatment at %@ has mismatched treatmentId (exp: %@, act: %@)", buf, 0x20u);

        }
        else
        {
          TRILogCategory_Server();
          v26 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
LABEL_24:

            goto LABEL_25;
          }
          -[TRIClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v6);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v34 = v28;
          _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "TRIPersistedTreatment has TRIClientTreatment with nil or empty treatmentId: %@", buf, 0xCu);
        }

        goto LABEL_24;
      }
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[TRIClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v34 = v21;
        v22 = "TRIPersistedTreatment has missing treatment: %@";
        v23 = v13;
        v24 = 12;
        goto LABEL_16;
      }
    }
    else
    {
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[TRIClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = v21;
        v35 = 2114;
        v36 = v11;
        v22 = "Unable to parse TRIPersistedTreatment from %@: %{public}@";
        v23 = v13;
        v24 = 22;
LABEL_16:
        _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);

      }
    }
LABEL_25:
    v18 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v11, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19 == (void *)*MEMORY[0x1E0CB28A8])
  {
    v25 = objc_msgSend(v11, "code");

    if (a4 && v25 == 260)
      *a4 = 0;
  }
  else
  {

  }
  TRILogCategory_Server();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[TRIClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v34 = v6;
    v35 = 2112;
    v36 = v30;
    v37 = 2114;
    v38 = v11;
    _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Unable to read treatment with ID %@ from %@: %{public}@", buf, 0x20u);

  }
  v18 = 0;
LABEL_27:

  objc_autoreleasePoolPop(v7);
  return v18;
}

- (id)saveTreatment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  TRIClientTreatmentStorage *v18;
  TRIClientTreatmentStorage *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  __int128 v39;
  void *context;
  TRIClientTreatmentStorage *v41;
  void *v42;
  id obj;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  if (!objc_msgSend(v4, "hasTreatmentId")
    || (objc_msgSend(v4, "treatmentId"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        !v7))
  {
    TRILogCategory_Server();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v37, OS_LOG_TYPE_ERROR, "TRIClientTreatmentArtifact has nil or empty treatmentId", buf, 2u);
    }

    v36 = 0;
    goto LABEL_42;
  }
  v8 = (void *)objc_msgSend(v4, "copy");

  if (!objc_msgSend(v8, "factorLevelArray_Count"))
    goto LABEL_34;
  v41 = self;
  v42 = v5;
  context = (void *)MEMORY[0x1D8232A5C]();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v8, "factorLevelArray");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  v10 = 0;
  if (!v46)
    goto LABEL_33;
  v45 = *(_QWORD *)v48;
  *(_QWORD *)&v9 = 138543362;
  v39 = v9;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v48 != v45)
        objc_enumerationMutation(obj);
      v12 = v8;
      v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v11);
      if (!v10)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v11), "factor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "namespaceName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRIClientFactorPackUtils aliasesInNamespace:](TRIClientFactorPackUtils, "aliasesInNamespace:", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v13, "factor", v39);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v17);
      v18 = (TRIClientTreatmentStorage *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v18)
      {
        objc_msgSend(v13, "factor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "name");
        self = (TRIClientTreatmentStorage *)objc_claimAutoreleasedReturnValue();
        v19 = self;
      }
      objc_msgSend(v13, "factor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setName:", v19);

      if (!v18)
      {

      }
      v8 = v12;
      if (objc_msgSend(v13, "hasLevel"))
      {
        objc_msgSend(v13, "level");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "fileOrDirectoryLevelWithIsDir:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "hasTreatmentId"))
        {
          if (objc_msgSend(v22, "hasAsset"))
          {
            objc_msgSend(v22, "asset");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "hasTreatmentId");

            if ((v24 & 1) == 0)
            {
              TRILogCategory_Server();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v12, "treatmentId");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "factor");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "name");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v52 = v31;
                v53 = 2114;
                v54 = v33;
                _os_log_debug_impl(&dword_1D207F000, v25, OS_LOG_TYPE_DEBUG, "Populating treatmentId %@ on asset for \"%{public}@\", buf, 0x16u);

                v8 = v12;
              }

              objc_msgSend(v8, "treatmentId");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "asset");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setTreatmentId:", v26);

            }
          }
        }
        if (objc_msgSend(v8, "hasTreatmentId") && objc_msgSend(v22, "hasAsset"))
        {
          objc_msgSend(v22, "asset");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v28, "hasCloudKitContainer") & 1) != 0)
            goto LABEL_29;
          v29 = objc_msgSend(v22, "isOnDemand");

          if (v29)
          {
            TRILogCategory_Server();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v13, "factor");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "name");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v39;
              v52 = v35;
              _os_log_debug_impl(&dword_1D207F000, v30, OS_LOG_TYPE_DEBUG, "Populating system default cloudKitContainer on asset for \"%{public}@\", buf, 0xCu);

            }
            objc_msgSend(v22, "asset");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setCloudKitContainer:", 1);
LABEL_29:

          }
        }

      }
      ++v11;
    }
    while (v46 != v11);
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  }
  while (v46);
LABEL_33:

  objc_autoreleasePoolPop(context);
  self = v41;
  v5 = v42;
LABEL_34:
  if (-[TRIClientTreatmentStorage _linkAssetsUpdatingTreatment:](self, "_linkAssetsUpdatingTreatment:", v8)
    && -[TRIClientTreatmentStorage _saveNamespacePartitionedTreatmentsForTreatment:forNamespaceNames:forRollouts:](self, "_saveNamespacePartitionedTreatmentsForTreatment:forNamespaceNames:forRollouts:", v8, 0, 0)&& -[TRIClientTreatmentStorage _savePersistedTreatment:](self, "_savePersistedTreatment:", v8))
  {
    v4 = v8;
    v36 = v4;
  }
  else
  {
    v36 = 0;
    v4 = v8;
  }
LABEL_42:
  objc_autoreleasePoolPop(v5);

  return v36;
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
  -[TRIClientTreatmentStorage loadTreatmentWithTreatmentId:isFilePresent:](self, "loadTreatmentWithTreatmentId:isFilePresent:", v8, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (!v19)
    {
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[TRIClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v8);
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

  if (!-[TRIClientTreatmentStorage _linkAssetsWithIds:updatingTreatment:](self, "_linkAssetsWithIds:updatingTreatment:", v9, v12)|| !-[TRIClientTreatmentStorage _saveNamespacePartitionedTreatmentsForTreatment:forNamespaceNames:forRollouts:](self, "_saveNamespacePartitionedTreatmentsForTreatment:forNamespaceNames:forRollouts:", v12, v10, 0)|| !-[TRIClientTreatmentStorage _savePersistedTreatment:](self, "_savePersistedTreatment:", v12))
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
  TRIClientTreatmentStorage *v30;
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
                  -[TRIClientTreatmentStorage _linkAssetWithId:treatmentId:assetStore:factor:forRollouts:](v30, "_linkAssetWithId:treatmentId:assetStore:factor:forRollouts:", v24, v25, v31, v26, 0);
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
    -[TRIClientTreatmentStorage _defaultsAssetURLForFactor:](self, "_defaultsAssetURLForFactor:", v16);
  else
    -[TRIClientTreatmentStorage _assetURLForFactor:treatmentId:](self, "_assetURLForFactor:treatmentId:", v16, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URLByDeletingLastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 267, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[assetURL URLByDeletingLastPathComponent].path"));

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v20);
  objc_msgSend(v18, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 270, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetURL.path"));

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
  return -[TRIClientTreatmentStorage updateSavedTreatmentWithTreatmentId:deletingAssetsWithFactorNames:forNamespaceName:forRollouts:inUseAssetDeletionBehavior:](self, "updateSavedTreatmentWithTreatmentId:deletingAssetsWithFactorNames:forNamespaceName:forRollouts:inUseAssetDeletionBehavior:", a3, a4, a5, a6, 1);
}

- (id)updateSavedTreatmentWithTreatmentId:(id)a3 deletingAssetsWithFactorNames:(id)a4 forNamespaceName:(id)a5 forRollouts:(BOOL)a6 inUseAssetDeletionBehavior:(unsigned __int8)a7
{
  uint64_t v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  NSObject *v20;
  void *v22;
  char v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v7 = a7;
  v8 = a6;
  v26 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)MEMORY[0x1D8232A5C]();
  v23 = 0;
  -[TRIClientTreatmentStorage loadTreatmentWithTreatmentId:isFilePresent:](self, "loadTreatmentWithTreatmentId:isFilePresent:", v12, &v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    if (!v23)
    {
      TRILogCategory_Server();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        -[TRIClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v22;
        _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "updateSavedTreatmentWithTreatmentId failed because preexisting treatment is not present: %@", buf, 0xCu);

      }
    }
    goto LABEL_9;
  }
  -[TRIClientTreatmentStorage _deleteOnDemandAssetsWithFactorNames:treatment:namespace:forRollouts:inUseAssetDeletionBehavior:](self, "_deleteOnDemandAssetsWithFactorNames:treatment:namespace:forRollouts:inUseAssetDeletionBehavior:", v13, v16, v14, v8, v7);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v14, 0);
  v18 = -[TRIClientTreatmentStorage _saveNamespacePartitionedTreatmentsForTreatment:forNamespaceNames:forRollouts:](self, "_saveNamespacePartitionedTreatmentsForTreatment:forNamespaceNames:forRollouts:", v16, v17, v8);

  v19 = 0;
  if (v18)
  {
    if (-[TRIClientTreatmentStorage _savePersistedTreatment:](self, "_savePersistedTreatment:", v16))
    {
      v19 = v16;
      goto LABEL_10;
    }
LABEL_9:
    v19 = 0;
  }
LABEL_10:

  objc_autoreleasePoolPop(v15);
  return v19;
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
  -[TRIClientTreatmentStorage _collectTreatments](self, "_collectTreatments");
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
        v37[2] = __74__TRIClientTreatmentStorage_removeUnreferencedTreatmentsWithRemovedCount___block_invoke;
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

void __74__TRIClientTreatmentStorage_removeUnreferencedTreatmentsWithRemovedCount___block_invoke(uint64_t a1, void *a2)
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
                  objc_msgSend(v18, "URLByAppendingPathComponent:", CFSTR("treatment.pb"), v35);
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
      v44[2] = __47__TRIClientTreatmentStorage__collectTreatments__block_invoke;
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

void __47__TRIClientTreatmentStorage__collectTreatments__block_invoke(uint64_t a1, void *a2)
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
        v17 = -[TRIClientTreatmentStorage removeTreatmentWithTreatmentId:](self, "removeTreatmentWithTreatmentId:", v16);

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
         || -[TRIClientTreatmentStorage _removeRolloutWithDescriptor:descriptorDir:treatmentLayer:namespaceName:](self, "_removeRolloutWithDescriptor:descriptorDir:treatmentLayer:namespaceName:", v12, v11, a3, v8);
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
      v17 = -[TRIClientTreatmentStorage _removeRolloutWithDescriptor:descriptorDir:treatmentLayer:namespaceName:](self, "_removeRolloutWithDescriptor:descriptorDir:treatmentLayer:namespaceName:", v12, v11, a3, v8);
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v31;
  SEL v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;
  uint8_t buf[4];
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v43 = 0;
  -[TRIClientTreatmentStorage loadTreatmentWithTreatmentId:isFilePresent:](self, "loadTreatmentWithTreatmentId:isFilePresent:", v5, &v43);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v32 = a2;
    v33 = v6;
    v8 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v7, "factorLevelArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "factor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "namespaceString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v11);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = v8;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v36;
      LODWORD(v20) = 1;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(v16);
          LODWORD(v20) = v20 & -[TRIClientTreatmentStorage _removeFactorsWithTreatmentId:namespaceName:](self, "_removeFactorsWithTreatmentId:namespaceName:", v5, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
      }
      while (v18);

      v6 = v33;
      if (!(_DWORD)v20)
        goto LABEL_33;
    }
    else
    {

      v6 = v33;
    }
    -[TRIClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v32, self, CFSTR("TRIClientTreatmentStorage.m"), 558, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("artifactPath"));

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v25 = objc_msgSend(v24, "triForceRemoveItemAtPath:error:", v23, &v34);
    v26 = v34;

    if ((v25 & 1) != 0)
      goto LABEL_25;
    objc_msgSend(v26, "domain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27 == (void *)*MEMORY[0x1E0CB28A8])
    {
      v29 = objc_msgSend(v26, "code");

      if (v29 == 4)
      {
LABEL_25:
        LOBYTE(v20) = 1;
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }
    }
    else
    {

    }
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v45 = v26;
      _os_log_error_impl(&dword_1D207F000, (os_log_t)v20, OS_LOG_TYPE_ERROR, "Failed to remove artifact: %{public}@", buf, 0xCu);
    }

    LOBYTE(v20) = 0;
    goto LABEL_32;
  }
  LOBYTE(v20) = v43 == 0;
LABEL_34:

  objc_autoreleasePoolPop(v6);
  return v20;
}

- (BOOL)_removeFactorsWithTreatmentId:(id)a3 namespaceName:(id)a4
{
  TRIClientTreatmentStorage *v4;
  void *v5;

  v4 = self;
  -[TRIClientTreatmentStorage urlForFactorsWithTreatmentId:namespaceName:](self, "urlForFactorsWithTreatmentId:namespaceName:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = -[TRIClientTreatmentStorage _removeFactorsWithURL:](v4, "_removeFactorsWithURL:", v5);

  return (char)v4;
}

- (BOOL)_removeRolloutWithDescriptor:(id)a3 descriptorDir:(id)a4 treatmentLayer:(unint64_t)a5 namespaceName:(id)a6
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
    v12 &= -[TRIClientTreatmentStorage _removeFactorsWithURL:](self, "_removeFactorsWithURL:", v14);

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
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 601, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorsURL"));

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
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 623, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentURL"));

      }
      objc_msgSend(v8, "triPathAsOwner:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 625, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentPath"));

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
  -[TRIClientTreatmentStorage _baseUrlForTreatment:namespaceName:](self, "_baseUrlForTreatment:namespaceName:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = CFSTR("treatment.pb");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPathComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 642, CFSTR("urlForFactorsWithTreatmentId is nil"));

  }
  return v10;
}

- (id)urlForDefaultFactorsWithNamespaceName:(id)a3
{
  return -[TRIClientTreatmentStorage urlForFactorsWithTreatmentId:namespaceName:](self, "urlForFactorsWithTreatmentId:namespaceName:", CFSTR("defaults"), a3);
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
  char v16;
  id v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v5, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClientTreatmentStorage urlForTreatmentWithTreatmentId:](self, "urlForTreatmentWithTreatmentId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 655, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentDirURL"));

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v24);
  v12 = v24;

  if ((v11 & 1) == 0)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Failed to create directory: %{public}@", buf, 0xCu);
    }

  }
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setTreatment:", v5);
  objc_msgSend(v14, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 669, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v23 = 0;
  v16 = objc_msgSend(v15, "writeToURL:options:error:", v8, 268435457, &v23);
  v17 = v23;
  if ((v16 & 1) == 0)
  {
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "treatmentId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v20;
      v27 = 2114;
      v28 = v17;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Failed to write TRIPersistedTreatment for treatment %@: %{public}@", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v6);
  return v16;
}

- (BOOL)_deleteOnDemandAssetsWithFactorNames:(id)a3 treatment:(id)a4 namespace:(id)a5 forRollouts:(BOOL)a6 inUseAssetDeletionBehavior:(unsigned __int8)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  SEL v61;
  unsigned int v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  id v66;
  id v67;
  void *v68;
  TRIClientTreatmentStorage *v69;
  void *v70;
  id v71;
  unsigned int v72;
  char v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  int buf;
  void *v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v62 = a7;
  v65 = a6;
  v89 = *MEMORY[0x1E0C80C00];
  v71 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "treatmentId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = self;
  v63 = v12;
  -[TRIClientTreatmentStorage _baseUrlForTreatment:namespaceName:](self, "_baseUrlForTreatment:namespaceName:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v64 = v11;
  objc_msgSend(v11, "factorLevelArray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
  if (!v16)
  {
    LOBYTE(v19) = 1;
    goto LABEL_40;
  }
  v17 = v16;
  v61 = a2;
  v18 = *(_QWORD *)v80;
  v19 = 1;
  v70 = v15;
  do
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v80 != v18)
        objc_enumerationMutation(v15);
      v21 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v20);
      v22 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v21, "level");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fileOrDirectoryLevelWithIsDir:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        objc_msgSend(v21, "level");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "levelOneOfCase");

        if (v34 != 104)
          goto LABEL_27;
        objc_msgSend(v21, "level");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "mobileAssetReferenceValue");
        v25 = objc_claimAutoreleasedReturnValue();

        if (!-[NSObject isOnDemand](v25, "isOnDemand"))
          goto LABEL_26;
        v72 = v19;
        objc_msgSend(v21, "factor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "name");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v71, "containsObject:", v37);

        if (v38)
        {
          v39 = (void *)objc_opt_class();
          objc_msgSend(v21, "factor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "name");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "relPathForMAReferenceWithFactorName:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v68, "stringByAppendingPathComponent:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v40) = objc_msgSend(v44, "fileExistsAtPath:", v43);

          if ((_DWORD)v40)
          {
            objc_msgSend(v66, "addObject:", v43);
            v45 = (void *)objc_opt_new();
            v78 = 0;
            v46 = objc_msgSend(v45, "writeToFile:options:error:", v43, 0x10000000, &v78);
            v67 = v78;

            if ((v46 & 1) == 0)
            {
              TRILogCategory_Server();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                buf = 138543362;
                v85 = v43;
                _os_log_error_impl(&dword_1D207F000, v47, OS_LOG_TYPE_ERROR, "Unable to nil out MARef by creating a blank file at %{public}@", (uint8_t *)&buf, 0xCu);
              }

            }
          }

        }
        v19 = v72;
        goto LABEL_25;
      }
      if (!objc_msgSend(v24, "hasAsset"))
        goto LABEL_27;
      objc_msgSend(v24, "asset");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!-[NSObject hasCloudKitIndex](v25, "hasCloudKitIndex"))
        goto LABEL_26;
      v26 = objc_msgSend(v24, "hasPath");

      if (!v26)
        goto LABEL_27;
      v27 = v19;
      objc_msgSend(v21, "factor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v71, "containsObject:", v29);

      if (v30)
      {
        if ((objc_msgSend(v24, "isOnDemand") & 1) != 0)
        {
          objc_msgSend(v21, "factor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v65)
          {
            -[TRIClientTreatmentStorage _defaultsAssetURLForFactor:](v69, "_defaultsAssetURLForFactor:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v64, "treatmentId");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRIClientTreatmentStorage _assetURLForFactor:treatmentId:](v69, "_assetURLForFactor:treatmentId:", v31, v48);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v19 = v27;

          objc_msgSend(v32, "path");
          v25 = objc_claimAutoreleasedReturnValue();
          v15 = v70;
          if (!v25)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", v61, v69, CFSTR("TRIClientTreatmentStorage.m"), 721, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

          }
          objc_msgSend(v66, "addObject:", v25);
          objc_msgSend(v24, "setPath:", 0);
          goto LABEL_26;
        }
        TRILogCategory_Server();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v21, "factor");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "name");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "treatmentId");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          buf = 138543618;
          v85 = v50;
          v86 = 2112;
          v87 = v51;
          _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Factor %{public}@ for treatment %@ is not on-demand.", (uint8_t *)&buf, 0x16u);

        }
        v19 = 0;
LABEL_25:
        v15 = v70;
LABEL_26:

        goto LABEL_27;
      }
      v19 = v27;
      v15 = v70;
LABEL_27:

      objc_autoreleasePoolPop(v22);
      ++v20;
    }
    while (v17 != v20);
    v53 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    v17 = v53;
  }
  while (v53);
LABEL_40:

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v54 = v66;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v75 != v57)
          objc_enumerationMutation(v54);
        v59 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        v73 = 0;
        if (!+[TRIReferenceManagedDir removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:](TRIReferenceManagedDir, "removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:", v59, v62, &v73))
        {
          TRILogCategory_Server();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
          {
            buf = 138543362;
            v85 = v59;
            _os_log_error_impl(&dword_1D207F000, (os_log_t)v19, OS_LOG_TYPE_ERROR, "Failed to remove file %{public}@ in managed dir", (uint8_t *)&buf, 0xCu);
          }

          LOBYTE(v19) = 0;
        }
      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
    }
    while (v56);
  }

  return v19 & 1;
}

- (BOOL)_linkAssetsUpdatingTreatment:(id)a3
{
  id v5;
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
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  char v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  BOOL v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  SEL v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  TRIClientTreatmentStorage *v94;
  void *v95;
  TRIAssetStore *v96;
  NSObject *v97;
  NSObject *v98;
  uint64_t v99;
  uint64_t v100;
  void *context;
  id v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint8_t buf[4];
  NSObject *v109;
  __int16 v110;
  id v111;
  __int16 v112;
  void *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v96 = -[TRIAssetStore initWithPaths:]([TRIAssetStore alloc], "initWithPaths:", self->_paths);
  objc_msgSend(v5, "factorLevelArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "treatmentId");
      v68 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v109 = v68;
      _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "Treatment %@ has no factor levels. Proceeding without linking assets.", buf, 0xCu);

    }
    v66 = 1;
    goto LABEL_79;
  }
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  objc_msgSend(v5, "factorLevelArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
  if (v100)
  {
    v89 = a2;
    v94 = self;
    v9 = 0;
    v99 = *(_QWORD *)v105;
    v93 = v5;
    v95 = v8;
    while (1)
    {
      v10 = 0;
      v11 = v9;
      do
      {
        if (*(_QWORD *)v105 != v99)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v10);
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
            objc_msgSend(v12, "factor");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "namespaceString");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v35)
            {
              TRILogCategory_Server();
              v20 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                goto LABEL_71;
              objc_msgSend(v5, "treatmentId");
              v70 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "factor");
              v71 = objc_claimAutoreleasedReturnValue();
              -[NSObject name](v71, "name");
              v72 = v9;
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v109 = v70;
              v110 = 2114;
              v111 = v73;
              _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has factor %{public}@ with missing namespaceString.", buf, 0x16u);

              v9 = v72;
              goto LABEL_81;
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
              v70 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
LABEL_65:

                goto LABEL_71;
              }
              objc_msgSend(v5, "treatmentId");
              v71 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "factor");
              v84 = v9;
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "name");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v109 = v71;
              v110 = 2114;
              v111 = v86;
              _os_log_error_impl(&dword_1D207F000, v70, OS_LOG_TYPE_ERROR, "Treatment %{public}@ has factor %{public}@ with incomplete MobileAssetReference.", buf, 0x16u);

              v9 = v84;
LABEL_81:

              goto LABEL_65;
            }
            v98 = v9;
            objc_msgSend(v12, "factor");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "treatmentId");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "namespaceName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRIClientTreatmentStorage _baseUrlForTreatment:namespaceName:](v94, "_baseUrlForTreatment:namespaceName:", v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v90 = v40;
            objc_msgSend(v40, "path");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v41)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", v89, v94, CFSTR("TRIClientTreatmentStorage.m"), 855, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("targetURL.path"));

            }
            v42 = (void *)objc_opt_class();
            v92 = v37;
            objc_msgSend(v37, "name");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "relPathForMAReferenceWithFactorName:", v43);
            v44 = objc_claimAutoreleasedReturnValue();

            v91 = (void *)v44;
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
            v5 = v93;
            if (!-[TRIAssetStore referenceMAAutoAssetWithId:isFileFactor:usingCurrentPath:futurePath:](v96, "referenceMAAutoAssetWithId:isFileFactor:usingCurrentPath:futurePath:", v51, v52, v45, v45))
            {
              TRILogCategory_Server();
              v74 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v109 = v45;
                _os_log_error_impl(&dword_1D207F000, v74, OS_LOG_TYPE_ERROR, "Unable to reference maAutoAsset at %{public}@", buf, 0xCu);
              }

              v9 = v98;
LABEL_71:
              v75 = context;
LABEL_76:

              objc_autoreleasePoolPop(v75);
              v8 = v95;
LABEL_77:

              goto LABEL_78;
            }

            v9 = v98;
            v8 = v95;
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
        objc_msgSend(v15, "asset");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "assetId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        TRIValidateAssetId();
        v20 = objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          TRILogCategory_Server();
          v76 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
LABEL_75:
            v75 = context;

            goto LABEL_76;
          }
          objc_msgSend(v5, "treatmentId");
          v77 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "asset");
          v78 = v9;
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "assetId");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "factor");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "name");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v109 = v77;
          v110 = 2114;
          v111 = v80;
          v112 = 2114;
          v113 = v82;
          _os_log_error_impl(&dword_1D207F000, v76, OS_LOG_TYPE_ERROR, "Treatment %@ has unsuitable asset id \"%{public}@\" for factor %{public}@.", buf, 0x20u);

          v9 = v78;
LABEL_83:

          goto LABEL_75;
        }
        if ((objc_msgSend(v12, "hasFactor") & 1) == 0)
        {
          TRILogCategory_Server();
          v76 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            goto LABEL_75;
          objc_msgSend(v5, "treatmentId");
          v77 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v109 = v77;
          _os_log_error_impl(&dword_1D207F000, v76, OS_LOG_TYPE_ERROR, "Treatment %@ has missing factor.", buf, 0xCu);
          goto LABEL_83;
        }
        v97 = v9;
        objc_msgSend(v12, "factor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "treatmentId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIClientTreatmentStorage _assetURLForFactor:treatmentId:](v94, "_assetURLForFactor:treatmentId:", v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", v89, v94, CFSTR("TRIClientTreatmentStorage.m"), 807, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("targetURL.path"));

        }
        objc_msgSend(v24, "stringByDeletingLastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = 0;
        v27 = objc_msgSend(v26, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v25, 1, 0, &v103);
        v28 = v103;

        if ((v27 & 1) == 0)
        {
          TRILogCategory_Server();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v109 = v28;
            _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Failed to create directory for factor: %{public}@", buf, 0xCu);
          }

        }
        if (objc_msgSend(v15, "hasIsOnDemand")
          && objc_msgSend(v15, "isOnDemand")
          && !-[TRIAssetStore hasAssetWithIdentifier:type:](v96, "hasAssetWithIdentifier:type:", v20, 0))
        {
          v31 = 0;
          v30 = 1;
        }
        else if (-[TRIAssetStore linkAssetWithIdentifier:toPath:](v96, "linkAssetWithIdentifier:toPath:", v20, v24))
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

        v5 = v93;
        v9 = v97;
        v8 = v95;
        if ((v31 & 1) != 0)
          goto LABEL_38;

        objc_autoreleasePoolPop(context);
        if (!v30)
          goto LABEL_77;
LABEL_39:
        ++v10;
        v11 = v9;
      }
      while (v100 != v10);
      v55 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
      v100 = v55;
      if (!v55)
      {

        if (!v9)
          goto LABEL_62;
        objc_msgSend(v5, "treatmentId");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v9;
        -[TRIClientTreatmentStorage _baseUrlForTreatment:namespaceName:](v94, "_baseUrlForTreatment:namespaceName:", v56, v9);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "path");
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v59;
        if (!v61)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "handleFailureInMethod:object:file:lineNumber:description:", v89, v94, CFSTR("TRIClientTreatmentStorage.m"), 885, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("directory"));

        }
        v102 = 0;
        v62 = objc_msgSend(v60, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v61, 1, 0, &v102);
        v63 = v102;

        if ((v62 & 1) == 0)
        {
          TRILogCategory_Server();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v109 = v61;
            v110 = 2114;
            v111 = v63;
            _os_log_error_impl(&dword_1D207F000, v64, OS_LOG_TYPE_ERROR, "Failed to create directory for treatment at %{public}@: %{public}@", buf, 0x16u);
          }

        }
        v65 = v61;
        if (!v61)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "handleFailureInMethod:object:file:lineNumber:description:", v89, v94, CFSTR("TRIClientTreatmentStorage.m"), 892, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("directory"));

        }
        v66 = +[TRIReferenceManagedDir createFromDir:](TRIReferenceManagedDir, "createFromDir:", v65);

        if (!v66)
        {
          TRILogCategory_Server();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v109 = v65;
            _os_log_error_impl(&dword_1D207F000, v67, OS_LOG_TYPE_ERROR, "Failed to create reference-managed directory at %{public}@ for factor", buf, 0xCu);
          }

        }
        v9 = v57;
        goto LABEL_79;
      }
    }
  }

LABEL_62:
  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "treatmentId");
    v69 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v109 = v69;
    _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Unable to find a namespace name from factor levels in treatment %{public}@", buf, 0xCu);

  }
LABEL_78:
  v66 = 0;
LABEL_79:

  return v66;
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
    v27[2] = __107__TRIClientTreatmentStorage__saveNamespacePartitionedTreatmentsForTreatment_forNamespaceNames_forRollouts___block_invoke;
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

void __107__TRIClientTreatmentStorage__saveNamespacePartitionedTreatmentsForTreatment_forNamespaceNames_forRollouts___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  _BYTE *v29;
  id v30;
  id v31;
  uint8_t buf[4];
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
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIClientTreatmentStorage.m"), 942, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("referenceURL"));

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_resolveAssetPathsInTreatment:usingReferenceURL:", v8, v12) & 1) != 0)
  {
    v29 = a4;
    objc_msgSend(v8, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIClientTreatmentStorage.m"), 952, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v15 = objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v31);
    v16 = v31;
    v17 = v16;
    if (v15)
    {
      v30 = v16;
      v28 = objc_msgSend(v13, "writeToURL:options:error:", v11, 268435457, &v30);
      v18 = v11;
      v19 = v8;
      v20 = v13;
      v21 = v7;
      v22 = v9;
      v23 = v30;

      v17 = v23;
      v9 = v22;
      v7 = v21;
      v13 = v20;
      v8 = v19;
      v11 = v18;
      if ((v28 & 1) != 0)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {

    }
    TRILogCategory_Server();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v17;
      _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Unable to write serialized namespace treatment: %{public}@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *v29 = 1;
    goto LABEL_19;
  }
  TRILogCategory_Server();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v12;
    _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "Unable to resolve asset paths with reference URL %@", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  *a4 = 1;
LABEL_20:

  objc_autoreleasePoolPop(v9);
}

- (id)_defaultsAssetURLForFactor:(id)a3
{
  return -[TRIClientTreatmentStorage _assetURLForFactor:treatmentId:](self, "_assetURLForFactor:treatmentId:", a3, CFSTR("defaults"));
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
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 977, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  -[TRIClientTreatmentStorage _baseUrlForTreatment:namespaceName:](self, "_baseUrlForTreatment:namespaceName:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC0AE0];
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 979, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("dir.path"));

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
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 999, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentURL"));

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
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 1024, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentBasename"));

  }
  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("pb"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 1026, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

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
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentStorage.m"), 1031, CFSTR("referenceURL must be a directory"));

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
