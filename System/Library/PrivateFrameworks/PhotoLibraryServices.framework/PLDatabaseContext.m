@implementation PLDatabaseContext

- (PLDatabaseContext)initWithLibraryBundle:(id)a3
{
  id v5;
  PLDatabaseContext *v6;
  PLDatabaseContext *v7;
  id v8;
  id v9;
  uint64_t v10;
  PLLazyObject *lazyMomentLibrary;
  PLSyndicationIngestMutex *v12;
  PLSyndicationIngestMutex *syndicationIngestMutex;
  NSObject *v14;
  uint64_t v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  objc_super v21;
  _BYTE location[12];
  __int16 v23;
  PLDatabaseContext *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((PLIsAssetsd() & 1) != 0)
  {
    if (v5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDatabaseContext.m"), 36, CFSTR("Must only be initialized in assetsd"));

    if (v5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDatabaseContext.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryBundle != nil"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)PLDatabaseContext;
  v6 = -[PLDatabaseContext init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_libraryBundle, v5);
    v8 = objc_initWeak((id *)location, v7);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43__PLDatabaseContext_initWithLibraryBundle___block_invoke;
    v19[3] = &unk_1E36759D8;
    objc_copyWeak(&v20, (id *)location);
    v10 = objc_msgSend(v9, "initWithBlock:", v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)location);
    lazyMomentLibrary = v7->_lazyMomentLibrary;
    v7->_lazyMomentLibrary = (PLLazyObject *)v10;

    v12 = -[PLSyndicationIngestMutex initWithDatabaseContext:]([PLSyndicationIngestMutex alloc], "initWithDatabaseContext:", v7);
    syndicationIngestMutex = v7->_syndicationIngestMutex;
    v7->_syndicationIngestMutex = v12;

  }
  PLPhotosObjectLifecycleGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = objc_opt_class();
    *(_DWORD *)location = 138412802;
    *(_QWORD *)&location[4] = v15;
    v23 = 2048;
    v24 = v7;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryBundle:%@", location, 0x20u);
  }

  return v7;
}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  PLDatabaseContext *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412546;
    v5 = objc_opt_class();
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p invalidate", (uint8_t *)&v4, 0x16u);
  }

  -[PLLazyObject invalidate](self->_lazyMomentLibrary, "invalidate");
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  uint64_t v6;
  __int16 v7;
  PLDatabaseContext *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLDatabaseContext;
  -[PLDatabaseContext dealloc](&v4, sel_dealloc);
}

- (void)perform:(id)a3 withName:(const char *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = -[PLDatabaseContext newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__PLDatabaseContext_perform_withName___block_invoke;
  v10[3] = &unk_1E3675C58;
  v11 = v7;
  v12 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v8, "performBlock:", v10);

}

- (void)performTransaction:(id)a3 withName:(const char *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = -[PLDatabaseContext newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PLDatabaseContext_performTransaction_withName___block_invoke;
  v10[3] = &unk_1E3675C58;
  v11 = v7;
  v12 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v8, "performTransaction:", v10);

}

- (void)performSync:(id)a3 withName:(const char *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = -[PLDatabaseContext newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__PLDatabaseContext_performSync_withName___block_invoke;
  v10[3] = &unk_1E3675C58;
  v11 = v7;
  v12 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v10);

}

- (void)performTransactionSync:(id)a3 withName:(const char *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = -[PLDatabaseContext newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__PLDatabaseContext_performTransactionSync_withName___block_invoke;
  v10[3] = &unk_1E3675C58;
  v11 = v7;
  v12 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v8, "performTransactionAndWait:", v10);

}

- (int64_t)wellKnownPhotoLibraryIdentifier
{
  id WeakRetained;
  void *v3;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  objc_msgSend(WeakRetained, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wellKnownPhotoLibraryIdentifier");

  return v4;
}

- (id)newShortLivedLibraryWithName:(const char *)a3
{
  void *v5;
  id WeakRetained;
  void *v7;

  v5 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  v7 = (void *)objc_msgSend(v5, "newShortLivedLibraryWithName:bundle:", a3, WeakRetained);

  return v7;
}

- (id)newShortLivedLibraryWithName:(const char *)a3 libraryRole:(unint64_t)a4
{
  void *v7;
  id WeakRetained;
  void *v9;

  v7 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  v9 = (void *)objc_msgSend(v7, "newShortLivedLibraryWithName:libraryRole:bundle:", a3, a4, WeakRetained);

  return v9;
}

- (id)newShortLivedLibraryForHistoryPersistenceReadingWithName:(const char *)a3
{
  PLPhotoLibraryOptions *v5;
  PLPhotoLibraryBundle **p_libraryBundle;
  id WeakRetained;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(PLPhotoLibraryOptions);
  -[PLPhotoLibraryOptions setRequiredState:](v5, "setRequiredState:", 6);
  -[PLPhotoLibraryOptions setRefreshesAfterSave:](v5, "setRefreshesAfterSave:", 0);
  -[PLPhotoLibraryOptions setAutomaticallyPinToFirstFetch:](v5, "setAutomaticallyPinToFirstFetch:", 0);
  p_libraryBundle = &self->_libraryBundle;
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  v16 = 0;
  v8 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", a3, WeakRetained, v5, &v16);
  v9 = v16;

  if (v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__PLDatabaseContext_newShortLivedLibraryForHistoryPersistenceReadingWithName___block_invoke;
    v14[3] = &unk_1E3677AA0;
    v15 = v8;
    +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v14);
    v10 = v15;
  }
  else
  {
    PLLibraryServicesGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_loadWeakRetained((id *)p_libraryBundle);
      objc_msgSend(v11, "libraryURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v18 = a3;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);

    }
  }

  return v8;
}

- (id)newShortLivedCplLibraryWithNameSuffix:(const char *)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend((id)PLDatabaseContextNameCPLLibrary, "stringByAppendingFormat:", CFSTR(": %s"), a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = -[PLDatabaseContext newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", objc_msgSend(v4, "UTF8String"));
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setChangeSource:", 1);

  objc_msgSend(v5, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalOnlyDelete:", 1);

  return v5;
}

- (id)newMomentLibrary
{
  uint64_t v3;
  PLPhotoLibraryOptions *v4;
  PLPhotoLibraryBundle **p_libraryBundle;
  id WeakRetained;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)PLDatabaseContextNameMomentLibrary, "UTF8String");
  v4 = objc_alloc_init(PLPhotoLibraryOptions);
  -[PLPhotoLibraryOptions setLibraryRole:](v4, "setLibraryRole:", 1);
  -[PLPhotoLibraryOptions setRequiredState:](v4, "setRequiredState:", 6);
  -[PLPhotoLibraryOptions setAutomaticallyPinToFirstFetch:](v4, "setAutomaticallyPinToFirstFetch:", 0);
  p_libraryBundle = &self->_libraryBundle;
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  v14 = 0;
  v7 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", v3, WeakRetained, v4, &v14);
  v8 = v14;

  if (!v7)
  {
    PLLibraryServicesGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_loadWeakRetained((id *)p_libraryBundle);
      objc_msgSend(v10, "libraryURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v16 = v3;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);

    }
  }
  objc_msgSend(v7, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setChangeSource:", 1);

  return v7;
}

- (id)momentLibrary
{
  return (id)-[PLLazyObject objectValue](self->_lazyMomentLibrary, "objectValue");
}

- (PLSyndicationIngestMutex)syndicationIngestMutex
{
  return (PLSyndicationIngestMutex *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationIngestMutex, 0);
  objc_storeStrong((id *)&self->_lazyMomentLibrary, 0);
  objc_destroyWeak((id *)&self->_libraryBundle);
}

void __78__PLDatabaseContext_newShortLivedLibraryForHistoryPersistenceReadingWithName___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setStalenessInterval:", 0.0);

}

uint64_t __53__PLDatabaseContext_performTransactionSync_withName___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __42__PLDatabaseContext_performSync_withName___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __49__PLDatabaseContext_performTransaction_withName___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __38__PLDatabaseContext_perform_withName___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id __43__PLDatabaseContext_initWithLibraryBundle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newMomentLibrary");
  else
    v3 = 0;

  return v3;
}

+ (id)newShortLivedLibraryWithName:(const char *)a3 libraryRole:(unint64_t)a4 bundle:(id)a5
{
  id v7;
  PLPhotoLibraryOptions *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = objc_alloc_init(PLPhotoLibraryOptions);
  -[PLPhotoLibraryOptions setRequiredState:](v8, "setRequiredState:", 6);
  -[PLPhotoLibraryOptions setRefreshesAfterSave:](v8, "setRefreshesAfterSave:", 0);
  -[PLPhotoLibraryOptions setLibraryRole:](v8, "setLibraryRole:", a4);
  v14 = 0;
  v9 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", a3, v7, v8, &v14);
  v10 = v14;
  if (!v9)
  {
    PLLibraryServicesGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "libraryURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v16 = a3;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);

    }
  }

  return v9;
}

+ (id)newShortLivedLibraryWithName:(const char *)a3 bundle:(id)a4
{
  return (id)objc_msgSend(a1, "newShortLivedLibraryWithName:libraryRole:bundle:", a3, 0, a4);
}

- (id)newShortLivedMacOpenClientLibraryWithName:(const char *)a3
{
  PLPhotoLibraryOptions *v6;
  id WeakRetained;
  id v8;
  id v9;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v6 = objc_alloc_init(PLPhotoLibraryOptions);
  -[PLPhotoLibraryOptions setRequiredState:](v6, "setRequiredState:", 4);
  -[PLPhotoLibraryOptions setRefreshesAfterSave:](v6, "setRefreshesAfterSave:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  v14 = 0;
  v8 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", a3, WeakRetained, v6, &v14);
  v9 = v14;

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained((id *)&self->_libraryBundle);
    objc_msgSend(v12, "libraryURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDatabaseContext.m"), 188, CFSTR("failed to load photo library %s with url %@, %@"), a3, v13, v9);

  }
  return v8;
}

@end
