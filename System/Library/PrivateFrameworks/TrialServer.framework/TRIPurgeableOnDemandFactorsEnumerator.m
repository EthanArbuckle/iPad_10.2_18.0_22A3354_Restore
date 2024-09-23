@implementation TRIPurgeableOnDemandFactorsEnumerator

- (TRIPurgeableOnDemandFactorsEnumerator)initWithPaths:(id)a3 namespaceResolver:(id)a4
{
  id v7;
  id v8;
  TRIPurgeableOnDemandFactorsEnumerator *v9;
  TRIPurgeableOnDemandFactorsEnumerator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIPurgeableOnDemandFactorsEnumerator;
  v9 = -[TRIPurgeableOnDemandFactorsEnumerator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_namespaceResolver, a4);
  }

  return v10;
}

- (void)enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames:(id)a3 purgeableFactorFilterBlock:(id)a4 block:(id)a5
{
  id v8;
  void (**v9)(id, void *, id, _BYTE *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  TRIPurgeableConstruct *v18;
  TRIPurgeableConstruct *v19;
  BOOL v20;
  _BOOL4 v21;
  id obj;
  uint64_t v23;
  id v25;
  void *v26;
  char v27;
  _QWORD v28[5];
  id v29;
  id v30;
  TRIPurgeableOnDemandFactorsEnumerator *v31;
  id v32;
  uint64_t *v33;
  SEL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25 = a4;
  v9 = (void (**)(id, void *, id, _BYTE *))a5;
  v26 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v10)
  {
    v23 = *(_QWORD *)v42;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v23)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1D8232A5C]();
      v14 = (void *)objc_opt_new();
      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__50;
      v39 = __Block_byref_object_dispose__50;
      v40 = 0;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __139__TRIPurgeableOnDemandFactorsEnumerator_enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames_purgeableFactorFilterBlock_block___block_invoke;
      v28[3] = &unk_1E9336258;
      v32 = v25;
      v33 = &v35;
      v28[4] = v12;
      v15 = v14;
      v29 = v15;
      v16 = v26;
      v34 = a2;
      v30 = v16;
      v31 = self;
      v17 = (void *)MEMORY[0x1D8232C48](v28);
      -[TRIPurgeableOnDemandFactorsEnumerator _enumerateRolloutOnDemandFactorsWithNamespaceName:block:](self, "_enumerateRolloutOnDemandFactorsWithNamespaceName:block:", v12, v17);
      v21 = 1;
      if (v36[5])
      {
        v27 = 0;
        v18 = [TRIPurgeableConstruct alloc];
        v19 = -[TRIPurgeableConstruct initWithFactorPackId:treatmentId:namespaceName:purgeableAssetFactorNames:](v18, "initWithFactorPackId:treatmentId:namespaceName:purgeableAssetFactorNames:", v36[5], 0, v12, v15);
        v9[2](v9, v19, v16, &v27);
        v20 = v27 == 0;

        if (!v20)
          v21 = 0;
      }

      _Block_object_dispose(&v35, 8);
      objc_autoreleasePoolPop(v13);
      if (!v21)
        break;
      if (v10 == ++v11)
      {
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __139__TRIPurgeableOnDemandFactorsEnumerator_enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames_purgeableFactorFilterBlock_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  TRIFactorPackStorage *v21;
  uint64_t v22;
  void *v23;
  TRIFBFactorPackStorage *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[3];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 64);
  if (!v5
    || (objc_msgSend(v3, "factorName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = (*(uint64_t (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, *(_QWORD *)(a1 + 32)),
        v6,
        v7))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v9 = *(void **)(v8 + 40);
    if (v9)
    {
      v10 = v9;
      v11 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v10;
    }
    else
    {
      objc_msgSend(v4, "factorPackId");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v11 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;
    }

    objc_msgSend(v4, "filePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = *(void **)(a1 + 40);
      objc_msgSend(v4, "factorName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      objc_msgSend(v4, "assetId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v18, v17);
      }
      else
      {
        v19 = (void *)objc_opt_new();
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v19, v17);

      }
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v14);

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), CFSTR("TRIPurgeableOnDemandFactorsEnumerator.m"), 62, CFSTR("Expected a valid factorPackId."));

      }
      v21 = -[TRIFactorPackStorage initWithPaths:]([TRIFactorPackStorage alloc], "initWithPaths:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8));
      -[TRIFactorPackStorage legacyPathForFactorPackWithId:namespaceName:](v21, "legacyPathForFactorPackWithId:namespaceName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 32));
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        if (_os_feature_enabled_impl())
        {
          v24 = -[TRIFBFactorPackStorage initWithPaths:]([TRIFBFactorPackStorage alloc], "initWithPaths:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8));
          -[TRIFBFactorPackStorage legacyPathForFactorLevelsWithFactorPackId:namespaceName:](v24, "legacyPathForFactorLevelsWithFactorPackId:namespaceName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 32));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v25, "isEqualToString:", v23) & 1) != 0)
          {
            if (_os_feature_enabled_impl())
            {
              v26 = v25;

              v23 = v26;
            }
          }
          else
          {
            TRILogCategory_Server();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
              *(_DWORD *)buf = 138543874;
              v37 = v25;
              v38 = 2114;
              v39 = v23;
              v40 = 2114;
              v41 = v33;
              _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Legacy path from flatbuffers: %{public}@ does not match path from protobuf: %{public}@ for factor pack id: %{public}@", buf, 0x20u);
            }

          }
        }
        objc_msgSend(v14, "lastPathComponent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0CB3940];
        v35[0] = v23;
        v35[1] = CFSTR("assets");
        v35[2] = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "pathWithComponents:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v17);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v31);

      }
    }

  }
}

- (void)enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames:(id)a3 purgeableFactorFilterBlock:(id)a4 block:(id)a5
{
  id v8;
  void (**v9)(id, void *, id, _BYTE *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  TRIPurgeableConstruct *v18;
  TRIPurgeableConstruct *v19;
  BOOL v20;
  int v21;
  id obj;
  uint64_t v23;
  id v24;
  void *v25;
  char v26;
  _QWORD v27[5];
  id v28;
  id v29;
  TRIPurgeableOnDemandFactorsEnumerator *v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v24 = a4;
  v9 = (void (**)(id, void *, id, _BYTE *))a5;
  v25 = (void *)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v10)
  {
    v23 = *(_QWORD *)v47;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v23)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1D8232A5C]();
      v14 = (void *)objc_opt_new();
      v40 = 0;
      v41 = &v40;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__50;
      v44 = __Block_byref_object_dispose__50;
      v45 = 0;
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__50;
      v38 = __Block_byref_object_dispose__50;
      v39 = 0;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __142__TRIPurgeableOnDemandFactorsEnumerator_enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames_purgeableFactorFilterBlock_block___block_invoke;
      v27[3] = &unk_1E9336280;
      v31 = v24;
      v32 = &v40;
      v27[4] = v12;
      v33 = &v34;
      v15 = v14;
      v28 = v15;
      v16 = v25;
      v29 = v16;
      v30 = self;
      v17 = (void *)MEMORY[0x1D8232C48](v27);
      -[TRIPurgeableOnDemandFactorsEnumerator _enumerateExperimentOnDemandFactorsWithNamespaceName:block:](self, "_enumerateExperimentOnDemandFactorsWithNamespaceName:block:", v12, v17);
      if (!v41[5] && !v35[5])
        goto LABEL_10;
      v26 = 0;
      v18 = [TRIPurgeableConstruct alloc];
      v19 = -[TRIPurgeableConstruct initWithFactorPackId:treatmentId:namespaceName:purgeableAssetFactorNames:](v18, "initWithFactorPackId:treatmentId:namespaceName:purgeableAssetFactorNames:", v41[5], v35[5], v12, v15);
      v9[2](v9, v19, v16, &v26);
      v20 = v26 == 0;

      if (!v20)
        v21 = 0;
      else
LABEL_10:
        v21 = 1;

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v40, 8);

      objc_autoreleasePoolPop(v13);
      if (!v21)
        break;
      if (v10 == ++v11)
      {
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __142__TRIPurgeableOnDemandFactorsEnumerator_enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames_purgeableFactorFilterBlock_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  TRIFactorPackStorage *v28;
  void *v29;
  void *v30;
  TRIFBFactorPackStorage *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[3];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 64);
  if (!v5
    || (objc_msgSend(v3, "factorName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = (*(uint64_t (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, *(_QWORD *)(a1 + 32)),
        v6,
        v7))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v9 = *(void **)(v8 + 40);
    if (v9)
    {
      v10 = v9;
      v11 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v10;
    }
    else
    {
      objc_msgSend(v4, "factorPackId");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v11 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;
    }

    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v15 = *(void **)(v14 + 40);
    if (v15)
    {
      v16 = v15;
      v17 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v16;
    }
    else
    {
      objc_msgSend(v4, "treatmentId");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v17 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
    }

    objc_msgSend(v4, "filePath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = *(void **)(a1 + 40);
      objc_msgSend(v4, "factorName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v22);

      objc_msgSend(v4, "assetId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v24, v23);
      }
      else
      {
        v25 = (void *)objc_opt_new();
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v25, v23);

      }
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v20);

      objc_msgSend(v4, "factorPackId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = -[TRIFactorPackStorage initWithPaths:]([TRIFactorPackStorage alloc], "initWithPaths:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8));
        objc_msgSend(v4, "factorPackId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIFactorPackStorage legacyPathForFactorPackWithId:namespaceName:](v28, "legacyPathForFactorPackWithId:namespaceName:", v29, *(_QWORD *)(a1 + 32));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          if (_os_feature_enabled_impl())
          {
            v31 = -[TRIFBFactorPackStorage initWithPaths:]([TRIFBFactorPackStorage alloc], "initWithPaths:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8));
            objc_msgSend(v4, "factorPackId");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRIFBFactorPackStorage legacyPathForFactorLevelsWithFactorPackId:namespaceName:](v31, "legacyPathForFactorLevelsWithFactorPackId:namespaceName:", v32, *(_QWORD *)(a1 + 32));
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v33, "isEqualToString:", v30) & 1) != 0)
            {
              if (_os_feature_enabled_impl())
              {
                v34 = v33;

                v30 = v34;
              }
            }
            else
            {
              TRILogCategory_Server();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                v41 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
                *(_DWORD *)buf = 138543874;
                v44 = v33;
                v45 = 2114;
                v46 = v30;
                v47 = 2114;
                v48 = v41;
                _os_log_error_impl(&dword_1D207F000, v35, OS_LOG_TYPE_ERROR, "Legacy path from flatbuffers: %{public}@ does not match path from protobuf: %{public}@ for factor pack id: %{public}@", buf, 0x20u);
              }

            }
          }
          objc_msgSend(v20, "lastPathComponent");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)MEMORY[0x1E0CB3940];
          v42[0] = v30;
          v42[1] = CFSTR("assets");
          v42[2] = v36;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "pathWithComponents:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v23);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v39);

        }
      }

    }
  }

}

- (void)_enumerateRolloutOnDemandFactorsWithNamespaceName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0DC0AE8], "factorProviderWithPaths:namespaceName:resolver:", self->_paths, v6, self->_namespaceResolver);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__TRIPurgeableOnDemandFactorsEnumerator__enumerateRolloutOnDemandFactorsWithNamespaceName_block___block_invoke;
  v19[3] = &unk_1E932F918;
  v10 = v9;
  v20 = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v19);
  if (objc_msgSend(v10, "hasAnyTreatmentInLayers:", 2))
  {
    objc_msgSend(v10, "providerForTreatmentLayer:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v12;
      objc_msgSend(v18, "factorPackId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13
        && (objc_msgSend(v18, "factorPackId"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            TRIValidateFactorPackId(),
            v15 = objc_claimAutoreleasedReturnValue(),
            v14,
            v13,
            v15))
      {
        objc_msgSend(v18, "factorLevels");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIPurgeableOnDemandFactorsEnumerator _filterOndemandAssetsForFactorLevels:forFactorPackId:treatmentId:block:](self, "_filterOndemandAssetsForFactorLevels:forFactorPackId:treatmentId:block:", v16, v15, 0, v7);

      }
      else
      {
        TRILogCategory_Server();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v18, "rolloutId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v22 = v6;
          v23 = 2114;
          v24 = v17;
          _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Found invalid factor pack ID for namespace %{public}@ from rollout provider with rolloutId %{public}@", buf, 0x16u);

        }
      }

    }
  }
  if (v11)
    v11[2](v11);

  objc_autoreleasePoolPop(v8);
}

uint64_t __97__TRIPurgeableOnDemandFactorsEnumerator__enumerateRolloutOnDemandFactorsWithNamespaceName_block___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispose");
}

- (void)_enumerateExperimentOnDemandFactorsWithNamespaceName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *context;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  context = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0DC0AE8], "factorProviderWithPaths:namespaceName:resolver:", self->_paths, v6, self->_namespaceResolver);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __100__TRIPurgeableOnDemandFactorsEnumerator__enumerateExperimentOnDemandFactorsWithNamespaceName_block___block_invoke;
  v23[3] = &unk_1E932F918;
  v9 = v8;
  v24 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v23);
  if (objc_msgSend(v9, "hasAnyTreatmentInLayers:", 32))
  {
    objc_msgSend(v9, "providerForTreatmentLayer:", 32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
      objc_msgSend(v12, "factorPackId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13
        && (objc_msgSend(v12, "factorPackId"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            TRIValidateFactorPackId(),
            v15 = objc_claimAutoreleasedReturnValue(),
            v14,
            v13,
            v15))
      {
        objc_msgSend(v12, "factorLevels");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIPurgeableOnDemandFactorsEnumerator _filterOndemandAssetsForFactorLevels:forFactorPackId:treatmentId:block:](self, "_filterOndemandAssetsForFactorLevels:forFactorPackId:treatmentId:block:", v16, v15, 0, v7);

      }
      else
      {
        TRILogCategory_Server();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "experimentId");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v26 = v6;
          v27 = 2114;
          v28 = v21;
          _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Found invalid treatmentID or factorPackId for namespace %{public}@ from experiment provider with experiment %{public}@", buf, 0x16u);

        }
      }

    }
  }
  if (objc_msgSend(v9, "hasAnyTreatmentInLayers:", 4))
  {
    objc_msgSend(v9, "providerForTreatmentLayer:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "treatmentId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v17, "factorLevels");
      v19 = objc_claimAutoreleasedReturnValue();
      -[TRIPurgeableOnDemandFactorsEnumerator _filterOndemandAssetsForFactorLevels:forFactorPackId:treatmentId:block:](self, "_filterOndemandAssetsForFactorLevels:forFactorPackId:treatmentId:block:", v19, 0, v18, v7);
    }
    else
    {
      TRILogCategory_Server();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "experimentId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v6;
        v27 = 2114;
        v28 = v20;
        _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Found invalid treatmentID for namespace %{public}@ from experiment provider with experiment %{public}@", buf, 0x16u);

      }
    }

  }
  if (v10)
    v10[2](v10);

  objc_autoreleasePoolPop(context);
}

uint64_t __100__TRIPurgeableOnDemandFactorsEnumerator__enumerateExperimentOnDemandFactorsWithNamespaceName_block___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispose");
}

- (void)_filterOndemandAssetsForFactorLevels:(id)a3 forFactorPackId:(id)a4 treatmentId:(id)a5 block:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  TRIPurgeableAsset *v25;
  void *v26;
  NSObject *v27;
  void (**v28)(id, NSObject *);
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v30 = a4;
  v29 = a5;
  v28 = (void (**)(id, NSObject *))a6;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v14, "factor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v14, "level");
          v17 = objc_claimAutoreleasedReturnValue();
          -[NSObject fileOrDirectoryLevelWithIsDir:](v17, "fileOrDirectoryLevelWithIsDir:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            if (objc_msgSend(v18, "isOnDemand"))
            {
              objc_msgSend(v19, "path");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "length");

              if (v21)
              {
                objc_msgSend(v19, "asset");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "assetId");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                TRIValidateAssetId();
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v24)
                {
                  v25 = [TRIPurgeableAsset alloc];
                  objc_msgSend(v19, "path");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = -[TRIPurgeableAsset initWithFactorName:assetId:filePath:factorPackId:treatmentId:](v25, "initWithFactorName:assetId:filePath:factorPackId:treatmentId:", v16, v24, v26, v30, v29);

                  v28[2](v28, v27);
                }
                else
                {
                  TRILogCategory_Server();
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v36 = v19;
                    _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Invalid asset id for fileLevel %{public}@", buf, 0xCu);
                  }
                }

              }
            }
          }

        }
        else
        {
          TRILogCategory_Server();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v36 = v14;
            _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Got nil factorName for factorLevel %{public}@", buf, 0xCu);
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceResolver, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
