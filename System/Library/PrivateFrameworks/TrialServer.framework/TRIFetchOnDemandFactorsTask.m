@implementation TRIFetchOnDemandFactorsTask

- (int)taskType
{
  return 17;
}

- (BOOL)isCurrentlyExecuting
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isCurrentlyExecuting);
  return v2 & 1;
}

- (TRIFetchOnDemandFactorsTask)initWithAssetIndexesByTreatment:(id)a3 experimentId:(id)a4 assetIdsByFactorPack:(id)a5 rolloutFactorNames:(id)a6 rolloutDeployment:(id)a7 namespaceName:(id)a8 taskAttributing:(id)a9 notificationKey:(id)a10 capabilityModifier:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  TRIFetchOnDemandFactorsTask *v21;
  TRIFetchOnDemandFactorsTask *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  TRITrialSystemTelemetry *trialSystemTelemetry;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _PASLock *lock;
  uint64_t v35;
  NSMutableDictionary *factorNameByAssetId;
  id obj;
  id v39;
  id v40;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  obj = a4;
  v46 = a4;
  v39 = a5;
  v47 = a5;
  v45 = a6;
  v40 = a7;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v44 = a10;
  v43 = a11;
  v48.receiver = self;
  v48.super_class = (Class)TRIFetchOnDemandFactorsTask;
  v21 = -[TRIFetchOnDemandFactorsTask init](&v48, sel_init);
  v22 = v21;
  if (v21)
  {
    v42 = v17;
    objc_storeStrong((id *)&v21->_assetIndexesByTreatment, a3);
    objc_storeStrong((id *)&v22->_experimentId, obj);
    objc_storeStrong((id *)&v22->_assetIdsByFactorPack, v39);
    objc_storeStrong((id *)&v22->_rolloutFactorNames, a6);
    objc_storeStrong((id *)&v22->_deployment, v40);
    objc_storeStrong((id *)&v22->_namespaceName, a8);
    objc_storeStrong((id *)&v22->_taskAttributing, a9);
    v22->_retryCount = 0;
    objc_storeStrong((id *)&v22->_notificationKey, a10);
    objc_storeStrong((id *)&v22->_capabilityModifier, a11);
    atomic_store(0, (unsigned __int8 *)&v22->_isCurrentlyExecuting);
    objc_msgSend(v47, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v23, "count") >= 2)
    {
      TRILogCategory_Server();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v50 = v23;
        _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "On-demand factor fetch was initiated for >1 factor pack and will be excluded from telemetry. Got %{public}@", buf, 0xCu);
      }

    }
    objc_msgSend(v42, "allKeys", obj);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIFetchOnDemandFactorsTask _telemetryForFactorPackIds:rolloutDeployment:treatmentIds:experimentId:namespaceName:taskAttributing:](v22, "_telemetryForFactorPackIds:rolloutDeployment:treatmentIds:experimentId:namespaceName:taskAttributing:", v23, v18, v25, v46, v19, v20);
    v26 = objc_claimAutoreleasedReturnValue();
    trialSystemTelemetry = v22->_trialSystemTelemetry;
    v22->_trialSystemTelemetry = (TRITrialSystemTelemetry *)v26;

    v28 = objc_opt_new();
    v29 = objc_opt_new();
    v30 = *(void **)(v28 + 8);
    *(_QWORD *)(v28 + 8) = v29;

    *(_DWORD *)(v28 + 16) = 0;
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v22->_rolloutFactorNames);
    v32 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v31;

    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v28);
    lock = v22->_lock;
    v22->_lock = (_PASLock *)v33;

    v35 = objc_opt_new();
    factorNameByAssetId = v22->_factorNameByAssetId;
    v22->_factorNameByAssetId = (NSMutableDictionary *)v35;

    v17 = v42;
  }

  return v22;
}

+ (id)taskWithAssetIndexesByTreatment:(id)a3 experimentId:(id)a4 assetIdsByFactorPack:(id)a5 rolloutFactorNames:(id)a6 rolloutDeployment:(id)a7 namespaceName:(id)a8 taskAttributing:(id)a9 notificationKey:(id)a10 capabilityModifier:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;

  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  v27 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAssetIndexesByTreatment:experimentId:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployment:namespaceName:taskAttributing:notificationKey:capabilityModifier:", v26, v25, v24, v23, v22, v21, v20, v19, v18);

  return v27;
}

- (id)_telemetryForFactorPackIds:(id)a3 rolloutDeployment:(id)a4 treatmentIds:(id)a5 experimentId:(id)a6 namespaceName:(id)a7 taskAttributing:(id)a8
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
  void *v25;
  void *v26;
  void *v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a7;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v17, "networkOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFieldsForDownloadOptions:", v20);

  objc_msgSend(v19, "ensureFactorFields");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setNamespaceName:", v18);

  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v13, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ensureFactorFields");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setClientFactorPackId:", v22);

  }
  if (v14)
    objc_msgSend(v19, "setFieldsForRolloutDeployment:", v14);
  if (v16)
  {
    objc_msgSend(v19, "ensureExperimentFields");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setClientExperimentId:", v16);

  }
  if (objc_msgSend(v15, "count") == 1)
  {
    objc_msgSend(v15, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ensureExperimentFields");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClientTreatmentId:", v25);

  }
  +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mergeFrom:", v27);

  return v19;
}

- (TRITaskAttributing)taskAttribution
{
  return self->_taskAttributing;
}

- (NSArray)tags
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_notificationKey)
  {
    v4[0] = self->_notificationKey;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- ($A5A652246548B43F8BC05201A1C72A70)_saveIndexedAssetURLs:(id)a3 withTreatmentId:(id)a4 usingAssetMetadata:(id)a5 downloadOptions:(id)a6 paths:(id)a7 downloadSize:(unint64_t *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  TRIAssetStore *v20;
  void *v21;
  TRIAssetStore *v22;
  id v23;
  id v24;
  TRIAssetStore *v25;
  $A5A652246548B43F8BC05201A1C72A70 v26;
  _QWORD v29[5];
  id v30;
  id v31;
  TRIAssetStore *v32;
  uint64_t *v33;
  uint64_t *v34;
  SEL v35;
  unint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  const char *v46;
  char v47;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = [TRIAssetStore alloc];
  objc_msgSend(v18, "activity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[TRIAssetStore initWithPaths:monitoredActivity:](v20, "initWithPaths:monitoredActivity:", v19, v21);

  v43 = 0;
  v44 = &v43;
  v45 = 0x2810000000;
  v46 = "";
  v47 = 1;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__18;
  v41 = __Block_byref_object_dispose__18;
  v42 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __129__TRIFetchOnDemandFactorsTask__saveIndexedAssetURLs_withTreatmentId_usingAssetMetadata_downloadOptions_paths_downloadSize_error___block_invoke;
  v29[3] = &unk_1E9332330;
  v35 = a2;
  v29[4] = self;
  v23 = v16;
  v30 = v23;
  v24 = v15;
  v31 = v24;
  v25 = v22;
  v32 = v25;
  v33 = &v37;
  v34 = &v43;
  v36 = a8;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v29);
  if (a9)
    *a9 = objc_retainAutorelease((id)v38[5]);
  v26.var0 = *((_BYTE *)v44 + 32);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v26;
}

void __129__TRIFetchOnDemandFactorsTask__saveIndexedAssetURLs_withTreatmentId_usingAssetMetadata_downloadOptions_paths_downloadSize_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  void *v18;
  id obj;

  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "treatmentIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchOnDemandFactorsTask.m"), 303, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("metadata.treatmentIndex"));

  }
  v10 = *(void **)(a1 + 40);
  objc_msgSend(v9, "treatmentId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "isEqualToString:", v11);

  if ((_DWORD)v10)
  {
    v12 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v9, "index"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = *(void **)(a1 + 56);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v16 + 40);
      v17 = objc_msgSend(v15, "saveAssetWithIdentifier:assetURL:metadata:error:", v7, v14, v8, &obj);
      objc_storeStrong((id *)(v16 + 40), obj);
      if (v17 == 1)
      {
        **(_QWORD **)(a1 + 88) += objc_msgSend(v8, "downloadSize");
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = v17;
        *a4 = 1;
      }
    }

  }
}

- ($A5A652246548B43F8BC05201A1C72A70)_saveNamedAssetURLs:(id)a3 usingAssetMetadata:(id)a4 downloadOptions:(id)a5 downloadSize:(unint64_t *)a6 paths:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  TRIAssetStore *v18;
  void *v19;
  TRIAssetStore *v20;
  id v21;
  TRIAssetStore *v22;
  $A5A652246548B43F8BC05201A1C72A70 v23;
  _QWORD v26[4];
  id v27;
  TRIFetchOnDemandFactorsTask *v28;
  TRIAssetStore *v29;
  uint64_t *v30;
  uint64_t *v31;
  SEL v32;
  unint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  const char *v43;
  char v44;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = [TRIAssetStore alloc];
  objc_msgSend(v16, "activity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[TRIAssetStore initWithPaths:monitoredActivity:](v18, "initWithPaths:monitoredActivity:", v17, v19);

  v40 = 0;
  v41 = &v40;
  v42 = 0x2810000000;
  v43 = "";
  v44 = 1;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__18;
  v38 = __Block_byref_object_dispose__18;
  v39 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __111__TRIFetchOnDemandFactorsTask__saveNamedAssetURLs_usingAssetMetadata_downloadOptions_downloadSize_paths_error___block_invoke;
  v26[3] = &unk_1E9332358;
  v21 = v15;
  v32 = a2;
  v27 = v21;
  v28 = self;
  v22 = v20;
  v29 = v22;
  v30 = &v34;
  v31 = &v40;
  v33 = a6;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v26);
  if (a8)
    *a8 = objc_retainAutorelease((id)v35[5]);
  v23.var0 = *((_BYTE *)v41 + 32);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v23;
}

void __111__TRIFetchOnDemandFactorsTask__saveNamedAssetURLs_usingAssetMetadata_downloadOptions_downloadSize_paths_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  id obj;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("TRIFetchOnDemandFactorsTask.m"), 344, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetMetadata[assetId]"));

  }
  v11 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v12 + 40);
  v13 = objc_msgSend(v11, "saveAssetWithIdentifier:assetURL:metadata:error:", v9, v8, v10, &obj);

  objc_storeStrong((id *)(v12 + 40), obj);
  if (v13 == 1)
  {
    **(_QWORD **)(a1 + 80) += objc_msgSend(v10, "downloadSize");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = v13;
    *a4 = 1;
  }

}

- (BOOL)_updateFactorPacksByMergingAssets:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  TRIFactorPackStorage *v8;
  void *v9;
  TRIFactorPackStorage *v10;
  char v11;
  NSDictionary *assetIdsByFactorPack;
  id v13;
  TRIFactorPackStorage *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  TRIFactorPackStorage *v19;
  TRIFetchOnDemandFactorsTask *v20;
  id v21;
  uint64_t *v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v7 = a4;
  v8 = [TRIFactorPackStorage alloc];
  objc_msgSend(v7, "paths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TRIFactorPackStorage initWithPaths:](v8, "initWithPaths:", v9);

  v11 = _os_feature_enabled_impl();
  LOBYTE(v9) = _os_feature_enabled_impl();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  assetIdsByFactorPack = self->_assetIdsByFactorPack;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__TRIFetchOnDemandFactorsTask__updateFactorPacksByMergingAssets_context___block_invoke;
  v17[3] = &unk_1E93323A8;
  v13 = v6;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  v20 = self;
  v22 = &v25;
  v23 = (char)v9;
  v15 = v7;
  v21 = v15;
  v24 = v11;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](assetIdsByFactorPack, "enumerateKeysAndObjectsUsingBlock:", v17);
  LOBYTE(v7) = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return (char)v7;
}

void __73__TRIFetchOnDemandFactorsTask__updateFactorPacksByMergingAssets_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  TRIFBFactorPackStorage *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "cloudKit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __73__TRIFetchOnDemandFactorsTask__updateFactorPacksByMergingAssets_context___block_invoke_2;
  v35[3] = &unk_1E9332380;
  v10 = v7;
  v36 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v35);

  objc_msgSend(*(id *)(a1 + 32), "mobileAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v9;
  v33[1] = 3221225472;
  v33[2] = __73__TRIFetchOnDemandFactorsTask__updateFactorPacksByMergingAssets_context___block_invoke_3;
  v33[3] = &unk_1E93318B8;
  v12 = v10;
  v34 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v33);

  objc_msgSend(*(id *)(a1 + 40), "loadFactorPackWithId:namespaceName:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "selectedNamespace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hasName");

    if (v16)
    {
      objc_msgSend(v14, "selectedNamespace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRIClientFactorPackUtils aliasesInNamespace:](TRIClientFactorPackUtils, "aliasesInNamespace:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      TRILogCategory_Server();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "factorPackId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v29;
        _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has missing namespace name.", buf, 0xCu);

      }
      v19 = 0;
    }
    if ((objc_msgSend(*(id *)(a1 + 40), "updateSavedFactorPackWithId:namespaceName:populatingAssetsForFactorNames:aliasToUnaliasMap:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), v12, v19) & 1) != 0)
    {
      if (*(_BYTE *)(a1 + 72))
      {
        objc_msgSend(*(id *)(a1 + 40), "pathForFactorPackWithId:namespaceName:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v23;
        if (objc_msgSend(v23, "fileExistsAtPath:", v24))
        {
          v31 = v22;
          v25 = [TRIFBFactorPackStorage alloc];
          objc_msgSend(*(id *)(a1 + 56), "paths");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[TRIFBFactorPackStorage initWithPaths:](v25, "initWithPaths:", v26);

          if ((-[NSObject updateSavedFactorLevelsWithFactorPackId:namespaceName:populatingAssetsForFactorNames:aliasToUnaliasMap:](v27, "updateSavedFactorLevelsWithFactorPackId:namespaceName:populatingAssetsForFactorNames:aliasToUnaliasMap:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), v12, v19) & 1) != 0)
          {
            v22 = v31;
          }
          else
          {
            TRILogCategory_Server();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v6;
              _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "Could not update factor levels storage for factor pack id: %@", buf, 0xCu);
            }

            v22 = v31;
            if (*(_BYTE *)(a1 + 73))
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
              *a4 = 1;

              goto LABEL_19;
            }
          }
        }
        else
        {
          TRILogCategory_Server();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
            *(_DWORD *)buf = 138412546;
            v38 = v6;
            v39 = 2112;
            v40 = v30;
            _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Could not update factor levels for factor pack id: %@ because the flatbuffer file was absent for namespace name: %@", buf, 0x16u);
          }
        }

LABEL_19:
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }

    goto LABEL_21;
  }
  TRILogCategory_Server();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v6;
    _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Unexpected failure to load factor pack: %{public}@", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  *a4 = 1;
LABEL_21:

}

void __73__TRIFetchOnDemandFactorsTask__updateFactorPacksByMergingAssets_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "factorName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __73__TRIFetchOnDemandFactorsTask__updateFactorPacksByMergingAssets_context___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "factorName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_assetIdsFromKeysInDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_fetchOptionsWithDownloadOptions:(id)a3 paths:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  TRIFetchOptions *v12;
  void *v13;
  TRIFetchOptions *v14;

  v6 = (objc_class *)MEMORY[0x1E0DC09F0];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithPaths:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B48]), "initWithPaths:namespaceMetadataStorage:", v7, v9);

  v11 = objc_msgSend(v10, "availableSpaceClassForFactorNames:namespaceName:", self->_rolloutFactorNames, self->_namespaceName);
  v12 = [TRIFetchOptions alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:](v12, "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v8, v13);

  return v14;
}

- (void)removeDownloadableFactorNames:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__TRIFetchOnDemandFactorsTask_removeDownloadableFactorNames___block_invoke;
  v7[3] = &unk_1E93323D0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __61__TRIFetchOnDemandFactorsTask_removeDownloadableFactorNames___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3[5], "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3[5], "removeObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "Missing TRIFactorName %@ in downloadableFactorNames", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *namespaceName;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  TRIArtifactProvider *v38;
  TRIArtifactProvider *artifactProvider;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  char v47;
  void *v48;
  TRIAggregateFetchRecordsProgress *v49;
  TRIAggregateFetchRecordsProgress *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  dispatch_group_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  NSObject *v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  NSString *v76;
  uint64_t v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  void *v81;
  TRIAggregateFetchRecordsProgress *v82;
  NSObject *group;
  void *v85;
  int v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  uint8_t v93[16];
  _QWORD block[5];
  id v95;
  id v96;
  id v97;
  TRIAggregateFetchRecordsProgress *v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  uint8_t v102[16];
  uint8_t v103[16];
  id v104;
  _QWORD v105[5];
  _QWORD v106[5];
  id v107;
  _BYTE buf[12];
  __int16 v109;
  uint64_t v110;
  __int16 v111;
  id v112;
  __int16 v113;
  const __CFString *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v88 = a4;
  v89 = (void *)os_transaction_create();
  v7 = MEMORY[0x1E0C809B0];
  atomic_store(1u, (unsigned __int8 *)&self->_isCurrentlyExecuting);
  v106[0] = v7;
  v106[1] = 3221225472;
  v106[2] = __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke;
  v106[3] = &unk_1E932F8C8;
  v106[4] = self;
  v8 = v6;
  v107 = v8;
  v90 = (id)MEMORY[0x1D8232C48](v106);
  objc_msgSend(v8, "keyValueStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v9);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "namespaceDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "namespaceDescriptorsDefaultDir");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v10, v12);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRITaskAttributing applicationBundleIdentifier](self->_taskAttributing, "applicationBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1D8232A5C]();
  v15 = (void *)MEMORY[0x1E0DC0AD8];
  namespaceName = self->_namespaceName;
  objc_msgSend(v8, "paths");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "namespaceDescriptorsDefaultDir");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "loadWithNamespaceName:fromDirectory:", namespaceName, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "resourceAttributionIdentifier");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (void *)v20;
  else
    v22 = v13;
  v23 = v22;

  v86 = objc_msgSend(v19, "expensiveNetworkingAllowed");
  TRILogCategory_Server();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = self->_namespaceName;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v25;
    v109 = 2114;
    v110 = (uint64_t)v23;
    _os_log_impl(&dword_1D207F000, v24, OS_LOG_TYPE_INFO, "attributing on-demand factors fetch for %{public}@ to %{public}@", buf, 0x16u);
  }

  objc_autoreleasePoolPop(v14);
  -[TRIFetchOnDemandFactorsTask deployment](self, "deployment");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v8, "rolloutDatabase");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIFetchOnDemandFactorsTask deployment](self, "deployment");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "recordWithDeployment:usingTransaction:", v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v29, "rampId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
LABEL_13:

        goto LABEL_14;
      }
      v31 = objc_opt_new();
      objc_msgSend(v29, "rampId");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject ensureRolloutFields](v31, "ensureRolloutFields");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setClientRampId:", v32);

      -[TRITrialSystemTelemetry mergeFrom:](self->_trialSystemTelemetry, "mergeFrom:", v31);
    }
    else
    {
      TRILogCategory_Server();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        -[TRIFetchOnDemandFactorsTask deployment](self, "deployment");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "shortDesc");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v35;
        _os_log_impl(&dword_1D207F000, v31, OS_LOG_TYPE_DEFAULT, "Warning: unable to find TRIRolloutRecord for deployment %{public}@; issuing incomplete telemetry.",
          buf,
          0xCu);

      }
    }

    goto LABEL_13;
  }
LABEL_14:
  v36 = -[TRITaskAttributing triCloudKitContainer](self->_taskAttributing, "triCloudKitContainer");
  -[TRITaskAttributing teamIdentifier](self->_taskAttributing, "teamIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRICKNativeArtifactProvider providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:](TRICKNativeArtifactProvider, "providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:", v36, v37, v23, v92, v91, v8);
  v38 = (TRIArtifactProvider *)objc_claimAutoreleasedReturnValue();
  artifactProvider = self->_artifactProvider;
  self->_artifactProvider = v38;

  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_11);
  -[TRITaskAttributing networkOptions](self->_taskAttributing, "networkOptions");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v40, "discretionaryBehavior"))
    goto LABEL_28;
  -[TRIBaseTask stateProvider](self, "stateProvider");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "activeActivityDescriptorGrantingCapability:", 16);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "activity");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v43)
  {
    TRILogCategory_Server();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v69, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
    }

    -[TRIFetchOnDemandFactorsTask _completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:](self, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 1, 0, 0, 0, v8);
    -[TRIFetchOnDemandFactorsTask _addMetricForFetchOnDemandFactorsTaskError:](self, "_addMetricForFetchOnDemandFactorsTaskError:", 3);
    -[TRIFetchOnDemandFactorsTask _currentTaskStatus](self, "_currentTaskStatus");
    v70 = objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  objc_msgSend(v40, "setActivity:", v43);
  objc_msgSend(v41, "activeActivityDescriptorGrantingCapability:", 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = objc_msgSend(v40, "allowsCellularAccess");
  if (v44)
    v46 = 0;
  else
    v46 = v45;
  if (v46 == 1)
  {
    if (!v23 || (objc_msgSend(v23, "length") ? (v47 = v86) : (v47 = 0), (v47 & 1) == 0))
    {
      TRILogCategory_Server();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        v76 = self->_namespaceName;
        -[NSSet anyObject](self->_rolloutFactorNames, "anyObject");
        v77 = objc_claimAutoreleasedReturnValue();
        v78 = (void *)v77;
        v79 = CFSTR("NO");
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v76;
        v109 = 2114;
        if (v86)
          v79 = CFSTR("YES");
        v110 = v77;
        v111 = 2114;
        v112 = v23;
        v113 = 2114;
        v114 = v79;
        _os_log_error_impl(&dword_1D207F000, v71, OS_LOG_TYPE_ERROR, "preventing fetch for (%{public}@, %{public}@) on cellular, resourceAttributionBundleIdentifier: %{public}@ expensiveNetworkingAllowed: %{public}@", buf, 0x2Au);

      }
      -[TRIFetchOnDemandFactorsTask _completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:](self, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 1, 0, 0, 0, v8);
      -[TRIFetchOnDemandFactorsTask _addMetricForFetchOnDemandFactorsTaskError:](self, "_addMetricForFetchOnDemandFactorsTaskError:", 23);
      -[TRIFetchOnDemandFactorsTask _currentTaskStatus](self, "_currentTaskStatus");
      v70 = objc_claimAutoreleasedReturnValue();
LABEL_51:
      v68 = (void *)v70;

      goto LABEL_66;
    }
  }
  if (objc_msgSend(v40, "allowsCellularAccess"))
  {
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("allows_cellular_download"), objc_msgSend(v40, "allowsCellularAccess"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIFetchOnDemandFactorsTask _addMetric:](self, "_addMetric:", v48);

  }
LABEL_28:
  v49 = [TRIAggregateFetchRecordsProgress alloc];
  v105[0] = MEMORY[0x1E0C809B0];
  v105[1] = 3221225472;
  v105[2] = __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_297;
  v105[3] = &unk_1E93319A8;
  v105[4] = self;
  v50 = -[TRIAggregateFetchRecordsProgress initWithProgressBlock:](v49, "initWithProgressBlock:", v105);
  -[TRIFetchOnDemandFactorsTask _planForFetchingAssetsFromTreatmentRecordsWithContext:downloadOptions:updatingAggregateProgress:](self, "_planForFetchingAssetsFromTreatmentRecordsWithContext:downloadOptions:updatingAggregateProgress:", v8, v40, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    *(_QWORD *)buf = 0;
    v104 = 0;
    -[TRIFetchOnDemandFactorsTask _planForFetchingAssetDiffsWithContext:downloadOptions:updatingAggregateProgress:nonDiffableAssetIds:unlinkedMAAssetsOnDisk:](self, "_planForFetchingAssetDiffsWithContext:downloadOptions:updatingAggregateProgress:nonDiffableAssetIds:unlinkedMAAssetsOnDisk:", v8, v40, v50, buf, &v104);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v52)
      goto LABEL_44;
    if (!*(_QWORD *)buf)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchOnDemandFactorsTask.m"), 614, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requiredNonDiffableAssetIds"));

    }
    -[TRIFetchOnDemandFactorsTask _planForFetchingAssetsFromFactorPacksWithContext:assetDiffFetchPlan:requiredAssetIds:downloadOptions:updatingAggregateProgress:](self, "_planForFetchingAssetsFromFactorPacksWithContext:assetDiffFetchPlan:requiredAssetIds:downloadOptions:updatingAggregateProgress:", v8, v52);
    v53 = (id)objc_claimAutoreleasedReturnValue();

    if (!v53)
    {
LABEL_44:
      -[TRIFetchOnDemandFactorsTask _addMetricForFetchOnDemandFactorsTaskError:](self, "_addMetricForFetchOnDemandFactorsTaskError:", 4);
      -[TRIFetchOnDemandFactorsTask _currentTaskStatus](self, "_currentTaskStatus");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_64:

      goto LABEL_65;
    }
    if (!+[TRICacheDeleteUtils hasSufficientDiskSpaceForDownload:](TRICacheDeleteUtils, "hasSufficientDiskSpaceForDownload:", -[TRIFetchOnDemandFactorsTask _requiredDiskSpaceForPlan:](self, "_requiredDiskSpaceForPlan:", v53)))
    {
      TRILogCategory_Server();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v103 = 0;
        _os_log_error_impl(&dword_1D207F000, v72, OS_LOG_TYPE_ERROR, "Insufficient disk space for on-demand factor fetch. Stopping the task before starting the download", v103, 2u);
      }

      objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withError:", self->_notificationKey, 4);
      -[TRIFetchOnDemandFactorsTask _completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:](self, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 3, 0, 0, v50, v8);
      -[TRIFetchOnDemandFactorsTask _addMetricForFetchOnDemandFactorsTaskError:](self, "_addMetricForFetchOnDemandFactorsTaskError:", 24);
      -[TRIFetchOnDemandFactorsTask _currentTaskStatus](self, "_currentTaskStatus");
      v67 = objc_claimAutoreleasedReturnValue();
      goto LABEL_55;
    }
    objc_msgSend(v8, "paths");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIFetchOnDemandFactorsTask _fetchOptionsWithDownloadOptions:paths:](self, "_fetchOptionsWithDownloadOptions:paths:", v40, v54);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = dispatch_group_create();
    *(_QWORD *)v103 = 0;
    -[TRIFetchOnDemandFactorsTask _fetchDiffsFromAssetDiffRecordsWithContext:plan:aggregateProgress:downloadSize:options:](self, "_fetchDiffsFromAssetDiffRecordsWithContext:plan:aggregateProgress:downloadSize:options:", v8, v53, v50, v103, v85);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v56;
    group = v55;
    if (v56)
    {
      if (!objc_msgSend(v56, "count"))
      {
LABEL_39:
        *(_QWORD *)v102 = 0;
        -[TRIFetchOnDemandFactorsTask _asyncFetchCKAssetsFromAssetRecordsWithContext:plan:aggregateProgress:downloadSize:options:group:](self, "_asyncFetchCKAssetsFromAssetRecordsWithContext:plan:aggregateProgress:downloadSize:options:group:", v8, v53, v50, v102, v85, v55);
        v101 = 0;
        -[TRIFetchOnDemandFactorsTask _asyncFetchMAAssetsFromFactorPacksWithContext:plan:aggregateProgress:downloadSize:options:group:](self, "_asyncFetchMAAssetsFromFactorPacksWithContext:plan:aggregateProgress:downloadSize:options:group:", v8, v53, v50, &v101, v85, v55);
        v61 = dispatch_group_create();
        v100 = 0;
        -[TRIFetchOnDemandFactorsTask _asyncFetchAssetsFromTreatmentRecordsWithContext:plan:aggregateProgress:downloadSize:downloadOptions:group:](self, "_asyncFetchAssetsFromTreatmentRecordsWithContext:plan:aggregateProgress:downloadSize:downloadOptions:group:", v8, v51, v50, &v100, v40, v61);
        dispatch_group_enter(v61);
        dispatch_get_global_queue(17, 0);
        v62 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_305;
        block[3] = &unk_1E9332460;
        block[4] = self;
        v53 = v53;
        v95 = v53;
        v96 = v104;
        v63 = v8;
        v97 = v63;
        v82 = v50;
        v98 = v82;
        v64 = v61;
        v99 = v64;
        dispatch_group_notify(group, v62, block);

        TRILogCategory_Server();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v93 = 0;
          _os_log_impl(&dword_1D207F000, v65, OS_LOG_TYPE_DEFAULT, "TRIFetchOnDemandFactorsTask waiting for group completion.", v93, 2u);
        }

        objc_msgSend(MEMORY[0x1E0D81598], "waitForGroup:", v64);
        TRILogCategory_Server();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v93 = 0;
          _os_log_impl(&dword_1D207F000, v66, OS_LOG_TYPE_DEFAULT, "TRIFetchOnDemandFactorsTask group complete.", v93, 2u);
        }

        -[TRIFetchOnDemandFactorsTask _completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:](self, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 2, 0, 0, v82, v63);
        -[TRIFetchOnDemandFactorsTask _currentTaskStatus](self, "_currentTaskStatus");
        v67 = objc_claimAutoreleasedReturnValue();
LABEL_55:
        v68 = (void *)v67;
LABEL_63:

        goto LABEL_64;
      }
      objc_msgSend(*(id *)buf, "setByAddingObjectsFromSet:", v87);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIFetchOnDemandFactorsTask _planForFetchingAssetsFromFactorPacksWithContext:assetDiffFetchPlan:requiredAssetIds:downloadOptions:updatingAggregateProgress:](self, "_planForFetchingAssetsFromFactorPacksWithContext:assetDiffFetchPlan:requiredAssetIds:downloadOptions:updatingAggregateProgress:", v8, v53, v57, v40, v50);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v81)
      {
        -[TRIFetchOnDemandFactorsTask _addMetricForFetchOnDemandFactorsTaskError:](self, "_addMetricForFetchOnDemandFactorsTaskError:", 4);
        -[TRIFetchOnDemandFactorsTask _currentTaskStatus](self, "_currentTaskStatus");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_62:

        v53 = v85;
        goto LABEL_63;
      }
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v81, "copyWithReplacementRecordIdsForDiffableAssetIds:", v58);
      v60 = -[TRIFetchOnDemandFactorsTask _requiredDiskSpaceForPlan:](self, "_requiredDiskSpaceForPlan:", v59);

      v55 = group;
      if (+[TRICacheDeleteUtils hasSufficientDiskSpaceForDownload:](TRICacheDeleteUtils, "hasSufficientDiskSpaceForDownload:", v60))
      {
        v53 = v81;
        goto LABEL_39;
      }
      TRILogCategory_Server();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v102 = 0;
        _os_log_error_impl(&dword_1D207F000, v73, OS_LOG_TYPE_ERROR, "Fetch plan was changed due to incomplete diff download. We now have insufficient disk space for on-demand factor fetch. Stopping the task early.", v102, 2u);
      }

      objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withError:", self->_notificationKey, 4);
      -[TRIFetchOnDemandFactorsTask _completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:](self, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 3, 0, 0, v50, v8);
      -[TRIFetchOnDemandFactorsTask _addMetricForFetchOnDemandFactorsTaskError:](self, "_addMetricForFetchOnDemandFactorsTaskError:", 24);
      -[TRIFetchOnDemandFactorsTask _currentTaskStatus](self, "_currentTaskStatus");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v81;
    }
    else
    {
      -[TRIFetchOnDemandFactorsTask _addMetricForFetchOnDemandFactorsTaskError:](self, "_addMetricForFetchOnDemandFactorsTaskError:", 10);
      -[TRIFetchOnDemandFactorsTask _currentTaskStatus](self, "_currentTaskStatus");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_62;
  }
  -[TRIFetchOnDemandFactorsTask _addMetricForFetchOnDemandFactorsTaskError:](self, "_addMetricForFetchOnDemandFactorsTaskError:", 6);
  -[TRIFetchOnDemandFactorsTask _currentTaskStatus](self, "_currentTaskStatus");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_65:

LABEL_66:
  v74 = v90;
  if (v90)
  {
    (*((void (**)(void))v90 + 2))();
    v74 = v90;
  }

  return v68;
}

void __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 88));
  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v26 = *MEMORY[0x1E0CB2D50];
  v27[0] = CFSTR("on_demand_requested_factor_failed_to_download_without_asset_fetch");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v3);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(v5 + 128);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_2;
  v22[3] = &unk_1E93323F8;
  v22[4] = v5;
  v23 = v6;
  v16 = v4;
  v24 = v16;
  objc_msgSend(v7, "runWithLockAcquired:", v22);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = *(_QWORD **)(a1 + 32);
        v14 = v13[6];
        objc_msgSend(*(id *)(a1 + 40), "client");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_logOnDemandFactor:metricName:namespaceName:client:error:", v12, CFSTR("on_demand_factor_subscribed"), v14, v15, 0);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v9);
  }

}

void __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(a2 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v8)
        {
          v9 = *(_QWORD **)(a1 + 32);
          v10 = v9[6];
          objc_msgSend(*(id *)(a1 + 40), "client");
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_logOnDemandFactor:metricName:namespaceName:client:error:", v8, CFSTR("on_demand_factor_failed_to_download_by_request"), v10, v11, *(_QWORD *)(a1 + 48));
        }
        else
        {
          TRILogCategory_Server();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = (objc_class *)objc_opt_class();
            NSStringFromClass(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v19 = v13;
            _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "Missing factorname in %@", buf, 0xCu);

          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }

}

void __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_290(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD *v3;
  id v4;

  *(_DWORD *)(a2 + 16) = 0;
  v2 = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = 0;
  v3 = (id)a2;

  v4 = (id)v3[4];
  v3[4] = 0;

}

uint64_t __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_297(uint64_t result, double a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  if (v2)
    return objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadProgressForKey:withProgress:", v2, (unint64_t)(a2 * 99.0));
  return result;
}

void __61__TRIFetchOnDemandFactorsTask_runUsingContext_withTaskQueue___block_invoke_305(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "_currentTaskStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "runStatus");

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "metadataForRequestedUnlinkedAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mobileAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 48), "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(*(id *)(a1 + 40), "metadataForRequestedUnlinkedAssets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithReplacementMobileAsset:", v6);

    if ((objc_msgSend(*(id *)(a1 + 32), "_updateFactorPacksByMergingAssets:context:", v9, *(_QWORD *)(a1 + 56)) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 3, 0, 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 32), "_addMetricForFetchOnDemandFactorsTaskError:", 14);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

- (unint64_t)_requiredDiskSpaceForPlan:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(v3, "recordIdsForDiffableAssetIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__TRIFetchOnDemandFactorsTask__requiredDiskSpaceForPlan___block_invoke;
  v13[3] = &unk_1E9332488;
  v13[4] = &v14;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v13);

  objc_msgSend(v3, "recordIdsForNonDiffableAssetIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __57__TRIFetchOnDemandFactorsTask__requiredDiskSpaceForPlan___block_invoke_2;
  v12[3] = &unk_1E9332488;
  v12[4] = &v14;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  objc_msgSend(v3, "metadataForRequestedUnlinkedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mobileAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __57__TRIFetchOnDemandFactorsTask__requiredDiskSpaceForPlan___block_invoke_3;
  v11[3] = &unk_1E93324B0;
  v11[4] = &v14;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

uint64_t __57__TRIFetchOnDemandFactorsTask__requiredDiskSpaceForPlan___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "downloadSize");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __57__TRIFetchOnDemandFactorsTask__requiredDiskSpaceForPlan___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "downloadSize");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __57__TRIFetchOnDemandFactorsTask__requiredDiskSpaceForPlan___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "metadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "downloadSize");

}

- (void)_completeTaskWithStatus:(int)a3 earliestRetryDate:(id)a4 error:(id)a5 aggregateProgress:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  _PASLock *lock;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  int v22;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  lock = self->_lock;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __105__TRIFetchOnDemandFactorsTask__completeTaskWithStatus_earliestRetryDate_error_aggregateProgress_context___block_invoke;
  v18[3] = &unk_1E93324D8;
  v22 = a3;
  v18[4] = self;
  v19 = v12;
  v20 = v11;
  v21 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v12;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v18);

}

void __105__TRIFetchOnDemandFactorsTask__completeTaskWithStatus_earliestRetryDate_error_aggregateProgress_context___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  int v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  unint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_DWORD *)(a1 + 64);
  if (v4 == 2)
    goto LABEL_16;
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Early termination of TRIFetchOnDemandFactorsTask. Cancelling remaining fetch operations", buf, 2u);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v3[1];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "cancel", (_QWORD)v26);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v8);
  }

  v11 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v11 + 144))
  {
    v12 = 1;
  }
  else
  {
    v12 = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:", *(_QWORD *)(a1 + 40));
    v11 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v11 + 144) = v12;
  v4 = *(_DWORD *)(a1 + 64);
  if (v4 != 3 || *((_DWORD *)v3 + 4) == 3)
  {
LABEL_16:
    if (!*((_DWORD *)v3 + 4))
    {
      v13 = v3[3];
      *((_DWORD *)v3 + 4) = v4;
      if (!v13)
        objc_storeStrong(v3 + 3, *(id *)(a1 + 48));
      if (!v3[4])
        objc_storeStrong(v3 + 4, *(id *)(a1 + 40));
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v31 = v15;
        v32 = 2114;
        v33 = v3;
        _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ complete with %{public}@", buf, 0x16u);
      }

      v16 = *(_DWORD *)(a1 + 64);
      if (v16 == 2)
      {
        objc_msgSend(MEMORY[0x1E0DC0B20], "notifyUpdateForNamespaceName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadProgressForKey:withProgress:", v17, 100);
          objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadCompletedForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
        }
        v16 = *(_DWORD *)(a1 + 64);
      }
      if (v16 == 4)
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
        if (!v18)
          goto LABEL_17;
        objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withError:", v18, 3);
        v16 = *(_DWORD *)(a1 + 64);
      }
      if (v16 == 1)
      {
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
        if (v19)
        {
          v20 = *(void **)(a1 + 56);
          if (v20)
          {
            objc_msgSend(v20, "fractionCompleted");
            v22 = (unint64_t)(v21 * 100.0);
            v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
          }
          else
          {
            v22 = 0;
          }
          objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadStalledForKey:withProgress:", v19, v22, (_QWORD)v26);
        }
      }
    }
  }
  else
  {
    *((_DWORD *)v3 + 4) = 3;
    objc_storeStrong(v3 + 3, *(id *)(a1 + 48));
    objc_storeStrong(v3 + 4, *(id *)(a1 + 40));
    TRILogCategory_Server();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v31 = v24;
      v32 = 2114;
      v33 = v3;
      _os_log_impl(&dword_1D207F000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ failed with %{public}@", buf, 0x16u);
    }

    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    if (v25)
      objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withError:", v25, 0);
  }
LABEL_17:

}

- (id)_currentTaskStatus
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__18;
  v10 = __Block_byref_object_dispose__18;
  lock = self->_lock;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__TRIFetchOnDemandFactorsTask__currentTaskStatus__block_invoke;
  v5[3] = &unk_1E9332500;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __49__TRIFetchOnDemandFactorsTask__currentTaskStatus__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  TRITaskRunResult *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  v4 = [TRITaskRunResult alloc];
  v5 = *((unsigned int *)v3 + 4);
  v6 = v3[3];

  v7 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v4, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v5, 1, MEMORY[0x1E0C9AA60], v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)_planForFetchingAssetsFromTreatmentRecordsWithContext:(id)a3 downloadOptions:(id)a4 updatingAggregateProgress:(id)a5
{
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  TRIArtifactProvider *artifactProvider;
  void *v17;
  _PASLock *lock;
  id v19;
  void *v20;
  _BOOL4 v21;
  TRITreatmentAssetFetchPlan *v22;
  void *v23;
  NSDictionary *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  TRIClientTreatmentStorage *v29;
  void *v30;
  void *v31;
  TRIFBClientTreatmentStorage *v32;
  void *v33;
  TRIFBClientTreatmentStorage *v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  int v41;
  void *v42;
  NSDictionary *v43;
  uint64_t v44;
  void *k;
  uint64_t v46;
  void *v47;
  void *v48;
  TRIAssetStore *v49;
  void *v50;
  TRIAssetStore *v51;
  id v52;
  TRIAssetStore *v53;
  id v54;
  void *v55;
  void *v56;
  TRITreatmentRecordFetchPlan *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  NSObject *v63;
  uint64_t v64;
  NSUInteger v65;
  double v66;
  TRIGenericUniqueRequiredAssets *v67;
  void *v68;
  TRIGenericUniqueRequiredAssets *v69;
  void *v71;
  id v72;
  void *v73;
  void *context;
  void *contexta;
  NSDictionary *obj;
  TRIClientTreatmentStorage *obja;
  id objb;
  TRIFetchOptions *v79;
  NSObject *v80;
  id v81;
  void *v82;
  id v84;
  _QWORD v86[4];
  id v87;
  _QWORD v88[5];
  NSDictionary *v89;
  id v90;
  uint64_t *v91;
  SEL v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD v97[4];
  TRIAssetStore *v98;
  id v99;
  TRIFetchOnDemandFactorsTask *v100;
  SEL v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[5];
  id v107;
  id v108;
  SEL v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[4];
  id v115;
  _QWORD v116[5];
  id v117;
  id v118;
  id v119;
  uint64_t v120;
  NSObject *v121;
  SEL v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint8_t buf[4];
  uint64_t v128;
  __int16 v129;
  NSUInteger v130;
  __int16 v131;
  uint64_t v132;
  __int16 v133;
  double v134;
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v84 = a3;
  v72 = a4;
  v81 = a5;
  v71 = (void *)MEMORY[0x1D8232A5C]();
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Beginning plan for fetching assets from treatment records.", buf, 2u);
  }

  v80 = dispatch_group_create();
  v8 = objc_alloc(MEMORY[0x1E0D815F0]);
  v9 = (void *)objc_opt_new();
  v82 = (void *)objc_msgSend(v8, "initWithGuardedData:", v9);

  v79 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v72, &unk_1E9363D68);
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  obj = self->_assetIndexesByTreatment;
  v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v123, v137, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v124;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v124 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1D8232A5C]();
        dispatch_group_enter(v80);
        artifactProvider = self->_artifactProvider;
        v116[0] = v12;
        v116[1] = 3221225472;
        v116[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke;
        v116[3] = &unk_1E9332550;
        v116[4] = self;
        v117 = v81;
        v118 = v84;
        v122 = a2;
        v119 = v82;
        v120 = v14;
        v121 = v80;
        -[TRIArtifactProvider fetchTreatmentWithId:options:completion:](artifactProvider, "fetchTreatmentWithId:options:completion:", v14, v79, v116);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        lock = self->_lock;
        v114[0] = v12;
        v114[1] = 3221225472;
        v114[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_315;
        v114[3] = &unk_1E93323D0;
        v115 = v17;
        v19 = v17;
        -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v114);

        objc_autoreleasePoolPop(v15);
      }
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v123, v137, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0D81598], "waitForGroup:", v80);
  -[TRIFetchOnDemandFactorsTask _currentTaskStatus](self, "_currentTaskStatus");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "runStatus") == 0;

  if (v21)
  {
    v23 = (void *)objc_opt_new();
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v24 = self->_assetIndexesByTreatment;
    v25 = -[NSDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v110, v136, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v111;
      while (2)
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v111 != v26)
            objc_enumerationMutation(v24);
          v28 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * j);
          context = (void *)MEMORY[0x1D8232A5C]();
          v29 = [TRIClientTreatmentStorage alloc];
          objc_msgSend(v84, "paths");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          obja = -[TRIClientTreatmentStorage initWithPaths:](v29, "initWithPaths:", v30);

          -[TRIClientTreatmentStorage loadTreatmentWithTreatmentId:isFilePresent:](obja, "loadTreatmentWithTreatmentId:isFilePresent:", v28, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (_os_feature_enabled_impl())
          {
            v32 = [TRIFBClientTreatmentStorage alloc];
            objc_msgSend(v84, "paths");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[TRIFBClientTreatmentStorage initWithPaths:](v32, "initWithPaths:", v33);

            -[TRIFBClientTreatmentStorage loadTreatmentWithTreatmentId:isFilePresent:](v34, "loadTreatmentWithTreatmentId:isFilePresent:", v28, 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v31, "isEqual:", v35) & 1) == 0)
            {
              TRILogCategory_Server();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v128 = (uint64_t)v35;
                v129 = 2114;
                v130 = (NSUInteger)v31;
                _os_log_error_impl(&dword_1D207F000, v36, OS_LOG_TYPE_ERROR, "Treatment loaded from flatbuffers:%{public}@  does not match treatment loaded from pb: %{public}@ ", buf, 0x16u);
              }

            }
            if (_os_feature_enabled_impl())
            {
              v37 = v35;

              v31 = v37;
            }

          }
          if (v31)
          {
            objc_msgSend(v31, "unlinkedOnDemandAssets");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v38)
            {
              -[NSDictionary objectForKeyedSubscript:](self->_assetIndexesByTreatment, "objectForKeyedSubscript:", v28);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v39)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchOnDemandFactorsTask.m"), 958, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("self->_assetIndexesByTreatment[treatmentId]"), v71);

              }
              v106[0] = MEMORY[0x1E0C809B0];
              v106[1] = 3221225472;
              v106[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_322;
              v106[3] = &unk_1E9332578;
              v109 = a2;
              v106[4] = self;
              v107 = v39;
              v108 = v23;
              v40 = v39;
              objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v106);

              v41 = 0;
            }
            else
            {
              -[TRIFetchOnDemandFactorsTask _completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:](self, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 3, 0, 0, v81, v84);
              -[TRIFetchOnDemandFactorsTask _addMetricForFetchOnDemandFactorsTaskError:](self, "_addMetricForFetchOnDemandFactorsTaskError:", 12);
              v41 = 1;
            }

          }
          else
          {
            -[TRIFetchOnDemandFactorsTask _completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:](self, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 3, 0, 0, v81, v84);
            -[TRIFetchOnDemandFactorsTask _addMetricForFetchOnDemandFactorsTaskError:](self, "_addMetricForFetchOnDemandFactorsTaskError:", 13);
            v41 = 1;
          }

          objc_autoreleasePoolPop(context);
          if (v41)
          {
            v22 = 0;
            goto LABEL_53;
          }
        }
        v25 = -[NSDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v110, v136, 16);
        if (v25)
          continue;
        break;
      }
    }

    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_assetIndexesByTreatment, "count"));
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v43 = self->_assetIndexesByTreatment;
    objb = -[NSDictionary countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v102, v135, 16);
    if (objb)
    {
      v44 = 0;
      contexta = *(void **)v103;
      do
      {
        for (k = 0; k != objb; k = (char *)k + 1)
        {
          if (*(void **)v103 != contexta)
            objc_enumerationMutation(v43);
          v46 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)k);
          v47 = (void *)MEMORY[0x1D8232A5C]();
          v48 = (void *)objc_opt_new();
          v49 = [TRIAssetStore alloc];
          objc_msgSend(v84, "paths");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = -[TRIAssetStore initWithPaths:](v49, "initWithPaths:", v50);

          v97[0] = MEMORY[0x1E0C809B0];
          v97[1] = 3221225472;
          v97[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_2_324;
          v97[3] = &unk_1E9332578;
          v98 = v51;
          v52 = v48;
          v99 = v52;
          v100 = self;
          v101 = a2;
          v53 = v51;
          objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v97);
          v54 = v52;

          if (objc_msgSend(v54, "count"))
          {
            objc_msgSend(v82, "unsafeGuardedData");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "objectForKeyedSubscript:", v46);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v56)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchOnDemandFactorsTask.m"), 985, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[guardedRecordIdForTreatment unsafeGuardedData][treatmentId]"));

            }
            v57 = -[TRITreatmentRecordFetchPlan initWithRecordId:assetIndexes:]([TRITreatmentRecordFetchPlan alloc], "initWithRecordId:assetIndexes:", v56, v54);
            objc_msgSend(v73, "setObject:forKeyedSubscript:", v57, v46);

          }
          v58 = objc_msgSend(v54, "count");

          objc_autoreleasePoolPop(v47);
          v44 += v58;
        }
        objb = -[NSDictionary countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v102, v135, 16);
      }
      while (objb);
    }
    else
    {
      v44 = 0;
    }

    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v73, "count"));
    v93 = 0;
    v94 = &v93;
    v95 = 0x2020000000;
    v96 = 0;
    v61 = MEMORY[0x1E0C809B0];
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_3;
    v88[3] = &unk_1E93325A0;
    v92 = a2;
    v88[4] = self;
    v24 = v73;
    v89 = v24;
    v62 = v60;
    v90 = v62;
    v91 = &v93;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v88);
    v86[0] = v61;
    v86[1] = 3221225472;
    v86[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_330;
    v86[3] = &unk_1E93325C8;
    v87 = v81;
    objc_msgSend(v62, "enumerateKeysAndObjectsUsingBlock:", v86);
    TRILogCategory_Server();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v64 = objc_msgSend(v23, "count");
      v65 = -[NSDictionary count](self->_assetIndexesByTreatment, "count");
      v66 = (double)(unint64_t)v94[3];
      *(_DWORD *)buf = 134218752;
      v128 = v64;
      v129 = 2048;
      v130 = v65;
      v131 = 2048;
      v132 = v44;
      v133 = 2048;
      v134 = v66 / 1000000.0;
      _os_log_impl(&dword_1D207F000, v63, OS_LOG_TYPE_DEFAULT, "Treatment fetch planning phase complete.  On-demand fetch task will result in linking %tu assets into %tu treatment(s); %tu assets require download.  Total download size for Treatment record assets: %.2f MB",
        buf,
        0x2Au);
    }

    v67 = [TRIGenericUniqueRequiredAssets alloc];
    v68 = (void *)objc_opt_new();
    v69 = -[TRIGenericUniqueRequiredAssets initWithCloudKit:mobileAsset:](v67, "initWithCloudKit:mobileAsset:", v23, v68);

    v22 = -[TRITreatmentAssetFetchPlan initWithMetadataForRequestedUnlinkedAssets:fetchPlansForTreatmentIds:]([TRITreatmentAssetFetchPlan alloc], "initWithMetadataForRequestedUnlinkedAssets:fetchPlansForTreatmentIds:", v69, v24);
    _Block_object_dispose(&v93, 8);

LABEL_53:
  }
  else
  {
    v22 = 0;
  }

  objc_autoreleasePoolPop(v71);
  return v22;
}

void __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  switch(a2)
  {
    case 0:
      v16 = *(void **)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      v19 = 3;
      v20 = 0;
      goto LABEL_5;
    case 1:
      v16 = *(void **)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      v19 = 4;
      v20 = 0;
      v21 = 0;
      goto LABEL_6;
    case 2:
      v16 = *(void **)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      v19 = 1;
      v20 = v14;
LABEL_5:
      v21 = v15;
LABEL_6:
      objc_msgSend(v16, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", v19, v20, v21, v17, v18);
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchOnDemandFactorsTask.m"), 871, CFSTR("Unexpected TRIFetchStatus %tu"), 3);

      break;
    case 4:
      if (v12)
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_2;
        v26[3] = &unk_1E9332528;
        v23 = *(void **)(a1 + 56);
        v26[4] = *(_QWORD *)(a1 + 64);
        v27 = v12;
        objc_msgSend(v23, "runWithLockAcquired:", v26);

      }
      else
      {
        TRILogCategory_Server();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 138412290;
          v29 = v25;
          _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "CloudKit fetch succeeded, but a valid treatment artifact was not obtained for treatment %@.", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 3, 0, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 32), "_addMetricForFetchOnDemandFactorsTaskError:", 25);
      }
      break;
    default:
      break;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));

}

uint64_t __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_315(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "addObject:", *(_QWORD *)(a1 + 32));
}

void __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_322(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "treatmentIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchOnDemandFactorsTask.m"), 960, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("metadata.treatmentIndex"));

  }
  v7 = objc_msgSend(v6, "index");

  if (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v7))
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, v9);

}

void __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_2_324(uint64_t a1, uint64_t a2, void *a3)
{
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "hasAssetWithIdentifier:type:", a2, 0);
  v6 = v10;
  if ((v5 & 1) == 0)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v10, "treatmentIndex");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("TRIFetchOnDemandFactorsTask.m"), 979, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("metadata.treatmentIndex"));

    }
    objc_msgSend(v7, "addIndex:", objc_msgSend(v8, "index"));

    v6 = v10;
  }

}

void __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "treatmentIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("TRIFetchOnDemandFactorsTask.m"), 999, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("metadata.treatmentIndex"));

  }
  v5 = (void *)a1[5];
  objc_msgSend(v4, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "assetIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsIndex:", objc_msgSend(v4, "index"));

    if (v9)
    {
      v10 = (void *)a1[6];
      objc_msgSend(v7, "recordId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        v12 = &unk_1E9363D80;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v17, "downloadSize") + objc_msgSend(v12, "unsignedLongLongValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)a1[6];
      objc_msgSend(v7, "recordId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += objc_msgSend(v17, "downloadSize");
    }
  }

}

void __127__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromTreatmentRecordsWithContext_downloadOptions_updatingAggregateProgress___block_invoke_330(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "registerRecordId:withExpectedSize:", v5, objc_msgSend(a3, "unsignedLongLongValue"));

}

- (id)_planForFetchingAssetDiffsWithContext:(id)a3 downloadOptions:(id)a4 updatingAggregateProgress:(id)a5 nonDiffableAssetIds:(id *)a6 unlinkedMAAssetsOnDisk:(id *)a7
{
  id v10;
  id v11;
  TRIAssetStore *v12;
  void *v13;
  TRIAssetStore *v14;
  void *v15;
  TRIFactorPackStorage *v16;
  void *v17;
  TRIFactorPackStorage *v18;
  TRIFBFactorPackStorage *v19;
  void *v20;
  TRIFBFactorPackStorage *v21;
  NSDictionary *assetIdsByFactorPack;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  TRIAssetStore *v29;
  NSObject *v30;
  void *v31;
  TRIFetchOptions *v32;
  dispatch_semaphore_t v33;
  TRIArtifactProvider *artifactProvider;
  id v35;
  NSObject *v36;
  void *v37;
  _PASLock *lock;
  id v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  double v45;
  TRIGenericRequiredAssets *v46;
  TRIGenericRequiredAssets *v47;
  TRIFactorPackAssetFetchPlan *v48;
  TRIFactorPackAssetFetchPlan *v49;
  id v53;
  id v54;
  TRIFactorPackStorage *v55;
  TRIFBFactorPackStorage *v56;
  void *context;
  id v59;
  id v60;
  TRIAssetStore *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[5];
  id v74;
  id v75;
  NSObject *v76;
  uint8_t *v77;
  SEL v78;
  uint8_t buf[8];
  uint8_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  _QWORD v85[4];
  TRIAssetStore *v86;
  _QWORD v87[4];
  TRIAssetStore *v88;
  id v89;
  id v90;
  _QWORD v91[5];
  TRIFBFactorPackStorage *v92;
  TRIFactorPackStorage *v93;
  id v94;
  TRIAssetStore *v95;
  id v96;
  id v97;
  uint64_t *v98;
  uint64_t *v99;
  id *v100;
  char v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  id v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint8_t v114[4];
  uint64_t v115;
  __int16 v116;
  double v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v60 = a4;
  v11 = a5;
  context = (void *)MEMORY[0x1D8232A5C]();
  v12 = [TRIAssetStore alloc];
  objc_msgSend(v10, "paths");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TRIAssetStore initWithPaths:](v12, "initWithPaths:", v13);

  v15 = (void *)objc_opt_new();
  v16 = [TRIFactorPackStorage alloc];
  objc_msgSend(v10, "paths");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[TRIFactorPackStorage initWithPaths:](v16, "initWithPaths:", v17);

  v19 = [TRIFBFactorPackStorage alloc];
  objc_msgSend(v10, "paths");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[TRIFBFactorPackStorage initWithPaths:](v19, "initWithPaths:", v20);

  LOBYTE(v20) = _os_feature_enabled_impl();
  v108 = 0;
  v109 = &v108;
  v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__18;
  v112 = __Block_byref_object_dispose__18;
  v113 = (id)objc_opt_new();
  v102 = 0;
  v103 = &v102;
  v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__18;
  v106 = __Block_byref_object_dispose__18;
  v107 = (id)objc_opt_new();
  assetIdsByFactorPack = self->_assetIdsByFactorPack;
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke;
  v91[3] = &unk_1E9332668;
  v91[4] = self;
  v101 = (char)v20;
  v56 = v21;
  v92 = v56;
  v98 = &v108;
  v55 = v18;
  v93 = v55;
  v62 = v10;
  v94 = v62;
  v61 = v14;
  v95 = v61;
  v54 = v15;
  v96 = v54;
  v100 = a7;
  v23 = v11;
  v97 = v23;
  v99 = &v102;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](assetIdsByFactorPack, "enumerateKeysAndObjectsUsingBlock:", v91);
  if (v109[5])
  {
    v24 = (void *)objc_opt_new();
    v25 = objc_opt_new();
    v26 = MEMORY[0x1E0C809B0];
    v27 = (void *)v25;
    v28 = (void *)v109[5];
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_3;
    v87[3] = &unk_1E9332690;
    v29 = v61;
    v88 = v29;
    v53 = v24;
    v89 = v53;
    v59 = v27;
    v90 = v59;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", v87);
    TRILogCategory_Server();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v30, OS_LOG_TYPE_DEFAULT, "Beginning plan for fetching asset diffs from AssetDiff records for use in factor packs.", buf, 2u);
    }

    v85[0] = v26;
    v85[1] = 3221225472;
    v85[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_339;
    v85[3] = &unk_1E9330E78;
    v86 = v29;
    v31 = (void *)MEMORY[0x1D8232C48](v85);
    v32 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v60, &unk_1E9363D98);
    *(_QWORD *)buf = 0;
    v80 = buf;
    v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__18;
    v83 = __Block_byref_object_dispose__18;
    v84 = 0;
    v33 = dispatch_semaphore_create(0);
    artifactProvider = self->_artifactProvider;
    v73[0] = v26;
    v73[1] = 3221225472;
    v73[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_342;
    v73[3] = &unk_1E93326B8;
    v73[4] = self;
    v35 = v23;
    v74 = v35;
    v77 = buf;
    v78 = a2;
    v75 = v62;
    v36 = v33;
    v76 = v36;
    -[TRIArtifactProvider fetchDiffSourceRecordIdsWithTargetAssetIds:isAcceptableSourceAssetId:options:completion:](artifactProvider, "fetchDiffSourceRecordIdsWithTargetAssetIds:isAcceptableSourceAssetId:options:completion:", v59, v31, v32, v73);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    lock = self->_lock;
    v71[0] = v26;
    v71[1] = 3221225472;
    v71[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_2_344;
    v71[3] = &unk_1E93323D0;
    v39 = v37;
    v72 = v39;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v71);
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v36);
    if (*((_QWORD *)v80 + 5))
    {
      v40 = (void *)objc_msgSend(v53, "mutableCopy");
      v67 = 0;
      v68 = &v67;
      v69 = 0x2020000000;
      v70 = 0;
      v41 = (void *)*((_QWORD *)v80 + 5);
      v63[0] = v26;
      v63[1] = 3221225472;
      v63[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_3_345;
      v63[3] = &unk_1E93326E0;
      v42 = v40;
      v64 = v42;
      v65 = v35;
      v66 = &v67;
      objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v63);
      TRILogCategory_Server();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = objc_msgSend(*((id *)v80 + 5), "count");
        v45 = (double)(unint64_t)v68[3] / 1000000.0;
        *(_DWORD *)v114 = 134218240;
        v115 = v44;
        v116 = 2048;
        v117 = v45;
        _os_log_impl(&dword_1D207F000, v43, OS_LOG_TYPE_DEFAULT, "Factor pack asset diff fetch planning phase complete.  On-demand fetch task will construct %tu assets from asset diffs.  Total factor pack asset diff download size: %.2f MB", v114, 0x16u);
      }

      objc_storeStrong(a6, v40);
      v46 = [TRIGenericRequiredAssets alloc];
      v47 = -[TRIGenericRequiredAssets initWithCloudKit:mobileAsset:](v46, "initWithCloudKit:mobileAsset:", v109[5], v103[5]);
      v48 = [TRIFactorPackAssetFetchPlan alloc];
      v49 = -[TRIFactorPackAssetFetchPlan initWithMetadataForRequestedUnlinkedAssets:recordIdsForDiffableAssetIds:recordIdsForNonDiffableAssetIds:](v48, "initWithMetadataForRequestedUnlinkedAssets:recordIdsForDiffableAssetIds:recordIdsForNonDiffableAssetIds:", v47, *((_QWORD *)v80 + 5), MEMORY[0x1E0C9AA70]);

      _Block_object_dispose(&v67, 8);
    }
    else
    {
      v49 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    -[TRIFetchOnDemandFactorsTask _completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:](self, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 3, 0, 0, v23, v62);
    -[TRIFetchOnDemandFactorsTask _addMetricForFetchOnDemandFactorsTaskError:](self, "_addMetricForFetchOnDemandFactorsTaskError:", 11);
    v49 = 0;
  }

  _Block_object_dispose(&v102, 8);
  _Block_object_dispose(&v108, 8);

  objc_autoreleasePoolPop(context);
  return v49;
}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_2;
  v55[3] = &unk_1E93325F0;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  v56 = v9;
  v57 = v10;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v55);

  +[TRIClientFactorPackUtils aliasesInNamespace:](TRIClientFactorPackUtils, "aliasesInNamespace:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 112))
  {
LABEL_9:
    v16 = 0;
    v18 = 0;
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 40), "pathForFactorLevelsWithFactorPackId:namespaceName:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v44 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138412546;
      v59 = v44;
      v60 = 2112;
      v61 = v6;
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Could not find path for flatbuffers for namespace:%@ and factorpackId:%@", buf, 0x16u);
    }

    goto LABEL_9;
  }
  v12 = v11;
  v47 = v9;
  objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fileExistsAtPath:", v13);

  if (v15)
  {
    v16 = v12;
    objc_msgSend(*(id *)(a1 + 40), "loadFactorLevelsWithDir:bufferSize:", v16, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v42 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v43 = *(void **)(v42 + 40);
      *(_QWORD *)(v42 + 40) = 0;

      *a4 = 1;
      v9 = v47;
      goto LABEL_35;
    }
    v18 = (void *)v17;
  }
  else
  {
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v45 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138412290;
      v59 = v45;
      _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "flatbuffer file missing for namespace name:%@", buf, 0xCu);
    }

    v18 = 0;
    v16 = 0;
  }

  if (*(_BYTE *)(a1 + 112))
    v21 = v15;
  else
    v21 = 0;
  if ((v21 & 1) != 0)
  {
    v22 = 0;
LABEL_25:
    objc_msgSend(*(id *)(a1 + 56), "keyValueStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:](TRINamespaceFactorSubscriptionSettings, "settingsWithKeyValueStore:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v29, "subscribedFactorsForNamespaceName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0C9AA60];
    }
    +[TRIClientFactorPackUtils unlinkedOnDemandAssetsWithFactorPack:flatbufferFactorLevels:factorPackPath:assetStore:maProvider:aliasToUnaliasMap:subscribedFactors:unlinkedMAAssetsOnDisk:](TRIClientFactorPackUtils, "unlinkedOnDemandAssetsWithFactorPack:flatbufferFactorLevels:factorPackPath:assetStore:maProvider:aliasToUnaliasMap:subscribedFactors:unlinkedMAAssetsOnDisk:", v22, v18, v16, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v48, v30, *(_QWORD *)(a1 + 104));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      objc_msgSend(v31, "cloudKit");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_337;
      v52[3] = &unk_1E9332618;
      v34 = v47;
      v35 = *(_QWORD *)(a1 + 88);
      v53 = v34;
      v54 = v35;
      objc_msgSend(v33, "enumerateObjectsUsingBlock:", v52);

      objc_msgSend(v32, "mobileAsset");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_2_338;
      v49[3] = &unk_1E9332640;
      v37 = v34;
      v38 = *(_QWORD *)(a1 + 96);
      v50 = v37;
      v51 = v38;
      objc_msgSend(v36, "enumerateObjectsUsingBlock:", v49);

    }
    else
    {
      TRILogCategory_Server();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "Failed to enumerate unlinked on-demand assets", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 3, 0, 0, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 32), "_addMetricForFetchOnDemandFactorsTaskError:", 8);
      v40 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v41 = *(void **)(v40 + 40);
      *(_QWORD *)(v40 + 40) = 0;

      *a4 = 1;
    }

    v9 = v47;
    goto LABEL_34;
  }
  v9 = v47;
LABEL_19:
  v23 = v16;
  objc_msgSend(*(id *)(a1 + 48), "pathForFactorPackWithId:namespaceName:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "loadFactorPackWithId:namespaceName:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v24 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v24;
  if (v16)
    v25 = v24 == 0;
  else
    v25 = 1;
  if (!v25)
  {
    v47 = v9;
    goto LABEL_25;
  }
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = 0;

  *a4 = 1;
LABEL_34:

LABEL_35:
}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "factorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "factorName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 136);
    objc_msgSend(v3, "assetId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9
      && (objc_msgSend(v3, "factorName"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v9, "isEqual:", v10),
          v10,
          (v11 & 1) == 0))
    {
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "assetId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "factorName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543874;
        v19 = v16;
        v20 = 2114;
        v21 = v9;
        v22 = 2114;
        v23 = v17;
        _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Warning:same assetId %{public}@ with different factor names %{public}@ and %{public}@; ignoring the latter",
          (uint8_t *)&v18,
          0x20u);

      }
    }
    else
    {
      objc_msgSend(v3, "factorName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(*(_QWORD *)(a1 + 40) + 136);
      objc_msgSend(v3, "assetId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

    }
  }

}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_337(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "factorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);

}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_2_338(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "factorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);

}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = (void *)a1[4];
  v11 = v3;
  objc_msgSend(v3, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "hasAssetWithIdentifier:type:", v5, 0);

  if ((v4 & 1) == 0)
  {
    v6 = (void *)a1[5];
    objc_msgSend(v11, "assetId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(v11, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v8, "type");

    if ((_DWORD)v7 == 1)
    {
      v9 = (void *)a1[6];
      objc_msgSend(v11, "assetId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

    }
  }

}

uint64_t __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_339(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasAssetWithIdentifier:type:", a2, 0);
}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_342(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v9 = a4;
  v10 = a5;
  switch(a2)
  {
    case 0:
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v14 = 3;
      v15 = 0;
      goto LABEL_5;
    case 1:
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v14 = 4;
      v15 = 0;
      v16 = 0;
      goto LABEL_6;
    case 2:
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v14 = 1;
      v15 = v9;
LABEL_5:
      v16 = v10;
LABEL_6:
      objc_msgSend(v11, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", v14, v15, v16, v12, v13);
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchOnDemandFactorsTask.m"), 1208, CFSTR("Unexpected TRIFetchStatus %tu"), 3);

      break;
    case 4:
      if (v19)
        v18 = v19;
      else
        v18 = (void *)MEMORY[0x1E0C9AA70];
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v18);
      break;
    default:
      break;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

uint64_t __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_2_344(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "addObject:", *(_QWORD *)(a1 + 32));
}

void __154__TRIFetchOnDemandFactorsTask__planForFetchingAssetDiffsWithContext_downloadOptions_updatingAggregateProgress_nonDiffableAssetIds_unlinkedMAAssetsOnDisk___block_invoke_3_345(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = (void *)a1[4];
  v6 = a3;
  objc_msgSend(v5, "removeObject:", a2);
  v7 = (void *)a1[5];
  objc_msgSend(v6, "recordId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerRecordId:withExpectedSize:", v8, objc_msgSend(v6, "downloadSize"));

  v9 = objc_msgSend(v6, "downloadSize");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += v9;
}

- (id)_planForFetchingAssetsFromFactorPacksWithContext:(id)a3 assetDiffFetchPlan:(id)a4 requiredAssetIds:(id)a5 downloadOptions:(id)a6 updatingAggregateProgress:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  dispatch_semaphore_t v15;
  TRIArtifactProvider *artifactProvider;
  void *v17;
  _PASLock *lock;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  TRISizedCKRecordID *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSUInteger v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *context;
  id v50;
  id v52;
  id v53;
  NSObject *v54;
  TRIFetchOptions *v55;
  id v56;
  id v57;
  id v58;
  id obj;
  void *v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  TRIFetchOnDemandFactorsTask *v65;
  id v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  _QWORD v73[4];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[5];
  id v86;
  id v87;
  id v88;
  NSObject *v89;
  uint8_t *v90;
  SEL v91;
  uint8_t buf[8];
  uint8_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  uint8_t v98[4];
  uint64_t v99;
  __int16 v100;
  NSUInteger v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  double v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v57 = a4;
  v12 = a5;
  v56 = a6;
  v13 = a7;
  context = (void *)MEMORY[0x1D8232A5C]();
  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Beginning plan for fetching assets from Asset records for use in factor packs.", buf, 2u);
  }

  v55 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v56, &unk_1E9363D98);
  v15 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  v93 = buf;
  v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__18;
  v96 = __Block_byref_object_dispose__18;
  artifactProvider = self->_artifactProvider;
  v97 = 0;
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke;
  v85[3] = &unk_1E9332708;
  v85[4] = self;
  v53 = v13;
  v86 = v53;
  v52 = v11;
  v87 = v52;
  v91 = a2;
  v88 = v12;
  v90 = buf;
  v54 = v15;
  v89 = v54;
  v58 = v88;
  -[TRIArtifactProvider fetchRecordIdsForAssetsWithIds:options:completion:](artifactProvider, "fetchRecordIdsForAssetsWithIds:options:completion:", v88, v55, v85);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  lock = self->_lock;
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke_2;
  v83[3] = &unk_1E93323D0;
  v50 = v17;
  v84 = v50;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v83);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v54);
  if (*((_QWORD *)v93 + 5))
  {
    objc_msgSend(v57, "metadataForRequestedUnlinkedAssets");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIClientFactorPackUtils uniqueAssets:](TRIClientFactorPackUtils, "uniqueAssets:", v19);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = 0;
    v80 = &v79;
    v81 = 0x2020000000;
    v82 = 0;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v58, "count"));
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v58, "count"));
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = v58;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v106, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v76 != v22)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
          objc_msgSend(*((id *)v93 + 5), "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchOnDemandFactorsTask.m"), 1308, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("recordIdsForAssetIds[assetId]"));

          }
          objc_msgSend(v20, "objectForKeyedSubscript:", v25);
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
            v27 = (void *)v26;
          else
            v27 = &unk_1E9363D80;
          objc_msgSend(v62, "cloudKit");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v29)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchOnDemandFactorsTask.m"), 1313, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("uniquePlannedAssets.cloudKit[assetId]"));

          }
          v30 = objc_msgSend(v29, "downloadSize");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v27, "unsignedLongLongValue") + v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v31, v25);
          v32 = -[TRISizedCKRecordID initWithRecordId:downloadSize:]([TRISizedCKRecordID alloc], "initWithRecordId:downloadSize:", v25, v30);
          objc_msgSend(v61, "setObject:forKeyedSubscript:", v32, v24);

          v80[3] += v30;
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v106, 16);
      }
      while (v21);
    }

    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke_3;
    v73[3] = &unk_1E93325C8;
    v35 = v53;
    v74 = v35;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v73);
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v72 = 1;
    objc_msgSend(v62, "mobileAsset");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke_4;
    v63[3] = &unk_1E9332730;
    v67 = &v79;
    v64 = v35;
    v65 = self;
    v66 = v52;
    v68 = &v69;
    objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v63);

    if (*((_BYTE *)v70 + 24))
    {
      TRILogCategory_Server();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v57, "metadataForRequestedUnlinkedAssets");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "cloudKit");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");
        objc_msgSend(v57, "metadataForRequestedUnlinkedAssets");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "mobileAsset");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "count");
        v44 = -[NSDictionary count](self->_assetIdsByFactorPack, "count");
        v45 = objc_msgSend(obj, "count");
        v46 = (double)(unint64_t)v80[3];
        *(_DWORD *)v98 = 134218752;
        v99 = v43 + v40;
        v100 = 2048;
        v101 = v44;
        v102 = 2048;
        v103 = v45;
        v104 = 2048;
        v105 = v46 / 1000000.0;
        _os_log_impl(&dword_1D207F000, v37, OS_LOG_TYPE_DEFAULT, "Factor pack asset fetch planning phase complete.  On-demand fetch task will result in linking %lu assets into %tu factor pack(s); %tu assets require full (unpatched) asset download.  Total factor pack unpatched asset dow"
          "nload size: %.2f MB",
          v98,
          0x2Au);

      }
      v47 = (void *)objc_msgSend(v57, "copyWithReplacementRecordIdsForNonDiffableAssetIds:", v61);
    }
    else
    {
      v47 = 0;
    }

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v79, 8);

  }
  else
  {
    v47 = 0;
  }

  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(context);

  return v47;
}

void __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v10 = a4;
  v11 = a5;
  switch(a2)
  {
    case 0:
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = 3;
      v16 = 0;
      goto LABEL_5;
    case 1:
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = 4;
      v16 = 0;
      v17 = 0;
      goto LABEL_6;
    case 2:
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = 1;
      v16 = v10;
LABEL_5:
      v17 = v11;
LABEL_6:
      objc_msgSend(v12, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", v15, v16, v17, v13, v14);
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchOnDemandFactorsTask.m"), 1276, CFSTR("Unexpected TRIFetchStatus %tu"), 3);

      break;
    case 4:
      v19 = v23;
      if (!v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchOnDemandFactorsTask.m"), 1280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("innerRecordIdsForAssetIds"));

        v19 = 0;
      }
      v20 = objc_msgSend(v19, "count");
      if (v20 != objc_msgSend(*(id *)(a1 + 56), "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchOnDemandFactorsTask.m"), 1281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("innerRecordIdsForAssetIds.count == requiredAssetIds.count"));

      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
      break;
    default:
      break;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));

}

uint64_t __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "addObject:", *(_QWORD *)(a1 + 32));
}

void __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v9 = a2;
  objc_msgSend(v5, "unregisterRecordId:", v9);
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v6, "unsignedLongLongValue");

  objc_msgSend(v7, "registerRecordId:withExpectedSize:", v9, v8);
}

void __158__TRIFetchOnDemandFactorsTask__planForFetchingAssetsFromFactorPacksWithContext_assetDiffFetchPlan_requiredAssetIds_downloadOptions_updatingAggregateProgress___block_invoke_4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id obj;
  id v32;
  id location;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = objc_msgSend(a3, "downloadSize");
  if (!v8)
  {
    location = 0;
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "createAutoAssetWithId:decryptionKey:error:", v7, 0, &location);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      TRILogCategory_Server();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = (uint64_t)location;
        _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Failed to instantiate MAAutoAsset: %{public}@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 3, 0, location, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
      goto LABEL_25;
    }
    v13 = location;
    location = 0;

    obj = location;
    v32 = 0;
    objc_msgSend(v12, "determineIfAvailableSync:withTimeout:discoveredAttributes:error:", CFSTR("determine Trial asset availability"), 30, &v32, &obj);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v32;
    objc_storeStrong(&location, obj);
    if (v14)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DEF8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "registerMAAsset:withExpectedSize:", v7, objc_msgSend(v16, "unsignedLongLongValue"));
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(v16, "unsignedLongLongValue");
        *(_DWORD *)buf = 134218242;
        v35 = v18;
        v36 = 2112;
        v37 = v7;
        _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Registering MA asset with size: %llu for assetId: %@", buf, 0x16u);
      }

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v16, "unsignedLongLongValue");
      goto LABEL_24;
    }
    if (location)
    {
      objc_msgSend(location, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.MobileAssetError.AutoAsset")) & 1) != 0)
      {
        v21 = objc_msgSend(location, "code");

        if (v21 == 6105)
        {
          TRILogCategory_Server();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v35 = (uint64_t)v12;
            _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "Timeout while checking availability of MAAutoAsset %{public}@", buf, 0xCu);
          }

          v23 = location;
          v25 = *(_QWORD *)(a1 + 32);
          v24 = *(void **)(a1 + 40);
          v26 = *(_QWORD *)(a1 + 48);
          v27 = 1;
LABEL_23:
          objc_msgSend(v24, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", v27, 0, v23, v25, v26);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
          *a4 = 1;
LABEL_24:

LABEL_25:
          goto LABEL_26;
        }
      }
      else
      {

      }
    }
    TRILogCategory_Server();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "allKeys");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = (uint64_t)v30;
      v36 = 2114;
      v37 = v12;
      _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ requires unavailable MAAutoAsset: %{public}@", buf, 0x16u);

    }
    v23 = location;
    v25 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(a1 + 40);
    v26 = *(_QWORD *)(a1 + 48);
    v27 = 3;
    goto LABEL_23;
  }
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "registerMAAsset:withExpectedSize:", v7, v8);
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v35 = v9;
    v36 = 2112;
    v37 = v7;
    _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Registering MA asset with size: %llu for assetId: %@", buf, 0x16u);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += v9;
LABEL_26:

}

- (void)_asyncFetchAssetsFromTreatmentRecordsWithContext:(id)a3 plan:(id)a4 aggregateProgress:(id)a5 downloadSize:(unint64_t *)a6 downloadOptions:(id)a7 group:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  dispatch_group_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  _QWORD v37[4];
  dispatch_group_t v38;
  id v39;
  TRIFetchOnDemandFactorsTask *v40;
  id v41;
  id v42;
  id v43;
  SEL v44;
  unint64_t *v45;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = dispatch_group_create();
  *a6 = 0;
  objc_msgSend(v15, "fetchPlansForTreatmentIds");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke;
  v37[3] = &unk_1E93327A8;
  v38 = v19;
  v39 = v17;
  v40 = self;
  v21 = v16;
  v41 = v21;
  v22 = v14;
  v42 = v22;
  v44 = a2;
  v23 = v15;
  v43 = v23;
  v45 = a6;
  v24 = v17;
  v25 = v19;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v37);

  dispatch_group_enter(v18);
  dispatch_get_global_queue(17, 0);
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_2_364;
  block[3] = &unk_1E93327D0;
  block[4] = self;
  v33 = v22;
  v34 = v23;
  v35 = v21;
  v36 = v18;
  v27 = v18;
  v28 = v21;
  v29 = v23;
  v30 = v22;
  dispatch_group_notify(v25, v26, block);

}

void __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  TRIFetchOptions *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  TRIFetchOptions *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  TRIFetchOptions *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;

  v5 = a2;
  v6 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v7 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", *(_QWORD *)(a1 + 40), &unk_1E9363D68);
  v8 = *(void **)(*(_QWORD *)(a1 + 48) + 120);
  objc_msgSend(v6, "assetIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_2;
  v32[3] = &unk_1E9332758;
  v33 = *(id *)(a1 + 56);
  v34 = v6;
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_3;
  v22[3] = &unk_1E9332780;
  v12 = *(void **)(a1 + 56);
  v22[4] = *(_QWORD *)(a1 + 48);
  v23 = v12;
  v24 = *(id *)(a1 + 64);
  v25 = v34;
  v13 = *(void **)(a1 + 72);
  v30 = *(_QWORD *)(a1 + 80);
  v26 = v5;
  v27 = v13;
  v28 = v7;
  v31 = *(_QWORD *)(a1 + 88);
  v29 = *(id *)(a1 + 32);
  v14 = v7;
  v15 = v5;
  v16 = v34;
  objc_msgSend(v8, "fetchAssetsWithIndexes:fromTreatmentWithRecordId:options:progress:completion:", v9, v10, v14, v32, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(void **)(*(_QWORD *)(a1 + 48) + 128);
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_362;
  v20[3] = &unk_1E93323D0;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "runWithLockAcquired:", v20);

}

void __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_2(uint64_t a1, double a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "recordId");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFractionCompleted:forRecordId:", v4, a2);

}

void __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  switch(a2)
  {
    case 0:
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = 3;
      v16 = 0;
      goto LABEL_5;
    case 1:
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = 4;
      goto LABEL_16;
    case 2:
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = 1;
      v16 = v10;
LABEL_5:
      v17 = v11;
      goto LABEL_17;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchOnDemandFactorsTask.m"), 1438, CFSTR("Unexpected TRIFetchStatus %tu"), 3);
      goto LABEL_7;
    case 4:
      if (v9
        && (v19 = objc_msgSend(v9, "count"),
            objc_msgSend(*(id *)(a1 + 56), "assetIndexes"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = objc_msgSend(v20, "count"),
            v20,
            v19 == v21))
      {
        v22 = *(void **)(a1 + 32);
        v23 = *(_QWORD *)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 72), "metadataForRequestedUnlinkedAssets");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "cloudKit");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 80), "downloadOptions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "paths");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(a1 + 104);
        v34 = 0;
        v29 = objc_msgSend(v22, "_saveIndexedAssetURLs:withTreatmentId:usingAssetMetadata:downloadOptions:paths:downloadSize:error:", v9, v23, v25, v26, v27, v28, &v34);
        v18 = v34;

        if (v29 != 1)
        {
          if (v29 == 2)
          {
            v30 = 1;
            objc_msgSend(*(id *)(a1 + 32), "setWasDeferred:", 1);
          }
          else
          {
            v30 = 3;
          }
          objc_msgSend(*(id *)(a1 + 32), "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", v30, 0, v18, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        }
LABEL_7:

      }
      else
      {
        TRILogCategory_Server();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
          v33 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 138543618;
          v36 = v32;
          v37 = 2112;
          v38 = v33;
          _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "No assets received after fetching on-demand factors for namespace %{public}@, treatment %@", buf, 0x16u);
        }

        v12 = *(void **)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 48);
        v15 = 3;
LABEL_16:
        v16 = 0;
        v17 = 0;
LABEL_17:
        objc_msgSend(v12, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", v15, v16, v17, v13, v14);
      }
LABEL_18:
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));

      return;
    default:
      goto LABEL_18;
  }
}

uint64_t __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_362(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "addObject:", *(_QWORD *)(a1 + 32));
}

void __138__TRIFetchOnDemandFactorsTask__asyncFetchAssetsFromTreatmentRecordsWithContext_plan_aggregateProgress_downloadSize_downloadOptions_group___block_invoke_2_364(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  int v3;
  TRIClientTreatmentStorage *v4;
  void *v5;
  TRIClientTreatmentStorage *v6;
  TRIFBClientTreatmentStorage *v7;
  void *v8;
  unint64_t v9;
  uint64_t i;
  uint64_t v11;
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
  NSObject *v26;
  BOOL v27;
  BOOL v28;
  TRIClientTreatmentStorage *v29;
  TRIFBClientTreatmentStorage *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v1 = a1;
  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_currentTaskStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "runStatus");

  if (!v3)
  {
    v4 = [TRIClientTreatmentStorage alloc];
    objc_msgSend(*(id *)(v1 + 40), "paths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TRIClientTreatmentStorage initWithPaths:](v4, "initWithPaths:", v5);

    v7 = [TRIFBClientTreatmentStorage alloc];
    objc_msgSend(*(id *)(v1 + 40), "paths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[TRIFBClientTreatmentStorage initWithPaths:](v7, "initWithPaths:", v8);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = *(id *)(*(_QWORD *)(v1 + 32) + 24);
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v34)
    {
      v33 = *(_QWORD *)v36;
      v9 = 0x1E0C99000uLL;
      v32 = v1;
      v29 = v6;
      while (2)
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v36 != v33)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          v12 = *(void **)(v1 + 32);
          objc_msgSend(*(id *)(v1 + 48), "metadataForRequestedUnlinkedAssets");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "cloudKit");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_assetIdsFromKeysInDictionary:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x1D8232A5C]();
          v17 = (void *)objc_msgSend(objc_alloc(*(Class *)(v9 + 3680)), "initWithObjects:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 48), 0);
          objc_autoreleasePoolPop(v16);
          -[TRIClientTreatmentStorage updateSavedTreatmentWithTreatmentId:linkingNewAssetIds:forNamespaceNames:](v6, "updateSavedTreatmentWithTreatmentId:linkingNewAssetIds:forNamespaceNames:", v11, v15, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (_os_feature_enabled_impl())
          {
            v19 = *(void **)(v1 + 32);
            objc_msgSend(*(id *)(v1 + 48), "metadataForRequestedUnlinkedAssets");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "cloudKit");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "_assetIdsFromKeysInDictionary:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)MEMORY[0x1D8232A5C]();
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 48), 0);
            objc_autoreleasePoolPop(v23);
            -[TRIFBClientTreatmentStorage updateSavedTreatmentWithTreatmentId:linkingNewAssetIds:forNamespaceNames:](v30, "updateSavedTreatmentWithTreatmentId:linkingNewAssetIds:forNamespaceNames:", v11, v22, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if ((v18 != 0) != (v25 != 0))
            {
              TRILogCategory_Server();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v40 = v11;
                _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "updating treatments for treatmentid:%{public}@ from fb storage did not have same result as updating treatments from pb", buf, 0xCu);
              }

            }
            v27 = v25 != 0;
            if (_os_feature_enabled_impl())
              v28 = v27;
            else
              v28 = v18 != 0;
            v6 = v29;
            if (!v28)
            {
LABEL_21:
              v1 = v32;
              objc_msgSend(*(id *)(v32 + 32), "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 3, 0, 0, *(_QWORD *)(v32 + 56), *(_QWORD *)(v32 + 40));
              objc_msgSend(*(id *)(v32 + 32), "_addMetricForFetchOnDemandFactorsTaskError:", 22);
              goto LABEL_22;
            }
          }
          else if (!v18)
          {
            goto LABEL_21;
          }
          v9 = 0x1E0C99000;
          v1 = v32;
        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        if (v34)
          continue;
        break;
      }
    }
LABEL_22:

  }
  dispatch_group_leave(*(dispatch_group_t *)(v1 + 64));
}

- (id)_fetchDiffsFromAssetDiffRecordsWithContext:(id)a3 plan:(id)a4 aggregateProgress:(id)a5 downloadSize:(unint64_t *)a6 options:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  TRIArtifactProvider *artifactProvider;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  _PASLock *lock;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  dispatch_semaphore_t v33;
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;
  NSObject *v43;
  uint64_t *v44;
  uint64_t *v45;
  SEL v46;
  unint64_t *v47;
  _QWORD v48[4];
  id v49;
  TRIFetchOnDemandFactorsTask *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  TRIFetchOnDemandFactorsTask *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v33 = dispatch_semaphore_create(0);
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__18;
  v66 = __Block_byref_object_dispose__18;
  v15 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v12, "recordIdsForDiffableAssetIds");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (id)objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  artifactProvider = self->_artifactProvider;
  objc_msgSend(v12, "recordIdsForDiffableAssetIds");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke;
  v56[3] = &unk_1E93327F8;
  v57 = v13;
  v52[0] = v19;
  v52[1] = 3221225472;
  v52[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_2;
  v52[3] = &unk_1E9332848;
  v53 = v12;
  v54 = self;
  v55 = v11;
  v48[0] = v19;
  v48[1] = 3221225472;
  v48[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_368;
  v48[3] = &unk_1E9332898;
  v49 = v53;
  v50 = self;
  v51 = v55;
  v38[0] = v19;
  v38[1] = 3221225472;
  v38[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_371;
  v38[3] = &unk_1E9332910;
  v38[4] = self;
  v20 = v57;
  v39 = v20;
  v21 = v51;
  v46 = a2;
  v40 = v21;
  v44 = &v58;
  v22 = v49;
  v41 = v22;
  v23 = v14;
  v47 = a6;
  v42 = v23;
  v45 = &v62;
  v24 = v33;
  v43 = v24;
  -[TRIArtifactProvider fetchDiffsWithRecordIds:options:perRecordProgress:perRecordCompletionBlockOnSuccess:perRecordCompletionBlockOnError:completion:](artifactProvider, "fetchDiffsWithRecordIds:options:perRecordProgress:perRecordCompletionBlockOnSuccess:perRecordCompletionBlockOnError:completion:", v18, v23, v56, v52, v48, v38);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  lock = self->_lock;
  v36[0] = v19;
  v36[1] = 3221225472;
  v36[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_379;
  v36[3] = &unk_1E93323D0;
  v27 = v25;
  v37 = v27;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v36);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v24);
  if (*((_BYTE *)v59 + 24))
  {
    v28 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v22, "recordIdsForDiffableAssetIds");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v28, "initWithArray:", v30);

    objc_msgSend(v31, "minusSet:", v63[5]);
  }
  else
  {
    v31 = 0;
  }

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  return v31;
}

uint64_t __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFractionCompleted:forRecordId:", a2);
}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "recordIdsForDiffableAssetIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_3;
  v9[3] = &unk_1E9332820;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v6;
  v12 = v7;
  v8 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(a3, "recordId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

  if ((_DWORD)v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = *(_QWORD **)(a1 + 40);
      v12 = v11[6];
      objc_msgSend(*(id *)(a1 + 48), "client");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_logOnDemandFactor:metricName:namespaceName:client:error:", v10, CFSTR("on_demand_factor_downloaded_by_request"), v12, v13, 0);

      objc_msgSend(*(id *)(a1 + 40), "removeDownloadableFactorNames:", v10);
    }
    else
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = v7;
        _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Missing factorname for diffable assetId %{public}@", (uint8_t *)&v15, 0xCu);
      }

    }
    *a4 = 1;

  }
}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_368(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "recordIdsForDiffableAssetIds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_2_369;
  v13[3] = &unk_1E9332870;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v14 = v6;
  v15 = v9;
  v16 = v10;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);

}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_2_369(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(a3, "recordId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

  if ((_DWORD)v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = *(_QWORD **)(a1 + 40);
      v12 = v11[6];
      objc_msgSend(*(id *)(a1 + 48), "client");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_logOnDemandFactor:metricName:namespaceName:client:error:", v10, CFSTR("on_demand_factor_failed_to_download_by_request"), v12, v13, *(_QWORD *)(a1 + 56));

      objc_msgSend(*(id *)(a1 + 40), "removeDownloadableFactorNames:", v10);
    }
    else
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = v7;
        _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Missing factorname for diffable assetId %{public}@", (uint8_t *)&v15, 0xCu);
      }

    }
    *a4 = 1;

  }
}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_371(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  TRIAssetStore *v22;
  void *v23;
  void *v24;
  void *v25;
  TRIAssetStore *v26;
  void *v27;
  void *v28;
  TRIAssetStore *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  _QWORD v37[4];
  id v38;
  TRIAssetStore *v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  _BYTE buf[24];
  char v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  switch(a2)
  {
    case 0:
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = 3;
      v16 = 0;
      goto LABEL_5;
    case 1:
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = 4;
      v16 = 0;
      v17 = 0;
      goto LABEL_6;
    case 2:
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = 1;
      v16 = v10;
LABEL_5:
      v17 = v11;
LABEL_6:
      objc_msgSend(v12, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", v15, v16, v17, v13, v14);
      goto LABEL_11;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchOnDemandFactorsTask.m"), 1585, CFSTR("Unexpected TRIFetchStatus %tu"), 3);

      goto LABEL_11;
    case 4:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      if (v9
        && (v19 = objc_msgSend(v9, "count"),
            objc_msgSend(*(id *)(a1 + 56), "recordIdsForDiffableAssetIds"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = objc_msgSend(v20, "count"),
            v20,
            v19 == v21))
      {
        v22 = [TRIAssetStore alloc];
        objc_msgSend(*(id *)(a1 + 48), "paths");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "downloadOptions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "activity");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[TRIAssetStore initWithPaths:monitoredActivity:](v22, "initWithPaths:monitoredActivity:", v23, v25);

        objc_msgSend(*(id *)(a1 + 56), "metadataForRequestedUnlinkedAssets");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRIClientFactorPackUtils uniqueAssets:](TRIClientFactorPackUtils, "uniqueAssets:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_2_372;
        v37[3] = &unk_1E93328C0;
        v38 = v28;
        v39 = v26;
        v40 = *(_QWORD *)(a1 + 32);
        v42 = *(_QWORD *)(a1 + 104);
        v41 = *(_OWORD *)(a1 + 88);
        v29 = v26;
        v30 = v28;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v37);

LABEL_11:
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v44 = 1;
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_378;
        v36[3] = &unk_1E93328E8;
        v36[4] = buf;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v36);
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
        _Block_object_dispose(buf, 8);
      }
      else
      {
        TRILogCategory_Server();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = *(_QWORD *)(a1 + 32);
          v33 = *(_QWORD *)(v32 + 48);
          objc_msgSend(*(id *)(v32 + 32), "allKeys");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "componentsJoinedByString:", CFSTR(", "));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v33;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v35;
          _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "No diffs received after fetching asset diffs for on-demand factors for namespace %{public}@, factor packs [%{public}@]", buf, 0x16u);

        }
      }

      return;
    default:
      goto LABEL_11;
  }
}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_2_372(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "cloudKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destAssetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v17 = 0;
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v4, "destAssetId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceAssetId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "diff");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), CFSTR("TRIFetchOnDemandFactorsTask.m"), 1602, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("artifact.diff.path"));

    }
    v13 = objc_msgSend(v8, "saveAssetWithIdentifier:builtFromAssetWithIdentifier:patchFilename:metadata:error:", v9, v10, v12, v7, &v17);

    if (v13)
    {
      **(_QWORD **)(a1 + 72) += objc_msgSend(v4, "diffSize");
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(v4, "destAssetId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

    }
  }

}

void __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_378(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diff");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v16);
  v8 = v16;

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 != (void *)*MEMORY[0x1E0CB28A8])
    {

      goto LABEL_5;
    }
    v11 = objc_msgSend(v8, "code");

    if (v11 != 4)
    {
LABEL_5:
      v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        if (v14)
          goto LABEL_11;
      }
      else if (v14)
      {
LABEL_11:
        objc_msgSend(v4, "diff");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v15;
        v19 = 2114;
        v20 = v8;
        _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Failed to clean up CK cached asset %@: %{public}@", buf, 0x16u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
  }

}

uint64_t __118__TRIFetchOnDemandFactorsTask__fetchDiffsFromAssetDiffRecordsWithContext_plan_aggregateProgress_downloadSize_options___block_invoke_379(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)_asyncFetchCKAssetsFromAssetRecordsWithContext:(id)a3 plan:(id)a4 aggregateProgress:(id)a5 downloadSize:(unint64_t *)a6 options:(id)a7 group:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _PASLock *lock;
  id v28;
  TRIArtifactProvider *artifactProvider;
  NSObject *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  SEL v39;
  unint64_t *v40;
  _QWORD v41[4];
  id v42;
  TRIFetchOnDemandFactorsTask *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  TRIFetchOnDemandFactorsTask *v47;
  id v48;
  _QWORD v49[4];
  id v50;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  dispatch_group_enter(v19);
  *a6 = 0;
  artifactProvider = self->_artifactProvider;
  objc_msgSend(v16, "recordIdsForNonDiffableAssetIds");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke;
  v49[3] = &unk_1E93327F8;
  v50 = v17;
  v45[0] = v21;
  v45[1] = 3221225472;
  v45[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_2;
  v45[3] = &unk_1E9332848;
  v46 = v16;
  v47 = self;
  v48 = v15;
  v41[0] = v21;
  v41[1] = 3221225472;
  v41[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_380;
  v41[3] = &unk_1E9332898;
  v42 = v46;
  v43 = self;
  v44 = v48;
  v33[0] = v21;
  v33[1] = 3221225472;
  v33[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_382;
  v33[3] = &unk_1E9332960;
  v33[4] = self;
  v34 = v50;
  v35 = v44;
  v36 = v42;
  v39 = a2;
  v40 = a6;
  v37 = v18;
  v38 = v19;
  v30 = v19;
  v22 = v18;
  v23 = v42;
  v24 = v44;
  v25 = v50;
  -[TRIArtifactProvider fetchAssetsWithRecordIds:options:perRecordProgress:perRecordCompletionBlockOnSuccess:perRecordCompletionBlockOnError:completion:](artifactProvider, "fetchAssetsWithRecordIds:options:perRecordProgress:perRecordCompletionBlockOnSuccess:perRecordCompletionBlockOnError:completion:", v20, v22, v49, v45, v41, v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  lock = self->_lock;
  v31[0] = v21;
  v31[1] = 3221225472;
  v31[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_384;
  v31[3] = &unk_1E93323D0;
  v32 = v26;
  v28 = v26;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v31);

}

uint64_t __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFractionCompleted:forRecordId:", a2);
}

void __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "recordIdsForNonDiffableAssetIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_3;
  v9[3] = &unk_1E9332820;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v6;
  v12 = v7;
  v8 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(a3, "recordId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

  if ((_DWORD)v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = *(_QWORD **)(a1 + 40);
      v12 = v11[6];
      objc_msgSend(*(id *)(a1 + 48), "client");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_logOnDemandFactor:metricName:namespaceName:client:error:", v10, CFSTR("on_demand_factor_downloaded_by_request"), v12, v13, 0);

      objc_msgSend(*(id *)(a1 + 40), "removeDownloadableFactorNames:", v10);
    }
    else
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = v7;
        _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Missing factorname for assetId %{public}@", (uint8_t *)&v15, 0xCu);
      }

    }
    *a4 = 1;

  }
}

void __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_380(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "recordIdsForNonDiffableAssetIds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_2_381;
  v13[3] = &unk_1E9332870;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v14 = v6;
  v15 = v9;
  v16 = v10;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);

}

void __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_2_381(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(a3, "recordId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

  if ((_DWORD)v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = *(_QWORD **)(a1 + 40);
      v12 = v11[6];
      objc_msgSend(*(id *)(a1 + 48), "client");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_logOnDemandFactor:metricName:namespaceName:client:error:", v10, CFSTR("on_demand_factor_failed_to_download_by_request"), v12, v13, *(_QWORD *)(a1 + 56));

      objc_msgSend(*(id *)(a1 + 40), "removeDownloadableFactorNames:", v10);
    }
    else
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = v7;
        _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Missing factorname for assetId %{public}@", (uint8_t *)&v15, 0xCu);
      }

    }
    *a4 = 1;

  }
}

void __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_382(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  _BYTE buf[24];
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  switch(a2)
  {
    case 0:
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = 3;
      v16 = 0;
      goto LABEL_5;
    case 1:
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = 4;
      v16 = 0;
      v17 = 0;
      goto LABEL_6;
    case 2:
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = 1;
      v16 = v10;
LABEL_5:
      v17 = v11;
LABEL_6:
      objc_msgSend(v12, "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", v15, v16, v17, v13, v14);
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchOnDemandFactorsTask.m"), 1709, CFSTR("Unexpected TRIFetchStatus %tu"), 3);

      break;
    case 4:
      if (v9
        && (v19 = objc_msgSend(v9, "count"),
            objc_msgSend(*(id *)(a1 + 56), "recordIdsForNonDiffableAssetIds"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = objc_msgSend(v20, "count"),
            v20,
            v19 == v21))
      {
        objc_msgSend(*(id *)(a1 + 56), "metadataForRequestedUnlinkedAssets");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRIClientFactorPackUtils uniqueAssets:](TRIClientFactorPackUtils, "uniqueAssets:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = *(void **)(a1 + 32);
        objc_msgSend(v23, "cloudKit");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "downloadOptions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(a1 + 88);
        objc_msgSend(*(id *)(a1 + 48), "paths");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v29 = objc_msgSend(v24, "_saveNamedAssetURLs:usingAssetMetadata:downloadOptions:downloadSize:paths:error:", v9, v25, v26, v27, v28, &v38);
        v30 = v38;

        if (v29 != 1)
        {
          if (v29 == 2)
          {
            objc_msgSend(*(id *)(a1 + 32), "setWasDeferred:", 1);
            v31 = 1;
          }
          else
          {
            v31 = 3;
          }
          objc_msgSend(*(id *)(a1 + 32), "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", v31, 0, v30, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        }

      }
      else
      {
        TRILogCategory_Server();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = *(_QWORD *)(a1 + 32);
          v34 = *(_QWORD *)(v33 + 48);
          objc_msgSend(*(id *)(v33 + 32), "allKeys");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "componentsJoinedByString:", CFSTR(", "));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v34;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v36;
          _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "No assets received after fetching on-demand factors for namespace %{public}@, factor packs [%{public}@]", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", 3, 0, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
      break;
    default:
      break;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v40 = 1;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_383;
  v37[3] = &unk_1E9332938;
  v37[4] = buf;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v37);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
  _Block_object_dispose(buf, 8);

}

void __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_383(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v14);
  v7 = v14;

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 != (void *)*MEMORY[0x1E0CB28A8])
    {

      goto LABEL_5;
    }
    v10 = objc_msgSend(v7, "code");

    if (v10 != 4)
    {
LABEL_5:
      v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (v11)
      {
        if (v13)
          goto LABEL_11;
      }
      else if (v13)
      {
LABEL_11:
        *(_DWORD *)buf = 138412546;
        v16 = v4;
        v17 = 2114;
        v18 = v7;
        _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failed to clean up CK cached asset %@: %{public}@", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
  }

}

uint64_t __128__TRIFetchOnDemandFactorsTask__asyncFetchCKAssetsFromAssetRecordsWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_384(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)_asyncFetchMAAssetsFromFactorPacksWithContext:(id)a3 plan:(id)a4 aggregateProgress:(id)a5 downloadSize:(unint64_t *)a6 options:(id)a7 group:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  TRITaskAttributing *taskAttributing;
  uint64_t v23;
  void *v24;
  _PASLock *lock;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[16];

  v13 = a3;
  v14 = a5;
  v15 = a8;
  *a6 = 0;
  objc_msgSend(a4, "metadataForRequestedUnlinkedAssets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIClientFactorPackUtils uniqueAssets:](TRIClientFactorPackUtils, "uniqueAssets:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "mobileAsset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v20 = objc_opt_new();
    objc_msgSend(v17, "mobileAsset");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    taskAttributing = self->_taskAttributing;
    v23 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __127__TRIFetchOnDemandFactorsTask__asyncFetchMAAssetsFromFactorPacksWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke;
    v28[3] = &unk_1E9332988;
    v28[4] = self;
    v29 = v14;
    v30 = v13;
    -[NSObject downloadAssets:attribution:aggregateProgress:group:completion:](v20, "downloadAssets:attribution:aggregateProgress:group:completion:", v21, taskAttributing, v29, v15, v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      lock = self->_lock;
      v26[0] = v23;
      v26[1] = 3221225472;
      v26[2] = __127__TRIFetchOnDemandFactorsTask__asyncFetchMAAssetsFromFactorPacksWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_2;
      v26[3] = &unk_1E93323D0;
      v27 = v24;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v26);

    }
  }
  else
  {
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "Fetch plan includes no MAAutoAssets.", buf, 2u);
    }
  }

}

void __127__TRIFetchOnDemandFactorsTask__asyncFetchMAAssetsFromFactorPacksWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5)
{
  id v9;
  id v10;

  v10 = a4;
  v9 = a5;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "setWasDeferred:", 1);
  if ((_DWORD)a2 != 2)
    objc_msgSend(*(id *)(a1 + 32), "_completeTaskWithStatus:earliestRetryDate:error:aggregateProgress:context:", a2, v10, v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __127__TRIFetchOnDemandFactorsTask__asyncFetchMAAssetsFromFactorPacksWithContext_plan_aggregateProgress_downloadSize_options_group___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)willBeCancelledByTaskQueue:(id)a3 withContext:(id)a4
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_386, a4);
}

void __70__TRIFetchOnDemandFactorsTask_willBeCancelledByTaskQueue_withContext___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a2 + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancel", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_addMetricForFetchOnDemandFactorsTaskError:(int)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0DC0F08];
  fetchTaskErrorAsString(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metricWithName:categoricalValue:", CFSTR("fetchondemandfactorstask_error"), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[TRIFetchOnDemandFactorsTask _addMetric:](self, "_addMetric:", v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  char v10;
  BOOL v11;
  NSString *v12;
  char v13;
  NSString *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TRIFetchOnDemandFactorsTask;
  if (-[TRIBaseTask isEqual:](&v16, sel_isEqual_, v4))
  {
    v5 = v4;
    if (!-[NSDictionary isEqualToDictionary:](self->_assetIndexesByTreatment, "isEqualToDictionary:", *((_QWORD *)v5 + 3)))goto LABEL_27;
    v6 = self->_experimentId;
    v7 = (NSString *)*((id *)v5 + 20);
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      if (v6)
        v9 = v7 == 0;
      else
        v9 = 1;
      if (v9)
      {
        v10 = 0;
        goto LABEL_10;
      }
      v11 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (!v11)
        goto LABEL_27;
    }
    if (!-[NSDictionary isEqualToDictionary:](self->_assetIdsByFactorPack, "isEqualToDictionary:", *((_QWORD *)v5 + 4))
      || !-[NSSet isEqual:](self->_rolloutFactorNames, "isEqual:", *((_QWORD *)v5 + 5)))
    {
      goto LABEL_27;
    }
    v6 = self->_deployment;
    v12 = (NSString *)*((id *)v5 + 19);
    if (v6 == v12)
    {

      goto LABEL_22;
    }
    v8 = v12;
    v10 = 0;
    if (v6 && v12)
    {
      v13 = -[NSString isEqualToDeployment:](v6, "isEqualToDeployment:", v12);

      if ((v13 & 1) == 0)
        goto LABEL_27;
LABEL_22:
      if (-[NSString isEqualToString:](self->_namespaceName, "isEqualToString:", *((_QWORD *)v5 + 6)))
      {
        v6 = self->_notificationKey;
        v14 = (NSString *)*((id *)v5 + 9);
        if (v6 == v14)
        {
          v10 = 1;
          v8 = v6;
        }
        else
        {
          v8 = v14;
          v10 = 0;
          if (v6 && v14)
            v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v14);
        }
        goto LABEL_10;
      }
LABEL_27:
      v10 = 0;
      goto LABEL_28;
    }
LABEL_10:

LABEL_28:
    goto LABEL_29;
  }
  v10 = 0;
LABEL_29:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSDictionary hash](self->_assetIndexesByTreatment, "hash");
  v4 = -[NSDictionary hash](self->_assetIdsByFactorPack, "hash") + 37 * v3;
  v5 = -[NSSet hash](self->_rolloutFactorNames, "hash") + 37 * v4;
  v6 = -[NSString hash](self->_namespaceName, "hash") + 37 * v5;
  return -[NSString hash](self->_notificationKey, "hash") + 37 * v6;
}

- (void)_addMetric:(id)a3
{
  TRIFetchOnDemandFactorsTask *v4;
  NSMutableArray *metrics;
  uint64_t v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  metrics = v4->_metrics;
  if (!metrics)
  {
    v6 = objc_opt_new();
    v7 = v4->_metrics;
    v4->_metrics = (NSMutableArray *)v6;

    metrics = v4->_metrics;
  }
  -[NSMutableArray addObject:](metrics, "addObject:", v8);
  objc_sync_exit(v4);

}

- (void)_addDimension:(id)a3
{
  TRIFetchOnDemandFactorsTask *v4;
  NSMutableArray *dimensions;
  uint64_t v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  dimensions = v4->_dimensions;
  if (!dimensions)
  {
    v6 = objc_opt_new();
    v7 = v4->_dimensions;
    v4->_dimensions = (NSMutableArray *)v6;

    dimensions = v4->_dimensions;
  }
  -[NSMutableArray addObject:](dimensions, "addObject:", v8);
  objc_sync_exit(v4);

}

- (id)metrics
{
  NSObject *v3;
  void *v4;
  void *v5;
  TRIFetchOnDemandFactorsTask *v6;
  _PASLock *lock;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEFAULT, "TRIFetchOnDemandFactorsTask gather metrics", buf, 2u);
  }

  v4 = (void *)MEMORY[0x1D8232A5C]();
  v5 = (void *)objc_opt_new();
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_metrics)
    objc_msgSend(v5, "addObjectsFromArray:");
  objc_sync_exit(v6);

  lock = v6->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __38__TRIFetchOnDemandFactorsTask_metrics__block_invoke;
  v13[3] = &unk_1E93323D0;
  v8 = v5;
  v14 = v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "TRIFetchOnDemandFactorsTask metrics: %@", buf, 0xCu);
  }

  if (objc_msgSend(v8, "count"))
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  objc_autoreleasePoolPop(v4);
  return v11;
}

void __38__TRIFetchOnDemandFactorsTask_metrics__block_invoke(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (a2[4])
  {
    v4 = a2;
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "TRIFetchOnDemandFactorsTask gather metrics for fetchError", v8, 2u);
    }

    v6 = (void *)a2[4];
    TRIFetchErrorParseToMetrics(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v7);

  }
}

- (id)dimensions
{
  TRIFetchOnDemandFactorsTask *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_dimensions, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)trialSystemTelemetry
{
  return self->_trialSystemTelemetry;
}

- (void)_logOnDemandFactor:(id)a3 metricName:(id)a4 namespaceName:(id)a5 client:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
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
  void *v28;
  void *context;
  id v30;

  v30 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v14 && objc_msgSend(v14, "shouldLogAtLevel:", 20))
  {
    context = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v16, 0);
    if (v15)
    {
      TRIFetchErrorParseToMetrics(v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v17, "addObjectsFromArray:", v18);
      }
      else
      {
        v19 = (void *)MEMORY[0x1E0DC0F08];
        objc_msgSend(v15, "localizedDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "metricWithName:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v21);

      }
    }
    -[TRIFetchOnDemandFactorsTask trialSystemTelemetry](self, "trialSystemTelemetry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");

    objc_msgSend(v23, "ensureOnDemandFactorFields");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFactorName:", v30);

    objc_msgSend(v23, "ensureOnDemandFactorFields");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNamespaceName:", v13);

    objc_msgSend(v14, "logger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trackingId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIFetchOnDemandFactorsTask dimensions](self, "dimensions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v27, v17, v28, v23);

    objc_autoreleasePoolPop(context);
  }

}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  NSDictionary *assetIndexesByTreatment;
  uint64_t v6;
  id v7;
  void *v8;
  NSDictionary *assetIdsByFactorPack;
  id v10;
  void *v11;
  void *v12;
  TRIRolloutDeployment *deployment;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  assetIndexesByTreatment = self->_assetIndexesByTreatment;
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke;
  v22[3] = &unk_1E93329F8;
  v7 = v4;
  v23 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](assetIndexesByTreatment, "enumerateKeysAndObjectsUsingBlock:", v22);
  objc_msgSend(v3, "setTreatmentAssetIndexesArray:", v7);
  v8 = (void *)objc_opt_new();
  assetIdsByFactorPack = self->_assetIdsByFactorPack;
  v17 = v6;
  v18 = 3221225472;
  v19 = __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke_3;
  v20 = &unk_1E9332A48;
  v10 = v8;
  v21 = v10;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](assetIdsByFactorPack, "enumerateKeysAndObjectsUsingBlock:", &v17);
  objc_msgSend(v3, "setFactorPackAssetIdsArray:", v10, v17, v18, v19, v20);
  v11 = (void *)-[NSSet mutableCopy](self->_rolloutFactorNames, "mutableCopy");
  objc_msgSend(v3, "setRolloutFactorNamesArray:", v11);

  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttributing, "asPersistedTaskAttribution");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v12);

  objc_msgSend(v3, "setNamespaceName:", self->_namespaceName);
  objc_msgSend(v3, "setRetryCount:", self->_retryCount);
  if (self->_notificationKey)
    objc_msgSend(v3, "setNotificationKey:");
  if (self->_experimentId)
    objc_msgSend(v3, "setExperimentId:");
  deployment = self->_deployment;
  if (deployment)
  {
    -[TRIRolloutDeployment rolloutId](deployment, "rolloutId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRolloutId:", v14);

    objc_msgSend(v3, "setDeploymentId:", -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId"));
  }
  -[TRITaskCapabilityModifier asPersistedModifier](self->_capabilityModifier, "asPersistedModifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCapabilityModifier:", v15);

  return v3;
}

void __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setTreatmentId:", v10);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0F58]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke_2;
  v11[3] = &unk_1E93329D0;
  v12 = v8;
  v9 = v8;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v11);
  objc_msgSend(v7, "setIndexArray:", v9);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  objc_autoreleasePoolPop(v6);
}

uint64_t __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addValue:", a2);
}

void __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setFactorPackId:", v6);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke_4;
  v9[3] = &unk_1E9332A20;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
}

void __47__TRIFetchOnDemandFactorsTask__asPersistedTask__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = (id)objc_opt_new();
  objc_msgSend(v3, "assetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssetId:", v4);

  objc_msgSend(v3, "factorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFactorName:", v5);
  objc_msgSend(*(id *)(a1 + 32), "assetIdFactorNameArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIFetchOnDemandFactorsTask _asPersistedTask](self, "_asPersistedTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchOnDemandFactorsTask.m"), 2028, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

- (void)setRetryCount:(int)a3
{
  self->_retryCount = a3;
}

- (int)retryCount
{
  return self->_retryCount;
}

+ (id)parseFromData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t j;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  objc_class *v65;
  void *v66;
  const char *v67;
  objc_class *v68;
  objc_class *v69;
  _DWORD *v70;
  NSObject *v72;
  const char *v73;
  objc_class *v74;
  void *v75;
  NSObject *v76;
  id v77;
  void *v78;
  void *v79;
  TRITaskCapabilityModifier *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  TRITaskCapabilityModifier *v84;
  void *v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *context;
  NSObject *contexta;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id obj;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[4];
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  id v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  uint8_t v122[128];
  uint8_t buf[4];
  id v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v118 = 0;
  +[TRIPBMessage parseFromData:error:](TRIFetchOnDemandFactorsPersistedTask, "parseFromData:error:", v3, &v118);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v118;
  if (!v4)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v124 = v5;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIFetchOnDemandFactorsPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_65;
  }
  if ((objc_msgSend(v4, "hasNamespaceName") & 1) == 0)
  {
    TRILogCategory_Server();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      v74 = (objc_class *)objc_opt_class();
      NSStringFromClass(v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v124 = v75;
      _os_log_error_impl(&dword_1D207F000, v64, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: namespaceName", buf, 0xCu);

    }
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_65;
    v65 = (objc_class *)objc_opt_class();
    NSStringFromClass(v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v124 = v66;
    v67 = "Cannot decode message of type %@ with missing field: namespaceName";
    goto LABEL_64;
  }
  objc_msgSend(v4, "namespaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v68 = (objc_class *)objc_opt_class();
      NSStringFromClass(v68);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v124 = v66;
      v67 = "Cannot decode message of type %@ with field of length 0: namespaceName";
LABEL_64:
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, v67, buf, 0xCu);

    }
LABEL_65:
    v70 = 0;
    goto LABEL_66;
  }
  if ((objc_msgSend(v4, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v69 = (objc_class *)objc_opt_class();
      NSStringFromClass(v69);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v124 = v66;
      v67 = "Cannot decode message of type %@ with missing field: taskAttribution";
      goto LABEL_64;
    }
    goto LABEL_65;
  }
  v8 = objc_opt_new();
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  objc_msgSend(v4, "treatmentAssetIndexesArray");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v122, 16);
  v98 = v5;
  if (!v9)
    goto LABEL_17;
  v10 = v9;
  v11 = *(_QWORD *)v115;
  v96 = v3;
LABEL_7:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v115 != v11)
      objc_enumerationMutation(obj);
    v13 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v12);
    v14 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v13, "treatmentId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (!v16)
      break;
    if (!objc_msgSend(v13, "indexArray_Count"))
    {
      TRILogCategory_Server();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v73 = "TRIFetchOnDemandFactorsPersistedTask contains empty index array";
LABEL_97:
        _os_log_error_impl(&dword_1D207F000, v72, OS_LOG_TYPE_ERROR, v73, buf, 2u);
      }
      goto LABEL_70;
    }
    objc_msgSend(v13, "treatmentId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v20 = v18;
    else
      v20 = (id)objc_opt_new();
    v21 = v20;

    objc_msgSend(v13, "indexArray");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v112[0] = MEMORY[0x1E0C809B0];
    v112[1] = 3221225472;
    v112[2] = __45__TRIFetchOnDemandFactorsTask_parseFromData___block_invoke;
    v112[3] = &unk_1E93306F0;
    v113 = v21;
    v23 = v21;
    objc_msgSend(v22, "enumerateValuesWithBlock:", v112);

    objc_msgSend(v13, "treatmentId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v23, v24);

    objc_autoreleasePoolPop(v14);
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v122, 16);
      v3 = v96;
      v5 = v98;
      if (!v10)
      {
LABEL_17:

        obj = (id)objc_opt_new();
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        objc_msgSend(v4, "factorPackAssetIdsArray");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v108, v121, 16);
        if (!v26)
        {
LABEL_51:

          v59 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v4, "rolloutFactorNamesArray");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setWithArray:", v60);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "taskAttribution");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          if (v62)
          {
            if (objc_msgSend(v4, "hasExperimentId"))
            {
              objc_msgSend(v4, "experimentId");
              v63 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v63 = 0;
            }
            contexta = v63;
            if (objc_msgSend(v4, "hasRolloutId") && objc_msgSend(v4, "hasDeploymentId"))
            {
              v77 = objc_alloc(MEMORY[0x1E0DC0B60]);
              objc_msgSend(v4, "rolloutId");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = (void *)objc_msgSend(v77, "initWithRolloutId:deploymentId:", v78, objc_msgSend(v4, "deploymentId"));

            }
            else
            {
              v95 = 0;
            }
            if (objc_msgSend(v4, "hasNotificationKey"))
            {
              objc_msgSend(v4, "notificationKey");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v79 = 0;
            }
            if ((objc_msgSend(v4, "hasCapabilityModifier") & 1) != 0)
            {
              v80 = [TRITaskCapabilityModifier alloc];
              objc_msgSend(v4, "capabilityModifier");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = objc_msgSend(v81, "add");
              objc_msgSend(v4, "capabilityModifier");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = -[TRITaskCapabilityModifier initWithAdd:remove:](v80, "initWithAdd:remove:", v82, objc_msgSend(v83, "remove"));

            }
            else
            {
              v84 = (TRITaskCapabilityModifier *)objc_opt_new();
            }
            objc_msgSend(v4, "namespaceName");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = contexta;
            +[TRIFetchOnDemandFactorsTask taskWithAssetIndexesByTreatment:experimentId:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployment:namespaceName:taskAttributing:notificationKey:capabilityModifier:](TRIFetchOnDemandFactorsTask, "taskWithAssetIndexesByTreatment:experimentId:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployment:namespaceName:taskAttributing:notificationKey:capabilityModifier:", v8, contexta, obj, v30, v95, v85, v62, v79, v84);
            v70 = (_DWORD *)objc_claimAutoreleasedReturnValue();

            v86 = objc_msgSend(v4, "hasRetryCount");
            if (v86)
              v86 = objc_msgSend(v4, "retryCount");
            v70[16] = v86;

            v5 = v98;
          }
          else
          {
            TRILogCategory_Server();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D207F000, v76, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
            }
            v70 = 0;
          }

LABEL_94:
          goto LABEL_95;
        }
        v27 = v26;
        v28 = *(_QWORD *)v109;
        v89 = v25;
        v91 = *(_QWORD *)v109;
        while (2)
        {
          v29 = 0;
          v88 = v27;
LABEL_20:
          if (*(_QWORD *)v109 != v28)
            objc_enumerationMutation(v25);
          v30 = v25;
          v90 = v29;
          v31 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v29);
          v32 = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(v31, "factorPackId");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          TRIValidateFactorPackId();
          v34 = objc_claimAutoreleasedReturnValue();

          if (!v34)
            goto LABEL_75;
          v94 = (void *)v34;
          objc_msgSend(obj, "objectForKeyedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v35;
          context = v32;
          if (v35)
            v37 = v35;
          else
            v37 = (id)objc_opt_new();
          v38 = v37;
          v28 = v91;

          if (objc_msgSend(v31, "assetIdFactorNameArray_Count"))
          {
            v39 = objc_msgSend(v31, "assetIdFactorNameArray_Count");
            v104 = 0u;
            v105 = 0u;
            v106 = 0u;
            v107 = 0u;
            objc_msgSend(v31, "assetIdFactorNameArray");
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = -[NSObject countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
            if (v41)
            {
              v42 = v41;
              v87 = v39;
              v97 = v3;
              v43 = *(_QWORD *)v105;
              while (2)
              {
                for (i = 0; i != v42; ++i)
                {
                  if (*(_QWORD *)v105 != v43)
                    objc_enumerationMutation(v40);
                  v45 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
                  objc_msgSend(v45, "assetId");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  TRIValidateAssetId();
                  v47 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v47)
                  {
                    v3 = v97;
                    goto LABEL_73;
                  }
                  v48 = objc_alloc(MEMORY[0x1E0DC0998]);
                  objc_msgSend(v45, "factorName");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = (void *)objc_msgSend(v48, "initWithAssetId:factorName:", v47, v49);
                  objc_msgSend(v38, "addObject:", v50);

                }
                v42 = -[NSObject countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
                if (v42)
                  continue;
                break;
              }
              v3 = v97;
              goto LABEL_46;
            }
LABEL_47:
            v25 = v30;
          }
          else
          {
            v25 = v30;
            if (!objc_msgSend(v31, "assetIdArray_Count"))
              goto LABEL_98;
            v39 = objc_msgSend(v31, "assetIdArray_Count");
            v100 = 0u;
            v101 = 0u;
            v102 = 0u;
            v103 = 0u;
            objc_msgSend(v31, "assetIdArray");
            v40 = objc_claimAutoreleasedReturnValue();
            v51 = -[NSObject countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
            if (!v51)
              goto LABEL_47;
            v52 = v51;
            v87 = v39;
            v53 = v3;
            v54 = *(_QWORD *)v101;
            while (2)
            {
              for (j = 0; j != v52; ++j)
              {
                if (*(_QWORD *)v101 != v54)
                  objc_enumerationMutation(v40);
                TRIValidateAssetId();
                v56 = objc_claimAutoreleasedReturnValue();
                if (!v56)
                {
                  v3 = v53;
LABEL_73:
                  v5 = v98;
                  v30 = v89;
                  goto LABEL_74;
                }
                v57 = (void *)v56;
                v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0998]), "initWithAssetId:factorName:", v56, 0);
                objc_msgSend(v38, "addObject:", v58);

              }
              v52 = -[NSObject countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
              if (v52)
                continue;
              break;
            }
            v3 = v53;
LABEL_46:
            v5 = v98;
            v25 = v89;
            v28 = v91;
            v39 = v87;
          }

          if (!v39)
          {
LABEL_98:
            v30 = v25;
            TRILogCategory_Server();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D207F000, v40, OS_LOG_TYPE_ERROR, "TRIFetchOnDemandFactorsPersistedTask contains empty asset index array", buf, 2u);
            }
LABEL_74:
            v32 = context;

LABEL_75:
            objc_autoreleasePoolPop(v32);
            v70 = 0;
            goto LABEL_94;
          }
          objc_msgSend(obj, "setObject:forKeyedSubscript:", v38, v94);

          objc_autoreleasePoolPop(context);
          v29 = v90 + 1;
          if (v90 + 1 == v88)
          {
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v108, v121, 16);
            if (v27)
              continue;
            goto LABEL_51;
          }
          goto LABEL_20;
        }
      }
      goto LABEL_7;
    }
  }
  TRILogCategory_Server();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v73 = "TRIFetchOnDemandFactorsPersistedTask contains empty treatmentId";
    goto LABEL_97;
  }
LABEL_70:
  v3 = v96;
  v5 = v98;

  objc_autoreleasePoolPop(v14);
  v70 = 0;
LABEL_95:

LABEL_66:
  return v70;
}

uint64_t __45__TRIFetchOnDemandFactorsTask_parseFromData___block_invoke(uint64_t a1, unsigned int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
}

- (unint64_t)requiredCapabilities
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v7;

  -[TRITaskAttributing networkOptions](self->_taskAttributing, "networkOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiredCapability");
  v7.receiver = self;
  v7.super_class = (Class)TRIFetchOnDemandFactorsTask;
  v5 = -[TRIBaseTask requiredCapabilities](&v7, sel_requiredCapabilities) | v4 | (4 * (self->_retryCount > 0));

  return -[TRITaskCapabilityModifier updateCapability:](self->_capabilityModifier, "updateCapability:", v5);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  NSString *namespaceName;
  NSString *notificationKey;
  void *v11;
  void *v12;
  void *v13;

  -[TRITaskAttributing networkOptions](self->_taskAttributing, "networkOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "discretionaryBehavior");
  v5 = CFSTR("disc");
  if (!v4)
    v5 = CFSTR("non-disc");
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  namespaceName = self->_namespaceName;
  notificationKey = self->_notificationKey;
  -[TRITaskAttributing applicationBundleIdentifier](self->_taskAttributing, "applicationBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet anyObject](self->_rolloutFactorNames, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@:%@,%@,a:%@,d:%@,f:%@,r:%d>"), v8, namespaceName, notificationKey, v11, v6, v12, -[TRIFetchOnDemandFactorsTask retryCount](self, "retryCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchOnDemandFactorsTask)initWithCoder:(id)a3
{
  id v4;
  TRIFetchOnDemandFactorsTask *v5;
  void *v6;
  TRIFetchOnDemandFactorsTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchOnDemandFactorsTask;
  v5 = -[TRIFetchOnDemandFactorsTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIFetchOnDemandFactorsTask *)objc_claimAutoreleasedReturnValue();
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

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchOnDemandFactorsTask.m"), 2158, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIFetchOnDemandFactorsTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (BOOL)wasDeferred
{
  return self->wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->wasDeferred = a3;
}

- (TRIRolloutDeployment)deployment
{
  return self->_deployment;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
  objc_storeStrong((id *)&self->_factorNameByAssetId, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_artifactProvider, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_trialSystemTelemetry, 0);
  objc_storeStrong((id *)&self->_capabilityModifier, 0);
  objc_storeStrong((id *)&self->_notificationKey, 0);
  objc_storeStrong((id *)&self->_taskAttributing, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_rolloutFactorNames, 0);
  objc_storeStrong((id *)&self->_assetIdsByFactorPack, 0);
  objc_storeStrong((id *)&self->_assetIndexesByTreatment, 0);
}

@end
