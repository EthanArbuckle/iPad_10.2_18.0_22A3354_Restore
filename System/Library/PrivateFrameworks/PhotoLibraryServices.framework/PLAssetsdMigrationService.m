@implementation PLAssetsdMigrationService

- (PLAssetsdMigrationService)initWithLibraryServicesManager:(id)a3
{
  id v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLAssetsdMigrationService;
  v3 = -[PLAbstractLibraryServicesManagerService initWithLibraryServicesManager:](&v12, sel_initWithLibraryServicesManager_, a3);
  if (v3)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.assetsd.migration-services", v4);
    v6 = (void *)*((_QWORD *)v3 + 2);
    *((_QWORD *)v3 + 2) = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create_with_target_V2("com.apple.assetsd.migration-services.data-migrator", v8, *((dispatch_queue_t *)v3 + 2));
    v10 = (void *)*((_QWORD *)v3 + 3);
    *((_QWORD *)v3 + 3) = v9;

  }
  return (PLAssetsdMigrationService *)v3;
}

- (void)cleanupModelForDataMigrationForRestoreType:(int64_t)a3 reply:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  NSObject *dataMigratordQueue;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  _QWORD block[5];
  id v21;
  int64_t v22;
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v23) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199541000, "PLXPC Service: cleanupModelForDataMigrationForRestoreType:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  PLMigrationGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 2)
      v11 = CFSTR("none");
    else
      v11 = off_1E3671CA0[a3 - 1];
    v12 = v11;
    qos_class_self();
    PLStringFromQoSClass();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = (const char *)v12;
    v28 = 2114;
    v29 = v13;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Received Clean up model after data migration for restore type %{public}@ at QoS: %{public}@", buf, 0x16u);

  }
  dataMigratordQueue = self->_dataMigratordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PLAssetsdMigrationService_cleanupModelForDataMigrationForRestoreType_reply___block_invoke;
  block[3] = &unk_1E3674C40;
  block[4] = self;
  v22 = a3;
  v15 = v6;
  v21 = v15;
  dispatch_async(dataMigratordQueue, block);

  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "Received Clean up model after data migration for restore type %{public}@ at QoS: %{public}@", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)dataMigrationWillFinishWithReply:(id)a3
{
  void (**v4)(_QWORD);
  int v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  const char *Name;
  __int128 v11;
  __int128 v12;
  SEL sel[2];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v12 = 0u;
  *(_OWORD *)sel = 0u;
  v11 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((_QWORD *)&v11 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: dataMigrationWillFinishWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v12 + 8));
  }
  PLMigrationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    qos_class_self();
    PLStringFromQoSClass();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Received data migration will finish at QoS: %{public}@", buf, 0xCu);

  }
  pl_dispatch_once();
  -[PLAssetsdMigrationService _migrateWellknownLibraries](self, "_migrateWellknownLibraries");
  v4[2](v4);
  if ((_BYTE)v11)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v12 + 8));
  if ((_QWORD)v12)
  {
    PLRequestGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v15 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v9, OS_SIGNPOST_INTERVAL_END, v12, "Received Clean up model after data migration for restore type %{public}@ at QoS: %{public}@", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)_migrateWellknownLibraries
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *backgroundQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_msgSend(MEMORY[0x1E0D73280], "libraryCreateOptionsForWellKnownLibraryIdentifier:", 3);
  v15 = CFSTR("PLPhotoLibraryCreateOptions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLAssetsdMigrationService _migrateWellknownLibraries]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundQueue = self->_backgroundQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PLAssetsdMigrationService__migrateWellknownLibraries__block_invoke;
  block[3] = &unk_1E3677C18;
  v13 = v3;
  v14 = v8;
  v10 = v8;
  v11 = v3;
  dispatch_async(backgroundQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataMigratordQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
}

uint64_t __55__PLAssetsdMigrationService__migrateWellknownLibraries__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_25368);
  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

void __55__PLAssetsdMigrationService__migrateWellknownLibraries__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  PLLibraryOpenerCreationOptions *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a2, "integerValue");
  objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryURLForIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLMigrationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    PLStringFromWellKnownPhotoLibraryIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v5;
    v27 = 2112;
    v28 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "migrate %@ at %@ STARTING", buf, 0x16u);

  }
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openBundleAtLibraryURL:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PLLibraryOpenerCreationOptions initWithWellKnownLibraryIdentifier:]([PLLibraryOpenerCreationOptions alloc], "initWithWellKnownLibraryIdentifier:", v2);
  objc_msgSend(v7, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCreateMode:options:", 1, v8);

  objc_msgSend(v7, "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v11 = objc_msgSend(v10, "activate:", &v24);
  v12 = v24;

  if (v11)
  {
    objc_msgSend(v7, "libraryServicesManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v12;
    v14 = objc_msgSend(v13, "awaitLibraryState:error:", 7, &v23);
    v15 = v23;

    PLMigrationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        PLStringFromWellKnownPhotoLibraryIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        v19 = "migrate %@ COMPLETE";
        v20 = v17;
        v21 = OS_LOG_TYPE_DEFAULT;
        v22 = 12;
LABEL_10:
        _os_log_impl(&dword_199541000, v20, v21, v19, buf, v22);

      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      PLStringFromWellKnownPhotoLibraryIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v18;
      v27 = 2112;
      v28 = v15;
      v19 = "migrate %@ FAILED: %@";
      v20 = v17;
      v21 = OS_LOG_TYPE_ERROR;
      v22 = 22;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  v15 = v12;
LABEL_12:

}

void __62__PLAssetsdMigrationService_dataMigrationWillFinishWithReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PLPhotoLibraryOptions *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  PLMigrationGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    qos_class_self();
    PLStringFromQoSClass();
    v3 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Running data migration will finish at QoS: %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelMigrator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceRestoreMigrationSupport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isRestoreFromBackupSourceCloud");

  if (v7)
  {
    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Not importing file system data in data migrator will finish due to OTA restore", buf, 2u);
    }

    objc_msgSend(v4, "modelMigrator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dontImportFileSystemDataIntoDatabaseWithPhotoLibrary:", 0);

    objc_msgSend(v4, "modelMigrator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postProcessingToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "needsToPrepareForBackgroundRestore"))
    {
      objc_msgSend(v4, "libraryURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc_init(PLPhotoLibraryOptions);
      -[PLPhotoLibraryOptions setRequiredState:](v13, "setRequiredState:", 6);
      v27 = 0;
      v14 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLAssetsdMigrationService dataMigrationWillFinishWithReply:]_block_invoke", v12, v13, &v27);
      v15 = v27;
      if (!v14)
      {
        PLMigrationGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v29 = "-[PLAssetsdMigrationService dataMigrationWillFinishWithReply:]_block_invoke";
          v30 = 2112;
          v31 = v12;
          v32 = 2112;
          v33 = v15;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
        }

      }
    }
    if (objc_msgSend(v4, "isCloudPhotoLibraryEnabled"))
    {
      PLMigrationGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Importing faces file system data in data migrator will finish due to OTA restore", buf, 2u);
      }

      objc_msgSend(v4, "modelMigrator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "loadFacesFileSystemDataIntoDatabase");

    }
  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLAssetsdMigrationService dataMigrationWillFinishWithReply:]_block_invoke");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(NSObject **)(v20 + 16);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __62__PLAssetsdMigrationService_dataMigrationWillFinishWithReply___block_invoke_2;
  v24[3] = &unk_1E3677530;
  v24[4] = v20;
  v25 = v4;
  v26 = v19;
  v22 = v19;
  v23 = v4;
  dispatch_async(v21, v24);

}

void __62__PLAssetsdMigrationService_dataMigrationWillFinishWithReply___block_invoke_2(uint64_t a1)
{
  int v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v2 = objc_msgSend((id)objc_opt_class(), "applyBackupExclusionToFileProviderDocumentStorage:", &v11);
  v3 = v11;
  PLMigrationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v6 = "Wrote backup exclusion attribute on photos file provider document storage URL";
      v7 = v5;
      v8 = OS_LOG_TYPE_INFO;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_199541000, v7, v8, v6, buf, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    v6 = "Failed to write backup exclusion on photos file provider document storage URL, %@";
    v7 = v5;
    v8 = OS_LOG_TYPE_ERROR;
    v9 = 12;
    goto LABEL_6;
  }

  +[PLModelMigrator waitForDataMigratorToExit](PLModelMigrator, "waitForDataMigratorToExit");
  objc_msgSend(*(id *)(a1 + 40), "modelMigrator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "migratePersonContactInfo");

  objc_msgSend(*(id *)(a1 + 48), "stillAlive");
}

uint64_t __78__PLAssetsdMigrationService_cleanupModelForDataMigrationForRestoreType_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelMigrator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanupModelForDataMigrationForRestoreType:", *(_QWORD *)(a1 + 48));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)photosFileProviderManagerDocumentStorageURL:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString **v10;
  uint64_t *v11;
  void *v12;
  id v13;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAD28]), "_initWithProviderIdentifier:groupName:", CFSTR("com.apple.mobileslideshow.PhotosFileProvider"), CFSTR("group.com.apple.mobileslideshow.PhotosFileProvider"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "documentStorageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_8;
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D74498];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("Unable to retrieve photos file provider manager document storage URL");
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = (const __CFString **)v18;
    v11 = &v17;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D74498];
    v15 = *MEMORY[0x1E0CB2D50];
    v16 = CFSTR("Unable to access photos file provider manager");
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = &v16;
    v11 = &v15;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 41003, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v13 = objc_retainAutorelease(v13);
    *a3 = v13;
  }

  v6 = 0;
LABEL_8:

  return v6;
}

+ (BOOL)applyBackupExclusionToFileProviderDocumentStorage:(id *)a3
{
  void *v3;
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  objc_msgSend(a1, "photosFileProviderManagerDocumentStorageURL:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    v12 = v4;
    v5 = objc_msgSend(MEMORY[0x1E0D73288], "setTimeMachineExclusionAttribute:url:error:", 1, v3, &v12);
    v6 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to apply backup exclusion, %@"), v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D74498];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 41003, v10);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = 0;
    v4 = (id)v7;
  }

  return v5;
}

@end
