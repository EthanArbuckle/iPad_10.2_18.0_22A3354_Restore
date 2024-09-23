@implementation TRIPurgeableExperimentAndRolloutProvider

- (TRIPurgeableExperimentAndRolloutProvider)initWithPaths:(id)a3 experimentDatabase:(id)a4 rolloutDatabase:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRIPurgeableExperimentAndRolloutProvider *v12;
  TRIPurgeableExperimentAndRolloutProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRIPurgeableExperimentAndRolloutProvider;
  v12 = -[TRIPurgeableExperimentAndRolloutProvider init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_paths, a3);
    objc_storeStrong((id *)&v13->_experimentDatabase, a4);
    objc_storeStrong((id *)&v13->_rolloutDatabase, a5);
  }

  return v13;
}

- (id)purgeableExperimentsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "set");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Querying for purgeable experiments.", buf, 2u);
  }

  -[TRIPurgeableExperimentAndRolloutProvider _purgeablesForExperimentsFromNamespaces:eagerFactors:overriddenFactors:shouldGenerateAssetPaths:purgeableExperiments:purgeableAssets:](self, "_purgeablesForExperimentsFromNamespaces:eagerFactors:overriddenFactors:shouldGenerateAssetPaths:purgeableExperiments:purgeableAssets:", v11, v10, v9, 0, &v17, 0);
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134217984;
    v19 = v14;
    _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu purgeable experiments.", buf, 0xCu);
  }

  v15 = v17;
  return v15;
}

- (id)purgeableExperimentAssetsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionary");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Querying for purgeable experiment regular (not on-demand) assets.", buf, 2u);
  }

  -[TRIPurgeableExperimentAndRolloutProvider _purgeablesForExperimentsFromNamespaces:eagerFactors:overriddenFactors:shouldGenerateAssetPaths:purgeableExperiments:purgeableAssets:](self, "_purgeablesForExperimentsFromNamespaces:eagerFactors:overriddenFactors:shouldGenerateAssetPaths:purgeableExperiments:purgeableAssets:", v11, v10, v9, 1, 0, &v17);
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134217984;
    v19 = v14;
    _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu purgeable experiment assets.", buf, 0xCu);
  }

  v15 = v17;
  return v15;
}

- (id)purgeableRolloutsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "set");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Querying for purgeable rollouts.", buf, 2u);
  }

  -[TRIPurgeableExperimentAndRolloutProvider _purgeablesForRolloutsFromNamespaces:eagerFactors:overriddenFactors:shouldGenerateAssetPaths:purgeableExperiments:purgeableAssets:](self, "_purgeablesForRolloutsFromNamespaces:eagerFactors:overriddenFactors:shouldGenerateAssetPaths:purgeableExperiments:purgeableAssets:", v11, v10, v9, 0, &v17, 0);
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134217984;
    v19 = v14;
    _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu purgeable rollouts.", buf, 0xCu);
  }

  v15 = v17;
  return v15;
}

- (id)purgeableRolloutAssetsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionary");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Querying for purgeable rollout regular (not on-demand) assets.", buf, 2u);
  }

  -[TRIPurgeableExperimentAndRolloutProvider _purgeablesForRolloutsFromNamespaces:eagerFactors:overriddenFactors:shouldGenerateAssetPaths:purgeableExperiments:purgeableAssets:](self, "_purgeablesForRolloutsFromNamespaces:eagerFactors:overriddenFactors:shouldGenerateAssetPaths:purgeableExperiments:purgeableAssets:", v11, v10, v9, 1, 0, &v17);
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134217984;
    v19 = v14;
    _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu purgeable rollout assets.", buf, 0xCu);
  }

  v15 = v17;
  return v15;
}

- (void)_purgeablesForExperimentsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5 shouldGenerateAssetPaths:(BOOL)a6 purgeableExperiments:(id *)a7 purgeableAssets:(id *)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t *v18;
  void *v19;
  TRIExperimentDatabase *experimentDatabase;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  id v36;
  id v37;
  id v38;
  TRIPurgeableExperimentAndRolloutProvider *v39;
  _QWORD *v40;
  uint8_t *v41;
  uint64_t *v42;
  BOOL v43;
  _QWORD v44[5];
  TRIClientTreatmentStorage *v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[8];
  uint8_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  void *v57;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (objc_msgSend(v14, "count") || objc_msgSend(v15, "count"))
  {
    *(_QWORD *)buf = 0;
    v53 = buf;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__34;
    v56 = __Block_byref_object_dispose__34;
    v57 = 0;
    v46 = 0;
    v47 = (uint8_t *)&v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__34;
    v50 = __Block_byref_object_dispose__34;
    v51 = 0;
    if (v10)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v18 = v53;
    }
    else
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v18 = v47;
    }
    v19 = (void *)*((_QWORD *)v18 + 5);
    *((_QWORD *)v18 + 5) = v17;

    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = __Block_byref_object_copy__34;
    v44[4] = __Block_byref_object_dispose__34;
    v45 = -[TRIClientTreatmentStorage initWithPaths:]([TRIClientTreatmentStorage alloc], "initWithPaths:", self->_paths);
    experimentDatabase = self->_experimentDatabase;
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __177__TRIPurgeableExperimentAndRolloutProvider__purgeablesForExperimentsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke;
    v35 = &unk_1E93348B0;
    v36 = v14;
    v37 = v15;
    v43 = v10;
    v38 = v16;
    v39 = self;
    v40 = v44;
    v41 = buf;
    v42 = &v46;
    -[TRIExperimentDatabase enumerateExperimentRecordsWithBlock:](experimentDatabase, "enumerateExperimentRecordsWithBlock:", &v32);
    if (a8)
    {
      v21 = (void *)*((_QWORD *)v53 + 5);
      if (v21)
      {
        v22 = (void *)objc_msgSend(v21, "copy", v32, v33, v34, v35, v36, v37);
        v23 = *a8;
        *a8 = v22;

      }
    }
    if (a7)
    {
      v24 = (void *)*((_QWORD *)v47 + 5);
      if (v24)
      {
        v25 = (void *)objc_msgSend(v24, "copy");
        v26 = *a7;
        *a7 = v25;

      }
    }

    _Block_object_dispose(v44, 8);
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(buf, 8);
    v27 = v57;
    goto LABEL_13;
  }
  TRILogCategory_Server();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v28, OS_LOG_TYPE_DEFAULT, "Stopping search for purgeable experiments as there are no purgeable namespaces or factors", buf, 2u);
  }

  if (a8)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v30 = *a8;
    *a8 = v29;

  }
  if (a7)
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v27 = *a7;
    *a7 = v31;
LABEL_13:

  }
}

void __177__TRIPurgeableExperimentAndRolloutProvider__purgeablesForExperimentsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
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
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  id v62;
  void *v63;
  NSObject *v64;
  void *v65;
  int v66;
  id v67;
  NSObject *v68;
  int v69;
  id obj;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[5];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[3];
  uint8_t v79[128];
  uint8_t buf[4];
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "status") == 1 && !objc_msgSend(v3, "deploymentEnvironment"))
  {
    objc_msgSend(v3, "namespaces");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 != 1)
    {
      TRILogCategory_Server();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Purgeable experiment candidate has too many namespace associated with it.", buf, 2u);
      }

    }
    objc_msgSend(v3, "namespaces");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v4 = objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "treatmentId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14 && (v13 & 1) == 0)
        {
          TRILogCategory_Server();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v3, "experimentDeployment");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "experimentId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v81 = v17;
            _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Skipping experiment %{public}@ without eager factors or purgeable namespace while looking for purgeable experiments", buf, 0xCu);

          }
          goto LABEL_63;
        }
        v66 = v13;
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
        v68 = objc_claimAutoreleasedReturnValue();
        if (*(_BYTE *)(a1 + 88))
          v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        else
          v67 = 0;
        objc_msgSend(v3, "factorPackSetId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = *(void **)(a1 + 56);
          objc_msgSend(v3, "factorPackSetId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v22, "_factorPackSetHasPurgeableFactorsWithFPSId:eagerFactors:overriddenFactors:purgeableNamespaces:returningAssets:", v23, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v67);

        }
        else
        {
          v69 = 0;
        }
        v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        objc_msgSend(v3, "treatmentId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "loadTreatmentWithTreatmentId:isFilePresent:", v25, 0);
        v26 = objc_claimAutoreleasedReturnValue();

        v63 = (void *)v26;
        if (v26)
        {
          if (*(_BYTE *)(a1 + 88))
          {
            v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
            objc_msgSend(v3, "treatmentId");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "urlForFactorsWithTreatmentId:namespaceName:", v28, v4);
            v65 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v65 = 0;
          }
          v29 = v66;
          v71 = a1;
          v61 = v4;
          v62 = v3;
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          objc_msgSend(v63, "factorLevelArray");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
          if (v30)
          {
            v31 = v30;
            v72 = *(_QWORD *)v75;
            v64 = v14;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v75 != v72)
                  objc_enumerationMutation(obj);
                v33 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                fileFromFactor(v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v34;
                if (v34)
                {
                  objc_msgSend(v34, "asset");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "assetId");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  TRIValidateAssetId();
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  if (*(_BYTE *)(v71 + 88))
                  {
                    objc_msgSend(v35, "path");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = objc_msgSend(v39, "length");

                    if (v40 && v38 != 0)
                    {
                      objc_msgSend(v67, "objectForKeyedSubscript:", v38);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v42)
                      {
                        objc_msgSend(v67, "setObject:forKeyedSubscript:", v42, v38);
                      }
                      else
                      {
                        v43 = (void *)objc_opt_new();
                        objc_msgSend(v67, "setObject:forKeyedSubscript:", v43, v38);

                      }
                      objc_msgSend(v67, "objectForKeyedSubscript:", v38);
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "path");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v44, "addObject:", v45);

                      objc_msgSend(v65, "triPathAsOwner:", 0);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v46, "stringByDeletingLastPathComponent");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v35, "path");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "lastPathComponent");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();

                      v50 = (void *)MEMORY[0x1E0CB3940];
                      v78[0] = v47;
                      v78[1] = CFSTR("assets");
                      v78[2] = v49;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "pathWithComponents:", v51);
                      v52 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v67, "objectForKeyedSubscript:", v38);
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v53, "addObject:", v52);

                      v14 = v64;
                      v29 = v66;
                    }
                  }

                }
                if (factorIsValidRegularFileFactor(v33))
                {
                  objc_msgSend(v33, "factor");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "name");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v29 && !-[NSObject containsObject:](v68, "containsObject:", v55)
                    || -[NSObject containsObject:](v14, "containsObject:", v55))
                  {
                    LOBYTE(v69) = 1;
                  }

                }
              }
              v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
            }
            while (v31);
          }

          v4 = v61;
          v3 = v62;
          a1 = v71;
          if ((v69 & 1) == 0)
            goto LABEL_62;
        }
        else if (!v69)
        {
LABEL_62:

          v15 = v68;
LABEL_63:

          goto LABEL_64;
        }
        TRILogCategory_Server();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "experimentDeployment");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "experimentId");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v81 = v58;
          _os_log_impl(&dword_1D207F000, v56, OS_LOG_TYPE_DEFAULT, "Found purgeable experiment %{public}@", buf, 0xCu);

        }
        if (*(_BYTE *)(a1 + 88))
        {
          v73[0] = MEMORY[0x1E0C809B0];
          v73[1] = 3221225472;
          v73[2] = __177__TRIPurgeableExperimentAndRolloutProvider__purgeablesForExperimentsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke_19;
          v73[3] = &unk_1E9334888;
          v73[4] = *(_QWORD *)(a1 + 72);
          objc_msgSend(v67, "enumerateKeysAndObjectsUsingBlock:", v73);
        }
        else
        {
          v59 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          objc_msgSend(v3, "experimentDeployment");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "addObject:", v60);

        }
        goto LABEL_62;
      }
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "experimentDeployment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "experimentId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v81 = v19;
        v20 = "Skipping experiment %{public}@ with no treatment ID.";
        goto LABEL_19;
      }
    }
    else
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "experimentDeployment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "experimentId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v81 = v19;
        v20 = "Skipping experiment %{public}@ with no namespace name.";
LABEL_19:
        _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);

      }
    }
LABEL_64:

    goto LABEL_65;
  }
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "experimentDeployment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experimentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v81 = v6;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Skipping inactive experiment %{public}@ while looking for purgeable experiments", buf, 0xCu);

  }
LABEL_65:

}

void __177__TRIPurgeableExperimentAndRolloutProvider__purgeablesForExperimentsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v8 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v8, v10);
  if (!v7)

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v6);

}

- (BOOL)_checkForPurgeableFactorsInEagerFactors:(id)a3 factorLevel:(id)a4 legacyPath:(id)a5 overriddenFactors:(id)a6 purgeableNamespaces:(id)a7 returningAssets:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  char v49;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];

  v54[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  fileFromFactor(v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v53 = v18;
  if (v19)
  {
    objc_msgSend(v19, "asset");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "assetId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    TRIValidateAssetId();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v20, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "length");

      if (v25)
      {
        if (v23)
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, v23);
          }
          else
          {
            v27 = (void *)objc_opt_new();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, v23);

          }
          objc_msgSend(v18, "objectForKeyedSubscript:", v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "path");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v29);

          if (objc_msgSend(v15, "length"))
          {
            objc_msgSend(v20, "path");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "lastPathComponent");
            v31 = v17;
            v32 = v15;
            v33 = v13;
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = (void *)MEMORY[0x1E0CB3940];
            v54[0] = v32;
            v54[1] = CFSTR("assets");
            v54[2] = v34;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "pathWithComponents:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v53, "objectForKeyedSubscript:", v23);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addObject:", v37);

            v13 = v33;
            v15 = v32;
            v17 = v31;
          }
        }
      }
    }

  }
  if (factorIsValidRegularFileFactor(v14))
  {
    v52 = v13;
    objc_msgSend(v14, "factor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "namespaceName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "factor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend(v17, "containsObject:", v40);
    if (v43)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", v40);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v44, "containsObject:", v42))
      {
        v49 = 1;
LABEL_19:

LABEL_20:
        v13 = v52;
        goto LABEL_21;
      }
      v51 = v44;
    }
    objc_msgSend(v52, "objectForKeyedSubscript:", v40);
    v45 = v17;
    v46 = v16;
    v47 = v15;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "containsObject:", v42);

    v15 = v47;
    v16 = v46;
    v17 = v45;
    v44 = v51;
    if (!v43)
      goto LABEL_20;
    goto LABEL_19;
  }
  v49 = 0;
LABEL_21:

  return v49;
}

- (void)_purgeablesForRolloutsFromNamespaces:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5 shouldGenerateAssetPaths:(BOOL)a6 purgeableExperiments:(id *)a7 purgeableAssets:(id *)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  TRIPurgeableExperimentAndRolloutProvider *v35;
  id v36;
  uint8_t *v37;
  uint64_t *v38;
  BOOL v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[8];
  uint8_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  void *v51;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (objc_msgSend(v14, "count") || objc_msgSend(v15, "count"))
  {
    *(_QWORD *)buf = 0;
    v47 = buf;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__34;
    v50 = __Block_byref_object_dispose__34;
    v51 = 0;
    v40 = 0;
    v41 = (uint8_t *)&v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__34;
    v44 = __Block_byref_object_dispose__34;
    v45 = 0;
    if (v10)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v18 = v47;
    }
    else
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v18 = v41;
    }
    v19 = (void *)*((_QWORD *)v18 + 5);
    *((_QWORD *)v18 + 5) = v17;

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __174__TRIPurgeableExperimentAndRolloutProvider__purgeablesForRolloutsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke;
    v32[3] = &unk_1E93348D8;
    v33 = v14;
    v39 = v10;
    v34 = v15;
    v35 = self;
    v36 = v16;
    v37 = buf;
    v38 = &v40;
    v20 = (void *)MEMORY[0x1D8232C48](v32);
    -[TRIRolloutDatabase enumerateRecordsUsingTransaction:block:](self->_rolloutDatabase, "enumerateRecordsUsingTransaction:block:", 0, v20);
    if (a8)
    {
      v21 = (void *)*((_QWORD *)v47 + 5);
      if (v21)
      {
        v22 = (void *)objc_msgSend(v21, "copy");
        v23 = *a8;
        *a8 = v22;

      }
    }
    if (a7)
    {
      v24 = (void *)*((_QWORD *)v41 + 5);
      if (v24)
      {
        v25 = (void *)objc_msgSend(v24, "copy");
        v26 = *a7;
        *a7 = v25;

      }
    }

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(buf, 8);
    v27 = v51;
    goto LABEL_13;
  }
  TRILogCategory_Server();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v28, OS_LOG_TYPE_DEFAULT, "Stopping search for purgeable rollouts as there are no purgeable namespaces or factors", buf, 2u);
  }

  if (a8)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v30 = *a8;
    *a8 = v29;

  }
  if (a7)
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v27 = *a7;
    *a7 = v31;
LABEL_13:

  }
}

void __174__TRIPurgeableExperimentAndRolloutProvider__purgeablesForRolloutsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "status") != 1)
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    objc_msgSend(v3, "deployment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rolloutId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v16;
    v17 = "Skipping inactive rollout %{public}@ while looking for purgeable rollouts";
    goto LABEL_20;
  }
  objc_msgSend(v3, "activeFactorPackSetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v3, "namespaces");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v5);
          v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v8 |= objc_msgSend(*(id *)(a1 + 32), "containsObject:", v12);
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 |= v13 != 0;

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v7);

      if (((v9 | v8) & 1) != 0)
      {
        if (*(_BYTE *)(a1 + 80))
          v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        else
          v14 = 0;
        v18 = *(void **)(a1 + 48);
        objc_msgSend(v3, "activeFactorPackSetId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v18) = objc_msgSend(v18, "_factorPackSetHasPurgeableFactorsWithFPSId:eagerFactors:overriddenFactors:purgeableNamespaces:returningAssets:", v19, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), v14);

        if ((_DWORD)v18)
        {
          TRILogCategory_Server();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v3, "deployment");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "rolloutId");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v33 = v22;
            _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "Found purgeable rollout %{public}@", buf, 0xCu);

          }
          if (*(_BYTE *)(a1 + 80))
          {
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = __174__TRIPurgeableExperimentAndRolloutProvider__purgeablesForRolloutsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke_22;
            v26[3] = &unk_1E9334888;
            v26[4] = *(_QWORD *)(a1 + 64);
            -[NSObject enumerateKeysAndObjectsUsingBlock:](v14, "enumerateKeysAndObjectsUsingBlock:", v26);
          }
          else
          {
            v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
            objc_msgSend(v3, "deployment");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "rolloutId");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v25);

          }
        }
        goto LABEL_21;
      }
    }
    else
    {

    }
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    objc_msgSend(v3, "deployment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rolloutId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v16;
    v17 = "Skipping rollout %{public}@ without eager factors or purgeable namespace while looking for purgeable rollouts";
LABEL_20:
    _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);

    goto LABEL_21;
  }
  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v3;
    _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Found \"active\" rollout with missing activeFactorPackSetId: %{public}@", buf, 0xCu);
  }
LABEL_21:

}

void __174__TRIPurgeableExperimentAndRolloutProvider__purgeablesForRolloutsFromNamespaces_eagerFactors_overriddenFactors_shouldGenerateAssetPaths_purgeableExperiments_purgeableAssets___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v8 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v8, v10);
  if (!v7)

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v6);

}

- (BOOL)_factorPackSetHasPurgeableFactorsWithFPSId:(id)a3 eagerFactors:(id)a4 overriddenFactors:(id)a5 purgeableNamespaces:(id)a6 returningAssets:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  TRIFactorPackSetStorage *v17;
  TRIFactorPackStorage *v18;
  TRIFBFactorPackStorage *v19;
  TRIFBFactorPackStorage *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  TRIFactorPackStorage *v25;
  _QWORD v27[4];
  TRIFBFactorPackStorage *v28;
  TRIPurgeableExperimentAndRolloutProvider *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  TRIFactorPackStorage *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[TRIFactorPackSetStorage initWithPaths:]([TRIFactorPackSetStorage alloc], "initWithPaths:", self->_paths);
  v18 = -[TRIFactorPackStorage initWithPaths:]([TRIFactorPackStorage alloc], "initWithPaths:", self->_paths);
  v19 = -[TRIFBFactorPackStorage initWithPaths:]([TRIFBFactorPackStorage alloc], "initWithPaths:", self->_paths);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __154__TRIPurgeableExperimentAndRolloutProvider__factorPackSetHasPurgeableFactorsWithFPSId_eagerFactors_overriddenFactors_purgeableNamespaces_returningAssets___block_invoke;
  v27[3] = &unk_1E9334950;
  v20 = v19;
  v28 = v20;
  v29 = self;
  v21 = v13;
  v30 = v21;
  v22 = v14;
  v31 = v22;
  v23 = v15;
  v32 = v23;
  v24 = v16;
  v33 = v24;
  v35 = &v36;
  v25 = v18;
  v34 = v25;
  -[TRIFactorPackSetStorage enumerateFactorPacksForFactorPackSet:usingLegacyPaths:withBlock:](v17, "enumerateFactorPacksForFactorPackSet:usingLegacyPaths:withBlock:", v12, 0, v27);
  LOBYTE(v13) = *((_BYTE *)v37 + 24);

  _Block_object_dispose(&v36, 8);
  return (char)v13;
}

void __154__TRIPurgeableExperimentAndRolloutProvider__factorPackSetHasPurgeableFactorsWithFPSId_eagerFactors_overriddenFactors_purgeableNamespaces_returningAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  id *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];
  id v28;
  id v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[4];
  id v33;
  _QWORD v34[2];
  id v35;
  id v36;
  id v37;
  _QWORD v38[2];

  v24 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "levels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __154__TRIPurgeableExperimentAndRolloutProvider__factorPackSetHasPurgeableFactorsWithFPSId_eagerFactors_overriddenFactors_purgeableNamespaces_returningAssets___block_invoke_2;
    v32[3] = &unk_1E9334900;
    v8 = &v33;
    v33 = v6;
    v9 = (id *)v34;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v34[0] = v10;
    v34[1] = v11;
    v13 = &v35;
    v35 = v12;
    v14 = &v36;
    v36 = *(id *)(a1 + 56);
    v15 = &v37;
    v37 = *(id *)(a1 + 64);
    v16 = (id *)v38;
    v17 = *(id *)(a1 + 72);
    v18 = *(_QWORD *)(a1 + 88);
    v38[0] = v17;
    v38[1] = v18;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v32);

  }
  else
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __154__TRIPurgeableExperimentAndRolloutProvider__factorPackSetHasPurgeableFactorsWithFPSId_eagerFactors_overriddenFactors_purgeableNamespaces_returningAssets___block_invoke_29;
    v25[3] = &unk_1E9334928;
    v8 = &v26;
    v26 = *(id *)(a1 + 80);
    v9 = (id *)v27;
    v19 = v24;
    v20 = *(_QWORD *)(a1 + 40);
    v21 = *(void **)(a1 + 48);
    v27[0] = v19;
    v27[1] = v20;
    v13 = &v28;
    v28 = v21;
    v14 = &v29;
    v29 = *(id *)(a1 + 56);
    v15 = &v30;
    v30 = *(id *)(a1 + 64);
    v16 = (id *)v31;
    v22 = *(id *)(a1 + 72);
    v23 = *(_QWORD *)(a1 + 88);
    v31[0] = v22;
    v31[1] = v23;
    objc_msgSend(v19, "enumerateFactorLevelsWithBlock:", v25);
  }

}

void __154__TRIPurgeableExperimentAndRolloutProvider__factorPackSetHasPurgeableFactorsWithFPSId_eagerFactors_overriddenFactors_purgeableNamespaces_returningAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(*(id *)(a1 + 32), "sourceAsFactorPackId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TRIValidateFactorPackId();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "namespaceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathForFactorLevelsWithFactorPackId:namespaceName:", v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC0AA8];
    objc_msgSend(*(id *)(a1 + 32), "namespaceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertFBFactorLevelToProtoFactorLevel:parentDir:namespaceName:isRelativePath:", v3, v9, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "namespaceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "legacyPathForFactorLevelsWithFactorPackId:namespaceName:", v6, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 48), "_checkForPurgeableFactorsInEagerFactors:factorLevel:legacyPath:overriddenFactors:purgeableNamespaces:returningAssets:", *(_QWORD *)(a1 + 56), v12, v15, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80)))*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  }
  else
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sourceAsFactorPackId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Invalid factor pack id %@ while enumerating factor levels:", (uint8_t *)&v17, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v4);
}

void __154__TRIPurgeableExperimentAndRolloutProvider__factorPackSetHasPurgeableFactorsWithFPSId_eagerFactors_overriddenFactors_purgeableNamespaces_returningAssets___block_invoke_29(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "factorPackId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "selectedNamespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legacyPathForFactorPackWithId:namespaceName:", v6, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(*(id *)(a1 + 48), "_checkForPurgeableFactorsInEagerFactors:factorLevel:legacyPath:overriddenFactors:purgeableNamespaces:returningAssets:", *(_QWORD *)(a1 + 56), v5, v9, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  if ((_DWORD)v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutDatabase, 0);
  objc_storeStrong((id *)&self->_experimentDatabase, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
