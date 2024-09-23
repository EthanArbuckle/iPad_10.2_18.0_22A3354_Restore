@implementation PLTCCObserver

- (PLTCCObserver)initWithLibraryBundleController:(id)a3
{
  id v5;
  PLTCCObserver *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *observerQueue;
  PLTCCObserver *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLTCCObserver;
  v6 = -[PLTCCObserver init](&v13, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.photos.tccObserver", v8);
    observerQueue = v6->_observerQueue;
    v6->_observerQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_libraryBundleController, a3);
    v11 = v6;

  }
  return v6;
}

- (void)registerAsTCCObserver
{
  id v2;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  tcc_events_subscribe();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

- (void)_handleTCCEvent:(unint64_t)a3 auth_record:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t type;
  uint64_t authorization_value;
  uint64_t authorization_value_type;
  uint64_t identifier;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  tcc_authorization_record_get_service();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  tcc_service_get_CF_name();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  tcc_authorization_record_get_subject_identity();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  type = tcc_identity_get_type();
  authorization_value = tcc_authorization_record_get_authorization_value();

  authorization_value_type = tcc_service_get_authorization_value_type();
  identifier = tcc_identity_get_identifier();
  if (!type)
  {
    v14 = identifier;
    if (a3 == 3
      && ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DB1188]) & 1) != 0
       || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DB1190])))
    {
      -[PLTCCObserver _systemPhotoLibrary](self, "_systemPhotoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PLBackendGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = v14;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "TCC Observer: Deleting limited library for bundle: %s", buf, 0xCu);
      }

      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __45__PLTCCObserver__handleTCCEvent_auth_record___block_invoke;
      v21[3] = &unk_1E3674C18;
      v22 = v15;
      v23 = v14;
      v17 = v15;
      objc_msgSend(v17, "performTransactionAndWait:", v21);

    }
    if (PLIsChinaSKU())
    {
      if ((authorization_value & 0xFFFFFFFFFFFFFFFDLL) == 0 && authorization_value_type == 1)
      {
        if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DB10D0]))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

          if (v19)
          {
            PLBackendGetLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Requesting exit due to detected contacts authorization change.", buf, 2u);
            }

            xpc_transaction_exit_clean();
          }
        }
      }
    }
  }

}

- (id)_systemPhotoLibrary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PLPhotoLibraryOpener *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryBundleController openBundleAtLibraryURL:](self->_libraryBundleController, "openBundleAtLibraryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "libraryServicesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLPhotoLibraryOpener initWithLibraryServicesManager:reportInProgressUpgrades:]([PLPhotoLibraryOpener alloc], "initWithLibraryServicesManager:reportInProgressUpgrades:", v6, 0);
    v14 = 0;
    v8 = -[PLPhotoLibraryOpener openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:](v7, "openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:", 0, 0, &v14);
    v9 = v14;
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "TCC Observer: Opened system photo library", buf, 2u);
      }

      objc_msgSend(v6, "databaseContext");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)-[NSObject newShortLivedLibraryWithName:](v11, "newShortLivedLibraryWithName:", "-[PLTCCObserver _systemPhotoLibrary]");
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v3;
        v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "TCC Observer: Unable to open library at URL: %@, error: %@", buf, 0x16u);
      }
      v12 = 0;
    }

  }
  else
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "TCC Observer: No library bundle for URL %@", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryBundleController, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

void __45__PLTCCObserver__handleTCCEvent_auth_record___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLLimitedLibraryFetchFilter deleteLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:](PLLimitedLibraryFetchFilter, "deleteLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:", v3, v2);

}

void __38__PLTCCObserver_registerAsTCCObserver__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleTCCEvent:auth_record:", a2, v5);

}

@end
