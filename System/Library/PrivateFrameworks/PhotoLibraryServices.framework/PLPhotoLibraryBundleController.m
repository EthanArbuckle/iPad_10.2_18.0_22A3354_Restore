@implementation PLPhotoLibraryBundleController

id __85__PLPhotoLibraryBundleController__lookupOrCreateBundleForLibraryURL_replaceExisting___block_invoke(uint64_t a1)
{
  id v2;
  double v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56)
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    do
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
      v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
      objc_msgSend(v2, "timeIntervalSinceNow");
      if (v3 <= 0.0)
      {
        v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "newPhotoLibraryBundleWithLibraryURL:", *(_QWORD *)(a1 + 48));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));
      }
      else
      {
        PLBackendGetLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v8 = v2;
          _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Waiting until %{public}@ before creating new PLPhotoLibraryBundle instance to allow time for volume unmount", buf, 0xCu);
        }

        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
        objc_msgSend(MEMORY[0x1E0CB3978], "sleepUntilDate:", v2);
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
        if (*(_BYTE *)(a1 + 56))
        {
          v5 = 0;
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }

    }
    while (!v5);
  }
  return v5;
}

- (id)newPhotoLibraryBundleWithLibraryURL:(id)a3
{
  PLServerPhotoLibraryBundle *v4;
  PLServerPhotoLibraryBundle *v5;

  if (self->_bundleType == 1)
    v4 = -[PLServerPhotoLibraryBundle initWithLibraryURL:bundleController:backgroundJobService:libraryServicesDelegateClass:]([PLServerPhotoLibraryBundle alloc], "initWithLibraryURL:bundleController:backgroundJobService:libraryServicesDelegateClass:", a3, self, self->_backgroundJobService, self->_libraryServicesDelegateClass);
  else
    v4 = -[PLClientPhotoLibraryBundle initWithLibraryURL:bundleController:]([PLClientPhotoLibraryBundle alloc], "initWithLibraryURL:bundleController:", a3, self);
  v5 = v4;

  return v5;
}

- (id)_lookupOrCreateBundleForLibraryURL:(id)a3 replaceExisting:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryBundleController.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryURL != nil"));

  }
  +[PLPhotoLibraryBundleController _realPathForLibraryURL:](PLPhotoLibraryBundleController, "_realPathForLibraryURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLLibraryBundleGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "lookupOrCreateBundleForLibraryURL unable to get realpath for %@, using %@ instead.", buf, 0x16u);
    }

  }
  v14 = v6;
  v9 = v6;
  v10 = v7;
  PLSafeResultWithUnfairLock();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_realPathForLibraryURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0D73208], "realPathForPath:error:", v4, &v20);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v20;
    v7 = v6;
    if (v5)
    {
      v8 = v6;
LABEL_20:
      if ((PLObjectIsEqual() & 1) == 0 && (PLIsSuppressingLogsForUnitTesting() & 1) == 0)
      {
        PLLibraryBundleGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v22 = v5;
          v23 = 2112;
          v24 = v4;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "Inconsistent URL paths may negatively impact client access performance (original %@ vs. current %@)", buf, 0x16u);
        }

      }
      goto LABEL_25;
    }
    if (-[NSObject code](v6, "code") == 2)
    {
      PLLibraryBundleGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

        objc_msgSend(v4, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringByDeletingLastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v7;
        objc_msgSend(MEMORY[0x1E0D73208], "realPathForPath:error:", v14, &v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v19;

        objc_msgSend(v15, "stringByAppendingPathComponent:", v13);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        if (!v5)
        {
          PLLibraryBundleGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v22 = v3;
            v23 = 2112;
            v24 = v14;
            v25 = 2112;
            v26 = v8;
            _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Unsupported client photo library url, failed to resolve real path from photo library url %@ (path: %@): %@", buf, 0x20u);
          }

        }
        goto LABEL_20;
      }
      *(_DWORD *)buf = 138412802;
      v22 = v3;
      v23 = 2112;
      v24 = v4;
      v25 = 2112;
      v26 = v7;
      v10 = "Failed to resolve real path for missing photo library url %@ (path: %@): %@";
      v11 = v9;
      v12 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0D73280], "ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:", objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryIdentifierForURL:", v3)))
      {
        v5 = v4;
        v8 = v7;
        goto LABEL_25;
      }
      PLLibraryBundleGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 138412802;
      v22 = v3;
      v23 = 2112;
      v24 = v4;
      v25 = 2112;
      v26 = v7;
      v10 = "Failed to resolve real path for photo library url %@ (path: %@): %@";
      v11 = v9;
      v12 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_199541000, v11, v12, v10, buf, 0x20u);
    goto LABEL_15;
  }
  PLLibraryBundleGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Unsupported client photo library url with nil path: %@", buf, 0xCu);
  }
  v5 = 0;
LABEL_25:

  return v5;
}

- (id)lookupOrCreateBundleForLibraryURL:(id)a3
{
  return -[PLPhotoLibraryBundleController _lookupOrCreateBundleForLibraryURL:replaceExisting:](self, "_lookupOrCreateBundleForLibraryURL:replaceExisting:", a3, 0);
}

+ (id)sharedBundleController
{
  PLPhotoLibraryBundleController *v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&gSharedBundleControllerLock);
  v2 = (PLPhotoLibraryBundleController *)(id)gSharedBundleController;
  if (!v2)
  {
    v2 = objc_alloc_init(PLPhotoLibraryBundleController);
    v3 = (void *)gSharedBundleController;
    gSharedBundleController = (uint64_t)v2;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&gSharedBundleControllerLock);
  return v2;
}

- (PLPhotoLibraryBundleController)init
{
  return -[PLPhotoLibraryBundleController initWithBundleType:libraryServicesManagerDelegateClass:](self, "initWithBundleType:libraryServicesManagerDelegateClass:", PLIsAssetsd(), +[PLLibraryServicesManager libraryServicesDelegateClass](PLLibraryServicesManager, "libraryServicesDelegateClass"));
}

- (PLPhotoLibraryBundleController)initWithBundleType:(int64_t)a3 libraryServicesManagerDelegateClass:(Class)a4
{
  PLPhotoLibraryBundleController *v6;
  PLPhotoLibraryBundleController *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *bundlesByPath;
  NSDate *bundleCreationPausedUntilDate;
  PLPhotoLibraryBundleController *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PLPhotoLibraryBundleController;
  v6 = -[PLPhotoLibraryBundleController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_bundleType = a3;
    v6->_libraryServicesDelegateClass = a4;
    v6->_bundlesByPathLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bundlesByPath = v7->_bundlesByPath;
    v7->_bundlesByPath = v8;

    v7->_bundleCreationPauseLock._os_unfair_lock_opaque = 0;
    bundleCreationPausedUntilDate = v7->_bundleCreationPausedUntilDate;
    v7->_bundleCreationPausedUntilDate = 0;

    v11 = v7;
  }

  return v7;
}

- (id)openBundleAtLibraryURL:(id)a3
{
  return -[PLPhotoLibraryBundleController _lookupOrCreateBundleForLibraryURL:replaceExisting:](self, "_lookupOrCreateBundleForLibraryURL:replaceExisting:", a3, 0);
}

- (BOOL)bindAssetsdService:(id)a3 toBundle:(id)a4 error:(id *)a5
{
  char v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  v6 = objc_msgSend(a4, "bindAssetsdService:error:", a3, &v10);
  v7 = v10;
  v8 = v7;
  if (a5 && (v6 & 1) == 0)
    *a5 = objc_retainAutorelease(v7);

  return v6;
}

uint64_t __54__PLPhotoLibraryBundleController_bundleForLibraryURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
}

- (id)bundleForLibraryURL:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v9;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryBundleController.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryURL"));

  }
  +[PLPhotoLibraryBundleController _realPathForLibraryURL:](PLPhotoLibraryBundleController, "_realPathForLibraryURL:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  PLResultWithUnfairLock();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sharedAssetsdClientForPhotoLibraryURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "sharedBundleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lookupOrCreateBundleForLibraryURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "assetsdClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)libraryBundlePaths
{
  void *v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__21073;
  v10 = __Block_byref_object_dispose__21074;
  v11 = 0;
  v4 = MEMORY[0x1E0C809B0];
  PLRunWithUnfairLock();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7[5], v4, 3221225472, __52__PLPhotoLibraryBundleController_libraryBundlePaths__block_invoke, &unk_1E3677C68, self, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);

  return v2;
}

- (id)libraryBundles
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
  v7 = __Block_byref_object_copy__21073;
  v8 = __Block_byref_object_dispose__21074;
  v9 = 0;
  PLRunWithUnfairLock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (id)replaceBundleForRebuildAtLibraryURL:(id)a3
{
  return -[PLPhotoLibraryBundleController _lookupOrCreateBundleForLibraryURL:replaceExisting:](self, "_lookupOrCreateBundleForLibraryURL:replaceExisting:", a3, 1);
}

- (id)libraryServicesStatusDescription
{
  id v2;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Library Services\n----------\n"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  PLRunWithUnfairLock();
  v2 = v4;

  return v2;
}

- (void)handleUnknownMergeEvent
{
  PLRunWithUnfairLock();
}

- (void)_unregisterBundle:(id)a3 pauseUntilDate:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  v5 = v8;
  v6 = v7;
  PLSafeRunWithUnfairLock();

}

- (void)shutdownBundle:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryBundleController.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundle != nil"));

    v9 = 0;
  }
  SetPLPhotoLibraryBundleControllerCrashTracerMessage(v9, v8);
  PLLibraryBundleGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x1E0D731F0];
    objc_msgSend(v7, "libraryURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptionWithFileURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v13;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Shutting down bundle: %@ for reason: %@", buf, 0x16u);

  }
  objc_msgSend(v7, "shutdownWithReason:", v8);
  -[PLPhotoLibraryBundleController removeManagedObjectModelIfNeededForShutdownReason:](self, "removeManagedObjectModelIfNeededForShutdownReason:", v8);
  -[PLPhotoLibraryBundleController pauseUntilDateForShutdownReason:](self, "pauseUntilDateForShutdownReason:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryBundleController _unregisterBundle:pauseUntilDate:](self, "_unregisterBundle:pauseUntilDate:", v7, v14);
  SetPLPhotoLibraryBundleControllerCrashTracerMessage(0, 0);

}

- (void)removeManagedObjectModelIfNeededForShutdownReason:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (PLIsErrorEqualToCode())
  {
    PLLibraryBundleGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Removing managed object model due to unsafe shutdown", v4, 2u);
    }

    +[PLPersistentContainer unsafeRemoveManagedObjectModel](PLPersistentContainer, "unsafeRemoveManagedObjectModel");
  }
}

- (id)pauseUntilDateForShutdownReason:(id)a3
{
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (PLIsErrorEqualToCode())
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 20.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PLLibraryBundleGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Delaying bundle creation until %{public}@ to allow time for volume unmount.", (uint8_t *)&v6, 0xCu);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)shutdownAllBundlesWithReason:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__21073;
  v11 = __Block_byref_object_dispose__21074;
  v12 = 0;
  v5 = MEMORY[0x1E0C809B0];
  do
  {
    PLRunWithUnfairLock();
    v6 = v8[5];
    if (v6)
      -[PLPhotoLibraryBundleController shutdownBundle:reason:](self, "shutdownBundle:reason:", v6, v4, v5, 3221225472, __63__PLPhotoLibraryBundleController_shutdownAllBundlesWithReason___block_invoke, &unk_1E3677C68, self, &v7, v7);
  }
  while (v8[5]);
  _Block_object_dispose(&v7, 8);

}

- (PLBackgroundJobService)backgroundJobService
{
  return (PLBackgroundJobService *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBackgroundJobService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLCacheDeleteRegistration)cacheDeleteRegistration
{
  return (PLCacheDeleteRegistration *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCacheDeleteRegistration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDeleteRegistration, 0);
  objc_storeStrong((id *)&self->_backgroundJobService, 0);
  objc_storeStrong((id *)&self->_bundleCreationPausedUntilDate, 0);
  objc_storeStrong((id *)&self->_bundlesByPath, 0);
}

void __63__PLPhotoLibraryBundleController_shutdownAllBundlesWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __67__PLPhotoLibraryBundleController__unregisterBundle_pauseUntilDate___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__21073;
  v15 = __Block_byref_object_dispose__21074;
  v16 = 0;
  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 32);
  v8[2] = __67__PLPhotoLibraryBundleController__unregisterBundle_pauseUntilDate___block_invoke_2;
  v8[3] = &unk_1E36660A0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = v2;
  v10 = &v11;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (v12[5])
  {
    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", 0);
  }
  else
  {
    PLLibraryBundleGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[5];
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "No registered bundle matches: %@", buf, 0xCu);
    }

  }
  v6 = (void *)a1[6];
  if (v6)
  {
    v7 = v6;
    PLRunWithUnfairLock();

  }
  _Block_object_dispose(&v11, 8);

}

void __67__PLPhotoLibraryBundleController__unregisterBundle_pauseUntilDate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = v7;
  }

}

void __67__PLPhotoLibraryBundleController__unregisterBundle_pauseUntilDate___block_invoke_19(uint64_t a1)
{
  uint64_t v2;
  double v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceDate:");
    if (v3 <= 0.0)
      return;
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 48), *(id *)(a1 + 40));
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Bundle creation paused until %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

uint64_t __57__PLPhotoLibraryBundleController_handleUnknownMergeEvent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_21089);
}

void __57__PLPhotoLibraryBundleController_handleUnknownMergeEvent__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "changeHandlingContainer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleUnknownMergeEvent");

}

void __66__PLPhotoLibraryBundleController_libraryServicesStatusDescription__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__PLPhotoLibraryBundleController_libraryServicesStatusDescription__block_invoke_2;
  v3[3] = &unk_1E3666038;
  v4 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __66__PLPhotoLibraryBundleController_libraryServicesStatusDescription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  objc_msgSend(a3, "libraryServicesManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v4);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("---\n"));

}

void __48__PLPhotoLibraryBundleController_libraryBundles__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __52__PLPhotoLibraryBundleController_libraryBundlePaths__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (void)resetSharedBundleController
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&gSharedBundleControllerLock);
  v2 = (void *)gSharedBundleController;
  gSharedBundleController = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&gSharedBundleControllerLock);
}

@end
