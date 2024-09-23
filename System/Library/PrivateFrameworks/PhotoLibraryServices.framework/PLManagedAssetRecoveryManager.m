@implementation PLManagedAssetRecoveryManager

- (PLManagedAssetRecoveryManager)initWithLibraryServicesManager:(id)a3
{
  id v5;
  PLManagedAssetRecoveryManager *v6;
  PLManagedAssetRecoveryManager *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PLVolumeInfo *volumeInfo;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  PLLazyObject *imageClient;
  id v25;
  id v26;
  uint64_t v27;
  PLLazyObject *videoClient;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PLManagedAssetRecoveryManager;
  v6 = -[PLManagedAssetRecoveryManager init](&v35, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lsm, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.assetsd.periodicmaintenance.managedAssetRecoveryManager.workQueue", v9);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc(MEMORY[0x1E0D73318]);
    objc_msgSend(v5, "pathManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "photoDirectoryWithType:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "initWithPath:", v14);
    volumeInfo = v7->_volumeInfo;
    v7->_volumeInfo = (PLVolumeInfo *)v15;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerForKey:", CFSTR("PLRecoveryManagerResourceDownloadLimitMB"));

    v19 = v18 << 20;
    if (!v18)
      v19 = 314572800;
    v7->_resourceDownloadBytesLimit = v19;
    v20 = objc_initWeak(&location, v7);

    v21 = objc_alloc(MEMORY[0x1E0D73248]);
    v22 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __64__PLManagedAssetRecoveryManager_initWithLibraryServicesManager___block_invoke;
    v32[3] = &unk_1E36759D8;
    objc_copyWeak(&v33, &location);
    v23 = objc_msgSend(v21, "initWithBlock:", v32);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    imageClient = v7->_imageClient;
    v7->_imageClient = (PLLazyObject *)v23;

    v25 = objc_initWeak(&location, v7);
    v26 = objc_alloc(MEMORY[0x1E0D73248]);
    v30[0] = v22;
    v30[1] = 3221225472;
    v30[2] = __64__PLManagedAssetRecoveryManager_initWithLibraryServicesManager___block_invoke_2;
    v30[3] = &unk_1E36759D8;
    objc_copyWeak(&v31, &location);
    v27 = objc_msgSend(v26, "initWithBlock:", v30);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
    videoClient = v7->_videoClient;
    v7->_videoClient = (PLLazyObject *)v27;

  }
  return v7;
}

- (void)identifyAssetsWithInconsistentCloudState
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[16];

  v3 = -[PLManagedAssetRecoveryManager _newPhotoLibraryWithName:nonSyncable:](self, "_newPhotoLibraryWithName:nonSyncable:", "-[PLManagedAssetRecoveryManager identifyAssetsWithInconsistentCloudState]", 1);
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Identifying assets in inconsistent cloud state", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "_imagesWithZeroWidthHeightPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAssetRecoveryManager _setCloudRecoveryState:forAssetsWithFetchRequestPredicate:resultsFilterPredicate:usingNonSyncableLibrary:](self, "_setCloudRecoveryState:forAssetsWithFetchRequestPredicate:resultsFilterPredicate:usingNonSyncableLibrary:", 1, v5, 0, v3);

  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend((id)*MEMORY[0x1E0CEC5B8], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K UTI-CONFORMS-TO %@"), CFSTR("uniformTypeIdentifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_assetsWithJPGFilenameAndRawPrimaryImageResourcePredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAssetRecoveryManager _setCloudRecoveryState:forAssetsWithFetchRequestPredicate:resultsFilterPredicate:usingNonSyncableLibrary:](self, "_setCloudRecoveryState:forAssetsWithFetchRequestPredicate:resultsFilterPredicate:usingNonSyncableLibrary:", 2, v9, v8, v3);

  objc_msgSend((id)objc_opt_class(), "_irisesWithZeroVideoCpDuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAssetRecoveryManager _setCloudRecoveryState:forAssetsWithFetchRequestPredicate:resultsFilterPredicate:usingNonSyncableLibrary:](self, "_setCloudRecoveryState:forAssetsWithFetchRequestPredicate:resultsFilterPredicate:usingNonSyncableLibrary:", 4, v10, 0, v3);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_57068);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_predicateForAdjustedAssetsWithMissingResources");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAssetRecoveryManager _setCloudRecoveryState:forAssetsWithFetchRequestPredicate:resultsFilterPredicate:usingNonSyncableLibrary:](self, "_setCloudRecoveryState:forAssetsWithFetchRequestPredicate:resultsFilterPredicate:usingNonSyncableLibrary:", 8, v12, v11, v3);

  objc_msgSend((id)objc_opt_class(), "_predicateForAdjustedAssetsFailedDeferredRendering");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAssetRecoveryManager _setCloudRecoveryState:forAssetsWithFetchRequestPredicate:resultsFilterPredicate:usingNonSyncableLibrary:](self, "_setCloudRecoveryState:forAssetsWithFetchRequestPredicate:resultsFilterPredicate:usingNonSyncableLibrary:", 0x40000000, v13, 0, v3);

}

- (void)startRecoveryUsingCloudPhotoLibraryManager:(id)a3 transaction:(id)a4 shouldIdentifyInconsistentAssets:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  -[PLManagedAssetRecoveryManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __121__PLManagedAssetRecoveryManager_startRecoveryUsingCloudPhotoLibraryManager_transaction_shouldIdentifyInconsistentAssets___block_invoke;
  v13[3] = &unk_1E36752E0;
  v16 = a5;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (id)_newPhotoLibraryWithName:(const char *)a3 nonSyncable:(BOOL)a4
{
  _BOOL4 v4;
  PLPhotoLibraryOptions *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(PLPhotoLibraryOptions);
  -[PLPhotoLibraryOptions setRequiredState:](v7, "setRequiredState:", 6);
  -[PLPhotoLibraryOptions setRefreshesAfterSave:](v7, "setRefreshesAfterSave:", 0);
  -[PLPhotoLibraryOptions setAutomaticallyPinToFirstFetch:](v7, "setAutomaticallyPinToFirstFetch:", 0);
  -[PLLibraryServicesManager libraryBundle](self->_lsm, "libraryBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", a3, v8, v7, &v14);
  v10 = v14;

  if (!v9)
  {
    PLBackendSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Error creating context: %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if (v4)
  {
    objc_msgSend(v9, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setChangeSource:", 1);

    objc_msgSend(v9, "managedObjectContext");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject setLocalOnlyDelete:](v12, "setLocalOnlyDelete:", 1);
LABEL_6:

  }
  return v9;
}

- (void)_startRecoveryUsingCloudPhotoLibraryManager:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableArray *v9;
  NSMutableArray *recoveryErrors;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  PLManagedAssetRecoveryManager *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Starting recovery of the assets in inconsistent cloud state", buf, 2u);
  }

  self->_fixedCount = 0;
  self->_totalCount = 0;
  self->_totalDownloadedResourceBytes = 0;
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  recoveryErrors = self->_recoveryErrors;
  self->_recoveryErrors = v9;

  v11 = -[PLManagedAssetRecoveryManager _newPhotoLibraryWithName:nonSyncable:](self, "_newPhotoLibraryWithName:nonSyncable:", "-[PLManagedAssetRecoveryManager _startRecoveryUsingCloudPhotoLibraryManager:transaction:]", 1);
  v12 = -[PLManagedAssetRecoveryManager _newPhotoLibraryWithName:nonSyncable:](self, "_newPhotoLibraryWithName:nonSyncable:", "-[PLManagedAssetRecoveryManager _startRecoveryUsingCloudPhotoLibraryManager:transaction:]", 0);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__PLManagedAssetRecoveryManager__startRecoveryUsingCloudPhotoLibraryManager_transaction___block_invoke;
  v17[3] = &unk_1E3670C40;
  v18 = v11;
  v19 = self;
  v20 = v6;
  v21 = v7;
  v22 = v12;
  v13 = v12;
  v14 = v7;
  v15 = v6;
  v16 = v11;
  objc_msgSend(v16, "performBlockAndWait:", v17);

}

- (void)_setCloudRecoveryState:(unint64_t)a3 forAssetsWithFetchRequestPredicate:(id)a4 resultsFilterPredicate:(id)a5 usingNonSyncableLibrary:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  unint64_t v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __138__PLManagedAssetRecoveryManager__setCloudRecoveryState_forAssetsWithFetchRequestPredicate_resultsFilterPredicate_usingNonSyncableLibrary___block_invoke;
  v15[3] = &unk_1E3674F30;
  v16 = v9;
  v17 = v11;
  v18 = v10;
  v19 = a3;
  v12 = v10;
  v13 = v11;
  v14 = v9;
  objc_msgSend(v13, "performTransactionAndWait:", v15);

}

- (id)_loadObjectWithObjectID:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectRegisteredForID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v6, "refreshObject:mergeChanges:", v7, objc_msgSend(v7, "hasChanges"));
  }
  else
  {
    objc_msgSend(v6, "existingObjectWithID:error:", v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v8, "isDeleted"))
    v9 = 0;
  else
    v9 = v8;
  v10 = v9;

  return v10;
}

- (id)_recoveryStatesToProcessForAttributes:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(&unk_1E3763D10, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(&unk_1E3763D10);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v3, "hasCloudRecoveryStateFlagSet:", objc_msgSend(v9, "integerValue")))
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(&unk_1E3763D10, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)_recoverNextAssetWithEnumerator:(id)a3 cloudPhotoLibraryManager:(id)a4 transaction:(id)a5 usingNonSyncableLibrary:(id)a6 andSyncableLibrary:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD block[5];
  id v40;
  _QWORD v41[4];
  void *v42;
  PLManagedAssetRecoveryManager *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "nextObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v15, "managedObjectContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedAssetRecoveryManager _loadObjectWithObjectID:managedObjectContext:](self, "_loadObjectWithObjectID:managedObjectContext:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke;
      v49[3] = &unk_1E366D330;
      v49[4] = self;
      v21 = v20;
      v50 = v21;
      v35 = v19;
      v22 = v19;
      v51 = v22;
      v52 = v12;
      v38 = v13;
      v23 = v16;
      v24 = v13;
      v53 = v24;
      v54 = v14;
      v37 = v15;
      v55 = v15;
      v36 = v23;
      v25 = v23;
      v56 = v25;
      v26 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v49);
      objc_msgSend(v22, "additionalAttributes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "hasConsistentCloudState"))
      {
        v26[2](v26, 1, 0);
      }
      else if ((int)objc_msgSend(v27, "cloudStateRecoveryAttemptsCount") < 10)
      {
        -[PLManagedAssetRecoveryManager _recoveryStatesToProcessForAttributes:](self, "_recoveryStatesToProcessForAttributes:", v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectEnumerator");
        v34 = v14;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLManagedAssetRecoveryManager _recoverNextRecoveryState:forAsset:cloudPhotoLibraryManager:usingSyncableLibrary:completionBlock:](self, "_recoverNextRecoveryState:forAsset:cloudPhotoLibraryManager:usingSyncableLibrary:completionBlock:", v32, v22, v24, v25, v26);

        v14 = v34;
      }
      else
      {
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PLManagedAssetRecoveryManager"), 2, 0);
        ((void (**)(_QWORD, _QWORD, void *))v26)[2](v26, 0, v31);

      }
      v13 = v38;
      v19 = v35;

      v16 = v36;
      v15 = v37;
    }
    else
    {
      PLBackendGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v58 = v17;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "Skipping recovery of deleted asset: %{public}@", buf, 0xCu);
      }

      -[PLManagedAssetRecoveryManager workQueue](self, "workQueue");
      v30 = objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_111;
      v41[3] = &unk_1E366EA20;
      v42 = 0;
      v43 = self;
      v44 = v12;
      v45 = v13;
      v46 = v14;
      v47 = v15;
      v48 = v16;
      dispatch_async(v30, v41);

      v21 = v42;
    }

  }
  else
  {
    -[PLManagedAssetRecoveryManager workQueue](self, "workQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_3;
    block[3] = &unk_1E3677C18;
    block[4] = self;
    v40 = v14;
    dispatch_async(v28, block);

  }
}

- (void)_recoverNextRecoveryState:(id)a3 forAsset:(id)a4 cloudPhotoLibraryManager:(id)a5 usingSyncableLibrary:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  BOOL v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  BOOL v35;
  _QWORD v36[4];
  id v37;
  BOOL v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "nextObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = objc_msgSend(v17, "integerValue");
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke;
    v44[3] = &unk_1E366D358;
    v44[4] = self;
    v45 = v13;
    v46 = v12;
    v47 = v14;
    v48 = v15;
    v49 = v16;
    v20 = v16;
    -[PLManagedAssetRecoveryManager _performAssetRecoveryTaskForInconsistentState:state:cloudPhotoLibraryManager:usingSyncableLibrary:completionBlock:](self, "_performAssetRecoveryTaskForInconsistentState:state:cloudPhotoLibraryManager:usingSyncableLibrary:completionBlock:", v13, v19, v47, v48, v44);

  }
  else
  {
    v32 = v14;
    v21 = -[NSMutableArray count](self->_recoveryErrors, "count") == 0;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v22 = self->_recoveryErrors;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v23)
    {
      v24 = v23;
      v31 = v15;
      v25 = *(_QWORD *)v41;
LABEL_5:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v22);
        v27 = 1;
        if ((PLIsErrorEqualToCode() & 1) != 0)
          break;
        if (v24 == ++v26)
        {
          v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          if (v24)
            goto LABEL_5;
          v27 = 0;
          break;
        }
      }
      v15 = v31;
    }
    else
    {
      v27 = 0;
    }

    objc_msgSend(v13, "photoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_4;
    v36[3] = &unk_1E366EF90;
    v37 = v13;
    v38 = v21;
    v39 = v27;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_5;
    v33[3] = &unk_1E366D380;
    v34 = v16;
    v35 = v21;
    v29 = v16;
    v30 = v13;
    objc_msgSend(v28, "performTransactionAndWait:completionHandler:", v36, v33);

    v14 = v32;
  }

}

- (void)_performAssetRecoveryTaskForInconsistentState:(id)a3 state:(unint64_t)a4 cloudPhotoLibraryManager:(id)a5 usingSyncableLibrary:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void (*v19)(void);
  _BOOL8 v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  unint64_t v26;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __147__PLManagedAssetRecoveryManager__performAssetRecoveryTaskForInconsistentState_state_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke;
  v23[3] = &unk_1E3676320;
  v16 = v12;
  v25 = v15;
  v26 = a4;
  v24 = v16;
  v17 = MEMORY[0x19AEC174C](v23);
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))v17;
  switch(a4)
  {
    case 0uLL:
      v19 = *(void (**)(void))(v17 + 16);
      goto LABEL_6;
    case 1uLL:
      -[PLManagedAssetRecoveryManager _fixDimensionsForAsset:cloudPhotoLibraryManager:completionBlock:](self, "_fixDimensionsForAsset:cloudPhotoLibraryManager:completionBlock:", v16, v13, v17);
      goto LABEL_11;
    case 2uLL:
      v22 = 0;
      v20 = -[PLManagedAssetRecoveryManager _fixRawUTIForAsset:error:](self, "_fixRawUTIForAsset:error:", v16, &v22);
      v21 = v22;
      ((void (**)(_QWORD, _BOOL8, id))v18)[2](v18, v20, v21);

      goto LABEL_11;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_11;
    case 4uLL:
      -[PLManagedAssetRecoveryManager _fixIrisWithZeroVideoComplementDuration:cloudPhotoLibraryManager:completionBlock:](self, "_fixIrisWithZeroVideoComplementDuration:cloudPhotoLibraryManager:completionBlock:", v16, v13, v17);
      goto LABEL_11;
    case 8uLL:
      goto LABEL_7;
    default:
      if (a4 == 0x40000000)
      {
LABEL_7:
        -[PLManagedAssetRecoveryManager _fixMissingFullSizeAdjustedResources:cloudPhotoLibraryManager:recoveryState:usingSyncableLibrary:completionBlock:](self, "_fixMissingFullSizeAdjustedResources:cloudPhotoLibraryManager:recoveryState:usingSyncableLibrary:completionBlock:", v16, v13, a4, v14, v17);
      }
      else if (a4 == 0x80000000)
      {
        v19 = *(void (**)(void))(v17 + 16);
LABEL_6:
        v19();
      }
LABEL_11:

      return;
  }
}

- (void)_downloadResources:(id)a3 forAsset:(id)a4 usingCloudPhotoLibraryManager:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  id v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t (*totalDownloadedResourceBytes)(uint64_t, uint64_t);
  unint64_t resourceDownloadBytesLimit;
  const __CFString *v50;
  void *v51;
  NSObject *v52;
  id v53;
  PLManagedAssetRecoveryManager *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id obj;
  id obja;
  id v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  PLManagedAssetRecoveryManager *v66;
  id v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  _BYTE *v71;
  _QWORD v72[4];
  id v73;
  id v74;
  NSObject *v75;
  _QWORD *v76;
  _BYTE *v77;
  _QWORD *v78;
  _QWORD *v79;
  _QWORD v80[4];
  id v81;
  NSObject *v82;
  _QWORD *v83;
  _BYTE *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  _QWORD v90[3];
  int v91;
  _QWORD v92[3];
  char v93;
  _QWORD v94[4];
  id v95;
  id v96;
  _QWORD block[4];
  id v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[4];
  id v105;
  uint8_t v106[128];
  uint8_t v107[4];
  uint64_t v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  id v112;
  _BYTE buf[24];
  uint64_t (*v114)(uint64_t, uint64_t);
  _BYTE v115[20];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v59 = a5;
  v55 = v10;
  v56 = a6;
  v63 = v11;
  if (objc_msgSend(v10, "count"))
  {
    v54 = self;
    objc_msgSend(v11, "uuid");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    obj = v10;
    v12 = 0;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v101;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v101 != v14)
            objc_enumerationMutation(obj);
          v16 = objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * i), "cplType");
          +[PLInternalResource originalCPLResourceTypesForMaster](PLInternalResource, "originalCPLResourceTypesForMaster");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "containsObject:", v18);

          if (v19)
            objc_msgSend(v11, "rm_cplMasterResourceForResourceType:", v16);
          else
            objc_msgSend(v11, "rm_cplResourceForResourceType:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setObject:forKeyedSubscript:", v20, v21);

            objc_msgSend(v20, "identity");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "fileSize");

            v12 += v23;
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
      }
      while (v13);
    }

    v24 = objc_msgSend(v62, "count");
    if (v24 >= objc_msgSend(obj, "count"))
    {
      v31 = -[PLVolumeInfo availableSpace](v54->_volumeInfo, "availableSpace");
      v32 = -[PLVolumeInfo nearLowDiskThreshold](v54->_volumeInfo, "nearLowDiskThreshold");
      v33 = v31 - v12;
      if (v31 - v12 < v32
        || (v34 = v54->_totalDownloadedResourceBytes) != 0 && v34 + v12 >= v54->_resourceDownloadBytesLimit)
      {
        PLBackendGetLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          totalDownloadedResourceBytes = (uint64_t (*)(uint64_t, uint64_t))v54->_totalDownloadedResourceBytes;
          resourceDownloadBytesLimit = v54->_resourceDownloadBytesLimit;
          v50 = CFSTR("no");
          if (v33 < v32)
            v50 = CFSTR("yes");
          *(_DWORD *)buf = 138544386;
          *(_QWORD *)&buf[4] = v58;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v12;
          *(_WORD *)&buf[22] = 2048;
          v114 = totalDownloadedResourceBytes;
          *(_WORD *)v115 = 2048;
          *(_QWORD *)&v115[2] = resourceDownloadBytesLimit;
          *(_WORD *)&v115[10] = 2114;
          *(_QWORD *)&v115[12] = v50;
          _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_DEFAULT, "Recovery manager exceeded resource download limit for asset %{public}@, resourcesBytesToDownload: %lu, totalDownloadedResourceBytes: %lu, resourceDownloadBytesLimit: %lu, availableSpaceBelowNearLowThreshold: %{public}@", buf, 0x34u);
        }

        v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PLManagedAssetRecoveryManager"), 1, 0);
        -[PLManagedAssetRecoveryManager workQueue](v54, "workQueue");
        v52 = objc_claimAutoreleasedReturnValue();
        v94[0] = MEMORY[0x1E0C809B0];
        v94[1] = 3221225472;
        v94[2] = __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_122;
        v94[3] = &unk_1E3675C58;
        v96 = v56;
        v95 = v51;
        v53 = v51;
        dispatch_async(v52, v94);

      }
      else
      {
        v92[0] = 0;
        v92[1] = v92;
        v92[2] = 0x2020000000;
        v93 = 1;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v114 = __Block_byref_object_copy__56992;
        *(_QWORD *)v115 = __Block_byref_object_dispose__56993;
        *(_QWORD *)&v115[8] = 0;
        v90[0] = 0;
        v90[1] = v90;
        v90[2] = 0x2020000000;
        v91 = 0;
        v89[0] = 0;
        v89[1] = v89;
        v89[2] = 0x2020000000;
        v89[3] = 0;
        v35 = dispatch_group_create();
        v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11458]), "initWithIntent:priority:", 4, 2);
        PLBackendGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = objc_msgSend(obj, "count");
          *(_DWORD *)v107 = 134218498;
          v108 = v37;
          v109 = 2114;
          v110 = v58;
          v111 = 2114;
          v112 = v62;
          _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "Downloading %lu resources for asset: %{public}@, resources: %{public}@", v107, 0x20u);
        }

        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        objc_msgSend(v62, "allValues");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v85, v106, 16);
        v40 = MEMORY[0x1E0C809B0];
        if (v39)
        {
          v41 = *(_QWORD *)v86;
          obja = v38;
          do
          {
            for (j = 0; j != v39; ++j)
            {
              if (*(_QWORD *)v86 != v41)
                objc_enumerationMutation(obja);
              v43 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j);
              dispatch_group_enter(v35);
              v80[0] = v40;
              v80[1] = 3221225472;
              v80[2] = __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_124;
              v80[3] = &unk_1E366D3A8;
              v44 = v58;
              v81 = v44;
              v83 = v92;
              v84 = buf;
              v45 = v35;
              v82 = v45;
              v72[0] = v40;
              v72[1] = 3221225472;
              v72[2] = __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_127;
              v72[3] = &unk_1E366D3D0;
              v73 = v44;
              v76 = v92;
              v77 = buf;
              v78 = v90;
              v79 = v89;
              v74 = v62;
              v75 = v45;
              objc_msgSend(v59, "downloadResource:options:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:", v43, v57, 0, 0, v80, 0, v72);

            }
            v38 = obja;
            v39 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v85, v106, 16);
          }
          while (v39);
        }

        -[PLManagedAssetRecoveryManager workQueue](v54, "workQueue");
        v46 = objc_claimAutoreleasedReturnValue();
        v64[0] = v40;
        v64[1] = 3221225472;
        v64[2] = __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_129;
        v64[3] = &unk_1E366D3F8;
        v68 = v90;
        v69 = v89;
        v70 = v92;
        v71 = buf;
        v65 = v58;
        v66 = v54;
        v67 = v56;
        dispatch_group_notify(v35, v46, v64);

        _Block_object_dispose(v89, 8);
        _Block_object_dispose(v90, 8);
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(v92, 8);
      }
    }
    else
    {
      PLBackendGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v58;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Recovery manager download failed to create CPLResources for all requested resources for asset: %{public}@", buf, 0xCu);
      }

      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PLManagedAssetRecoveryManager"), 3, 0);
      -[PLManagedAssetRecoveryManager workQueue](v54, "workQueue");
      v27 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_117;
      block[3] = &unk_1E3675C58;
      v99 = v56;
      v98 = v26;
      v28 = v26;
      dispatch_async(v27, block);

    }
    v30 = v58;
  }
  else
  {
    -[PLManagedAssetRecoveryManager workQueue](self, "workQueue");
    v29 = objc_claimAutoreleasedReturnValue();
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke;
    v104[3] = &unk_1E3676CD8;
    v105 = v56;
    dispatch_async(v29, v104);

    v30 = v105;
  }

}

- (void)_fixDimensionsForAsset:(id)a3 cloudPhotoLibraryManager:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  _QWORD v22[4];
  void (**v23)(_QWORD);
  id v24;
  _QWORD v25[4];
  id v26;
  PLManagedAssetRecoveryManager *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v37;
  char v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackendGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to fix image dimensions for the asset: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x2020000000;
  v38 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke;
  v31[3] = &unk_1E366D448;
  v14 = v8;
  v32 = v14;
  p_buf = &buf;
  v15 = v11;
  v33 = v15;
  v34 = v10;
  v16 = (void *)MEMORY[0x19AEC174C](v31);
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_130;
  v25[3] = &unk_1E3676240;
  v17 = v14;
  v26 = v17;
  v18 = v16;
  v30 = v18;
  v27 = self;
  v19 = v9;
  v28 = v19;
  v20 = v15;
  v29 = v20;
  v21 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v25);
  if (objc_msgSend(v17, "originalWidth") && objc_msgSend(v17, "originalHeight"))
  {
    v21[2](v21);
  }
  else
  {
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_132;
    v22[3] = &unk_1E366D470;
    v23 = v21;
    v24 = v18;
    -[PLManagedAssetRecoveryManager _fixOriginalAssetDimensionsForAsset:cloudPhotoLibraryManager:completionBlock:](self, "_fixOriginalAssetDimensionsForAsset:cloudPhotoLibraryManager:completionBlock:", v17, v19, v22);

  }
  _Block_object_dispose(&buf, 8);

}

- (void)_fixOriginalAssetDimensionsForAsset:(id)a3 cloudPhotoLibraryManager:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke;
  v34[3] = &unk_1E36779C0;
  v13 = v8;
  v35 = v13;
  v14 = v11;
  v36 = v14;
  v37 = v10;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v34);
  objc_msgSend(v13, "imageProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v13, "setOriginalSizeAndOrientationFromImageProperties:", v16);
    v15[2](v15, 1, 0);
  }
  else
  {
    objc_msgSend(v13, "masterResourceForCPLType:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = objc_msgSend(v17, "unorientedWidth");
      v20 = objc_msgSend(v18, "unorientedHeight");
      if (v19 && (v21 = v20) != 0)
      {
        objc_msgSend(v13, "setOriginalWidth:", v19);
        objc_msgSend(v13, "setOriginalHeight:", v21);
        v15[2](v15, 1, 0);
      }
      else if (objc_msgSend(v18, "isLocallyAvailable")
             && (objc_msgSend(v18, "fileURL"), v23 = (void *)objc_claimAutoreleasedReturnValue(), v23, v23))
      {
        objc_msgSend(v18, "fileURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedAsset sizeOfImageAtURL:outOrientation:](PLManagedAsset, "sizeOfImageAtURL:outOrientation:", v24, 0);
        v26 = v25;
        objc_msgSend(v13, "setOriginalWidth:", (uint64_t)v27);
        objc_msgSend(v13, "setOriginalHeight:", (uint64_t)v26);
        v15[2](v15, 1, 0);

      }
      else
      {
        v40[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v12;
        v29[1] = 3221225472;
        v29[2] = __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2_134;
        v29[3] = &unk_1E366D498;
        v30 = v13;
        v31 = v18;
        v33 = v15;
        v32 = v14;
        -[PLManagedAssetRecoveryManager _downloadResources:forAsset:usingCloudPhotoLibraryManager:completionHandler:](self, "_downloadResources:forAsset:usingCloudPhotoLibraryManager:completionHandler:", v28, v30, v9, v29);

      }
    }
    else
    {
      PLBackendGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v14;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Original cloud resource is not available for asset: %{public}@", buf, 0xCu);
      }

      v15[2](v15, 0, 0);
    }

  }
}

- (BOOL)_fixRawUTIForAsset:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniformTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset preferredFileExtensionForType:](PLManagedAsset, "preferredFileExtensionForType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "filename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v5;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Fixing wrong file extension for RAW asset: %{public}@. Changing extension from %{public}@ to %{public}@", buf, 0x20u);

  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "filename");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByDeletingPathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilename:", v14);

  return 1;
}

- (void)_fixIrisWithZeroVideoComplementDuration:(id)a3 cloudPhotoLibraryManager:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _BOOL8, id);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  _BOOL4 v20;
  _BOOL8 v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  PLManagedAssetRecoveryManager *v29;
  id v30;
  void (**v31)(id, _BOOL8, id);
  void *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _BOOL8, id))a5;
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackendGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v11;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Fixing live photo with zero length videoCpDurationValue for asset: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v8, "masterResourceForCPLType:", 18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "cplFileURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "fileExistsAtPath:", v16);

    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if ((v18 & 1) != 0)
    {
      if (v20)
      {
        *(_DWORD *)buf = 138543362;
        v34 = v11;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Fixing video complement locally for asset: %{public}@", buf, 0xCu);
      }

      v25 = 0;
      v21 = -[PLManagedAssetRecoveryManager _fixIrisWithZeroVideoComplementDuration:usingExistingVideoComplementAtPath:error:](self, "_fixIrisWithZeroVideoComplementDuration:usingExistingVideoComplementAtPath:error:", v8, v16, &v25);
      v22 = v25;
      v10[2](v10, v21, v22);
    }
    else
    {
      if (v20)
      {
        *(_DWORD *)buf = 138543362;
        v34 = v11;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Downloading original video complement for asset: %{public}@", buf, 0xCu);
      }

      v32 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __114__PLManagedAssetRecoveryManager__fixIrisWithZeroVideoComplementDuration_cloudPhotoLibraryManager_completionBlock___block_invoke;
      v26[3] = &unk_1E366D4C0;
      v27 = v8;
      v28 = v11;
      v29 = self;
      v30 = v16;
      v31 = v10;
      -[PLManagedAssetRecoveryManager _downloadResources:forAsset:usingCloudPhotoLibraryManager:completionHandler:](self, "_downloadResources:forAsset:usingCloudPhotoLibraryManager:completionHandler:", v24, v27, v9, v26);

      v22 = v27;
    }

  }
  else
  {
    PLBackendGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v11;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Original video complement cloud resource is not available for asset: %{public}@", buf, 0xCu);
    }

    v10[2](v10, 0, 0);
  }

}

- (BOOL)_fixIrisWithZeroVideoComplementDuration:(id)a3 usingExistingVideoComplementAtPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v21[3];
  _QWORD v22[3];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackendGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v10;
    v27 = 2114;
    v28 = v9;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Getting live photo photo metadata: %{public}@ url: %{public}@", buf, 0x16u);
  }

  v24 = 0;
  v12 = *MEMORY[0x1E0C99998];
  v23 = 0;
  v13 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v24, v12, &v23);
  v14 = v24;
  v15 = v23;
  if (v13)
  {
    PFVideoComplementMetadataForVideoAtPath();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pairingIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v16, "videoDuration");
      objc_msgSend(v16, "imageDisplayTime");
    }
    else
    {
      memset(v22, 0, sizeof(v22));
      memset(v21, 0, sizeof(v21));
    }
    objc_msgSend(v7, "updatePhotoIrisMetadataWithMediaGroupUUID:videoDuration:stillDisplayTime:", v17, v22, v21);

    objc_msgSend(v7, "persistMetadataToFilesystem");
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Live photo metadata is fixed using the attributes of the original video complement: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v10;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to read the file size of the video complement: %{public}@ %@", buf, 0x16u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v15);
  }

  return v13;
}

- (void)_performTransactionOnLibrary:(id)a3 withObjectID:(id)a4 usingBlock:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  PLManagedAssetRecoveryManager *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[PLManagedAssetRecoveryManager workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PLManagedAssetRecoveryManager__performTransactionOnLibrary_withObjectID_usingBlock_completionBlock___block_invoke;
  block[3] = &unk_1E366D4E8;
  v20 = v10;
  v21 = self;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)_fixMissingFullSizeAdjustedResources:(id)a3 cloudPhotoLibraryManager:(id)a4 recoveryState:(unint64_t)a5 usingSyncableLibrary:(id)a6 completionBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  uint8_t buf[4];
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedAssetRecoveryManager.m"), 824, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncableLibrary"));

  }
  objc_msgSend(v13, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 0x40000000)
  {
    if (objc_msgSend(v13, "deferredProcessingNeeded") == 9)
    {
      v69 = 0;
      v18 = objc_msgSend(v13, "renderableAdjustmentDictionary:error:", 0, &v69);
      v19 = v69;
      v20 = v19;
      if ((v18 & 1) != 0)
      {
        v49 = v19;
        PLBackendGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v71 = v17;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Generating un-rendered deferred adjustment resources for asset: %{public}@", buf, 0xCu);
        }
        v22 = v16;

        +[PLResourceGenerator expectedLocalResourceRecipesForAsset:versions:](PLResourceGenerator, "expectedLocalResourceRecipesForAsset:versions:", v13, &unk_1E3763D28);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count"))
        {
          v24 = v17;
          v25 = v14;
          objc_msgSend(v23, "array");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "_pl_map:", &__block_literal_global_155);
          v27 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "persistedAdjustedResources");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)v27;
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d AND %K IN %@"), CFSTR("remoteAvailability"), 1, CFSTR("recipeID"), v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "filteredSetUsingPredicate:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = objc_msgSend(v30, "count");
          if (v31 == objc_msgSend(v23, "count"))
          {
            v55[0] = MEMORY[0x1E0C809B0];
            v55[1] = 3221225472;
            v55[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_2;
            v55[3] = &unk_1E366D5A8;
            v55[4] = self;
            v56 = v13;
            v57 = v30;
            v17 = v24;
            v58 = v24;
            v59 = v15;
            v62 = v22;
            v60 = v23;
            v61 = v25;
            v63 = 0x40000000;
            objc_msgSend(v61, "fetchResourcesForAsset:completionHandler:", v56, v55);

          }
          else
          {
            -[PLManagedAssetRecoveryManager _generateMissingFullSizeAdjustedResourcesForAsset:recipesToGenerate:cloudPhotoLibraryManager:recoveryState:usingSyncableLibrary:completionBlock:](self, "_generateMissingFullSizeAdjustedResourcesForAsset:recipesToGenerate:cloudPhotoLibraryManager:recoveryState:usingSyncableLibrary:completionBlock:", v13, v23, v25, 0x40000000, v15, v22);
            v17 = v24;
          }

          v14 = v25;
          v16 = v22;
          v46 = v48;
        }
        else
        {
          objc_msgSend(v13, "objectID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = MEMORY[0x1E0C809B0];
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_169;
          v53[3] = &unk_1E366D558;
          v54 = v17;
          v51[0] = v45;
          v51[1] = 3221225472;
          v51[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_170;
          v51[3] = &unk_1E3676CD8;
          v16 = v22;
          v52 = v22;
          -[PLManagedAssetRecoveryManager _performTransactionOnLibrary:withObjectID:usingBlock:completionBlock:](self, "_performTransactionOnLibrary:withObjectID:usingBlock:completionBlock:", v15, v44, v53, v51);

          v46 = v54;
        }

        v20 = v49;
      }
      else
      {
        objc_msgSend(v13, "objectID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v15;
        v42 = v16;
        v43 = MEMORY[0x1E0C809B0];
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke;
        v66[3] = &unk_1E366D510;
        v67 = v17;
        v68 = v20;
        v64[0] = v43;
        v16 = v42;
        v15 = v41;
        v64[1] = 3221225472;
        v64[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_151;
        v64[3] = &unk_1E3676CD8;
        v65 = v16;
        -[PLManagedAssetRecoveryManager _performTransactionOnLibrary:withObjectID:usingBlock:completionBlock:](self, "_performTransactionOnLibrary:withObjectID:usingBlock:completionBlock:", v41, v40, v66, v64);

        v23 = v67;
      }

    }
    else
    {
      PLBackendGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v71 = v17;
        _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEFAULT, "Deferred processing state no longer AdjustmentFailure, skipping repair for asset: %{public}@", buf, 0xCu);
      }

      (*((void (**)(id, uint64_t, _QWORD))v16 + 2))(v16, 1, 0);
    }
  }
  else
  {
    v50 = v15;
    v32 = v16;
    PLBackendGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v71 = v17;
      _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "Generating missing full size render resources for asset: %{public}@", buf, 0xCu);
    }
    v34 = v17;

    +[PLResourceGenerator expectedLocalResourceRecipesForAsset:versions:](PLResourceGenerator, "expectedLocalResourceRecipesForAsset:versions:", v13, &unk_1E3763D28);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3763D28);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLResourceGenerator locallyUnavailableRecipesFromRecipes:versions:asset:](PLResourceGenerator, "locallyUnavailableRecipesFromRecipes:versions:asset:", v35, v36, v13);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v37, "count"))
    {
      v16 = v32;
      v15 = v50;
      -[PLManagedAssetRecoveryManager _generateMissingFullSizeAdjustedResourcesForAsset:recipesToGenerate:cloudPhotoLibraryManager:recoveryState:usingSyncableLibrary:completionBlock:](self, "_generateMissingFullSizeAdjustedResourcesForAsset:recipesToGenerate:cloudPhotoLibraryManager:recoveryState:usingSyncableLibrary:completionBlock:", v13, v37, v14, a5);
    }
    else
    {
      PLBackendGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      v16 = v32;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v71 = v34;
        _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "No non-local recipes to generate, skipping repair for asset: %{public}@", buf, 0xCu);
      }

      (*((void (**)(id, uint64_t, _QWORD))v32 + 2))(v32, 1, 0);
      v15 = v50;
    }

    v17 = v34;
  }

}

- (void)_generateMissingFullSizeAdjustedResourcesForAsset:(id)a3 recipesToGenerate:(id)a4 cloudPhotoLibraryManager:(id)a5 recoveryState:(unint64_t)a6 usingSyncableLibrary:(id)a7 completionBlock:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v38;
  _QWORD v39[4];
  id v40;
  PLManagedAssetRecoveryManager *v41;
  id v42;
  id v43;
  id v44;
  unint64_t v45;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v38 = a5;
  v15 = a7;
  v36 = a8;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v49 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "chooseIngredientsFrom:version:", v13, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v16, "addEntriesFromDictionary:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v19);
  }
  v23 = v15;

  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke;
  v46[3] = &unk_1E366D5D0;
  v47 = v24;
  v35 = v24;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v46);
  objc_msgSend(v13, "objectID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackendGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v16, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v53 = v28;
    v54 = 2114;
    v55 = v17;
    v56 = 2114;
    v57 = v26;
    _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Attempting to download non-locally available ingredients: %{public}@ for missing recipes: %{public}@ for asset: %{public}@", buf, 0x20u);

  }
  if (a6 == 0x40000000)
  {
    v29 = v23;
  }
  else
  {
    objc_msgSend(v13, "photoLibrary");
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_173;
  v39[3] = &unk_1E366D620;
  v40 = v29;
  v41 = self;
  v42 = v25;
  v43 = v26;
  v44 = v36;
  v45 = a6;
  v31 = v36;
  v32 = v26;
  v33 = v25;
  v34 = v30;
  -[PLManagedAssetRecoveryManager _downloadResources:forAsset:usingCloudPhotoLibraryManager:completionHandler:](self, "_downloadResources:forAsset:usingCloudPhotoLibraryManager:completionHandler:", v35, v13, v38, v39);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_videoClient, 0);
  objc_storeStrong((id *)&self->_imageClient, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
  objc_storeStrong((id *)&self->_recoveryErrors, 0);
  objc_storeStrong((id *)&self->_volumeInfo, 0);
}

void __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((int)objc_msgSend(v4, "localAvailability") <= 0 && objc_msgSend(v4, "cplType"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_173(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  if (a2)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_2;
    v9[3] = &unk_1E366D5F8;
    v6 = *(void **)(a1 + 32);
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 72);
    v11 = v7;
    v15 = v8;
    v12 = *(id *)(a1 + 56);
    v14 = &v16;
    v13 = *(id *)(a1 + 64);
    objc_msgSend(v6, "performBlockAndWait:", v9);
    if (*((_BYTE *)v17 + 24))
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_loadObjectWithObjectID:managedObjectContext:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      v13 = "Skipping resource generation for deleted asset: %{public}@";
LABEL_11:
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
    }
LABEL_12:

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    goto LABEL_13;
  }
  v6 = CFSTR("Recovery resource generation for missing full size resources for asset: %@");
  if (*(_QWORD *)(a1 + 80) == 0x40000000)
  {
    if (objc_msgSend(v5, "deferredProcessingNeeded") == 9)
    {
      if (*(_QWORD *)(a1 + 80) == 0x40000000)
        v6 = CFSTR("Recovery resource generation for deferred repair adjustment failure for asset: %@");
      goto LABEL_6;
    }
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      v13 = "Deferred processing state no longer AdjustmentFailure, skipping repair for asset: %{public}@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_178;
  v15[3] = &unk_1E36779C0;
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  v10 = (id)objc_msgSend(v5, "generateDeferredAdjustmentWithImageConversionClient:videoConversionClient:reason:allowCancellationByService:completion:", v8, v9, v7, 0, v15);

LABEL_13:
}

void __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_178(id *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(a1[4], "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_2_179;
  v8[3] = &unk_1E36755F8;
  v12 = a2;
  v9 = v5;
  v10 = a1[5];
  v11 = a1[6];
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __177__PLManagedAssetRecoveryManager__generateMissingFullSizeAdjustedResourcesForAsset_recipesToGenerate_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_2_179(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 56) && !PLIsErrorEqualToCode())
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 32));
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Finished generating full size render resources for asset: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Resetting deferredProcessingNeeded to None for asset %{public}@ because the adjustment isn't supported, error: %@ ", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(v3, "setDeferredProcessingNeeded:", 0);
}

uint64_t __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_151(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_3;
  block[3] = &unk_1E366D580;
  v15 = *(id *)(a1 + 40);
  v16 = v5;
  v17 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 32);
  v18 = v8;
  v19 = v9;
  v20 = *(id *)(a1 + 64);
  v24 = *(id *)(a1 + 88);
  v21 = v6;
  v22 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 80);
  v11 = *(_QWORD *)(a1 + 96);
  v23 = v10;
  v25 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v7, block);

}

void __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_169(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Resetting deferredProcessingNeeded to None for asset %{public}@ because there are no required adjusted recipes for this asset", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(v3, "setDeferredProcessingNeeded:", 0);
}

uint64_t __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_170(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_4;
  v8[3] = &unk_1E366D580;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(void **)(a1 + 72);
  v11 = v3;
  v12 = v4;
  v13 = v5;
  v14 = *(id *)(a1 + 32);
  v18 = *(id *)(a1 + 104);
  v15 = *(id *)(a1 + 80);
  v16 = *(id *)(a1 + 88);
  v6 = *(id *)(a1 + 96);
  v7 = *(_QWORD *)(a1 + 112);
  v17 = v6;
  v19 = v7;
  objc_msgSend(v2, "performBlockAndWait:", v8);

}

void __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v2)
  {
    v3 = v2;
    v28 = 0;
    v4 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v34 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("dataStoreSubtype"), objc_msgSend(v6, "resourceType"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "filteredSetUsingPredicate:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "anyObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v10, "fingerprint");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "fingerPrint");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v11, "isEqualToString:", v13);

          if (v14)
          {
            ++v28;
          }
          else
          {
            PLBackendGetLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "fingerprint");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "identity");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "fingerPrint");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 138543874;
              v38 = v16;
              v39 = 2114;
              v40 = v18;
              v41 = 2114;
              v42 = v19;
              _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Adjusted resource fingerprint %{public}@ does not match CPL resource fingerprint %{public}@ for asset %{public}@, generating instead", buf, 0x20u);

            }
          }
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v3);
  }
  else
  {
    v28 = 0;
  }

  if (v28 == objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v20 = *(void **)(a1 + 56);
    v21 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 72), "objectID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_166;
    v31[3] = &unk_1E366D558;
    v32 = *(id *)(a1 + 48);
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_167;
    v29[3] = &unk_1E3676CD8;
    v30 = *(id *)(a1 + 104);
    objc_msgSend(v20, "_performTransactionOnLibrary:withObjectID:usingBlock:completionBlock:", v21, v22, v31, v29);

  }
  else
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      PLBackendGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = *(void **)(a1 + 48);
        v26 = *(void **)(a1 + 80);
        *(_DWORD *)buf = 138543618;
        v38 = v25;
        v39 = 2112;
        v40 = v26;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Error fetching CPL resources for asset %{public}@, generating instead, error: %@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 56), "_generateMissingFullSizeAdjustedResourcesForAsset:recipesToGenerate:cloudPhotoLibraryManager:recoveryState:usingSyncableLibrary:completionBlock:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 104));
  }
}

void __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_166(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Resetting deferredProcessingNeeded to None for asset %{public}@ because all required full size renders are available for download from CPL", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(v3, "setDeferredProcessingNeeded:", 0);
}

uint64_t __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_167(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __146__PLManagedAssetRecoveryManager__fixMissingFullSizeAdjustedResources_cloudPhotoLibraryManager_recoveryState_usingSyncableLibrary_completionBlock___block_invoke_153(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a2, "recipeID"));
}

void __102__PLManagedAssetRecoveryManager__performTransactionOnLibrary_withObjectID_usingBlock_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__PLManagedAssetRecoveryManager__performTransactionOnLibrary_withObjectID_usingBlock_completionBlock___block_invoke_2;
  v7[3] = &unk_1E3671878;
  v2 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "performTransactionAndWait:", v7);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v3, v4, v5, v6);

}

void __102__PLManagedAssetRecoveryManager__performTransactionOnLibrary_withObjectID_usingBlock_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_loadObjectWithObjectID:managedObjectContext:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Not performing recovery manager transaction on deleted object: %{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
}

void __114__PLManagedAssetRecoveryManager__fixIrisWithZeroVideoComplementDuration_cloudPhotoLibraryManager_completionBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  _BYTE *v18;
  _QWORD v19[3];
  char v20;
  _BYTE buf[24];
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v20 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v22 = __Block_byref_object_copy__56992;
    v23 = __Block_byref_object_dispose__56993;
    v24 = 0;
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __114__PLManagedAssetRecoveryManager__fixIrisWithZeroVideoComplementDuration_cloudPhotoLibraryManager_completionBlock___block_invoke_2;
    v11[3] = &unk_1E3677880;
    v7 = *(id *)(a1 + 40);
    v17 = v19;
    v8 = *(_QWORD *)(a1 + 48);
    v12 = v7;
    v13 = v8;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 56);
    v18 = buf;
    v16 = *(id *)(a1 + 64);
    objc_msgSend(v6, "performBlockAndWait:", v11);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v19, 8);
  }
  else
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to download original video complement for asset: %{public}@ with error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __114__PLManagedAssetRecoveryManager__fixIrisWithZeroVideoComplementDuration_cloudPhotoLibraryManager_completionBlock___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id obj;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Downloaded original video complement for asset: %{public}@", buf, 0xCu);
  }

  v4 = (void *)a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = *(_QWORD *)(a1[10] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v4, "_fixIrisWithZeroVideoComplementDuration:usingExistingVideoComplementAtPath:error:", v5, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = v8;
  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

void __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[3];
  char v17;

  v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  objc_msgSend(a1[4], "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2;
  v12[3] = &unk_1E3676EA0;
  v15 = v16;
  v13 = a1[4];
  v14 = a1[5];
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_133;
  v8[3] = &unk_1E3676F20;
  v10 = a1[6];
  v11 = v16;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "performTransactionAndWait:completionHandler:", v12, v8);

  _Block_object_dispose(v16, 8);
}

void __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2_134(id *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a1[4], "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_3;
    v9[3] = &unk_1E3676240;
    v10 = a1[5];
    v11 = a1[4];
    v14 = a1[7];
    v12 = a1[6];
    v13 = v5;
    objc_msgSend(v6, "performBlockAndWait:", v9);

  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[6];
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to download original CPL resource for asset: %{public}@ error: %@", buf, 0x16u);
    }

    (*((void (**)(void))a1[7] + 2))();
  }

}

void __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  void (*v6)(void);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[PLManagedAsset sizeOfImageAtURL:outOrientation:](PLManagedAsset, "sizeOfImageAtURL:outOrientation:", v2, 0);
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "setOriginalWidth:", (uint64_t)v5);
    objc_msgSend(*(id *)(a1 + 40), "setOriginalHeight:", (uint64_t)v4);
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to download original CPL resource for asset: %{public}@ error: %@", (uint8_t *)&v10, 0x16u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  v6();

}

void __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2(uint64_t a1)
{
  BOOL v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "originalWidth"))
    v2 = objc_msgSend(*(id *)(a1 + 32), "originalHeight") != 0;
  else
    v2 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v11 = 138543362;
      v12 = v6;
      v7 = "Fixed original image dimensions for the asset: %{public}@";
      v8 = v5;
      v9 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      _os_log_impl(&dword_199541000, v8, v9, v7, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138543362;
    v12 = v10;
    v7 = "Failed to fix original image dimensions for the asset: %{public}@";
    v8 = v5;
    v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_9;
  }

}

uint64_t __110__PLManagedAssetRecoveryManager__fixOriginalAssetDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_133(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), a1[4]);
}

void __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2;
  v8[3] = &unk_1E366D420;
  v13 = *(_QWORD *)(a1 + 56);
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v11 = v4;
  v12 = v6;
  v7 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v8);

}

void __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_130(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hasAdjustments");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "assetResourceForCPLType:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
    {
      PLBackendGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        v28 = v15;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "JPEGFull resource not available for asset %{public}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      goto LABEL_23;
    }
    v6 = objc_msgSend(v4, "unorientedWidth");
    v7 = objc_msgSend(v5, "unorientedHeight");
    objc_msgSend(v5, "cplFileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "setWidth:", v6);
      objc_msgSend(*(id *)(a1 + 32), "setHeight:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "fileExistsAtPath:", v17);

      if (!v18)
      {
        v19 = *(void **)(a1 + 40);
        v29[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(a1 + 32);
        v22 = *(_QWORD *)(a1 + 48);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2_131;
        v23[3] = &unk_1E36779C0;
        v24 = v21;
        v25 = v8;
        v26 = *(id *)(a1 + 64);
        objc_msgSend(v19, "_downloadResources:forAsset:usingCloudPhotoLibraryManager:completionHandler:", v20, v24, v22, v23);

        goto LABEL_22;
      }
      +[PLManagedAsset sizeOfImageAtURL:outOrientation:](PLManagedAsset, "sizeOfImageAtURL:outOrientation:", v8, 0);
      objc_msgSend(*(id *)(a1 + 32), "setImageSize:");
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_22:

LABEL_23:
    return;
  }
  if (objc_msgSend(v3, "originalWidth") && objc_msgSend(*(id *)(a1 + 32), "originalHeight"))
  {
    v9 = (double)objc_msgSend(*(id *)(a1 + 32), "originalWidth");
    v10 = (double)objc_msgSend(*(id *)(a1 + 32), "originalHeight");
    v11 = (int)objc_msgSend(*(id *)(a1 + 32), "originalOrientation") - 5;
    if (v11 >= 4)
      v12 = v9;
    else
      v12 = v10;
    if (v11 >= 4)
      v13 = v10;
    else
      v13 = v9;
    objc_msgSend(*(id *)(a1 + 32), "setImageSize:", v12, v13);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 1, 0);
  }
}

uint64_t __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_132(uint64_t a1, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2_131(id *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a1[4], "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_3;
    v8[3] = &unk_1E3676290;
    v9 = a1[5];
    v10 = a1[4];
    v11 = a1[6];
    objc_msgSend(v6, "performBlockAndWait:", v8);

  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to download CPLResourceTypeJPEGFullSize resource: %@", buf, 0xCu);
    }

    (*((void (**)(void))a1[6] + 2))();
  }

}

uint64_t __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_3(uint64_t a1)
{
  +[PLManagedAsset sizeOfImageAtURL:outOrientation:](PLManagedAsset, "sizeOfImageAtURL:outOrientation:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 40), "setImageSize:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __97__PLManagedAssetRecoveryManager__fixDimensionsForAsset_cloudPhotoLibraryManager_completionBlock___block_invoke_2(uint64_t a1)
{
  BOOL v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "width"))
    v2 = objc_msgSend(*(id *)(a1 + 32), "height") != 0;
  else
    v2 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v2;
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v10 = 138543362;
      v11 = v6;
      v7 = "Fixed image dimensions for the asset: %{public}@";
LABEL_9:
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v5)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v10 = 138543362;
    v11 = v8;
    v7 = "Failed to fix image dimensions for the asset: %{public}@";
    goto LABEL_9;
  }

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
}

uint64_t __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_117(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_124(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v18 = v8;
      v19 = 2112;
      v20 = v6;
      v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to download resource (%@) for asset recovery: %@. Asset: %{public}@ ", buf, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v15 = *MEMORY[0x1E0CB3388];
      v16 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("PLManagedAssetRecoveryManager"), 3, v11);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_127(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v27 = v13;
      v28 = 2112;
      v29 = v11;
      v30 = 2114;
      v31 = v14;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to download resource (%@) for asset recovery: %@. Asset: %{public}@ ", buf, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v24 = *MEMORY[0x1E0CB3388];
      v25 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("PLManagedAssetRecoveryManager"), 3, v16);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
  }
  else
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v20 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) += objc_msgSend(v23, "fileSize");

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __109__PLManagedAssetRecoveryManager__downloadResources_forAsset_usingCloudPhotoLibraryManager_completionHandler___block_invoke_129(_QWORD *a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v4 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
    v5 = a1[4];
    v10 = 67109634;
    *(_DWORD *)v11 = v3;
    *(_WORD *)&v11[4] = 2048;
    *(_QWORD *)&v11[6] = v4;
    *(_WORD *)&v11[14] = 2114;
    *(_QWORD *)&v11[16] = v5;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Downloaded %d resources with size %ld for asset %{public}@ as a part of the recovery from inconsistent cloud states", (uint8_t *)&v10, 0x1Cu);
  }

  if (!*(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24))
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      v8 = *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40);
      v10 = 138543618;
      *(_QWORD *)v11 = v7;
      *(_WORD *)&v11[8] = 2112;
      *(_QWORD *)&v11[10] = v8;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Failed to download all CPL resources for asset: %{public}@ error: %@", (uint8_t *)&v10, 0x16u);
    }

  }
  *(_QWORD *)(a1[5] + 32) += *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __147__PLManagedAssetRecoveryManager__performAssetRecoveryTaskForInconsistentState_state_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  char v20;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __147__PLManagedAssetRecoveryManager__performAssetRecoveryTaskForInconsistentState_state_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_2;
  v16[3] = &unk_1E3674EE0;
  v20 = a2;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v17 = v8;
  v19 = v9;
  v18 = v5;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __147__PLManagedAssetRecoveryManager__performAssetRecoveryTaskForInconsistentState_state_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_113;
  v12[3] = &unk_1E3673368;
  v10 = *(id *)(a1 + 40);
  v15 = a2;
  v13 = v18;
  v14 = v10;
  v11 = v18;
  objc_msgSend(v6, "performTransactionAndWait:completionHandler:", v16, v12);

}

void __147__PLManagedAssetRecoveryManager__performAssetRecoveryTaskForInconsistentState_state_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "additionalAttributes");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeCloudRecoveryStateFlag:", *(_QWORD *)(a1 + 48));

  }
  else
  {
    PLBackendGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 40);
      v4 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v8 = v3;
      v9 = 2048;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Asset recovery failed for asset: %{public}@, recovery state: %lld, error: %@", buf, 0x20u);

    }
  }
}

uint64_t __147__PLManagedAssetRecoveryManager__performAssetRecoveryTaskForInconsistentState_state_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_113(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PLManagedAssetRecoveryManager"), 4, 0);
    v8 = v7;
    objc_msgSend(*((id *)a1[4] + 6), "addObject:", v7);

  }
  objc_msgSend(a1[4], "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_2;
  v12[3] = &unk_1E3676D00;
  v10 = a1[5];
  v11 = a1[4];
  v13 = v10;
  v14 = v11;
  v15 = a1[6];
  v16 = a1[7];
  v17 = a1[8];
  v18 = a1[9];
  dispatch_async(v9, v12);

}

void __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "additionalAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = v2;
    objc_msgSend(v2, "setCloudStateRecoveryAttemptsCount:", 0);
    objc_msgSend(v4, "resetCloudRecoveryState");
LABEL_3:
    v2 = v4;
    goto LABEL_7;
  }
  if (!*(_BYTE *)(a1 + 41))
  {
    v4 = v2;
    v3 = (__int16)(objc_msgSend(v2, "cloudStateRecoveryAttemptsCount") + 1);
    objc_msgSend(v4, "setCloudStateRecoveryAttemptsCount:", v3);
    v2 = v4;
    if ((int)v3 >= 10)
    {
      objc_msgSend(v4, "setCloudRecoveryStateFlag:", 0x80000000);
      goto LABEL_3;
    }
  }
LABEL_7:

}

uint64_t __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_3;
  v4[3] = &unk_1E3676D00;
  v3 = *(void **)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v2, "performBlockAndWait:", v4);

}

uint64_t __130__PLManagedAssetRecoveryManager__recoverNextRecoveryState_forAsset_cloudPhotoLibraryManager_usingSyncableLibrary_completionBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recoverNextRecoveryState:forAsset:cloudPhotoLibraryManager:usingSyncableLibrary:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  _QWORD block[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = v6;

  if (a2)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v28 = v10;
      v11 = "Successfully recovered asset: %{public}@";
      v12 = v9;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 12;
LABEL_6:
      _os_log_impl(&dword_199541000, v12, v13, v11, buf, v14);
    }
  }
  else
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v28 = v15;
      v29 = 2112;
      v30 = v5;
      v11 = "Failed to recover the asset %{public}@ with error: %@";
      v12 = v9;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 22;
      goto LABEL_6;
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_108;
  block[3] = &unk_1E366EA20;
  v17 = *(id *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 32);
  v20 = v17;
  v21 = v18;
  v22 = *(id *)(a1 + 56);
  v23 = *(id *)(a1 + 64);
  v24 = *(id *)(a1 + 72);
  v25 = *(id *)(a1 + 80);
  v26 = *(id *)(a1 + 88);
  dispatch_async(v16, block);

}

void __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_111(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_2_112;
  v4[3] = &unk_1E3675A78;
  v3 = *(void **)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "performBlockAndWait:", v4);

}

uint64_t __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v3 + 16);
    v4 = *(_QWORD *)(v3 + 24);
    v7 = 134218240;
    v8 = v5;
    v9 = 2048;
    v10 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Finished recovery of the assets in inconsistent cloud state. Fixed %lu out of %lu assets", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

uint64_t __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_2_112(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recoverNextAssetWithEnumerator:cloudPhotoLibraryManager:transaction:usingNonSyncableLibrary:andSyncableLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_108(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_2;
  v4[3] = &unk_1E3675A78;
  v3 = *(void **)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "performBlockAndWait:", v4);

}

uint64_t __145__PLManagedAssetRecoveryManager__recoverNextAssetWithEnumerator_cloudPhotoLibraryManager_transaction_usingNonSyncableLibrary_andSyncableLibrary___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recoverNextAssetWithEnumerator:cloudPhotoLibraryManager:transaction:usingNonSyncableLibrary:andSyncableLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __138__PLManagedAssetRecoveryManager__setCloudRecoveryState_forAssetsWithFetchRequestPredicate_resultsFilterPredicate_usingNonSyncableLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  const __CFString *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v2 = (void *)MEMORY[0x1E0CB3528];
  +[PLManagedAsset predicateForSupportedAssetTypesForUploadWithoutMomentSharesAndPlaceholders](PLManagedAsset, "predicateForSupportedAssetTypesForUploadWithoutMomentSharesAndPlaceholders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v32[0] = v3;
  v32[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v6);
  objc_msgSend(v9, "setFetchBatchSize:", 100);
  v31 = CFSTR("additionalAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v10);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __138__PLManagedAssetRecoveryManager__setCloudRecoveryState_forAssetsWithFetchRequestPredicate_resultsFilterPredicate_usingNonSyncableLibrary___block_invoke_2;
  v19[3] = &unk_1E366D308;
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v20 = v12;
  v21 = &v23;
  v22 = v13;
  objc_msgSend(v11, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v9, 0, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch assets with error: %@", buf, 0xCu);
    }

  }
  if (v24[3] >= 1)
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)v24[3];
      v18 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134218240;
      v28 = v17;
      v29 = 2048;
      v30 = v18;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Assets: %lu marked with cloudRecoveryState: %lu", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v23, 8);
}

void __138__PLManagedAssetRecoveryManager__setCloudRecoveryState_forAssetsWithFetchRequestPredicate_resultsFilterPredicate_usingNonSyncableLibrary___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)a1[4];
  if (v5)
  {
    if (objc_msgSend(v5, "evaluateWithObject:", v3))
    {
      objc_msgSend(v3, "additionalAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasCloudRecoveryStateFlagSet:", a1[6]);

      if ((v7 & 1) == 0)
      {
        objc_msgSend(v3, "additionalAttributes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setCloudRecoveryStateFlag:", a1[6]);

        v9 = a1 + 5;
        v10 = *(_QWORD *)(a1[5] + 8);
        v11 = *(_QWORD *)(v10 + 24);
        if (v11 <= 24)
        {
          PLBackendGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            goto LABEL_10;
          goto LABEL_11;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
    objc_msgSend(v3, "additionalAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasCloudRecoveryStateFlagSet:", a1[6]);

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v3, "additionalAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCloudRecoveryStateFlag:", a1[6]);

      v9 = a1 + 5;
      v10 = *(_QWORD *)(a1[5] + 8);
      v11 = *(_QWORD *)(v10 + 24);
      if (v11 <= 24)
      {
        PLBackendGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
LABEL_10:
          v16 = a1[6];
          v17 = 138543618;
          v18 = v4;
          v19 = 2048;
          v20 = v16;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "asset: %{public}@ marking with cloudRecoveryState: %llu", (uint8_t *)&v17, 0x16u);
        }
LABEL_11:

        v10 = *(_QWORD *)(*v9 + 8);
        v11 = *(_QWORD *)(v10 + 24);
      }
LABEL_12:
      *(_QWORD *)(v10 + 24) = v11 + 1;
    }
  }

}

void __89__PLManagedAssetRecoveryManager__startRecoveryUsingCloudPhotoLibraryManager_transaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@ && %K < %llu && %K < %d"), CFSTR("additionalAttributes.cloudRecoveryState"), &unk_1E375F738, CFSTR("additionalAttributes.cloudRecoveryState"), 0x80000000, CFSTR("additionalAttributes.cloudStateRecoveryAttemptsCount"), 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("additionalAttributes.cloudRecoveryState"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("additionalAttributes.cloudStateRecoveryAttemptsCount"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v8);

  objc_msgSend(v4, "setResultType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v4, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = objc_msgSend(v10, "count");
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24))
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v10)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v17 = "No assets found to recover";
        v18 = v16;
        v19 = OS_LOG_TYPE_DEFAULT;
        v20 = 2;
LABEL_10:
        _os_log_impl(&dword_199541000, v18, v19, v17, buf, v20);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = (uint64_t)v11;
      v17 = "Failed to fetch assets for recovery: %@";
      v18 = v16;
      v19 = OS_LOG_TYPE_ERROR;
      v20 = 12;
      goto LABEL_10;
    }

    objc_msgSend(*(id *)(a1 + 40), "setState:", 0);
    objc_msgSend(*(id *)(a1 + 56), "stillAlive");
    goto LABEL_12;
  }
  PLBackendGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    v23 = v13;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Starting recovery of %lu assets in inconsistent state.", buf, 0xCu);
  }

  objc_msgSend(v10, "objectEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_recoverNextAssetWithEnumerator:cloudPhotoLibraryManager:transaction:usingNonSyncableLibrary:andSyncableLibrary:", v14, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));

LABEL_12:
}

void __121__PLManagedAssetRecoveryManager_startRecoveryUsingCloudPhotoLibraryManager_transaction_shouldIdentifyInconsistentAssets___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    PLBackendGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Recovery manager already running", v3, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(*(id *)(a1 + 32), "identifyAssetsWithInconsistentCloudState");
    objc_msgSend(*(id *)(a1 + 32), "_startRecoveryUsingCloudPhotoLibraryManager:transaction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

uint64_t __73__PLManagedAssetRecoveryManager_identifyAssetsWithInconsistentCloudState__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD v15[4];
  int v16;

  v2 = a2;
  v3 = objc_msgSend(v2, "isPhoto");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__PLManagedAssetRecoveryManager_identifyAssetsWithInconsistentCloudState__block_invoke_2;
  v15[3] = &__block_descriptor_36_e28_B16__0__PLInternalResource_8l;
  v16 = v3 ^ 1;
  objc_msgSend(v2, "firstPersistedResourceMatching:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v2, "isPhotoIris"))
  {
    objc_msgSend(v2, "firstPersistedResourceMatching:", &__block_literal_global_37);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "fileExistsAtPath:", v11),
          v12,
          (v13 & 1) == 0))
    {
      v8 = 0;
    }

  }
  return v8 ^ 1u;
}

uint64_t __73__PLManagedAssetRecoveryManager_identifyAssetsWithInconsistentCloudState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "resourceType") == *(_DWORD *)(a1 + 32))
    v4 = objc_msgSend(v3, "isAdjustedFullSizeRenderResource");
  else
    v4 = 0;

  return v4;
}

uint64_t __73__PLManagedAssetRecoveryManager_identifyAssetsWithInconsistentCloudState__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "resourceType") == 3 && objc_msgSend(v2, "isAdjustedResource"))
    v3 = objc_msgSend(v2, "isDerivative") ^ 1;
  else
    v3 = 0;

  return v3;
}

id __64__PLManagedAssetRecoveryManager_initWithLibraryServicesManager___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = objc_alloc_init(MEMORY[0x1E0D47BE8]);
  else
    v2 = 0;

  return v2;
}

id __64__PLManagedAssetRecoveryManager_initWithLibraryServicesManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = objc_alloc_init(MEMORY[0x1E0D47C30]);
  else
    v2 = 0;

  return v2;
}

+ (id)_imagesWithZeroWidthHeightPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND %K == 0 AND %K == 0 AND %K == %u"), CFSTR("kind"), 0, CFSTR("width"), CFSTR("height"), CFSTR("deferredProcessingNeeded"), 0);
}

+ (id)_assetsWithJPGFilenameAndRawPrimaryImageResourcePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND %K ENDSWITH[c] '.jpg' AND %K == %u AND SUBQUERY(modernResources, $resource, $resource.resourceType == 0 AND $resource.utiConformanceHint == %d).@count >= 1"), CFSTR("kind"), 0, CFSTR("filename"), CFSTR("deferredProcessingNeeded"), 0, 2);
}

+ (id)_irisesWithZeroVideoCpDuration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND %K == 0 AND %K == %u"), CFSTR("kindSubtype"), 2, CFSTR("videoCpDurationValue"), CFSTR("deferredProcessingNeeded"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[PLManagedAsset predicateForAdjustedAssetsWithKeyPathToAsset:](PLManagedAsset, "predicateForAdjustedAssetsWithKeyPathToAsset:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_predicateForAdjustedAssetsWithMissingResources
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", &unk_1E375F750, &unk_1E375F768, 0);
  objc_msgSend(MEMORY[0x1E0D11440], "imageDerivativeTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

  objc_msgSend(MEMORY[0x1E0D11440], "videoDerivativeTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v4);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@ AND %K != %u AND %K == %u"), CFSTR("kind"), &unk_1E3763CE0, CFSTR("kindSubtype"), 101, CFSTR("deferredProcessingNeeded"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset predicateForAdjustedAssetsWithKeyPathToAsset:](PLManagedAsset, "predicateForAdjustedAssetsWithKeyPathToAsset:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("cloudLocalState"), &unk_1E375F798);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ and SUBQUERY(modernResources, $resource, $resource.dataStoreSubtype == %@ && $resource.remoteAvailability == %@).@count == 0"), CFSTR("kind"), &unk_1E375F780, &unk_1E375F7B0, &unk_1E375F798);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ and SUBQUERY(modernResources, $resource, $resource.dataStoreSubtype in %@ && $resource.remoteAvailability == %@).@count < 2"), CFSTR("kindSubtype"), &unk_1E375F7C8, &unk_1E3763CF8, &unk_1E375F798);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ and SUBQUERY(modernResources, $resource, $resource.dataStoreSubtype == %@ && $resource.remoteAvailability == %@).@count == 0"), CFSTR("kind"), &unk_1E375F798, &unk_1E375F7E0, &unk_1E375F798);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  v19[0] = v7;
  v19[1] = v8;
  v19[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "orPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3528];
  v18[0] = v6;
  v18[1] = v5;
  v18[2] = v17;
  v18[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_predicateForAdjustedAssetsFailedDeferredRendering
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("deferredProcessingNeeded"), &unk_1E375F7F8);
}

@end
