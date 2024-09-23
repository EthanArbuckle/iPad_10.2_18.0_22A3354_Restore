@implementation PLAssetsdLibraryInternalService

- (PLAssetsdLibraryInternalService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4
{
  id v7;
  PLAssetsdLibraryInternalService *v8;
  PLAssetsdLibraryInternalService *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetsdLibraryInternalService;
  v8 = -[PLAbstractLibraryServicesManagerService initWithLibraryServicesManager:](&v11, sel_initWithLibraryServicesManager_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_connectionAuthorization, a4);

  return v9;
}

- (void)getAssetCountsWithReply:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  const char *Name;
  _QWORD v15[4];
  id v16;
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
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: getAssetCountsWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v18 + 1);
    *((_QWORD *)&v18 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  v8 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService getAssetCountsWithReply:]");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__PLAssetsdLibraryInternalService_getAssetCountsWithReply___block_invoke;
  v15[3] = &unk_1E3675C58;
  v9 = v8;
  v16 = v9;
  v10 = v4;
  v17 = v10;
  objc_msgSend(v9, "performBlock:", v15);

  if ((_BYTE)v18)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  if ((_QWORD)v19)
  {
    PLRequestGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getLibrarySizesFromDB:(BOOL)a3 reply:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  const char *Name;
  _QWORD v18[4];
  id v19;
  __int128 *v20;
  BOOL v21;
  _QWORD v22[4];
  id v23;
  __int128 *p_buf;
  BOOL v25;
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v26) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199541000, "PLXPC Service: getLibrarySizesFromDB:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  v10 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService getLibrarySizesFromDB:reply:]");
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__65391;
  v32 = __Block_byref_object_dispose__65392;
  v33 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __63__PLAssetsdLibraryInternalService_getLibrarySizesFromDB_reply___block_invoke;
  v22[3] = &unk_1E3671990;
  v25 = a3;
  p_buf = &buf;
  v12 = v10;
  v23 = v12;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __63__PLAssetsdLibraryInternalService_getLibrarySizesFromDB_reply___block_invoke_2;
  v18[3] = &unk_1E366F540;
  v20 = &buf;
  v21 = a3;
  v13 = v6;
  v19 = v13;
  objc_msgSend(v12, "performBlock:completionHandler:", v22, v18);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)getSizeOfResourcesToUploadByCPLWithReply:(id)a3
{
  void (**v4)(id, BOOL, uint64_t, id);
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *Name;
  id v16;
  __int128 v17;
  __int128 v18;
  SEL sel[2];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, BOOL, uint64_t, id))a3;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v17) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: getSizeOfResourcesToUploadByCPLWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v17 + 1);
    *((_QWORD *)&v17 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudPhotoLibraryManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v10 = objc_msgSend(v9, "sizeOfResourcesToUploadByCPL:", &v16);
  v11 = v16;
  v4[2](v4, v11 == 0, v10, v11);

  if ((_BYTE)v17)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  if ((_QWORD)v18)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v18;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)updateAssetLocationDataWithUUID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  const char *Name;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  SEL sel[2];
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v22 = 0u;
  *(_OWORD *)sel = 0u;
  v21 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v21) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: updateAssetLocationDataWithUUID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v21 + 1);
    *((_QWORD *)&v21 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService updateAssetLocationDataWithUUID:reply:]");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__PLAssetsdLibraryInternalService_updateAssetLocationDataWithUUID_reply___block_invoke;
  v18[3] = &unk_1E3677C18;
  v12 = v6;
  v19 = v12;
  v13 = v11;
  v20 = v13;
  objc_msgSend(v13, "performBlockAndWait:", v18);
  v7[2](v7, 0);

  if ((_BYTE)v21)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  if ((_QWORD)v22)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v25 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)repairMemoriesWithUUIDs:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  SEL sel[2];
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26 = 0u;
  *(_OWORD *)sel = 0u;
  v25 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v25) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: repairMemoriesWithUUIDs:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v25 + 1);
    *((_QWORD *)&v25 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService repairMemoriesWithUUIDs:reply:]");

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__PLAssetsdLibraryInternalService_repairMemoriesWithUUIDs_reply___block_invoke;
  v21[3] = &unk_1E3676290;
  v14 = v6;
  v22 = v14;
  v15 = v13;
  v23 = v15;
  v16 = v7;
  v24 = v16;
  objc_msgSend(v15, "performTransaction:", v21);

  if ((_BYTE)v25)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  if ((_QWORD)v26)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)reloadMomentGenerationOptions
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
    *((_QWORD *)&v9 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: reloadMomentGenerationOptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentGenerationDataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadGenerationOptions");

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

- (void)markPersonAsNeedingKeyFaceWithPersonUUID:(id)a3 reply:(id)a4
{
  char *v6;
  void (**v7)(id, uint64_t, _QWORD);
  int v8;
  NSObject *v9;
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
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v17) = v8;
  if (v8)
  {
    *((_QWORD *)&v17 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: markPersonAsNeedingKeyFaceWithPersonUUID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  PLGatekeeperXPCGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Marking person with UUID as needing key face: %@", buf, 0xCu);
  }

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService markPersonAsNeedingKeyFaceWithPersonUUID:reply:]");

  +[PLKeyFaceManager sharedInstance](PLKeyFaceManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "markPersonAsNeedingKeyFace:photoLibrary:", v6, v12);

  v7[2](v7, 1, 0);
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
      v21 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getSearchIndexProgressWithReply:(id)a3
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
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *Name;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v26) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: getSearchIndexProgressWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v27 + 8));
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
      v12 = (void *)objc_msgSend(v11, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService getSearchIndexProgressWithReply:]");

      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "searchIndexingEngine");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __67__PLAssetsdLibraryInternalService_getSearchIndexProgressWithReply___block_invoke;
      v24[3] = &unk_1E366F568;
      v25 = v4;
      objc_msgSend(v14, "fetchRemainingWorkWithLibrary:completion:", v12, v24);

    }
    else
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "searchIndexManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __67__PLAssetsdLibraryInternalService_getSearchIndexProgressWithReply___block_invoke_2;
      v22[3] = &unk_1E366F568;
      v23 = v4;
      objc_msgSend(v17, "enqueuedUUIDsCountWithCompletionHandler:", v22);

      v12 = v23;
    }

  }
  else
  {
    PLGatekeeperXPCGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[PLAssetsdLibraryInternalService getSearchIndexProgressWithReply:]";
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD, double))v4 + 2))(v4, 0, 0, 0.0);
  }
  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v30 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)waitForSearchIndexExistenceWithReply:(id)a3
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
  NSObject *v13;
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
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v26) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: waitForSearchIndexExistenceWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v26 + 1);
    *((_QWORD *)&v26 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v27 + 8));
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
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __72__PLAssetsdLibraryInternalService_waitForSearchIndexExistenceWithReply___block_invoke;
      v24[3] = &unk_1E366F590;
      v25 = v4;
      objc_msgSend(v11, "openWithCompletion:", v24);

      v12 = v25;
    }
    else
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "searchIndexManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __72__PLAssetsdLibraryInternalService_waitForSearchIndexExistenceWithReply___block_invoke_2;
      v22[3] = &unk_1E3676CD8;
      v23 = v4;
      objc_msgSend(v17, "ensureSearchIndexExistsWithCompletionHandler:", v22);

      v12 = v23;
    }
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[PLAssetsdLibraryInternalService waitForSearchIndexExistenceWithReply:]";
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
    }

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30 = CFSTR("search indexer not enabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v15);

  }
  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if ((_QWORD)v27)
  {
    PLRequestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)resumeSearchIndexingWithReply:(id)a3
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
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *Name;
  _QWORD v22[5];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  SEL sel[2];
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0u;
  *(_OWORD *)sel = 0u;
  v25 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v25) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: resumeSearchIndexingWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v25 + 1);
    *((_QWORD *)&v25 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v26 + 8));
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
      v12 = (void *)objc_msgSend(v11, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService resumeSearchIndexingWithReply:]");

      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "searchIndexingEngine");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __65__PLAssetsdLibraryInternalService_resumeSearchIndexingWithReply___block_invoke;
      v22[3] = &unk_1E366F5B8;
      v22[4] = self;
      v15 = v12;
      v23 = v15;
      v24 = v4;
      objc_msgSend(v14, "resumeSearchIndexRebuildIfNeededForLibrary:calledBy:completion:", v15, CFSTR("Service request"), v22);

LABEL_14:
      goto LABEL_15;
    }
    PLGatekeeperXPCGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[PLAssetsdLibraryInternalService resumeSearchIndexingWithReply:]";
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unsupported when PhotosSearchBackgroundJobWorker is disabled, unable to perform operation %s", buf, 0xCu);
    }

    if (v4)
    {
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46309, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v15);
      goto LABEL_14;
    }
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[PLAssetsdLibraryInternalService resumeSearchIndexingWithReply:]";
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
    }

    if (v4)
      goto LABEL_13;
  }
LABEL_15:
  if ((_BYTE)v25)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  if ((_QWORD)v26)
  {
    PLRequestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)pauseSearchIndexingWithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *Name;
  __int128 v16;
  char v17;
  __int128 v18;
  SEL sel[2];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v16 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v16) = v5;
  if (v5)
  {
    *((_QWORD *)&v16 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: pauseSearchIndexingWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v16 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSearchIndexingEnabled");

  if (v7)
  {
    if (_os_feature_enabled_impl())
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "searchIndexingEngine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pauseSearchIndexRebuildWithSourceName:", CFSTR("Service request"));

      v4[2](v4, 1, 0);
      goto LABEL_14;
    }
    PLGatekeeperXPCGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[PLAssetsdLibraryInternalService pauseSearchIndexingWithReply:]";
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unsupported when PhotosSearchBackgroundJobWorker is disabled, unable to perform operation %s", buf, 0xCu);
    }

    if (v4)
      goto LABEL_13;
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[PLAssetsdLibraryInternalService pauseSearchIndexingWithReply:]";
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
    }

    if (v4)
    {
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46309, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v12);

    }
  }
LABEL_14:
  if (v17)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  if ((_QWORD)v18)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)applyGraphUpdates:(id)a3 supportingData:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  char *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  os_signpost_id_t v40;
  const char *Name;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  SEL sel[2];
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  const __CFString *v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v46 = 0u;
  *(_OWORD *)sel = 0u;
  v45 = 0u;
  v11 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v45) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199541000, "PLXPC Service: applyGraphUpdates:supportingData:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v45 + 1);
    *((_QWORD *)&v45 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v46 + 8));
  }
  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLZeroKeywordStore expectedClasses](PLZeroKeywordStore, "expectedClasses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setByAddingObjectsFromSet:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v22, v9, &v44);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (char *)v44;
  if (!v23)
  {
    PLBackendGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v24;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Search Indexing [Graph]: Unable to unarchive supportingData dictionary from data with error: %@", buf, 0xCu);
    }

  }
  if (v8)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isSearchIndexingEnabled");

    if (v27)
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "searchIndexManager");
      v29 = (char *)objc_claimAutoreleasedReturnValue();

      PLBackendGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = objc_msgSend(v8, "count");
        v32 = objc_msgSend(v23, "count");
        *(_DWORD *)buf = 138412802;
        v53 = v29;
        v54 = 2048;
        v55 = v31;
        v56 = 2048;
        v57 = v32;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_INFO, "Search Indexing [Graph]: Search index manager: %@ will apply graph updates with a count of %lu and a supporting data with a count of %lu", buf, 0x20u);
      }

      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __74__PLAssetsdLibraryInternalService_applyGraphUpdates_supportingData_reply___block_invoke;
      v42[3] = &unk_1E3676CD8;
      v43 = v10;
      objc_msgSend(v29, "applyGraphUpdates:supportingData:completion:", v8, v23, v42);
      v33 = v43;
    }
    else
    {
      PLGatekeeperXPCGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v53 = "-[PLAssetsdLibraryInternalService applyGraphUpdates:supportingData:reply:]";
        _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "Search Indexing [Graph]: Search index manager disabled, unable to perform operation %s", buf, 0xCu);
      }

      v37 = (void *)MEMORY[0x1E0CB35C8];
      v50 = *MEMORY[0x1E0CB2D50];
      v51 = CFSTR("search indexer not enabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v29 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v33);
    }
  }
  else
  {
    PLBackendGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Search Indexing [Graph]: Search index manager is unable to get graphUpdates dictionary", buf, 2u);
    }

    v35 = (void *)MEMORY[0x1E0CB35C8];
    v48 = *MEMORY[0x1E0CB2D50];
    v49 = CFSTR("graphUpdates cannot be nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v29 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v33);
  }

  if ((_BYTE)v45)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v46 + 8));
  if ((_QWORD)v46)
  {
    PLRequestGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    v40 = v46;
    if ((unint64_t)(v46 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v53 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v39, OS_SIGNPOST_INTERVAL_END, v40, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)setAssetKeywords:(id)a3 forAssetUUID:(id)a4 reply:(id)a5
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
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  const char *Name;
  _QWORD v26[4];
  id v27;
  __int128 *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  __int128 *p_buf;
  __int128 v34;
  __int128 v35;
  SEL sel[2];
  __int128 buf;
  uint64_t v38;
  char v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35 = 0u;
  *(_OWORD *)sel = 0u;
  v34 = 0u;
  v11 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v34) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199541000, "PLXPC Service: setAssetKeywords:forAssetUUID:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v34 + 1);
    *((_QWORD *)&v34 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "databaseContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService setAssetKeywords:forAssetUUID:reply:]");

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x2020000000;
  v17 = MEMORY[0x1E0C809B0];
  v39 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __71__PLAssetsdLibraryInternalService_setAssetKeywords_forAssetUUID_reply___block_invoke;
  v29[3] = &unk_1E3676EC8;
  p_buf = &buf;
  v18 = v16;
  v30 = v18;
  v19 = v8;
  v31 = v19;
  v20 = v9;
  v32 = v20;
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __71__PLAssetsdLibraryInternalService_setAssetKeywords_forAssetUUID_reply___block_invoke_2;
  v26[3] = &unk_1E36714A8;
  v21 = v10;
  v27 = v21;
  v28 = &buf;
  objc_msgSend(v18, "performTransaction:completionHandler:", v29, v26);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v34)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  if ((_QWORD)v35)
  {
    PLRequestGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)invalidateReverseLocationDataOnAllAssetsWithReply:(id)a3
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
  uint64_t *v18;
  __int128 *p_buf;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  SEL sel[2];
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  *(_OWORD *)sel = 0u;
  v24 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v24) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: invalidateReverseLocationDataOnAllAssetsWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v24 + 1);
    *((_QWORD *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__65391;
  v30 = __Block_byref_object_dispose__65392;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService invalidateReverseLocationDataOnAllAssetsWithReply:]");

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PLAssetsdLibraryInternalService_invalidateReverseLocationDataOnAllAssetsWithReply___block_invoke;
  v16[3] = &unk_1E3677830;
  v18 = &v20;
  v11 = v10;
  v17 = v11;
  p_buf = &buf;
  objc_msgSend(v11, "performTransactionAndWait:", v16);
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *((unsigned __int8 *)v21 + 24), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v24)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  if ((_QWORD)v25)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)registerBackgroundJobServiceIfNecessaryOnLibraryPath:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, BOOL, void *);
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *Name;
  __int128 v19;
  char v20;
  __int128 v21;
  SEL sel[2];
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, BOOL, void *))a4;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v19 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v19) = v8;
  if (v8)
  {
    *((_QWORD *)&v19 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: registerBackgroundJobServiceIfNecessaryOnLibraryPath:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1, (_QWORD)v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleForLibraryURL:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backgroundJobService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "signalBackgroundProcessingNeededOnBundle:", v11);
    v14 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("Bundle at path not found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41001, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v7[2](v7, v11 != 0, v14);
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
      v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getBackgroundJobServiceStateWithReply:(id)a3
{
  void (**v4)(id, uint64_t);
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *Name;
  __int128 v11;
  char v12;
  __int128 v13;
  SEL sel[2];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  v13 = 0u;
  *(_OWORD *)sel = 0u;
  v11 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((_QWORD *)&v11 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: getBackgroundJobServiceStateWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundJobService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v4[2](v4, objc_msgSend(v7, "serviceState"));
  if (v12)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  if ((_QWORD)v13)
  {
    PLRequestGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getBackgroundJobServiceStatusCenterDumpWithReply:(id)a3
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
  char v13;
  __int128 v14;
  SEL sel[2];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v14 = 0u;
  *(_OWORD *)sel = 0u;
  v12 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((_QWORD *)&v12 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: getBackgroundJobServiceStatusCenterDumpWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundJobService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "statusCenterDump");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v8);

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

- (void)getBackgroundJobServiceBundlesInQueueDictionaryWithReply:(id)a3
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
  char v13;
  __int128 v14;
  SEL sel[2];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v14 = 0u;
  *(_OWORD *)sel = 0u;
  v12 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((_QWORD *)&v12 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: getBackgroundJobServiceBundlesInQueueDictionaryWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundJobService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_bundlesToProcessByCriteriaShortCodesAsPathStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v8);

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

- (void)backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet
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
    *((_QWORD *)&v9 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundJobService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_removeAllBundlesFromProcessingSet");
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

- (void)deleteiTunesSyncedContentWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
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
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v14 = 0u;
  *(_OWORD *)sel = 0u;
  v12 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((_QWORD *)&v12 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: deleteiTunesSyncedContentWithCompletionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService deleteiTunesSyncedContentWithCompletionHandler:]");

  objc_msgSend(v8, "deleteITunesSyncedContentForEnablingiCPL");
  v4[2](v4, 1, 0);

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

- (void)invalidateBehavioralScoreOnAllAssetsWithReply:(id)a3
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
  uint64_t *v18;
  __int128 *p_buf;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  SEL sel[2];
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  *(_OWORD *)sel = 0u;
  v24 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v24) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: invalidateBehavioralScoreOnAllAssetsWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v24 + 1);
    *((_QWORD *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__65391;
  v30 = __Block_byref_object_dispose__65392;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService invalidateBehavioralScoreOnAllAssetsWithReply:]");

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__PLAssetsdLibraryInternalService_invalidateBehavioralScoreOnAllAssetsWithReply___block_invoke;
  v16[3] = &unk_1E3677830;
  v18 = &v20;
  v11 = v10;
  v17 = v11;
  p_buf = &buf;
  objc_msgSend(v11, "performTransactionAndWait:", v16);
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *((unsigned __int8 *)v21 + 24), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v24)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  if ((_QWORD)v25)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)setFetchFilterWithAssets:(id)a3 forApplication:(id)a4 withAuditToken:(id *)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  const char *Name;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  __int128 *p_buf;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  _QWORD *v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[3];
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 buf;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  v13 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v48) = v13;
  if (v13)
  {
    v14 = _os_activity_create(&dword_199541000, "PLXPC Service: setFetchFilterWithAssets:forApplication:withAuditToken:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v15 = (void *)*((_QWORD *)&v48 + 1);
    *((_QWORD *)&v48 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v49 + 8));
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__65391;
  v54 = __Block_byref_object_dispose__65392;
  v55 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__65391;
  v44[4] = __Block_byref_object_dispose__65392;
  v45 = 0;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "databaseContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService setFetchFilterWithAssets:forApplication:withAuditToken:completionHandler:]");

  +[PLLimitedLibraryFetchFilter fetchFilterIdentifierForApplicationIdentifier:](PLLimitedLibraryFetchFilter, "fetchFilterIdentifierForApplicationIdentifier:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __108__PLAssetsdLibraryInternalService_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke;
  v36[3] = &unk_1E366F5E0;
  v37 = v19;
  v21 = *(_OWORD *)&a5->var0[4];
  v42 = *(_OWORD *)a5->var0;
  v43 = v21;
  v22 = v18;
  v38 = v22;
  v23 = v10;
  v39 = v23;
  v40 = v46;
  v41 = v44;
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = __108__PLAssetsdLibraryInternalService_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke_2;
  v30[3] = &unk_1E366F618;
  v33 = v46;
  v34 = v44;
  v24 = v37;
  v31 = v24;
  v25 = v12;
  v32 = v25;
  p_buf = &buf;
  objc_msgSend(v22, "performTransaction:completionHandler:", v36, v30);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v48)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v49 + 8));
  if ((_QWORD)v49)
  {
    PLRequestGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = v49;
    if ((unint64_t)(v49 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      Name = sel_getName(*((SEL *)&v50 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)resetLimitedLibraryAccessForApplication:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  const char *Name;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  __int128 *p_buf;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  __int128 v32;
  __int128 v33;
  SEL sel[2];
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33 = 0u;
  *(_OWORD *)sel = 0u;
  v32 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v32) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: resetLimitedLibraryAccessForApplication:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v32 + 1);
    *((_QWORD *)&v32 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  PLGatekeeperXPCGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Resetting system photo library limited access filter for %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__65391;
  v38 = __Block_byref_object_dispose__65392;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestLimitedLibraryPromptForApplicationIdentifier:", v6);

    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "databaseContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService resetLimitedLibraryAccessForApplication:completionHandler:]");

    objc_msgSend(v15, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __93__PLAssetsdLibraryInternalService_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke;
    v23[3] = &unk_1E3676348;
    v24 = v6;
    v17 = v16;
    v25 = v17;
    v26 = &v28;
    p_buf = &buf;
    objc_msgSend(v17, "performBlockAndWait:", v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 45002, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v18;
  }

  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, *((unsigned __int8 *)v29 + 24), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v32)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  if ((_QWORD)v33)
  {
    PLRequestGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)setWidgetTimelineGeneratedForDisplaySize:(CGSize)a3 completionHandler:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  const char *Name;
  _QWORD v20[4];
  id v21;
  id v22;
  CGFloat v23;
  CGFloat v24;
  __int128 v25;
  __int128 v26;
  SEL sel[2];
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  height = a3.height;
  width = a3.width;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v26 = 0u;
  *(_OWORD *)sel = 0u;
  v25 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v25) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: setWidgetTimelineGeneratedForDisplaySize:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v25 + 1);
    *((_QWORD *)&v25 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService setWidgetTimelineGeneratedForDisplaySize:completionHandler:]");

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__PLAssetsdLibraryInternalService_setWidgetTimelineGeneratedForDisplaySize_completionHandler___block_invoke;
  v20[3] = &unk_1E3675BE0;
  v14 = v13;
  v21 = v14;
  v23 = width;
  v24 = height;
  v15 = v7;
  v22 = v15;
  objc_msgSend(v14, "performBlock:", v20);

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
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)forceRunBackgroundJobsOnLibraryPath:(id)a3 criteriaShortCode:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  +[PLBackgroundJobCriteria criteriaWithKnownShortCode:](PLBackgroundJobCriteria, "criteriaWithKnownShortCode:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0D74498];
    v56 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Criteria short code not found: %@"), v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 41001, v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    PLBackendGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v55 = v12;
LABEL_12:
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "forceRunBackgroundJobs: %{public}@", buf, 0xCu);
    }
LABEL_13:

    v10[2](v10, 0, v12);
    goto LABEL_25;
  }
  if (!v8)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0D74498];
    v48 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library path is nil"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 41001, v32);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    PLBackendGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v55 = v12;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "libraryBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "openBundleAtLibraryURL:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "libraryServicesManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "backgroundJobService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "serviceState");
    if (+[PLBackgroundJobService verifyStateTransitionFromState:toState:](PLBackgroundJobService, "verifyStateTransitionFromState:toState:", v19, 6))
    {
      PLBackgroundJobServiceGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v21;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "forceRunBackgroundJobs: Going to force background jobs to run at criteria %@", buf, 0xCu);

      }
      objc_msgSend(v18, "_unregisterActivityIfNeededShouldConsiderDeferring_enqueue:", 0);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_appendBundleRecordsToProcessingSet:criteriaShortCode:", v22, v23);

      objc_msgSend(v18, "_setRunningCriteria:", v11);
      objc_msgSend(v18, "_startRunningBackgroundJobsWithCriteria:", v11);
      v10[2](v10, 1, 0);
    }
    else
    {
      v46 = (void *)MEMORY[0x1E0CB35C8];
      v47 = v16;
      v45 = *MEMORY[0x1E0D74498];
      v52 = *MEMORY[0x1E0CB2D50];
      v38 = (void *)MEMORY[0x1E0CB3940];
      if ((unint64_t)(v19 - 1) > 9)
        v39 = CFSTR("Unknown");
      else
        v39 = off_1E3667C20[v19 - 1];
      v40 = v39;
      objc_msgSend(v38, "stringWithFormat:", CFSTR("BackgroundJobService is not in a valid state for forced running. It may already be in a running state or it has nothing to run. Current state: %@"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", v45, 41001, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      PLBackendGetLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v55 = v43;
        _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_ERROR, "forceRunBackgroundJobs: %{public}@", buf, 0xCu);
      }

      v10[2](v10, 0, v43);
      v16 = v47;
    }
  }
  else
  {
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0D74498];
    v50 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library bundle is unavailable at path: %@"), v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 41001, v36);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    PLBackendGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v55 = v18;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "forceRunBackgroundJobs: %{public}@", buf, 0xCu);
    }

    v10[2](v10, 0, v18);
  }

LABEL_25:
}

- (void)coreAnalyticsLibrarySummaryDataWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD, id);
  void *v5;
  void *v6;
  void *v7;
  PLLibraryContentsEnumerator *v8;
  void *v9;
  PLLibraryContentsEnumerator *v10;
  void *v11;
  PLLibraryContentsEnumerator *v12;
  void *v13;
  PLLibraryContentsEnumerator *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v4 = (void (**)(id, uint64_t, _QWORD, id))a3;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService coreAnalyticsLibrarySummaryDataWithCompletionHandler:]");

  v8 = [PLLibraryContentsEnumerator alloc];
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLLibraryContentsEnumerator initWithSourceManagedObjectContext:concurrent:](v8, "initWithSourceManagedObjectContext:concurrent:", v9, 0);

  v27 = 0;
  v11 = (void *)PLCreateShortLivedWellKnownPhotoLibrary(3, (uint64_t)"-[PLAssetsdLibraryInternalService coreAnalyticsLibrarySummaryDataWithCompletionHandler:]", &v27);
  v24 = v27;
  if (v11)
  {
    v12 = [PLLibraryContentsEnumerator alloc];
    objc_msgSend(v11, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PLLibraryContentsEnumerator initWithSourceManagedObjectContext:concurrent:](v12, "initWithSourceManagedObjectContext:concurrent:", v13, 0);

  }
  else
  {
    v14 = 0;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = objc_msgSend(v7, "isCloudPhotoLibraryEnabled");
  +[PLAggdLogging configureEnumeratorForLibrarySizeLogging:cloudPhotoLibraryEnabled:dataForCA:dataForCK:](PLAggdLogging, "configureEnumeratorForLibrarySizeLogging:cloudPhotoLibraryEnabled:dataForCA:dataForCK:", v10, v17, v15, v16);
  +[PLAggdLogging configureEnumeratorForHyperionLocalResourcesLogging:cloudPhotoLibraryEnabled:dataForCA:dataForCK:](PLAggdLogging, "configureEnumeratorForHyperionLocalResourcesLogging:cloudPhotoLibraryEnabled:dataForCA:dataForCK:", v10, v17, v15, v16);
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAggdLogging configureEnumeratorForLibrarySummaryForLibraryEnumerator:withSyndicationLibraryEnumerator:cloudPhotoLibraryEnabled:dataForCA:libraryServicesManager:](PLAggdLogging, "configureEnumeratorForLibrarySummaryForLibraryEnumerator:withSyndicationLibraryEnumerator:cloudPhotoLibraryEnabled:dataForCA:libraryServicesManager:", v10, v14, v17, v15, v18);

  v26 = 0;
  v19 = -[PLLibraryContentsEnumerator processObjectsWithError:](v10, "processObjectsWithError:", &v26);
  v20 = v26;
  v21 = v20;
  if ((_DWORD)v19 && v14)
  {
    v25 = v20;
    v19 = -[PLLibraryContentsEnumerator processObjectsWithError:](v14, "processObjectsWithError:", &v25);
    v22 = v25;

    v21 = v22;
  }
  if (v4)
  {
    if ((_DWORD)v19)
      v23 = 0;
    else
      v23 = v21;
    ((void (**)(id, uint64_t, void *, id))v4)[2](v4, v19, v23, v15);
  }

}

- (void)metricsForLibraryAtURL:(id)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  PLPhotoLibraryOpener *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  int v39;
  void (**v40)(id, void *, id);
  PLPhotoLibraryOpener *v41;
  __CFString *v42;
  void *v43;
  _QWORD v44[6];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[7];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[5];
  id v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[2];
  _QWORD v84[2];
  uint8_t v85[128];
  _BYTE buf[40];
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v40 = (void (**)(id, void *, id))a4;
  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "metricsForLibraryAtURL:%@ begin", buf, 0xCu);
  }

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "openBundleAtLibraryURL:", v6);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PLPhotoLibraryOpener alloc];
  objc_msgSend(v43, "libraryServicesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[PLPhotoLibraryOpener initWithLibraryServicesManager:reportInProgressUpgrades:](v11, "initWithLibraryServicesManager:reportInProgressUpgrades:", v12, 0);

  v78 = 0;
  v13 = -[PLPhotoLibraryOpener openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:](v41, "openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:", 0, 0, &v78);
  v42 = (__CFString *)v78;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0;
  if (v13)
  {
    objc_msgSend(v43, "libraryServicesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "databaseContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService metricsForLibraryAtURL:reply:]");

    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __64__PLAssetsdLibraryInternalService_metricsForLibraryAtURL_reply___block_invoke;
    v66[3] = &unk_1E3676348;
    v68 = &v74;
    v66[4] = self;
    v17 = v16;
    v67 = v17;
    v69 = &v70;
    objc_msgSend(v17, "performBlockAndWait:", v66);

  }
  PLBackendGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "metricsForLibraryAtURL:%@ filesystem calculation begin", buf, 0xCu);
  }

  if (v13)
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__65391;
    *(_QWORD *)&buf[32] = __Block_byref_object_dispose__65392;
    v87 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __64__PLAssetsdLibraryInternalService_metricsForLibraryAtURL_reply___block_invoke_71;
    v57[3] = &unk_1E366F640;
    v57[4] = &v62;
    v57[5] = &v58;
    v57[6] = buf;
    v39 = objc_msgSend(v43, "calculateTotalSizeWithResult:", v57);
    if ((v39 & 1) == 0)
    {
      v20 = (__CFString *)*(id *)(*(_QWORD *)&buf[8] + 40);

      v42 = v20;
    }
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    v38 = v6;
    if (v39)
    {
      objc_msgSend(v43, "pathManager");
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "pathsForFinderSyncFilesystemSizeCalculation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v85, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v46 != v23)
              objc_enumerationMutation(v21);
            v25 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            v44[0] = v19;
            v44[1] = 3221225472;
            v44[2] = __64__PLAssetsdLibraryInternalService_metricsForLibraryAtURL_reply___block_invoke_2;
            v44[3] = &unk_1E366F668;
            v44[4] = &v53;
            v44[5] = &v49;
            objc_msgSend(MEMORY[0x1E0D73208], "calculateTotalSizeOfFilesAtPath:calculatePurgeable:allocatedSize:result:", v25, 1, 0, v44);
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v85, 16);
        }
        while (v22);
      }

    }
    v83[0] = CFSTR("Photo");
    v81[0] = CFSTR("_Count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v75[3]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v26;
    v81[1] = CFSTR("_PhysicalSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v54[3]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v27;
    v81[2] = CFSTR("_PurgeableSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v50[3]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v82[2] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v29;
    v83[1] = CFSTR("CameraRoll");
    v79[0] = CFSTR("_Count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v71[3]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v30;
    v79[1] = CFSTR("_PhysicalSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v63[3] - v54[3]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v31;
    v79[2] = CFSTR("_PurgeableSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v59[3] - v50[3]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v38;
    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
  }
  else
  {
    v34 = 0;
    v39 = 0;
  }
  PLBackendGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = &stru_1E36789C0;
    *(_DWORD *)buf = 138413058;
    if (v42)
      v36 = v42;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v39;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v36;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v34;
    _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_INFO, "metricsForLibraryAtURL:%@ success?%d %@ %@", buf, 0x26u);
  }

  v40[2](v40, v34, v42);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

}

- (unint64_t)_assetCountInManagedObjectContext:(id)a3 forSyncedAssets:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D73310];
  v10 = objc_msgSend(MEMORY[0x1E0D73310], "maskForFinderSyncedAsset");
  if (v4)
    objc_msgSend(v9, "predicateForIncludeMask:useIndex:", v10, 1);
  else
    objc_msgSend(v9, "predicateForExcludeMask:useIndex:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v11);
  v16 = 0;
  v12 = objc_msgSend(v6, "countForFetchRequest:error:", v8, &v16);

  v13 = v16;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Error getting asset count: %{public}@", buf, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

- (void)processIdenticalDuplicatesWithProcessingType:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, uint64_t, id);
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v6 = (void (**)(id, uint64_t, id))a4;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PLDuplicateProcessor isDuplicateProcessorEnabledForLibraryServicesManager:](PLDuplicateProcessor, "isDuplicateProcessorEnabledForLibraryServicesManager:", v7);

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41005, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (!v6)
      goto LABEL_8;
LABEL_7:
    v6[2](v6, v11, v12);
    goto LABEL_8;
  }
  if (a3 >= 7)
    a3 = 7;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "duplicateProcessor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v11 = objc_msgSend(v10, "processDuplicatesOfAssetObjectIds:processingType:error:continuationHandler:", 0, a3, &v13, 0);
  v12 = v13;

  if (v6)
    goto LABEL_7;
LABEL_8:

}

- (void)assetsArePendingForDuplicateMergeProcessing:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PLDuplicateProcessor isDuplicateProcessorEnabledForLibraryServicesManager:](PLDuplicateProcessor, "isDuplicateProcessorEnabledForLibraryServicesManager:", v8);

  if (v9)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "duplicateProcessor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "assetsArePendingForDuplicateMergeProcessing:", v6);

    if (!v7)
      goto LABEL_8;
    goto LABEL_7;
  }
  PLBackendGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "libraryURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v15;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Duplicate processing is not supported for library URL: %@", (uint8_t *)&v16, 0xCu);

  }
  v12 = 0;
  if (v7)
LABEL_7:
    v7[2](v7, v12);
LABEL_8:

}

- (void)mergeDuplicateAssetUuidSelection:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PLDuplicateProcessor isDuplicateProcessorEnabledForLibraryServicesManager:](PLDuplicateProcessor, "isDuplicateProcessorEnabledForLibraryServicesManager:", v8);

  if (v9)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "duplicateProcessor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__PLAssetsdLibraryInternalService_mergeDuplicateAssetUuidSelection_reply___block_invoke;
    v16[3] = &unk_1E36768D0;
    v17 = v7;
    objc_msgSend(v11, "mergeDuplicateAssetsWithAssetUUIDs:completionHandler:", v6, v16);

    v12 = v17;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D74498];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("invalid duplicate processing library");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 49401, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)insertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchIndexManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__PLAssetsdLibraryInternalService_insertEmbeddings_modelType_assetUUID_reply___block_invoke;
  v16[3] = &unk_1E3676CD8;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "insertEmbeddings:modelType:assetUUID:completion:", v12, a4, v11, v16);

}

- (void)deleteEmbeddings:(id)a3 assetUUID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchIndexManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PLAssetsdLibraryInternalService_deleteEmbeddings_assetUUID_reply___block_invoke;
  v14[3] = &unk_1E3676CD8;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "deleteEmbeddings:assetUUID:completion:", v10, v9, v14);

}

- (void)featureProcessingSnapshotWithReply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService featureProcessingSnapshotWithReply:]");

  if (v7)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "availabilityComputer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__PLAssetsdLibraryInternalService_featureProcessingSnapshotWithReply___block_invoke;
    v13[3] = &unk_1E366F590;
    v14 = v4;
    objc_msgSend(v9, "computeSnapshotForPhotoLibrary:completionHandler:", v7, v13);

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D74498];
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("No photo library available for processing snapshot computation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 46502, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);
  }

}

- (void)availabilityStateShouldPersist:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v4 = a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "databaseContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService availabilityStateShouldPersist:reply:]");

  if (v9)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "availabilityComputer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__PLAssetsdLibraryInternalService_availabilityStateShouldPersist_reply___block_invoke;
    v15[3] = &unk_1E366F590;
    v16 = v6;
    objc_msgSend(v11, "computeAvailabilityForPhotoLibrary:shouldPersist:completionHandler:", v9, v4, v15);

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D74498];
    v17 = *MEMORY[0x1E0CB2938];
    v18[0] = CFSTR("No photo library available for availability computation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 46502, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v11);
  }

}

- (void)clearAvailabilityWithReply:(id)a3
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, id))a3;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService clearAvailabilityWithReply:]");

  if (v7)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "availabilityComputer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    v10 = objc_msgSend(v9, "clearAvailabilityStateForPhotoLibrary:error:", v7, &v15);
    v11 = v15;
    v4[2](v4, v10, v11);

    v4 = (void (**)(id, uint64_t, id))v11;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D74498];
    v16 = *MEMORY[0x1E0CB2938];
    v17[0] = CFSTR("No photo library available to clear availability");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 46502, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, 0, v9);
  }

}

- (void)signalAvailabilityStateDidChangeWithReply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[8];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryInternalService signalAvailabilityStateDidChangeWithReply:]");

  if (v7)
  {
    PLGatekeeperXPCGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "signalAvailabilityStateDidChange - will signal background processing needed", buf, 2u);
    }

    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__PLAssetsdLibraryInternalService_signalAvailabilityStateDidChangeWithReply___block_invoke;
    v16[3] = &unk_1E3677C18;
    v16[4] = self;
    v17 = v7;
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __77__PLAssetsdLibraryInternalService_signalAvailabilityStateDidChangeWithReply___block_invoke_2;
    v14[3] = &unk_1E3676CD8;
    v15 = v4;
    objc_msgSend(v17, "performBlock:completionHandler:", v16, v14);

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D74498];
    v19 = *MEMORY[0x1E0CB2938];
    v20[0] = CFSTR("No photo library available to signal availability state change");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 46502, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

void __77__PLAssetsdLibraryInternalService_signalAvailabilityStateDidChangeWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundJobService");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "signalBackgroundProcessingNeededOnLibrary:", *(_QWORD *)(a1 + 40));
}

uint64_t __77__PLAssetsdLibraryInternalService_signalAvailabilityStateDidChangeWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__PLAssetsdLibraryInternalService_availabilityStateShouldPersist_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(v3, "isFailure"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v6);
  }
  else
  {
    objc_msgSend(v3, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dictionary");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6, 0);
  }

}

void __70__PLAssetsdLibraryInternalService_featureProcessingSnapshotWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(v3, "isFailure"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v6);
  }
  else
  {
    objc_msgSend(v3, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dictionary");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6, 0);
  }

}

uint64_t __68__PLAssetsdLibraryInternalService_deleteEmbeddings_assetUUID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__PLAssetsdLibraryInternalService_insertEmbeddings_modelType_assetUUID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__PLAssetsdLibraryInternalService_mergeDuplicateAssetUuidSelection_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64__PLAssetsdLibraryInternalService_metricsForLibraryAtURL_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "_assetCountInManagedObjectContext:forSyncedAssets:", v3, 1);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "_assetCountInManagedObjectContext:forSyncedAssets:", v5, 0);

}

void __64__PLAssetsdLibraryInternalService_metricsForLibraryAtURL_reply___block_invoke_71(_QWORD *a1, int a2, uint64_t a3, int a4, uint64_t a5, id obj)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a3;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a5;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

uint64_t __64__PLAssetsdLibraryInternalService_metricsForLibraryAtURL_reply___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) += a5;
  return result;
}

uint64_t __94__PLAssetsdLibraryInternalService_setWidgetTimelineGeneratedForDisplaySize_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWidgetTimelineGeneratedForDisplaySize:", *(double *)(a1 + 48), *(double *)(a1 + 56));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __93__PLAssetsdLibraryInternalService_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  id v6;

  +[PLLimitedLibraryFetchFilter deleteLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:](PLLimitedLibraryFetchFilter, "deleteLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:", a1[4], a1[5]);
  v2 = (void *)a1[5];
  v6 = 0;
  v3 = objc_msgSend(v2, "save:", &v6);
  v4 = v6;
  v5 = v6;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v4);

}

void __108__PLAssetsdLibraryInternalService_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __int128 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _OWORD v9[2];

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(a1 + 88);
  v9[0] = *(_OWORD *)(a1 + 72);
  v9[1] = v4;
  +[PLLimitedLibraryFetchFilter fetchOrCreateLimitedLibraryFetchFilterWithApplicationIdentifier:auditToken:inManagedObjectContext:](PLLimitedLibraryFetchFilter, "fetchOrCreateLimitedLibraryFetchFilterWithApplicationIdentifier:auditToken:inManagedObjectContext:", v2, v9, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeAllAssets");
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
    objc_msgSend(v5, "addAssetsWithUUIDs:", *(_QWORD *)(a1 + 48));
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(v5, "objectID");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

uint64_t __108__PLAssetsdLibraryInternalService_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    v4 = a1[4];
    v7 = CFSTR("PLLimitedLibraryFetchFiltersUpdatedNotificationApplicationIdentifier");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PLLimitedLibraryFetchFiltersUpdatedNotification"), v3, v5);

  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __81__PLAssetsdLibraryInternalService_invalidateBehavioralScoreOnAllAssetsWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = +[PLManagedAsset invalidateBehavioralScoreOnAllAssetsInManagedObjectContext:error:](PLManagedAsset, "invalidateBehavioralScoreOnAllAssetsInManagedObjectContext:error:", v2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

}

void __85__PLAssetsdLibraryInternalService_invalidateReverseLocationDataOnAllAssetsWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = +[PLManagedAsset invalidateReverseLocationDataOnAllAssetsInManagedObjectContext:error:](PLManagedAsset, "invalidateReverseLocationDataOnAllAssetsInManagedObjectContext:error:", v2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

}

void __71__PLAssetsdLibraryInternalService_setAssetKeywords_forAssetUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "keywordManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "setKeywords:forAssetUUID:managedObjectContext:", v3, v2, v4);

}

uint64_t __71__PLAssetsdLibraryInternalService_setAssetKeywords_forAssetUUID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __74__PLAssetsdLibraryInternalService_applyGraphUpdates_supportingData_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__PLAssetsdLibraryInternalService_resumeSearchIndexingWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  if (objc_msgSend(v3, "isSuccess"))
  {
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchIndexingEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__PLAssetsdLibraryInternalService_resumeSearchIndexingWithReply___block_invoke_2;
    v10[3] = &unk_1E366F590;
    v6 = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v5, "resumeProcessingIncrementalUpdatesInLibrary:completion:", v6, v10);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      v8 = objc_msgSend(v3, "isSuccess");
      objc_msgSend(v3, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, v8, v9);

    }
  }

}

void __65__PLAssetsdLibraryInternalService_resumeSearchIndexingWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    v4 = objc_msgSend(v3, "isSuccess");
    objc_msgSend(v3, "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
  }
}

void __72__PLAssetsdLibraryInternalService_waitForSearchIndexExistenceWithReply___block_invoke(uint64_t a1, void *a2)
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

uint64_t __72__PLAssetsdLibraryInternalService_waitForSearchIndexExistenceWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__PLAssetsdLibraryInternalService_getSearchIndexProgressWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__PLAssetsdLibraryInternalService_getSearchIndexProgressWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__PLAssetsdLibraryInternalService_repairMemoriesWithUUIDs_reply___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[PLMemory memoriesWithUUIDs:inPhotoLibrary:](PLMemory, "memoriesWithUUIDs:inPhotoLibrary:", a1[4], a1[5]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v18;
    v16 = *MEMORY[0x1E0D74498];
    v6 = *MEMORY[0x1E0CB2D50];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v1);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "keyAsset");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          objc_msgSend(v8, "calculateKeyAsset");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v8, "setKeyAsset:", v10);
          }
          else
          {
            if (!v4)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("couldn't repair the key asset of memory %@ because there's no available replacement"), v8);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = (void *)MEMORY[0x1E0CB35C8];
              v23 = v6;
              v24 = v11;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "errorWithDomain:code:userInfo:", v16, 41001, v13);
              v4 = (void *)objc_claimAutoreleasedReturnValue();

            }
            PLGatekeeperXPCGetLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v22 = v8;
              _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Error repairing key asset of memory: %@", buf, 0xCu);
            }

          }
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __73__PLAssetsdLibraryInternalService_updateAssetLocationDataWithUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithUUID:inManagedObjectContext:](PLManagedAsset, "assetWithUUID:inManagedObjectContext:", v2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "modifyDCIMEntryForPhoto:", v4);
}

void __63__PLAssetsdLibraryInternalService_getLibrarySizesFromDB_reply___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "librarySizesFromDB");
  else
    objc_msgSend(v3, "estimatedLibrarySizes");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __63__PLAssetsdLibraryInternalService_getLibrarySizesFromDB_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    PLGatekeeperXPCGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(unsigned __int8 *)(a1 + 48);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v13 = v3;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "getLibrarySizesFromDB:%d result:%{public}@", buf, 0x12u);

    }
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D74498];
    v10 = *MEMORY[0x1E0CB2938];
    v11 = CFSTR("Unable to get library size");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 41001, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PLGatekeeperXPCGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v9 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)buf = 67109378;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "getLibrarySizesFromDB:%d error %@", buf, 0x12u);
    }
  }

  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0);
}

void __59__PLAssetsdLibraryInternalService_getAssetCountsWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "getPhotoCount:videoCount:excludeTrashed:excludeInvisible:excludeCloudShared:", &v5, &v4, 1, 1, 1))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = *MEMORY[0x1E0CB2D50];
    v7[0] = CFSTR("Unable to get asset counts");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41001, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

@end
