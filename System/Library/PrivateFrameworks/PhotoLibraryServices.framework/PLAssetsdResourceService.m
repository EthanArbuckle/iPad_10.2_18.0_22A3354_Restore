@implementation PLAssetsdResourceService

- (PLAssetsdResourceService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4 resourceDownloader:(id)a5
{
  id v9;
  PLAssetsdResourceService *v10;
  PLAssetsdResourceService *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *asyncImageDataQueue;
  objc_super v16;

  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLAssetsdResourceService;
  v10 = -[PLAssetsdResourceWriteOnlyService initWithLibraryServicesManager:connectionAuthorization:](&v16, sel_initWithLibraryServicesManager_connectionAuthorization_, a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_resourceDownloader, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.photos.backend.resourceService.imageDataQueue", v12);
    asyncImageDataQueue = v11->_asyncImageDataQueue;
    v11->_asyncImageDataQueue = (OS_dispatch_queue *)v13;

  }
  return v11;
}

- (void)saveAssetWithDataAndPorts:(id)a3 imageSurface:(id)a4 previewImageSurface:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
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

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v19 = 0u;
  v14 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v19) = v14;
  if (v14)
  {
    *((_QWORD *)&v19 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: saveAssetWithDataAndPorts:imageSurface:previewImageSurface:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection", (_QWORD)v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdResourceWriteOnlyService saveAssetWithDataAndPorts:clientConnection:imageSurface:previewImageSurface:reply:](self, "saveAssetWithDataAndPorts:clientConnection:imageSurface:previewImageSurface:reply:", v10, v15, v11, v12, v13);

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

- (void)addAssetGroupWithName:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  _QWORD v20[4];
  void (**v21)(id, uint64_t, _QWORD);
  __int128 *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  __int128 *p_buf;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v29 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v27) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: addAssetGroupWithName:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v27 + 1);
    *((_QWORD *)&v27 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  -[PLAssetsdResourceWriteOnlyService connectionAuthorization](self, "connectionAuthorization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isClientInLimitedLibraryMode");

  if (v12)
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__53965;
    v33 = __Block_byref_object_dispose__53966;
    v34 = 0;
    v13 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceService addAssetGroupWithName:reply:]");
    v14 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __56__PLAssetsdResourceService_addAssetGroupWithName_reply___block_invoke;
    v23[3] = &unk_1E3676EA0;
    v24 = v6;
    v15 = v13;
    v25 = v15;
    p_buf = &buf;
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __56__PLAssetsdResourceService_addAssetGroupWithName_reply___block_invoke_2;
    v20[3] = &unk_1E36714A8;
    v22 = &buf;
    v21 = v7;
    objc_msgSend(v15, "performTransaction:completionHandler:", v23, v20);

    _Block_object_dispose(&buf, 8);
  }
  if ((_BYTE)v27)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  if ((_QWORD)v28)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(*((SEL *)&v29 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)addAssetWithURL:(id)a3 toAlbum:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *Name;
  _QWORD v26[4];
  void (**v27)(id, uint64_t, _QWORD);
  _QWORD *v28;
  __int128 *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  __int128 *p_buf;
  _QWORD v36[3];
  char v37;
  __int128 v38;
  __int128 v39;
  SEL sel[2];
  uint64_t v41;
  const __CFString *v42;
  __int128 buf;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v39 = 0u;
  *(_OWORD *)sel = 0u;
  v38 = 0u;
  v11 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v38) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199541000, "PLXPC Service: addAssetWithURL:toAlbum:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v38 + 1);
    *((_QWORD *)&v38 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v39 + 8));
  }
  -[PLAssetsdResourceWriteOnlyService connectionAuthorization](self, "connectionAuthorization");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isClientInLimitedLibraryMode");

  if (v15)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    v16 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceService addAssetWithURL:toAlbum:reply:]");
    v17 = v16;
    if (v8 && v9)
    {
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x2020000000;
      v37 = 0;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__53965;
      v46 = __Block_byref_object_dispose__53966;
      v47 = 0;
      v18 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __58__PLAssetsdResourceService_addAssetWithURL_toAlbum_reply___block_invoke;
      v30[3] = &unk_1E366F518;
      v31 = v16;
      v32 = v9;
      v33 = v8;
      v34 = v36;
      p_buf = &buf;
      v26[0] = v18;
      v26[1] = 3221225472;
      v26[2] = __58__PLAssetsdResourceService_addAssetWithURL_toAlbum_reply___block_invoke_2;
      v26[3] = &unk_1E3674CE0;
      v27 = v10;
      v28 = v36;
      v29 = &buf;
      objc_msgSend(v31, "performTransaction:completionHandler:", v30, v26);

      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(v36, 8);
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = CFSTR("Invalid assetURL or album UUID");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v21);
    }

  }
  if ((_BYTE)v38)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v39 + 8));
  if ((_QWORD)v39)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v39;
    if ((unint64_t)(v39 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)filePathForPersistentURL:(id)a3 withAdjustments:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  const char *Name;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  SEL sel[2];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v20 = 0u;
  v10 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v20) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199541000, "PLXPC Service: filePathForPersistentURL:withAdjustments:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v20 + 1);
    *((_QWORD *)&v20 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__PLAssetsdResourceService_filePathForPersistentURL_withAdjustments_reply___block_invoke;
  v18[3] = &unk_1E366C230;
  v13 = v9;
  v19 = v13;
  -[PLAssetsdResourceService translatePersistentURL:withAdjustments:handler:](self, "translatePersistentURL:withAdjustments:handler:", v8, v6, v18);

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

- (void)sandboxExtensionURLForPersistentURL:(id)a3 withAdjustments:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
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

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v20 = 0u;
  v10 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v20) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199541000, "PLXPC Service: sandboxExtensionURLForPersistentURL:withAdjustments:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v20 + 1);
    *((_QWORD *)&v20 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__PLAssetsdResourceService_sandboxExtensionURLForPersistentURL_withAdjustments_reply___block_invoke;
  v18[3] = &unk_1E366C258;
  v18[4] = self;
  v13 = v9;
  v19 = v13;
  -[PLAssetsdResourceService translatePersistentURL:withAdjustments:handler:](self, "translatePersistentURL:withAdjustments:handler:", v8, v6, v18);

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

- (void)fileDescriptorForPersistentURL:(id)a3 withAdjustments:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  const char *Name;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  SEL sel[2];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v20 = 0u;
  v10 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v20) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199541000, "PLXPC Service: fileDescriptorForPersistentURL:withAdjustments:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v20 + 1);
    *((_QWORD *)&v20 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__PLAssetsdResourceService_fileDescriptorForPersistentURL_withAdjustments_reply___block_invoke;
  v18[3] = &unk_1E366C230;
  v13 = v9;
  v19 = v13;
  -[PLAssetsdResourceService translatePersistentURL:withAdjustments:handler:](self, "translatePersistentURL:withAdjustments:handler:", v8, v6, v18);

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

- (void)imageDataForAssetWithObjectURI:(id)a3 formatID:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 reply:(id)a9
{
  uint64_t v13;
  id v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  const char *Name;
  void *v33;
  BOOL v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  PLAssetsdResourceService *v39;
  id v40;
  id v41;
  __int16 v42;
  char v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  BOOL v47;
  __int128 v48;
  __int128 v49;
  SEL sel[2];
  uint8_t buf[4];
  const char *v52;
  uint64_t v53;

  v13 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v15 = a9;
  v49 = 0u;
  *(_OWORD *)sel = 0u;
  v48 = 0u;
  v16 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v48) = v16;
  if (v16)
  {
    v17 = _os_activity_create(&dword_199541000, "PLXPC Service: imageDataForAssetWithObjectURI:formatID:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v18 = (void *)*((_QWORD *)&v48 + 1);
    *((_QWORD *)&v48 + 1) = v17;

    os_activity_scope_enter(v17, (os_activity_scope_state_t)((char *)&v49 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "persistentStoreCoordinator");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v15;
  v34 = a6;
  objc_msgSend(v36, "managedObjectIDForURIRepresentation:", v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = a8;
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isThumbnail");
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "databaseContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __141__PLAssetsdResourceService_imageDataForAssetWithObjectURI_formatID_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_reply___block_invoke;
  v37[3] = &unk_1E366C2A8;
  v26 = v20;
  v42 = v13;
  v38 = v26;
  v39 = self;
  v27 = v22;
  v40 = v27;
  v43 = v23;
  v44 = a5;
  v45 = v34;
  v46 = a7;
  v47 = v21;
  v28 = v33;
  v41 = v28;
  objc_msgSend(v25, "perform:withName:", v37, "-[PLAssetsdResourceService imageDataForAssetWithObjectURI:formatID:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:reply:]");

  if ((_BYTE)v48)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v49 + 8));
  if ((_QWORD)v49)
  {
    PLRequestGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = v49;
    if ((unint64_t)(v49 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v52 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getSandboxExtensionsForAssetWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  id v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  const char *Name;
  id v40;
  id v41;
  void (**v42)(id, uint64_t, void *, _QWORD);
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  PLAssetsdResourceService *v51;
  __int128 *v52;
  uint64_t *v53;
  uint64_t *v54;
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  __int128 v66;
  __int128 v67;
  SEL sel[2];
  uint8_t buf[4];
  const __CFString *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  uint8_t v75[128];
  __int128 v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v42 = (void (**)(id, uint64_t, void *, _QWORD))a4;
  v67 = 0u;
  *(_OWORD *)sel = 0u;
  v66 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v66) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199541000, "PLXPC Service: getSandboxExtensionsForAssetWithUUID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v66 + 1);
    *((_QWORD *)&v66 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v67 + 8));
  }
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  *(_QWORD *)&v76 = 0;
  *((_QWORD *)&v76 + 1) = &v76;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__53965;
  v79 = __Block_byref_object_dispose__53966;
  v80 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__53965;
  v60 = __Block_byref_object_dispose__53966;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v61 = (id)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdResourceWriteOnlyService connectionAuthorization](self, "connectionAuthorization");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchFilterIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLAssetsdResourceWriteOnlyService connectionAuthorization](self, "connectionAuthorization");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isClientInFullLibraryMode");

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "databaseContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __71__PLAssetsdResourceService_getSandboxExtensionsForAssetWithUUID_reply___block_invoke;
  v48[3] = &unk_1E366C2D0;
  v55 = v13;
  v41 = v11;
  v49 = v41;
  v40 = v6;
  v50 = v40;
  v51 = self;
  v52 = &v76;
  v53 = &v56;
  v54 = &v62;
  objc_msgSend(v15, "performSync:withName:", v48, "-[PLAssetsdResourceService getSandboxExtensionsForAssetWithUUID:reply:]");

  if (*((_BYTE *)v63 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v17 = (id)v57[5];
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v75, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v45;
      do
      {
        v20 = 0;
        v43 = v18;
        do
        {
          if (*(_QWORD *)v45 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v20);
          objc_msgSend(v21, "path");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          PLGetSandboxExtensionToken();
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v21, "path");
            v24 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v23, v24);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "path");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v25, "fileExistsAtPath:", v26);

            PLGatekeeperXPCGetLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v28 = v19;
              v29 = v17;
              v30 = v16;
              if (v27)
                v31 = CFSTR("YES");
              else
                v31 = CFSTR("NO");
              v32 = (void *)MEMORY[0x1E0D73208];
              objc_msgSend(v21, "path");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "redactedDescriptionForPath:", v33);
              v34 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "path");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v70 = v31;
              v71 = 2114;
              v72 = v34;
              v73 = 2112;
              v74 = v35;
              _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "No sandbox extension (fileExists=%{public}@) for %{public}@ (%@)", buf, 0x20u);

              v16 = v30;
              v17 = v29;
              v19 = v28;
              v18 = v43;

            }
          }

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v75, 16);
      }
      while (v18);
    }

    v42[2](v42, 1, v16, 0);
  }
  else
  {
    v42[2](v42, 0, 0, *(_QWORD *)(*((_QWORD *)&v76 + 1) + 40));
  }

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v62, 8);
  if ((_BYTE)v66)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v67 + 8));
  if ((_QWORD)v67)
  {
    PLRequestGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v38 = v67;
    if ((unint64_t)(v67 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      Name = sel_getName(sel[1]);
      LODWORD(v76) = 136446210;
      *(_QWORD *)((char *)&v76 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v37, OS_SIGNPOST_INTERVAL_END, v38, "PLXPC Sync", "%{public}s", (uint8_t *)&v76, 0xCu);
    }

  }
}

- (BOOL)_allowSandboxExtensionForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint8_t v11[16];

  v4 = a3;
  if (v4)
  {
    -[PLAssetsdResourceWriteOnlyService connectionAuthorization](self, "connectionAuthorization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captureSessionState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "captureSessionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PLAssetsdResourceService _allowSandboxExtensionForSessionIdentifier:captureSessionState:](self, "_allowSandboxExtensionForSessionIdentifier:captureSessionState:", v7, v6);

    }
    else
    {
      PLGatekeeperXPCGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Capture Session: State is unexpectedly nil, disallowing sandbox extensions for resources", v11, 2u);
      }

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_allowSandboxExtensionForSessionIdentifier:(id)a3 captureSessionState:(id)a4
{
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = 1;
  switch(objc_msgSend(v6, "type"))
  {
    case 0:
      goto LABEL_13;
    case 1:
    case 3:
      goto LABEL_14;
    case 2:
      v8 = objc_opt_class();
      v9 = v6;
      if (!v9)
        goto LABEL_8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable _PLAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nullable __strong)");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PLHelperExtension.h"), 76, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

LABEL_8:
        v11 = 0;
      }

      objc_msgSend(v11, "sessionIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v14, "isEqual:", v5);

LABEL_14:
      return v7;
    default:
      PLGatekeeperXPCGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v6;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Capture Session: Unexpected state for sandbox extensions: %{public}@", buf, 0xCu);
      }

LABEL_13:
      v7 = 0;
      goto LABEL_14;
  }
}

- (void)getSandboxExtensionForFileSystemBookmark:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, BOOL, uint64_t, void *, uint64_t);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, BOOL, uint64_t, void *, uint64_t))a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__53965;
  v39 = __Block_byref_object_dispose__53966;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__53965;
  v33 = __Block_byref_object_dispose__53966;
  v34 = 0;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __75__PLAssetsdResourceService_getSandboxExtensionForFileSystemBookmark_reply___block_invoke;
  v25[3] = &unk_1E366C2F8;
  v10 = v6;
  v26 = v10;
  v27 = &v29;
  v28 = &v35;
  objc_msgSend(v9, "performSync:withName:", v25, "-[PLAssetsdResourceService getSandboxExtensionForFileSystemBookmark:reply:]");

  v11 = (void *)v30[5];
  if (!v11)
  {
    if (!v36[5])
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = CFSTR("Unable to resolve bookmark URL");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41014, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v36[5];
      v36[5] = v17;

    }
    goto LABEL_9;
  }
  objc_msgSend(v11, "path");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "fileSystemRepresentation");
  -[PLAssetsdResourceWriteOnlyService connectionAuthorization](self, "connectionAuthorization");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "clientAuditToken");
  v19 = (void *)sandbox_extension_issue_file_to_process();

  if (!v19)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    v44[0] = CFSTR("Unable to extend sandbox for bookmark URL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41010, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v36[5];
    v36[5] = v23;

LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  free(v19);
LABEL_10:
  v7[2](v7, v20 != 0, v30[5], v20, v36[5]);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

}

- (void)asynchronousAdjustmentDataForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 reply:(id)a5
{
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  _QWORD v21[4];
  id v22;
  PLAssetsdResourceService *v23;
  id v24;
  BOOL v25;
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v10 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v26) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199541000, "PLXPC Service: asynchronousAdjustmentDataForAsset:networkAccessAllowed:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "databaseContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke;
  v21[3] = &unk_1E366C428;
  v15 = v8;
  v25 = a4;
  v22 = v15;
  v23 = self;
  v16 = v9;
  v24 = v16;
  objc_msgSend(v14, "perform:withName:", v21, "-[PLAssetsdResourceService asynchronousAdjustmentDataForAsset:networkAccessAllowed:reply:]");

  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v30 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)estimatedFileLengthOfVideo:(id)a3 fallbackFilePath:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, int64_t);
  int v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  const char *Name;
  __int128 v24;
  char v25;
  __int128 v26;
  SEL sel[2];
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, int64_t))a7;
  v26 = 0u;
  *(_OWORD *)sel = 0u;
  v24 = 0u;
  v17 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v24) = v17;
  if (v17)
  {
    *((_QWORD *)&v24 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: estimatedFileLengthOfVideo:fallbackFilePath:exportPreset:exportProperties:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v24 + 1), (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "databaseContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceService estimatedFileLengthOfVideo:fallbackFilePath:exportPreset:exportProperties:reply:]");

  v16[2](v16, +[PLAssetSharingUtilities estimatedOutputFileLengthForVideoURL:library:fallbackFilePath:exportPreset:exportProperties:](PLAssetSharingUtilities, "estimatedOutputFileLengthForVideoURL:library:fallbackFilePath:exportPreset:exportProperties:", v12, v20, v13, v14, v15));
  if (v25)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  if ((_QWORD)v26)
  {
    PLRequestGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_END, v26, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)downloadCloudSharedAsset:(id)a3 wantedPlaceholderkind:(signed __int16)a4 shouldPrioritize:(BOOL)a5 shouldExtendTimer:(BOOL)a6 reply:(id)a7
{
  id v12;
  id v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
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
  os_signpost_id_t v29;
  const char *Name;
  _QWORD v31[4];
  id v32;
  PLAssetsdResourceService *v33;
  id v34;
  __int128 *p_buf;
  signed __int16 v36;
  BOOL v37;
  BOOL v38;
  __int128 v39;
  __int128 v40;
  SEL sel[2];
  uint64_t v42;
  void *v43;
  __int128 buf;
  uint64_t v45;
  char v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v40 = 0u;
  *(_OWORD *)sel = 0u;
  v39 = 0u;
  v14 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v39) = v14;
  if (v14)
  {
    v15 = _os_activity_create(&dword_199541000, "PLXPC Service: downloadCloudSharedAsset:wantedPlaceholderkind:shouldPrioritize:shouldExtendTimer:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v16 = (void *)*((_QWORD *)&v39 + 1);
    *((_QWORD *)&v39 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v40 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "persistentStoreCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "managedObjectIDForURIRepresentation:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x2020000000;
  v46 = 0;
  if (v19 && (objc_msgSend(v19, "isTemporaryID") & 1) == 0)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "databaseContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke;
    v31[3] = &unk_1E366C4C0;
    v32 = v20;
    p_buf = &buf;
    v36 = a4;
    v33 = self;
    v34 = v13;
    v37 = a5;
    v38 = a6;
    objc_msgSend(v22, "performSync:withName:", v31, "-[PLAssetsdResourceService downloadCloudSharedAsset:wantedPlaceholderkind:shouldPrioritize:shouldExtendTimer:reply:]");

  }
  if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid cloud shared asset for download"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v26);
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v39)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v40 + 8));
  if ((_QWORD)v40)
  {
    PLRequestGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = v40;
    if ((unint64_t)(v40 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v28, OS_SIGNPOST_INTERVAL_END, v29, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (id)_typeFromPathConstrainedToImageOrMovie:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = *MEMORY[0x1E0CEC568];
    v19[0] = *MEMORY[0x1E0CEC520];
    v19[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", v5, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          if (!objc_msgSend(v12, "isDynamic"))
            break;
        }

        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)translatePersistentURL:(id)a3 withAdjustments:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(_QWORD, _QWORD);
  BOOL v22;

  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (!v8)
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  objc_msgSend(v8, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ipod-library")) & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(getMPMediaLibraryClass(), "defaultMediaLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isValidAssetURL:", v8);

  if (!v13)
  {
LABEL_8:
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "databaseContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__PLAssetsdResourceService_translatePersistentURL_withAdjustments_handler___block_invoke;
    v19[3] = &unk_1E366C4E8;
    v22 = a4;
    v20 = v8;
    v21 = v10;
    objc_msgSend(v18, "perform:withName:", v19, "-[PLAssetsdResourceService translatePersistentURL:withAdjustments:handler:]");

    goto LABEL_11;
  }
  objc_msgSend(getMPMediaLibraryClass(), "defaultMediaLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pathForAssetURL:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  ((void (**)(_QWORD, void *))v10)[2](v10, v16);

LABEL_11:
}

- (BOOL)_consolidateResource:(id)a3 assetUUID:(id)a4 bundleScope:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v6 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v29 = a4;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__53965;
  v41 = __Block_byref_object_dispose__53966;
  v42 = 0;
  objc_msgSend(v9, "fileSystemBookmark");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileSystemURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0D73278]);
    objc_msgSend(v9, "uniformTypeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "version");
    v17 = objc_msgSend(v9, "resourceType");
    v18 = objc_msgSend(v9, "recipeID");
    objc_msgSend(v11, "lastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v13, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v29, v6, v15, v16, v17, v18, v19);

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __77__PLAssetsdResourceService__consolidateResource_assetUUID_bundleScope_error___block_invoke;
    v30[3] = &unk_1E366C510;
    v31 = v11;
    v32 = v9;
    v36 = v6;
    v21 = v27;
    v33 = v21;
    v35 = &v37;
    v34 = v29;
    objc_msgSend(v21, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v20, 2, v30);

  }
  else
  {
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "objectID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v23;
      v45 = 2114;
      v46 = v29;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "No source URL for internal resource %{public}@ for asset uuid %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41004, MEMORY[0x1E0C9AA70]);
    v24 = objc_claimAutoreleasedReturnValue();
    v21 = (id)v38[5];
    v38[5] = v24;
  }

  v25 = (void *)v38[5];
  if (a6 && v25)
    *a6 = objc_retainAutorelease(v25);

  _Block_object_dispose(&v37, 8);
  return v25 == 0;
}

- (id)consolidateAssets:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *Name;
  void (**v28)(_QWORD, void *);
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  PLAssetsdResourceService *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  SEL sel[2];
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v41 = 0u;
  *(_OWORD *)sel = 0u;
  v40 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v40) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: consolidateAssets:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v40 + 1);
    *((_QWORD *)&v40 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v41 + 8));
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v6, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceService consolidateAssets:reply:]");
  if (v13)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __52__PLAssetsdResourceService_consolidateAssets_reply___block_invoke;
    v29[3] = &unk_1E3676D00;
    v30 = v6;
    v31 = v13;
    v14 = v11;
    v32 = v14;
    v33 = self;
    v34 = v12;
    v35 = v7;
    objc_msgSend(v31, "performBlock:", v29);
    v15 = v14;

    v16 = v30;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41012, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v28 = (void (**)(_QWORD, void *))v7;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
          objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount") + 1);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      }
      while (v19);
    }

    v7 = v28;
    v28[2](v28, v17);
    v22 = v11;

  }
  if ((_BYTE)v40)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v41 + 8));
  if ((_QWORD)v41)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v41;
    if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v45 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
  return v11;
}

- (void)updateInternalResourcePath:(id)a3 objectURI:(id)a4 sandboxExtension:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  const char *Name;
  _QWORD v32[4];
  char *v33;
  id v34;
  void (**v35)(id, _QWORD, void *);
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  SEL sel[2];
  uint64_t v40;
  const __CFString *v41;
  uint8_t buf[4];
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  v38 = 0u;
  *(_OWORD *)sel = 0u;
  v37 = 0u;
  v14 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v37) = v14;
  if (v14)
  {
    v15 = _os_activity_create(&dword_199541000, "PLXPC Service: updateInternalResourcePath:objectURI:sandboxExtension:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v16 = (void *)*((_QWORD *)&v37 + 1);
    *((_QWORD *)&v37 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v38 + 8));
  }
  v17 = objc_retainAutorelease(v12);
  objc_msgSend(v17, "bytes");
  v18 = sandbox_extension_consume();
  if (v18 == -1)
  {
    v22 = *__error();
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = v23;
    if (v10)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB2AA0]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v22, v20);
    v21 = (char *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v21;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "sandbox_extension_consume failed with error %@", buf, 0xCu);
    }

    v13[2](v13, 0, v21);
  }
  else
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "databaseContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __88__PLAssetsdResourceService_updateInternalResourcePath_objectURI_sandboxExtension_reply___block_invoke;
      v32[3] = &unk_1E366C538;
      v33 = (char *)v11;
      v34 = v10;
      v36 = v18;
      v35 = v13;
      objc_msgSend(v20, "perform:withName:", v32, "-[PLAssetsdResourceService updateInternalResourcePath:objectURI:sandboxExtension:reply:]");

      v21 = v33;
    }
    else
    {
      sandbox_extension_release();
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2D50];
      v41 = CFSTR("No database context");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v26);
      v21 = (char *)objc_claimAutoreleasedReturnValue();

      PLBackendGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v21;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Error updating internal resource: %@", buf, 0xCu);
      }

      v13[2](v13, 0, v21);
      v20 = 0;
    }
  }

  if ((_BYTE)v37)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v38 + 8));
  if ((_QWORD)v38)
  {
    PLRequestGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = v38;
    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v43 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v29, OS_SIGNPOST_INTERVAL_END, v30, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)projectExtensionDataForProjectUuid:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceService projectExtensionDataForProjectUuid:reply:]");
  v9 = v8;
  if (v8)
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__53965;
    v25[4] = __Block_byref_object_dispose__53966;
    v26 = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__53965;
    v23[4] = __Block_byref_object_dispose__53966;
    v24 = 0;
    objc_msgSend(v8, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__PLAssetsdResourceService_projectExtensionDataForProjectUuid_reply___block_invoke;
    v18[3] = &unk_1E3676348;
    v19 = v6;
    v12 = v10;
    v20 = v12;
    v21 = v25;
    v22 = v23;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __69__PLAssetsdResourceService_projectExtensionDataForProjectUuid_reply___block_invoke_2;
    v14[3] = &unk_1E3674CE0;
    v15 = v7;
    v16 = v25;
    v17 = v23;
    objc_msgSend(v9, "performBlock:completionHandler:", v18, v14);

    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41012, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceDownloader, 0);
  objc_storeStrong((id *)&self->_asyncImageDataQueue, 0);
}

void __69__PLAssetsdResourceService_projectExtensionDataForProjectUuid_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLProjectAlbum entityName](PLProjectAlbum, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("uuid"), a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setFetchLimit:", 1);
  v18[0] = CFSTR("projectData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v6);

  objc_msgSend(v4, "setResultType:", 2);
  v7 = (void *)a1[5];
  v17 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v4, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("projectData"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  else
  {
    v15 = *(_QWORD *)(a1[7] + 8);
    v16 = v9;
    v11 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v16;
  }

}

uint64_t __69__PLAssetsdResourceService_projectExtensionDataForProjectUuid_reply___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __88__PLAssetsdResourceService_updateInternalResourcePath_objectURI_sandboxExtension_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PLPrimaryResourceDataStoreReferenceFileKey *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectIDForURIRepresentation:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v3, "existingObjectWithID:error:", v5, &v40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v40;
  if (!v6)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot find internal resource with URI %@"), *(_QWORD *)(a1 + 32));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CB2D68]);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41004, v9);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v8 = objc_msgSend(v6, "dataLength");
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v10 = *MEMORY[0x1E0C99998];
  v38 = 0;
  v11 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v39, v10, &v38);
  v12 = v39;
  v37 = v38;
  if (!v11)
  {
    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v9;
      v43 = 2112;
      v44 = v37;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Get file size for %@ failed with error %@", buf, 0x16u);
    }

    v18 = v37;
    if (v18)
      goto LABEL_19;
    goto LABEL_10;
  }
  if (v8 == objc_msgSend(v12, "longLongValue"))
    goto LABEL_10;
  v35 = (void *)MEMORY[0x1E0CB35C8];
  v13 = *MEMORY[0x1E0D74498];
  v45 = *MEMORY[0x1E0CB2938];
  v46[0] = CFSTR("Reconnect attempt failed because file size does not match");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v14 = v5;
  v15 = v12;
  v16 = v7;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "errorWithDomain:code:userInfo:", v13, 47013, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v16;
  v12 = v15;
  v5 = v14;
  if (!v18)
  {
LABEL_10:
    v34 = v7;
    v36 = v4;
    +[PLFileSystemBookmark fileSystemBookmarkFromURL:context:](PLFileSystemBookmark, "fileSystemBookmarkFromURL:context:", v9, v3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLFileSystemVolume volumeForURL:context:](PLFileSystemVolume, "volumeForURL:context:", v9, v3);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v21 && v22)
    {
      objc_msgSend(v6, "setFileSystemVolume:", v22);
      objc_msgSend(v6, "fileSystemBookmark");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFileSystemBookmark:", v21);
      objc_msgSend(*(id *)(a1 + 40), "stringByDeletingLastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "asset");
      v33 = v12;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDirectory:", v25);

      v27 = -[PLPrimaryResourceDataStoreReferenceFileKey initWithResourceType:]([PLPrimaryResourceDataStoreReferenceFileKey alloc], "initWithResourceType:", objc_msgSend(v6, "resourceType"));
      -[PLPrimaryResourceDataStoreReferenceFileKey keyData](v27, "keyData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDataStoreKeyData:", v28);

      objc_msgSend(v24, "managedObjectContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "deleteObject:", v24);

      v12 = v33;
      v18 = 0;
    }
    else
    {
      v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v24 = v30;
      v31 = *(_QWORD *)(a1 + 40);
      if (v31)
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0CB2AA0]);
      if (v9)
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB3308]);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("Unable to create bookmark and volume"), *MEMORY[0x1E0CB2D68]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41014, v24);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }

    v7 = v34;
    v4 = v36;
  }
LABEL_19:

LABEL_20:
  if (v18)
  {
    PLBackendGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v18;
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Unable to update internal resource. Error: %@", buf, 0xCu);
    }

  }
  else
  {
    MOCSaveAndReturnError(v3);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  sandbox_extension_release();
  (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v18 == 0, v18);

}

void __52__PLAssetsdResourceService_consolidateAssets_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;
  const __CFString *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetsWithUUIDs:options:inLibrary:](PLManagedAsset, "assetsWithUUIDs:options:inLibrary:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (v1)
  {
    v3 = v1;
    v4 = *(_QWORD *)v54;
    v42 = *MEMORY[0x1E0D74498];
    v38 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)&v2 = 138543362;
    v37 = v2;
    v39 = *(_QWORD *)v54;
    do
    {
      v5 = 0;
      v40 = v3;
      do
      {
        if (*(_QWORD *)v54 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x19AEC1554]();
        v45 = v6;
        if ((objc_msgSend(*(id *)(a1 + 48), "isCancelled") & 1) != 0)
        {
          v8 = (void *)MEMORY[0x1E0CB35C8];
          v59 = v38;
          v60 = CFSTR("Consolidate operation cancelled");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "errorWithDomain:code:userInfo:", v42, 41001, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 0;
        }
        else
        {
          v43 = v7;
          v44 = v5;
          objc_msgSend(v6, "modernResources");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v9 = v11;
          v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
          if (v12)
          {
            v13 = v12;
            v10 = 0;
            v46 = 0;
            v14 = *(_QWORD *)v50;
            while (2)
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v50 != v14)
                  objc_enumerationMutation(v9);
                v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                v17 = (void *)MEMORY[0x19AEC1554]();
                objc_msgSend(v16, "fileSystemBookmark");
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                {
                  v19 = *(void **)(a1 + 56);
                  objc_msgSend(v45, "uuid");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v45, "bundleScope");
                  v48 = v10;
                  v22 = objc_msgSend(v19, "_consolidateResource:assetUUID:bundleScope:error:", v16, v20, v21, &v48);
                  v23 = v48;

                  if (!v22)
                  {
                    objc_autoreleasePoolPop(v17);
                    v10 = v23;
                    goto LABEL_23;
                  }
                  if (objc_msgSend(v16, "cplType") == 1)
                  {
                    v24 = v16;

                    v10 = v23;
                    v46 = v24;
                  }
                  else
                  {
                    v10 = v23;
                  }
                }
                objc_autoreleasePoolPop(v17);
              }
              v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
              if (v13)
                continue;
              break;
            }
          }
          else
          {
            v10 = 0;
            v46 = 0;
          }
LABEL_23:

          objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);
          v4 = v39;
          v3 = v40;
          v7 = v43;
          v5 = v44;
        }

        if (v10)
        {
LABEL_32:
          v35 = *(void **)(a1 + 64);
          objc_msgSend(v45, "uuid", v37);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v10, v36);

          goto LABEL_33;
        }
        objc_msgSend(v46, "fileURL");
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = (void *)v25;
          objc_msgSend(*(id *)(a1 + 40), "pathManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "path");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringByDeletingLastPathComponent");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v29, 31, objc_msgSend(v45, "bundleScope"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "lastPathComponent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setDirectory:", v30);
          objc_msgSend(v45, "setFilename:", v31);
          objc_msgSend(v45, "setSavedAssetType:", objc_msgSend(MEMORY[0x1E0D73310], "defaultSavedAssetTypeForConsolidatedAssets"));
          objc_msgSend(v45, "recalculateImageRequestHints");
          objc_msgSend(v45, "persistMetadataToFilesystem");

        }
        else
        {
          PLBackendGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v45, "uuid");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v37;
            v58 = v34;
            _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "No mainFileURL for asset %{public}@", buf, 0xCu);

          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v42, 41004, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            goto LABEL_32;
        }
        objc_msgSend(*(id *)(a1 + 40), "managedObjectContext", v37);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        MOCSaveAndReturnError(v32);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          goto LABEL_32;
LABEL_33:

        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    }
    while (v3);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

void __77__PLAssetsdResourceService__consolidateResource_assetUUID_bundleScope_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PLPrimaryResourceDataStoreUniformFileKey *v17;
  void *v18;
  PLPrimaryResourceDataStoreUniformFileKey *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
    v8 = objc_retainAutorelease(v5);
    if (copyfile(v7, (const char *)objc_msgSend(v8, "fileSystemRepresentation"), 0, 0x1000000u))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "fileSystemBookmark");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "managedObjectContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "deleteObject:", v15);

      objc_msgSend(*(id *)(a1 + 40), "setFileSystemBookmark:", 0);
      objc_msgSend(*(id *)(a1 + 40), "setFileSystemVolume:", 0);
      v17 = [PLPrimaryResourceDataStoreUniformFileKey alloc];
      objc_msgSend(v8, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PLPrimaryResourceDataStoreUniformFileKey initWithFilePath:resourceVersion:resourceType:recipeID:bundleScope:pathManager:](v17, "initWithFilePath:resourceVersion:resourceType:recipeID:bundleScope:pathManager:", v18, objc_msgSend(*(id *)(a1 + 40), "version"), objc_msgSend(*(id *)(a1 + 40), "resourceType"), objc_msgSend(*(id *)(a1 + 40), "recipeID"), *(unsigned __int16 *)(a1 + 72), *(_QWORD *)(a1 + 48));

      -[PLPrimaryResourceDataStoreUniformFileKey keyData](v19, "keyData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setDataStoreKeyData:", v20);

    }
  }
  else
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 56);
      v21 = 138543618;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Error obtaining write URL for internal resource %{public}@ for asset UUID %@", (uint8_t *)&v21, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  }

}

void __75__PLAssetsdResourceService_translatePersistentURL_withAdjustments_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_10;
  +[PLManagedAsset photoFromAssetURL:photoLibrary:](PLManagedAsset, "photoFromAssetURL:photoLibrary:", *(_QWORD *)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPhoto"))
  {
    v9 = 0;
    v5 = +[PLResourceChooser fileReservationForLargeDisplayableImageFileForAsset:format:allowMetadataSnapshot:forceLarge:outFilePath:outImageType:](PLResourceChooser, "fileReservationForLargeDisplayableImageFileForAsset:format:allowMetadataSnapshot:forceLarge:outFilePath:outImageType:", v4, 0, 0, 1, &v9, 0);
    v6 = v9;
  }
  else
  {
    if (!objc_msgSend(v4, "isVideo"))
    {
LABEL_9:

LABEL_10:
      +[PLManagedAsset fileURLFromAssetURL:photoLibrary:](PLManagedAsset, "fileURLFromAssetURL:photoLibrary:", *(_QWORD *)(a1 + 32), v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(v4, "pathForVideoFile");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_10;
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  dispatch_group_t v30;
  int v31;
  uint64_t v32;
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isDeleted") & 1) == 0 && objc_msgSend(v5, "isCloudSharedAsset"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v6 = *(unsigned __int16 *)(a1 + 64);
    v7 = (__int16)v6;
    if (v6 <= 9 && ((1 << v6) & 0x3B8) != 0)
    {
      objc_msgSend(v5, "cloudSharedAssetPathForPlaceholderKind:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_11:
          goto LABEL_12;
        }
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid placeholderKind %d to request cloud shared asset download"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v8 = 0;
    }
    pl_dispatch_once();
    objc_msgSend(v5, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPhotoSharingHelper downloadNotificationForAssetwithUUID:cloudPlaceholderKind:](PLPhotoSharingHelper, "downloadNotificationForAssetwithUUID:cloudPlaceholderKind:", v16, *(__int16 *)(a1 + 64));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__53965;
    v29 = __Block_byref_object_dispose__53966;
    v30 = dispatch_group_create();
    dispatch_group_enter((dispatch_group_t)v26[5]);
    v18 = v26[5];
    v19 = PLResourceModelValidationErrorUserInfoTableEntryIndex_block_invoke_mediaStreamDownloadQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke_3;
    block[3] = &unk_1E3675C58;
    v8 = v8;
    v23 = v8;
    v24 = *(id *)(a1 + 48);
    dispatch_group_notify(v18, v19, block);
    v20 = objc_retainAutorelease(v17);
    objc_msgSend(v20, "UTF8String");
    v21 = v20;
    pl_notify_register_dispatch();
    dispatch_time(0, 300000000000);
    pl_dispatch_after();
    +[PLPhotoSharingHelper downloadAsset:cloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:](PLPhotoSharingHelper, "downloadAsset:cloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:", v5, *(__int16 *)(a1 + 64), *(unsigned __int8 *)(a1 + 66), *(unsigned __int8 *)(a1 + 67));

    _Block_object_dispose(&v25, 8);
    goto LABEL_11;
  }
LABEL_12:

}

void __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  id v5;

  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(a1 + 32)),
        v2,
        v3))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *(_QWORD *)(a1 + 32), 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke_4(_QWORD *a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "%@: Notified from assetsd for shared asset download notification %@", (uint8_t *)&v11, 0x16u);
  }

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(NSObject **)(v7 + 40);
  if (v8)
  {
    dispatch_group_leave(v8);
    v7 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v7 + 40);
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)(v7 + 40) = 0;

  return notify_cancel(a2);
}

uint64_t __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke_84(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(NSObject **)(v2 + 40);
  if (v3)
  {
    dispatch_group_leave(v3);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v2 + 40);
  }
  else
  {
    v4 = 0;
  }
  *(_QWORD *)(v2 + 40) = 0;

  return notify_cancel(*(_DWORD *)(a1 + 40));
}

void __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.assetsd.mediastreamdownloadqueue", 0);
  v1 = (void *)PLResourceModelValidationErrorUserInfoTableEntryIndex_block_invoke_mediaStreamDownloadQueue;
  PLResourceModelValidationErrorUserInfoTableEntryIndex_block_invoke_mediaStreamDownloadQueue = (uint64_t)v0;

}

void __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  char v25;

  v3 = a2;
  v4 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "managedObjectIDForURIRepresentation:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudPhotoLibraryManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (*(_BYTE *)(a1 + 56) && v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "libraryServicesManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "isCloudPhotoLibraryEnabled");

  }
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", v7, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_2;
  v19[3] = &unk_1E366C400;
  v14 = *(id *)(a1 + 48);
  v20 = v13;
  v21 = v9;
  v15 = *(_QWORD *)(a1 + 40);
  v22 = v12;
  v23 = v15;
  v24 = v14;
  v25 = v10;
  v16 = v12;
  v17 = v9;
  v18 = v13;
  objc_msgSend(v16, "synchronouslyFetchAdjustmentDataWithCompletionHandler:", v19);

  objc_autoreleasePoolPop(v4);
}

void __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7, void *a8, void *a9)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void (**v23)(_QWORD);
  id v24;
  int v25;
  id v26;
  xpc_object_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  dispatch_semaphore_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  dispatch_time_t v40;
  intptr_t v41;
  NSObject *v42;
  uint64_t v43;
  const char *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  int v53;
  id v54;
  xpc_object_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  id v65;
  int v66;
  id v67;
  xpc_object_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *context;
  void *contexta;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  void (**v82)(_QWORD);
  _QWORD *v83;
  uint64_t *v84;
  _QWORD v85[4];
  void (**v86)(_QWORD);
  _QWORD *v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  id v92;
  NSObject *v93;
  _QWORD *v94;
  _QWORD *v95;
  _QWORD *v96;
  uint64_t *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  char v103;
  _QWORD v104[4];
  id v105;
  _QWORD *v106;
  _QWORD *v107;
  _QWORD *v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t *v111;
  _QWORD *v112;
  uint64_t v113;
  _QWORD v114[5];
  id v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  id v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t (*v125)(uint64_t, uint64_t);
  void (*v126)(uint64_t);
  id v127;
  _QWORD v128[5];
  id v129;
  _QWORD v130[5];
  id v131;
  _QWORD v132[5];
  id v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  char v137;
  uint8_t buf[4];
  uint64_t v139;
  __int16 v140;
  const __CFString *v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v78 = a6;
  v76 = a8;
  v77 = a9;
  v134 = 0;
  v135 = &v134;
  v136 = 0x2020000000;
  v137 = 0;
  v132[0] = 0;
  v132[1] = v132;
  v132[2] = 0x3032000000;
  v132[3] = __Block_byref_object_copy__53965;
  v132[4] = __Block_byref_object_dispose__53966;
  v18 = v15;
  v133 = v18;
  v130[0] = 0;
  v130[1] = v130;
  v130[2] = 0x3032000000;
  v130[3] = __Block_byref_object_copy__53965;
  v130[4] = __Block_byref_object_dispose__53966;
  v79 = v16;
  v131 = v79;
  v128[0] = 0;
  v128[1] = v128;
  v128[2] = 0x3032000000;
  v128[3] = __Block_byref_object_copy__53965;
  v128[4] = __Block_byref_object_dispose__53966;
  v129 = v17;
  v122 = 0;
  v123 = &v122;
  v124 = 0x3032000000;
  v125 = __Block_byref_object_copy__53965;
  v126 = __Block_byref_object_dispose__53966;
  v127 = 0;
  v116 = 0;
  v117 = &v116;
  v118 = 0x3032000000;
  v119 = __Block_byref_object_copy__53965;
  v120 = __Block_byref_object_dispose__53966;
  v121 = 0;
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x3032000000;
  v114[3] = __Block_byref_object_copy__53965;
  v114[4] = __Block_byref_object_dispose__53966;
  v19 = v129;
  v115 = 0;
  v104[0] = MEMORY[0x1E0C809B0];
  v104[1] = 3221225472;
  v104[2] = __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_3;
  v104[3] = &unk_1E366C320;
  v105 = *(id *)(a1 + 64);
  v106 = v132;
  v107 = v130;
  v108 = v128;
  v20 = a5;
  v112 = v114;
  v113 = a5;
  v109 = &v134;
  v110 = &v122;
  v111 = &v116;
  v21 = v18;
  v22 = a1;
  v23 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v104);
  v100 = 0;
  v101 = &v100;
  v102 = 0x2020000000;
  v103 = 0;
  if (objc_msgSend(v78, "length"))
  {
    v24 = objc_retainAutorelease(v78);
    v25 = open((const char *)objc_msgSend(v24, "fileSystemRepresentation"), 0);
    if ((v25 & 0x80000000) == 0)
    {
      v26 = objc_alloc(MEMORY[0x1E0D73328]);
      v27 = xpc_fd_create(v25);
      v28 = objc_msgSend(v26, "initWithXPCObject:", v27);
      v29 = (void *)v123[5];
      v123[5] = v28;

      close(v25);
      *((_BYTE *)v101 + 24) = 1;
      goto LABEL_38;
    }
    context = (void *)MEMORY[0x19AEC1554]();
    PLGatekeeperXPCGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = *(_QWORD *)(v22 + 32);
      *(_DWORD *)buf = 138543362;
      v139 = v31;
      _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "Couldn't open adjustment file for asset %{public}@", buf, 0xCu);
    }

    if (!*(_QWORD *)(v22 + 40)
      || (objc_msgSend(*(id *)(v22 + 48), "photoLibrary"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v33 = objc_msgSend(v32, "isCloudPhotoLibraryEnabled"),
          v32,
          !v33))
    {
LABEL_21:
      if (!*((_BYTE *)v101 + 24))
      {
        if (objc_msgSend(*(id *)(v22 + 48), "isVideo"))
        {
          if ((objc_msgSend(*(id *)(v22 + 48), "migrateLegacyVideoAdjustments") & 1) == 0)
          {
            PLGatekeeperXPCGetLog();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              v50 = *(_QWORD *)(v22 + 32);
              *(_DWORD *)buf = 138543618;
              v139 = v50;
              v140 = 2112;
              v141 = CFSTR("NO");
              _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_DEFAULT, "Set default adjustments for asset %{public}@: %@", buf, 0x16u);
            }

            if (!objc_msgSend(*(id *)(v22 + 48), "setDefaultAdjustmentsIfNecessaryWithMainFileMetadata:", 0))goto LABEL_37;
          }
          PLGatekeeperXPCGetLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v52 = *(_QWORD *)(v22 + 32);
            *(_DWORD *)buf = 138543362;
            v139 = v52;
            _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_DEFAULT, "Recovered adjustment for %{public}@", buf, 0xCu);
          }

          v53 = open((const char *)objc_msgSend(objc_retainAutorelease(v24), "fileSystemRepresentation"), 0);
          if ((v53 & 0x80000000) == 0)
          {
            v54 = objc_alloc(MEMORY[0x1E0D73328]);
            v55 = xpc_fd_create(v53);
            v56 = objc_msgSend(v54, "initWithXPCObject:", v55);
            v57 = (void *)v123[5];
            v123[5] = v56;

            close(v53);
            *((_BYTE *)v101 + 24) = 1;
            goto LABEL_37;
          }
          PLGatekeeperXPCGetLog();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_ERROR, "Couldn't open adjustment file from recovered adjustment", buf, 2u);
          }
        }
        else
        {
          PLGatekeeperXPCGetLog();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            v59 = *(_QWORD *)(v22 + 32);
            *(_DWORD *)buf = 138543362;
            v139 = v59;
            _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_ERROR, "Unsupported asset %{public}@ to recover adjustment", buf, 0xCu);
          }
        }

      }
LABEL_37:
      objc_autoreleasePoolPop(context);
      goto LABEL_38;
    }
    PLGatekeeperXPCGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = *(_QWORD *)(v22 + 32);
      *(_DWORD *)buf = 138543362;
      v139 = v35;
      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_DEFAULT, "Trying to recover adjustment from CPL for for asset %{public}@", buf, 0xCu);
    }

    v36 = dispatch_semaphore_create(0);
    v38 = *(void **)(v22 + 40);
    v37 = *(_QWORD *)(v22 + 48);
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_67;
    v88[3] = &unk_1E366C348;
    v89 = v21;
    v94 = v132;
    v90 = v79;
    v95 = v130;
    v91 = v19;
    v96 = v128;
    v99 = v20;
    v92 = v24;
    v97 = &v122;
    v98 = &v100;
    v39 = v36;
    v93 = v39;
    objc_msgSend(v38, "fetchAdjustmentDataForAsset:completionHandler:", v37, v88);
    v40 = dispatch_time(0, 10000000000);
    v41 = dispatch_semaphore_wait(v39, v40);
    if (*((_BYTE *)v101 + 24))
    {
      PLGatekeeperXPCGetLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = *(_QWORD *)(v22 + 32);
        *(_DWORD *)buf = 138543362;
        v139 = v43;
        v44 = "Recovered adjustment from CPL for for asset %{public}@";
        v45 = v42;
        v46 = OS_LOG_TYPE_DEFAULT;
LABEL_19:
        _os_log_impl(&dword_199541000, v45, v46, v44, buf, 0xCu);
      }
LABEL_20:

      goto LABEL_21;
    }
    if (v41)
    {
      PLGatekeeperXPCGetLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v47 = *(_QWORD *)(v22 + 32);
      *(_DWORD *)buf = 138543362;
      v139 = v47;
      v44 = "Timed out waiting for CPL to recover adjustment data for asset %{public}@";
    }
    else
    {
      PLGatekeeperXPCGetLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v48 = *(_QWORD *)(v22 + 32);
      *(_DWORD *)buf = 138543362;
      v139 = v48;
      v44 = "Couldn't open adjustment file fetched from CPL for asset %{public}@";
    }
    v45 = v42;
    v46 = OS_LOG_TYPE_ERROR;
    goto LABEL_19;
  }
LABEL_38:
  if (objc_msgSend(v78, "length"))
  {
    objc_msgSend(*(id *)(v22 + 48), "assetResourceForCPLType:", 13);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v60
      || (objc_msgSend(*(id *)(v22 + 56), "libraryServicesManager"),
          v61 = (void *)objc_claimAutoreleasedReturnValue(),
          v62 = objc_msgSend(v61, "isCloudPhotoLibraryEnabled"),
          v61,
          !v62))
    {
      v23[2](v23);
LABEL_51:

      goto LABEL_52;
    }
    *((_BYTE *)v135 + 24) = 1;
    objc_msgSend(*(id *)(v22 + 48), "pathForAdjustmentDataFile");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v63)
    {
      v65 = objc_retainAutorelease(v63);
      v66 = open((const char *)objc_msgSend(v65, "fileSystemRepresentation"), 0);
      if (v66 < 0)
      {
        if (*(_BYTE *)(v22 + 72))
        {
          v73 = *(void **)(v22 + 40);
          contexta = *(void **)(v22 + 48);
          v71 = MEMORY[0x1E0C809B0];
          v85[0] = MEMORY[0x1E0C809B0];
          v85[1] = 3221225472;
          v85[2] = __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_70;
          v85[3] = &unk_1E366C370;
          v87 = v114;
          v86 = v23;
          v80[0] = v71;
          v80[1] = 3221225472;
          v80[2] = __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_3_74;
          v80[3] = &unk_1E366C3D8;
          v83 = v114;
          v81 = v65;
          v84 = &v116;
          v82 = v86;
          objc_msgSend(v73, "downloadAsset:resourceType:masterResourceOnly:highPriority:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:", contexta, 13, 0, 1, 0, 0, v85, &__block_literal_global_54053, v80);

          goto LABEL_50;
        }
        v72 = (void *)v123[5];
        v123[5] = 0;

      }
      else
      {
        v67 = objc_alloc(MEMORY[0x1E0D73328]);
        v68 = xpc_fd_create(v66);
        v69 = objc_msgSend(v67, "initWithXPCObject:", v68);
        v70 = (void *)v117[5];
        v117[5] = v69;

        close(v66);
      }
    }
    v23[2](v23);
LABEL_50:

    goto LABEL_51;
  }
  v23[2](v23);
LABEL_52:
  _Block_object_dispose(&v100, 8);

  _Block_object_dispose(v114, 8);
  _Block_object_dispose(&v116, 8);

  _Block_object_dispose(&v122, 8);
  _Block_object_dispose(v128, 8);

  _Block_object_dispose(v130, 8);
  _Block_object_dispose(v132, 8);

  _Block_object_dispose(&v134, 8);
}

uint64_t __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[12], *(unsigned __int8 *)(*(_QWORD *)(a1[8] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 40));
}

void __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  id v19;
  xpc_object_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id obj;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v26 = a3;
  PLGatekeeperXPCGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5 || v26)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v26;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Couldn't fetch adjustment from CPL: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "adjustmentSimpleDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Recovered adjustments %@ from CPL.", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adjustmentType");
    obj = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:") & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), obj);
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", obj, *MEMORY[0x1E0D73380]);
    objc_msgSend(v5, "adjustmentCompoundVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v9) & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v9);
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v9, *MEMORY[0x1E0D73388]);
    objc_msgSend(v5, "adjustmentCreatorCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 48)) & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v10);
    if (v10)
      -[NSObject setObject:forKey:](v7, "setObject:forKey:", v10, *MEMORY[0x1E0D73378]);
    objc_msgSend(v5, "adjustmentTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[NSObject setObject:forKey:](v7, "setObject:forKey:", v11, *MEMORY[0x1E0D73398]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 112));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v12, *MEMORY[0x1E0D73368]);

    objc_msgSend(v5, "simpleAdjustmentData");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
      -[NSObject setObject:forKey:](v7, "setObject:forKey:", v13, *MEMORY[0x1E0D73370]);
    v24 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 100, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "stringByDeletingLastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, 0);

    if (v14)
      objc_msgSend(v14, "writeToFile:options:error:", *(_QWORD *)(a1 + 56), 1073741825, 0);
    v17 = open((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "fileSystemRepresentation"), 0);
    if ((v17 & 0x80000000) == 0)
    {
      v18 = v17;
      v19 = objc_alloc(MEMORY[0x1E0D73328]);
      v20 = xpc_fd_create(v18);
      v21 = objc_msgSend(v19, "initWithXPCObject:", v20);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      close(v18);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));

}

void __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_70(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v6 = a4;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = v7;
  }

}

void __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_3_74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  int v7;
  int v8;
  id v9;
  xpc_object_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a5;
  if (v14)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a5);
  }
  else
  {
    v7 = open((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation"), 0);
    if ((v7 & 0x80000000) == 0)
    {
      v8 = v7;
      v9 = objc_alloc(MEMORY[0x1E0D73328]);
      v10 = xpc_fd_create(v8);
      v11 = objc_msgSend(v9, "initWithXPCObject:", v10);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      close(v8);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __75__PLAssetsdResourceService_getSandboxExtensionForFileSystemBookmark_reply___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "managedObjectIDForURIRepresentation:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectWithID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "fileSystemURL");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D74498];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("objectID is null for FileSystemBookmark objectURI %@"), a1[4], *MEMORY[0x1E0CB2D50]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 41014, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1[6] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
}

void __71__PLAssetsdResourceService_getSandboxExtensionsForAssetWithUUID_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id obj;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 80))
  {
    v5 = 0;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLLimitedLibraryFetchFilter fetchLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:](PLLimitedLibraryFetchFilter, "fetchLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:", v6, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*(_BYTE *)(a1 + 80) && !objc_msgSend(v5, "containsAssetWithUUID:", *(_QWORD *)(a1 + 40)))
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0D74498];
      v36 = *MEMORY[0x1E0CB2D50];
      v37 = CFSTR("Invalid asset uuid for client");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 41008, v8);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(id *)(v30 + 40);
      *(_QWORD *)(v30 + 40) = v29;
      goto LABEL_18;
    }
  }
  +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", *(_QWORD *)(a1 + 40), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "_allowSandboxExtensionForAsset:", v8))
  {
    objc_msgSend(v8, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v11 + 40);
    +[PLManagedAsset fetchResourcesForAssetWithObjectID:inContext:versions:includeVirtualResources:allowDerivatives:excludeDynamicCPLResources:additionalPredicate:relationshipKeyPathsForPrefetching:error:](PLManagedAsset, "fetchResourcesForAssetWithObjectID:inContext:versions:includeVirtualResources:allowDerivatives:excludeDynamicCPLResources:additionalPredicate:relationshipKeyPathsForPrefetching:error:", v9, v10, 0, 1, 1, 0, 0, 0, &obj);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v11 + 40), obj);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((int)objc_msgSend(v18, "localAvailability") >= 1)
          {
            objc_msgSend(v18, "fileURL");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
              objc_msgSend(v18, "fileURL");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addObject:", v21);

            }
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v15);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0D74498];
    v38 = *MEMORY[0x1E0CB2D50];
    v39 = CFSTR("Invalid asset uuid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 41008, v13);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

  }
LABEL_18:

}

void __141__PLAssetsdResourceService_imageDataForAssetWithObjectURI_formatID_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  char v33;
  __int16 v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  BOOL v44;
  char v45;
  void *v46;
  char v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD *v55;
  NSObject *v56;
  id v57;
  _QWORD *v58;
  id v59;
  void *v60;
  unint64_t v61;
  __int16 v62;
  id v63;
  id v64;
  int v65;
  int v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  uint64_t v71;
  id v72;
  id v73;
  unint64_t v74;
  __int16 v75;
  char v76;
  char v77;
  char v78;
  __int16 v79;
  id v80;
  id v81;
  uint64_t v82;
  os_activity_scope_state_s state;
  _BYTE buf[24];
  void *v85;
  __int128 v86;
  id v87;
  uint64_t v88;
  __int16 v89;
  char v90;
  char v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v63 = a2;
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v3, "isCloudSharedAsset");
  v62 = *(_WORD *)(a1 + 64);
  if (objc_msgSend(v3, "isVideo") && objc_msgSend(v3, "isCloudSharedAsset"))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v3, "pathForOriginalFile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_typeFromPathConstrainedToImageOrMovie:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC568]))
    {
      objc_msgSend(v3, "originalAsset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        PLImageManagerGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v3, "uuid");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "originalAsset");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v9;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v11;
          _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "A cloud shared video (uuid: %@) does not have an image file, redirecting to original asset (uuid: %@)", buf, 0x16u);

        }
        objc_msgSend(v3, "originalAsset");
        v12 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v12;
      }
    }

  }
  v82 = 0;
  if (((objc_msgSend(v63, "isCloudPhotoLibraryEnabled") ^ 1 | v66) & 1) != 0)
  {
    v13 = 0;
    v14 = 0;
    LOBYTE(v65) = 0;
    goto LABEL_30;
  }
  v15 = *(_QWORD *)(a1 + 48);
  v81 = 0;
  v14 = +[PLResourceChooser cloudResourceTypeForAsset:format:filePath:imageType:](PLResourceChooser, "cloudResourceTypeForAsset:format:filePath:imageType:", v3, v15, &v81, &v82);
  v16 = v81;
  v13 = v16;
  if (!v14)
  {
    PLImageManagerGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Cloud photos is enabled, but unable to find a cloud resource type for asset (uuid: %@) format %@", buf, 0x16u);

    }
    goto LABEL_18;
  }
  v17 = v14;
  if (v14 == 5 && !v16)
  {
    if (!objc_msgSend(v3, "hasMasterThumb"))
    {
      v13 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v63, "thumbnailManager");
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject thumbnailJPEGPathForPhoto:](v18, "thumbnailJPEGPathForPhoto:", v3);
    v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_20:
    v17 = v14;
  }
  if (v17)
    v21 = v13 == 0;
  else
    v21 = 0;
  v22 = v21;
  v65 = v22;
  PLImageManagerGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 48), "shortDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudPhotoLibraryManager descriptionForResourceType:](PLCloudPhotoLibraryManager, "descriptionForResourceType:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v65 ^ 1u);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2112;
    v85 = v26;
    LOWORD(v86) = 2112;
    *(_QWORD *)((char *)&v86 + 2) = v27;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "Async image data for format: %@, asset: %@ Found cloud resource type: %@, is locally available: %@", buf, 0x2Au);

  }
LABEL_30:
  v28 = v66;
  if (v13)
    v28 = 0;
  v61 = v14;
  if (v28 == 1)
  {
    if (!*(_BYTE *)(a1 + 66))
    {
      if (objc_msgSend(v3, "isVideo"))
        v29 = 7;
      else
        v29 = 4;
      objc_msgSend(v3, "cloudSharedAssetPathForPlaceholderKind:", v29);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
        goto LABEL_45;
      goto LABEL_36;
    }
    v13 = 0;
  }
  if (v13)
    goto LABEL_45;
LABEL_36:
  if (!v14)
  {
    if (*(_BYTE *)(a1 + 66))
    {
      v13 = 0;
    }
    else
    {
      v30 = *(_QWORD *)(a1 + 48);
      v80 = 0;
      v31 = +[PLResourceChooser fileReservationForImageFileForAsset:format:outFilePath:outImageType:](PLResourceChooser, "fileReservationForImageFileForAsset:format:outFilePath:outImageType:", v3, v30, &v80, &v82);
      v13 = v80;
    }
  }
LABEL_45:
  v32 = v82;
  if (v82 == 1)
  {
    if (objc_msgSend(v3, "isVideo") && (objc_msgSend(v3, "isCloudSharedAsset") & 1) == 0)
    {
      PLImageManagerGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "uuid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v38;
        _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "Resource chooser selected original resource for a video, which is invalid, for asset (uuid: %@)", buf, 0xCu);

      }
      v13 = 0;
      v82 = 0;
LABEL_65:
      v35 = 1;
      if (!v13)
        goto LABEL_58;
      goto LABEL_66;
    }
    v32 = v82;
    if (v82 == 1)
    {
      v33 = objc_msgSend(*(id *)(a1 + 48), "refersToLatestVersion");
      v32 = v82;
      if ((v33 & 1) != 0)
      {
        v62 = 9999;
        goto LABEL_56;
      }
    }
  }
  switch(v32)
  {
    case 7:
      v34 = 9988;
LABEL_61:
      v62 = v34;
      goto LABEL_65;
    case 9:
      v34 = 3039;
      goto LABEL_61;
    case 8:
      if (*(_WORD *)(a1 + 64) != 9998)
        goto LABEL_65;
      v34 = 4007;
      goto LABEL_61;
  }
LABEL_56:
  if (v32 != 1)
    goto LABEL_65;
  objc_msgSend(v3, "originalImageOrientation");
  v35 = (int)PLExifOrientationFromImageOrientation();
  if (!v13)
  {
LABEL_58:
    v36 = 0;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_67:
  v39 = *(void **)(a1 + 40);
  objc_msgSend(v36, "path");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "_typeFromPathConstrainedToImageOrMovie:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0;
  if (*(_BYTE *)(a1 + 67))
    v44 = 1;
  else
    v44 = v82 == 0;
  if (v44)
    v45 = v65;
  else
    v45 = 0;
  if (!v36 && (v45 & 1) == 0)
    v43 = +[PLImageLoadingUtilities newSynchronousImageForAsset:withFormat:allowPlaceholder:outImageProperties:outDeliveredPlaceholder:](PLImageLoadingUtilities, "newSynchronousImageForAsset:withFormat:allowPlaceholder:outImageProperties:outDeliveredPlaceholder:", v3, *(unsigned __int16 *)(a1 + 64), *(unsigned __int8 *)(a1 + 67) != 0, 0, 0);
  v60 = v13;
  v46 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v47 = *(_BYTE *)(a1 + 68);
  v48 = MEMORY[0x1E0C809B0];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __141__PLAssetsdResourceService_imageDataForAssetWithObjectURI_formatID_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_reply___block_invoke_44;
  v68[3] = &unk_1E366C280;
  v76 = v66;
  v77 = v47;
  v64 = v63;
  v69 = v64;
  v49 = v3;
  v78 = v65;
  v79 = *(_WORD *)(a1 + 69);
  v75 = *(_WORD *)(a1 + 64);
  v50 = *(_QWORD *)(a1 + 40);
  v67 = v49;
  v70 = v49;
  v71 = v50;
  v74 = v61;
  v73 = *(id *)(a1 + 56);
  v51 = v42;
  v72 = v51;
  v52 = v46;
  v53 = v36;
  v54 = v43;
  v55 = v68;
  v56 = _os_activity_create(&dword_199541000, "asyncImageDataFromAsset", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v56, &state);
  *(_QWORD *)buf = v48;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __asyncImageDataFromAsset_block_invoke;
  v85 = &unk_1E366D228;
  v57 = v53;
  *(_QWORD *)&v86 = v57;
  v58 = v55;
  v89 = v62;
  v87 = v58;
  v88 = v35;
  v90 = v47;
  v91 = v45;
  v59 = v54;
  *((_QWORD *)&v86 + 1) = v59;
  pl_dispatch_async();

  os_activity_scope_leave(&state);
}

void __141__PLAssetsdResourceService_imageDataForAssetWithObjectURI_formatID_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_reply___block_invoke_44(uint64_t a1, void *a2, void *a3, void *a4, unsigned int a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v11, "isFileURL"))
  {
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PLGetSandboxExtensionToken();
    v13 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  if (*(_BYTE *)(a1 + 82) && (v9 || v11 && *(_BYTE *)(a1 + 83)))
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __141__PLAssetsdResourceService_imageDataForAssetWithObjectURI_formatID_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_reply___block_invoke_2;
    v29[3] = &unk_1E3677AA0;
    v14 = *(void **)(a1 + 32);
    v30 = *(id *)(a1 + 40);
    objc_msgSend(v14, "performBlock:", v29);

  }
  v27 = (void *)v13;
  if (*(_BYTE *)(a1 + 84) && *(_BYTE *)(a1 + 85))
  {
    v15 = v10;
    v16 = *(unsigned __int16 *)(a1 + 80) - 9999 < 2;
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(void **)(*(_QWORD *)(a1 + 48) + 32);
    v19 = *(_QWORD *)(a1 + 72);
    v20 = *(unsigned __int8 *)(a1 + 86);
    v28 = 0;
    LOBYTE(v26) = 0;
    objc_msgSend(v18, "startCPLDownloadForAsset:resourceType:masterResourceOnly:highPriority:track:notify:transient:proposedTaskIdentifier:doneToken:error:", v17, v19, v16, 1, v20, v20, v26, 0, 0, &v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v28;
    if (*(_BYTE *)(a1 + 86))
    {
      v23 = v21;
      +[PLCloudPhotoLibraryManager descriptionForResourceType:](PLCloudPhotoLibraryManager, "descriptionForResourceType:", *(_QWORD *)(a1 + 72));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
      v24 = 0;
    }

    if (!v9)
      goto LABEL_18;
  }
  else
  {
    v15 = v10;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    if (!v9)
    {
LABEL_18:
      v25 = 0;
      goto LABEL_19;
    }
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73330]), "initWithXPCObject:", v9);
LABEL_19:
  (*(void (**)(_QWORD, void *, void *, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v25, v15, a5);

}

uint64_t __141__PLAssetsdResourceService_imageDataForAssetWithObjectURI_formatID_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_reply___block_invoke_2(uint64_t a1)
{
  return +[PLManagedAsset markAssetAsRecentlyUsed:](PLManagedAsset, "markAssetAsRecentlyUsed:", *(_QWORD *)(a1 + 32));
}

void __81__PLAssetsdResourceService_fileDescriptorForPersistentURL_withAdjustments_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  int v6;
  id v7;
  xpc_object_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D74498];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("Couldn't translate asset URL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 41003, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    PLGatekeeperXPCGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v11;
LABEL_8:
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
    }
LABEL_9:

    v10 = 0;
    v9 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = open((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0);

  if (v6 < 0)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D74498];
    v24 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't open file at url: %@"), v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 41006, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    PLGatekeeperXPCGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v7 = objc_alloc(MEMORY[0x1E0D73328]);
  v8 = xpc_fd_create(v6);
  v9 = (void *)objc_msgSend(v7, "initWithXPCObject:", v8);

  close(v6);
  objc_msgSend(v4, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __86__PLAssetsdResourceService_sandboxExtensionURLForPersistentURL_withAdjustments_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;

  v3 = a2;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "connectionAuthorization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "clientAuditToken");
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }
  PLGetSandboxExtensionTokenForProcess();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLSandboxExtensionTokenAsData();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    (*(void (**)(_QWORD, uint64_t, id, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, v3, v8);
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Sandbox extension create failed"), *MEMORY[0x1E0CB2938]);
    if (v3)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB3308]);
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41028, v9, v12, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, 0, v11);

  }
}

uint64_t __75__PLAssetsdResourceService_filePathForPersistentURL_withAdjustments_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__PLAssetsdResourceService_addAssetWithURL_toAlbum_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "albumWithUuid:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "photoFromAssetURL:", *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D74498];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = CFSTR("Error fetching album or asset");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 41008, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    objc_msgSend(v2, "mutableAssets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v4);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

uint64_t __58__PLAssetsdResourceService_addAssetWithURL_toAlbum_reply___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __56__PLAssetsdResourceService_addAssetGroupWithName_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[PLGenericAlbum albumWithName:inLibrary:](PLGenericAlbum, "albumWithName:inLibrary:", a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    +[PLGenericAlbum insertNewAlbumWithTitle:intoLibrary:](PLGenericAlbum, "insertNewAlbumWithTitle:intoLibrary:", a1[4], a1[5]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __56__PLAssetsdResourceService_addAssetGroupWithName_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v2 + 40) && (objc_msgSend(*(id *)(v2 + 40), "isInserted") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "groupURL");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
