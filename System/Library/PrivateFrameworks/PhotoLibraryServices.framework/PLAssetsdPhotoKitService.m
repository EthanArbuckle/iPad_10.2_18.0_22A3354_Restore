@implementation PLAssetsdPhotoKitService

- (PLAssetsdPhotoKitService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4
{
  id v6;
  id v7;
  PLAssetsdPhotoKitService *v8;
  PLAssetsdPhotoKitService *v9;
  uint64_t v10;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  void *v12;
  PLCameraCaptureTaskConstraintCoordinator *v13;
  PLCameraCaptureTaskConstraintCoordinator *cameraTaskConstraintCoordinator;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLAssetsdPhotoKitService;
  v8 = -[PLAbstractLibraryServicesManagerService initWithLibraryServicesManager:](&v16, sel_initWithLibraryServicesManager_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connectionAuthorization, a4);
    objc_msgSend(v6, "persistentStoreCoordinator");
    v10 = objc_claimAutoreleasedReturnValue();
    persistentStoreCoordinator = v9->_persistentStoreCoordinator;
    v9->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v10;

    if (PLPlatformCameraCaptureSupported())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PhotoKitService: %@"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PLCameraCaptureTaskConstraintCoordinator initWithTaskContstraintRole:name:]([PLCameraCaptureTaskConstraintCoordinator alloc], "initWithTaskContstraintRole:name:", 2, v12);
      cameraTaskConstraintCoordinator = v9->_cameraTaskConstraintCoordinator;
      v9->_cameraTaskConstraintCoordinator = v13;

    }
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[PLCameraCaptureTaskConstraintCoordinator invalidate](self->_cameraTaskConstraintCoordinator, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PLAssetsdPhotoKitService;
  -[PLAssetsdPhotoKitService dealloc](&v3, sel_dealloc);
}

- (void)applyChangesRequest:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  const char *Name;
  __int128 v14;
  char v15;
  __int128 v16;
  SEL sel[2];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[PLFileDescriptorFuse checkFileDescriptorFuse](PLFileDescriptorFuse, "checkFileDescriptorFuse");
  v16 = 0u;
  *(_OWORD *)sel = 0u;
  v14 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v14) = v8;
  if (v8)
  {
    *((_QWORD *)&v14 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: applyChangesRequest:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  objc_msgSend(v6, "decodeWithService:clientAuthorization:", self, self->_connectionAuthorization, (_QWORD)v14);
  if (-[PLAssetsdConnectionAuthorization isClientInLimitedLibraryMode](self->_connectionAuthorization, "isClientInLimitedLibraryMode"))
  {
    objc_msgSend(v6, "discardUnsupportedLimitedLibraryChangeRequests");
  }
  PLPhotoKitGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = -[PLAssetsdConnectionAuthorization photoKitEntitled](self->_connectionAuthorization, "photoKitEntitled");
    *(_DWORD *)buf = 136315650;
    v19 = "-[PLAssetsdPhotoKitService applyChangesRequest:reply:]";
    v20 = 2112;
    v21 = v6;
    v22 = 1024;
    v23 = v10;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "##### %s %@ entitled:%d", buf, 0x1Cu);
  }

  -[PLAssetsdPhotoKitService commitRequest:reply:](self, "commitRequest:reply:", v6, v7);
  if (v15)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  if ((_QWORD)v16)
  {
    PLRequestGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_END, v16, "##### %s %@ entitled:%d", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)resolveLocalIdentifiersForCloudIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  _QWORD v20[4];
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
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: resolveLocalIdentifiersForCloudIdentifiers:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v22 + 1);
    *((_QWORD *)&v22 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  +[PLCloudPhotoLibraryError createErrorWithType:withDebugMessage:](PLCloudPhotoLibraryError, "createErrorWithType:withDebugMessage:", 15, CFSTR("iCloud Photo Library not enabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCloudPhotoLibraryEnabled");

  if (v13)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cloudPhotoLibraryManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __77__PLAssetsdPhotoKitService_resolveLocalIdentifiersForCloudIdentifiers_reply___block_invoke;
      v20[3] = &unk_1E3676880;
      v21 = v7;
      objc_msgSend(v15, "resolveLocalIdentifiersForCloudIdentifiers:completionHandler:", v6, v20);

    }
    else
    {
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
  }

  if ((_BYTE)v22)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  if ((_QWORD)v23)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "##### %s %@ entitled:%d", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getUUIDsForAssetObjectURIs:(id)a3 filterPredicate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  const char *Name;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  SEL sel[2];
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  v35 = 0u;
  *(_OWORD *)sel = 0u;
  v34 = 0u;
  v11 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v34) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199541000, "PLXPC Service: getUUIDsForAssetObjectURIs:filterPredicate:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v34 + 1);
    *((_QWORD *)&v34 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__59160;
  v40 = __Block_byref_object_dispose__59161;
  v41 = 0;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "databaseContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "newShortLivedLibraryWithName:", "-[PLAssetsdPhotoKitService getUUIDsForAssetObjectURIs:filterPredicate:reply:]");

  objc_msgSend(v16, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "persistentStoreCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __77__PLAssetsdPhotoKitService_getUUIDsForAssetObjectURIs_filterPredicate_reply___block_invoke;
  v32[3] = &unk_1E3677F08;
  v20 = v18;
  v33 = v20;
  objc_msgSend(v8, "_pl_map:", v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  +[PLManagedAsset assetUUIDsByObjectIDs:withFilterPredicate:context:error:](PLManagedAsset, "assetUUIDsByObjectIDs:withFilterPredicate:context:error:", v21, v9, v17, &v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v31;
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v24;

    v30[0] = v19;
    v30[1] = 3221225472;
    v30[2] = __77__PLAssetsdPhotoKitService_getUUIDsForAssetObjectURIs_filterPredicate_reply___block_invoke_2;
    v30[3] = &unk_1E366DE10;
    v30[4] = &buf;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v30);
  }
  v10[2](v10, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v23);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v34)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  if ((_QWORD)v35)
  {
    PLRequestGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v27, OS_SIGNPOST_INTERVAL_END, v28, "##### %s %@ entitled:%d", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)processUniversalSearchJITForCoreSpotlightUniqueIdentifier:(id)a3 bundleID:(id)a4 processingTypes:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  NSObject *v14;
  void *v15;
  PLSyndicationSyncEngine *v16;
  void *v17;
  PLSyndicationSyncEngine *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  BOOL v27;
  id v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  const char *Name;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  PLAssetsdPhotoKitService *v40;
  id v41;
  uint64_t *v42;
  __int128 *v43;
  _QWORD *v44;
  unint64_t v45;
  id v46;
  _QWORD v47[5];
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  __int128 v53;
  __int128 v54;
  SEL sel[2];
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;
  const __CFString *v63;
  __int128 v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v54 = 0u;
  *(_OWORD *)sel = 0u;
  v53 = 0u;
  v13 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v53) = v13;
  if (v13)
  {
    v14 = _os_activity_create(&dword_199541000, "PLXPC Service: processUniversalSearchJITForCoreSpotlightUniqueIdentifier:bundleID:processingTypes:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v15 = (void *)*((_QWORD *)&v53 + 1);
    *((_QWORD *)&v53 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v54 + 8));
  }
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  *(_QWORD *)&v64 = 0;
  *((_QWORD *)&v64 + 1) = &v64;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__59160;
  v67 = __Block_byref_object_dispose__59161;
  v68 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__59160;
  v47[4] = __Block_byref_object_dispose__59161;
  v48 = 0;
  v16 = [PLSyndicationSyncEngine alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E375FA50);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PLSyndicationSyncEngine initWithQueryTypes:savedAssetTypeMask:delegate:](v16, "initWithQueryTypes:savedAssetTypeMask:delegate:", v17, objc_msgSend(MEMORY[0x1E0D73310], "maskForSyndicationSyncWorkerInSyndicationLibrary"), self);

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "databaseContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "newShortLivedLibraryWithName:", "Universal Search JIT Processing");

  if (v21)
  {
    *((_BYTE *)v50 + 24) = 1;
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v62 = *MEMORY[0x1E0CB2938];
    v63 = CFSTR("Unable to create short-lived library");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(*((_QWORD *)&v64 + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&v64 + 1) + 40) = v24;

    if (!*((_BYTE *)v50 + 24))
    {
LABEL_12:
      PLPhotoKitGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 40);
        *(_DWORD *)buf = 138543874;
        v57 = v10;
        v58 = 2114;
        v59 = v11;
        v60 = 2112;
        v61 = v31;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "US JIT Processing: failed for item %{public}@ from %{public}@: %@", buf, 0x20u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 40));
      goto LABEL_15;
    }
  }
  PLPhotoKitGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v57 = v10;
    v58 = 2114;
    v59 = v11;
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "US JIT Processing: sync searchable item %{public}@ from %{public}@", buf, 0x16u);
  }

  v46 = 0;
  v27 = -[PLSyndicationSyncEngine syncSyndicationItemWithUniqueIdentifier:bundleID:queryType:library:error:](v18, "syncSyndicationItemWithUniqueIdentifier:bundleID:queryType:library:error:", v10, v11, 1, v21, &v46);
  v28 = v46;
  v29 = v46;
  *((_BYTE *)v50 + 24) = v27;
  if (!v27)
    objc_storeStrong((id *)(*((_QWORD *)&v64 + 1) + 40), v28);

  if (!*((_BYTE *)v50 + 24))
    goto LABEL_12;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __117__PLAssetsdPhotoKitService_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_reply___block_invoke;
  v36[3] = &unk_1E366DE60;
  v37 = v10;
  v38 = v21;
  v42 = &v49;
  v43 = &v64;
  v44 = v47;
  v39 = v11;
  v40 = self;
  v45 = a5;
  v41 = v12;
  objc_msgSend(v38, "performBlockAndWait:", v36);

  if (!*((_BYTE *)v50 + 24))
    goto LABEL_12;
LABEL_15:

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v49, 8);
  if ((_BYTE)v53)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v54 + 8));
  if ((_QWORD)v54)
  {
    PLRequestGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = v54;
    if ((unint64_t)(v54 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      Name = sel_getName(sel[1]);
      LODWORD(v64) = 136446210;
      *(_QWORD *)((char *)&v64 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v33, OS_SIGNPOST_INTERVAL_END, v34, "##### %s %@ entitled:%d", "%{public}s", (uint8_t *)&v64, 0xCu);
    }

  }
}

- (void)processUniversalSearchJITForAssetUUID:(id)a3 processingTypes:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  PLAssetsdPhotoKitService *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__59160;
  v31 = __Block_byref_object_dispose__59161;
  v32 = 0;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "newShortLivedLibraryWithName:", "Universal Search JIT Processing");

  if (v12)
  {
    *((_BYTE *)v34 + 24) = 1;
    goto LABEL_4;
  }
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v41 = *MEMORY[0x1E0CB2938];
  v42[0] = CFSTR("Unable to create short-lived library");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v28[5];
  v28[5] = v15;

  if (*((_BYTE *)v34 + 24))
  {
LABEL_4:
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __88__PLAssetsdPhotoKitService_processUniversalSearchJITForAssetUUID_processingTypes_reply___block_invoke;
    v19[3] = &unk_1E366DE88;
    v20 = v8;
    v24 = &v33;
    v25 = &v27;
    v21 = v12;
    v22 = self;
    v26 = a4;
    v23 = v9;
    objc_msgSend(v21, "performBlockAndWait:", v19);

    if (*((_BYTE *)v34 + 24))
      goto LABEL_8;
  }
  PLPhotoKitGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = v28[5];
    *(_DWORD *)buf = 138543618;
    v38 = v8;
    v39 = 2112;
    v40 = v18;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "US JIT Processing: failed for asset %{public}@: %@", buf, 0x16u);
  }

  (*((void (**)(id, uint64_t))v9 + 2))(v9, v28[5]);
LABEL_8:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

}

- (id)analyzeAssets:(id)a3 forFeature:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "newShortLivedLibraryWithName:", "-[PLAssetsdPhotoKitService analyzeAssets:forFeature:reply:]");

  if (v12)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "analysisCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__59160;
    v31 = __Block_byref_object_dispose__59161;
    v32 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__PLAssetsdPhotoKitService_analyzeAssets_forFeature_reply___block_invoke;
    v20[3] = &unk_1E3675698;
    v21 = v8;
    v22 = v12;
    v25 = &v27;
    v15 = v14;
    v23 = v15;
    v26 = a4;
    v24 = v9;
    objc_msgSend(v22, "performBlockAndWait:", v20);
    v16 = (id)v28[5];

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2938];
    v34[0] = CFSTR("FAILURE");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46502, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v18);

    v16 = 0;
  }

  return v16;
}

- (id)analyzeLibraryForFeature:(unint64_t)a3 reply:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "databaseContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newShortLivedLibraryWithName:", "-[PLAssetsdPhotoKitService analyzeLibraryForFeature:reply:]");

  if (v9)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "analysisCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__PLAssetsdPhotoKitService_analyzeLibraryForFeature_reply___block_invoke;
    v17[3] = &unk_1E366F590;
    v18 = v6;
    objc_msgSend(v11, "analyzeLibraryForFeature:withCompletionHandler:", a3, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D74498];
    v19 = *MEMORY[0x1E0CB2938];
    v20[0] = CFSTR("FAILURE");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 46502, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v13);
    v12 = 0;
  }

  return v12;
}

- (id)resetStateForMediaProcessingTaskID:(unint64_t)a3 assetUUIDs:(id)a4 resetOptions:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "databaseContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "newShortLivedLibraryWithName:", "-[PLAssetsdPhotoKitService resetStateForMediaProcessingTaskID:assetUUIDs:resetOptions:reply:]");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __93__PLAssetsdPhotoKitService_resetStateForMediaProcessingTaskID_assetUUIDs_resetOptions_reply___block_invoke;
    v24[3] = &unk_1E366DEB0;
    v16 = v15;
    v25 = v16;
    v29 = a3;
    v26 = v10;
    v30 = a5;
    v27 = v14;
    v28 = v11;
    objc_msgSend(v27, "performTransaction:", v24);
    v17 = v28;
    v18 = v16;

    v19 = v25;
    v20 = v18;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D74498];
    v31 = *MEMORY[0x1E0CB2938];
    v32[0] = CFSTR("No photo library available for resetting media processing state");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 46502, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v19);
    v20 = 0;
  }

  return v20;
}

- (void)_processUniversalSearchJITForAsset:(id)a3 cssiUniqueIdentifier:(id)a4 bundleID:(id)a5 processingTypes:(unint64_t)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  qos_class_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  PLAssetsdPhotoKitService *v29;
  id v30;
  id v31;
  SEL v32;
  unint64_t v33;
  qos_class_t v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = qos_class_self();
  PLPhotoKitGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    PLStringFromQoSClass();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v19;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "US JIT Processing: request QoS is %@", buf, 0xCu);

  }
  objc_msgSend(v13, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    objc_msgSend(v13, "firstPersistedResourceMatching:", &__block_literal_global_59117);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21
      || (objc_msgSend(v13, "firstPersistedResourceMatching:", &__block_literal_global_57_59118),
          (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_3;
      v27[3] = &unk_1E366DF90;
      v32 = a2;
      v28 = v20;
      v29 = self;
      v31 = v16;
      v33 = a6;
      v30 = v14;
      v34 = v17;
      objc_msgSend(v21, "makeResourceLocallyAvailableWithCompletion:", v27);

      v22 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("US JIT Processing: Unable to find target resource for asset %@"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0D74498];
      v35 = *MEMORY[0x1E0CB2938];
      v36 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 47017, v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v16 + 2))(v16, v26);

    }
  }
  else
  {
    PLPhotoKitGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v38 = v14;
      v39 = 2114;
      v40 = v15;
      v41 = 2114;
      v42 = v20;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_INFO, "US JIT Processing: (ingest only) item %{public}@ from %{public}@ succeeded for asset %{public}@", buf, 0x20u);
    }

    (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
  }

}

- (id)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (id)clientDescription
{
  return -[PLAssetsdConnectionAuthorization description](self->_connectionAuthorization, "description");
}

- (id)clientBundleID
{
  return -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
}

- (id)clientDisplayName
{
  return -[PLAssetsdConnectionAuthorization trustedCallerDisplayName](self->_connectionAuthorization, "trustedCallerDisplayName");
}

- (unint64_t)libraryRole
{
  return 0;
}

- (void)commitRequest:(id)a3 reply:(id)a4
{
  objc_msgSend(a3, "executeWithService:reply:", self, a4);
}

- (void)executeQueryForSyncManager:(id)a3 type:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 batchHandler:(id)a7 completionHandler:(id)a8
{
  void *v10;
  void (**v11)(id, id);
  void *v12;
  id v13;

  v10 = (void *)MEMORY[0x1E0CB3488];
  v11 = (void (**)(id, id))a8;
  objc_msgSend(v10, "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdPhotoKitService.m"), 468, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("\"this code path is not expected\" && NO"));

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46309, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v13);

}

- (void)executeQueryForSyncManager:(id)a3 type:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 itemHandler:(id)a7 completionHandler:(id)a8
{
  void *v10;
  void (**v11)(id, id);
  void *v12;
  id v13;

  v10 = (void *)MEMORY[0x1E0CB3488];
  v11 = (void (**)(id, id))a8;
  objc_msgSend(v10, "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdPhotoKitService.m"), 474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("\"this code path is not expected\" && NO"));

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46309, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v13);

}

- (BOOL)syncManager:(id)a3 shouldContinueWithLibrary:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdPhotoKitService.m"), 480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("\"this code path is not expected\" && NO"));

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraTaskConstraintCoordinator, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

void __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_67;
    v21[3] = &unk_1E366DEB0;
    v26 = *(_QWORD *)(a1 + 72);
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v22 = v6;
    v23 = v7;
    v24 = v8;
    v9 = *(id *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v25 = v9;
    v27 = v10;
    v11 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v21);
    if (qos_class_self() == *(_DWORD *)(a1 + 80))
    {
      v11[2](v11);
    }
    else
    {
      PLPhotoKitGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        qos_class_self();
        PLStringFromQoSClass();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        PLStringFromQoSClass();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v15;
        v30 = 2112;
        v31 = v16;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "US JIT Processing: after making resource locally available, QoS is %@, changing to %@ before issuing MAD request", buf, 0x16u);

      }
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v17, *(dispatch_qos_class_t *)(a1 + 80), 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = dispatch_queue_create("MAD QoS correction queue", v18);

      dispatch_async(v19, v11);
    }

  }
  else
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      v30 = 2112;
      v31 = v5;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "US JIT Processing: failed to make medium resource locally available for asset %{public}@ : %@", buf, 0x16u);
    }

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("PLAssetsdPhotoKitService.m"), 349, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("availabilityError"));

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_67(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v2 = *(_QWORD *)(a1 + 64);
  v41[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_2_70;
  v28[3] = &unk_1E366DF18;
  v28[4] = &v29;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_72;
  v21[3] = &unk_1E3672048;
  v26 = &v29;
  v22 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v23 = v6;
  v24 = v7;
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 72);
  v25 = v8;
  v27 = v9;
  v10 = +[PLMediaAnalysisServiceRequestAdapter requestProcessingTypes:forAssetsWithLocalIdentifiers:fromPhotoLibraryWithURL:progressHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestProcessingTypes:forAssetsWithLocalIdentifiers:fromPhotoLibraryWithURL:progressHandler:completionHandler:", v2, v3, v5, v28, v21);
  v30[3] = v10;

  if (v30[3])
  {
    PLPhotoKitGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = v30[3];
      v13 = *(_QWORD *)(a1 + 48);
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      v36 = v12;
      v37 = 2114;
      v38 = v13;
      v39 = 2114;
      v40 = v14;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "US JIT Processing: Dispatched MediaAnalysis request %td for item %{public}@ assetUUID %{public}@", buf, 0x20u);
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v36 = v16;
      v37 = 2114;
      v38 = v17;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "US JIT Processing: Failed to dispatch MediaAnalysis request for item %{public}@ assetUUID %{public}@", buf, 0x16u);
    }

    v18 = *(_QWORD *)(a1 + 56);
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2938];
    v34 = CFSTR("Unable to dispatch MediaAnalysis request");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v20);

  }
  _Block_object_dispose(&v29, 8);
}

void __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_2_70(uint64_t a1, double a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLPhotoKitGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v6 = 134218240;
    v7 = v5;
    v8 = 2048;
    v9 = a2;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "US JIT Processing: MediaAnalysis request %td progress %f", (uint8_t *)&v6, 0x16u);
  }

}

void __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id *v21;
  id *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const __CFString **v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[2];
  id v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  id v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  const __CFString *v62;
  _QWORD v63[2];

  v63[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLPhotoKitGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v52 = v10;
      v53 = 2114;
      v54 = v11;
      v55 = 2114;
      v56 = v12;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "US JIT Processing: MediaAnalysis request %td succeeded for item %{public}@ asset %{public}@", buf, 0x20u);
    }

    v13 = _os_feature_enabled_impl();
    objc_msgSend(*(id *)(a1 + 48), "libraryServicesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v14, "searchIndexingEngine");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      PLPhotoKitGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v9)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v19 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v52 = v18;
          v53 = 2114;
          v54 = v19;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "US JIT Processing: Donating to CoreSpotlight item %{public}@ asset %{public}@", buf, 0x16u);
        }

        v63[0] = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_75;
        v47[3] = &unk_1E366DF40;
        v21 = &v48;
        v48 = *(id *)(a1 + 32);
        v22 = &v49;
        v49 = *(id *)(a1 + 40);
        v50 = *(id *)(a1 + 56);
        objc_msgSend(v9, "indexAssetsWithUUIDs:partialUpdateMask:completion:", v20, 3, v47);

        v23 = v50;
LABEL_17:

        goto LABEL_18;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v52 = v32;
        v53 = 2114;
        v54 = v33;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "US JIT Processing: No search indexing engine! Indexing failed for item %{public}@ asset %{public}@", buf, 0x16u);
      }

      v34 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0D74498];
      v61 = *MEMORY[0x1E0CB2938];
      v62 = CFSTR("No search index manager");
      v36 = (void *)MEMORY[0x1E0C99D80];
      v37 = &v62;
      v38 = &v61;
    }
    else
    {
      objc_msgSend(v14, "searchIndexManager");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      PLPhotoKitGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v9)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v26 = *(_QWORD *)(a1 + 32);
          v27 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v52 = v26;
          v53 = 2114;
          v54 = v27;
          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_INFO, "US JIT Processing: Donating to CoreSpotlight item %{public}@ asset %{public}@", buf, 0x16u);
        }

        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_78;
        v42[3] = &unk_1E366DF68;
        v21 = &v43;
        v28 = *(_QWORD *)(a1 + 40);
        v43 = *(id *)(a1 + 32);
        v22 = (id *)v44;
        v29 = *(id *)(a1 + 40);
        v46 = *(_QWORD *)(a1 + 72);
        v30 = *(_QWORD *)(a1 + 48);
        v31 = *(void **)(a1 + 56);
        v44[0] = v29;
        v44[1] = v30;
        v45 = v31;
        objc_msgSend(v9, "indexSingleAssetWithUUID:completion:", v28, v42);
        v23 = v45;
        goto LABEL_17;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v39 = *(_QWORD *)(a1 + 32);
        v40 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v52 = v39;
        v53 = 2114;
        v54 = v40;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "US JIT Processing: No search index manager! Indexing failed for item %{public}@ asset %{public}@", buf, 0x16u);
      }

      v34 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0D74498];
      v59 = *MEMORY[0x1E0CB2938];
      v60 = CFSTR("No search index manager");
      v36 = (void *)MEMORY[0x1E0C99D80];
      v37 = &v60;
      v38 = &v59;
    }
    objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 41008, v41);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_19;
    goto LABEL_5;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    v52 = v6;
    v53 = 2114;
    v54 = v7;
    v55 = 2114;
    v56 = v8;
    v57 = 2112;
    v58 = v3;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "US JIT Processing: MediaAnalysis request %td failed for item %{public}@ asset %{public}@: %@", buf, 0x2Au);
  }

  v9 = v3;
LABEL_5:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_18:

LABEL_19:
}

void __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_75(_QWORD *a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "isSuccess");
  PLPhotoKitGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = a1[4];
      v8 = a1[5];
      v14 = 138543618;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "US JIT Processing: Donation of CoreSpotlight item %{public}@ asset %{public}@ succeeded", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = a1[4];
    v10 = a1[5];
    objc_msgSend(v3, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "US JIT Processing: Failed to donate to CoreSpotlight item %{public}@ asset %{public}@: %@", (uint8_t *)&v14, 0x20u);

  }
  v12 = a1[6];
  objc_msgSend(v3, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

}

void __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_78(_QWORD *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = a1[4];
      v9 = a1[5];
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      v10 = "US JIT Processing: Donation of CoreSpotlight item %{public}@ asset %{public}@ succeeded";
      v11 = v7;
      v12 = OS_LOG_TYPE_INFO;
      v13 = 22;
LABEL_8:
      _os_log_impl(&dword_199541000, v11, v12, v10, buf, v13);
    }
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[6], CFSTR("PLAssetsdPhotoKitService.m"), 392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexError != nil"));

    }
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = a1[4];
      v15 = a1[5];
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 2114;
      v20 = v15;
      v21 = 2112;
      v22 = v6;
      v10 = "US JIT Processing: Failed to donate to CoreSpotlight item %{public}@ asset %{public}@: %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
      goto LABEL_8;
    }
  }

  (*(void (**)(void))(a1[7] + 16))();
}

uint64_t __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setDataStoreSubtype:", 1);
  return 1;
}

BOOL __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recipeID") == 65741;
}

void __93__PLAssetsdPhotoKitService_resetStateForMediaProcessingTaskID_assetUUIDs_resetOptions_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = 0;
  PLResetStateForMediaProcessingTaskID(v2, v4, v3, v5, (uint64_t)&v7);
  v6 = v7;
  objc_msgSend(*(id *)(a1 + 32), "resignCurrent");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __59__PLAssetsdPhotoKitService_analyzeLibraryForFeature_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __59__PLAssetsdPhotoKitService_analyzeAssets_forFeature_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetsWithUUIDs:options:inLibrary:](PLManagedAsset, "assetsWithUUIDs:options:inLibrary:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v10 = *(_QWORD *)(a1 + 72);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__PLAssetsdPhotoKitService_analyzeAssets_forFeature_reply___block_invoke_2;
  v15[3] = &unk_1E366F590;
  v11 = *(void **)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  objc_msgSend(v11, "analyzeAssets:forFeature:withCompletionHandler:", v3, v10, v15);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

void __59__PLAssetsdPhotoKitService_analyzeAssets_forFeature_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __88__PLAssetsdPhotoKitService_processUniversalSearchJITForAssetUUID_processingTypes_reply___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    PLPhotoKitGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v17 = v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "US JIT Processing: asset %{public}@ found", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 80);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__PLAssetsdPhotoKitService_processUniversalSearchJITForAssetUUID_processingTypes_reply___block_invoke_48;
    v14[3] = &unk_1E3676858;
    v6 = *(void **)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v6, "_processUniversalSearchJITForAsset:cssiUniqueIdentifier:bundleID:processingTypes:completion:", v2, 0, 0, v5, v14);
    v7 = v15;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("US JIT Processing: Unable to find asset with uuid %@"), *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D74498];
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 41004, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

uint64_t __88__PLAssetsdPhotoKitService_processUniversalSearchJITForAssetUUID_processingTypes_reply___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __117__PLAssetsdPhotoKitService_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithSyndicationIdentifier:inLibrary:](PLManagedAsset, "assetWithSyndicationIdentifier:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "uuid");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v26 = v8;
      v27 = 2114;
      v28 = v9;
      v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "US JIT Processing: asset %{public}@ found for searchable item %{public}@ from %{public}@ ", buf, 0x20u);
    }

    v11 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(a1 + 56);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __117__PLAssetsdPhotoKitService_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_reply___block_invoke_43;
    v22[3] = &unk_1E366DE38;
    v14 = *(_QWORD *)(a1 + 96);
    v24 = *(_QWORD *)(a1 + 88);
    v23 = *(id *)(a1 + 64);
    objc_msgSend(v12, "_processUniversalSearchJITForAsset:cssiUniqueIdentifier:bundleID:processingTypes:completion:", v3, v11, v13, v14, v22);
    v15 = v23;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("US JIT Processing: Unable to find asset with syndication identifier %@"), *(_QWORD *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D74498];
    v31 = *MEMORY[0x1E0CB2938];
    v32[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 41004, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
}

void __117__PLAssetsdPhotoKitService_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_reply___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __77__PLAssetsdPhotoKitService_getUUIDsForAssetObjectURIs_filterPredicate_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "managedObjectIDForURIRepresentation:", a2);
}

void __77__PLAssetsdPhotoKitService_getUUIDsForAssetObjectURIs_filterPredicate_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "URIRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKey:", v5, v6);

}

uint64_t __77__PLAssetsdPhotoKitService_resolveLocalIdentifiersForCloudIdentifiers_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
