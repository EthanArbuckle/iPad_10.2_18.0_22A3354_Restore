@implementation TRIMAProvider

+ (id)fetchRetryDateFromAttribution:(id)a3 isDeferral:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  _BOOL8 v6;

  v4 = a4;
  objc_msgSend(a3, "networkOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "discretionaryBehavior") == 0;

  return +[TRIFetchRetryUtils fetchRetryDateFromRetryAfterSeconds:isDeferral:isRetryable:isNonDiscretionary:](TRIFetchRetryUtils, "fetchRetryDateFromRetryAfterSeconds:isDeferral:isRetryable:isNonDiscretionary:", 0, v4, 1, v6);
}

- (id)endAllPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[TRIMAProvider _shouldMockMobileAssets](self, "_shouldMockMobileAssets"))
  {
    -[TRIMAProvider _sqliteMADatabase](self, "_sqliteMADatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endAllPreviousLocksOfReasonSync:forAssetSelector:", v8, v10);

    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4E060], "endAllPreviousLocksOfReasonSync:forClientName:forAssetSelector:", v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)endAllPreviousLocksOfSelectorSync:(id)a3 forClientName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[TRIMAProvider _shouldMockMobileAssets](self, "_shouldMockMobileAssets"))
  {
    -[TRIMAProvider _sqliteMADatabase](self, "_sqliteMADatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endAllPreviousLocksOfSelectorSync:forClientName:", v6, v7);

    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4E060], "endAllPreviousLocksOfSelectorSync:forClientName:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)cancelActivityForSelector:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[TRIMAProvider _shouldMockMobileAssets](self, "_shouldMockMobileAssets"))
  {
    -[TRIMAProvider _sqliteMADatabase](self, "_sqliteMADatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelActivityForSelector:completion:", v8, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4E060], "cancelActivityForSelector:completion:", v8, v6);
  }

}

- (void)eliminateAllForSelector:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[TRIMAProvider _shouldMockMobileAssets](self, "_shouldMockMobileAssets"))
  {
    -[TRIMAProvider _sqliteMADatabase](self, "_sqliteMADatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eliminateAllForSelector:completion:", v8, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4E060], "eliminateAllForSelector:completion:", v8, v6);
  }

}

- (void)eliminatePromotedNeverLockedForSelector:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[TRIMAProvider _shouldMockMobileAssets](self, "_shouldMockMobileAssets"))
  {
    -[TRIMAProvider _sqliteMADatabase](self, "_sqliteMADatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eliminatePromotedNeverLockedForSelector:completion:", v8, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4E060], "eliminatePromotedNeverLockedForSelector:completion:", v8, v6);
  }

}

- (id)createAutoAssetWithId:(id)a3 decryptionKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  __objc2_class **v11;
  void *v12;
  id obj;

  obj = 0;
  v8 = a4;
  v9 = a3;
  v10 = -[TRIMAProvider _shouldMockMobileAssets](self, "_shouldMockMobileAssets");
  v11 = off_1E932E430;
  if (!v10)
    v11 = off_1E932E0F8;
  v12 = (void *)objc_msgSend(objc_alloc(*v11), "initWithAssetId:decryptionKey:error:", v9, v8, &obj);

  if (a5 && !v12)
    objc_storeStrong(a5, obj);

  return v12;
}

- (id)_sqliteMADatabase
{
  TRISQLiteMADatabase *db;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TRISQLiteMADatabase *v10;
  TRISQLiteMADatabase *v11;
  void *v13;

  db = self->_db;
  if (!db)
  {
    if (sqliteMADatabasePaths)
    {
      v5 = (id)sqliteMADatabasePaths;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    objc_msgSend(v5, "trialRootDir");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("MASQLiteMock"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Database"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TRISQLiteMADatabase initWithParentDir:]([TRISQLiteMADatabase alloc], "initWithParentDir:", v9);
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMAProviding.m"), 394, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[[TRISQLiteMADatabase alloc] initWithParentDir:parentDir]"));

    }
    v11 = self->_db;
    self->_db = v10;

    db = self->_db;
  }
  return db;
}

- (BOOL)_shouldMockMobileAssets
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.triald.ma.sqliteMock"));

  return v3;
}

- (id)installedAssetsMatchingFullAssetIds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v6 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__TRIMAProvider_installedAssetsMatchingFullAssetIds___block_invoke;
  v10[3] = &unk_1E9333470;
  v10[4] = self;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_362);
  if (*((_BYTE *)v14 + 24))
    v8 = v7;
  else
    v8 = 0;

  _Block_object_dispose(&v13, 8);
  objc_autoreleasePoolPop(v5);

  return v8;
}

void __53__TRIMAProvider_installedAssetsMatchingFullAssetIds___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v22 = 0;
  objc_msgSend(*(id *)(a1 + 32), "createAutoAssetWithId:decryptionKey:error:", v5, 0, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setLockAcrossTermination:", 0);
    objc_msgSend(v7, "setUnlockAfterUsageSecs:", -2);
    v20 = 0;
    v21 = 0;
    objc_msgSend(v6, "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:", CFSTR("test asset presence"), v7, 0, &v21, 0, &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;
    v19 = v20;
    if (v8 && v9)
    {
      objc_msgSend(v9, "assetVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 == 0;

      if (v11)
      {
        TRILogCategory_Server();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v24 = v9;
          _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "lockContent returned asset selector with missing version: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        v12 = objc_alloc(MEMORY[0x1E0DC0AB0]);
        objc_msgSend(v9, "assetType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "assetSpecifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "assetVersion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v12, "initWithType:specifier:version:", v13, v14, v15);

        v17 = *(id *)(a1 + 40);
        objc_sync_enter(v17);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v16);
        objc_sync_exit(v17);

      }
    }
    else
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v24 = v6;
        v25 = 2114;
        v26 = v19;
        _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "MAAutoAsset %{public}@ not found when checking for presence: %{public}@", buf, 0x16u);
      }
    }

  }
  else
  {
    TRILogCategory_ClientFramework();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v5;
      v25 = 2112;
      v26 = v22;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Failed to init autoAsset %@: %@", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }

}

id __53__TRIMAProvider_installedAssetsMatchingFullAssetIds___block_invoke_360(uint64_t a1, uint64_t a2, void *a3)
{
  return (id)objc_msgSend(a3, "endLockUsageSync:", CFSTR("test asset presence"));
}

- (id)downloadAssets:(id)a3 attribution:(id)a4 aggregateProgress:(id)a5 group:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  TRICancelableMAOperation *v25;
  uint64_t v26;
  TRICancelableMAOperation *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  TRICancelableMAOperation *v33;
  id v34;
  NSObject *v35;
  TRICancelableMAOperation *v36;
  id v38;
  SEL v39;
  TRIMAProvider *v40;
  void *v41;
  _QWORD block[4];
  id v43;
  TRICancelableMAOperation *v44;
  id v45;
  TRIMAProvider *v46;
  id v47;
  id v48;
  NSObject *v49;
  id v50;
  uint64_t *v51;
  SEL v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, void *);
  void *v56;
  TRICancelableMAOperation *v57;
  id v58;
  NSObject *v59;
  id v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[5];
  id v67;
  id v68;
  id v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 1;
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke;
  v66[3] = &unk_1E93334D8;
  v66[4] = self;
  v19 = v17;
  v69 = v19;
  v20 = v14;
  v67 = v20;
  v70 = &v71;
  v21 = v18;
  v68 = v21;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v66);
  if (*((_BYTE *)v72 + 24))
  {
    v39 = a2;
    v40 = self;
    v41 = v15;
    v22 = (void *)objc_opt_new();
    objc_msgSend(v20, "networkOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "discretionaryBehavior");

    if (!v24)
      objc_msgSend(v22, "setUserInitiated:", 1);
    v25 = objc_alloc_init(TRICancelableMAOperation);
    v26 = MEMORY[0x1E0C809B0];
    v27 = v25;
    if (v16)
      dispatch_group_enter(v16);
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    objc_msgSend(v20, "networkOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v20, "networkOptions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "activity");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v26;
      v54 = 3221225472;
      v55 = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_366;
      v56 = &unk_1E9333528;
      v57 = v27;
      v61 = &v62;
      v60 = v19;
      v58 = v20;
      v59 = v16;
      v63[3] = xpc_activity_add_eligibility_changed_handler();

    }
    v38 = v13;
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.triald.MADownloadQueue", qos_class_self());
    v32 = objc_claimAutoreleasedReturnValue();
    block[0] = v26;
    block[1] = 3221225472;
    block[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_370;
    block[3] = &unk_1E93335F0;
    v43 = v21;
    v33 = v27;
    v44 = v33;
    v45 = v22;
    v52 = v39;
    v15 = v41;
    v46 = v40;
    v47 = v41;
    v51 = &v62;
    v50 = v19;
    v48 = v20;
    v49 = v16;
    v34 = v22;
    dispatch_async(v32, block);
    v35 = v49;
    v36 = v33;

    _Block_object_dispose(&v62, 8);
    v13 = v38;
  }
  else
  {
    v36 = 0;
  }

  _Block_object_dispose(&v71, 8);
  return v36;
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "namespaceNameForEncryptionKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "namespaceNameForEncryptionKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceKeyLocator keyDataForNamespace:asymmetric:](TRINamespaceKeyLocator, "keyDataForNamespace:asymmetric:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = 0;
  objc_msgSend(*(id *)(a1 + 32), "createAutoAssetWithId:decryptionKey:error:", v7, v9, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
  }
  else
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v15;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failed to instantiate MAAutoAsset: %{public}@", buf, 0xCu);
    }

    v13 = *(_QWORD *)(a1 + 56);
    +[TRIMAProvider fetchRetryDateFromAttribution:isDeferral:](TRIMAProvider, "fetchRetryDateFromAttribution:isDeferral:", *(_QWORD *)(a1 + 40), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, void *, id))(v13 + 16))(v13, 3, 0, v14, v15);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_366(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[1];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_2;
  v8[3] = &unk_1E9333500;
  v6 = *(_QWORD *)(a1 + 64);
  v9 = v3;
  v14 = v6;
  v10 = v4;
  v13 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v5, "runWithLockAcquired:", v8);

}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_2(uint64_t a1, void *a2)
{
  _BYTE *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3[9])
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Asked to defer but the deferral handler has already been removed", (uint8_t *)&v10, 2u);
    }

  }
  else if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      xpc_activity_remove_eligibility_changed_handler();
    v3[9] = 1;
    v5 = (void *)xpc_activity_copy_identifier();
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136446210;
      v11 = v5;
      _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling operation due to deferral of XPC activity: %{public}s", (uint8_t *)&v10, 0xCu);
    }

    free(v5);
    objc_msgSend(*(id *)(a1 + 40), "cancel");
    v3[8] = 1;
    v7 = *(_QWORD *)(a1 + 64);
    +[TRIMAProvider fetchRetryDateFromAttribution:isDeferral:](TRIMAProvider, "fetchRetryDateFromAttribution:isDeferral:", *(_QWORD *)(a1 + 48), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *, _QWORD))(v7 + 16))(v7, 1, 1, v8, 0);

    v9 = *(NSObject **)(a1 + 56);
    if (v9)
      dispatch_group_leave(v9);
  }

}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_370(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[4];
  _QWORD *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__25;
  v24[4] = __Block_byref_object_dispose__25;
  v25 = 0;
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_371;
  v16[3] = &unk_1E93335A0;
  v17 = v2;
  v18 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v23 = *(_QWORD *)(a1 + 104);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 64);
  v19 = v4;
  v20 = v5;
  v21 = v6;
  v22 = v24;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v16);
  v7 = *(_QWORD **)(a1 + 40);
  v8 = (void *)v7[1];
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_381;
  v9[3] = &unk_1E93335C8;
  v14 = *(_QWORD *)(a1 + 96);
  v15 = v24;
  v10 = v7;
  v13 = *(id *)(a1 + 88);
  v11 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 80);
  objc_msgSend(v8, "runWithLockAcquired:", v9);

  _Block_object_dispose(v24, 8);
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_371(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, void *, uint64_t, void *);
  void *v28;
  NSObject *v29;
  __int128 *p_buf;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  uint8_t v38[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_2_372;
  v35[3] = &unk_1E932FA70;
  v37 = a3;
  v36 = *(id *)(a1 + 32);
  v9 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v35);
  if (objc_msgSend(*(id *)(a1 + 40), "isCanceled"))
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Download thread terminated due to delayed handling of task teardown.", (uint8_t *)&buf, 2u);
    }

    v9[2](v9);
    *a4 = 1;
  }
  else
  {
    v11 = dispatch_semaphore_create(0);
    objc_msgSend(*(id *)(a1 + 40), "addSemaphore:", v11);
    objc_msgSend(*(id *)(a1 + 40), "setCurrentAsset:", v7);
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "assetSelector");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Requesting download/lock of MAAutoAsset: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__25;
    v45 = __Block_byref_object_dispose__25;
    v46 = 0;
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_374;
    v32[3] = &unk_1E9333550;
    v15 = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    v34 = *(_QWORD *)(a1 + 80);
    v32[4] = v14;
    v33 = *(id *)(a1 + 64);
    v25 = v8;
    v26 = 3221225472;
    v27 = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_378;
    v28 = &unk_1E9333578;
    v16 = *(_QWORD *)(a1 + 72);
    p_buf = &buf;
    v31 = v16;
    v17 = v11;
    v29 = v17;
    objc_msgSend(v7, "lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:", CFSTR("transiently required by Trial"), v15, -1, v32, &v25);
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "assetSelector", v25, v26, v27, v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v38 = 138543618;
        v39 = v19;
        v40 = 2114;
        v41 = v20;
        _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, "Successfully locked MAAutoAsset: %{public}@ at path: %{public}@", v38, 0x16u);

      }
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isCanceled", v25, v26, v27, v28))
      {
        TRILogCategory_Server();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "assetSelector");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v38 = 138543362;
          v39 = v22;
          _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Failed to lock MAAutoAsset: %{public}@: Download operation was cancelled.", v38, 0xCu);

        }
      }
      else
      {
        TRILogCategory_Server();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "assetSelector");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          *(_DWORD *)v38 = 138543618;
          v39 = v23;
          v40 = 2114;
          v41 = v24;
          _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Failed to lock MAAutoAsset: %{public}@: %{public}@", v38, 0x16u);

        }
      }

      v9[2](v9);
      *a4 = 1;
    }

    _Block_object_dispose(&buf, 8);
  }

}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_2_372(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (id)objc_msgSend(v3, "endLockUsageSync:", CFSTR("transiently required by Trial"));

      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 40));
  }
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_374(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  double v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0DC0AB0]);
  objc_msgSend(v3, "assetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetSelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetSelector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIMAProviding.m"), 563, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("status.assetSelector.assetVersion"));

  }
  v11 = (void *)objc_msgSend(v4, "initWithType:specifier:version:", v6, v8, v10);

  objc_msgSend(v3, "downloadProgress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (double)objc_msgSend(v12, "totalWrittenBytes");
  objc_msgSend(v3, "downloadProgress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 / (double)objc_msgSend(v14, "totalExpectedBytes");

  TRILogCategory_Server();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v19 = v15;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Reporting progress: %f for assetId: %{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setFractionCompleted:forMAAsset:", v11, v15);
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_378(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;
  v15 = v8;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v9;
  v14 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_381(uint64_t a1, void *a2)
{
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _BYTE *v9;

  v3 = a2;
  v4 = v3;
  if (!v3[8])
  {
    v9 = v3;
    if (!v3[9])
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        xpc_activity_remove_eligibility_changed_handler();
        v4 = v9;
      }
      v4[9] = 1;
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      v5 = 1;
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
    {
      v5 = 4;
    }
    else
    {
      v5 = 2;
    }
    v6 = *(_QWORD *)(a1 + 56);
    +[TRIMAProvider fetchRetryDateFromAttribution:isDeferral:](TRIMAProvider, "fetchRetryDateFromAttribution:isDeferral:", *(_QWORD *)(a1 + 40), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, void *, _QWORD))(v6 + 16))(v6, v5, 0, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

    v8 = *(NSObject **)(a1 + 48);
    v4 = v9;
    if (v8)
    {
      dispatch_group_leave(v8);
      v4 = v9;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
