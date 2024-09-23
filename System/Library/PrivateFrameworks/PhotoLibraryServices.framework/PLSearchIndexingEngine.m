@implementation PLSearchIndexingEngine

- (PLSearchIndexingEngine)initWithLibraryServicesManager:(id)a3
{
  id v4;
  PLSearchIndexingEngineLibraryServicesProvider *v5;
  PLSearchIndexingEngine *v6;

  v4 = a3;
  v5 = -[PLSearchIndexingEngineLibraryServicesProvider initWithLSM:]([PLSearchIndexingEngineLibraryServicesProvider alloc], "initWithLSM:", v4);

  v6 = -[PLSearchIndexingEngine initWithLibraryServicesProvider:](self, "initWithLibraryServicesProvider:", v5);
  return v6;
}

- (PLSearchIndexingEngine)initWithLibraryServicesProvider:(id)a3
{
  id v5;
  PLSearchIndexingEngine *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  objc_class *v13;
  id v14;
  const char *v15;
  qos_class_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  PLSearchIndexConfiguration *v20;
  PLSearchIndexConfiguration *configuration;
  PLSearchIndexingAccessManager *v22;
  OS_dispatch_queue *v23;
  uint64_t v24;
  uint64_t v25;
  PLSearchIndexingAccessManager *accessManager;
  NSMutableArray *v27;
  NSMutableArray *queue_eventHistory;
  dispatch_group_t v29;
  OS_dispatch_group *dropLock_dropGroup;
  NSObject *v31;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PLSearchIndexingEngine;
  v6 = -[PLSearchIndexingEngine init](&v38, sel_init);
  if (v6)
  {
    PLSearchBackendIndexingEngineGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v5;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Initializing search indexing engine for %@", buf, 0xCu);
    }

    objc_msgSend(v5, "pathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchIndexDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v11 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v37);
    v12 = v37;

    if ((v11 & 1) != 0)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (const char *)objc_msgSend(v14, "UTF8String");
      v16 = qos_class_self();
      dispatch_queue_attr_make_with_qos_class(0, v16, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = dispatch_queue_create(v15, v17);
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v18;

      objc_storeStrong((id *)&v6->_libraryServicesProvider, a3);
      v20 = -[PLSearchIndexConfiguration initWithPathManager:]([PLSearchIndexConfiguration alloc], "initWithPathManager:", v8);
      configuration = v6->_configuration;
      v6->_configuration = v20;

      objc_initWeak((id *)buf, v6);
      v22 = [PLSearchIndexingAccessManager alloc];
      v23 = v6->_queue;
      v24 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __58__PLSearchIndexingEngine_initWithLibraryServicesProvider___block_invoke;
      v35[3] = &unk_1E3677D48;
      objc_copyWeak(&v36, (id *)buf);
      v33[0] = v24;
      v33[1] = 3221225472;
      v33[2] = __58__PLSearchIndexingEngine_initWithLibraryServicesProvider___block_invoke_2;
      v33[3] = &unk_1E3677D48;
      objc_copyWeak(&v34, (id *)buf);
      v25 = -[PLSearchIndexingAccessManager initWithQueue:openBlock:closeBlock:deferCloseSeconds:](v22, "initWithQueue:openBlock:closeBlock:deferCloseSeconds:", v23, v35, v33, 5);
      accessManager = v6->_accessManager;
      v6->_accessManager = (PLSearchIndexingAccessManager *)v25;

      v6->_queue_spotlightSandboxExtensionHandle = -1;
      v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      queue_eventHistory = v6->_queue_eventHistory;
      v6->_queue_eventHistory = v27;

      v6->_dropLock._os_unfair_lock_opaque = 0;
      v29 = dispatch_group_create();
      dropLock_dropGroup = v6->_dropLock_dropGroup;
      v6->_dropLock_dropGroup = (OS_dispatch_group *)v29;

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      PLSearchBackendIndexingEngineGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v12;
        _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_FAULT, "Failed to create Photos search index directory. Error: %@", buf, 0xCu);
      }

      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)supportsPSI
{
  int64_t v2;

  v2 = -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier");
  if (v2)
    return v2 == 1;
  +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:", 0);
  return 1;
}

- (BOOL)supportsSpotlightDonate
{
  int64_t v2;

  v2 = -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier");
  if (!v2)
    return +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:", 0);
  if (v2 == 3)
    return 1;
  return v2 == 1;
}

- (BOOL)supportsSpotlightDelete
{
  int64_t v2;

  v2 = -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier");
  if (v2)
    return v2 == 1;
  else
    return +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:", 0);
}

- (BOOL)supportsSpotlightClientState
{
  int64_t v2;

  v2 = -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier");
  if (v2)
    return v2 == 1;
  else
    return +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:", 0);
}

- (void)openWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PLSearchIndexingEngine_openWithCompletion___block_invoke;
  v6[3] = &unk_1E3675C58;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PLSearchIndexingEngine _safePerformBlock:](self, "_safePerformBlock:", v6);

}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PLSearchIndexingEngine_close__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)indexAssetsWithUUIDs:(id)a3 partialUpdateMask:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PLSearchIndexingEngine *v13;
  id v14;

  v7 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__PLSearchIndexingEngine_indexAssetsWithUUIDs_partialUpdateMask_completion___block_invoke;
  v11[3] = &unk_1E3676290;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  -[PLSearchIndexingEngine _safePerformBlock:](self, "_safePerformBlock:", v11);

}

- (void)indexAssetsIfNeededWithObjectIDs:(id)a3 library:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PLSearchIndexingEngine *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke;
  v14[3] = &unk_1E3671878;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[PLSearchIndexingEngine _safePerformBlock:](self, "_safePerformBlock:", v14);

}

- (void)disableUISearch
{
  void *v3;
  _QWORD v4[5];

  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__PLSearchIndexingEngine_disableUISearch__block_invoke;
  v4[3] = &unk_1E3677AA0;
  v4[4] = self;
  objc_msgSend(v3, "sync:identifyingBlock:library:", v4, 0, 0);

}

- (void)dropSearchIndexWithSourceName:(id)a3 completion:(id)a4
{
  -[PLSearchIndexingEngine _dropSearchIndexWithSourceName:reasons:completion:](self, "_dropSearchIndexWithSourceName:reasons:completion:", a3, 512, a4);
}

- (void)_dropSearchIndexWithSourceName:(id)a3 reasons:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL (*v21)(uint64_t);
  void *v22;
  PLSearchIndexingEngine *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  PLSearchIndexingEngineLibraryServicesProvider *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke;
  v22 = &unk_1E366AF60;
  v23 = self;
  v11 = v8;
  v24 = v11;
  v12 = v9;
  v25 = v12;
  if ((PLBoolResultWithUnfairLock() & 1) == 0)
  {
    PLSearchBackendIndexingEngineGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      libraryServicesProvider = self->_libraryServicesProvider;
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      v28 = 2112;
      v29 = libraryServicesProvider;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Request to drop search index for source %{public}@, library: %@", buf, 0x16u);
    }

    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke_131;
    v15[3] = &unk_1E3674E68;
    v15[4] = self;
    v16 = v11;
    v18 = a4;
    v17 = v12;
    -[PLSearchIndexingEngine _safePerformBlock:](self, "_safePerformBlock:", v15);

  }
}

- (BOOL)hasRebuildWorkToDoForLibrary:(id)a3
{
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  libraryServicesProvider = self->_libraryServicesProvider;
  v5 = a3;
  v6 = -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](libraryServicesProvider, "libraryIdentifier");
  -[PLSearchIndexConfiguration sceneTaxonomyProvider](self->_configuration, "sceneTaxonomyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "digests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PLSearchIndexingRebuildEngine hasRebuildWorkToDoForLibrary:identifier:sceneTaxonomyDigests:](PLSearchIndexingRebuildEngine, "hasRebuildWorkToDoForLibrary:identifier:sceneTaxonomyDigests:", v5, v6, v8);

  return v9;
}

- (void)resumeSearchIndexRebuildIfNeededForLibrary:(id)a3 calledBy:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  PLSearchIndexingEngineLibraryServicesProvider *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLSearchBackendIndexingEngineGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)buf = 138412290;
    v21 = libraryServicesProvider;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Search indexing resuming if needed for library: %@", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__PLSearchIndexingEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke;
  v16[3] = &unk_1E3671878;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  -[PLSearchIndexingEngine _safePerformBlock:](self, "_safePerformBlock:", v16);

}

- (void)pauseSearchIndexRebuildWithSourceName:(id)a3
{
  id v4;
  NSObject *v5;
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  PLSearchIndexingEngineLibraryServicesProvider *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLSearchBackendIndexingEngineGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)buf = 138412290;
    v11 = libraryServicesProvider;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Pausing search indexing for library: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PLSearchIndexingEngine_pauseSearchIndexRebuildWithSourceName___block_invoke;
  v8[3] = &unk_1E3677C18;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[PLSearchIndexingEngine _safePerformBlock:](self, "_safePerformBlock:", v8);

}

- (void)resetSearchIndexWithReason:(int64_t)a3 library:(id)a4 dropCompletion:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  PLSearchBackendIndexRebuildGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 0xA)
      v14 = CFSTR("PLSearchIndexRebuildReasonNone");
    else
      v14 = off_1E366B230[a3 - 1];
    *(_DWORD *)buf = 138543618;
    v24 = v14;
    v25 = 2050;
    v26 = a3;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Received request to drop and rebuild search index with reason: %{public}@ (%{public}ld)", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLSearchIndexingEngine resetSearchIndexWithReason:library:dropCompletion:completion:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__PLSearchIndexingEngine_resetSearchIndexWithReason_library_dropCompletion_completion___block_invoke;
  v19[3] = &unk_1E366AFD8;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v16 = v12;
  v17 = v10;
  v18 = v11;
  -[PLSearchIndexingEngine dropSearchIndexWithSourceName:completion:](self, "dropSearchIndexWithSourceName:completion:", v15, v19);

}

- (void)fetchRemainingWorkWithLibrary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PLSearchBackendIndexingEngineGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Fetching remaining search indexing work", buf, 2u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke;
  v11[3] = &unk_1E3676290;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[PLSearchIndexingEngine _safePerformBlock:](self, "_safePerformBlock:", v11);

}

- (id)processBatchOfJobsWithType:(signed __int16)a3 flags:(int64_t)a4 library:(id)a5 completion:(id)a6
{
  unsigned int v8;
  id v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  int64_t v28;
  __int16 v29;
  uint8_t buf[4];
  __CFString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  PLSearchIndexingEngineLibraryServicesProvider *v35;
  uint64_t v36;

  v8 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  PLSearchBackendIndexingEngineGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v8 > 5)
      v13 = CFSTR("unknown");
    else
      v13 = off_1E366CB00[(unsigned __int16)v8];
    v14 = v13;
    PLBackgroundJobWorkerSearchJobFlagsDescription(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)buf = 138543874;
    v31 = v14;
    v32 = 2114;
    v33 = v15;
    v34 = 2112;
    v35 = libraryServicesProvider;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Processing batch of jobs of type: %{public}@, flags: %{public}@, for library: %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __78__PLSearchIndexingEngine_processBatchOfJobsWithType_flags_library_completion___block_invoke;
  v24[3] = &unk_1E366B050;
  v29 = v8;
  v28 = a4;
  v24[4] = self;
  v25 = v10;
  v18 = v17;
  v26 = v18;
  v27 = v11;
  v19 = v11;
  v20 = v10;
  -[PLSearchIndexingEngine _safePerformBlock:](self, "_safePerformBlock:", v24);
  v21 = v27;
  v22 = v18;

  return v22;
}

- (void)resumeProcessingIncrementalUpdatesInLibrary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  PLSearchIndexingEngineLibraryServicesProvider *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLSearchBackendIndexingEngineGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)buf = 138412290;
    v16 = libraryServicesProvider;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Resuming incremental updates for library: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__PLSearchIndexingEngine_resumeProcessingIncrementalUpdatesInLibrary_completion___block_invoke;
  v12[3] = &unk_1E3676290;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[PLSearchIndexingEngine _safePerformBlock:](self, "_safePerformBlock:", v12);

}

- (void)pauseProcessingIncrementalUpdates
{
  NSObject *v3;
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  _QWORD v5[5];
  uint8_t buf[4];
  PLSearchIndexingEngineLibraryServicesProvider *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)buf = 138412290;
    v7 = libraryServicesProvider;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Pausing incremental updates for library: %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PLSearchIndexingEngine_pauseProcessingIncrementalUpdates__block_invoke;
  v5[3] = &unk_1E3677AA0;
  v5[4] = self;
  -[PLSearchIndexingEngine _safePerformBlock:](self, "_safePerformBlock:", v5);
}

- (void)_safePerformBlock:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLSafeRunWithUnfairLock();

}

- (void)_inLibraryPerform_donateAssets:(id)a3 library:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v18, "isEligibleForSearchIndexing"))
        {
          objc_msgSend(v11, "addObject:", v18);
        }
        else
        {
          objc_msgSend(v18, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  -[PLSearchIndexingAccessManager addUser](self->_accessManager, "addUser");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76__PLSearchIndexingEngine__inLibraryPerform_donateAssets_library_completion___block_invoke;
  v21[3] = &unk_1E366B078;
  v21[4] = self;
  v22 = v10;
  v20 = v10;
  -[PLSearchIndexingEngine _inLibraryPerform_donateManagedObjects:partialUpdateMasks:entity:deleteIdentifiers:identifiersRequiringAdditionalWorkByEntity:library:progress:completion:](self, "_inLibraryPerform_donateManagedObjects:partialUpdateMasks:entity:deleteIdentifiers:identifiersRequiringAdditionalWorkByEntity:library:progress:completion:", v11, 0, 1, v12, 0, v9, 0, v21);

}

- (void)_inq_handleClientStateValidationError:(id)a3 library:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  PLTimedDispatchGroup *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  uint8_t buf[4];
  PLSearchIndexingEngineLibraryServicesProvider *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(a3, "code");
  if (v7 == 2)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke_2;
    v16[3] = &unk_1E3677AA0;
    v17 = v6;
    objc_msgSend(v17, "performTransactionAndWait:", v16);

  }
  else if (v7 == 1)
  {
    PLSearchBackendIndexingEngineGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      libraryServicesProvider = self->_libraryServicesProvider;
      *(_DWORD *)buf = 138412290;
      v22 = libraryServicesProvider;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_FAULT, "Spotlight client state missing for library: %@, starting auto bug capture", buf, 0xCu);
    }

    v10 = -[PLTimedDispatchGroup initWithQueue:name:]([PLTimedDispatchGroup alloc], "initWithQueue:name:", self->_queue, CFSTR("countSpotlightAssetsQuery"));
    +[PLSpotlightQueryUtilities countAssetsQueryStringForLibraryIdentifier:](PLSpotlightQueryUtilities, "countAssetsQueryStringForLibraryIdentifier:", -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier");
    -[PLSearchIndexingEngineLibraryServicesProvider pathManager](self->_libraryServicesProvider, "pathManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightQueryUtilities searchQueryForLibraryIdentifier:pathManager:queryString:](PLSpotlightQueryUtilities, "searchQueryForLibraryIdentifier:pathManager:queryString:", v12, v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke;
    v20[3] = &unk_1E366B0A0;
    v20[4] = self;
    +[PLSpotlightQueryUtilities countForSearchQuery:timedDispatchGroup:completion:](PLSpotlightQueryUtilities, "countForSearchQuery:timedDispatchGroup:completion:", v14, v10, v20);
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke_150;
    v18[3] = &unk_1E3677AA0;
    v19 = v6;
    objc_msgSend(v19, "performTransactionAndWait:", v18);

  }
}

- (BOOL)_inq_acquireSpotlightSandboxExtensionIfNeeded
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  NSObject *v15;
  int v16;
  int v17;
  int v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_queue_spotlightSandboxExtensionHandle == -1)
  {
    -[PLSearchIndexingEngineLibraryServicesProvider pathManager](self->_libraryServicesProvider, "pathManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "libraryURL");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "fileSystemRepresentation");

    v6 = sandbox_extension_issue_file_to_self();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = sandbox_extension_consume();
      self->_queue_spotlightSandboxExtensionHandle = v8;
      PLSearchBackendIndexingEngineGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 == -1)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v17 = *__error();
          v19 = 67109378;
          v20 = v17;
          v21 = 2080;
          v22 = v5;
          v11 = "Failed to consume sandbox extension token, errno: %{darwin.errno}d, path: %s";
          v12 = v10;
          v13 = OS_LOG_TYPE_ERROR;
          v14 = 18;
          goto LABEL_11;
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v19) = 0;
        v11 = "Acquired sandbox extension";
        v12 = v10;
        v13 = OS_LOG_TYPE_DEBUG;
        v14 = 2;
LABEL_11:
        _os_log_impl(&dword_199541000, v12, v13, v11, (uint8_t *)&v19, v14);
      }

      free(v7);
      return self->_queue_spotlightSandboxExtensionHandle != -1;
    }
    PLSearchBackendIndexingEngineGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *__error();
      v19 = 67109378;
      v20 = v16;
      v21 = 2080;
      v22 = v5;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension token, errno: %{darwin.errno}d, path: %s", (uint8_t *)&v19, 0x12u);
    }

  }
  return self->_queue_spotlightSandboxExtensionHandle != -1;
}

- (void)_inq_releaseSpotlightSandboxExtension
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_queue_spotlightSandboxExtensionHandle != -1)
  {
    sandbox_extension_release();
    self->_queue_spotlightSandboxExtensionHandle = -1;
    PLSearchBackendIndexingEngineGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Released sandbox extension", v4, 2u);
    }

  }
}

- (void)_inq_open
{
  NSObject *v3;
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  void *v5;
  void *queue_spotlightIndex;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  CSManagedSearchableIndex *queue_managedSpotlightIndex;
  NSObject *v16;
  id v17;
  CSSearchableIndex *v18;
  PLSearchIndexingEngineLibraryServicesProvider *v19;
  NSObject *v20;
  PSIDatabase *v21;
  void *v22;
  PSIDatabase *v23;
  PSIDatabase *queue_psiDatabase;
  PLSearchIndexingRebuildEngine *v25;
  PLSearchIndexingRebuildEngine *queue_rebuildEngine;
  PLSearchIndexingIncrementalUpdateEngine *v27;
  PLSearchIndexingIncrementalUpdateEngine *queue_updateEngine;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  BOOL v38;
  id v39;
  _BYTE buf[12];
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = libraryServicesProvider;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Opening search index for library: %@", buf, 0xCu);
  }

  if (-[PLSearchIndexingEngine supportsSpotlightDonate](self, "supportsSpotlightDonate"))
  {
    if (+[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:", -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier")))
    {
      -[PLSearchIndexingEngineLibraryServicesProvider pathManager](self->_libraryServicesProvider, "pathManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "spotlightSearchIndexPath");
      queue_spotlightIndex = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", queue_spotlightIndex, 1, 0, &v39);
      v9 = v39;

      if (v8)
      {
        -[PLSearchIndexingEngine _inq_acquireSpotlightSandboxExtensionIfNeeded](self, "_inq_acquireSpotlightSandboxExtensionIfNeeded");
        PLSearchBackendIndexingEngineGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = queue_spotlightIndex;
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Creating managed spotlight index at path: %@", buf, 0xCu);
        }

        v11 = objc_alloc(MEMORY[0x1E0CA6AF8]);
        -[PLSearchIndexingEngine _spotlightIndexName](self, "_spotlightIndexName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithName:protectionClass:path:", v12, 0, queue_spotlightIndex);

        v14 = -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier") == 1;
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __35__PLSearchIndexingEngine__inq_open__block_invoke;
        v36[3] = &unk_1E366B0C8;
        v38 = v14;
        v37 = queue_spotlightIndex;
        objc_msgSend(v13, "setUISearchEnabled:completionHandler:", v14, v36);
        objc_storeStrong((id *)&self->_queue_spotlightIndex, v13);
        queue_managedSpotlightIndex = self->_queue_managedSpotlightIndex;
        self->_queue_managedSpotlightIndex = (CSManagedSearchableIndex *)v13;
        v16 = v13;

      }
      else
      {
        PLSearchBackendIndexingEngineGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v19 = self->_libraryServicesProvider;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v19;
          v41 = 2112;
          v42 = v9;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to create Spotlight index directory for %@, error: %@", buf, 0x16u);
        }
      }

      if (!self->_queue_spotlightIndex)
      {
        PLSearchBackendIndexingEngineGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_FAULT, "Unable to create managed spotlight index", buf, 2u);
        }

      }
    }
    else
    {
      v17 = objc_alloc(MEMORY[0x1E0CA6B38]);
      -[PLSearchIndexingEngine _spotlightIndexName](self, "_spotlightIndexName");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (CSSearchableIndex *)objc_msgSend(v17, "initWithName:", v9);
      queue_spotlightIndex = self->_queue_spotlightIndex;
      self->_queue_spotlightIndex = v18;
    }

  }
  if (-[PLSearchIndexingEngine supportsPSI](self, "supportsPSI"))
  {
    v21 = [PSIDatabase alloc];
    -[PLSearchIndexingEngineLibraryServicesProvider pathManager](self->_libraryServicesProvider, "pathManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PSIDatabase initWithPathManager:options:](v21, "initWithPathManager:options:", v22, 2);
    queue_psiDatabase = self->_queue_psiDatabase;
    self->_queue_psiDatabase = v23;

  }
  v25 = -[PLSearchIndexingRebuildEngine initWithDelegate:provider:]([PLSearchIndexingRebuildEngine alloc], "initWithDelegate:provider:", self, self->_libraryServicesProvider);
  queue_rebuildEngine = self->_queue_rebuildEngine;
  self->_queue_rebuildEngine = v25;

  v27 = -[PLSearchIndexingIncrementalUpdateEngine initWithDelegate:]([PLSearchIndexingIncrementalUpdateEngine alloc], "initWithDelegate:", self);
  queue_updateEngine = self->_queue_updateEngine;
  self->_queue_updateEngine = v27;

  self->_queue_closed = 0;
  -[PLSearchIndexingEngineLibraryServicesProvider libraryWithName:](self->_libraryServicesProvider, "libraryWithName:", "-[PLSearchIndexingEngine _inq_open]");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLSearchIndexingEngine supportsSpotlightClientState](self, "supportsSpotlightClientState"))
  {
    objc_msgSend(v29, "globalValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "searchIndexSpotlightClientState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __35__PLSearchIndexingEngine__inq_open__block_invoke_160;
      v34[3] = &unk_1E366B0F0;
      v34[4] = self;
      v35 = v29;
      -[PLSearchIndexingEngine _inq_validateSpotlightClientStateAgainstExpectedClientState:completion:](self, "_inq_validateSpotlightClientStateAgainstExpectedClientState:completion:", v31, v34);

    }
  }
  *(_QWORD *)buf = 0;
  if (+[PLSearchIndexingRebuildEngine requiresImmediateDropIndexForLibrary:reasons:](PLSearchIndexingRebuildEngine, "requiresImmediateDropIndexForLibrary:reasons:", v29, buf))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLSearchIndexingEngine _inq_open]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __35__PLSearchIndexingEngine__inq_open__block_invoke_3;
    v33[3] = &unk_1E366B0A0;
    v33[4] = self;
    -[PLSearchIndexingEngine _inq_dropSearchIndexWithSourceName:reasons:completion:](self, "_inq_dropSearchIndexWithSourceName:reasons:completion:", v32, *(_QWORD *)buf, v33);

  }
}

- (void)_inq_close
{
  NSObject *v3;
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  NSObject *v5;
  PLSearchIndexingEngineLibraryServicesProvider *v6;
  NSMutableArray *queue_eventHistory;
  CSSearchableIndex *queue_spotlightIndex;
  CSManagedSearchableIndex *queue_managedSpotlightIndex;
  PSIDatabase *queue_psiDatabase;
  PLSearchIndexingRebuildEngine *queue_rebuildEngine;
  PLSearchIndexingIncrementalUpdateEngine *queue_updateEngine;
  int v13;
  PLSearchIndexingEngineLibraryServicesProvider *v14;
  __int16 v15;
  NSMutableArray *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    v13 = 138412290;
    v14 = libraryServicesProvider;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Closing search index for library: %@", (uint8_t *)&v13, 0xCu);
  }

  PLSearchBackendIndexingEngineGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = self->_libraryServicesProvider;
    queue_eventHistory = self->_queue_eventHistory;
    v13 = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = queue_eventHistory;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Most recent search indexing events for library (%@) %@", (uint8_t *)&v13, 0x16u);
  }

  self->_queue_closed = 1;
  queue_spotlightIndex = self->_queue_spotlightIndex;
  self->_queue_spotlightIndex = 0;

  queue_managedSpotlightIndex = self->_queue_managedSpotlightIndex;
  self->_queue_managedSpotlightIndex = 0;

  queue_psiDatabase = self->_queue_psiDatabase;
  self->_queue_psiDatabase = 0;

  queue_rebuildEngine = self->_queue_rebuildEngine;
  self->_queue_rebuildEngine = 0;

  queue_updateEngine = self->_queue_updateEngine;
  self->_queue_updateEngine = 0;

  -[PLSearchIndexingEngine _inq_releaseSpotlightSandboxExtension](self, "_inq_releaseSpotlightSandboxExtension");
}

- (id)_clientStateResultAndLogWithCode:(unint64_t)a3 debugDescription:(id)a4 underlyingError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  PLSearchIndexingEngineLibraryServicesProvider *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  PLSearchBackendIndexingEngineGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    v17 = 138543874;
    v18 = v8;
    v19 = 2112;
    v20 = libraryServicesProvider;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "%{public}@ for library: %@, error: %@", (uint8_t *)&v17, 0x20u);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2938]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB3388]);
  v13 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PLSearchIndexSpotlightClientStateErrorDomain"), a3, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "failureWithError:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_inq_validateSpotlightClientStateAgainstExpectedClientState:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  CSSearchableIndex *queue_spotlightIndex;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  PLSearchIndexingEngine *v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchIndexingEngine.m"), 744, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expectedClientState != nil"));

  }
  queue_spotlightIndex = self->_queue_spotlightIndex;
  +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSearchIndexingEngine _spotlightIndexName](self, "_spotlightIndexName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__PLSearchIndexingEngine__inq_validateSpotlightClientStateAgainstExpectedClientState_completion___block_invoke;
  v15[3] = &unk_1E366B118;
  v16 = v7;
  v17 = self;
  v18 = v8;
  v12 = v8;
  v13 = v7;
  -[CSSearchableIndex fetchLastClientStateWithProtectionClass:forBundleID:clientStateName:options:completionHandler:](queue_spotlightIndex, "fetchLastClientStateWithProtectionClass:forBundleID:clientStateName:options:completionHandler:", 0, v10, v11, 32, v15);

}

- (void)_inq_donatePSIObjectsByType:(id)a3 spotlightItemsByBundleID:(id)a4 deleteIdentifiers:(id)a5 spotlightClientState:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  _BOOL4 v16;
  _BOOL4 v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void **v26;
  uint64_t *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PLTimedDispatchGroup *v34;
  void *v35;
  void *v36;
  id v37;
  PLTimedDispatchGroup *v38;
  PSIDatabase *queue_psiDatabase;
  id v40;
  PSIDatabase *v41;
  void *v42;
  void *v43;
  PSIDatabase *v44;
  id v45;
  PSIDatabase *v46;
  void *v47;
  void *v48;
  id v49;
  PLTimedDispatchGroup *v50;
  PSIDatabase *v51;
  id v52;
  PSIDatabase *v53;
  void *v54;
  PLTimedDispatchGroup *v55;
  PSIDatabase *v56;
  id v57;
  id v58;
  void *v59;
  PSIDatabase *v60;
  id v61;
  PSIDatabase *v62;
  id v63;
  PLTimedDispatchGroup *v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  CSSearchableIndex *queue_spotlightIndex;
  void *v70;
  id v71;
  PLTimedDispatchGroup *v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  _QWORD v79[5];
  id v80;
  PLTimedDispatchGroup *v81;
  void (**v82)(id, void *);
  _QWORD v83[4];
  id v84;
  id v85;
  _QWORD v86[4];
  PLTimedDispatchGroup *v87;
  id v88;
  id v89;
  PLSearchIndexingEngine *v90;
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  _QWORD v98[4];
  id v99;
  id v100;
  _QWORD v101[4];
  id v102;
  id v103;
  _QWORD v104[4];
  id v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t);
  void *v110;
  PLSearchIndexingEngine *v111;
  uint8_t buf[4];
  uint64_t v113;
  __int16 v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  _QWORD v119[4];

  v119[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v78 = a6;
  v15 = (void (**)(id, void *))a7;
  if (-[PLSearchIndexingEngine supportsPSI](self, "supportsPSI"))
    v16 = self->_queue_psiDatabase == 0;
  else
    v16 = 0;
  if (-[PLSearchIndexingEngine supportsSpotlightDonate](self, "supportsSpotlightDonate"))
    v17 = self->_queue_spotlightIndex == 0;
  else
    v17 = 0;
  if (v16 || v17)
  {
    v18 = CFSTR(", PSI index missing");
    if (!v16)
      v18 = &stru_1E36789C0;
    if (v17)
      v19 = CFSTR(", Spotlight index missing");
    else
      v19 = &stru_1E36789C0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Search index unavailable, may have been closed%@%@"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PLSearchBackendIndexingEngineGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v113 = (uint64_t)v20;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    v22 = (void *)MEMORY[0x1E0D732B8];
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D74498];
    v118 = *MEMORY[0x1E0CB2938];
    v119[0] = v20;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = (void **)v119;
    v27 = &v118;
LABEL_20:
    objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 46502, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "failureWithError:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v32);

    goto LABEL_40;
  }
  v28 = MEMORY[0x1E0C809B0];
  v107 = MEMORY[0x1E0C809B0];
  v108 = 3221225472;
  v109 = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke;
  v110 = &unk_1E3670EA0;
  v111 = self;
  if (PLBoolResultWithUnfairLock())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Search index unavailable, drop in progress"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PLSearchBackendIndexingEngineGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v113 = (uint64_t)v20;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    v22 = (void *)MEMORY[0x1E0D732B8];
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D74498];
    v116 = *MEMORY[0x1E0CB2938];
    v117 = v20;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = &v117;
    v27 = &v116;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PLTimedDispatchGroup initWithQueue:name:]([PLTimedDispatchGroup alloc], "initWithQueue:name:", self->_queue, CFSTR("donate"));
  v77 = v33;
  if (-[PLSearchIndexingEngine supportsPSI](self, "supportsPSI"))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E375F048);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v35;
    if (objc_msgSend(v35, "count"))
    {
      -[PLTimedDispatchGroup enterWithName:](v34, "enterWithName:", CFSTR("psi assets"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v13;
      v38 = v34;
      queue_psiDatabase = self->_queue_psiDatabase;
      v104[0] = v28;
      v104[1] = 3221225472;
      v104[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_201;
      v104[3] = &unk_1E3677C18;
      v105 = v33;
      v106 = v36;
      v40 = v36;
      v41 = queue_psiDatabase;
      v34 = v38;
      v13 = v37;
      v35 = v75;
      -[PSIDatabase addAssets:deferRemovingUnusedGroups:withCompletion:](v41, "addAssets:deferRemovingUnusedGroups:withCompletion:", v75, 1, v104);

    }
    objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E375F060);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v42;
    if (objc_msgSend(v42, "count"))
    {
      -[PLTimedDispatchGroup enterWithName:](v34, "enterWithName:", CFSTR("psi collections"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = self->_queue_psiDatabase;
      v101[0] = MEMORY[0x1E0C809B0];
      v101[1] = 3221225472;
      v101[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_205;
      v101[3] = &unk_1E3677C18;
      v102 = v33;
      v103 = v43;
      v45 = v43;
      v46 = v44;
      v42 = v74;
      -[PSIDatabase addCollections:deferRemovingUnusedGroups:withCompletion:](v46, "addCollections:deferRemovingUnusedGroups:withCompletion:", v74, 1, v101);

    }
    objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E375F078);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v47, "count"))
    {
      -[PLTimedDispatchGroup enterWithName:](v34, "enterWithName:", CFSTR("psi groups"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v13;
      v50 = v34;
      v51 = self->_queue_psiDatabase;
      v98[0] = MEMORY[0x1E0C809B0];
      v98[1] = 3221225472;
      v98[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_209;
      v98[3] = &unk_1E3677C18;
      v99 = v33;
      v100 = v48;
      v52 = v48;
      v53 = v51;
      v34 = v50;
      v13 = v49;
      v35 = v75;
      -[PSIDatabase updateRankingScoreForGroups:withCompletion:](v53, "updateRankingScoreForGroups:withCompletion:", v47, v98);

      v42 = v74;
    }
    if (objc_msgSend(v14, "count"))
    {
      -[PLTimedDispatchGroup enterWithName:](v34, "enterWithName:", CFSTR("psi delete assets"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v34;
      v56 = self->_queue_psiDatabase;
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_212;
      v95[3] = &unk_1E3677C18;
      v57 = v33;
      v96 = v57;
      v97 = v54;
      v58 = v54;
      -[PSIDatabase removeAssetsWithUUIDs:deferRemovingUnusedGroups:completion:](v56, "removeAssetsWithUUIDs:deferRemovingUnusedGroups:completion:", v14, 1, v95);

      -[PLTimedDispatchGroup enterWithName:](v55, "enterWithName:", CFSTR("psi delete collections"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = self->_queue_psiDatabase;
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_215;
      v92[3] = &unk_1E3677C18;
      v93 = v57;
      v94 = v59;
      v61 = v59;
      v62 = v60;
      v34 = v55;
      v42 = v74;
      v35 = v75;
      -[PSIDatabase removeCollectionsWithUUIDs:deferRemovingUnusedGroups:completion:](v62, "removeCollectionsWithUUIDs:deferRemovingUnusedGroups:completion:", v14, 1, v92);

      v33 = v77;
    }

    v28 = MEMORY[0x1E0C809B0];
  }
  v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PLSearchIndexingEngine supportsSpotlightDonate](self, "supportsSpotlightDonate") && objc_msgSend(v13, "count"))
  {
    v86[0] = v28;
    v86[1] = 3221225472;
    v86[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_216;
    v86[3] = &unk_1E366B168;
    v87 = v34;
    v88 = v63;
    v89 = v78;
    v90 = self;
    v91 = v33;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v86);

  }
  if (-[PLSearchIndexingEngine supportsSpotlightDelete](self, "supportsSpotlightDelete") && objc_msgSend(v14, "count"))
  {
    v76 = v13;
    v64 = v34;
    PLSearchBackendIndexingEngineGetLog();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = objc_msgSend(v14, "count");
      +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v113 = v66;
      v114 = 2114;
      v115 = v67;
      _os_log_impl(&dword_199541000, v65, OS_LOG_TYPE_DEFAULT, "Deleting %tu items from Spotlight for bundleID: %{public}@", buf, 0x16u);

    }
    -[PLTimedDispatchGroup enterWithTimeout:name:](v64, "enterWithTimeout:name:", CFSTR("spotlight delete"), 60.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addObject:", v68);
    queue_spotlightIndex = self->_queue_spotlightIndex;
    +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_223;
    v83[3] = &unk_1E366B140;
    v84 = v77;
    v85 = v68;
    v71 = v68;
    -[CSSearchableIndex indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:completionHandler:](queue_spotlightIndex, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:completionHandler:", 0, v14, 0, 0, 0, v70, 32, v83);

    v34 = v64;
    v13 = v76;
  }
  v79[0] = v28;
  v79[1] = 3221225472;
  v79[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_224;
  v79[3] = &unk_1E3671878;
  v79[4] = self;
  v80 = v63;
  v81 = v34;
  v82 = v15;
  v72 = v34;
  v73 = v63;
  -[PLTimedDispatchGroup notify:](v72, "notify:", v79);

LABEL_40:
}

- (void)_inq_dropSearchIndexWithSourceName:(id)a3 reasons:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  void *v14;
  PLTimedDispatchGroup *v15;
  void *v16;
  void *v17;
  void *v18;
  CSSearchableIndex *queue_spotlightIndex;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  PSIDatabase *queue_psiDatabase;
  id v34;
  id v35;
  id v36;
  PLTimedDispatchGroup *v37;
  id v38;
  _QWORD v39[5];
  PLTimedDispatchGroup *v40;
  id v41;
  id v42;
  unint64_t v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  void *v53;
  PLSearchIndexingEngine *v54;
  const __CFString *v55;
  const __CFString *v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  PLSearchIndexingEngineLibraryServicesProvider *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v50 = MEMORY[0x1E0C809B0];
  v51 = 3221225472;
  v52 = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke;
  v53 = &unk_1E3677AA0;
  v54 = self;
  PLSafeRunWithUnfairLock();
  PLSearchBackendIndexingEngineGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(a4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    libraryServicesProvider = self->_libraryServicesProvider;
    -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](libraryServicesProvider, "libraryIdentifier");
    PLStringFromWellKnownPhotoLibraryIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v58 = v8;
    v59 = 2114;
    v60 = v12;
    v61 = 2112;
    v62 = libraryServicesProvider;
    v63 = 2112;
    v64 = v14;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Dropping search index, source: %{public}@, reasons: %{public}@, for library %@, library identifier: %@", buf, 0x2Au);

  }
  v15 = -[PLTimedDispatchGroup initWithQueue:name:]([PLTimedDispatchGroup alloc], "initWithQueue:name:", self->_queue, CFSTR("drop index"));
  -[PLSearchIndexingEngineLibraryServicesProvider libraryWithName:](self->_libraryServicesProvider, "libraryWithName:", "-[PLSearchIndexingEngine _inq_dropSearchIndexWithSourceName:reasons:completion:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLSearchIndexingEngine supportsSpotlightDelete](self, "supportsSpotlightDelete"))
  {
    v38 = v8;
    +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLTimedDispatchGroup enterWithTimeout:name:](v15, "enterWithTimeout:name:", CFSTR("drop spotlight"), 60.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    queue_spotlightIndex = self->_queue_spotlightIndex;
    v56 = CFSTR("com.apple.mobileslideshow.search");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v10;
    v22 = (void *)v20;
    v48[0] = v21;
    v48[1] = 3221225472;
    v48[2] = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_229;
    v48[3] = &unk_1E3674D50;
    v23 = v18;
    v49 = v23;
    -[CSSearchableIndex deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:completionHandler:](queue_spotlightIndex, "deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:completionHandler:", v22, 0, v17, 32, v48);

    objc_msgSend(v16, "globalValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = objc_msgSend(v24, "shouldDropGlobalSpotlightIndexForLibraryIdentifier:", -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier"));

    if ((_DWORD)v22)
    {
      PLSearchBackendIndexingEngineGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Dropping global Spotlight index", buf, 2u);
      }

      v26 = objc_alloc(MEMORY[0x1E0CA6B38]);
      -[PLSearchIndexingEngine _spotlightIndexName](self, "_spotlightIndexName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithName:options:", v27, 32);

      -[PLTimedDispatchGroup enterWithTimeout:name:](v15, "enterWithTimeout:name:", CFSTR("drop spotlight global"), 60.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = CFSTR("com.apple.mobileslideshow.search");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_232;
      v46[3] = &unk_1E3674D50;
      v47 = v29;
      v31 = v29;
      objc_msgSend(v28, "deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:completionHandler:", v30, 0, v17, 32, v46);

    }
    v8 = v38;
    v10 = MEMORY[0x1E0C809B0];
  }
  if (-[PLSearchIndexingEngine supportsPSI](self, "supportsPSI"))
  {
    -[PLTimedDispatchGroup enterWithName:](v15, "enterWithName:", CFSTR("drop psi"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    queue_psiDatabase = self->_queue_psiDatabase;
    v44[0] = v10;
    v44[1] = 3221225472;
    v44[2] = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_2;
    v44[3] = &unk_1E3674D50;
    v45 = v32;
    v34 = v32;
    -[PSIDatabase dropDatabaseWithCompletion:](queue_psiDatabase, "dropDatabaseWithCompletion:", v44);

  }
  v39[0] = v10;
  v39[1] = 3221225472;
  v39[2] = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_3;
  v39[3] = &unk_1E3674F58;
  v39[4] = self;
  v40 = v15;
  v42 = v9;
  v43 = a4;
  v41 = v16;
  v35 = v9;
  v36 = v16;
  v37 = v15;
  -[PLTimedDispatchGroup notify:](v37, "notify:", v39);

}

- (void)_inLibraryPerform_donateManagedObjects:(id)a3 partialUpdateMasks:(id)a4 entity:(unint64_t)a5 deleteIdentifiers:(id)a6 identifiersRequiringAdditionalWorkByEntity:(id)a7 library:(id)a8 progress:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  PLSearchIndexingEngineLibraryServicesProvider *libraryServicesProvider;
  void *v23;
  void *v24;
  char v25;
  char v26;
  PLSearchIndexingEmbeddingsFetcher *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  PLSearchIndexingEmbeddingsFetcher *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void (**v52)(id, void *);
  void *v53;
  _QWORD v54[4];
  id v55;
  PLSearchIndexingEngine *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  void (**v64)(id, void *);
  _BYTE *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  PLSearchIndexingEngine *v72;
  id v73;
  id v74;
  id v75;
  PLSearchIndexingEmbeddingsFetcher *v76;
  id v77;
  _BYTE *v78;
  uint8_t v79[4];
  void *v80;
  _BYTE buf[24];
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v49 = a7;
  v19 = a8;
  v20 = a9;
  v52 = (void (**)(id, void *))a10;
  v53 = v16;
  v48 = objc_msgSend(v16, "count");
  v50 = v18;
  v47 = objc_msgSend(v18, "count");
  PLSearchBackendIndexingEngineGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    libraryServicesProvider = self->_libraryServicesProvider;
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v48;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v47;
    *(_WORD *)&buf[22] = 2112;
    v82 = (uint64_t (*)(uint64_t, uint64_t))libraryServicesProvider;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Donating %tu managed objects, deleting %tu identifiers for library: %@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSearchIndexingEngine configuration](self, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "managedObjectContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "inLibraryPerform_refreshSharedLibraryEnabledWithManagedObjectContext:", v24);

  v25 = objc_msgSend(v20, "isCancelled");
  if (a5 == 1)
    v26 = v25;
  else
    v26 = 1;
  if ((v26 & 1) != 0)
  {
    v27 = 0;
  }
  else
  {
    v27 = objc_alloc_init(PLSearchIndexingEmbeddingsFetcher);
    -[PLSearchIndexConfiguration indexingContext](self->_configuration, "indexingContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchIndexingEmbeddingsFetcher prefetchEmbeddingsForAssets:indexingContext:](v27, "prefetchEmbeddingsForAssets:indexingContext:", v16, v28);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v82 = __Block_byref_object_copy__47594;
  v83 = __Block_byref_object_dispose__47595;
  v84 = 0;
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke;
  v70[3] = &unk_1E366B198;
  v31 = v20;
  v71 = v31;
  v72 = self;
  v45 = v17;
  v73 = v45;
  v32 = v19;
  v74 = v32;
  v33 = v29;
  v75 = v33;
  v46 = v27;
  v76 = v46;
  v34 = v30;
  v77 = v34;
  v78 = buf;
  objc_msgSend(v53, "enumerateObjectsUsingBlock:", v70);
  if ((objc_msgSend(v31, "isCancelled") & 1) == 0 && -[PLSearchIndexingEngine supportsPSI](self, "supportsPSI"))
  {
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke_242;
    v68[3] = &unk_1E366B1C0;
    v69 = v33;
    objc_msgSend(v49, "enumerateKeysAndObjectsUsingBlock:", v68);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "isCancelled") & 1) != 0 || (v36 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40)) == 0)
  {
    v39 = 0;
    v37 = 0;
  }
  else
  {
    +[PLGlobalValues searchIndexSpotlightClientStateDictionaryWithIdentifier:timestamp:](PLGlobalValues, "searchIndexSpotlightClientStateDictionaryWithIdentifier:timestamp:", v36, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGlobalValues searchIndexSpotlightClientStateDataWithDictionary:](PLGlobalValues, "searchIndexSpotlightClientStateDataWithDictionary:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "isSuccess"))
    {
      objc_msgSend(v38, "result");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLSearchBackendIndexingEngineGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v38, "error");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v79 = 138412290;
        v80 = v41;
        _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_ERROR, "Error serializing Spotlight client state: %@", v79, 0xCu);

      }
      v39 = 0;
      v37 = 0;
    }

  }
  if (objc_msgSend(v31, "isCancelled"))
  {
    v42 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "failureWithError:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2](v52, v44);

  }
  else
  {
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke_244;
    v54[3] = &unk_1E366B210;
    v55 = v51;
    v56 = self;
    v57 = v33;
    v58 = v34;
    v59 = v50;
    v60 = v39;
    v61 = v37;
    v62 = v32;
    v66 = v48;
    v67 = v47;
    v63 = v35;
    v65 = buf;
    v64 = v52;
    -[PLSearchIndexingEngine _safePerformBlock:](self, "_safePerformBlock:", v54);

    v43 = v55;
  }

  _Block_object_dispose(buf, 8);
}

- (id)_spotlightIndexName
{
  return +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier"));
}

- (int64_t)wellKnownLibraryIdentifierForSearchIndexingRebuildEngine:(id)a3
{
  return -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier", a3);
}

- (void)inLibraryPerform_donateForSearchIndexingRebuildEngine:(id)a3 managedObjects:(id)a4 entity:(unint64_t)a5 entityName:(id)a6 library:(id)a7 progress:(id)a8 queue:(id)a9 completion:(id)a10
{
  -[PLSearchIndexingEngine _inLibraryPerform_donateManagedObjects:partialUpdateMasks:entity:deleteIdentifiers:identifiersRequiringAdditionalWorkByEntity:library:progress:completion:](self, "_inLibraryPerform_donateManagedObjects:partialUpdateMasks:entity:deleteIdentifiers:identifiersRequiringAdditionalWorkByEntity:library:progress:completion:", a4, 0, a5, 0, 0, a7);
}

- (void)dropSearchIndexForSearchIndexingRebuildEngine:(id)a3 completion:(id)a4
{
  -[PLSearchIndexingEngine _dropSearchIndexWithSourceName:reasons:completion:](self, "_dropSearchIndexWithSourceName:reasons:completion:", CFSTR("rebuild"), 0, a4);
}

- (id)sceneTaxonomyDigestsForSearchIndexingRebuildEngine:(id)a3
{
  void *v3;
  void *v4;

  -[PLSearchIndexConfiguration sceneTaxonomyProvider](self->_configuration, "sceneTaxonomyProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "digests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)wellKnownLibraryIdentifierForIncrementalUpdateEngine:(id)a3
{
  return -[PLSearchIndexingEngineLibraryServicesProvider libraryIdentifier](self->_libraryServicesProvider, "libraryIdentifier", a3);
}

- (void)inLibraryPerform_donateForIncrementalUpdateEngine:(id)a3 managedObjects:(id)a4 partialUpdateMasks:(id)a5 entity:(unint64_t)a6 deleteIdentifiers:(id)a7 identifiersRequiringAdditionalWorkByEntity:(id)a8 library:(id)a9 progress:(id)a10 completion:(id)a11
{
  -[PLSearchIndexingEngine _inLibraryPerform_donateManagedObjects:partialUpdateMasks:entity:deleteIdentifiers:identifiersRequiringAdditionalWorkByEntity:library:progress:completion:](self, "_inLibraryPerform_donateManagedObjects:partialUpdateMasks:entity:deleteIdentifiers:identifiersRequiringAdditionalWorkByEntity:library:progress:completion:", a4, a5, a6, a7, a8, a9);
}

- (PLSearchIndexConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_dropLock_dropResult, 0);
  objc_storeStrong((id *)&self->_dropLock_dropGroup, 0);
  objc_storeStrong((id *)&self->_queue_eventHistory, 0);
  objc_storeStrong((id *)&self->_queue_updateEngine, 0);
  objc_storeStrong((id *)&self->_queue_rebuildEngine, 0);
  objc_storeStrong((id *)&self->_queue_psiDatabase, 0);
  objc_storeStrong((id *)&self->_queue_managedSpotlightIndex, 0);
  objc_storeStrong((id *)&self->_queue_spotlightIndex, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessManager, 0);
  objc_storeStrong((id *)&self->_libraryServicesProvider, 0);
}

void __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PLSearchIndexingLazyFetchHelper *v13;
  uint64_t v14;
  void *v15;
  PLSearchIndexingLazyFetchHelper *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLSearchBackendIndexingEngineGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
      v31 = 138412290;
      v32 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Donation canceled for library: %@", (uint8_t *)&v31, 0xCu);
    }

    *a4 = 1;
  }
  v9 = *(void **)(a1 + 48);
  if (v9)
  {
    objc_msgSend(v6, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

  }
  else
  {
    v12 = 0;
  }
  v13 = [PLSearchIndexingLazyFetchHelper alloc];
  v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "libraryIdentifier");
  objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PLSearchIndexingLazyFetchHelper initWithObject:libraryIdentifier:managedObjectContext:](v13, "initWithObject:libraryIdentifier:managedObjectContext:", v6, v14, v15);

  if (objc_msgSend(*(id *)(a1 + 40), "supportsPSI"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "indexingContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSearchManagedObjectUtilities psiObjectForObject:fetchHelper:partialUpdateMask:indexingContext:](PLSearchManagedObjectUtilities, "psiObjectForObject:fetchHelper:partialUpdateMask:indexingContext:", v6, v16, v12, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "objectType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_pl_safeAddObject:toMutableArrayForKey:", v18, v20);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "supportsSpotlightDonate"))
  {
    v21 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "libraryIdentifier");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "indexingContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSearchManagedObjectUtilities searchableItemForObject:fetchHelper:partialUpdateMask:libraryIdentifier:indexingContext:embeddingsFetcher:](PLSearchManagedObjectUtilities, "searchableItemForObject:fetchHelper:partialUpdateMask:libraryIdentifier:indexingContext:embeddingsFetcher:", v6, v16, v12, v21, v22, *(_QWORD *)(a1 + 72));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLSearchManagedObjectUtilities bundleIdentifierForManagedObject:wellKnownLibraryIdentifier:](PLSearchManagedObjectUtilities, "bundleIdentifierForManagedObject:wellKnownLibraryIdentifier:", v6, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "libraryIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(*(id *)(a1 + 80), "_pl_safeAddObject:toMutableArrayForKey:", v23, v24);
      +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
      v25 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isEqualToString:", v25))
      {
        v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);

        if (v26)
        {
LABEL_18:

          goto LABEL_19;
        }
        objc_msgSend(v23, "uniqueIdentifier");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v25 = *(NSObject **)(v28 + 40);
        *(_QWORD *)(v28 + 40) = v27;
      }
    }
    else
    {
      PLSearchBackendIndexingEngineGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "objectID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v31 = 138543874;
        v32 = v29;
        v33 = 2112;
        v34 = v6;
        v35 = 2112;
        v36 = v30;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "nil bundle identifier, skipping indexing for objectID: %{public}@, object: %@, library: %@", (uint8_t *)&v31, 0x20u);

      }
    }

    goto LABEL_18;
  }
LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);

}

void __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke_242(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(obj);
        +[PLSearchManagedObjectUtilities psiObjectForIdentifierRequiringAdditonalWork:entity:](PLSearchManagedObjectUtilities, "psiObjectForIdentifierRequiringAdditonalWork:entity:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "objectType"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_pl_safeAddObject:toMutableArrayForKey:", v11, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

void __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke_244(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    *(_DWORD *)buf = 134217984;
    v22 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Finish converting managed objects, elapsed: %f", buf, 0xCu);

  }
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke_245;
  v14[3] = &unk_1E366B1E8;
  v9 = *(_QWORD *)(a1 + 72);
  v15 = *(id *)(a1 + 80);
  v16 = *(id *)(a1 + 88);
  v20 = *(_OWORD *)(a1 + 120);
  v10 = *(id *)(a1 + 96);
  v11 = *(_QWORD *)(a1 + 40);
  v17 = v10;
  v18 = v11;
  v13 = *(_OWORD *)(a1 + 104);
  v12 = (id)v13;
  v19 = v13;
  objc_msgSend(v5, "_inq_donatePSIObjectsByType:spotlightItemsByBundleID:deleteIdentifiers:spotlightClientState:completion:", v6, v7, v8, v9, v14);

}

void __180__PLSearchIndexingEngine__inLibraryPerform_donateManagedObjects_partialUpdateMasks_entity_deleteIdentifiers_identifiersRequiringAdditionalWorkByEntity_library_progress_completion___block_invoke_245(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  PLSearchIndexingEvent *v8;
  PLSearchIndexingEvent *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isSuccess"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "globalValues");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSearchIndexSpotlightClientState:", v4);

      PLSearchBackendIndexingEngineGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v11 = 138412290;
        v12 = v7;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Saving client state to global values: %@", (uint8_t *)&v11, 0xCu);
      }

    }
    v8 = -[PLSearchIndexingEvent initWithDonationCount:deletionCount:timestamp:sampleIdentifier:]([PLSearchIndexingEvent alloc], "initWithDonationCount:deletionCount:timestamp:sampleIdentifier:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  }
  else
  {
    v9 = [PLSearchIndexingEvent alloc];
    objc_msgSend(v3, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PLSearchIndexingEvent initWithError:](v9, "initWithError:", v10);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 88), "insertObject:atIndex:", v8, 0);
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 88), "count") >= 6)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 88), "removeLastObject");
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 100) = 1;
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 104));
}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_229(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0D732B8];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "successWithResult:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (uint64_t)v6;
  }
  v7 = (id)v4;
  objc_msgSend(v2, "leaveWithResult:", v4);

}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_232(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0D732B8];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "successWithResult:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (uint64_t)v6;
  }
  v7 = (id)v4;
  objc_msgSend(v2, "leaveWithResult:", v4);

}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0D732B8];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "successWithResult:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (uint64_t)v6;
  }
  v7 = (id)v4;
  objc_msgSend(v2, "leaveWithResult:", v4);

}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  PSIDatabase *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 80))
  {
    PLSearchBackendIndexingEngineGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Search indexing engine: in group notify after _inq_dropSearchIndexForReason, but already closed.", buf, 2u);
    }

  }
  else
  {
    v3 = [PSIDatabase alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PSIDatabase initWithPathManager:options:](v3, "initWithPathManager:options:", v4, 2);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 48);
    *(_QWORD *)(v6 + 48) = v5;

  }
  objc_msgSend(*(id *)(a1 + 40), "defaultPreferredResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSuccess");

  PLSearchBackendIndexingEngineGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Drop search index completed for library %@", buf, 0xCu);
    }

    v14 = *(void **)(a1 + 48);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_235;
    v23[3] = &unk_1E3677C40;
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 32);
    v24 = v15;
    v25 = v16;
    v26 = *(_QWORD *)(a1 + 64);
    -[NSObject performTransactionAndWait:](v15, "performTransactionAndWait:", v23);
    v11 = v24;
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(*(id *)(a1 + 40), "defaultPreferredResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v17;
    v29 = 2112;
    v30 = v19;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Drop search index failed for library %@, error: %@", buf, 0x16u);

  }
  v22 = *(id *)(a1 + 40);
  PLSafeRunWithUnfairLock();
  v20 = *(_QWORD *)(a1 + 56);
  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 40), "defaultPreferredResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);

  }
}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_235(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "sceneTaxonomyProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "digests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetSearchIndexRebuildMetadataWithSceneTaxonomyDigests:", v4);

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSearchIndexRebuildCoalescedReasons:", *(_QWORD *)(a1 + 48));

}

void __80__PLSearchIndexingEngine__inq_dropSearchIndexWithSourceName_reasons_completion___block_invoke_236(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 100) = 0;
  objc_msgSend(*(id *)(a1 + 40), "defaultPreferredResult");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v2;

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 104));
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 100);
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_201(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "PSI asset donation completed, elapsed: %f", (uint8_t *)&v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 40), "leave");
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_205(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "PSI collection donation completed, elapsed: %f", (uint8_t *)&v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 40), "leave");
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_209(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "PSI update rankings completed, elapsed: %f", (uint8_t *)&v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 40), "leave");
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_212(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "PSI delete assets completed, elapsed: %f", (uint8_t *)&v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 40), "leave");
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_215(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "PSI delete collections completed, elapsed: %f", (uint8_t *)&v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 40), "leave");
}

void __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_216(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLSearchBackendIndexingEngineGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v21 = objc_msgSend(v6, "count");
    v22 = 2114;
    v23 = v5;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Donating %tu items to Spotlight for bundleID: %{public}@", buf, 0x16u);
  }

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("spotlight donate for %@"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enterWithTimeout:name:", v9, 60.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", v11))
  {
    v12 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v12 = *(id *)(a1 + 48);

  if (v12)
  {
    PLSearchBackendIndexingEngineGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = objc_msgSend(v12, "length");
      *(_DWORD *)buf = 134217984;
      v21 = v13;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "Donating client state of length %tu", buf, 0xCu);
    }
    goto LABEL_8;
  }
LABEL_9:
  v14 = *(void **)(a1 + 64);
  v15 = *(void **)(*(_QWORD *)(a1 + 56) + 32);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_219;
  v17[3] = &unk_1E366B140;
  v18 = v14;
  v19 = v10;
  v16 = v10;
  objc_msgSend(v15, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v6, 0, v12, 0, v5, 32, v17);

}

void __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_223(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSearchBackendIndexingEngineGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Spotlight delete failed with error: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
      v11 = 134217984;
      v12 = v8;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Spotlight delete completed, elapsed: %f", (uint8_t *)&v11, 0xCu);

    }
    v9 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "successWithResult:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 40), "leaveWithResult:", v6);

}

void __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_224(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint8_t v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_2;
  v19 = &unk_1E3670EA0;
  v20 = v2;
  if ((PLBoolResultWithUnfairLock() & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeUnusedGroups");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "didTimeout"))
        {
          PLSearchBackendIndexingEngineGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Spotlight request timed out, donation failure", v11, 2u);
          }

          goto LABEL_15;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_15:

  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 48), "defaultPreferredResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

uint64_t __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 100);
}

void __129__PLSearchIndexingEngine__inq_donatePSIObjectsByType_spotlightItemsByBundleID_deleteIdentifiers_spotlightClientState_completion___block_invoke_219(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSearchBackendIndexingEngineGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Spotlight donation failed with error: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
      v11 = 134217984;
      v12 = v8;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Spotlight donation completed, elapsed: %f", (uint8_t *)&v11, 0xCu);

    }
    v9 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "successWithResult:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 40), "leaveWithResult:", v6);

}

void __97__PLSearchIndexingEngine__inq_validateSpotlightClientStateAgainstExpectedClientState_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  __CFString *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "successWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    +[PLGlobalValues searchIndexSpotlightClientStateDataWithDictionary:](PLGlobalValues, "searchIndexSpotlightClientStateDataWithDictionary:", a1[4]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isSuccess"))
    {
      objc_msgSend(v10, "result");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToData:", v5);

      if (v12)
      {
        PLSearchBackendIndexingEngineGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = a1[4];
          *(_DWORD *)buf = 138412290;
          v36 = v14;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Fetched client state matches expected client state: %@", buf, 0xCu);
        }

      }
      else
      {
        +[PLGlobalValues searchIndexSpotlightClientStateWithData:](PLGlobalValues, "searchIndexSpotlightClientStateWithData:", v5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "isSuccess"))
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          v24 = a1[4];
          objc_msgSend(v22, "result");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("Expected client state does not match fetched client state, expected: %@, fetched: %@"), v24, v25);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v27 = (void *)a1[5];
          v28 = 2;
          v29 = v26;
          v30 = 0;
        }
        else
        {
          v32 = (void *)a1[5];
          objc_msgSend(v22, "error");
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v29 = CFSTR("Error deserializing client state");
          v27 = v32;
          v28 = 3;
          v30 = v26;
        }
        objc_msgSend(v27, "_clientStateResultAndLogWithCode:debugDescription:underlyingError:", v28, v29, v30);
        v33 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v33;
      }
    }
    else
    {
      v19 = (void *)a1[5];
      objc_msgSend(v10, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_clientStateResultAndLogWithCode:debugDescription:underlyingError:", 3, CFSTR("Error serializing expected client state"), v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v21;
    }

  }
  else
  {
    if (v6)
    {
      v15 = (void *)a1[5];
      v16 = CFSTR("Error fetching client state");
      v17 = 4;
      v18 = v6;
    }
    else
    {
      v31 = objc_msgSend(v5, "length");
      v15 = (void *)a1[5];
      if (v31)
        v16 = CFSTR("Spotlight client state is missing, possible Spotlight donation loss, search index rebuild required");
      else
        v16 = CFSTR("Spotlight client state has zero length, possible Spotlight donation loss, search index rebuild required");
      v17 = 1;
      v18 = 0;
    }
    objc_msgSend(v15, "_clientStateResultAndLogWithCode:debugDescription:underlyingError:", v17, v16, v18);
    v34 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v34;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __35__PLSearchIndexingEngine__inq_open__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLSearchBackendIndexingEngineGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(a1 + 40))
        v6 = CFSTR("enabled");
      else
        v6 = CFSTR("disabled");
      v7 = 138543874;
      v8 = v6;
      v9 = 2112;
      v10 = v5;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to set UI search %{public}@ for managed spotlight index at path: %@, error: %@", (uint8_t *)&v7, 0x20u);
    }

  }
}

void __35__PLSearchIndexingEngine__inq_open__block_invoke_160(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v3 = a2;
  if (objc_msgSend(v3, "isFailure"))
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PLSearchIndexSpotlightClientStateErrorDomain"));

    if (v6)
    {
      +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 24);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __35__PLSearchIndexingEngine__inq_open__block_invoke_2;
      v10[3] = &unk_1E3677530;
      v10[4] = v8;
      v11 = v3;
      v12 = *(id *)(a1 + 40);
      objc_msgSend(v7, "dispatchAsync:block:", v9, v10);

    }
  }

}

void __35__PLSearchIndexingEngine__inq_open__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Drop search index completed following index open for library %@", (uint8_t *)&v4, 0xCu);
  }

}

void __35__PLSearchIndexingEngine__inq_open__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inq_handleClientStateValidationError:library:", v3, *(_QWORD *)(a1 + 48));

}

void __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "isSuccess");
  PLSearchBackendIndexingEngineGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "result");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntegerValue");
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 134218242;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v10 = "Found %lu Spotlight assets for library %@";
      v11 = v6;
      v12 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_199541000, v11, v12, v10, buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v13;
    v19 = 2112;
    v20 = v7;
    v10 = "Spotlight query for assets failed for library %@, error: %@";
    v11 = v6;
    v12 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(v14 + 88);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke_149;
  v16[3] = &unk_1E366B0A0;
  v16[4] = v14;
  +[PLAutoBugCapture captureSpotlightClientStateMissingSnapshotWithSpotlightAssetCountResult:searchIndexingEvents:completion:](PLAutoBugCapture, "captureSpotlightClientStateMissingSnapshotWithSpotlightAssetCountResult:searchIndexingEvents:completion:", v3, v15, v16);

}

void __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke_150(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRebuildRequiredExternalReasons:", 256);

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incrementSpotlightClientStateMissingCount");

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchIndexSpotlightClientState:", 0);

}

void __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incrementSpotlightClientStateMismatchedCount");

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSearchIndexSpotlightClientState:", 0);

}

void __72__PLSearchIndexingEngine__inq_handleClientStateValidationError_library___block_invoke_149(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSearchBackendIndexingEngineGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Auto bug capture completed with result: %@ for library; %@",
      (uint8_t *)&v6,
      0x16u);
  }

}

void __76__PLSearchIndexingEngine__inLibraryPerform_donateAssets_library_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  objc_msgSend(v3, "removeUser");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __44__PLSearchIndexingEngine__safePerformBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 100))
  {
    PLSearchBackendIndexingEngineGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v7 = v3;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Drop index in progress, delaying work until drop complete: %{public}@", buf, 0xCu);

    }
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupNotify:queue:block:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 40));

  }
  else
  {
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dispatchAsync:block:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __59__PLSearchIndexingEngine_pauseProcessingIncrementalUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "pause");
}

void __81__PLSearchIndexingEngine_resumeProcessingIncrementalUpdatesInLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addUser");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__PLSearchIndexingEngine_resumeProcessingIncrementalUpdatesInLibrary_completion___block_invoke_2;
  v5[3] = &unk_1E366B078;
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "resumeWithLibrary:completion:", v2, v5);

}

uint64_t __81__PLSearchIndexingEngine_resumeProcessingIncrementalUpdatesInLibrary_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeUser");
}

void __78__PLSearchIndexingEngine_processBatchOfJobsWithType_flags_library_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addUser");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v4 = *(__int16 *)(a1 + 72);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PLSearchIndexingEngine_processBatchOfJobsWithType_flags_library_completion___block_invoke_2;
  v8[3] = &unk_1E366B078;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v3, "processBatchOfJobsWithType:flags:library:progress:completion:", v4, v6, v2, v5, v8);

}

uint64_t __78__PLSearchIndexingEngine_processBatchOfJobsWithType_flags_library_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeUser");
}

void __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  _QWORD v24[3];
  char v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[4];
  _QWORD v31[3];
  char v32;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addUser");
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v5 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2;
  v26[3] = &unk_1E366B000;
  v28 = v31;
  v29 = v30;
  v6 = v2;
  v27 = v6;
  objc_msgSend(v4, "fetchRemainingWorkWithLibrary:completion:", v3, v26);
  dispatch_group_enter(v6);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_3;
  v19[3] = &unk_1E366B000;
  v21 = v24;
  v22 = v23;
  v9 = v6;
  v20 = v9;
  objc_msgSend(v8, "fetchRemainingWorkWithLibrary:completion:", v7, v19);
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_4;
  v13[3] = &unk_1E366B028;
  v15 = v30;
  v16 = v31;
  v17 = v24;
  v18 = v23;
  v12 = *(id *)(a1 + 48);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v12;
  objc_msgSend(v10, "groupNotify:queue:block:", v9, v11, v13);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v31, 8);

}

void __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_3(uint64_t a1, uint64_t a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __67__PLSearchIndexingEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v2)
  {
    v3 = *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) != 0;
    if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_6:
      PLSearchBackendIndexingEngineGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch remaining search indexing work", (uint8_t *)&v9, 2u);
      }
      goto LABEL_13;
    }
  }
  else
  {
    v3 = *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) != 0;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_6;
  PLSearchBackendIndexingEngineGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    v6 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
    v7 = CFSTR("N");
    if (v3)
      v7 = CFSTR("Y");
    v9 = 134218498;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Remaining search indexing work, rebuild: %tu, incremental: %tu isPaused: %{public}@", (uint8_t *)&v9, 0x20u);
  }
LABEL_13:

  (*(void (**)(double))(a1[5] + 16))(0.0);
  return objc_msgSend(*(id *)(a1[4] + 16), "removeUser");
}

void __87__PLSearchIndexingEngine_resetSearchIndexWithReason_library_dropCompletion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  if (objc_msgSend(v3, "isSuccess"))
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __87__PLSearchIndexingEngine_resetSearchIndexWithReason_library_dropCompletion_completion___block_invoke_2;
    v8[3] = &unk_1E366AFB0;
    v9 = *(id *)(a1 + 56);
    objc_msgSend(v5, "resumeSearchIndexRebuildIfNeededForLibrary:calledBy:completion:", v6, CFSTR("Reset"), v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }

}

uint64_t __87__PLSearchIndexingEngine_resetSearchIndexWithReason_library_dropCompletion_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __64__PLSearchIndexingEngine_pauseSearchIndexRebuildWithSourceName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "pauseSearchIndexRebuildWithSourceName:", *(_QWORD *)(a1 + 40));
}

void __89__PLSearchIndexingEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addUser");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__PLSearchIndexingEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_2;
  v6[3] = &unk_1E366AF88;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v3, "resumeSearchIndexRebuildIfNeededForLibrary:calledBy:completion:", v2, v4, v6);

}

uint64_t __89__PLSearchIndexingEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeUser");
}

BOOL __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 100))
    return 0;
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138543618;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Drop index currently in progress during request to drop for source %{public}@, library: %@", buf, 0x16u);
  }

  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 104);
  v8 = *(_QWORD *)(v6 + 24);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke_129;
  v11[3] = &unk_1E3675C58;
  v9 = *(id *)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v9;
  objc_msgSend(v5, "groupNotify:queue:block:", v7, v8, v11);

  return *(_BYTE *)(*(_QWORD *)(a1 + 32) + 100) != 0;
}

void __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke_131(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addUser");
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke_2;
  v6[3] = &unk_1E366B078;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "_inq_dropSearchIndexWithSourceName:reasons:completion:", v3, v4, v6);

}

uint64_t __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeUser");
}

uint64_t __76__PLSearchIndexingEngine__dropSearchIndexWithSourceName_reasons_completion___block_invoke_129(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Notifying drop index completed", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __41__PLSearchIndexingEngine_disableUISearch__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addUser");
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Disabling UI search for %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__PLSearchIndexingEngine_disableUISearch__block_invoke_127;
  v7[3] = &unk_1E3674D50;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "setUISearchEnabled:completionHandler:", 0, v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeUser");

}

void __41__PLSearchIndexingEngine_disableUISearch__block_invoke_127(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSearchBackendIndexingEngineGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      v7 = "Failed to disable UI search for library: %@, error: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_199541000, v8, v9, v7, (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138412546;
    v12 = v10;
    v13 = 2112;
    v14 = 0;
    v7 = "Disabled UI search for library: %@, error: %@";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  PLTimedDispatchGroup *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  PLTimedDispatchGroup *v24;
  _QWORD v25[5];
  PLTimedDispatchGroup *v26;
  id v27;
  _BYTE *v28;
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  _BYTE *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  uint8_t v47[128];
  _BYTE buf[24];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Indexing assets if needed (%tu) for %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addUser");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", *(_QWORD *)(a1 + 32));
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isTemporaryID") & 1) != 0
          || PLSearchIndexObjectIDRequiresRebuildPass(v11, *(void **)(a1 + 48)))
        {
          objc_msgSend(v5, "addObject:", v11);
          objc_msgSend(v6, "removeObject:", v11);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v8);
  }

  v12 = -[PLTimedDispatchGroup initWithQueue:name:]([PLTimedDispatchGroup alloc], "initWithQueue:name:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("indexAssetsIfNeeded"));
  v13 = objc_msgSend(v5, "count");
  v14 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    -[PLTimedDispatchGroup enterWithName:](v12, "enterWithName:", CFSTR("assetsNeverIndexed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 48);
    v36[0] = v14;
    v36[1] = 3221225472;
    v36[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_113;
    v36[3] = &unk_1E3677970;
    v37 = v5;
    v17 = *(id *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 40);
    v38 = v17;
    v39 = v18;
    v41 = buf;
    v19 = v15;
    v40 = v19;
    objc_msgSend(v16, "performBlockAndWait:", v36);

  }
  if (objc_msgSend(v6, "count"))
  {
    -[PLTimedDispatchGroup enterWithName:](v12, "enterWithName:", CFSTR("assetsIncrementalUpdates"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(a1 + 48);
    v30[0] = v14;
    v30[1] = 3221225472;
    v30[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_3;
    v30[3] = &unk_1E3677970;
    v31 = v6;
    v32 = *(id *)(a1 + 48);
    v22 = v20;
    v23 = *(_QWORD *)(a1 + 40);
    v33 = v22;
    v34 = v23;
    v35 = v46;
    objc_msgSend(v21, "performBlockAndWait:", v30);

  }
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_7;
  v25[3] = &unk_1E366F278;
  v25[4] = *(_QWORD *)(a1 + 40);
  v27 = *(id *)(a1 + 56);
  v24 = v12;
  v26 = v24;
  v28 = buf;
  v29 = v46;
  -[PLTimedDispatchGroup notify:](v24, "notify:", v25);

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(buf, 8);
}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_113(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;

  +[PLManagedAsset assetsWithObjectIDs:inLibrary:](PLManagedAsset, "assetsWithObjectIDs:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_2;
  v8[3] = &unk_1E366AF10;
  v10 = v3;
  v7 = *(_OWORD *)(a1 + 56);
  v6 = (id)v7;
  v9 = v7;
  objc_msgSend(v4, "_inLibraryPerform_donateAssets:library:completion:", v2, v5, v8);

}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setResultType:", 2);
  v28[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v3);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_4;
  v26[3] = &unk_1E3673250;
  v8 = v5;
  v27 = v8;
  objc_msgSend(v6, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v2, 0, v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v10;
LABEL_7:
    objc_msgSend(v12, "leaveWithResult:", v11);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBackgroundJobWorkItem searchIndexWorkItemManagedObjectIDsForIdentifiers:managedObjectContext:](PLBackgroundJobWorkItem, "searchIndexWorkItemManagedObjectIDsForIdentifiers:managedObjectContext:", v8, v13);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "isSuccess")
    || (objc_msgSend(v11, "result"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "count"),
        v14,
        !v15))
  {
    v12 = *(void **)(a1 + 48);
    goto LABEL_7;
  }
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(a1 + 56);
  v18 = *(_QWORD *)(v17 + 24);
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_5;
  v21[3] = &unk_1E3677970;
  v21[4] = v17;
  v11 = v11;
  v22 = v11;
  v19 = *(id *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 64);
  v23 = v19;
  v25 = v20;
  v24 = *(id *)(a1 + 48);
  objc_msgSend(v16, "dispatchAsync:block:", v18, v21);

LABEL_8:
}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeUser");
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "defaultPreferredResult");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)+ *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("uuid"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(*(id *)(a1 + 40), "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_6;
  v5[3] = &unk_1E366AF38;
  v8 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "processJobObjectIDs:entity:library:completion:", v3, 1, v4, v5);

}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isSuccess"))
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "count");

  }
  objc_msgSend(*(id *)(a1 + 40), "leaveWithResult:", v4);

}

void __78__PLSearchIndexingEngine_indexAssetsIfNeededWithObjectIDs_library_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isSuccess"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "leaveWithResult:", v3);

}

void __76__PLSearchIndexingEngine_indexAssetsWithUUIDs_partialUpdateMask_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_DWORD *)buf = 134218242;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Force indexing assets with uuids (%tu) for %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "libraryWithName:", "-[PLSearchIndexingEngine indexAssetsWithUUIDs:partialUpdateMask:completion:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PLSearchIndexingEngine_indexAssetsWithUUIDs_partialUpdateMask_completion___block_invoke_2;
  v8[3] = &unk_1E3671878;
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v6 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v7 = v5;
  objc_msgSend(v7, "performBlockAndWait:", v8);

}

void __76__PLSearchIndexingEngine_indexAssetsWithUUIDs_partialUpdateMask_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  +[PLSearchIndexManager fetchAssetsWithUUIDs:managedObjectContext:error:](PLSearchIndexManager, "fetchAssetsWithUUIDs:managedObjectContext:error:", v2, v3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "_inLibraryPerform_donateAssets:library:completion:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t __31__PLSearchIndexingEngine_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "reset");
}

uint64_t __45__PLSearchIndexingEngine_openWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexingEngineGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Requesting open search index for %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addUser");
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "successWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeUser");
}

void __58__PLSearchIndexingEngine_initWithLibraryServicesProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inq_open");

}

void __58__PLSearchIndexingEngine_initWithLibraryServicesProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inq_close");

}

@end
