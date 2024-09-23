@implementation PLServerPhotoLibraryBundle

void __55__PLServerPhotoLibraryBundle_bindAssetsdService_error___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v2 = (_QWORD *)a1[4];
  if (v2[29])
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    v3 = *(void **)(a1[4] + 232);
    v4 = *(_QWORD *)(a1[7] + 8);
    v5 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
  }
  else
  {
    objc_msgSend(v2, "boundAssetsdServicesTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", a1[5]);
    v6 = v7;
  }

}

- (BOOL)bindAssetsdService:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  BOOL v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__73314;
  v13 = __Block_byref_object_dispose__73315;
  v14 = 0;
  v5 = a3;
  PLSafeRunWithUnfairLock();
  v6 = *((unsigned __int8 *)v16 + 24);
  if (a4 && !*((_BYTE *)v16 + 24))
  {
    *a4 = objc_retainAutorelease((id)v10[5]);
    v6 = *((unsigned __int8 *)v16 + 24);
  }
  v7 = v6 != 0;

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

- (PLServerPhotoLibraryBundle)initWithLibraryURL:(id)a3 bundleController:(id)a4 backgroundJobService:(id)a5 libraryServicesDelegateClass:(Class)a6
{
  id v10;
  id v11;
  id v12;
  PLServerPhotoLibraryBundle *v13;
  PLServerPhotoLibraryBundle *v14;
  NSOperationQueue *v15;
  NSOperationQueue *presentedItemOperationQueue;
  id v17;
  id v18;
  uint64_t v19;
  PLLazyObject *lazyTouchCoalescer;
  PLServerPhotoLibraryBundle *v21;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PLServerPhotoLibraryBundle;
  v13 = -[PLPhotoLibraryBundle initWithLibraryURL:bundleController:](&v26, sel_initWithLibraryURL_bundleController_, v10, v11);
  v14 = v13;
  if (v13)
  {
    v13->_libraryServicesDelegateClass = a6;
    objc_storeStrong((id *)&v13->_backgroundJobService, a5);
    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    presentedItemOperationQueue = v14->_presentedItemOperationQueue;
    v14->_presentedItemOperationQueue = v15;

    v17 = objc_initWeak(&location, v14);
    v18 = objc_alloc(MEMORY[0x1E0D73248]);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __116__PLServerPhotoLibraryBundle_initWithLibraryURL_bundleController_backgroundJobService_libraryServicesDelegateClass___block_invoke;
    v23[3] = &unk_1E36759D8;
    objc_copyWeak(&v24, &location);
    v19 = objc_msgSend(v18, "initWithBlock:", v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    lazyTouchCoalescer = v14->_lazyTouchCoalescer;
    v14->_lazyTouchCoalescer = (PLLazyObject *)v19;

    v21 = v14;
  }

  return v14;
}

- (id)newAssetsdClient
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("PLAssetsdClient must not be used by assetsd"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)newChangePublisher
{
  return objc_alloc_init(PLServerChangePublisher);
}

- (id)newLibraryServicesManager
{
  PLLibraryServicesManager *v3;
  PLBackgroundJobService *backgroundJobService;
  void *v5;
  void *v6;
  PLLibraryServicesManager *v7;

  v3 = [PLLibraryServicesManager alloc];
  backgroundJobService = self->_backgroundJobService;
  -[PLPhotoLibraryBundle bundleController](self, "bundleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cacheDeleteRegistration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLLibraryServicesManager initWithLibraryBundle:backgroundJobService:cacheDeleteRegistration:delegateClass:](v3, "initWithLibraryBundle:backgroundJobService:cacheDeleteRegistration:delegateClass:", self, backgroundJobService, v6, self->_libraryServicesDelegateClass);

  return v7;
}

- (id)newBoundAssetsdServicesTable
{
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_newTouchCoalescer
{
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0D71080];
  v4 = dispatch_queue_create("bundle-root-touch", 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PLServerPhotoLibraryBundle__newTouchCoalescer__block_invoke;
  v7[3] = &unk_1E3670A88;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setCoalescerWithLabel:target:queue:action:", CFSTR("com.apple.photos.bundlerootupdate"), self, v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

- (id)transferAssets:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  PLServerPhotoLibraryBundle *v12;
  id v13;
  id v14;
  PLInterLibraryTransfer *v15;
  void *v16;
  id v17;
  id v18;
  PLInterLibraryTransfer *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  const char *v35;
  qos_class_t v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  dispatch_block_t block;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  PLInterLibraryTransfer *v47;
  id v48;
  uint8_t buf[4];
  PLServerPhotoLibraryBundle *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = self;
  v13 = a5;
  v14 = a4;
  v15 = -[PLInterLibraryTransfer initWithSourceBundle:destinationBundle:options:]([PLInterLibraryTransfer alloc], "initWithSourceBundle:destinationBundle:options:", v12, v14, v13);

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(v10, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __73__PLServerPhotoLibraryBundle_transferAssets_toBundle_options_completion___block_invoke;
  v44[3] = &unk_1E3671878;
  v17 = v10;
  v45 = v17;
  v18 = v16;
  v46 = v18;
  v19 = v15;
  v47 = v19;
  v20 = v11;
  v48 = v20;
  v21 = (void *)MEMORY[0x19AEC174C](v44);
  PLInterLibraryTransferGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v12;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "Waiting for running state on source bundle %@", buf, 0xCu);
  }

  -[PLPhotoLibraryBundle libraryServicesManager](v12, "libraryServicesManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v24 = objc_msgSend(v23, "awaitLibraryState:error:", 7, &v43);
  v25 = v43;

  if ((v24 & 1) != 0)
  {
    PLInterLibraryTransferGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v12;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "Waiting for running state on dest bundle %@", buf, 0xCu);
    }

    -[PLPhotoLibraryBundle libraryServicesManager](v12, "libraryServicesManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v25;
    v28 = objc_msgSend(v27, "awaitLibraryState:error:", 7, &v42);
    v29 = v42;

    if ((v28 & 1) != 0)
    {
      block = v21;
      PLInterLibraryTransferGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_INFO, "Enqueueing transfer operation", buf, 2u);
      }

      v31 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v17, "anyObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("InterLibraryTransfer %@ (%tu)"), v32, objc_msgSend(v17, "count"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = objc_retainAutorelease(v33);
      v35 = (const char *)objc_msgSend(v34, "UTF8String");
      v36 = qos_class_self();
      dispatch_queue_attr_make_with_qos_class(0, v36, 0);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = dispatch_queue_create(v35, v37);

      dispatch_async(v38, block);
      v39 = v18;

      v21 = block;
    }
    else
    {
      (*((void (**)(id, id))v20 + 2))(v20, v29);
      v39 = 0;
    }
  }
  else
  {
    (*((void (**)(id, id))v20 + 2))(v20, v25);
    v39 = 0;
    v29 = v25;
  }

  return v39;
}

- (id)transferPersons:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  PLServerPhotoLibraryBundle *v12;
  id v13;
  id v14;
  PLInterLibraryTransfer *v15;
  void *v16;
  id v17;
  id v18;
  PLInterLibraryTransfer *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  const char *v35;
  qos_class_t v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  dispatch_block_t block;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  PLInterLibraryTransfer *v47;
  id v48;
  uint8_t buf[4];
  PLServerPhotoLibraryBundle *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = self;
  v13 = a5;
  v14 = a4;
  v15 = -[PLInterLibraryTransfer initWithSourceBundle:destinationBundle:options:]([PLInterLibraryTransfer alloc], "initWithSourceBundle:destinationBundle:options:", v12, v14, v13);

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(v10, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __74__PLServerPhotoLibraryBundle_transferPersons_toBundle_options_completion___block_invoke;
  v44[3] = &unk_1E3671878;
  v17 = v10;
  v45 = v17;
  v18 = v16;
  v46 = v18;
  v19 = v15;
  v47 = v19;
  v20 = v11;
  v48 = v20;
  v21 = (void *)MEMORY[0x19AEC174C](v44);
  PLInterLibraryTransferGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v12;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "Waiting for running state on source bundle %@", buf, 0xCu);
  }

  -[PLPhotoLibraryBundle libraryServicesManager](v12, "libraryServicesManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v24 = objc_msgSend(v23, "awaitLibraryState:error:", 7, &v43);
  v25 = v43;

  if ((v24 & 1) != 0)
  {
    PLInterLibraryTransferGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v12;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "Waiting for running state on dest bundle %@", buf, 0xCu);
    }

    -[PLPhotoLibraryBundle libraryServicesManager](v12, "libraryServicesManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v25;
    v28 = objc_msgSend(v27, "awaitLibraryState:error:", 7, &v42);
    v29 = v42;

    if ((v28 & 1) != 0)
    {
      block = v21;
      PLInterLibraryTransferGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_INFO, "Enqueueing transfer operation", buf, 2u);
      }

      v31 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v17, "anyObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("InterLibraryTransfer %@ (%tu)"), v32, objc_msgSend(v17, "count"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = objc_retainAutorelease(v33);
      v35 = (const char *)objc_msgSend(v34, "UTF8String");
      v36 = qos_class_self();
      dispatch_queue_attr_make_with_qos_class(0, v36, 0);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = dispatch_queue_create(v35, v37);

      dispatch_async(v38, block);
      v39 = v18;

      v21 = block;
    }
    else
    {
      (*((void (**)(id, id))v20 + 2))(v20, v29);
      v39 = 0;
    }
  }
  else
  {
    (*((void (**)(id, id))v20 + 2))(v20, v25);
    v39 = 0;
    v29 = v25;
  }

  return v39;
}

- (void)close
{
  NSObject *v3;
  void *v4;
  char v5;
  PLServerPhotoLibraryBundle *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PLLazyObject *lazyTouchCoalescer;
  _QWORD v15[5];
  objc_super v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  PLServerPhotoLibraryBundle *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v19 = objc_opt_class();
    v20 = 2048;
    v21 = self;
    v22 = 2080;
    v23 = "-[PLServerPhotoLibraryBundle close]";
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p %s", buf, 0x20u);
  }

  -[PLPhotoLibraryBundle libraryServicesManager](self, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v5 = objc_msgSend(v4, "finalize:", &v17);
  v6 = (PLServerPhotoLibraryBundle *)v17;

  if ((v5 & 1) == 0)
  {
    PLLibraryBundleGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PLPhotoLibraryBundle libraryServicesManager](self, "libraryServicesManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = (uint64_t)v8;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to finalize library services manager %@: %@", buf, 0x16u);

    }
    -[PLPhotoLibraryBundle libraryServicesManager](self, "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateWithInvalidationError:", v6);

  }
  -[PLPhotoLibraryBundle pathManager](self, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLLibraryIDFromPathManager();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLUnregisterDataStoresForLibraryID(v11);

  v12 = (void *)MEMORY[0x1E0D732F8];
  -[PLPhotoLibraryBundle pathManager](self, "pathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidateIsSuppressingTargetConfigDueToPendingThumbMigrationForPathManager:", v13);

  v16.receiver = self;
  v16.super_class = (Class)PLServerPhotoLibraryBundle;
  -[PLPhotoLibraryBundle close](&v16, sel_close);
  lazyTouchCoalescer = self->_lazyTouchCoalescer;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __35__PLServerPhotoLibraryBundle_close__block_invoke;
  v15[3] = &unk_1E3670AB0;
  v15[4] = self;
  -[PLLazyObject invalidateWithHandler:](lazyTouchCoalescer, "invalidateWithHandler:", v15);

}

- (void)_touch
{
  void *v2;
  id v3;
  const char *v4;

  -[PLPhotoLibraryBundle pathManager](self, "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoDirectoryWithType:", 1);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");

  if (v4)
    utimes(v4, 0);
}

- (void)invalidateClientConnectionsWithReason:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  PLServerPhotoLibraryBundle *v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __68__PLServerPhotoLibraryBundle_invalidateClientConnectionsWithReason___block_invoke;
  v21 = &unk_1E3677C18;
  v22 = self;
  v5 = v4;
  v23 = v5;
  PLSafeRunWithUnfairLock();
  PLLibraryBundleGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating all client connections to bundle %@", buf, 0xCu);

  }
  -[PLServerPhotoLibraryBundle boundAssetsdServices](self, "boundAssetsdServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "invalidateConnectionWithReason:", v5);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
    }
    while (v11);
  }
  PLSafeRunWithUnfairLock();

}

- (void)clearInvalidateClientsReason
{
  PLSafeRunWithUnfairLock();
}

- (id)invalidateClientsReason
{
  PLSafeResultWithUnfairLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)shutdownWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  PLServerPhotoLibraryBundle *v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  PLServerPhotoLibraryBundle *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotosObjectLifecycleGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v29 = objc_opt_class();
    v30 = 2048;
    v31 = self;
    v32 = 2080;
    v33 = "-[PLServerPhotoLibraryBundle shutdownWithReason:]";
    v34 = 2112;
    v35 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%@ %p %s %@", buf, 0x2Au);
  }

  PLLibraryBundleGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "code");
    *(_DWORD *)buf = 138412802;
    v29 = (uint64_t)v8;
    v30 = 2048;
    v31 = (PLServerPhotoLibraryBundle *)v9;
    v32 = 2112;
    v33 = (const char *)v4;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Shutting down bundle %@ with reason code %td, full reason %@", buf, 0x20u);

  }
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __49__PLServerPhotoLibraryBundle_shutdownWithReason___block_invoke;
  v25 = &unk_1E3677C18;
  v26 = self;
  v10 = v4;
  v27 = v10;
  PLSafeRunWithUnfairLock();
  -[PLServerPhotoLibraryBundle invalidateClientConnectionsWithReason:](self, "invalidateClientConnectionsWithReason:", v10);
  -[PLPhotoLibraryBundle libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preRunningProgress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "totalUnitCount");
  if (v13 != objc_msgSend(v12, "completedUnitCount"))
  {
    PLLibraryBundleGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (uint64_t)v12;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Cancelling libraryServicesManager.preRunningProgress %@", buf, 0xCu);
    }

    objc_msgSend(v12, "cancel");
  }
  -[PLPhotoLibraryBundle libraryServicesManager](self, "libraryServicesManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postRunningProgress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  PLLibraryBundleGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = (uint64_t)v16;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Cancelling libraryServicesManager.postRunningProgress %@", buf, 0xCu);
  }

  objc_msgSend(v16, "cancel");
  v21.receiver = self;
  v21.super_class = (Class)PLServerPhotoLibraryBundle;
  -[PLPhotoLibraryBundle shutdownWithReason:](&v21, sel_shutdownWithReason_, v10);
  PLLibraryBundleGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = (uint64_t)v20;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Finished shutting down bundle %@", buf, 0xCu);

  }
}

- (id)boundAssetsdServices
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__73314;
  v8 = __Block_byref_object_dispose__73315;
  v9 = 0;
  PLSafeRunWithUnfairLock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)unbindAssetsdService:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLSafeRunWithUnfairLock();

}

- (BOOL)calculateTotalSizeWithResult:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v13;
  id obj;
  _QWORD v15[8];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t v32[128];
  __int128 buf;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  -[PLPhotoLibraryBundle pathManager](self, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathsForLibraryFilesystemSizeCalculation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLLibraryBundleGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "calculateTotalSizeWithResult for paths %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v32, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x19AEC1554]();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __59__PLServerPhotoLibraryBundle_calculateTotalSizeWithResult___block_invoke;
        v15[3] = &unk_1E3670B00;
        v15[4] = &buf;
        v15[5] = &v28;
        v15[6] = &v24;
        v15[7] = &v20;
        objc_msgSend(MEMORY[0x1E0D73208], "calculateTotalSizeOfFilesAtPath:calculatePurgeable:allocatedSize:result:", v10, 1, 0, v15);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v32, 16);
    }
    while (v7);
  }

  (*((void (**)(id, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD))v13 + 2))(v13, *(_QWORD *)(*((_QWORD *)&buf + 1) + 24), v29[3], v25[3], v21[3], 0);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&buf, 8);

  return 1;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_presentedItemOperationQueue;
}

- (void)relinquishPresentedItemToReader:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  PLLibraryBundleGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "NSFilePresenter: %@ relinquish to reader", (uint8_t *)&v8, 0xCu);

  }
  v4[2](v4, 0);

}

- (BOOL)shouldRelinquishToWriterOfSubitemAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  char v28;
  unint64_t v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  PLServerPhotoLibraryBundle *v36;
  id v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE buf[12];
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByStandardizingPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryBundle pathManager](self, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathsForExternalWriters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v8;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (!v40)
  {
    v30 = 0;
    goto LABEL_23;
  }
  v36 = self;
  v37 = v4;
  v39 = *(_QWORD *)v45;
  v9 = *MEMORY[0x1E0CB28A8];
  v41 = *MEMORY[0x1E0CB3308];
  v10 = 0x1E0C99000uLL;
  v11 = v6;
LABEL_3:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v45 != v39)
      objc_enumerationMutation(obj);
    v42 = v12;
    v13 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v12);
    objc_msgSend(v11, "path", v36, v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasPrefix:", v13);

    if (v15)
      break;
LABEL_17:
    v12 = v42 + 1;
    if (v42 + 1 == v40)
    {
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      if (!v40)
      {
        v6 = v11;
        v30 = 0;
        goto LABEL_21;
      }
      goto LABEL_3;
    }
  }
  while (2)
  {
    objc_msgSend(*(id *)(v10 + 3736), "fileURLWithPath:isDirectory:", v13, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v43 = 0;
    v17 = objc_msgSend(v5, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", buf, v16, v11, &v43);
    v18 = v43;
    v19 = v18;
    if (!v17)
    {
      objc_msgSend(v18, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isEqualToString:", v9) && objc_msgSend(v19, "code") == 260)
      {
        v21 = v9;
        v22 = v5;
        objc_msgSend(v19, "userInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v41);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v11;
        v26 = objc_msgSend(v24, "isEqual:", v11);

        if (!v26)
        {
          v5 = v22;
          v9 = v21;
          v10 = 0x1E0C99000;
          v11 = v25;
LABEL_13:

          objc_msgSend(v11, "path");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "hasPrefix:", v13);

          if ((v28 & 1) == 0)
            goto LABEL_17;
          continue;
        }
        objc_msgSend(v25, "URLByDeletingLastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v25;
        v5 = v22;
        v9 = v21;
        v10 = 0x1E0C99000;
      }

      goto LABEL_13;
    }
    break;
  }
  v29 = *(_QWORD *)buf;

  if (v29 >= 2)
    goto LABEL_17;
  v6 = v11;
  v30 = 1;
LABEL_21:
  self = v36;
  v4 = v37;
LABEL_23:

  PLLibraryBundleGetLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lastPathComponent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = CFSTR(" ");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v33;
    v49 = 2112;
    if (v30)
      v34 = CFSTR(" NOT ");
    v50 = v34;
    v51 = 2112;
    v52 = v4;
    _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "Library: %@ should%@RelinquishToWriterOfSubitemAtURL: %@", buf, 0x20u);

  }
  return v30 ^ 1;
}

- (void)relinquishPresentedItemToWriter:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  PLLibraryBundleGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Begin relinquishing library bundle %@ to writer", buf, 0xCu);

  }
  -[PLPhotoLibraryBundle bundleController](self, "bundleController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryBundle libraryURL](self, "libraryURL", *MEMORY[0x1E0CB3308]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CB2D50];
  v18[0] = v9;
  v18[1] = CFSTR("Relinquishing photo library to writer");
  v11 = *MEMORY[0x1E0CB2D68];
  v17[1] = v10;
  v17[2] = v11;
  v18[2] = CFSTR("Another process is trying to modify the library bundle");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41018, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shutdownBundle:reason:", self, v13);
  PLLibraryBundleGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v16;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "shutdownBundle for %@ has completed. Relinquishing to writer.", buf, 0xCu);

  }
  v4[2](v4, 0);

}

- (void)savePresentedItemChangesWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  PLLibraryBundleGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Library: %@ savePresentedItemChangesWithCompletionHandler: called", (uint8_t *)&v8, 0xCu);

  }
  v4[2](v4, 0);

}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  PLLibraryBundleGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Library: %@ accommodatePresentedItemDeletionWithCompletionHandler: called sending error", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41005, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v8);

}

- (void)presentedItemDidMoveToURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLibraryBundleGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Library: %@ moved, presentedItemDidMoveToURL: %@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  PLLibraryBundleGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Library: %@ accommodatePresentedSubitemDeletionAtURL: %@", (uint8_t *)&v11, 0x16u);

  }
  v7[2](v7, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidateClientsReason, 0);
  objc_storeStrong((id *)&self->_lazyTouchCoalescer, 0);
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
  objc_storeStrong((id *)&self->_backgroundJobService, 0);
}

_QWORD *__59__PLServerPhotoLibraryBundle_calculateTotalSizeWithResult___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) += a2;
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) += a3;
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) += a4;
  *(_QWORD *)(*(_QWORD *)(result[7] + 8) + 24) += a5;
  return result;
}

void __51__PLServerPhotoLibraryBundle_unbindAssetsdService___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "boundAssetsdServicesTable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __50__PLServerPhotoLibraryBundle_boundAssetsdServices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "boundAssetsdServicesTable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__PLServerPhotoLibraryBundle_shutdownWithReason___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

id __53__PLServerPhotoLibraryBundle_invalidateClientsReason__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 232);
}

void __58__PLServerPhotoLibraryBundle_clearInvalidateClientsReason__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLLibraryBundleGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "libraryURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Allowing future bind requests for bundle %@", (uint8_t *)&v7, 0xCu);

  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = 0;

}

void __68__PLServerPhotoLibraryBundle_invalidateClientConnectionsWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLLibraryBundleGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "libraryURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Disallowing future bind requests for bundle %@", (uint8_t *)&v5, 0xCu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 232), *(id *)(a1 + 40));
}

void __68__PLServerPhotoLibraryBundle_invalidateClientConnectionsWithReason___block_invoke_249(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLLibraryBundleGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "libraryURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Removing all bound assetsd services from bundle %@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "boundAssetsdServicesTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

uint64_t __35__PLServerPhotoLibraryBundle_close__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "reset");
  return objc_msgSend(*(id *)(a1 + 32), "_touch");
}

void __74__PLServerPhotoLibraryBundle_transferPersons_toBundle_options_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  const __CFString *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
        {
          PLInterLibraryTransferGetLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Person transfer operation cancelled", buf, 2u);
          }

          v12 = (void *)MEMORY[0x1E0CB35C8];
          v13 = *MEMORY[0x1E0D74498];
          v22 = *MEMORY[0x1E0CB2938];
          v23 = CFSTR("Person transfer operation cancelled");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 41031, v14);
          v15 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v15;
          goto LABEL_15;
        }

        v9 = *(void **)(a1 + 48);
        v16 = 0;
        v10 = objc_msgSend(v9, "transferPersonWithUuid:error:", v8, &v16);
        v5 = v16;
        if (!v10)
          goto LABEL_15;
        objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_15:

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __73__PLServerPhotoLibraryBundle_transferAssets_toBundle_options_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  const __CFString *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
        {
          PLInterLibraryTransferGetLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Asset transfer operation cancelled", buf, 2u);
          }

          v12 = (void *)MEMORY[0x1E0CB35C8];
          v13 = *MEMORY[0x1E0D74498];
          v22 = *MEMORY[0x1E0CB2938];
          v23 = CFSTR("Asset transfer operation cancelled");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 41031, v14);
          v15 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v15;
          goto LABEL_15;
        }

        v9 = *(void **)(a1 + 48);
        v16 = 0;
        v10 = objc_msgSend(v9, "transferAssetWithUuid:error:", v8, &v16);
        v5 = v16;
        if (!v10)
          goto LABEL_15;
        objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_15:

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __48__PLServerPhotoLibraryBundle__newTouchCoalescer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  id v7;

  v5 = a4;
  objc_msgSend(v5, "activityToken");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_touch");

  objc_msgSend(v7, "endActivity");
  objc_msgSend(v5, "delayNextInvocationByTimeInterval:", 15.0);

}

id __116__PLServerPhotoLibraryBundle_initWithLibraryURL_bundleController_backgroundJobService_libraryServicesDelegateClass___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "_newTouchCoalescer");
  else
    v3 = 0;

  return v3;
}

@end
