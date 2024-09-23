@implementation PLAssetsdCloudService

- (PLAssetsdCloudService)initWithLibraryServicesManager:(id)a3 lazyResourceDownloader:(id)a4
{
  id v7;
  PLAssetsdCloudService *v8;
  PLAssetsdCloudService *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetsdCloudService;
  v8 = -[PLAbstractLibraryServicesManagerService initWithLibraryServicesManager:](&v11, sel_initWithLibraryServicesManager_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_lazyResourceDownloader, a4);

  return v9;
}

- (id)resourceDownloader
{
  return (id)-[PLLazyObject objectValue](self->_lazyResourceDownloader, "objectValue");
}

- (void)requestVideoPlaybackURLForCloudSharedAsset:(id)a3 mediaAssetType:(unint64_t)a4 reply:(id)a5
{
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
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *Name;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  SEL sel[2];
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v33 = 0u;
  *(_OWORD *)sel = 0u;
  v32 = 0u;
  v11 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v32) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199541000, "PLXPC Service: requestVideoPlaybackURLForCloudSharedAsset:mediaAssetType:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v32 + 1);
    *((_QWORD *)&v32 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCloudService.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectURI"));

  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "persistentStoreCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "managedObjectIDForURIRepresentation:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 && (objc_msgSend(v16, "isTemporaryID") & 1) == 0)
  {
    v21 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudService requestVideoPlaybackURLForCloudSharedAsset:mediaAssetType:reply:]");
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __89__PLAssetsdCloudService_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_reply___block_invoke;
    v27[3] = &unk_1E3674E68;
    v28 = v17;
    v20 = v21;
    v29 = v20;
    v31 = a4;
    v30 = v10;
    objc_msgSend(v20, "performBlockAndWait:", v27);

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v36 = CFSTR("Invalid object URI");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v20);
  }

  if ((_BYTE)v32)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  if ((_QWORD)v33)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v38 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)cancelCPLDownloadTaskWithIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
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
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  *(_OWORD *)sel = 0u;
  v13 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v13) = v8;
  if (v8)
  {
    *((_QWORD *)&v13 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: cancelCPLDownloadTaskWithIdentifier:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  -[PLAssetsdCloudService resourceDownloader](self, "resourceDownloader", (_QWORD)v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelCPLDownloadTaskWithIdentifier:completionHandler:", v6, v7);

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

- (void)downloadCloudPhotoLibraryAssetWithObjectURI:(id)a3 taskIdentifier:(id)a4 resourceType:(unint64_t)a5 HighPriority:(BOOL)a6 trackCPLDownload:(BOOL)a7 downloadIsTransient:(BOOL)a8 reply:(id)a9
{
  id v15;
  id v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  const char *Name;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  PLAssetsdCloudService *v37;
  id v38;
  id v39;
  unint64_t v40;
  BOOL v41;
  BOOL v42;
  BOOL v43;
  __int128 v44;
  __int128 v45;
  SEL sel[2];
  uint64_t v47;
  const __CFString *v48;
  uint8_t buf[4];
  const char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v32 = a4;
  v16 = a9;
  v45 = 0u;
  *(_OWORD *)sel = 0u;
  v44 = 0u;
  v17 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v44) = v17;
  if (v17)
  {
    v18 = _os_activity_create(&dword_199541000, "PLXPC Service: downloadCloudPhotoLibraryAssetWithObjectURI:taskIdentifier:resourceType:HighPriority:trackCPLDownload:downloadIsTransient:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v19 = (void *)*((_QWORD *)&v44 + 1);
    *((_QWORD *)&v44 + 1) = v18;

    os_activity_scope_enter(v18, (os_activity_scope_state_t)((char *)&v45 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", v32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "persistentStoreCoordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "managedObjectIDForURIRepresentation:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22 && (objc_msgSend(v22, "isTemporaryID") & 1) == 0)
  {
    v27 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudService downloadCloudPhotoLibraryAssetWithObjectURI:taskIdentifier:resourceType:HighPriority:trackCPLDownload:downloadIsTransient:reply:]");
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __153__PLAssetsdCloudService_downloadCloudPhotoLibraryAssetWithObjectURI_taskIdentifier_resourceType_HighPriority_trackCPLDownload_downloadIsTransient_reply___block_invoke;
    v34[3] = &unk_1E3667930;
    v35 = v23;
    v26 = v27;
    v36 = v26;
    v37 = self;
    v40 = a5;
    v41 = a6;
    v42 = a7;
    v43 = a8;
    v38 = v33;
    v39 = v16;
    objc_msgSend(v26, "performBlock:withPriority:", v34, 1);

  }
  else
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    v48 = CFSTR("Invalid object URI");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v16 + 2))(v16, 0, 0, 0, v26);
  }

  if ((_BYTE)v44)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v45 + 8));
  if ((_QWORD)v45)
  {
    PLRequestGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = v45;
    if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v50 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v29, OS_SIGNPOST_INTERVAL_END, v30, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asynchronousStartPreheatingCPLDownloadForAssets:(id)a3 doneTokens:(id)a4 format:(unint64_t)a5 reply:(id)a6
{
  unsigned __int16 v7;
  id v10;
  id v11;
  void (**v12)(id, uint64_t, void *, _QWORD);
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  const char *Name;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  PLAssetsdCloudService *v38;
  id v39;
  void (**v40)(id, uint64_t, void *, _QWORD);
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  SEL sel[2];
  uint64_t v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  uint64_t v49;

  v7 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t, void *, _QWORD))a6;
  v43 = 0u;
  *(_OWORD *)sel = 0u;
  v42 = 0u;
  v13 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v42) = v13;
  if (v13)
  {
    v14 = _os_activity_create(&dword_199541000, "PLXPC Service: asynchronousStartPreheatingCPLDownloadForAssets:doneTokens:format:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v15 = (void *)*((_QWORD *)&v42 + 1);
    *((_QWORD *)&v42 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v43 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isCloudPhotoLibraryEnabled");

  v18 = objc_msgSend(v10, "count");
  if (v18 == objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v20 = v18;
      do
      {
        objc_msgSend(v19, "addObject:", &stru_1E36789C0);
        --v20;
      }
      while (v20);
    }
    if ((v17 & 1) == 0)
      v12[2](v12, 1, v19, 0);
    objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudService asynchronousStartPreheatingCPLDownloadForAssets:doneTokens:format:reply:]");
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __97__PLAssetsdCloudService_asynchronousStartPreheatingCPLDownloadForAssets_doneTokens_format_reply___block_invoke;
    v33[3] = &unk_1E3667958;
    v41 = v18;
    v34 = v10;
    v35 = v11;
    v23 = v22;
    v36 = v23;
    v24 = v21;
    v37 = v24;
    v38 = self;
    v25 = v19;
    v39 = v25;
    v40 = v12;
    objc_msgSend(v23, "performBlock:withPriority:", v33, 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mismatch between the number of asset uuids and tokens, assetUUIDs count: %tu, doneTokens count: %tu"), v18, objc_msgSend(v11, "count"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    PLImageManagerGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v48 = (const char *)v25;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v27 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D50];
    v46 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v28);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, uint64_t, void *, id))v12)[2](v12, 0, 0, v24);
  }

  if ((_BYTE)v42)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v43 + 8));
  if ((_QWORD)v43)
  {
    PLRequestGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = v43;
    if ((unint64_t)(v43 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v48 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asynchronousStopPreheatingCPLDownloadForAssetsWithTaskIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
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
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  *(_OWORD *)sel = 0u;
  v13 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v13) = v8;
  if (v8)
  {
    *((_QWORD *)&v13 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: asynchronousStopPreheatingCPLDownloadForAssetsWithTaskIdentifiers:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  -[PLAssetsdCloudService resourceDownloader](self, "resourceDownloader", (_QWORD)v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelCPLDownloadTasks:completionHandler:", v6, v7);

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

- (void)computeFingerPrintsOfAssetWithObjectURI:(id)a3 synchronously:(BOOL)a4 reply:(id)a5
{
  _BOOL4 v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *Name;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  SEL sel[2];
  uint64_t v34;
  const __CFString *v35;
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  v6 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v32 = 0u;
  *(_OWORD *)sel = 0u;
  v31 = 0u;
  v10 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v31) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199541000, "PLXPC Service: computeFingerPrintsOfAssetWithObjectURI:synchronously:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "databaseContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudService computeFingerPrintsOfAssetWithObjectURI:synchronously:reply:]");

  objc_msgSend(v15, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistentStoreCoordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "managedObjectIDForURIRepresentation:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __85__PLAssetsdCloudService_computeFingerPrintsOfAssetWithObjectURI_synchronously_reply___block_invoke;
    v27[3] = &unk_1E3676290;
    v28 = v16;
    v29 = v18;
    v30 = v9;
    v19 = (void *)MEMORY[0x19AEC174C](v27);
    if (v6)
      objc_msgSend(v15, "performBlockAndWait:", v19);
    else
      objc_msgSend(v15, "performBlock:", v19);

    v22 = v28;
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35 = CFSTR("Invalid objectID value");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v22);
  }

  if ((_BYTE)v31)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  if ((_QWORD)v32)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v37 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyResourceDownloader, 0);
}

void __85__PLAssetsdCloudService_computeFingerPrintsOfAssetWithObjectURI_synchronously_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectWithID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v7 = 0;
    v8 = 0;
    objc_msgSend(v2, "masterFingerPrintCacheIfNecessaryAndAdjustedFingerPrint:error:", &v8, &v7);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v8;
    v6 = (uint64_t)v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41001, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v4 = 0;
    v5 = 0;
  }
  if (!(v4 | v6))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41001, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __97__PLAssetsdCloudService_asynchronousStartPreheatingCPLDownloadForAssets_doneTokens_format_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _UNKNOWN **v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 88))
  {
    v2 = 0;
    v3 = &off_1E3659000;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        PLImageManagerGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v25 = v16;
          v26 = 2112;
          v27 = v18;
          _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Received Non-NSString element over xpc, assetuuid: %@, doneToken: %@", buf, 0x16u);

        }
        goto LABEL_19;
      }
      objc_msgSend(v3[476], "assetWithUUID:inLibrary:", v4, *(_QWORD *)(a1 + 48));
      v6 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isCloudSharedAsset](v6, "isCloudSharedAsset") & 1) == 0)
        break;
LABEL_19:

      if ((unint64_t)++v2 >= *(_QWORD *)(a1 + 88))
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }
    v7 = *(_QWORD *)(a1 + 56);
    v23 = 0;
    v8 = +[PLResourceChooser cloudResourceTypeForAsset:format:filePath:imageType:](PLResourceChooser, "cloudResourceTypeForAsset:format:filePath:imageType:", v6, v7, &v23, 0);
    v22 = v23;
    PLImageManagerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 56), "shortDescription");
      v21 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCloudPhotoLibraryManager descriptionForResourceType:](PLCloudPhotoLibraryManager, "descriptionForResourceType:", v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22 != 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v25 = v4;
      v26 = 2112;
      v27 = v10;
      v28 = 2112;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Preheated an asset (uuid: %@) for format (%@), resulting cloud resource type: %@, image is on disk: %@", buf, 0x2Au);

      v3 = &off_1E3659000;
      v8 = v21;
    }

    if (v8)
    {
      if (v22)
      {
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(*(id *)(a1 + 64), "resourceDownloader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = 0;
      objc_msgSend(v13, "startCPLDownloadForAsset:resourceType:masterResourceOnly:highPriority:track:notify:transient:proposedTaskIdentifier:doneToken:error:", v6, v8, 0, 1, 1, 0, v20, 0, v5, 0);
      v14 = objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(*(id *)(a1 + 72), "replaceObjectAtIndex:withObject:", v2, v14);
    }
    else
    {
      PLImageManagerGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v4;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "During preheating, expected to find cloud resource for asset (uuid: %@) but found nothing", buf, 0xCu);
      }
    }

    goto LABEL_18;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

void __153__PLAssetsdCloudService_downloadCloudPhotoLibraryAssetWithObjectURI_taskIdentifier_resourceType_HighPriority_trackCPLDownload_downloadIsTransient_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "isDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "resourceDownloader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 72);
    v10 = *(unsigned __int8 *)(a1 + 80);
    v11 = *(unsigned __int8 *)(a1 + 81);
    v12 = *(_BYTE *)(a1 + 82);
    v13 = *(_QWORD *)(a1 + 56);
    v17 = 0;
    LOBYTE(v16) = v12;
    objc_msgSend(v8, "startCPLDownloadForAsset:resourceType:masterResourceOnly:highPriority:track:notify:transient:proposedTaskIdentifier:doneToken:error:", v3, v9, 0, v10, v11, v11, v16, v13, 0, &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;

    if (*(_BYTE *)(a1 + 81))
    {
      +[PLCloudPhotoLibraryManager descriptionForResourceType:](PLCloudPhotoLibraryManager, "descriptionForResourceType:", *(_QWORD *)(a1 + 72));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = *MEMORY[0x1E0D74498];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("Asset is invalid.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 41008, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __89__PLAssetsdCloudService_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "isDeleted") & 1) == 0 && objc_msgSend(v3, "isCloudSharedAsset"))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __89__PLAssetsdCloudService_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_reply___block_invoke_2;
    v9[3] = &unk_1E3675C58;
    v10 = v3;
    v11 = *(id *)(a1 + 48);
    +[PLPhotoSharingHelper requestVideoPlaybackURLForAsset:videoType:completion:](PLPhotoSharingHelper, "requestVideoPlaybackURLForAsset:videoType:completion:", v10, v4, v9);

    v5 = v10;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D74498];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("Invalid asset to request streaming video URL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 41003, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __89__PLAssetsdCloudService_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_reply___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cachedNonPersistedVideoPlaybackURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cachedNonPersistedVideoPlaybackURLError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, BOOL, id, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v2 == 0, v3, v2);

}

@end
