@implementation PLAssetsdDebugService

- (id)_persistentStoreCoordinator
{
  void *v2;
  void *v3;

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLAssetsdDebugService)initWithLibraryServicesManager:(id)a3 resourceDownloader:(id)a4 bundleController:(id)a5 connectionAuthorization:(id)a6
{
  id v11;
  id v12;
  id v13;
  PLAssetsdDebugService *v14;
  PLAssetsdDebugService *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PLAssetsdDebugService;
  v14 = -[PLAbstractLibraryServicesManagerService initWithLibraryServicesManager:](&v17, sel_initWithLibraryServicesManager_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_resourceDownloader, a4);
    objc_storeStrong((id *)&v15->_bundleController, a5);
    objc_storeStrong((id *)&v15->_connectionAuthorization, a6);
  }

  return v15;
}

- (void)statusWithReply:(id)a3
{
  void (**v4)(id, void *);
  int v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  __int128 v12;
  __int128 v13;
  SEL sel[2];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v13 = 0u;
  *(_OWORD *)sel = 0u;
  v12 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((_QWORD *)&v12 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: statusWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  +[PLPhotoLibrary queueStatusDescription](PLPhotoLibrary, "queueStatusDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryBundleController libraryServicesStatusDescription](self->_bundleController, "libraryServicesStatusDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v8);

  if ((_BYTE)v12)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  if ((_QWORD)v13)
  {
    PLRequestGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asynchronousUnloadImageFilesForAssetWithObjectURI:(id)a3 minimumFormat:(unsigned __int16)a4 reply:(id)a5
{
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  const char *Name;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  __int128 *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  __int128 *p_buf;
  unsigned __int16 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  __int128 v45;
  SEL sel[2];
  uint64_t v47;
  const __CFString *v48;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v45 = 0u;
  *(_OWORD *)sel = 0u;
  v44 = 0u;
  v10 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v44) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199541000, "PLXPC Service: asynchronousUnloadImageFilesForAssetWithObjectURI:minimumFormat:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v44 + 1);
    *((_QWORD *)&v44 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v45 + 8));
  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__16431;
  v52 = __Block_byref_object_dispose__16432;
  v53 = 0;
  if ((MEMORY[0x19AEC04BC]() & 1) != 0)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "databaseContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService asynchronousUnloadImageFilesForAssetWithObjectURI:minimumFormat:reply:]");

    objc_msgSend(v15, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "persistentStoreCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "managedObjectIDForURIRepresentation:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke;
    v34[3] = &unk_1E36757D8;
    v20 = v18;
    v35 = v20;
    v21 = v15;
    v39 = a4;
    v36 = v21;
    v37 = &v40;
    p_buf = &buf;
    v30[0] = v19;
    v30[1] = 3221225472;
    v30[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_8;
    v30[3] = &unk_1E3674CE0;
    v31 = v9;
    v32 = &v40;
    v33 = &buf;
    objc_msgSend(v21, "performTransaction:completionHandler:", v34, v30);

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    v48 = CFSTR("Unauthorized access");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41010, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v24;

    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, *((unsigned __int8 *)v41 + 24), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v40, 8);
  if ((_BYTE)v44)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v45 + 8));
  if ((_QWORD)v45)
  {
    PLRequestGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = v45;
    if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)identifyAssetsWithInconsistentCloudState
{
  int v3;
  PLManagedAssetRecoveryManager *v4;
  void *v5;
  PLManagedAssetRecoveryManager *v6;
  NSObject *v7;
  NSObject *v8;
  const char *Name;
  __int128 v10;
  __int128 v11;
  SEL sel[2];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  *(_OWORD *)sel = 0u;
  v10 = 0u;
  v3 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v10) = v3;
  if (v3)
  {
    *((_QWORD *)&v10 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: identifyAssetsWithInconsistentCloudState", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  v4 = [PLManagedAssetRecoveryManager alloc];
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLManagedAssetRecoveryManager initWithLibraryServicesManager:](v4, "initWithLibraryServicesManager:", v5);

  -[PLManagedAssetRecoveryManager identifyAssetsWithInconsistentCloudState](v6, "identifyAssetsWithInconsistentCloudState");
  if ((_BYTE)v10)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  if ((_QWORD)v11)
  {
    PLRequestGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)recoverAssetsInInconsistentCloudState
{
  int v3;
  void *v4;
  void *v5;
  id v6;
  PLManagedAssetRecoveryManager *v7;
  void *v8;
  PLManagedAssetRecoveryManager *v9;
  NSObject *v10;
  NSObject *v11;
  const char *Name;
  __int128 v13;
  char v14;
  __int128 v15;
  SEL sel[2];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  *(_OWORD *)sel = 0u;
  v13 = 0u;
  v3 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v13) = v3;
  if (v3)
  {
    *((_QWORD *)&v13 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: recoverAssetsInInconsistentCloudState", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudPhotoLibraryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D73348]);
    v7 = [PLManagedAssetRecoveryManager alloc];
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PLManagedAssetRecoveryManager initWithLibraryServicesManager:](v7, "initWithLibraryServicesManager:", v8);

    -[PLManagedAssetRecoveryManager startRecoveryUsingCloudPhotoLibraryManager:transaction:shouldIdentifyInconsistentAssets:](v9, "startRecoveryUsingCloudPhotoLibraryManager:transaction:shouldIdentifyInconsistentAssets:", v5, v6, 0);
  }

  if (v14)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v15 + 8));
  if ((_QWORD)v15)
  {
    PLRequestGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v18 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)momentGenerationStatusWithReply:(id)a3
{
  void (**v4)(id, void *);
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const char *Name;
  __int128 v13;
  char v14;
  __int128 v15;
  SEL sel[2];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v15 = 0u;
  *(_OWORD *)sel = 0u;
  v13 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v13) = v5;
  if (v5)
  {
    *((_QWORD *)&v13 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: momentGenerationStatusWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "momentGenerationDataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "momentGenerationStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v9);

  if (v14)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v15 + 8));
  if ((_QWORD)v15)
  {
    PLRequestGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v18 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)rebuildMomentsDeletingExistingMoments:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *Name;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  SEL sel[2];
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v4 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v25 = 0u;
  *(_OWORD *)sel = 0u;
  v24 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v24) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199541000, "PLXPC Service: rebuildMomentsDeletingExistingMoments:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v24 + 1);
    *((_QWORD *)&v24 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  v10 = (void *)MEMORY[0x19AEC1554]();
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "momentGenerationDataManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "generator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v29 = PLMomentGenerationShouldDeleteAllMomentsKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __69__PLAssetsdDebugService_rebuildMomentsDeletingExistingMoments_reply___block_invoke;
    v22[3] = &unk_1E3676CD8;
    v23 = v6;
    objc_msgSend(v13, "rebuildAllMomentsWithOptions:completionHandler:", v15, v22);

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Failed to obtain moment generator");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41001, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v6 + 2))(v6, v15);
  }

  objc_autoreleasePoolPop(v10);
  if ((_BYTE)v24)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  if ((_QWORD)v25)
  {
    PLRequestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)rebuildHighlightsDeletingExistingHighlights:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *Name;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  SEL sel[2];
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v4 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v25 = 0u;
  *(_OWORD *)sel = 0u;
  v24 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v24) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199541000, "PLXPC Service: rebuildHighlightsDeletingExistingHighlights:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v24 + 1);
    *((_QWORD *)&v24 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  v10 = (void *)MEMORY[0x19AEC1554]();
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "momentGenerationDataManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "generator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v29 = PLMomentGenerationShouldDeleteAllHighlightsKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__PLAssetsdDebugService_rebuildHighlightsDeletingExistingHighlights_reply___block_invoke;
    v22[3] = &unk_1E3676CD8;
    v23 = v6;
    objc_msgSend(v13, "rebuildAllHighlightsWithOptions:completionHandler:", v15, v22);

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Failed to obtain moment generator");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41001, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v6 + 2))(v6, v15);
  }

  objc_autoreleasePoolPop(v10);
  if ((_BYTE)v24)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  if ((_QWORD)v25)
  {
    PLRequestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)dumpMetadataForMomentsToPath:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *Name;
  __int128 v16;
  __int128 v17;
  SEL sel[2];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v17 = 0u;
  *(_OWORD *)sel = 0u;
  v16 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v16) = v8;
  if (v8)
  {
    *((_QWORD *)&v16 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: dumpMetadataForMomentsToPath:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v16 + 1), (os_activity_scope_state_t)((char *)&v17 + 8));
  }
  if (MEMORY[0x19AEC04BC]())
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "momentGenerationDataManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "generator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "allAssetMetadataWriteToFile:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v7[2](v7, v12);

  if ((_BYTE)v16)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v17 + 8));
  if ((_QWORD)v17)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v20 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)dumpMomentsMetadataToPath:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *Name;
  __int128 v16;
  __int128 v17;
  SEL sel[2];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v17 = 0u;
  *(_OWORD *)sel = 0u;
  v16 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v16) = v8;
  if (v8)
  {
    *((_QWORD *)&v16 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: dumpMomentsMetadataToPath:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v16 + 1), (os_activity_scope_state_t)((char *)&v17 + 8));
  }
  if (MEMORY[0x19AEC04BC]())
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "momentGenerationDataManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "generator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "allMomentsMetadataWriteToFile:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v7[2](v7, v12);

  if ((_BYTE)v16)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v17 + 8));
  if ((_QWORD)v17)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v20 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)dropSearchIndexWithReply:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  SEL sel[2];
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  *(_OWORD *)sel = 0u;
  v24 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v24) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: dropSearchIndexWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v24 + 1);
    *((_QWORD *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSearchIndexingEnabled");

  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "searchIndexingEngine");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLAssetsdDebugService dropSearchIndexWithReply:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __50__PLAssetsdDebugService_dropSearchIndexWithReply___block_invoke;
      v22[3] = &unk_1E366F590;
      v23 = v4;
      objc_msgSend(v11, "dropSearchIndexWithSourceName:completion:", v12, v22);

      v13 = &v23;
    }
    else
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "searchIndexManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __50__PLAssetsdDebugService_dropSearchIndexWithReply___block_invoke_2;
      v20[3] = &unk_1E3676CD8;
      v21 = v4;
      objc_msgSend(v11, "dropSearchIndexWithCompletion:", v20);
      v13 = &v21;
    }

    v15 = *v13;
    goto LABEL_12;
  }
  PLGatekeeperXPCGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[PLAssetsdDebugService dropSearchIndexWithReply:]";
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
  }

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46309, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v15);
LABEL_12:

  }
  if ((_BYTE)v24)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  if ((_QWORD)v25)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)closeSearchIndexWithReply:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  const char *Name;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  __int128 v21;
  SEL sel[2];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v20 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v20) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: closeSearchIndexWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v20 + 1);
    *((_QWORD *)&v20 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSearchIndexingEnabled");

  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51__PLAssetsdDebugService_closeSearchIndexWithReply___block_invoke;
      v18[3] = &unk_1E3675C58;
      v18[4] = self;
      v19 = v4;
      objc_msgSend(v10, "sync:identifyingBlock:library:", v18, 0, 0);

    }
    else
    {
      PLGatekeeperXPCGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[PLAssetsdDebugService closeSearchIndexWithReply:]";
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Closing search index not supported for legacy search indexing %s", buf, 0xCu);
      }

    }
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[PLAssetsdDebugService closeSearchIndexWithReply:]";
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
    }

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46309, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v12);

    }
  }
  if ((_BYTE)v20)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  if ((_QWORD)v21)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)setSearchIndexPaused:(BOOL)a3 reason:(id)a4 reply:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *Name;
  __int128 v19;
  char v20;
  __int128 v21;
  SEL sel[2];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v6 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v19 = 0u;
  v10 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v19) = v10;
  if (v10)
  {
    *((_QWORD *)&v19 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: setSearchIndexPaused:reason:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSearchIndexingEnabled");

  if (!v12)
  {
    PLGatekeeperXPCGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136315138;
    v24 = "-[PLAssetsdDebugService setSearchIndexPaused:reason:reply:]";
    v14 = "Search index manager disabled, unable to perform operation %s";
    goto LABEL_10;
  }
  if (_os_feature_enabled_impl())
  {
    if (v6)
    {
      PLGatekeeperXPCGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 136315138;
      v24 = "-[PLAssetsdDebugService setSearchIndexPaused:reason:reply:]";
      v14 = "Pausing search indexing no longer supported for background job indexing %s";
      goto LABEL_10;
    }
    PLGatekeeperXPCGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[PLAssetsdDebugService setSearchIndexPaused:reason:reply:]";
      v14 = "Unpausing search indexing no longer supported for background job indexing.  Force run the appropriate backgr"
            "ound job instead %s";
LABEL_10:
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
    }
  }
  else
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject searchIndexManager](v13, "searchIndexManager");
    if (v6)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pauseIndexingWithReason:", v8);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "unpauseIndexingWithReason:", v8);
    }

  }
LABEL_17:

  if (v9)
    v9[2](v9);
  if (v20)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  if ((_QWORD)v21)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)rebuildSearchIndexWithReply:(id)a3
{
  void (**v4)(_QWORD);
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  _QWORD v21[4];
  void (**v22)(_QWORD);
  __int128 v23;
  __int128 v24;
  SEL sel[2];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v24 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v23) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: rebuildSearchIndexWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSearchIndexingEnabled");

  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "databaseContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService rebuildSearchIndexWithReply:]");

      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "searchIndexingEngine");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __53__PLAssetsdDebugService_rebuildSearchIndexWithReply___block_invoke;
      v21[3] = &unk_1E3676CD8;
      v22 = v4;
      objc_msgSend(v14, "resetSearchIndexWithReason:library:dropCompletion:completion:", 5, v12, v21, 0);

      v15 = v22;
    }
    else
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "searchIndexManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resetSearchIndexWithReason:dropCompletion:", 5, v4);
    }

  }
  else
  {
    PLGatekeeperXPCGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[PLAssetsdDebugService rebuildSearchIndexWithReply:]";
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
    }

    if (v4)
      v4[2](v4);
  }
  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)searchAttributesForAssetWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  __int128 *p_buf;
  __int128 v25;
  __int128 v26;
  SEL sel[2];
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v26 = 0u;
  *(_OWORD *)sel = 0u;
  v25 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v25) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: searchAttributesForAssetWithUUID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v25 + 1);
    *((_QWORD *)&v25 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__16431;
  v31 = __Block_byref_object_dispose__16432;
  v32 = 0;
  v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService searchAttributesForAssetWithUUID:reply:]");
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64__PLAssetsdDebugService_searchAttributesForAssetWithUUID_reply___block_invoke;
  v20[3] = &unk_1E3676EC8;
  v13 = v6;
  v21 = v13;
  v14 = v11;
  v22 = v14;
  v15 = v12;
  v23 = v15;
  p_buf = &buf;
  objc_msgSend(v14, "performBlockAndWait:", v20);
  v7[2](v7, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v25)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  if ((_QWORD)v26)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)indexAssetsWithUUIDs:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  const __CFString *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchIndexingEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PLGatekeeperXPCGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Search: Index Assets: %@", buf, 0xCu);
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__PLAssetsdDebugService_indexAssetsWithUUIDs_reply___block_invoke;
    v17[3] = &unk_1E366F590;
    v18 = v7;
    objc_msgSend(v9, "indexAssetsWithUUIDs:partialUpdateMask:completion:", v6, 3, v17);
    v12 = v18;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v13;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to get IndexingEngine for libraryServicesManager %@. Unable to index assets: %@", buf, 0x16u);

    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D74498];
    v19 = *MEMORY[0x1E0CB2938];
    v20 = CFSTR("No PLSearchIndexingEngine.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 41008, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);
  }

}

- (void)rebuildCloudFeedWithReply:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  PLCloudFeedEntriesManager *v9;
  NSObject *v10;
  NSObject *v11;
  const char *Name;
  __int128 v13;
  char v14;
  __int128 v15;
  SEL sel[2];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  *(_OWORD *)sel = 0u;
  v13 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v13) = v5;
  if (v5)
  {
    *((_QWORD *)&v13 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: rebuildCloudFeedWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService rebuildCloudFeedWithReply:]");

  v9 = -[PLCloudFeedEntriesManager initWithPhotoLibrary:]([PLCloudFeedEntriesManager alloc], "initWithPhotoLibrary:", v8);
  -[PLCloudFeedEntriesManager rebuildAllEntries:](v9, "rebuildAllEntries:", v4);

  if (v14)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v15 + 8));
  if ((_QWORD)v15)
  {
    PLRequestGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v18 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)rebuildAllThumbnails
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v10;
  os_activity_scope_state_s v11[3];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(v11, 0, 32);
  v10 = 0u;
  v3 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v10) = v3;
  if (v3)
  {
    *((_QWORD *)&v10 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: rebuildAllThumbnails", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)&v11[0].opaque[1]);
  }
  -[PLAssetsdDebugService _persistentStoreCoordinator](self, "_persistentStoreCoordinator", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelMigrator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debug_resetThumbnailsAndInitiateRebuildRequestInStore:", v6);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)PLPhotoLibraryForceClientExitNotification, 0, 0, 0);
  sleep(1u);
  exit(1);
}

- (void)removeAllThumbnailsForDryRun:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *, void *);
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *Name;
  __int128 v19;
  char v20;
  __int128 v21;
  SEL sel[2];
  uint8_t buf[24];
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, void *))a4;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v19 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v19) = v7;
  if (v7)
  {
    *((_QWORD *)&v19 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: removeAllThumbnailsForDryRun:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  *(_QWORD *)buf = 0;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService removeAllThumbnailsForDryRun:reply:]");

  objc_msgSend(v10, "thumbnailManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "removeAllThumbnailsInContextForUrgentCacheDeleteRequest:dryRun:count:", v12, v4, buf);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)buf);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v14, v15);

  if (v20)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  if ((_QWORD)v21)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)rebuildTableThumbsWithReply:(id)a3
{
  void (**v4)(id, const __CFString *);
  int v5;
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
  PLTableThumbnailMigrator *v19;
  NSObject *v20;
  NSObject *v21;
  const char *Name;
  __int128 v23;
  char v24;
  __int128 v25;
  SEL sel[2];
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, const __CFString *))a3;
  v25 = 0u;
  *(_OWORD *)sel = 0u;
  v23 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v23) = v5;
  if (v5)
  {
    *((_QWORD *)&v23 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: rebuildTableThumbsWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v23 + 1), (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  -[PLAssetsdDebugService _persistentStoreCoordinator](self, "_persistentStoreCoordinator", (_QWORD)v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentStores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelMigrator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_migrationThumbnailManagerWithStore:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "databaseContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService rebuildTableThumbsWithReply:]");

  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resetThumbnailsWithResetType:deferHintChanges:inContext:", 1, 0, v15);

  v16 = (void *)MEMORY[0x1E0D732F8];
  objc_msgSend(v14, "pathManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tableThumbnailFormatsForConfigPhase:withPathManager:", 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(PLTableThumbnailMigrator);
  -[PLTableThumbnailMigrator migrateAllAssetsPendingTableThumbRebuildInLibrary:toTableFormats:limit:](v19, "migrateAllAssetsPendingTableThumbRebuildInLibrary:toTableFormats:limit:", v14, v18, 0);
  v4[2](v4, CFSTR("done"));

  if (v24)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  if ((_QWORD)v25)
  {
    PLRequestGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v21, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getXPCTransactionStatusWithReply:(id)a3
{
  void (**v3)(id, void *);
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *Name;
  __int128 v9;
  char v10;
  __int128 v11;
  SEL sel[2];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *))a3;
  v11 = 0u;
  *(_OWORD *)sel = 0u;
  v9 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((_QWORD *)&v9 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: getXPCTransactionStatusWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  objc_msgSend(MEMORY[0x1E0D73348], "openXPCTransactionStatus", (_QWORD)v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v5);

  if (v10)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  if ((_QWORD)v11)
  {
    PLRequestGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getTaskConstraintStatusWithReply:(id)a3
{
  void (**v3)(id, void *);
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *Name;
  __int128 v9;
  char v10;
  __int128 v11;
  SEL sel[2];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *))a3;
  v11 = 0u;
  *(_OWORD *)sel = 0u;
  v9 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((_QWORD *)&v9 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: getTaskConstraintStatusWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  +[PLCameraCaptureTaskConstraintCoordinator taskConstraintStatus](PLCameraCaptureTaskConstraintCoordinator, "taskConstraintStatus", (_QWORD)v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v5);

  if (v10)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  if ((_QWORD)v11)
  {
    PLRequestGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getCPLStateForDebug:(BOOL)a3 withReply:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, const __CFString *);
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const char *Name;
  __int128 v13;
  char v14;
  __int128 v15;
  SEL sel[2];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, const __CFString *))a4;
  v15 = 0u;
  *(_OWORD *)sel = 0u;
  v13 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v13) = v7;
  if (v7)
  {
    *((_QWORD *)&v13 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: getCPLStateForDebug:withReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudPhotoLibraryManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "getCPLStateForDebug:completionHandler:", v4, v6);
  else
    v6[2](v6, CFSTR("No CPL manager configured\n"));

  if (v14)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v15 + 8));
  if ((_QWORD)v15)
  {
    PLRequestGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v18 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)clearPrefetchState
{
  int v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *Name;
  __int128 v9;
  char v10;
  __int128 v11;
  SEL sel[2];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  *(_OWORD *)sel = 0u;
  v9 = 0u;
  v3 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v9) = v3;
  if (v3)
  {
    *((_QWORD *)&v9 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: clearPrefetchState", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudPhotoLibraryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "clearPrefetchState");
  if (v10)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  if ((_QWORD)v11)
  {
    PLRequestGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)enqueuePrefetch
{
  int v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *Name;
  __int128 v9;
  char v10;
  __int128 v11;
  SEL sel[2];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  *(_OWORD *)sel = 0u;
  v9 = 0u;
  v3 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v9) = v3;
  if (v3)
  {
    *((_QWORD *)&v9 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: enqueuePrefetch", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudPhotoLibraryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startAutomaticPrefetchOrPrune");
  if (v10)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  if ((_QWORD)v11)
  {
    PLRequestGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)revertToOriginalWithObjectURI:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *Name;
  _QWORD v25[4];
  char *v26;
  __int128 v27;
  __int128 v28;
  SEL sel[2];
  uint64_t v30;
  char *v31;
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v28 = 0u;
  *(_OWORD *)sel = 0u;
  v27 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v27) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: revertToOriginalWithObjectURI:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v27 + 1);
    *((_QWORD *)&v27 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  -[PLAssetsdDebugService _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectIDForURIRepresentation:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && (objc_msgSend(v12, "isTemporaryID") & 1) == 0)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "databaseContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __61__PLAssetsdDebugService_revertToOriginalWithObjectURI_reply___block_invoke;
    v25[3] = &unk_1E3664588;
    v26 = v13;
    objc_msgSend(v20, "performTransactionSync:withName:", v25, "-[PLAssetsdDebugService revertToOriginalWithObjectURI:reply:]");

    v18 = 0;
    v14 = v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid objectID: %@, isTemporaryID: %d"), v13, objc_msgSend(v13, "isTemporaryID"));
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    PLGatekeeperXPCGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Cannot revert asset with error: %@", buf, 0xCu);
    }

    v16 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41001, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7[2](v7, v18);

  if ((_BYTE)v27)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  if ((_QWORD)v28)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)debugSidecarURLsWithObjectURI:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  const char *Name;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  SEL sel[2];
  uint64_t v31;
  const __CFString *v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29 = 0u;
  *(_OWORD *)sel = 0u;
  v28 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v28) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: debugSidecarURLsWithObjectURI:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v28 + 1);
    *((_QWORD *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService debugSidecarURLsWithObjectURI:reply:]");

  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "persistentStoreCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "managedObjectIDForURIRepresentation:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __61__PLAssetsdDebugService_debugSidecarURLsWithObjectURI_reply___block_invoke;
    v24[3] = &unk_1E3676290;
    v25 = v14;
    v26 = v16;
    v27 = v7;
    objc_msgSend(v13, "performBlock:", v24);

    v17 = v25;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v32 = CFSTR("Invalid objectID value");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41001, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v17);
  }

  if ((_BYTE)v28)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  if ((_QWORD)v29)
  {
    PLRequestGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)pruneAssetsWithUUID:(id)a3 resourceTypes:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *Name;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  PLAssetsdDebugService *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  SEL sel[2];
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32 = 0u;
  *(_OWORD *)sel = 0u;
  v31 = 0u;
  v11 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v31) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199541000, "PLXPC Service: pruneAssetsWithUUID:resourceTypes:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "databaseContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __65__PLAssetsdDebugService_pruneAssetsWithUUID_resourceTypes_reply___block_invoke;
  v25[3] = &unk_1E36645B0;
  v17 = v14;
  v26 = v17;
  v18 = v8;
  v27 = v18;
  v19 = v9;
  v28 = v19;
  v29 = self;
  v20 = v10;
  v30 = v20;
  objc_msgSend(v16, "perform:withName:", v25, "-[PLAssetsdDebugService pruneAssetsWithUUID:resourceTypes:reply:]");

  if ((_BYTE)v31)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  if ((_QWORD)v32)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)prefetchResourcesForMemories:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  SEL sel[2];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = 0u;
  *(_OWORD *)sel = 0u;
  v22 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v22) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: prefetchResourcesForMemories:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v22 + 1);
    *((_QWORD *)&v22 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__PLAssetsdDebugService_prefetchResourcesForMemories_reply___block_invoke;
  v19[3] = &unk_1E36645D8;
  v13 = v6;
  v20 = v13;
  v14 = v7;
  v21 = v14;
  objc_msgSend(v12, "perform:withName:", v19, "-[PLAssetsdDebugService prefetchResourcesForMemories:reply:]");

  if ((_BYTE)v22)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  if ((_QWORD)v23)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)prefetchResourcesForHighlights:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  SEL sel[2];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = 0u;
  *(_OWORD *)sel = 0u;
  v22 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v22) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: prefetchResourcesForHighlights:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v22 + 1);
    *((_QWORD *)&v22 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__PLAssetsdDebugService_prefetchResourcesForHighlights_reply___block_invoke;
  v19[3] = &unk_1E36645D8;
  v13 = v6;
  v20 = v13;
  v14 = v7;
  v21 = v14;
  objc_msgSend(v12, "perform:withName:", v19, "-[PLAssetsdDebugService prefetchResourcesForHighlights:reply:]");

  if ((_BYTE)v22)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  if ((_QWORD)v23)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)prefetchResourcesWithMode:(int64_t)a3 reply:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  const char *Name;
  _QWORD v17[4];
  id v18;
  int64_t v19;
  __int128 v20;
  __int128 v21;
  SEL sel[2];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v20 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v20) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199541000, "PLXPC Service: prefetchResourcesWithMode:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v20 + 1);
    *((_QWORD *)&v20 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__PLAssetsdDebugService_prefetchResourcesWithMode_reply___block_invoke;
  v17[3] = &unk_1E3664600;
  v12 = v6;
  v18 = v12;
  v19 = a3;
  objc_msgSend(v11, "perform:withName:", v17, "-[PLAssetsdDebugService prefetchResourcesWithMode:reply:]");

  if ((_BYTE)v20)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  if ((_QWORD)v21)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)processRecentHighlightsWithReply:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  SEL sel[2];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  *(_OWORD *)sel = 0u;
  v18 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v18) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: processRecentHighlightsWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v18 + 1);
    *((_QWORD *)&v18 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "momentGenerationDataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__PLAssetsdDebugService_processRecentHighlightsWithReply___block_invoke;
  v16[3] = &unk_1E3676CD8;
  v11 = v4;
  v17 = v11;
  objc_msgSend(v10, "processRecentHighlightsWithCompletionBlock:", v16);

  if ((_BYTE)v18)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  if ((_QWORD)v19)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)processUnprocessedMomentLocationsWithReply:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  SEL sel[2];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  *(_OWORD *)sel = 0u;
  v18 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v18) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: processUnprocessedMomentLocationsWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v18 + 1);
    *((_QWORD *)&v18 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "momentGenerationDataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__PLAssetsdDebugService_processUnprocessedMomentLocationsWithReply___block_invoke;
  v16[3] = &unk_1E3676CD8;
  v11 = v4;
  v17 = v11;
  objc_msgSend(v10, "processUnprocessedMomentLocationsWithCompletionBlock:", v16);

  if ((_BYTE)v18)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  if ((_QWORD)v19)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)updateHighlightTitlesWithReply:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  SEL sel[2];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  *(_OWORD *)sel = 0u;
  v18 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v18) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: updateHighlightTitlesWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v18 + 1);
    *((_QWORD *)&v18 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "momentGenerationDataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__PLAssetsdDebugService_updateHighlightTitlesWithReply___block_invoke;
  v16[3] = &unk_1E3676CD8;
  v11 = v4;
  v17 = v11;
  objc_msgSend(v10, "updateHighlightTitlesWithCompletionBlock:", v16);

  if ((_BYTE)v18)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  if ((_QWORD)v19)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)cleanupEmptyHighlightsWithReply:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  SEL sel[2];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  *(_OWORD *)sel = 0u;
  v18 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v18) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: cleanupEmptyHighlightsWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v18 + 1);
    *((_QWORD *)&v18 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "momentGenerationDataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__PLAssetsdDebugService_cleanupEmptyHighlightsWithReply___block_invoke;
  v16[3] = &unk_1E3676CD8;
  v11 = v4;
  v17 = v11;
  objc_msgSend(v10, "cleanupEmptyHighlightsWithCompletionBlock:", v16);

  if ((_BYTE)v18)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  if ((_QWORD)v19)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithCompletionBlock:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  __int128 v12;
  char v13;
  __int128 v14;
  SEL sel[2];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  *(_OWORD *)sel = 0u;
  v12 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((_QWORD *)&v12 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithCompletionBlock:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "momentGenerationDataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithCompletionBlock:", v4);
  if (v13)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  if ((_QWORD)v14)
  {
    PLRequestGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)privateDownloadCloudPhotoLibraryAsset:(id)a3 resourceType:(unint64_t)a4 highPriority:(BOOL)a5 reply:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *Name;
  _QWORD v25[4];
  id v26;
  id v27;
  PLAssetsdDebugService *v28;
  void (**v29)(_QWORD);
  unint64_t v30;
  BOOL v31;
  __int128 v32;
  __int128 v33;
  SEL sel[2];
  uint8_t buf[4];
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(_QWORD))a6;
  v33 = 0u;
  *(_OWORD *)sel = 0u;
  v32 = 0u;
  v12 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v32) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199541000, "PLXPC Service: privateDownloadCloudPhotoLibraryAsset:resourceType:highPriority:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v32 + 1);
    *((_QWORD *)&v32 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  v15 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService privateDownloadCloudPhotoLibraryAsset:resourceType:highPriority:reply:]");
  objc_msgSend(v15, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistentStoreCoordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "managedObjectIDForURIRepresentation:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 && (objc_msgSend(v18, "isTemporaryID") & 1) == 0)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __95__PLAssetsdDebugService_privateDownloadCloudPhotoLibraryAsset_resourceType_highPriority_reply___block_invoke;
    v25[3] = &unk_1E3664628;
    v26 = v19;
    v27 = v15;
    v28 = self;
    v30 = a4;
    v31 = a5;
    v29 = v11;
    objc_msgSend(v27, "performBlock:withPriority:", v25, 1);

  }
  else
  {
    PLGatekeeperXPCGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "privateDownloadCloudPhotoLibraryAsset: invalid object URI", buf, 2u);
    }

    v11[2](v11);
  }

  if ((_BYTE)v32)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  if ((_QWORD)v33)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v36 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)snapshotJournalsForManagerName:(id)a3 payloadClassIDs:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  const char *Name;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v11 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v26) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199541000, "PLXPC Service: snapshotJournalsForManagerName:payloadClassIDs:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "journalManagerForName:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __78__PLAssetsdDebugService_snapshotJournalsForManagerName_payloadClassIDs_reply___block_invoke;
    v24[3] = &unk_1E3676858;
    v25 = v10;
    objc_msgSend(v15, "snapshotJournalsForPayloadClassIDs:withCompletionHandler:", v9, v24);
    v16 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid journal manager for name = %@"), v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2938];
    v30 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v19);

  }
  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)coalesceJournalsForManagerName:(id)a3 payloadClassIDs:(id)a4 withChangeJournalOverThreshold:(float)a5 reply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  int v13;
  void *v14;
  void *v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  const char *Name;
  __int128 v20;
  char v21;
  __int128 v22;
  SEL sel[2];
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  v22 = 0u;
  *(_OWORD *)sel = 0u;
  v20 = 0u;
  v13 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v20) = v13;
  if (v13)
  {
    *((_QWORD *)&v20 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: coalesceJournalsForManagerName:payloadClassIDs:withChangeJournalOverThreshold:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v20 + 1), (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "journalManagerForName:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    *(float *)&v16 = a5;
    objc_msgSend(v15, "coalesceJournalsForPayloadClassIDs:withChangeJournalOverThreshold:completionHandler:", v11, v12, v16);
  }
  else
  {
    v12[2](v12);
  }

  if (v21)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  if ((_QWORD)v22)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v25 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (id)runAssetContainmentOnAllSocialGroups:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  __int128 *p_buf;
  __int128 v27;
  __int128 v28;
  SEL sel[2];
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  *(_OWORD *)sel = 0u;
  v27 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v27) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: runAssetContainmentOnAllSocialGroups:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v27 + 1);
    *((_QWORD *)&v27 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService runAssetContainmentOnAllSocialGroups:]");

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__16431;
  v33 = __Block_byref_object_dispose__16432;
  v34 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __62__PLAssetsdDebugService_runAssetContainmentOnAllSocialGroups___block_invoke;
  v22[3] = &unk_1E3668810;
  v12 = v8;
  v23 = v12;
  v13 = v11;
  v24 = v13;
  p_buf = &buf;
  v14 = v4;
  v25 = v14;
  objc_msgSend(v13, "performBlock:", v22);
  v15 = v25;
  v16 = v12;

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v27)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  if ((_QWORD)v28)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v16;
}

- (id)runAssetContainmentOnSocialGroup:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *Name;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  SEL sel[2];
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v32 = 0u;
  *(_OWORD *)sel = 0u;
  v31 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v31) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: runAssetContainmentOnSocialGroup:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService runAssetContainmentOnSocialGroup:reply:]");

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __64__PLAssetsdDebugService_runAssetContainmentOnSocialGroup_reply___block_invoke;
  v26[3] = &unk_1E3671878;
  v15 = v13;
  v27 = v15;
  v16 = v6;
  v28 = v16;
  v17 = v7;
  v30 = v17;
  v18 = v14;
  v29 = v18;
  objc_msgSend(v15, "performBlock:", v26);
  v19 = v29;
  v20 = v18;

  if ((_BYTE)v31)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  if ((_QWORD)v32)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
  return v20;
}

- (void)setAssetContainmentSmallFaceThreshold:(double)a3
{
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *Name;
  __int128 v8;
  char v9;
  __int128 v10;
  SEL sel[2];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  *(_OWORD *)sel = 0u;
  v8 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((_QWORD *)&v8 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: setAssetContainmentSmallFaceThreshold:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  +[PLSocialGroupAssetContainment setAssetContainmentSmallFaceThreshold:](PLSocialGroupAssetContainment, "setAssetContainmentSmallFaceThreshold:", a3, (_QWORD)v8);
  if (v9)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  if ((_QWORD)v10)
  {
    PLRequestGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)assetContainmentSmallFaceThresholdUserDefault:(id)a3
{
  void (**v3)(id, _QWORD);
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *Name;
  __int128 v8;
  char v9;
  __int128 v10;
  SEL sel[2];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  *(_OWORD *)sel = 0u;
  v8 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((_QWORD *)&v8 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: assetContainmentSmallFaceThresholdUserDefault:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  +[PLSocialGroupAssetContainment assetContainmentSmallFaceThreshold](PLSocialGroupAssetContainment, "assetContainmentSmallFaceThreshold", (_QWORD)v8);
  v3[2](v3, 0);
  if (v9)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  if ((_QWORD)v10)
  {
    PLRequestGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)setAssetContainmentLargeFaceThreshold:(double)a3
{
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *Name;
  __int128 v8;
  char v9;
  __int128 v10;
  SEL sel[2];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  *(_OWORD *)sel = 0u;
  v8 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((_QWORD *)&v8 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: setAssetContainmentLargeFaceThreshold:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  +[PLSocialGroupAssetContainment setAssetContainmentLargeFaceThreshold:](PLSocialGroupAssetContainment, "setAssetContainmentLargeFaceThreshold:", a3, (_QWORD)v8);
  if (v9)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  if ((_QWORD)v10)
  {
    PLRequestGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)assetContainmentLargeFaceThresholdUserDefault:(id)a3
{
  void (**v3)(id, _QWORD);
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *Name;
  __int128 v8;
  char v9;
  __int128 v10;
  SEL sel[2];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  *(_OWORD *)sel = 0u;
  v8 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((_QWORD *)&v8 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: assetContainmentLargeFaceThresholdUserDefault:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  +[PLSocialGroupAssetContainment assetContainmentLargeFaceThreshold](PLSocialGroupAssetContainment, "assetContainmentLargeFaceThreshold", (_QWORD)v8);
  v3[2](v3, 0);
  if (v9)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  if ((_QWORD)v10)
  {
    PLRequestGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)setAssetContainmentSmallTorsoThreshold:(double)a3
{
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *Name;
  __int128 v8;
  char v9;
  __int128 v10;
  SEL sel[2];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  *(_OWORD *)sel = 0u;
  v8 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((_QWORD *)&v8 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: setAssetContainmentSmallTorsoThreshold:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  +[PLSocialGroupAssetContainment setAssetContainmentSmallTorsoThreshold:](PLSocialGroupAssetContainment, "setAssetContainmentSmallTorsoThreshold:", a3, (_QWORD)v8);
  if (v9)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  if ((_QWORD)v10)
  {
    PLRequestGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)assetContainmentSmallTorsoThresholdUserDefault:(id)a3
{
  void (**v3)(id, _QWORD);
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *Name;
  __int128 v8;
  char v9;
  __int128 v10;
  SEL sel[2];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  *(_OWORD *)sel = 0u;
  v8 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((_QWORD *)&v8 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: assetContainmentSmallTorsoThresholdUserDefault:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  +[PLSocialGroupAssetContainment assetContainmentSmallTorsoThreshold](PLSocialGroupAssetContainment, "assetContainmentSmallTorsoThreshold", (_QWORD)v8);
  v3[2](v3, 0);
  if (v9)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  if ((_QWORD)v10)
  {
    PLRequestGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)restoreComputeCacheWithReply:(id)a3
{
  void (**v4)(id, id);
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  id v20;
  __int128 v21;
  __int128 v22;
  SEL sel[2];
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  v22 = 0u;
  *(_OWORD *)sel = 0u;
  v21 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v21) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: restoreComputeCacheWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v21 + 1);
    *((_QWORD *)&v21 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "computeCacheManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v20 = 0;
    objc_msgSend(v9, "restoreComputeCacheWithProgress:error:", 0, &v20);
    v10 = v20;
    v4[2](v4, v10);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    +[PLComputeCacheManager name](PLComputeCacheManager, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Failed to obtain manager:  %@"), v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2938];
    v25 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v15);

  }
  if ((_BYTE)v21)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  if ((_QWORD)v22)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (id)updateAndSaveAssetPersonEdgesWithReply:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  __int128 *p_buf;
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v30) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: updateAndSaveAssetPersonEdgesWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v30 + 1);
    *((_QWORD *)&v30 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService updateAndSaveAssetPersonEdgesWithReply:]");
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__16431;
  v36 = __Block_byref_object_dispose__16432;
  v37 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__16431;
  v28[4] = __Block_byref_object_dispose__16432;
  v29 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __64__PLAssetsdDebugService_updateAndSaveAssetPersonEdgesWithReply___block_invoke;
  v22[3] = &unk_1E366F278;
  v26 = v28;
  v12 = v10;
  v23 = v12;
  p_buf = &buf;
  v13 = v11;
  v24 = v13;
  v14 = v4;
  v25 = v14;
  objc_msgSend(v12, "performBlock:", v22);
  v15 = v25;
  v16 = v13;

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v30)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  if ((_QWORD)v31)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(*((SEL *)&v32 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v16;
}

- (void)archiveComputeCacheWithReply:(id)a3
{
  void (**v4)(id, id);
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  id v20;
  __int128 v21;
  __int128 v22;
  SEL sel[2];
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  v22 = 0u;
  *(_OWORD *)sel = 0u;
  v21 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v21) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: archiveComputeCacheWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v21 + 1);
    *((_QWORD *)&v21 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "computeCacheManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v20 = 0;
    objc_msgSend(v9, "createArchiveWithError:", &v20);
    v10 = v20;
    v4[2](v4, v10);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    +[PLComputeCacheManager name](PLComputeCacheManager, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Failed to obtain manager: %@"), v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2938];
    v25 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v15);

  }
  if ((_BYTE)v21)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  if ((_QWORD)v22)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)resetComputeCacheWithReply:(id)a3
{
  void (**v4)(id, id);
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  id v20;
  __int128 v21;
  __int128 v22;
  SEL sel[2];
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  v22 = 0u;
  *(_OWORD *)sel = 0u;
  v21 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v21) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: resetComputeCacheWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v21 + 1);
    *((_QWORD *)&v21 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "computeCacheManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v20 = 0;
    objc_msgSend(v9, "resetComputeCacheWithError:", &v20);
    v10 = v20;
    v4[2](v4, v10);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    +[PLComputeCacheManager name](PLComputeCacheManager, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Failed to obtain manager: %@"), v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2938];
    v25 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v15);

  }
  if ((_BYTE)v21)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  if ((_QWORD)v22)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)computeCacheStatusWithReply:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *Name;
  __int128 v17;
  __int128 v18;
  SEL sel[2];
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v17) = v5;
  if (v5)
  {
    *((_QWORD *)&v17 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: computeCacheStatusWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "computeCacheManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8, 0);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    +[PLComputeCacheManager name](PLComputeCacheManager, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Failed to obtain manager: %@"), v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2938];
    v21 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v13);

  }
  if ((_BYTE)v17)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  if ((_QWORD)v18)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v23 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)syndicationIngestMutexStateDescriptionWithReply:(id)a3
{
  void (**v4)(id, void *, void *);
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *Name;
  __int128 v17;
  __int128 v18;
  SEL sel[2];
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v17) = v5;
  if (v5)
  {
    *((_QWORD *)&v17 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: syndicationIngestMutexStateDescriptionWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "syndicationIngestMutex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syndicationIngestMutexStateDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get state description. databaseContext = %p"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2938];
    v21 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41001, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v4[2](v4, v9, v10);

  if ((_BYTE)v17)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  if ((_QWORD)v18)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v23 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)waitForMomentGenerationWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  _QWORD v10[4];
  dispatch_semaphore_t v11;

  v4 = (void (**)(id, _QWORD))a3;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "momentGenerationDataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__PLAssetsdDebugService_waitForMomentGenerationWithReply___block_invoke;
  v10[3] = &unk_1E3677AA0;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v7, "generateWithIncrementalDataCompletionHandler:", v10);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v4[2](v4, 0);

}

- (void)backgroundMigrationWithReply:(id)a3
{
  void (**v4)(id, _BOOL8, id);
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  uint8_t *v13;
  void *v14;
  void *v15;
  int64_t v16;
  id v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *Name;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  SEL sel[2];
  uint64_t v30;
  const __CFString *v31;
  int v32;
  void *v33;
  uint8_t buf[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
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
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _BOOL8, id))a3;
  v28 = 0u;
  *(_OWORD *)sel = 0u;
  v27 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v27) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: backgroundMigrationWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v27 + 1);
    *((_QWORD *)&v27 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if (-[PLAssetsdConnectionAuthorization isClientAuthorizedForLibraryUpgrade](self->_connectionAuthorization, "isClientAuthorizedForLibraryUpgrade"))
  {
    objc_msgSend(MEMORY[0x1E0D731E0], "setupWithLibraryIdentifier:type:", 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      PLMigrationGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v37 = 0u;
        v35 = 0u;
        v36 = 0u;
        *(_OWORD *)buf = 0u;
        PLMigrationGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543362;
        v33 = v12;
        LODWORD(v25) = 12;
        v13 = (uint8_t *)_os_log_send_and_compose_impl();

        objc_msgSend(v8, "logWithMessage:fromCodeLocation:type:", v13, "PLAssetsdDebugService.m", 1174, 0, &v32, v25);
        if (v13 != buf)
          free(v13);
      }
    }
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "libraryBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v16 = +[PLBackgroundModelMigration migrateBackgroundActionsWithPhotoLibraryBundle:logger:error:continuationHandler:](PLBackgroundModelMigration, "migrateBackgroundActionsWithPhotoLibraryBundle:logger:error:continuationHandler:", v15, v8, &v26, &__block_literal_global_16423);
    v17 = v26;

    v18 = v16 == 1;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("Client not authorized to perform library migration");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41010, v20);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v18 = 0;
  }
  v4[2](v4, v18, v17);

  if ((_BYTE)v27)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  if ((_QWORD)v28)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)resetBackgroundMigrationClassName:(id)a3 reply:(id)a4
{
  NSString *v6;
  void (**v7)(id, _BOOL8, id);
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  uint8_t *v16;
  Class v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *Name;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  SEL sel[2];
  uint64_t v32;
  const __CFString *v33;
  int v34;
  void *v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
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
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = (void (**)(id, _BOOL8, id))a4;
  v30 = 0u;
  *(_OWORD *)sel = 0u;
  v29 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v29) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: resetBackgroundMigrationClassName:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v29 + 1);
    *((_QWORD *)&v29 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if (-[PLAssetsdConnectionAuthorization isClientAuthorizedForLibraryUpgrade](self->_connectionAuthorization, "isClientAuthorizedForLibraryUpgrade"))
  {
    objc_msgSend(MEMORY[0x1E0D731E0], "setupWithLibraryIdentifier:type:", 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      PLMigrationGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v39 = 0u;
        v37 = 0u;
        v38 = 0u;
        *(_OWORD *)buf = 0u;
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v15;
        LODWORD(v27) = 12;
        v16 = (uint8_t *)_os_log_send_and_compose_impl();

        objc_msgSend(v11, "logWithMessage:fromCodeLocation:type:", v16, "PLAssetsdDebugService.m", 1190, 0, &v34, v27);
        if (v16 != buf)
          free(v16);
      }
    }
    v17 = NSClassFromString(v6);
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pathManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v20 = +[PLBackgroundModelMigration resetBackgroundActionClass:pathManager:error:](PLBackgroundModelMigration, "resetBackgroundActionClass:pathManager:error:", v17, v19, &v28);
    v21 = v28;

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    v33 = CFSTR("Client not authorized to perform library migration");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41010, v11);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v20 = 0;
  }

  v7[2](v7, v20, v21);
  if ((_BYTE)v29)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  if ((_QWORD)v30)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)resetDrawAssetPersonEdgesBackgroundMigrationActionWithReply:(id)a3
{
  void (**v4)(id, _BOOL8, _QWORD);
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  id v20;
  __int128 v21;
  __int128 v22;
  SEL sel[2];
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _BOOL8, _QWORD))a3;
  v22 = 0u;
  *(_OWORD *)sel = 0u;
  v21 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v21) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: resetDrawAssetPersonEdgesBackgroundMigrationActionWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v21 + 1);
    *((_QWORD *)&v21 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService resetDrawAssetPersonEdgesBackgroundMigrationActionWithReply:]");

  v11 = objc_opt_class();
  objc_msgSend(v10, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v13 = +[PLBackgroundModelMigration resetBackgroundActionClass:pathManager:error:](PLBackgroundModelMigration, "resetBackgroundActionClass:pathManager:error:", v11, v12, &v20);
  v14 = v20;

  if (v13)
    v15 = 0;
  else
    v15 = v14;
  ((void (**)(id, _BOOL8, id))v4)[2](v4, v13, v15);

  if ((_BYTE)v21)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  if ((_QWORD)v22)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v25 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)resetMaintenanceTasksWithReply:(id)a3
{
  void (**v4)(id, uint64_t, id);
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  id v21;
  __int128 v22;
  __int128 v23;
  SEL sel[2];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, id))a3;
  v23 = 0u;
  *(_OWORD *)sel = 0u;
  v22 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v22) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: resetMaintenanceTasksWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v22 + 1);
    *((_QWORD *)&v22 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  v8 = (void *)MEMORY[0x1E0D73158];
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appPrivateDataForLibraryURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "valueForKey:", CFSTR("PLDeferredCriticalMaintenanceTask"));
  v12 = (char *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Maintenance Task: Removing critical marker: %@", buf, 0xCu);
    }

    v21 = 0;
    v14 = objc_msgSend(v11, "setValue:forKeyPath:error:", 0, CFSTR("PLDeferredCriticalMaintenanceTask"), &v21);
    v15 = v21;
  }
  else
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "Maintenance Task: Critical marker doesn't exist. Nothing to remove", buf, 2u);
    }

    v15 = 0;
    v14 = 1;
  }
  v4[2](v4, v14, v15);

  if ((_BYTE)v22)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  if ((_QWORD)v23)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)runMaintenanceTask:(id)a3 reply:(id)a4
{
  NSString *v6;
  void (**v7)(id, uint64_t, void *);
  int v8;
  void *v9;
  objc_class *v10;
  Class v11;
  objc_class *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  const char *Name;
  __int128 v30;
  __int128 v31;
  SEL sel[2];
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  const __CFString *v40;
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = (void (**)(id, uint64_t, void *))a4;
  v31 = 0u;
  *(_OWORD *)sel = 0u;
  v30 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v30) = v8;
  if (v8)
  {
    *((_QWORD *)&v30 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: runMaintenanceTask:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v30 + 1), (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLAssetsdDebugService runMaintenanceTask:reply:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = NSClassFromString(v6);
    v11 = NSClassFromString(CFSTR("PLMaintenanceTask"));
    if (v10 && (v12 = v11) != 0)
    {
      v13 = [v10 alloc];
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v13;
        objc_msgSend(v14, "libraryBundle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithLibraryBundle:", v16);

        v18 = objc_msgSend(v17, "runTaskWithTransaction:", v9);
        if ((v18 & 1) != 0)
        {
          v19 = 0;
        }
        else
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v33 = *MEMORY[0x1E0CB2938];
          v34 = CFSTR("runTaskWithTransaction failed");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v7[2](v7, v18, v19);
      }
      else
      {
        v22 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromClass(v12);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("runMaintenanceTask error: %@ is not a %@"), v6, v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0CB2938];
        v36 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, v19);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("runMaintenanceTask for %@ - class not found"), v6);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB2938];
      v38 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v17);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2938];
    v40 = CFSTR("runMaintenanceTask for all (nil arg) not supported yet");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v14);
  }

  if ((_BYTE)v30)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  if ((_QWORD)v31)
  {
    PLRequestGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v42 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v28, OS_SIGNPOST_INTERVAL_END, v31, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
  objc_storeStrong((id *)&self->_bundleController, 0);
  objc_storeStrong((id *)&self->_resourceDownloader, 0);
}

uint64_t __54__PLAssetsdDebugService_backgroundMigrationWithReply___block_invoke()
{
  return 1;
}

intptr_t __58__PLAssetsdDebugService_waitForMomentGenerationWithReply___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__PLAssetsdDebugService_updateAndSaveAssetPersonEdgesWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id obj;

  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setResultType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 40), "becomeCurrentWithPendingUnitCount:", 1);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(id *)(v10 + 40);
    +[PLSocialGroupAssetContainment updateAndSaveAssetPersonEdgesForAssetsWithIDs:inContext:error:](PLSocialGroupAssetContainment, "updateAndSaveAssetPersonEdgesForAssetsWithIDs:inContext:error:", v8, v9, &v11);
    objc_storeStrong((id *)(v10 + 40), v11);

  }
  objc_msgSend(*(id *)(a1 + 40), "resignCurrent");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __64__PLAssetsdDebugService_runAssetContainmentOnSocialGroup_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphLabel fetchLabelWithCode:inContext:](PLGraphLabel, "fetchLabelWithCode:inContext:", 1000, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphNode entityName](PLGraphNode, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@ AND %K == %@"), CFSTR("primaryLabel"), v3, CFSTR("uuid"), *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v6, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLGraphNodeContainer, "newNodeContainerWithNode:", v11);
    if (v10)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find node."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D74498];
    v23 = *MEMORY[0x1E0CB2938];
    v24[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 41003, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v10 = (id)v17;
    if (v17)
      goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 48), "becomeCurrentWithPendingUnitCount:", 1);
  v21 = 0;
  objc_msgSend(v12, "runAssetContainmentWithError:assetIDsToUpdate:", &v21, 0);
  v10 = v21;
  objc_msgSend(*(id *)(a1 + 48), "resignCurrent");
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v10)
  {
    objc_msgSend(v18, "rollback");
  }
  else
  {
    v20 = 0;
    objc_msgSend(v18, "save:", &v20);
    v10 = v20;
  }

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __62__PLAssetsdDebugService_runAssetContainmentOnAllSocialGroups___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v9;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", 1);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  +[PLSocialGroup runAssetContainmentOnAllSocialGroupsInContext:error:](PLSocialGroup, "runAssetContainmentOnAllSocialGroupsInContext:error:", v2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);

  objc_msgSend(*(id *)(a1 + 32), "resignCurrent");
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "rollback");
  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(id *)(v7 + 40);
    objc_msgSend(v5, "save:", &v9);
    objc_storeStrong((id *)(v7 + 40), v9);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __78__PLAssetsdDebugService_snapshotJournalsForManagerName_payloadClassIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__PLAssetsdDebugService_privateDownloadCloudPhotoLibraryAsset_resourceType_highPriority_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "isDeleted") & 1) == 0)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 48) + 16);
    v6 = *(_QWORD *)(a1 + 64);
    v7 = *(unsigned __int8 *)(a1 + 72);
    v12 = 0;
    LOBYTE(v11) = 0;
    v8 = (id)objc_msgSend(v5, "startCPLDownloadForAsset:resourceType:masterResourceOnly:highPriority:track:notify:transient:proposedTaskIdentifier:doneToken:error:", v3, v6, 0, v7, 0, 0, v11, 0, 0, &v12);
    v9 = v12;
    if (v9)
    {
      PLGatekeeperXPCGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "privateDownloadCloudPhotoLibraryAsset: error downloading asset. (%@)", buf, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    PLGatekeeperXPCGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "privateDownloadCloudPhotoLibraryAsset: invalid asset", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __57__PLAssetsdDebugService_cleanupEmptyHighlightsWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__PLAssetsdDebugService_updateHighlightTitlesWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__PLAssetsdDebugService_processUnprocessedMomentLocationsWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__PLAssetsdDebugService_processRecentHighlightsWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PLAssetsdDebugService_prefetchResourcesWithMode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  PLCloudResourcePrefetchManager *v6;
  void *v7;
  PLCloudResourcePrefetchManager *v8;
  PLPrefetchConfiguration *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PLCloudResourcePrefetchPredicateOptions *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id *v32;
  id *v33;
  NSObject *v34;
  _QWORD *v35;
  PLCloudResourcePrefetchManager *v36;
  void *v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  _QWORD v43[4];
  NSObject *v44;
  _QWORD v45[2];
  _QWORD v46[4];
  NSObject *v47;
  _QWORD v48[2];
  uint8_t buf[16];
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudPhotoLibraryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [PLCloudResourcePrefetchManager alloc];
    objc_msgSend(v3, "libraryServicesManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PLCloudResourcePrefetchManager initWithCPLManager:pruneManager:libraryServicesManager:](v6, "initWithCPLManager:pruneManager:libraryServicesManager:", v5, 0, v7);

    v9 = [PLPrefetchConfiguration alloc];
    objc_msgSend(v5, "cplConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", *MEMORY[0x1E0D11238]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PLPrefetchConfiguration initWithPrefetchDictionary:](v9, "initWithPrefetchDictionary:", v11);

    v42 = (void *)v12;
    v13 = -[PLCloudResourcePrefetchPredicateOptions initWithPrefetchMode:prefetchOptimizeMode:excludeDynamicResources:prefetchConfiguration:]([PLCloudResourcePrefetchPredicateOptions alloc], "initWithPrefetchMode:prefetchOptimizeMode:excludeDynamicResources:prefetchConfiguration:", *(_QWORD *)(a1 + 40), +[PLPrefetchConfiguration defaultPrefetchOptimizeMode](PLPrefetchConfiguration, "defaultPrefetchOptimizeMode"), 0, v12);
    PLPrefetchGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_generate(v14);
    v16 = *(_QWORD *)(a1 + 40);
    v17 = v14;
    v18 = v17;
    v19 = v15 - 1;
    if (v16 == 3)
    {
      if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v15, "predicate", ", buf, 2u);
      }

      +[PLCloudResourcePrefetchPredicates predicatesForThumbnails:](PLCloudResourcePrefetchPredicates, "predicatesForThumbnails:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v18;
      v22 = v21;
      if (v19 > 0xFFFFFFFFFFFFFFFDLL)
      {

        v31 = v22;
      }
      else
      {
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_END, v15, "predicate", ", buf, 2u);
        }

        v23 = v22;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v15, "fetch", ", buf, 2u);
        }
      }

      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __57__PLAssetsdDebugService_prefetchResourcesWithMode_reply___block_invoke_74;
      v46[3] = &unk_1E3674C40;
      v32 = (id *)&v47;
      v47 = v22;
      v48[1] = v15;
      v33 = (id *)v48;
      v48[0] = *(id *)(a1 + 32);
      v34 = v22;
      v35 = v46;
      v36 = v8;
      v37 = v20;
      v38 = v3;
      v39 = 0;
    }
    else
    {
      if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v15, "predicate", ", buf, 2u);
      }

      +[PLCloudResourcePrefetchPredicates predicatesForNonThumbnails:lastCompletePrefetchDate:](PLCloudResourcePrefetchPredicates, "predicatesForNonThumbnails:lastCompletePrefetchDate:", v13, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v18;
      v29 = v28;
      if (v19 > 0xFFFFFFFFFFFFFFFDLL)
      {

        v40 = v29;
      }
      else
      {
        if (os_signpost_enabled(v28))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v29, OS_SIGNPOST_INTERVAL_END, v15, "predicate", ", buf, 2u);
        }

        v30 = v29;
        if (os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v15, "fetch", ", buf, 2u);
        }
      }

      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __57__PLAssetsdDebugService_prefetchResourcesWithMode_reply___block_invoke_75;
      v43[3] = &unk_1E3674C40;
      v32 = (id *)&v44;
      v44 = v29;
      v45[1] = v15;
      v33 = (id *)v45;
      v45[0] = *(id *)(a1 + 32);
      v41 = v29;
      v35 = v43;
      v36 = v8;
      v37 = v20;
      v38 = v3;
      v39 = 4;
    }
    -[PLCloudResourcePrefetchManager prefetchResourcesWithPredicates:photoLibrary:prefetchPhase:completionHandler:](v36, "prefetchResourcesWithPredicates:photoLibrary:prefetchPhase:completionHandler:", v37, v38, v39, v35);

  }
  else
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0D74498];
    v50 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not initialize cloud photo library manager because this library isn't the system library."));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 41022, v27);
    v8 = (PLCloudResourcePrefetchManager *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __57__PLAssetsdDebugService_prefetchResourcesWithMode_reply___block_invoke_74(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v3, OS_SIGNPOST_INTERVAL_END, v4, "fetch", ", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __57__PLAssetsdDebugService_prefetchResourcesWithMode_reply___block_invoke_75(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v3, OS_SIGNPOST_INTERVAL_END, v4, "fetch", ", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __62__PLAssetsdDebugService_prefetchResourcesForHighlights_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  PLCloudResourcePrefetchManager *v6;
  void *v7;
  PLCloudResourcePrefetchManager *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudPhotoLibraryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [PLCloudResourcePrefetchManager alloc];
  objc_msgSend(v3, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLCloudResourcePrefetchManager initWithCPLManager:pruneManager:libraryServicesManager:](v6, "initWithCPLManager:pruneManager:libraryServicesManager:", v5, 0, v7);

  +[PLCloudResourcePrefetchPredicates predicateToPrefetchHighlightWithUUIDs:photoLibrary:](PLCloudResourcePrefetchPredicates, "predicateToPrefetchHighlightWithUUIDs:photoLibrary:", *(_QWORD *)(a1 + 32), v3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudResourcePrefetchManager prefetchResourcesWithPredicates:photoLibrary:prefetchPhase:completionHandler:](v8, "prefetchResourcesWithPredicates:photoLibrary:prefetchPhase:completionHandler:", v11, v3, 4, 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __60__PLAssetsdDebugService_prefetchResourcesForMemories_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  PLCloudResourcePrefetchManager *v6;
  void *v7;
  PLCloudResourcePrefetchManager *v8;
  void *v9;
  PLPrefetchConfiguration *v10;
  void *v11;
  void *v12;
  PLPrefetchConfiguration *v13;
  PLCloudResourcePrefetchPredicateOptions *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudPhotoLibraryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [PLCloudResourcePrefetchManager alloc];
    objc_msgSend(v3, "libraryServicesManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PLCloudResourcePrefetchManager initWithCPLManager:pruneManager:libraryServicesManager:](v6, "initWithCPLManager:pruneManager:libraryServicesManager:", v5, 0, v7);

    +[PLMemory memoriesWithUUIDs:inPhotoLibrary:](PLMemory, "memoriesWithUUIDs:inPhotoLibrary:", *(_QWORD *)(a1 + 32), v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [PLPrefetchConfiguration alloc];
    objc_msgSend(v5, "cplConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", *MEMORY[0x1E0D11238]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PLPrefetchConfiguration initWithPrefetchDictionary:](v10, "initWithPrefetchDictionary:", v12);

    v14 = -[PLCloudResourcePrefetchPredicateOptions initWithPrefetchMode:prefetchOptimizeMode:excludeDynamicResources:prefetchConfiguration:]([PLCloudResourcePrefetchPredicateOptions alloc], "initWithPrefetchMode:prefetchOptimizeMode:excludeDynamicResources:prefetchConfiguration:", 1, +[PLPrefetchConfiguration defaultPrefetchOptimizeMode](PLPrefetchConfiguration, "defaultPrefetchOptimizeMode"), 0, v13);
    +[PLCloudResourcePrefetchPredicates predicateToPrefetchMemories:photoLibrary:options:](PLCloudResourcePrefetchPredicates, "predicateToPrefetchMemories:photoLibrary:options:", v9, v3, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
    {
      v18[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudResourcePrefetchManager prefetchResourcesWithPredicates:photoLibrary:prefetchPhase:completionHandler:](v8, "prefetchResourcesWithPredicates:photoLibrary:prefetchPhase:completionHandler:", v17, v3, 2, 0);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65__PLAssetsdDebugService_pruneAssetsWithUUID_resourceTypes_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  PLCloudResourcePruneManager *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  PLCloudResourcePruneManager *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cloudPhotoLibraryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v26 = v4;
    v27 = -[PLCloudResourcePruneManager initWithCPLManager:libraryServicesManager:]([PLCloudResourcePruneManager alloc], "initWithCPLManager:libraryServicesManager:", v4, *(_QWORD *)(a1 + 32));
    +[PLManagedAsset assetsWithUUIDs:options:inLibrary:](PLManagedAsset, "assetsWithUUIDs:options:inLibrary:", *(_QWORD *)(a1 + 40), 1, v3);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v5 = (PLCloudResourcePruneManager *)(id)objc_claimAutoreleasedReturnValue();
    v6 = -[PLCloudResourcePruneManager countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x19AEC1554]();
          if (v10 && (objc_msgSend(v10, "isDeleted") & 1) == 0)
          {
            objc_msgSend(v10, "allCPLResourcesForPruning");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = *(void **)(a1 + 48);
            if (v13)
            {
              v32[0] = MEMORY[0x1E0C809B0];
              v32[1] = 3221225472;
              v32[2] = __65__PLAssetsdDebugService_pruneAssetsWithUUID_resourceTypes_reply___block_invoke_2;
              v32[3] = &unk_1E36747B8;
              v33 = v13;
              objc_msgSend(v12, "indexesOfObjectsPassingTest:", v32);
              v14 = a1;
              v15 = v3;
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectsAtIndexes:", v16);
              v17 = objc_claimAutoreleasedReturnValue();

              v3 = v15;
              a1 = v14;

              v12 = (void *)v17;
            }
            -[PLCloudResourcePruneManager pruneResources:inPhotoLibrary:](v27, "pruneResources:inPhotoLibrary:", v12, v3);

          }
          objc_autoreleasePoolPop(v11);
        }
        v7 = -[PLCloudResourcePruneManager countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v7);
    }

    v4 = v26;
LABEL_24:

    goto LABEL_25;
  }
  objc_msgSend(*(id *)(a1 + 56), "libraryServicesManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "wellKnownPhotoLibraryIdentifier");

  if (v19 == 3)
  {
    +[PLManagedAsset assetsWithUUIDs:options:inLibrary:](PLManagedAsset, "assetsWithUUIDs:options:inLibrary:", *(_QWORD *)(a1 + 40), 1, v3);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v5 = (PLCloudResourcePruneManager *)(id)objc_claimAutoreleasedReturnValue();
    v20 = -[PLCloudResourcePruneManager countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v5);
          v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          v25 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v24, "purgeSyndicationResourcesOriginalsOnly:", 0);
          objc_autoreleasePoolPop(v25);
        }
        v21 = -[PLCloudResourcePruneManager countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v21);
    }
    v27 = v5;
    goto LABEL_24;
  }
LABEL_25:
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

uint64_t __65__PLAssetsdDebugService_pruneAssetsWithUUID_resourceTypes_reply___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "cplType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);

  return v4;
}

void __61__PLAssetsdDebugService_debugSidecarURLsWithObjectURI_reply___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  BOOL v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectWithID:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __61__PLAssetsdDebugService_debugSidecarURLsWithObjectURI_reply___block_invoke_2;
  v28[3] = &unk_1E3674480;
  v3 = v2;
  v29 = v3;
  v4 = MEMORY[0x19AEC174C](v28);
  v21 = v1;
  objc_msgSend(v1, "pathForDiagnosticFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)v4;
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  v22 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11);
        v23 = 0;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v12, &v23);
        v15 = v23;

        if (v14)
          v16 = v15 == 0;
        else
          v16 = 0;
        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("debugSidecarFileURL-%i"), v9);
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v17, "cStringUsingEncoding:", 4);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          PLDictionarySetSandboxedURL();

          v9 = (v9 + 1);
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __61__PLAssetsdDebugService_debugSidecarURLsWithObjectURI_reply___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

void __61__PLAssetsdDebugService_revertToOriginalWithObjectURI_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Reverting asset %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "revertToOriginal");
}

void __52__PLAssetsdDebugService_indexAssetsWithUUIDs_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v3, "isSuccess");
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

void __64__PLAssetsdDebugService_searchAttributesForAssetWithUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  PLSearchIndexConfiguration *v4;
  void *v5;
  PLSearchIndexConfiguration *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithUUID:inManagedObjectContext:](PLManagedAsset, "assetWithUUID:inManagedObjectContext:", v2, v3);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [PLSearchIndexConfiguration alloc];
  objc_msgSend(*(id *)(a1 + 48), "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLSearchIndexConfiguration initWithPathManager:](v4, "initWithPathManager:", v5);

  v7 = objc_msgSend(*(id *)(a1 + 48), "wellKnownPhotoLibraryIdentifier");
  -[PLSearchIndexConfiguration indexingContext](v6, "indexingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSpotlightAssetTranslator _jsonRepresentationFromAsset:libraryIdentifier:graphData:indexingContext:includeEmbeddingData:](PLSpotlightAssetTranslator, "_jsonRepresentationFromAsset:libraryIdentifier:graphData:indexingContext:includeEmbeddingData:", v12, v7, MEMORY[0x1E0C9AA70], v8, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

uint64_t __53__PLAssetsdDebugService_rebuildSearchIndexWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__PLAssetsdDebugService_closeSearchIndexWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchIndexingEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __50__PLAssetsdDebugService_dropSearchIndexWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v3, "isSuccess");
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

uint64_t __50__PLAssetsdDebugService_dropSearchIndexWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__PLAssetsdDebugService_rebuildHighlightsDeletingExistingHighlights_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__PLAssetsdDebugService_rebuildMomentsDeletingExistingMoments_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  char v4;
  char v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  id v13;
  id v14;
  void (**v15)(_QWORD);
  id v16;
  id v17;
  void (**v18)(_QWORD);
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD);
  int v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *context;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  char v33;
  void (**v34)(void);
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  char v50;
  char v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  uint64_t *v60;
  uint64_t *v61;
  char v62;
  _QWORD v63[4];
  id v64;
  id v65;
  uint64_t *v66;
  uint64_t *v67;
  char v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  _QWORD v79[4];
  id v80;

  context = (void *)MEMORY[0x19AEC1554]();
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v2, "isEditableFromAssetsLibrary");
  v3 = objc_msgSend(v2, "hasAdjustments");
  objc_msgSend(v2, "uuid");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnailIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v2, "effectiveThumbnailIndex");
  v4 = objc_msgSend(v2, "isRAWOnly");
  v5 = objc_msgSend(v2, "isRAWPlusJPEG");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_2;
  v79[3] = &unk_1E36644C0;
  v27 = v6;
  v80 = v27;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__16431;
  v73 = __Block_byref_object_dispose__16432;
  v74 = 0;
  v63[0] = v7;
  v63[1] = 3221225472;
  v63[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_3;
  v63[3] = &unk_1E36644E8;
  v68 = v5;
  v66 = &v75;
  v8 = (id)MEMORY[0x19AEC174C](v79);
  v65 = v8;
  v9 = v2;
  v64 = v9;
  v67 = &v69;
  v34 = (void (**)(void))MEMORY[0x19AEC174C](v63);
  v57[0] = v7;
  v57[1] = 3221225472;
  v57[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_4;
  v57[3] = &unk_1E36644E8;
  v62 = v4;
  v60 = &v75;
  v10 = v8;
  v59 = v10;
  v11 = v9;
  v58 = v11;
  v61 = &v69;
  v12 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v57);
  v52[0] = v7;
  v52[1] = 3221225472;
  v52[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_5;
  v52[3] = &unk_1E3664510;
  v55 = &v75;
  v13 = v10;
  v54 = v13;
  v14 = v11;
  v53 = v14;
  v56 = &v69;
  v15 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v52);
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_6;
  v45[3] = &unk_1E3664538;
  v50 = v3;
  v48 = &v75;
  v16 = v13;
  v47 = v16;
  v17 = v14;
  v46 = v17;
  v49 = &v69;
  v51 = v4;
  v18 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v45);
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_7;
  v35[3] = &unk_1E3664560;
  v44 = v3;
  v41 = &v75;
  v19 = v16;
  v40 = v19;
  v20 = v17;
  v36 = v20;
  v42 = &v69;
  v37 = *(id *)(a1 + 40);
  v21 = v30;
  v38 = v21;
  v43 = v29;
  v22 = v31;
  v39 = v22;
  v23 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v35);
  if (v32)
  {
    v24 = *(unsigned __int16 *)(a1 + 64);
    if ((v24 - 9997) >= 2)
    {
      if ((v24 - 9999) <= 1)
      {
        v34[2]();
        v12[2](v12);
        v25 = 4;
LABEL_8:
        objc_msgSend(v20, "setCloudPlaceholderKind:", v25);
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v26, "isThumbnail");

      if ((v33 & 1) != 0)
      {
        v34[2]();
        v12[2](v12);
        v15[2](v15);
        v18[2](v18);
        v23[2](v23);
        v25 = 2;
        goto LABEL_8;
      }
    }
    v34[2]();
    v12[2](v12);
    v15[2](v15);
    v18[2](v18);
    v25 = 3;
    goto LABEL_8;
  }
LABEL_9:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *((_BYTE *)v76 + 24);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), (id)v70[5]);

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);

  objc_autoreleasePoolPop(context);
}

uint64_t __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_8(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

uint64_t __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v10;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v5))
  {
    v6 = *(void **)(a1 + 32);
    v10 = 0;
    v7 = objc_msgSend(v6, "removeItemAtPath:error:", v5, &v10);
    v8 = v10;
    if (a3 && !*a3)
    {
      v8 = objc_retainAutorelease(v8);
      *a3 = v8;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  return v7;
}

void __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_3(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id obj;

  v2 = *(unsigned __int8 *)(a1 + 64);
  v5 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(v5 + 8);
  if (v2)
  {
    objc_msgSend(v3, "urlForSideCarImageFile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v8 + 40);
    v9 = (*(uint64_t (**)(uint64_t, void *, id *))(v4 + 16))(v4, v7, &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v9;

  }
  else
  {
    objc_msgSend(v3, "pathForOriginalFile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(id *)(v11 + 40);
    v12 = (*(uint64_t (**)(uint64_t, void *, id *))(v4 + 16))(v4, v10, &v16);
    objc_storeStrong((id *)(v11 + 40), v16);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v12;

    if (!objc_msgSend(*(id *)(a1 + 32), "isPhotoIris"))
      return;
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "pathForVideoComplementFile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(id *)(v14 + 40);
    LOBYTE(v13) = (*(uint64_t (**)(uint64_t, void *, id *))(v13 + 16))(v13, v6, &v15);
    objc_storeStrong((id *)(v14 + 40), v15);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v13;
  }

}

void __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_4(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void **v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = *(unsigned __int8 *)(a1 + 64);
  v5 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(v5 + 8);
  if (v2)
  {
    objc_msgSend(v3, "pathForNonAdjustedFullsizeImageFile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v7 + 40);
    v8 = (void **)(v7 + 40);
    v17 = v9;
    v10 = (*(uint64_t (**)(uint64_t, void *, void **))(v4 + 16))(v4, v6, &v17);
    v11 = v17;
  }
  else
  {
    objc_msgSend(v3, "pathForOriginalFile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    v8 = (void **)(v12 + 40);
    v16 = v13;
    v10 = (*(uint64_t (**)(uint64_t, void *, void **))(v4 + 16))(v4, v6, &v16);
    v11 = v16;
  }
  v14 = v11;
  v15 = *v8;
  *v8 = v14;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v10;
}

void __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id obj;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "pathForPenultimateFullsizeRenderImageFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *, id *))(v2 + 16))(v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v2;

}

void __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void **v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void **v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id obj;

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "pathForFullsizeRenderImageFile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v4 + 40);
    LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *, id *))(v2 + 16))(v2, v3, &obj);
    objc_storeStrong((id *)(v4 + 40), obj);
    v5 = a1 + 48;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v2;

    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "pathForAdjustedLargeSizeImageFile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v41 = *(id *)(v8 + 40);
    LOBYTE(v6) = (*(uint64_t (**)(uint64_t, void *, id *))(v6 + 16))(v6, v7, &v41);
    objc_storeStrong((id *)(v8 + 40), v41);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v6;

    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "pathForAdjustedLargeThumbnailFile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v11 + 40);
    v12 = (void **)(v11 + 40);
    v40 = v13;
    v14 = (*(uint64_t (**)(uint64_t, void *, void **))(v9 + 16))(v9, v10, &v40);
    v15 = v40;
  }
  else
  {
    v5 = a1 + 48;
    v16 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 65))
    {
      objc_msgSend(v16, "pathForNonAdjustedFullsizeImageFile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v21 = *(void **)(v19 + 40);
      v20 = (void **)(v19 + 40);
      v39 = v21;
      v22 = (*(uint64_t (**)(uint64_t, void *, void **))(v17 + 16))(v17, v18, &v39);
      v23 = v39;
    }
    else
    {
      objc_msgSend(v16, "pathForOriginalFile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v25 = *(void **)(v24 + 40);
      v20 = (void **)(v24 + 40);
      v38 = v25;
      v22 = (*(uint64_t (**)(uint64_t, void *, void **))(v17 + 16))(v17, v18, &v38);
      v23 = v38;
    }
    v26 = v23;
    v27 = *v20;
    *v20 = v26;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v22;
    v28 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "pathForNonAdjustedLargeSizeImageFile");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v37 = *(id *)(v30 + 40);
    LOBYTE(v28) = (*(uint64_t (**)(uint64_t, void *, id *))(v28 + 16))(v28, v29, &v37);
    objc_storeStrong((id *)(v30 + 40), v37);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v28;

    v31 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "pathForNonAdjustedLargeThumbnailFile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v33 = *(void **)(v32 + 40);
    v12 = (void **)(v32 + 40);
    v36 = v33;
    v14 = (*(uint64_t (**)(uint64_t, void *, void **))(v31 + 16))(v31, v10, &v36);
    v15 = v36;
  }
  v34 = v15;
  v35 = *v12;
  *v12 = v34;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) |= v14;
}

void __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_7(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void **v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = *(unsigned __int8 *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v4, "pathForAdjustedMediumThumbnailFile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v8 = *(void **)(v6 + 40);
    v7 = (void **)(v6 + 40);
    v17 = v8;
    v9 = (*(uint64_t (**)(uint64_t, void *, void **))(v3 + 16))(v3, v5, &v17);
    v10 = v17;
  }
  else
  {
    objc_msgSend(v4, "pathForNonAdjustedMediumThumbnailFile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v12 = *(void **)(v11 + 40);
    v7 = (void **)(v11 + 40);
    v16 = v12;
    v9 = (*(uint64_t (**)(uint64_t, void *, void **))(v3 + 16))(v3, v5, &v16);
    v10 = v16;
  }
  v13 = v10;
  v14 = *v7;
  *v7 = v13;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) |= v9;
  objc_msgSend(*(id *)(a1 + 40), "thumbnailManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deleteThumbnailsWithIdentifier:orIndex:uuid:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setEffectiveThumbnailIndex:", 0x7FFFFFFFFFFFFFFFLL);

}

@end
