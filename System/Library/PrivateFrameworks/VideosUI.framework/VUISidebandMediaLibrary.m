@implementation VUISidebandMediaLibrary

- (VUISidebandMediaLibrary)initWithManager:(id)a3
{
  id v4;
  VUISidebandLibraryIdentifier *v5;
  VUISidebandMediaLibrary *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  VUIPersistentContainer *v9;
  NSPersistentContainer *persistentContainer;
  void *v11;
  BOOL v12;
  NSObject *v13;
  NSPersistentContainer *v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[4];
  VUISidebandMediaLibrary *v19;
  id v20;
  id location;
  objc_super v22;
  uint8_t buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(VUISidebandLibraryIdentifier);
  v22.receiver = self;
  v22.super_class = (Class)VUISidebandMediaLibrary;
  v6 = -[VUIMediaLibrary initWithIdentifier:type:manager:](&v22, sel_initWithIdentifier_type_manager_, v5, 0, v4);
  if (v6)
  {
    v7 = dispatch_queue_create("Sideband media library serial queue", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    v9 = -[NSPersistentContainer initWithName:]([VUIPersistentContainer alloc], "initWithName:", CFSTR("SidebandLibraryModel"));
    persistentContainer = v6->_persistentContainer;
    v6->_persistentContainer = &v9->super;

    if (!v6->_persistentContainer && os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
      -[VUISidebandMediaLibrary initWithManager:].cold.2();
    objc_initWeak(&location, v6);
    -[NSPersistentContainer persistentStoreDescriptions](v6->_persistentContainer, "persistentStoreDescriptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") == 0;

    v13 = sLogObject_2;
    if (v12)
    {
      v15 = (id)sLogObject_2;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        +[VUIPersistentContainer defaultDirectoryURL](VUIPersistentContainer, "defaultDirectoryURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUISidebandMediaLibrary initWithManager:].cold.1(v16, buf, v15);
      }

    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Loading persistent store", buf, 2u);
      }
      v14 = v6->_persistentContainer;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __43__VUISidebandMediaLibrary_initWithManager___block_invoke;
      v18[3] = &unk_1E9F9A508;
      objc_copyWeak(&v20, &location);
      v19 = v6;
      -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](v14, "loadPersistentStoresWithCompletionHandler:", v18);

      objc_destroyWeak(&v20);
    }
    objc_destroyWeak(&location);
  }

  return v6;
}

void __76__VUISidebandMediaLibrary__migrateVideoExpirationDateAndAllowsManualRenewal__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__VUISidebandMediaLibrary__downloadedVideosForNonSignedInUsers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__VUISidebandMediaLibrary__videosMarkedAsDeleted__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__VUISidebandMediaLibrary_allFpsKeyDeletionInfos__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __90__VUISidebandMediaLibrary_videosWithDownloadStates_entitlementTypes_useMainThreadContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setBackgroundManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundManagedObjectContext, a3);
}

void __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  if (!objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_27;
  }
  objc_msgSend(*(id *)(a1 + 64), "_mainContextManagedObjectsForObjects:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (!v5)
  {
    v8 = 0;
    v7 = 0;
    goto LABEL_26;
  }
  v6 = v5;
  v37 = v3;
  v38 = WeakRetained;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v40 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      objc_msgSend(v11, "availabilityEndDate", v37, v38);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "allowsManualRenewal"))
      {
        v14 = sLogObject_2;
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v15 = v14;
          v16 = "Deleting expired video since it does not allow manual renewal";
          goto LABEL_17;
        }
LABEL_18:
        objc_msgSend(*(id *)(a1 + 64), "_removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:", v11, 0, 0, 1);
        ++v8;
        goto LABEL_19;
      }
      if (v12 && !objc_msgSend(v12, "vui_isInTheFuture"))
      {
        v17 = sLogObject_2;
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v15 = v17;
          v16 = "Deleting expired video even though it allows manual renewal, since it is outside the availability window";
LABEL_17:
          _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
        }
        goto LABEL_18;
      }
      v13 = sLogObject_2;
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Invalidating (but not deleting) expired video since it allows manual key renewal and is still within availability window", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 64), "_invalidateKeysForVideoManagedObject:saveWhenDone:invalidateImmediately:", v11, 0, 1);
      ++v7;
LABEL_19:

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  }
  while (v6);
  if (v8)
    objc_msgSend(*(id *)(a1 + 64), "saveChangesToManagedObjects");
  v3 = v37;
  WeakRetained = v38;
LABEL_26:

LABEL_27:
  v18 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v44 = v8;
    _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "On launch, deleted downloads for %lu expired videos", buf, 0xCu);
  }
  v19 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v44 = v7;
    _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "On launch, invalidated downloads for %lu expired videos", buf, 0xCu);
  }
  v20 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    v22 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134217984;
    v44 = v22;
    _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "Will prune %lu managed object(s) on launch, of which:", buf, 0xCu);

  }
  v23 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *(void **)(a1 + 32);
    v25 = v23;
    v26 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 134217984;
    v44 = v26;
    _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "           %lu object(s) are marked as deleted", buf, 0xCu);

  }
  v27 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    v28 = *(void **)(a1 + 40);
    v29 = v27;
    v30 = objc_msgSend(v28, "count");
    *(_DWORD *)buf = 134217984;
    v44 = v30;
    _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "           %lu object(s) have downloads for non-signed-in users", buf, 0xCu);

  }
  v31 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    v32 = *(void **)(a1 + 48);
    v33 = v31;
    v34 = objc_msgSend(v32, "count");
    *(_DWORD *)buf = 134217984;
    v44 = v34;
    _os_log_impl(&dword_1D96EE000, v33, OS_LOG_TYPE_DEFAULT, "           %lu object(s) have downloads but the download is missing", buf, 0xCu);

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "allObjects");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_deleteVideoManagedObjects:", v35);

  }
  objc_msgSend(*(id *)(a1 + 64), "_deleteOrphanedDownloads");
  v36 = *(_QWORD *)(a1 + 72);
  if (v36)
    (*(void (**)(void))(v36 + 16))();

}

void __43__VUISidebandMediaLibrary_initWithManager___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint8_t buf[16];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  VUISignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.SidebandMediaLibrary.Init.ObjectContext", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __43__VUISidebandMediaLibrary_initWithManager___block_invoke_61;
  v13 = &unk_1E9F99348;
  v14 = *(id *)(a1 + 32);
  v15 = &v17;
  dispatch_sync(v3, &v10);

  VUISignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.SidebandMediaLibrary.Init.ObjectContext", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v10, v11, v12, v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__mainQueueManagedObjectContextDidSave_, *MEMORY[0x1E0C978A0], v18[5]);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 40), sel__activeAccountDidChange_, *MEMORY[0x1E0DAF710], 0);

  objc_msgSend(*(id *)(a1 + 32), "_postContentsDidChangeNotification");
  +[VUIOfflineKeyRenewalManager sharedInstance](VUIOfflineKeyRenewalManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateKeyRenewalAndExpiration");

  +[VUISecureInvalidationManager sharedInstance](VUISecureInvalidationManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateKeysForDeletedVideos");

  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "initializeDownloadManager");

  _Block_object_dispose(&v17, 8);
}

- (void)_deleteOrphanedDownloads
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  VUISidebandMediaLibrary *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  dispatch_get_global_queue(9, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke;
  v6[3] = &unk_1E9F98FD8;
  v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (id)videosWithDownloadState:(int64_t)a3 entitlementTypes:(id)a4 useMainThreadContext:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  objc_msgSend(v9, "numberWithLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISidebandMediaLibrary videosWithDownloadStates:entitlementTypes:useMainThreadContext:](self, "videosWithDownloadStates:entitlementTypes:useMainThreadContext:", v12, v10, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)initialize
{
  if (initialize_onceToken_1 != -1)
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_17);
}

void __37__VUISidebandMediaLibrary_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.VideosUI", "VUISidebandMediaLibrary");
  v1 = (void *)sLogObject_2;
  sLogObject_2 = (uint64_t)v0;

}

- (id)allFpsKeyDeletionInfos
{
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("FPSKeyDeletionInfo"));
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__VUISidebandMediaLibrary_allFpsKeyDeletionInfos__block_invoke;
  v7[3] = &unk_1E9F99D88;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  objc_msgSend((id)v9[5], "executeFetchRequest:error:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_pruneVideosAtAppLaunchWithCompletion:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  VUISidebandMediaLibrary *val;
  id v30;
  id obj;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  VUISidebandMediaLibrary *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  val = self;
  if (sDeleteAllEntriesOnInitialization)
  {
    v4 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Deleting all videos and keys", buf, 2u);
    }
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Video"));
    *(_QWORD *)buf = 0;
    v55 = buf;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__1;
    v58 = __Block_byref_object_dispose__1;
    v59 = 0;
    -[VUISidebandMediaLibrary serialQueue](val, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke;
    block[3] = &unk_1E9F99D88;
    block[4] = val;
    block[5] = buf;
    dispatch_sync(v5, block);

    objc_msgSend(*((id *)v55 + 5), "executeFetchRequest:error:", obj, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUISidebandMediaLibrary _deleteVideoManagedObjects:](val, "_deleteVideoManagedObjects:", v6);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    -[VUISidebandMediaLibrary _videosMarkedAsDeleted](self, "_videosMarkedAsDeleted");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUISidebandMediaLibrary _downloadedVideosForNonSignedInUsers](self, "_downloadedVideosForNonSignedInUsers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUISidebandMediaLibrary videosWithDownloadState:entitlementTypes:useMainThreadContext:](self, "videosWithDownloadState:entitlementTypes:useMainThreadContext:", 2, 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v50 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          objc_msgSend(v11, "fpsKeyInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v46;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v46 != v14)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "expirationDate");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = v16;
                if (v16 && objc_msgSend(v16, "vui_isInThePast"))
                {
                  objc_msgSend(v32, "addObject:", v11);

                  goto LABEL_21;
                }

              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
              if (v13)
                continue;
              break;
            }
          }
LABEL_21:

          objc_msgSend(v11, "localPlaybackURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v34, "addObject:", v11);
            objc_msgSend(v33, "addObject:", v18);
          }
          else
          {
            objc_msgSend(v30, "addObject:", v11);
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      }
      while (v8);
    }

    objc_initWeak((id *)buf, val);
    dispatch_get_global_queue(21, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke_201;
    v35[3] = &unk_1E9F9A708;
    v36 = v33;
    v37 = v34;
    v38 = v30;
    v20 = v30;
    v21 = v34;
    v22 = v33;
    objc_copyWeak(&v44, (id *)buf);
    v39 = v27;
    v40 = v26;
    v41 = v32;
    v42 = val;
    v43 = v28;
    v23 = v32;
    v24 = v26;
    v25 = v27;
    dispatch_async(v19, v35);

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);
  }

}

- (id)_videosMarkedAsDeleted
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD block[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Video"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES"), CFSTR("markedAsDeleted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  objc_msgSend(v3, "setPredicate:", v4);
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VUISidebandMediaLibrary__videosMarkedAsDeleted__block_invoke;
  block[3] = &unk_1E9F99D88;
  block[4] = self;
  block[5] = &v9;
  dispatch_sync(v5, block);

  objc_msgSend((id)v10[5], "executeFetchRequest:error:", v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)_migrateVideoExpirationDateAndAllowsManualRenewal
{
  NSObject *v3;
  uint64_t v4;
  char v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  int v19;
  NSObject *v20;
  int v21;
  const __CFString *v22;
  VUISidebandMediaLibrary *v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD block[6];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  __CFString *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Video"));
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__1;
  v46 = __Block_byref_object_dispose__1;
  v47 = 0;
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__VUISidebandMediaLibrary__migrateVideoExpirationDateAndAllowsManualRenewal__block_invoke;
  block[3] = &unk_1E9F99D88;
  block[4] = self;
  block[5] = &v42;
  v23 = self;
  dispatch_sync(v3, block);

  objc_msgSend((id)v43[5], "executeFetchRequest:error:", v24, 0);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
  if (v4)
  {
    v5 = 0;
    v26 = *(_QWORD *)v38;
    v27 = v4;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(obj);
        v6 = *(__CFString **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((-[__CFString hasExpirationDate](v6, "hasExpirationDate", v23) & 1) == 0)
        {
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          -[__CFString fpsKeyInfo](v6, "fpsKeyInfo");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
          if (v8)
          {
            v9 = *(_QWORD *)v34;
            while (2)
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v34 != v9)
                  objc_enumerationMutation(v7);
                objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "expirationDate");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = v11 == 0;

                if (!v12)
                {
                  v13 = sLogObject_2;
                  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v49 = v6;
                    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Setting hasExpirationDate to YES for %@", buf, 0xCu);
                  }
                  v5 = 1;
                  -[__CFString setHasExpirationDate:](v6, "setHasExpirationDate:", 1);
                  goto LABEL_19;
                }
              }
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
              if (v8)
                continue;
              break;
            }
          }
LABEL_19:

        }
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        -[__CFString fpsKeyInfo](v6, "fpsKeyInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v52, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v30;
          do
          {
            for (k = 0; k != v15; ++k)
            {
              if (*(_QWORD *)v30 != v16)
                objc_enumerationMutation(v14);
              v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * k);
              v19 = -[__CFString allowsManualRenewal](v6, "allowsManualRenewal");
              if (v19 != objc_msgSend(v18, "allowsManualRenewal"))
              {
                v20 = (id)sLogObject_2;
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  v21 = objc_msgSend(v18, "allowsManualRenewal");
                  *(_DWORD *)buf = 138412546;
                  v22 = CFSTR("NO");
                  if (v21)
                    v22 = CFSTR("YES");
                  v49 = v22;
                  v50 = 2112;
                  v51 = v6;
                  _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "Setting allowsManualRenewal to %@ for %@", buf, 0x16u);
                }

                -[__CFString setAllowsManualRenewal:](v6, "setAllowsManualRenewal:", objc_msgSend(v18, "allowsManualRenewal"));
                v5 = 1;
              }
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v52, 16);
          }
          while (v15);
        }

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
    }
    while (v27);

    if ((v5 & 1) != 0)
      -[VUISidebandMediaLibrary saveChangesToManagedObjects](v23, "saveChangesToManagedObjects");
  }
  else
  {

  }
  _Block_object_dispose(&v42, 8);

}

- (id)_downloadedVideosForNonSignedInUsers
{
  NSObject *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (+[VUIUtilities isInRetailDemoMode](VUIUtilities, "isInRetailDemoMode"))
  {
    v3 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Device is in retail demo mode; not deleting downloads for non-signed-in users",
        buf,
        2u);
    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_activeiTunesAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_DSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Video"));
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__1;
    v21 = __Block_byref_object_dispose__1;
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %ld"), CFSTR("downloadState"), 2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      v10 = v9;
      if ((objc_msgSend(v7, "isEqualToNumber:", &unk_1EA0B91A8) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("dsid"), v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB3528];
        v23[0] = v9;
        v23[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v8, "setPredicate:", v10);
    -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__VUISidebandMediaLibrary__downloadedVideosForNonSignedInUsers__block_invoke;
    block[3] = &unk_1E9F99D88;
    block[4] = self;
    block[5] = buf;
    dispatch_sync(v14, block);

    objc_msgSend(*((id *)v18 + 5), "executeFetchRequest:error:", v8, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
    return v15;
  }
}

- (id)videosWithDownloadStates:(id)a3 entitlementTypes:(id)a4 useMainThreadContext:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD v28[6];
  _QWORD block[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD v42[3];

  v5 = a5;
  v42[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Video"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("downloadState"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  v35 = 0;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("entitlementType"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3528];
    v42[0] = v11;
    v42[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
  objc_msgSend(v10, "setPredicate:", v11);
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  if (v5)
  {
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__VUISidebandMediaLibrary_videosWithDownloadStates_entitlementTypes_useMainThreadContext___block_invoke;
    block[3] = &unk_1E9F99D88;
    block[4] = self;
    block[5] = &v30;
    dispatch_sync(v16, block);

    objc_msgSend((id)v31[5], "executeFetchRequest:error:", v10, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v37[5];
    v37[5] = v17;
  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __90__VUISidebandMediaLibrary_videosWithDownloadStates_entitlementTypes_useMainThreadContext___block_invoke_2;
    v28[3] = &unk_1E9F99D88;
    v28[4] = self;
    v28[5] = &v30;
    dispatch_sync(v19, v28);

    v21 = (void *)v31[5];
    v24[0] = v20;
    v24[1] = 3221225472;
    v24[2] = __90__VUISidebandMediaLibrary_videosWithDownloadStates_entitlementTypes_useMainThreadContext___block_invoke_3;
    v24[3] = &unk_1E9F9A558;
    v26 = &v36;
    v27 = &v30;
    v25 = v10;
    objc_msgSend(v21, "performBlockAndWait:", v24);
    v18 = v25;
  }

  v22 = (id)v37[5];
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v22;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

void __43__VUISidebandMediaLibrary_initWithManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Loaded persistent store with description: %@ error: %@", buf, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_dumpDatabaseToLogIfEnabled");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__VUISidebandMediaLibrary_initWithManager___block_invoke_60;
  v10[3] = &unk_1E9F98FD8;
  v11 = WeakRetained;
  v12 = *(id *)(a1 + 32);
  v9 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id obj;
  id v34;
  uint64_t v35;
  int8x16_t v37;
  _QWORD block[4];
  int8x16_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v2, &v49);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v49;

    v6 = &unk_1EDACA000;
    if (v5 && os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
      __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_cold_1();
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v46;
      v30 = *(_QWORD *)v46;
      v31 = v2;
      do
      {
        v10 = 0;
        v32 = v8;
        do
        {
          if (*(_QWORD *)v46 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v10);
          if (objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple.UserManagedAssets"), v30, v31))
          {
            v35 = v10;
            objc_msgSend(v2, "stringByAppendingPathComponent:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = *((_QWORD *)v6 + 92);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v12;
              _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Downloads directory path: %@", buf, 0xCu);
            }
            if (objc_msgSend(v12, "length"))
            {

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = 0;
              objc_msgSend(v14, "contentsOfDirectoryAtPath:error:", v12, &v44);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v44;

              if (v16)
              {
                v17 = *((_QWORD *)v6 + 92);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v52 = v16;
                  _os_log_error_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_ERROR, "Unable to retrieve downloads directory contents: %@", buf, 0xCu);
                }
              }
              v34 = v16;
              v42 = 0u;
              v43 = 0u;
              v40 = 0u;
              v41 = 0u;
              v18 = v15;
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v41;
                do
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v41 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                    objc_msgSend(v23, "pathExtension");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v24, "isEqualToString:", CFSTR("movpkg")))
                    {

                    }
                    else
                    {
                      objc_msgSend(v23, "pathExtension");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("m4v"));

                      if (!v26)
                        continue;
                    }
                    objc_msgSend(v12, "stringByAppendingPathComponent:", v23);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v27, "length"))
                    {
                      v28 = sLogObject_2;
                      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v52 = v27;
                        _os_log_debug_impl(&dword_1D96EE000, v28, OS_LOG_TYPE_DEBUG, "Found download path on file system: %@", buf, 0xCu);
                      }
                      objc_msgSend(*(id *)(a1 + 32), "addObject:", v27);
                    }

                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
                }
                while (v20);
              }

              v9 = v30;
              v2 = v31;
              v6 = &unk_1EDACA000;
              v5 = v34;
              v8 = v32;
            }

            v10 = v35;
          }
          ++v10;
        }
        while (v10 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v8);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_195;
  block[3] = &unk_1E9F98FD8;
  v37 = *(int8x16_t *)(a1 + 32);
  v29 = (id)v37.i64[0];
  v39 = vextq_s8(v37, v37, 8uLL);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __90__VUISidebandMediaLibrary_videosWithDownloadStates_entitlementTypes_useMainThreadContext___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "executeFetchRequest:error:", a1[4], 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __90__VUISidebandMediaLibrary_videosWithDownloadStates_entitlementTypes_useMainThreadContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "backgroundManagedObjectContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __90__VUISidebandMediaLibrary_countOfDownloadingOrDownloadedSubscriptionVideosForNonMainQueue__block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "countForFetchRequest:error:", a1[4], 0);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

void __90__VUISidebandMediaLibrary_countOfDownloadingOrDownloadedSubscriptionVideosForNonMainQueue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "backgroundManagedObjectContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)countOfDownloadingOrDownloadedSubscriptionVideosForNonMainQueue
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Video"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %ld || %K == %ld) && (%K == NIL OR %K IN %@)"), CFSTR("downloadState"), 1, CFSTR("downloadState"), 2, CFSTR("entitlementType"), CFSTR("entitlementType"), &unk_1EA0BB820);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__VUISidebandMediaLibrary_countOfDownloadingOrDownloadedSubscriptionVideosForNonMainQueue__block_invoke;
  block[3] = &unk_1E9F99D88;
  block[4] = self;
  block[5] = &v20;
  dispatch_sync(v5, block);

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = (void *)v21[5];
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __90__VUISidebandMediaLibrary_countOfDownloadingOrDownloadedSubscriptionVideosForNonMainQueue__block_invoke_2;
  v11[3] = &unk_1E9F9A580;
  v13 = &v20;
  v8 = v3;
  v12 = v8;
  v14 = &v15;
  objc_msgSend(v7, "performBlockAndWait:", v11);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v20, 8);

  return v9;
}

- (NSManagedObjectContext)backgroundManagedObjectContext
{
  return self->_backgroundManagedObjectContext;
}

+ (void)setDeleteAllVideosAndKeysOnInitializationForAppRemoval:(BOOL)a3
{
  sDeleteAllEntriesOnInitialization = a3;
}

void __43__VUISidebandMediaLibrary_initWithManager___block_invoke_60(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_migrateVideoExpirationDateAndAllowsManualRenewal");
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__VUISidebandMediaLibrary_initWithManager___block_invoke_2;
  v3[3] = &unk_1E9F98FD8;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_pruneVideosAtAppLaunchWithCompletion:", v3);

}

void __43__VUISidebandMediaLibrary_initWithManager___block_invoke_61(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v2, "newBackgroundContext");

  objc_msgSend(v7, "setUndoManager:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundManagedObjectContext:", v7);
  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewContext");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setUndoManager:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUISidebandMediaLibrary;
  -[VUIMediaLibraryImageLoader dealloc](&v4, sel_dealloc);
}

- (id)videoForPlayable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  NSObject *v36;
  void *v37;
  int v38;
  NSObject *v39;
  _BOOL4 v40;
  const char *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  NSObject *v91;
  uint64_t v92;
  void *v93;
  id v94;
  NSObject *v95;
  void *v96;
  void *v97;
  id v98;
  NSObject *v99;
  void *v100;
  void *v101;
  id v102;
  NSObject *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  NSObject *v122;
  double v123;
  double v124;
  NSObject *v125;
  NSObject *v126;
  NSObject *v127;
  id v128;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  VUISidebandMediaLibrary *v143;
  id v144;
  id v145;
  id v146;
  id v147;
  unsigned __int8 v148;
  unsigned __int8 v149;
  char v150;
  uint8_t buf[4];
  id v152;
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "adamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v5, "length") && v6)
  {
    objc_msgSend(v4, "canonicalID");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = 0;
    objc_msgSend(v4, "downloadURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaInfo playbackURLOverrideForOriginalURL:adamID:canonicalID:](VUIMediaInfo, "playbackURLOverrideForOriginalURL:adamID:canonicalID:", v6, v5, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;

      v6 = v12;
      v9 = v6;
    }
    v140 = v6;
    v141 = (void *)v7;
    v138 = v11;
    v139 = v8;
    v142 = v9;
    v143 = self;
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("Movie")))
    {
      -[VUISidebandMediaLibrary _movieForAdamID:createIfNeeded:wasCreated:](self, "_movieForAdamID:createIfNeeded:wasCreated:", v5, 1, &v150);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    }
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Episode")))
    {
      v13 = 0;
      goto LABEL_59;
    }
    objc_msgSend(v4, "showCanonicalID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seasonCanonicalID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showAdamID");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seasonAdamID");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length") && !objc_msgSend(v136, "length"))
    {
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
        -[VUISidebandMediaLibrary videoForPlayable:].cold.7();
      v13 = 0;
      goto LABEL_58;
    }
    v149 = 0;
    -[VUISidebandMediaLibrary _tvEpisodeForAdamID:createIfNeeded:wasCreated:](self, "_tvEpisodeForAdamID:createIfNeeded:wasCreated:", v5, 1, &v150);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length")
      || (-[VUISidebandMediaLibrary _tvSeriesForCanonicalID:createIfNeeded:wasCreated:](self, "_tvSeriesForCanonicalID:createIfNeeded:wasCreated:", v14, 0, 0), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (!objc_msgSend(v136, "length")
        || (-[VUISidebandMediaLibrary _tvSeriesForAdamID:createIfNeeded:wasCreated:](self, "_tvSeriesForAdamID:createIfNeeded:wasCreated:", v136, 0, 0), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (objc_msgSend(v14, "length"))
          -[VUISidebandMediaLibrary _tvSeriesForCanonicalID:createIfNeeded:wasCreated:](self, "_tvSeriesForCanonicalID:createIfNeeded:wasCreated:", v14, 1, &v149);
        else
          -[VUISidebandMediaLibrary _tvSeriesForAdamID:createIfNeeded:wasCreated:](self, "_tvSeriesForAdamID:createIfNeeded:wasCreated:", v136, 1, &v149);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v13 = v16;
    v18 = v149;
    v19 = (id)sLogObject_2;
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (!v20)
        goto LABEL_32;
      *(_WORD *)buf = 0;
      v21 = "Created managed object for series";
    }
    else
    {
      if (!v20)
        goto LABEL_32;
      *(_WORD *)buf = 0;
      v21 = "Using existing managed object for series but updating its metadata";
    }
    _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
LABEL_32:

    objc_msgSend(v4, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "episodeNumber");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEpisodeNumberInSeason:", v23);

    objc_msgSend(v4, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fractionalEpisodeNumber");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFractionalEpisodeNumberInSeason:", v25);

    objc_msgSend(v4, "metadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "episodeIndexInSeries");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEpisodeNumberInSeries:", v27);

    objc_msgSend(v17, "setCanonicalID:", v14);
    objc_msgSend(v17, "setAdamID:", v136);
    objc_msgSend(v4, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "showTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v29);

    objc_msgSend(v17, "addEpisodesObject:", v13);
    objc_msgSend(v4, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "showArtworkURLFormat");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "showArtworkWidth");
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "showArtworkHeight");
    v130 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (objc_msgSend(v31, "length")
        && (objc_msgSend(v132, "doubleValue"), v34 > 0.0)
        && (objc_msgSend(v130, "doubleValue"), v35 > 0.0))
      {
        -[VUISidebandMediaLibrary imageInfoForSeries:imageType:createIfNeeded:wasCreated:](self, "imageInfoForSeries:imageType:createIfNeeded:wasCreated:", v17, 0, 1, 0);
        v36 = objc_claimAutoreleasedReturnValue();
        -[NSObject setImageType:](v36, "setImageType:", 0);
        -[NSObject setUrlFormat:](v36, "setUrlFormat:", v31);
        objc_msgSend(v132, "doubleValue");
        -[NSObject setCanonicalWidth:](v36, "setCanonicalWidth:");
        objc_msgSend(v130, "doubleValue");
        -[NSObject setCanonicalHeight:](v36, "setCanonicalHeight:");
        -[NSObject setSeries:](v36, "setSeries:", v17);
      }
      else
      {
        v36 = (id)sLogObject_2;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          -[VUISidebandMediaLibrary videoForPlayable:].cold.8();
      }

    }
    if (!objc_msgSend(v15, "length") && !objc_msgSend(v134, "length"))
      goto LABEL_57;
    v148 = 0;
    if (!objc_msgSend(v15, "length")
      || (-[VUISidebandMediaLibrary _tvSeasonForCanonicalID:createIfNeeded:wasCreated:](v143, "_tvSeasonForCanonicalID:createIfNeeded:wasCreated:", v15, 0, 0), (v37 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (!objc_msgSend(v134, "length")
        || (-[VUISidebandMediaLibrary _tvSeasonForAdamID:createIfNeeded:wasCreated:](v143, "_tvSeasonForAdamID:createIfNeeded:wasCreated:", v134, 0, 0), (v37 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (objc_msgSend(v15, "length"))
          -[VUISidebandMediaLibrary _tvSeasonForCanonicalID:createIfNeeded:wasCreated:](v143, "_tvSeasonForCanonicalID:createIfNeeded:wasCreated:", v15, 1, &v148);
        else
          -[VUISidebandMediaLibrary _tvSeasonForAdamID:createIfNeeded:wasCreated:](v143, "_tvSeasonForAdamID:createIfNeeded:wasCreated:", v134, 1, &v148);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v38 = v148;
    v39 = (id)sLogObject_2;
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    if (v38)
    {
      if (v40)
      {
        *(_WORD *)buf = 0;
        v41 = "Created managed object for season";
LABEL_55:
        _os_log_impl(&dword_1D96EE000, v39, OS_LOG_TYPE_DEFAULT, v41, buf, 2u);
      }
    }
    else if (v40)
    {
      *(_WORD *)buf = 0;
      v41 = "Using existing managed object for season but updating its metadata";
      goto LABEL_55;
    }

    objc_msgSend(v37, "setCanonicalID:", v15);
    objc_msgSend(v37, "setAdamID:", v134);
    objc_msgSend(v4, "metadata");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "seasonNumber");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSeasonNumber:", v43);

    objc_msgSend(v4, "metadata");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "seasonTitle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTitle:", v45);

    objc_msgSend(v17, "addSeasonsObject:", v37);
    objc_msgSend(v13, "setSeason:", v37);

    v6 = v140;
LABEL_57:

    v7 = (uint64_t)v141;
LABEL_58:

    v9 = v142;
LABEL_59:
    objc_msgSend(v13, "setCanonicalID:", v7);
    objc_msgSend(v4, "fpsCertificateURL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFpsCertificateURL:", v46);

    objc_msgSend(v4, "fpsKeyServerURL");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFpsKeyServerURL:", v47);

    objc_msgSend(v4, "fpsNonceURL");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFpsNonceURL:", v48);

    objc_msgSend(v13, "setPlaybackURL:", v6);
    objc_msgSend(v13, "setDownloadURL:", v9);
    objc_msgSend(v4, "metadata");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "title");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v50);

    objc_msgSend(v4, "metadata");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "mediaDescription");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMediaDescription:", v52);

    objc_msgSend(v13, "setAdamID:", v5);
    objc_msgSend(v4, "externalID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setExternalID:", v53);

    objc_msgSend(v4, "channelID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBrandID:", v54);

    objc_msgSend(v4, "channelName");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBrandName:", v55);

    objc_msgSend(v4, "metadata");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "ratingValue");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentRatingRank:", v57);

    objc_msgSend(v4, "metadata");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "ratingDomain");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentRatingDomain:", v59);

    objc_msgSend(v4, "metadata");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "duration");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDuration:", v61);

    objc_msgSend(v4, "referenceID");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setReferenceID:", v62);

    objc_msgSend(v4, "playablePassThrough");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlayablePassThrough:", v63);

    objc_msgSend(v4, "hlsProgramID");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProgramID:", v64);

    objc_msgSend(v4, "metadata");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "genre");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "length");

    objc_msgSend(v4, "metadata");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v68;
    if (v67)
      objc_msgSend(v68, "genre");
    else
      objc_msgSend(v68, "sportName");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGenreName:", v70);

    objc_msgSend(v4, "metadata");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "type");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIsSportingEvent:", objc_msgSend(v72, "isEqualToString:", CFSTR("SportingEvent")));

    objc_msgSend(v4, "metadata");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "releasedDate");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setReleaseDate:", v74);

    objc_msgSend(v4, "metadata");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIsAdultContent:", objc_msgSend(v75, "isAdultContent"));

    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "ams_activeiTunesAccount");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "ams_DSID");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDsid:", v78);

    objc_msgSend(v4, "requiredAgeForPlayback");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRequiredAgeForPlayback:", v79);

    objc_msgSend(v4, "frequencyOfAgeConfirmation");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrequencyOfAgeConfirmation:", v80);

    objc_msgSend(v4, "rtcServiceIdentifier");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRtcServiceIdentifier:", v81);

    objc_msgSend(v13, "setMarkedAsDeleted:", 0);
    objc_msgSend(v4, "tvAppDeeplinkURL");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShareURL:", v82);

    objc_msgSend(v4, "buyParams");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBuyParams:", v83);

    objc_msgSend(v4, "rentalID");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRentalID:", v84);

    objc_msgSend(v13, "setDownloadedPlaybackMode:", 0);
    if ((objc_msgSend(v4, "isSubscription") & 1) != 0)
    {
      v85 = 1;
    }
    else if (objc_msgSend(v4, "isiTunesPurchaseOrRental"))
    {
      if ((objc_msgSend(v4, "isRental") & 1) != 0)
      {
        v85 = 3;
      }
      else if (objc_msgSend(v4, "isFamilySharingContent"))
      {
        v85 = 4;
      }
      else
      {
        v85 = 2;
      }
    }
    else
    {
      v86 = (id)sLogObject_2;
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v86, OS_LOG_TYPE_DEFAULT, "Unknown entitlement type for video", buf, 2u);
      }

      v85 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v85);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEntitlementType:", v87);

    objc_msgSend(v4, "fpsAdditionalServerParams");
    v88 = objc_claimAutoreleasedReturnValue();
    if (v88 && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v88))
    {
      v147 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v88, 0, &v147);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v147;
      if (objc_msgSend(v89, "length"))
      {
        objc_msgSend(v13, "setAdditionalFPSRequestParamsJSONData:", v89);
      }
      else
      {
        v91 = (id)sLogObject_2;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
          -[VUISidebandMediaLibrary videoForPlayable:].cold.6();

      }
    }
    objc_msgSend(v4, "vpafMetrics");
    v92 = objc_claimAutoreleasedReturnValue();
    if (v92 && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v92))
    {
      v146 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v92, 0, &v146);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v146;
      if (objc_msgSend(v93, "length"))
      {
        objc_msgSend(v13, "setVpafMetricsJSONData:", v93);
      }
      else
      {
        v95 = (id)sLogObject_2;
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          -[VUISidebandMediaLibrary videoForPlayable:].cold.5();

      }
    }
    v135 = (void *)v92;
    objc_msgSend(v4, "mediaMetrics");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (v96 && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v96))
    {
      v145 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v96, 0, &v145);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v145;
      if (objc_msgSend(v97, "length"))
      {
        objc_msgSend(v13, "setMediaMetricsJSONData:", v97);
      }
      else
      {
        v99 = (id)sLogObject_2;
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v152 = v98;
          _os_log_impl(&dword_1D96EE000, v99, OS_LOG_TYPE_DEFAULT, "Unable to serialize mediaMetrics data: %@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v4, "playbackModes");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (v100 && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v100))
    {
      v144 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v100, 0, &v144);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v144;
      if (objc_msgSend(v101, "length"))
      {
        objc_msgSend(v13, "setPlaybackModesJSONData:", v101);
      }
      else
      {
        v103 = (id)sLogObject_2;
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v152 = v102;
          _os_log_impl(&dword_1D96EE000, v103, OS_LOG_TYPE_DEFAULT, "Unable to serialize playbackModes data: %@", buf, 0xCu);
        }

      }
    }
    v137 = (void *)v88;
    objc_msgSend(v4, "metadata");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "artworkURLFormat");
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "artworkWidth");
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "artworkHeight");
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (objc_msgSend(v105, "length")
        && (objc_msgSend(v107, "doubleValue"), v110 > 0.0)
        && (objc_msgSend(v109, "doubleValue"), v111 > 0.0))
      {
        -[VUISidebandMediaLibrary imageInfoForVideo:imageType:createIfNeeded:wasCreated:](v143, "imageInfoForVideo:imageType:createIfNeeded:wasCreated:", v13, 0, 1, 0);
        v112 = objc_claimAutoreleasedReturnValue();
        -[NSObject setImageType:](v112, "setImageType:", 0);
        -[NSObject setUrlFormat:](v112, "setUrlFormat:", v105);
        objc_msgSend(v107, "doubleValue");
        -[NSObject setCanonicalWidth:](v112, "setCanonicalWidth:");
        objc_msgSend(v109, "doubleValue");
        -[NSObject setCanonicalHeight:](v112, "setCanonicalHeight:");
        -[NSObject setVideo:](v112, "setVideo:", v13);
      }
      else
      {
        v112 = (id)sLogObject_2;
        if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
          -[VUISidebandMediaLibrary videoForPlayable:].cold.4();
      }

    }
    v131 = v105;
    v133 = v107;
    v113 = v109;
    objc_msgSend(v4, "metadata");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "previewFrameURLFormat");
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "previewFrameWidth");
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "previewFrameHeight");
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (objc_msgSend(v115, "length")
        && (objc_msgSend(v117, "doubleValue"), v120 > 0.0)
        && (objc_msgSend(v119, "doubleValue"), v121 > 0.0))
      {
        -[VUISidebandMediaLibrary imageInfoForVideo:imageType:createIfNeeded:wasCreated:](v143, "imageInfoForVideo:imageType:createIfNeeded:wasCreated:", v13, 1, 1, 0);
        v122 = objc_claimAutoreleasedReturnValue();
        -[NSObject setImageType:](v122, "setImageType:", 1);
        -[NSObject setUrlFormat:](v122, "setUrlFormat:", v115);
        objc_msgSend(v117, "doubleValue");
        -[NSObject setCanonicalWidth:](v122, "setCanonicalWidth:");
        objc_msgSend(v119, "doubleValue");
        -[NSObject setCanonicalHeight:](v122, "setCanonicalHeight:");
        -[NSObject setVideo:](v122, "setVideo:", v13);
      }
      else
      {
        v122 = (id)sLogObject_2;
        if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
          -[VUISidebandMediaLibrary videoForPlayable:].cold.3();
      }

      if (objc_msgSend(v115, "length")
        && (objc_msgSend(v117, "doubleValue"), v123 > 0.0)
        && (objc_msgSend(v119, "doubleValue"), v124 > 0.0))
      {
        -[VUISidebandMediaLibrary imageInfoForVideo:imageType:createIfNeeded:wasCreated:](v143, "imageInfoForVideo:imageType:createIfNeeded:wasCreated:", v13, 2, 1, 0);
        v125 = objc_claimAutoreleasedReturnValue();
        -[NSObject setImageType:](v125, "setImageType:", 2);
        -[NSObject setUrlFormat:](v125, "setUrlFormat:", v115);
        objc_msgSend(v117, "doubleValue");
        -[NSObject setCanonicalWidth:](v125, "setCanonicalWidth:");
        objc_msgSend(v119, "doubleValue");
        -[NSObject setCanonicalHeight:](v125, "setCanonicalHeight:");
        -[NSObject setVideo:](v125, "setVideo:", v13);
      }
      else
      {
        v125 = (id)sLogObject_2;
        if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
          -[VUISidebandMediaLibrary videoForPlayable:].cold.2();
      }

      if (!v150)
      {
        v126 = (id)sLogObject_2;
        if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v126, OS_LOG_TYPE_DEFAULT, "Using existing managed object for video but updating its metadata", buf, 2u);
        }
LABEL_133:

        goto LABEL_134;
      }
    }
    else if (!v150)
    {
LABEL_134:
      -[VUISidebandMediaLibrary saveChangesToManagedObjects](v143, "saveChangesToManagedObjects");

      v6 = v140;
      goto LABEL_135;
    }
    v127 = (id)sLogObject_2;
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v127, OS_LOG_TYPE_DEFAULT, "Created managed object for video", buf, 2u);
    }

    objc_msgSend(v13, "setDownloadState:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v126 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDateAdded:", v126);
    goto LABEL_133;
  }
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
    -[VUISidebandMediaLibrary videoForPlayable:].cold.1();
  v13 = 0;
LABEL_135:
  v128 = v13;

  return v128;
}

- (id)videoForMPMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int16 v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v30;
  void *v31;
  uint8_t v32[16];
  uint8_t buf[15];
  char v34;

  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0CC1FA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "longLongValue"))
  {
    v34 = 0;
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0CC1E28]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "length");
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    v11 = objc_msgSend(v4, "mediaType");
    +[VUIMediaInfo playbackURLOverrideForOriginalURL:adamID:canonicalID:](VUIMediaInfo, "playbackURLOverrideForOriginalURL:adamID:canonicalID:", v10, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;

      v15 = v14;
      v10 = v15;
    }
    if ((v11 & 0x100) != 0)
    {
      -[VUISidebandMediaLibrary _movieForAdamID:createIfNeeded:wasCreated:](self, "_movieForAdamID:createIfNeeded:wasCreated:", v7, 1, &v34);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((v11 & 0x200) == 0)
      {
        v16 = 0;
LABEL_16:
        v31 = v8;
        objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0CC1FD8]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTitle:", v18);

        objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0CC1FB0]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBuyParams:", v19);

        if (objc_msgSend(v4, "isRental"))
        {
          objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0CC1FB8]);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setRentalID:", v20);

        }
        objc_msgSend(v16, "setPlaybackURL:", v10);
        objc_msgSend(v16, "setDownloadURL:", v10);
        objc_msgSend(v16, "setAdamID:", v7);
        objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "ams_activeiTunesAccount");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "ams_DSID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setDsid:", v23);

        objc_msgSend(v16, "setMarkedAsDeleted:", 0);
        if (objc_msgSend(v4, "isRental"))
          v24 = 3;
        else
          v24 = 2;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setEntitlementType:", v25);

        if (v34)
        {
          v26 = sLogObject_2;
          if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D96EE000, v26, OS_LOG_TYPE_DEFAULT, "Created managed object for video", buf, 2u);
          }
          objc_msgSend(v16, "setDownloadState:", 0);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setDateAdded:", v27);

          v28 = v31;
        }
        else
        {
          v28 = v31;
          if (v16)
          {
            v30 = sLogObject_2;
            if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v32 = 0;
              _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, "Using existing managed object for video but updating its metadata", v32, 2u);
            }
          }
        }
        -[VUISidebandMediaLibrary saveChangesToManagedObjects](self, "saveChangesToManagedObjects");

        goto LABEL_26;
      }
      -[VUISidebandMediaLibrary _tvEpisodeForAdamID:createIfNeeded:wasCreated:](self, "_tvEpisodeForAdamID:createIfNeeded:wasCreated:", v7, 1, &v34);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v17;
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
    -[VUISidebandMediaLibrary videoForMPMediaItem:].cold.1();
  v16 = 0;
LABEL_26:

  return v16;
}

- (id)videoForAdamID:(id)a3 useMainThreadContext:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a4;
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUISidebandMediaLibrary videosForAdamIDs:useMainThreadContext:](self, "videosForAdamIDs:useMainThreadContext:", v8, v4, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)videosForAdamIDs:(id)a3 useMainThreadContext:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD v21[6];
  _QWORD block[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a4;
  v6 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  v34 = 0;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("adamID"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Video"));
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__1;
    v27 = __Block_byref_object_dispose__1;
    v28 = 0;
    -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__VUISidebandMediaLibrary_videosForAdamIDs_useMainThreadContext___block_invoke;
    block[3] = &unk_1E9F99D88;
    block[4] = self;
    block[5] = &v23;
    dispatch_sync(v9, block);

    objc_msgSend(v8, "setPredicate:", v7);
    objc_msgSend((id)v24[5], "executeFetchRequest:error:", v8, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v30[5];
    v30[5] = v10;

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__1;
    v27 = __Block_byref_object_dispose__1;
    v28 = 0;
    -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__VUISidebandMediaLibrary_videosForAdamIDs_useMainThreadContext___block_invoke_2;
    v21[3] = &unk_1E9F99D88;
    v21[4] = self;
    v21[5] = &v23;
    dispatch_sync(v12, v21);

    v14 = (void *)v24[5];
    if (v14)
    {
      v17[0] = v13;
      v17[1] = 3221225472;
      v17[2] = __65__VUISidebandMediaLibrary_videosForAdamIDs_useMainThreadContext___block_invoke_3;
      v17[3] = &unk_1E9F9A530;
      v18 = v7;
      v19 = &v29;
      v20 = &v23;
      objc_msgSend(v14, "performBlockAndWait:", v17);

    }
    _Block_object_dispose(&v23, 8);

  }
  v15 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v15;
}

void __65__VUISidebandMediaLibrary_videosForAdamIDs_useMainThreadContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __65__VUISidebandMediaLibrary_videosForAdamIDs_useMainThreadContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "backgroundManagedObjectContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __65__VUISidebandMediaLibrary_videosForAdamIDs_useMainThreadContext___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Video"));
  objc_msgSend(v5, "setPredicate:", a1[4]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "executeFetchRequest:error:", v5, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)fpsKeyInfoForVideo:(id)a3 keyURI:(id)a4 createIfNeeded:(BOOL)a5 wasCreated:(BOOL *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  BOOL v27;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ && %K == %@"), CFSTR("video"), v10, CFSTR("keyURI"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISidebandMediaLibrary _managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:](self, "_managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:", CFSTR("FPSKeyInfo"), v12, v7, &v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v27;
  if (a6)
    *a6 = v27;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("keyURI"), v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUISidebandMediaLibrary _managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:](self, "_managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:", CFSTR("FPSKeyDeletionInfo"), v15, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = sLogObject_2;
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Deleting existing key deletion info object since new key was created for the same content", buf, 2u);
      }
      *(_QWORD *)buf = 0;
      v22 = buf;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__1;
      v25 = __Block_byref_object_dispose__1;
      v26 = 0;
      -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79__VUISidebandMediaLibrary_fpsKeyInfoForVideo_keyURI_createIfNeeded_wasCreated___block_invoke;
      block[3] = &unk_1E9F99D88;
      block[4] = self;
      block[5] = buf;
      dispatch_sync(v18, block);

      objc_msgSend(*((id *)v22 + 5), "deleteObject:", v16);
      _Block_object_dispose(buf, 8);

    }
  }

  return v13;
}

void __79__VUISidebandMediaLibrary_fpsKeyInfoForVideo_keyURI_createIfNeeded_wasCreated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)existingFpsKeyInfoForKeyURI:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("keyURI"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISidebandMediaLibrary _managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:](self, "_managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:", CFSTR("FPSKeyInfo"), v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)imageInfoForVideo:(id)a3 imageType:(unint64_t)a4 createIfNeeded:(BOOL)a5 wasCreated:(BOOL *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  BOOL v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v7 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ && %K == %lu"), CFSTR("video"), v10, CFSTR("imageType"), a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  -[VUISidebandMediaLibrary _managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:](self, "_managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:", CFSTR("VideoImageInfo"), v11, v7, &v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__1;
    v22 = __Block_byref_object_dispose__1;
    v23 = 0;
    -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__VUISidebandMediaLibrary_imageInfoForVideo_imageType_createIfNeeded_wasCreated___block_invoke;
    block[3] = &unk_1E9F99D88;
    block[4] = self;
    block[5] = &v18;
    dispatch_sync(v13, block);

    v14 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = CFSTR("ImageData");
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Creating managed object for entity name %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ImageData"), v19[5]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImageData:", v15);

    _Block_object_dispose(&v18, 8);
  }
  if (a6)
    *a6 = v24;

  return v12;
}

void __81__VUISidebandMediaLibrary_imageInfoForVideo_imageType_createIfNeeded_wasCreated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)imageInfoForSeries:(id)a3 imageType:(unint64_t)a4 createIfNeeded:(BOOL)a5 wasCreated:(BOOL *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  BOOL v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v7 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ && %K == %lu"), CFSTR("series"), v10, CFSTR("imageType"), a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  -[VUISidebandMediaLibrary _managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:](self, "_managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:", CFSTR("TVSeriesImageInfo"), v11, v7, &v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__1;
    v22 = __Block_byref_object_dispose__1;
    v23 = 0;
    -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__VUISidebandMediaLibrary_imageInfoForSeries_imageType_createIfNeeded_wasCreated___block_invoke;
    block[3] = &unk_1E9F99D88;
    block[4] = self;
    block[5] = &v18;
    dispatch_sync(v13, block);

    v14 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = CFSTR("ImageData");
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Creating managed object for entity name %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ImageData"), v19[5]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImageData:", v15);

    _Block_object_dispose(&v18, 8);
  }
  if (a6)
    *a6 = v24;

  return v12;
}

void __82__VUISidebandMediaLibrary_imageInfoForSeries_imageType_createIfNeeded_wasCreated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)deleteFPSKeyDeletionInfo:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUISidebandMediaLibrary deleteFPSKeyDeletionInfos:](self, "deleteFPSKeyDeletionInfos:", v6, v7, v8);
  }
}

- (void)deleteFPSKeyDeletionInfos:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  VUISidebandMediaLibrary *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__1;
    v22 = __Block_byref_object_dispose__1;
    v23 = 0;
    -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__VUISidebandMediaLibrary_deleteFPSKeyDeletionInfos___block_invoke;
    block[3] = &unk_1E9F99D88;
    block[4] = self;
    block[5] = &v18;
    v12 = self;
    dispatch_sync(v5, block);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          v11 = sLogObject_2;
          if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v10;
            _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Deleting managed object %@", buf, 0xCu);
          }
          objc_msgSend((id)v19[5], "deleteObject:", v10);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v26, 16);
      }
      while (v7);
    }

    -[VUISidebandMediaLibrary saveChangesToManagedObjects](v12, "saveChangesToManagedObjects");
    _Block_object_dispose(&v18, 8);

  }
}

void __53__VUISidebandMediaLibrary_deleteFPSKeyDeletionInfos___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)videosWithExpiredDownloadsUsingMainThreadContext:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Video"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES AND %K == NO AND %K == %ld"), CFSTR("hasExpirationDate"), CFSTR("markedAsDeleted"), CFSTR("downloadState"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);
  -[VUISidebandMediaLibrary _objectsWithFetchRequest:usingMainThreadContext:](self, "_objectsWithFetchRequest:usingMainThreadContext:", v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)seriesForCanonicalIDOrAdamID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[VUISidebandMediaLibrary _tvSeriesForCanonicalID:createIfNeeded:wasCreated:](self, "_tvSeriesForCanonicalID:createIfNeeded:wasCreated:", v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[VUISidebandMediaLibrary _tvSeriesForAdamID:createIfNeeded:wasCreated:](self, "_tvSeriesForAdamID:createIfNeeded:wasCreated:", v4, 0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)episodesWithDownloadState:(int64_t)a3 seasonCanonicalId:(id)a4 usingMainThreadContext:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = (objc_class *)MEMORY[0x1E0C97B48];
  v9 = a4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithEntityName:", CFSTR("TVEpisode"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NO AND %K == %ld AND season.canonicalID == %@"), CFSTR("markedAsDeleted"), CFSTR("downloadState"), a3, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v11);
  -[VUISidebandMediaLibrary _objectsWithFetchRequest:usingMainThreadContext:](self, "_objectsWithFetchRequest:usingMainThreadContext:", v10, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)episodesWithDownloadState:(int64_t)a3 showCanonicalId:(id)a4 usingMainThreadContext:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = (objc_class *)MEMORY[0x1E0C97B48];
  v9 = a4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithEntityName:", CFSTR("TVEpisode"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NO AND %K == %ld AND series.canonicalID == %@"), CFSTR("markedAsDeleted"), CFSTR("downloadState"), a3, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v11);
  -[VUISidebandMediaLibrary _objectsWithFetchRequest:usingMainThreadContext:](self, "_objectsWithFetchRequest:usingMainThreadContext:", v10, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)removeDownloadedMediaForVideoManagedObject:(id)a3 markAsDeleted:(BOOL)a4 invalidateImmediately:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = a5;
    v6 = a4;
    v11 = a3;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = a3;
    objc_msgSend(v8, "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUISidebandMediaLibrary removeDownloadedMediaForVideoManagedObjects:markAsDeleted:invalidateImmediately:](self, "removeDownloadedMediaForVideoManagedObjects:markAsDeleted:invalidateImmediately:", v10, v6, v5, v11, v12);
  }
}

- (void)removeDownloadedMediaForVideoManagedObjects:(id)a3 markAsDeleted:(BOOL)a4 invalidateImmediately:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v5 = a5;
  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          -[VUISidebandMediaLibrary mainContextVideoForVideo:](self, "mainContextVideoForVideo:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13), (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUISidebandMediaLibrary _removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:](self, "_removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:", v14, v6, 0, v5);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    -[VUISidebandMediaLibrary saveChangesToManagedObjects](self, "saveChangesToManagedObjects");
  }

}

- (void)invalidateKeysForVideoManagedObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUISidebandMediaLibrary invalidateKeysForVideoManagedObjects:](self, "invalidateKeysForVideoManagedObjects:", v6, v7, v8);
  }
}

- (void)invalidateKeysForVideoManagedObjects:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v4;
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
          -[VUISidebandMediaLibrary mainContextVideoForVideo:](self, "mainContextVideoForVideo:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUISidebandMediaLibrary _invalidateKeysForVideoManagedObject:saveWhenDone:invalidateImmediately:](self, "_invalidateKeysForVideoManagedObject:saveWhenDone:invalidateImmediately:", v10, 0, 1);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    -[VUISidebandMediaLibrary saveChangesToManagedObjects](self, "saveChangesToManagedObjects");
  }

}

- (void)saveChangesToManagedObjects
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Unable to save object to database due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

void __54__VUISidebandMediaLibrary_saveChangesToManagedObjects__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)mainContextVideoForVideo:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v10 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUISidebandMediaLibrary _mainContextManagedObjectsForObjects:](self, "_mainContextManagedObjectsForObjects:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)title
{
  void *v2;
  void *v3;

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:", CFSTR("LIBRARY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  objc_initWeak(&location, self);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke;
  block[3] = &unk_1E9F99D88;
  block[4] = self;
  block[5] = &v20;
  dispatch_sync(v6, block);

  v8 = (void *)v21[5];
  if (v8)
  {
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E9F9A5A8;
    objc_copyWeak(&v16, &location);
    v15 = &v20;
    v13 = v5;
    v14 = v4;
    objc_msgSend(v8, "performBlock:", v12);

    objc_destroyWeak(&v16);
  }
  else
  {
    -[VUIMediaLibrary manager](self, "manager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2;
    v17[3] = &unk_1E9F98E68;
    v18 = v4;
    objc_msgSend(v9, "_enqueueCompletionQueueBlock:", v17);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6978]), "initWithOperation:", 0);
  _Block_object_dispose(&v20, 8);

  objc_destroyWeak(&location);
  return v10;
}

void __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "backgroundManagedObjectContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_3(uint64_t a1)
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
  void *v16;
  void *v17;
  void *v18;
  VUIMediaItemEntityTypesFetchResponse *v19;
  void *v20;
  id v21;
  VUIMediaItemEntityTypesFetchResponse *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  _QWORD v26[4];
  VUIMediaItemEntityTypesFetchResponse *v27;
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Movie"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("TVEpisode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NIL OR %K IN %@"), CFSTR("entitlementType"), CFSTR("entitlementType"), &unk_1EA0BB838);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v4);
  objc_msgSend(v3, "setPredicate:", v4);
  objc_msgSend(v2, "setFetchLimit:", 1);
  objc_msgSend(v3, "setFetchLimit:", 1);
  v24 = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "executeFetchRequest:error:", v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "executeFetchRequest:error:", v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *(void **)(a1 + 32);
    +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  if (objc_msgSend(v6, "count"))
  {
    v9 = *(void **)(a1 + 32);
    +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  v11 = *(void **)(a1 + 32);
  +[VUIMediaLibraryUtilities mediaItemEntityTypesSortComparator](VUIMediaLibraryUtilities, "mediaItemEntityTypesSortComparator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortUsingComparator:", v12);

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Video"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %ld"), CFSTR("downloadState"), 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3528];
  v29[0] = v14;
  v29[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setPredicate:", v17);
  objc_msgSend(v13, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "executeFetchRequest:error:", v13, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(VUIMediaItemEntityTypesFetchResponse);
  -[VUIMediaItemEntityTypesFetchResponse setMediaItemEntityTypes:](v19, "setMediaItemEntityTypes:", *(_QWORD *)(a1 + 32));
  -[VUIMediaItemEntityTypesFetchResponse setLocalMediaItemsAvailable:](v19, "setLocalMediaItemsAvailable:", objc_msgSend(v18, "count") != 0);
  objc_msgSend(WeakRetained, "manager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_151;
  v26[3] = &unk_1E9F99420;
  v21 = *(id *)(a1 + 40);
  v27 = v19;
  v28 = v21;
  v22 = v19;
  objc_msgSend(v20, "_enqueueCompletionQueueBlock:", v26);

}

uint64_t __81__VUISidebandMediaLibrary_enqueueMediaItemEntityTypesFetchWithCompletionHandler___block_invoke_151(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), 0);
  return result;
}

- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD block[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke;
  block[3] = &unk_1E9F99D88;
  block[4] = self;
  block[5] = &v24;
  dispatch_sync(v9, block);

  v11 = (void *)v25[5];
  if (v11)
  {
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3;
    v15[3] = &unk_1E9F9A5D0;
    objc_copyWeak(&v20, &location);
    v16 = v6;
    v19 = &v24;
    v17 = v8;
    v18 = v7;
    objc_msgSend(v11, "performBlock:", v15);

    objc_destroyWeak(&v20);
  }
  else
  {
    -[VUIMediaLibrary manager](self, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2;
    v21[3] = &unk_1E9F98E68;
    v22 = v7;
    objc_msgSend(v12, "_enqueueCompletionQueueBlock:", v21);

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6978]), "initWithOperation:", 0);
  _Block_object_dispose(&v24, 8);

  objc_destroyWeak(&location);
  return v13;
}

void __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "backgroundManagedObjectContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _UNKNOWN **v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t m;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t n;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  VUISidebandSeasonMediaCollection *v31;
  void *v32;
  VUISidebandSeasonMediaCollection *v33;
  void *v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  VUISidebandMediaItem *v46;
  void *v47;
  VUISidebandMediaItem *v48;
  void *v49;
  uint64_t j;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  VUISidebandSeriesMediaCollection *v63;
  void *v64;
  VUISidebandSeriesMediaCollection *v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  uint64_t v72;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  VUIMediaEntityFetchResponse *v90;
  void *v91;
  id obj;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  __CFString *v102;
  __CFString *v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  id v113;
  void *v114;
  void *v115;
  _QWORD v116[4];
  id v117;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v98 = a1;
  obj = *(id *)(a1 + 32);
  v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v153, 16);
  if (v94)
  {
    v93 = *(_QWORD *)v144;
    v3 = &off_1E9F96000;
    v109 = WeakRetained;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v144 != v93)
          objc_enumerationMutation(obj);
        v97 = v4;
        v5 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * v4);
        v113 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v6 = objc_msgSend(v5, "range");
        v95 = v7;
        v96 = v6;
        v139 = 0u;
        v140 = 0u;
        v141 = 0u;
        v142 = 0u;
        v115 = v5;
        objc_msgSend(v5, "mediaEntityTypes");
        v99 = (id)objc_claimAutoreleasedReturnValue();
        v8 = v98;
        v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v139, v152, 16);
        if (v101)
        {
          v100 = *(_QWORD *)v140;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v140 != v100)
                objc_enumerationMutation(v99);
              v10 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v9);
              objc_msgSend(v3[442], "movie");
              v11 = objc_claimAutoreleasedReturnValue();
              if (v10 == (void *)v11)
              {

LABEL_37:
                v105 = v9;
                objc_msgSend(v3[442], "movie");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = CFSTR("TVEpisode");
                if (v10 == v34)
                  v35 = CFSTR("Movie");
                v36 = v35;

                v103 = v36;
                v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", v36);
                objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NIL OR %K IN %@"), CFSTR("entitlementType"), CFSTR("entitlementType"), &unk_1EA0BB850);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setPredicate:", v38);
                v39 = v8;
                v106 = v37;
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v8 + 56) + 8) + 40), "executeFetchRequest:error:", v37, 0);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v135 = 0u;
                v136 = 0u;
                v137 = 0u;
                v138 = 0u;
                v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v135, v151, 16);
                if (v41)
                {
                  v42 = v41;
                  v43 = *(_QWORD *)v136;
                  do
                  {
                    for (i = 0; i != v42; ++i)
                    {
                      if (*(_QWORD *)v136 != v43)
                        objc_enumerationMutation(v40);
                      v45 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * i);
                      v46 = [VUISidebandMediaItem alloc];
                      objc_msgSend(v115, "properties");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v48 = -[VUISidebandMediaItem initWithMediaLibrary:videoManagedObject:requestedProperties:](v46, "initWithMediaLibrary:videoManagedObject:requestedProperties:", WeakRetained, v45, v47);

                      objc_msgSend(v113, "addObject:", v48);
                    }
                    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v135, v151, 16);
                  }
                  while (v42);
                }

                v3 = &off_1E9F96000;
                v16 = v103;
                v9 = v105;
                v8 = v39;
                goto LABEL_47;
              }
              v12 = (void *)v11;
              objc_msgSend(v3[442], "episode");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v10 == v13)
                goto LABEL_37;
              objc_msgSend(v3[442], "show");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (v10 == v14)
              {
                v16 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("TVSeries"));
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v8 + 56) + 8) + 40), "executeFetchRequest:error:", v16, 0);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v131 = 0u;
                v132 = 0u;
                v133 = 0u;
                v134 = 0u;
                v106 = v49;
                v111 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v131, v150, 16);
                if (v111)
                {
                  v102 = v16;
                  v104 = v9;
                  v108 = *(_QWORD *)v132;
                  do
                  {
                    for (j = 0; j != v111; ++j)
                    {
                      if (*(_QWORD *)v132 != v108)
                        objc_enumerationMutation(v106);
                      v51 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * j);
                      v127 = 0u;
                      v128 = 0u;
                      v129 = 0u;
                      v130 = 0u;
                      objc_msgSend(v51, "episodes");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v127, v149, 16);
                      if (v53)
                      {
                        v54 = v53;
                        v55 = *(_QWORD *)v128;
                        while (2)
                        {
                          for (k = 0; k != v54; ++k)
                          {
                            if (*(_QWORD *)v128 != v55)
                              objc_enumerationMutation(v52);
                            v57 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * k);
                            objc_msgSend(v57, "entitlementType");
                            v58 = objc_claimAutoreleasedReturnValue();
                            if (!v58)
                              goto LABEL_67;
                            v59 = (void *)v58;
                            objc_msgSend(v57, "entitlementType");
                            v60 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend(v60, "isEqualToNumber:", &unk_1EA0B9160))
                            {

LABEL_67:
                              v63 = [VUISidebandSeriesMediaCollection alloc];
                              objc_msgSend(v115, "properties");
                              v64 = (void *)objc_claimAutoreleasedReturnValue();
                              v65 = -[VUISidebandSeriesMediaCollection initWithMediaLibrary:seriesManagedObject:requestedProperties:](v63, "initWithMediaLibrary:seriesManagedObject:requestedProperties:", v109, v51, v64);

                              objc_msgSend(v113, "addObject:", v65);
                              goto LABEL_68;
                            }
                            objc_msgSend(v57, "entitlementType");
                            v61 = (void *)objc_claimAutoreleasedReturnValue();
                            v62 = objc_msgSend(v61, "isEqualToNumber:", &unk_1EA0B9178);

                            if (v62)
                              goto LABEL_67;
                          }
                          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v127, v149, 16);
                          if (v54)
                            continue;
                          break;
                        }
                      }
LABEL_68:

                    }
                    v111 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v131, v150, 16);
                  }
                  while (v111);
                  goto LABEL_70;
                }
              }
              else
              {
                objc_msgSend(v3[442], "season");
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                if (v10 != v15)
                  goto LABEL_48;
                v16 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("TVSeason"));
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v8 + 56) + 8) + 40), "executeFetchRequest:error:", v16, 0);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v123 = 0u;
                v124 = 0u;
                v125 = 0u;
                v126 = 0u;
                v106 = v17;
                v110 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v123, v148, 16);
                if (v110)
                {
                  v102 = v16;
                  v104 = v9;
                  v107 = *(_QWORD *)v124;
                  do
                  {
                    for (m = 0; m != v110; ++m)
                    {
                      if (*(_QWORD *)v124 != v107)
                        objc_enumerationMutation(v106);
                      v19 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * m);
                      v119 = 0u;
                      v120 = 0u;
                      v121 = 0u;
                      v122 = 0u;
                      objc_msgSend(v19, "episodes");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v119, v147, 16);
                      if (v21)
                      {
                        v22 = v21;
                        v23 = *(_QWORD *)v120;
                        while (2)
                        {
                          for (n = 0; n != v22; ++n)
                          {
                            if (*(_QWORD *)v120 != v23)
                              objc_enumerationMutation(v20);
                            v25 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * n);
                            objc_msgSend(v25, "entitlementType");
                            v26 = objc_claimAutoreleasedReturnValue();
                            if (!v26)
                              goto LABEL_32;
                            v27 = (void *)v26;
                            objc_msgSend(v25, "entitlementType");
                            v28 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend(v28, "isEqualToNumber:", &unk_1EA0B9160))
                            {

LABEL_32:
                              v31 = [VUISidebandSeasonMediaCollection alloc];
                              objc_msgSend(v115, "properties");
                              v32 = (void *)objc_claimAutoreleasedReturnValue();
                              v33 = -[VUISidebandSeasonMediaCollection initWithMediaLibrary:seasonManagedObject:requestedProperties:](v31, "initWithMediaLibrary:seasonManagedObject:requestedProperties:", v109, v19, v32);

                              objc_msgSend(v113, "addObject:", v33);
                              goto LABEL_33;
                            }
                            objc_msgSend(v25, "entitlementType");
                            v29 = (void *)objc_claimAutoreleasedReturnValue();
                            v30 = objc_msgSend(v29, "isEqualToNumber:", &unk_1EA0B9178);

                            if (v30)
                              goto LABEL_32;
                          }
                          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v119, v147, 16);
                          if (v22)
                            continue;
                          break;
                        }
                      }
LABEL_33:

                    }
                    v110 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v123, v148, 16);
                  }
                  while (v110);
LABEL_70:
                  WeakRetained = v109;
                  v8 = v98;
                  v3 = &off_1E9F96000;
                  v16 = v102;
                  v9 = v104;
                }
              }
LABEL_47:

LABEL_48:
              ++v9;
            }
            while (v9 != v101);
            v66 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v139, v152, 16);
            v101 = v66;
          }
          while (v66);
        }

        v67 = v113;
        objc_msgSend(v115, "predicate");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        v69 = v67;
        if (v68)
        {
          objc_msgSend(v115, "predicate");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "filteredArrayUsingPredicate:", v70);
          v69 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v72 = v95;
        v71 = v96;
        if (v96 == 0x7FFFFFFFFFFFFFFFLL || v95 == 0)
        {
          v74 = v69;
        }
        else
        {
          v75 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v74 = v75;
          if (v96 < v96 + v95)
          {
            do
            {
              if (v71 >= objc_msgSend(v69, "count"))
                break;
              objc_msgSend(v69, "objectAtIndex:", v71);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "addObject:", v76);

              ++v71;
              --v72;
            }
            while (v72);
          }

        }
        v77 = v74;
        VUISidebandMediaItemKind();
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v115, "_isItemsFetch"))
        {
          VUISidebandMediaItemKind();
          v79 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v115, "_isShowsFetch"))
        {
          VUISidebandSeriesMediaCollectionKind();
          v79 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v115, "_isSeasonsFetch"))
            goto LABEL_91;
          VUISidebandSeasonMediaCollectionKind();
          v79 = objc_claimAutoreleasedReturnValue();
        }
        v80 = (void *)v79;

        v78 = v80;
LABEL_91:
        objc_msgSend(v115, "_manualSortDescriptorsWithMediaEntityKind:propertiesRequiredForSort:", v78, 0);
        v81 = objc_claimAutoreleasedReturnValue();
        v82 = v77;
        if (v81)
        {
          objc_msgSend(v77, "sortedArrayUsingDescriptors:", v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v115, "_sortIndexPropertyKeyWithMediaEntityKind:", v78);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = (void *)v81;
        if (v83)
        {
          +[VUIMediaLibraryUtilities sortIndexesForMediaEntities:sortIndexPropertyKey:](VUIMediaLibraryUtilities, "sortIndexesForMediaEntities:sortIndexPropertyKey:", v82, v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v84 = 0;
        }
        objc_msgSend(v115, "groupingKeyPath");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        if (v85)
        {
          v112 = v77;
          v86 = v67;
          objc_msgSend(v115, "groupingSortComparator");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIMediaLibraryUtilities groupingForMediaEntities:groupingKeyPath:groupingSortComparator:performDefaultSort:sortIndexPropertyKey:](VUIMediaLibraryUtilities, "groupingForMediaEntities:groupingKeyPath:groupingSortComparator:performDefaultSort:sortIndexPropertyKey:", v82, v85, v87, 1, v83);
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v115, "_shouldGenerateGroupingSortIndexes"))
          {
            +[VUIMediaLibraryUtilities sortIndexesForGrouping:](VUIMediaLibraryUtilities, "sortIndexesForGrouping:", v88);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v89 = 0;
          }
          v67 = v86;
          v77 = v112;
        }
        else
        {
          v88 = 0;
          v89 = 0;
        }
        v90 = objc_alloc_init(VUIMediaEntityFetchResponse);
        -[VUIMediaEntityFetchResponse setMediaEntities:](v90, "setMediaEntities:", v82);
        -[VUIMediaEntityFetchResponse setSortIndexes:](v90, "setSortIndexes:", v84);
        -[VUIMediaEntityFetchResponse setGrouping:](v90, "setGrouping:", v88);
        -[VUIMediaEntityFetchResponse setGroupingSortIndexes:](v90, "setGroupingSortIndexes:", v89);
        objc_msgSend(*(id *)(v98 + 40), "addObject:", v90);

        v4 = v97 + 1;
        WeakRetained = v109;
        v3 = &off_1E9F96000;
      }
      while (v97 + 1 != v94);
      v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v153, 16);
    }
    while (v94);
  }

  objc_msgSend(WeakRetained, "manager");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = MEMORY[0x1E0C809B0];
  v116[1] = 3221225472;
  v116[2] = __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_4;
  v116[3] = &unk_1E9F99420;
  v118 = *(id *)(v98 + 48);
  v117 = *(id *)(v98 + 40);
  objc_msgSend(v91, "_enqueueCompletionQueueBlock:", v116);

}

uint64_t __66__VUISidebandMediaLibrary_enqueueFetchRequests_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), 0);
  return result;
}

- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  if (v5)
  {
    -[VUIMediaLibrary manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__VUISidebandMediaLibrary_saveMediaEntity_completionHandler___block_invoke;
    v9[3] = &unk_1E9F98E68;
    v10 = v5;
    objc_msgSend(v6, "_enqueueCompletionQueueBlock:", v9);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6978]), "initWithOperation:", 0);

  return v7;
}

uint64_t __61__VUISidebandMediaLibrary_saveMediaEntity_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_imageLoaderIdentifier
{
  return CFSTR("Sideband library");
}

- (id)_imageLoadParamsForImageLoaderObject:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (v4 = v3) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The imageLoaderObject parameter must be an instance of VUISidebandMediaEntityImageLoadParams"));
    v4 = 0;
  }

  return v4;
}

- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v8;
  VUISidebandMediaEntityImageLoadOperation *v9;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = -[VUIImageLoadParamsOperation initWithParams:scaleToSize:cropToFit:]([VUISidebandMediaEntityImageLoadOperation alloc], "initWithParams:scaleToSize:cropToFit:", v8, v5, width, height);

  return v9;
}

- (id)_movieForAdamID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("adamID"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISidebandMediaLibrary _managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:](self, "_managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:", CFSTR("Movie"), v8, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_tvEpisodeForAdamID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("adamID"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISidebandMediaLibrary _managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:](self, "_managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:", CFSTR("TVEpisode"), v8, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_tvSeasonForCanonicalID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("canonicalID"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISidebandMediaLibrary _managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:](self, "_managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:", CFSTR("TVSeason"), v8, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_tvSeasonForAdamID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("adamID"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISidebandMediaLibrary _managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:](self, "_managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:", CFSTR("TVSeason"), v8, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_tvSeriesForCanonicalID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("canonicalID"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISidebandMediaLibrary _managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:](self, "_managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:", CFSTR("TVSeries"), v8, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_tvSeriesForAdamID:(id)a3 createIfNeeded:(BOOL)a4 wasCreated:(BOOL *)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("adamID"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUISidebandMediaLibrary _managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:](self, "_managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:", CFSTR("TVSeries"), v8, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_objectsWithFetchRequest:(id)a3 usingMainThreadContext:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD v19[6];
  _QWORD block[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a4;
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  if (v4)
  {
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__VUISidebandMediaLibrary__objectsWithFetchRequest_usingMainThreadContext___block_invoke;
    block[3] = &unk_1E9F99D88;
    block[4] = self;
    block[5] = &v21;
    dispatch_sync(v7, block);

    objc_msgSend((id)v22[5], "executeFetchRequest:error:", v6, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v28[5];
    v28[5] = v8;
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__VUISidebandMediaLibrary__objectsWithFetchRequest_usingMainThreadContext___block_invoke_2;
    v19[3] = &unk_1E9F99D88;
    v19[4] = self;
    v19[5] = &v21;
    dispatch_sync(v10, v19);

    v12 = (void *)v22[5];
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __75__VUISidebandMediaLibrary__objectsWithFetchRequest_usingMainThreadContext___block_invoke_3;
    v15[3] = &unk_1E9F9A558;
    v17 = &v27;
    v18 = &v21;
    v16 = v6;
    objc_msgSend(v12, "performBlockAndWait:", v15);
    v9 = v16;
  }

  v13 = (id)v28[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v13;
}

void __75__VUISidebandMediaLibrary__objectsWithFetchRequest_usingMainThreadContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__VUISidebandMediaLibrary__objectsWithFetchRequest_usingMainThreadContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "backgroundManagedObjectContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__VUISidebandMediaLibrary__objectsWithFetchRequest_usingMainThreadContext___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "executeFetchRequest:error:", a1[4], 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_managedObjectWithEntityName:(id)a3 predicate:(id)a4 createIfNeeded:(BOOL)a5 wasCreated:(BOOL *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v7 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (a6)
    *a6 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", v10);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__VUISidebandMediaLibrary__managedObjectWithEntityName_predicate_createIfNeeded_wasCreated___block_invoke;
  v18[3] = &unk_1E9F99D88;
  v18[4] = self;
  v18[5] = &v19;
  dispatch_sync(v13, v18);

  objc_msgSend(v12, "setPredicate:", v11);
  objc_msgSend((id)v20[5], "executeFetchRequest:error:", v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15 && v7)
  {
    v16 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v10;
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Creating managed object for entity name %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", v10, v20[5]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
      *a6 = 1;
  }

  _Block_object_dispose(&v19, 8);
  return v15;
}

void __92__VUISidebandMediaLibrary__managedObjectWithEntityName_predicate_createIfNeeded_wasCreated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_removeDownloadedMediaForVideoManagedObject:(id)a3 markAsDeleted:(BOOL)a4 saveWhenDone:(BOOL)a5 invalidateImmediately:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  _QWORD block[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "localPlaybackURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = sLogObject_2;
    v14 = os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        v24 = v12;
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Deleting downloaded video at %@", buf, 0xCu);
      }
      objc_msgSend(v11, "setLocalPlaybackURL:", 0);
      dispatch_get_global_queue(21, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __120__VUISidebandMediaLibrary__removeDownloadedMediaForVideoManagedObject_markAsDeleted_saveWhenDone_invalidateImmediately___block_invoke;
      block[3] = &unk_1E9F98DF0;
      v22 = v12;
      dispatch_async(v15, block);

    }
    else if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "No file path exists for managed object; not deleting existing downloaded video",
        buf,
        2u);
    }
    v17 = sLogObject_2;
    v18 = os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Marking video as deleted", buf, 2u);
      }
      objc_msgSend(v11, "setMarkedAsDeleted:", 1);
      objc_msgSend(v11, "setHasExpirationDate:", 0);
      objc_msgSend(v11, "setAllowsManualRenewal:", 0);
      objc_msgSend(v11, "setAvailabilityEndDate:", 0);
      objc_msgSend(v11, "setShouldMarkAsDeletedAfterCancellationOrFailure:", 0);
    }
    else if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "NOT marking video as deleted", buf, 2u);
    }
    v16 = -[VUISidebandMediaLibrary _invalidateKeysForVideoManagedObject:saveWhenDone:invalidateImmediately:](self, "_invalidateKeysForVideoManagedObject:saveWhenDone:invalidateImmediately:", v11, 0, v6);
    v19 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Removing offline FPS keys from database and setting state to NotDownloaded", buf, 2u);
    }
    objc_msgSend(v11, "setDownloadState:", 0);
    if (v7)
      -[VUISidebandMediaLibrary saveChangesToManagedObjects](self, "saveChangesToManagedObjects");

  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
      -[VUISidebandMediaLibrary _removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:].cold.1();
    v16 = 0;
  }

  return v16;
}

void __120__VUISidebandMediaLibrary__removeDownloadedMediaForVideoManagedObject_markAsDeleted_saveWhenDone_invalidateImmediately___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  int v5;
  id v6;
  NSObject *v7;
  uint8_t v8[8];
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = (uint64_t *)(a1 + 32);
  v9 = 0;
  v5 = objc_msgSend(v2, "removeItemAtURL:error:", v4, &v9);
  v6 = v9;

  v7 = sLogObject_2;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Successfully deleted file; removing local playback URL from database",
        v8,
        2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
  {
    __120__VUISidebandMediaLibrary__removeDownloadedMediaForVideoManagedObject_markAsDeleted_saveWhenDone_invalidateImmediately___block_invoke_cold_1(v3, (uint64_t)v6, v7);
  }

}

- (BOOL)_invalidateKeysForVideoManagedObject:(id)a3 saveWhenDone:(BOOL)a4 invalidateImmediately:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  VUISidebandMediaLibrary *v52;
  id v53;
  _QWORD v54[5];
  _QWORD v55[4];
  id v56;
  BOOL v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD block[6];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint8_t v69[128];
  uint8_t buf[4];
  uint64_t v71;
  uint64_t v72;

  v5 = a5;
  v72 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  if (!v53)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
      -[VUISidebandMediaLibrary _invalidateKeysForVideoManagedObject:saveWhenDone:invalidateImmediately:].cold.1();
    v39 = 0;
    goto LABEL_43;
  }
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__1;
  v67 = __Block_byref_object_dispose__1;
  v68 = 0;
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke;
  block[3] = &unk_1E9F99D88;
  block[4] = self;
  block[5] = &v63;
  v52 = self;
  dispatch_sync(v7, block);

  v8 = (id)sLogObject_2;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v53, "fpsKeyInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v71 = v10;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu key info(s) for this video.  Finding one to use for invalidation", buf, 0xCu);

  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v53, "fpsKeyInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
  if (!v12)
  {
LABEL_20:

    goto LABEL_28;
  }
  v13 = *(_QWORD *)v59;
LABEL_6:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v59 != v13)
      objc_enumerationMutation(v11);
    v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v14);
    if ((objc_msgSend(v15, "isLowValue") & 1) == 0)
      break;
    v16 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v71 = (uint64_t)v15;
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring low value key that cannot be used for invalidation: %@", buf, 0xCu);
    }
LABEL_18:
    if (v12 == ++v14)
    {
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      if (v12)
        goto LABEL_6;
      goto LABEL_20;
    }
  }
  objc_msgSend(v15, "expirationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((objc_msgSend(v17, "vui_isInTheFuture") & 1) == 0)
    {
      objc_msgSend(v15, "playbackExpirationStartDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;

      if (v20)
      {
        v21 = sLogObject_2;
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v71 = (uint64_t)v15;
          _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "Not invalidating expired key: %@", buf, 0xCu);
        }

        goto LABEL_18;
      }
    }
  }
  v22 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v71 = (uint64_t)v15;
    _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "Found key to invalidate: %@", buf, 0xCu);
  }
  v23 = v15;

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v23, "contentID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("contentID"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUISidebandMediaLibrary _managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:](v52, "_managedObjectWithEntityName:predicate:createIfNeeded:wasCreated:", CFSTR("FPSKeyDeletionInfo"), v26, 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "fpsKeyServerURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFpsKeyServerURL:", v28);

    objc_msgSend(v53, "fpsNonceURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFpsNonceURL:", v29);

    objc_msgSend(v53, "additionalFPSRequestParamsJSONData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAdditionalFPSRequestParamsJSONData:", v30);

    objc_msgSend(v53, "dsid");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDsid:", v31);

    objc_msgSend(v23, "keyURI");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setKeyURI:", v32);

    objc_msgSend(v23, "keyData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setKeyData:", v33);

    objc_msgSend(v23, "expirationDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setExpirationDate:", v34);

    objc_msgSend(v23, "playbackExpirationStartDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setPlaybackExpirationStartDate:", v35);

    objc_msgSend(v23, "contentID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setContentID:", v36);

    if (!v5)
    {
      v37 = sLogObject_2;
      if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v37, OS_LOG_TYPE_DEFAULT, "Created key deletion info, but invalidateImmediately is NO.  Will add to penalty box to prevent invalidation, and will skip invalidation", buf, 2u);
      }
    }
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke_176;
    v55[3] = &unk_1E9F9A5F8;
    v57 = v5;
    v56 = v27;
    v38 = v27;
    dispatch_async(MEMORY[0x1E0C80D38], v55);

    v39 = 1;
    goto LABEL_40;
  }
LABEL_28:
  if (!v5)
  {
LABEL_37:
    v48 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v48, OS_LOG_TYPE_DEFAULT, "No key info exists for invalidation", buf, 2u);
    }
    goto LABEL_39;
  }
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("FPSKeyDeletionInfo"));
  v41 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v53, "adamID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("contentID"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "setPredicate:", v43);
  objc_msgSend((id)v64[5], "executeFetchRequest:error:", v40, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v44, "count"))
  {

    goto LABEL_37;
  }
  v45 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v45, OS_LOG_TYPE_DEFAULT, "No key info exists for invalidation, but found a previously existing deletion info for this video.  Removing it from the penalty box and performing invalidation", buf, 2u);
  }
  +[VUISecureInvalidationManager sharedInstance](VUISecureInvalidationManager, "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "firstObject");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "removeDeletionInfoFromPenaltyBox:", v47);

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_178);
LABEL_39:
  v39 = 0;
  v23 = 0;
LABEL_40:
  v49 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v49, OS_LOG_TYPE_DEFAULT, "Removing offline FPS keys from database", buf, 2u);
  }
  objc_msgSend(v53, "fpsKeyInfo");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke_179;
  v54[3] = &unk_1E9F9A640;
  v54[4] = &v63;
  objc_msgSend(v50, "enumerateObjectsUsingBlock:", v54);

  _Block_object_dispose(&v63, 8);
LABEL_43:

  return v39;
}

void __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke_176(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 40);
  +[VUISecureInvalidationManager sharedInstance](VUISecureInvalidationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  if (v2)
  {
    objc_msgSend(v3, "removeDeletionInfoFromPenaltyBox:", v4);

    +[VUISecureInvalidationManager sharedInstance](VUISecureInvalidationManager, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateKeysForDeletedVideos");
  }
  else
  {
    objc_msgSend(v3, "addDeletionInfoToPenaltyBox:", v4);
  }

}

void __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke_177()
{
  id v0;

  +[VUISecureInvalidationManager sharedInstance](VUISecureInvalidationManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invalidateKeysForDeletedVideos");

}

void __99__VUISidebandMediaLibrary__invalidateKeysForVideoManagedObject_saveWhenDone_invalidateImmediately___block_invoke_179(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "deleteObject:", a2);
  v2 = (void *)MEMORY[0x1E0DE7910];
  +[VUIOfflineKeyRenewalManager sharedInstance](VUIOfflineKeyRenewalManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelPreviousPerformRequestsWithTarget:selector:object:", v3, sel_updateKeyRenewalAndExpiration, 0);

  +[VUIOfflineKeyRenewalManager sharedInstance](VUIOfflineKeyRenewalManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSelector:withObject:afterDelay:", sel_updateKeyRenewalAndExpiration, 0, 0.0);

}

- (void)_mainQueueManagedObjectContextDidSave:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  _QWORD *v22;
  id v23;
  id location;
  _QWORD block[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];
  _QWORD v33[3];
  char v34;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C97878]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C97A20]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C97840]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v5, "setByAddingObjectsFromSet:", v7);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v12;
  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v5, "setByAddingObjectsFromSet:", v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v13;
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v5, "setByAddingObjectsFromSet:", v11);
    v14 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v14;
  }
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v15 = MEMORY[0x1E0C809B0];
  v34 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke;
  v32[3] = &unk_1E9F9A668;
  v32[4] = v33;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v32);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke_2;
  block[3] = &unk_1E9F99D88;
  block[4] = self;
  block[5] = &v26;
  dispatch_sync(v16, block);

  objc_initWeak(&location, self);
  v17 = (void *)v27[5];
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke_3;
  v19[3] = &unk_1E9F9A690;
  v21 = &v26;
  v18 = v4;
  v20 = v18;
  v22 = v33;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v17, "performBlock:", v19);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(v33, 8);
}

void __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "backgroundManagedObjectContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[16];

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "mergeChangesFromContextDidSaveNotification:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Done merging changes to background context; Will post media library contents did change notification on next run loop",
        buf,
        2u);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke_186;
    block[3] = &unk_1E9F99C98;
    objc_copyWeak(&v4, (id *)(a1 + 56));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v4);
  }
}

void __65__VUISidebandMediaLibrary__mainQueueManagedObjectContextDidSave___block_invoke_186(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_postContentsDidChangeNotification");

}

- (id)_mainContextManagedObjectsForObjects:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VUISidebandMediaLibrary__mainContextManagedObjectsForObjects___block_invoke;
  block[3] = &unk_1E9F99D88;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(v6, block);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "objectID", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v20[5], "objectWithID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v19, 8);
  return v5;
}

void __64__VUISidebandMediaLibrary__mainContextManagedObjectsForObjects___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_deleteVideoManagedObjects:(id)a3
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  void *v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  void *v35;
  void *v36;
  _BOOL4 v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD block[6];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  -[VUISidebandMediaLibrary _mainContextManagedObjectsForObjects:](self, "_mainContextManagedObjectsForObjects:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v69 != v6)
          objc_enumerationMutation(v3);
        v4 |= -[VUISidebandMediaLibrary _removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:](self, "_removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i), 1, 0, 1);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    }
    while (v5);
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v65 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "series");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "season");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v8, "addObject:", v15);
          if (v16)
            objc_msgSend(v9, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    }
    while (v11);
  }

  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__1;
  v62 = __Block_byref_object_dispose__1;
  v63 = 0;
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VUISidebandMediaLibrary__deleteVideoManagedObjects___block_invoke;
  block[3] = &unk_1E9F99D88;
  block[4] = self;
  block[5] = &v58;
  dispatch_sync(v17, block);

  v42 = v9;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v10;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v76, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v54 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
        v22 = sLogObject_2;
        if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v75 = v21;
          _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "Deleting managed object %@", buf, 0xCu);
        }
        objc_msgSend((id)v59[5], "deleteObject:", v21);
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v76, 16);
    }
    while (v18);
  }

  objc_msgSend((id)v59[5], "processPendingChanges");
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v23 = v42;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v73, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v50;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v50 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * m);
        objc_msgSend(v27, "episodes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count") == 0;

        if (v29)
        {
          v30 = sLogObject_2;
          if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v27;
            _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, "No more episodes exist for season.  Deleting managed object %@", buf, 0xCu);
          }
          objc_msgSend((id)v59[5], "deleteObject:", v27);
        }
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v73, 16);
    }
    while (v24);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v31 = v8;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v72, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v46;
    do
    {
      for (n = 0; n != v32; ++n)
      {
        if (*(_QWORD *)v46 != v33)
          objc_enumerationMutation(v31);
        v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * n);
        objc_msgSend(v35, "episodes");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "count") == 0;

        if (v37)
        {
          v38 = sLogObject_2;
          if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v35;
            _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "No more episodes exist for series.  Deleting managed object %@", buf, 0xCu);
          }
          objc_msgSend((id)v59[5], "deleteObject:", v35);
        }
      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v72, 16);
    }
    while (v32);
  }

  -[VUISidebandMediaLibrary saveChangesToManagedObjects](self, "saveChangesToManagedObjects");
  if ((v4 & 1) == 0)
  {
    v39 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v39, OS_LOG_TYPE_DEFAULT, "Posting secure invalidation complete notification because no videos will be invalidated", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "postNotificationName:object:", CFSTR("VUITellAppRemovalServiceThatSecureInvalidationDidCompleteNotification"), 0);

  }
  _Block_object_dispose(&v58, 8);

}

void __54__VUISidebandMediaLibrary__deleteVideoManagedObjects___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_195(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("Video"));
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_2;
  block[3] = &unk_1E9F99D88;
  v14 = a1;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = &v24;
  dispatch_sync(v2, block);

  objc_msgSend((id)v25[5], "executeFetchRequest:error:", v15, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "localPlaybackURL", v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = sLogObject_2;
          if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v10;
            _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "SidebandMediaLibrary - download path found: %@", buf, 0xCu);
          }
          objc_msgSend(v4, "addObject:", v10);
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
    }
    while (v6);
  }

  dispatch_get_global_queue(21, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_196;
  v16[3] = &unk_1E9F98FD8;
  v17 = *(id *)(v14 + 40);
  v18 = v4;
  v13 = v4;
  dispatch_async(v12, v16);

  _Block_object_dispose(&v24, 8);
}

void __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_196(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  __int128 v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v16;
    *(_QWORD *)&v4 = 138412546;
    v13 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8, v13) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 0;
          v10 = objc_msgSend(v9, "removeItemAtPath:error:", v8, &v14);
          v11 = v14;

          v12 = sLogObject_2;
          if (v10)
          {
            if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v20 = v8;
              _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Removed orphaned download at path %@", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            v20 = v8;
            v21 = 2112;
            v22 = v11;
            _os_log_error_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_ERROR, "Failed to Remove orphaned download at path %@.  Error: %@", buf, 0x16u);
          }

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v5);
  }

}

void __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke_201(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  v4 = objc_msgSend(*(id *)(a1 + 40), "count");
  v5 = MEMORY[0x1E0C809B0];
  if (v3 == v4)
  {
    v6 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke_2;
    v18[3] = &unk_1E9F9A6B8;
    v19 = v2;
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 40);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);

  }
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke_3;
  v10[3] = &unk_1E9F9A6E0;
  objc_copyWeak(&v17, (id *)(a1 + 96));
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(void **)(a1 + 88);
  v14 = v7;
  v15 = v8;
  v16 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v17);
}

void __65__VUISidebandMediaLibrary__pruneVideosAtAppLaunchWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a2, "path");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9 || (v5 = objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v9), v6 = (void *)v9, (v5 & 1) == 0))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v6 = (void *)v9;
  }

}

- (void)_removeDownloadsForNonSignedInUsers
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[VUISidebandMediaLibrary _downloadedVideosForNonSignedInUsers](self, "_downloadedVideosForNonSignedInUsers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 134217984;
    v17 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Removing %lu downloads for users that are not signed in", buf, 0xCu);

  }
  if (objc_msgSend(v3, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          -[VUISidebandMediaLibrary _removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:](self, "_removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), 1, 0, 1, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[VUISidebandMediaLibrary saveChangesToManagedObjects](self, "saveChangesToManagedObjects");
  }

}

- (void)_activeAccountDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id buf[2];

  v4 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Active account did change", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VUISidebandMediaLibrary__activeAccountDidChange___block_invoke;
  block[3] = &unk_1E9F99C98;
  objc_copyWeak(&v6, buf);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __51__VUISidebandMediaLibrary__activeAccountDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeDownloadsForNonSignedInUsers");

}

- (id)performFetch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  -[VUISidebandMediaLibrary serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__VUISidebandMediaLibrary_performFetch___block_invoke;
  v8[3] = &unk_1E9F99D88;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  objc_msgSend((id)v10[5], "executeFetchRequest:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __40__VUISidebandMediaLibrary_performFetch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_backgroundManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)initWithManager:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "Unable to load store descriptions for defaultDirectoryURL %@", buf, 0xCu);

}

- (void)initWithManager:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to find sideband library managed object model", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)videoForPlayable:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to find/add video because it has no adam ID or playback URL is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)videoForPlayable:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to save video post play image because playable metadata is missing: url format, width, and/or height", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)videoForPlayable:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to save video preview frame because playable metadata is missing: url format, width, and/or height", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)videoForPlayable:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to save video cover art because playable metadata is missing: url format, width, and/or height", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)videoForPlayable:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Unable to serialize vpafMetrics data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

- (void)videoForPlayable:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Unable to serialize fpsAdditionalServerParams data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

- (void)videoForPlayable:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to find/add managed object for video because it has no series canonical ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)videoForPlayable:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to save series cover art because playable metadata is missing: url format, width, and/or height", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)videoForMPMediaItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to find/add video because it has no adam ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_removeDownloadedMediaForVideoManagedObject:markAsDeleted:saveWhenDone:invalidateImmediately:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to remove media because video managed object is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __120__VUISidebandMediaLibrary__removeDownloadedMediaForVideoManagedObject_markAsDeleted_saveWhenDone_invalidateImmediately___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "Unable to delete contents at %@: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4_9();
}

- (void)_invalidateKeysForVideoManagedObject:saveWhenDone:invalidateImmediately:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to invalidate keys because video managed object is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __51__VUISidebandMediaLibrary__deleteOrphanedDownloads__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Unable to retrieve Library directory contents: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

- (void)_pruneVideosAtAppLaunchWithCompletion:(_QWORD *)a3 .cold.1(void *a1, uint64_t a2, _QWORD *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = objc_begin_catch(a1);
  *a3 = v4;
  v5 = v4;
  v6 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Posting secure invalidation complete notification because an exception occurred", v7, 2u);
  }
  OUTLINED_FUNCTION_4_9();
}

@end
