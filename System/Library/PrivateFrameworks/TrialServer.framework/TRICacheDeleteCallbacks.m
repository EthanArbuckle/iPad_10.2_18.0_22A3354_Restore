@implementation TRICacheDeleteCallbacks

- (BOOL)_trialVolumeIsEqualToVolume:(id)a3
{
  TRIPaths *paths;
  id v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  BOOL v12;
  NSObject *v13;
  int v15;
  const __CFString *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  paths = self->_paths;
  v5 = a3;
  -[TRIPaths trialVolume](paths, "trialVolume");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v6)
      v8 = v6;
    else
      v8 = CFSTR("nil");
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_INFO, "Found the following trial directory volume: %@", (uint8_t *)&v15, 0xCu);
  }

  -[TRIPaths volumeForDirectory:](self->_paths, "volumeForDirectory:", v5);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v9)
      v11 = v9;
    else
      v11 = CFSTR("nil");
    v15 = 138412290;
    v16 = v11;
    _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_INFO, "Found the following cache delete requested volume: %@", (uint8_t *)&v15, 0xCu);
  }

  if (!v6 || !v9)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Invalid trial or cache delete requested volume", (uint8_t *)&v15, 2u);
    }
    goto LABEL_19;
  }
  if ((-[__CFString isEqualToString:](v9, "isEqualToString:", v6) & 1) == 0)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Cache delete request for %@ does not match expected volume %@", (uint8_t *)&v15, 0x16u);
    }
LABEL_19:

    v12 = 0;
    goto LABEL_20;
  }
  v12 = 1;
LABEL_20:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingClient, 0);
  objc_storeStrong((id *)&self->_assetPurger, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

- (id)purgeable:(id)a3 urgency:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D8232A5C]();
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Purgeable CacheDelete callback invoked", buf, 2u);
  }

  -[TRIPaths localTempDir](self->_paths, "localTempDir");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITempDirScopeGuard ifUnreferencedCleanupPath:](TRITempDirScopeGuard, "ifUnreferencedCleanupPath:", v9);

  objc_msgSend(v6, "triObjectForExpectedKey:", CFSTR("CACHE_DELETE_VOLUME"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TRICacheDeleteCallbacks _trialVolumeIsEqualToVolume:](self, "_trialVolumeIsEqualToVolume:", v10))
  {
    objc_msgSend(MEMORY[0x1E0DC0B48], "purgeabilityLevelFromCacheDeleteUrgency:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[TRIAssetPurging purgeableAssetSizeForPurgeabilityLevel:](self->_assetPurger, "purgeableAssetSizeForPurgeabilityLevel:", objc_msgSend(v11, "unsignedIntValue")));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = &unk_1E9363A80;
    }

  }
  else
  {
    v13 = &unk_1E9363A80;
  }
  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v13;
    v21 = 1024;
    v22 = v4;
    _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Trial CacheDelete service found %@ bytes to be purgeable at CacheDeleteUrgency %d", buf, 0x12u);
  }

  if (v10)
  {
    v17[0] = CFSTR("CACHE_DELETE_VOLUME");
    v17[1] = CFSTR("CACHE_DELETE_AMOUNT");
    v18[0] = v10;
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v15;
}

- (TRICacheDeleteCallbacks)initWithPaths:(id)a3 assetPurger:(id)a4 loggingClient:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRICacheDeleteCallbacks *v12;
  TRICacheDeleteCallbacks *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRICacheDeleteCallbacks;
  v12 = -[TRICacheDeleteCallbacks init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_paths, a3);
    objc_storeStrong((id *)&v13->_assetPurger, a4);
    objc_storeStrong((id *)&v13->_loggingClient, a5);
  }

  return v13;
}

- (id)purge:(id)a3 urgency:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v4 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D8232A5C]();
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Purge CacheDelete callback invoked", buf, 2u);
  }

  objc_msgSend(v6, "triObjectForExpectedKey:", CFSTR("CACHE_DELETE_VOLUME"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &stru_1E9336E60;
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  objc_msgSend(v6, "triObjectForExpectedKey:", CFSTR("CACHE_DELETE_AMOUNT"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &unk_1E9363A80;
  if (v13)
    v16 = (void *)v13;
  else
    v16 = &unk_1E9363A80;
  v17 = v16;

  if (-[TRICacheDeleteCallbacks _trialVolumeIsEqualToVolume:](self, "_trialVolumeIsEqualToVolume:", v12))
  {
    objc_msgSend(MEMORY[0x1E0DC0B48], "purgeabilityLevelFromCacheDeleteUrgency:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = objc_msgSend(v18, "unsignedIntValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[TRIAssetPurging purgeAssetsForPurgeabilityLevel:requestedPurgeAmount:](self->_assetPurger, "purgeAssetsForPurgeabilityLevel:requestedPurgeAmount:", v20, (int)objc_msgSend(v17, "intValue")));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "unsignedLongLongValue"))
        -[TRICacheDeleteCallbacks _logPurgedAmountTelemetry:purgedAmountInBytes:](self, "_logPurgedAmountTelemetry:purgedAmountInBytes:", v20, v15);
    }

  }
  TRILogCategory_Server();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v15;
    v28 = 1024;
    v29 = v4;
    _os_log_impl(&dword_1D207F000, v21, OS_LOG_TYPE_DEFAULT, "Trial CacheDelete service purged %@ bytes at CacheDeleteUrgency %d", buf, 0x12u);
  }

  v24[0] = CFSTR("CACHE_DELETE_VOLUME");
  v24[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v25[0] = v12;
  v25[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return v22;
}

- (void)_logPurgedAmountTelemetry:(int)a3 purgedAmountInBytes:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v4 = *(_QWORD *)&a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "ensureAssetPurgeFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssetPurgeFields:", v8);

  v9 = objc_msgSend(MEMORY[0x1E0DC0F88], "assetPurgeFieldsPurgeabilityLevelFromPurgeabilityLevel:", v4);
  objc_msgSend(v7, "assetPurgeFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPurgeabilityLevel:", v9);

  v11 = (void *)MEMORY[0x1E0DC0F08];
  v12 = objc_msgSend(v6, "intValue");

  objc_msgSend(v11, "metricWithName:integerValue:", CFSTR("total_purged_asset_size"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient logger](self->_loggingClient, "logger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient trackingId](self->_loggingClient, "trackingId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v15, v16, 0, v7);

}

- (void)cancel:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEBUG, "Cancel CacheDelete callback invoked", v4, 2u);
  }

}

+ (void)registerCallbacksWithPaths:(id)a3 experimentDatabase:(id)a4 rolloutDatabase:(id)a5 taskQueue:(id)a6 loggingClient:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __113__TRICacheDeleteCallbacks_registerCallbacksWithPaths_experimentDatabase_rolloutDatabase_taskQueue_loggingClient___block_invoke;
  v31[3] = &unk_1E9330FE0;
  v32 = v12;
  v33 = v13;
  v34 = v14;
  v35 = v15;
  v36 = v16;
  v37 = a1;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __113__TRICacheDeleteCallbacks_registerCallbacksWithPaths_experimentDatabase_rolloutDatabase_taskQueue_loggingClient___block_invoke_2;
  v29[3] = &unk_1E9331008;
  v23 = (id)MEMORY[0x1D8232C48](v31);
  v30 = v23;
  v24 = (void *)MEMORY[0x1D8232C48](v29);
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __113__TRICacheDeleteCallbacks_registerCallbacksWithPaths_experimentDatabase_rolloutDatabase_taskQueue_loggingClient___block_invoke_3;
  v27[3] = &unk_1E9331008;
  v28 = v23;
  v25 = v23;
  v26 = (void *)MEMORY[0x1D8232C48](v27);
  CacheDeleteRegisterInfoCallbacks();

}

TRICacheDeleteCallbacks *__113__TRICacheDeleteCallbacks_registerCallbacksWithPaths_experimentDatabase_rolloutDatabase_taskQueue_loggingClient___block_invoke(uint64_t a1)
{
  void *v2;
  TRICacheDeleteCallbacks *v3;

  objc_msgSend(*(id *)(a1 + 72), "_assetPurger:experimentDatabase:rolloutDatabase:taskQueue:loggingClient:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[TRICacheDeleteCallbacks initWithPaths:assetPurger:loggingClient:]([TRICacheDeleteCallbacks alloc], "initWithPaths:assetPurger:loggingClient:", *(_QWORD *)(a1 + 32), v2, *(_QWORD *)(a1 + 64));

  return v3;
}

id __113__TRICacheDeleteCallbacks_registerCallbacksWithPaths_experimentDatabase_rolloutDatabase_taskQueue_loggingClient___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t);
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void (**)(uint64_t))(v4 + 16);
  v6 = a3;
  v5(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purgeable:urgency:", v6, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  return v9;
}

id __113__TRICacheDeleteCallbacks_registerCallbacksWithPaths_experimentDatabase_rolloutDatabase_taskQueue_loggingClient___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t);
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void (**)(uint64_t))(v4 + 16);
  v6 = a3;
  v5(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purge:urgency:", v6, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  return v9;
}

+ (id)_assetPurger:(id)a3 experimentDatabase:(id)a4 rolloutDatabase:(id)a5 taskQueue:(id)a6 loggingClient:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  TRIPurgeableNamespacesProvider *v17;
  void *v18;
  TRIPurgeableOnDemandFactorsEnumerator *v19;
  TRIPurgeableExperimentAndRolloutProvider *v20;
  TRIAssetPurger *v21;
  TRIAssetStore *v23;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v23 = -[TRIAssetStore initWithPaths:]([TRIAssetStore alloc], "initWithPaths:", v15);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC09F0]), "initWithPaths:", v15);
  v17 = -[TRIPurgeableNamespacesProvider initWithPaths:clientNamespaceMetadataStorage:]([TRIPurgeableNamespacesProvider alloc], "initWithPaths:clientNamespaceMetadataStorage:", v15, v16);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B08]), "initWithPaths:", v15);
  v19 = -[TRIPurgeableOnDemandFactorsEnumerator initWithPaths:namespaceResolver:]([TRIPurgeableOnDemandFactorsEnumerator alloc], "initWithPaths:namespaceResolver:", v15, v18);
  v20 = -[TRIPurgeableExperimentAndRolloutProvider initWithPaths:experimentDatabase:rolloutDatabase:]([TRIPurgeableExperimentAndRolloutProvider alloc], "initWithPaths:experimentDatabase:rolloutDatabase:", v15, v14, v13);

  v21 = -[TRIAssetPurger initWithPaths:assetStore:purgeableNamespacesProvider:purgeableFactorPacksEnumerator:purgeableExperimentAndRolloutProvider:taskQueue:loggingClient:]([TRIAssetPurger alloc], "initWithPaths:assetStore:purgeableNamespacesProvider:purgeableFactorPacksEnumerator:purgeableExperimentAndRolloutProvider:taskQueue:loggingClient:", v15, v23, v17, v19, v20, v12, v11);
  return v21;
}

@end
