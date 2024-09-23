@implementation PLAssetsdLibraryService

+ (int64_t)requiredLibraryServicesStateForURL:(id)a3
{
  id v3;
  int64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    PLLibraryServicesGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7 = 138412290;
      v8 = objc_opt_class();
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_FAULT, "unxpected nil libraryURL setting required state for %@", (uint8_t *)&v7, 0xCu);
    }

    goto LABEL_7;
  }
  if (objc_msgSend(MEMORY[0x1E0D73280], "isSystemPhotoLibraryURL:", v3))
  {
LABEL_7:
    v4 = 6;
    goto LABEL_8;
  }
  v4 = 0;
LABEL_8:

  return v4;
}

- (void)openPhotoLibraryDatabaseWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL8 v13;
  int v14;
  id v15;
  int v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  NSObject *v21;
  char *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  const char *Name;
  id v33;
  __int128 v34;
  __int128 v35;
  SEL sel[2];
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v35 = 0u;
  *(_OWORD *)sel = 0u;
  v34 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v34) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: openPhotoLibraryDatabaseWithOptions:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v34 + 1);
    *((_QWORD *)&v34 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  v11 = -[PLAssetsdLibraryService newLibraryOpener](self, "newLibraryOpener");
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "wellKnownPhotoLibraryIdentifier") == 1;

  v33 = 0;
  v14 = objc_msgSend(v11, "openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:", 0, v13, &v33);
  v15 = v33;
  if (v15)
    v16 = 0;
  else
    v16 = v14;
  if (v16 == 1)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "createOptions");

    if ((v18 & 0x10) == 0)
    {
      v15 = 0;
      goto LABEL_15;
    }
    -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.mediaanalysisd"));

    if (v20)
    {
      PLLibraryServicesGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
        v22 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v22;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Library createOptions do not allow mediaanalysisd to run. Rejecting connection from %{public}@", buf, 0xCu);

      }
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2938];
      NSStringFromPLErrorCode();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41005, v25);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      goto LABEL_18;
    }
    v15 = 0;
  }
  if (!v14)
  {
    v26 = 0;
    goto LABEL_20;
  }
LABEL_15:
  -[PLAssetsdLibraryService sandboxExtensionsByPathForLibraryAccessRole:](self, "sandboxExtensionsByPathForLibraryAccessRole:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "libraryInitiator") == 1)
  {
    -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length") == 0;

    if (!v28)
    {
      v37 = *MEMORY[0x1E0D735A8];
      -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x19AEC0B7C](*MEMORY[0x1E0D73590], v25);
LABEL_18:

    }
  }
LABEL_20:
  -[PLAssetsdLibraryService _sendClientReply:sandboxExtensionsByPath:error:](self, "_sendClientReply:sandboxExtensionsByPath:error:", v7, v26, v15);

  if ((_BYTE)v34)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  if ((_QWORD)v35)
  {
    PLRequestGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v42 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
}

- (id)postOpenProgressWithReply:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  const char *Name;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, int);
  void *v19;
  PLAssetsdLibraryService *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  SEL sel[2];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  *(_OWORD *)sel = 0u;
  v22 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v22) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: postOpenProgressWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v22 + 1);
    *((_QWORD *)&v22 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __53__PLAssetsdLibraryService_postOpenProgressWithReply___block_invoke;
  v19 = &unk_1E3676398;
  v20 = self;
  v9 = v4;
  v21 = v9;
  objc_msgSend(v8, "awaitLibraryState:completionHandler:", 7, &v16);

  -[PLAssetsdLibraryService _postRunningProgress](self, "_postRunningProgress", v16, v17, v18, v19, v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v22)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  if ((_QWORD)v23)
  {
    PLRequestGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
  return v10;
}

- (id)newLibraryOpener
{
  PLPhotoLibraryOpener *v3;
  void *v4;
  PLPhotoLibraryOpener *v5;

  v3 = [PLPhotoLibraryOpener alloc];
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLPhotoLibraryOpener initWithLibraryServicesManager:reportInProgressUpgrades:](v3, "initWithLibraryServicesManager:reportInProgressUpgrades:", v4, -[PLAssetsdConnectionAuthorization isClientAuthorizedForLibraryUpgrade](self->_connectionAuthorization, "isClientAuthorizedForLibraryUpgrade"));

  return v5;
}

- (void)_sendClientReply:(id)a3 sandboxExtensionsByPath:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v8 = a5;
  (*((void (**)(id, id, id))a3 + 2))(a3, a4, v8);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3764088);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  if (v20)
  {
    v10 = *MEMORY[0x1E0D74498];
    v11 = *MEMORY[0x1E0CB3388];
    v12 = v20;
    do
    {
      objc_msgSend(v12, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqual:", v10) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "code"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v9, "containsObject:", v14);

        if (v15)
        {
          -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "libraryBundle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[PLPhotoLibraryBundleController shutdownBundle:reason:](self->_libraryBundleController, "shutdownBundle:reason:", v19, v20);
          break;
        }
      }
      else
      {

      }
      objc_msgSend(v12, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v11);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v17;
    }
    while (v17);
  }

}

- (id)_postRunningProgress
{
  void *v3;
  void *v4;
  void *v5;

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postRunningProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdLibraryService _returnValueForProgress:addTo:](self, "_returnValueForProgress:addTo:", v4, self->_postRunningProgressFollowers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_returnValueForProgress:(id)a3 addTo:(id)a4
{
  id v5;
  id v6;
  PLProgressFollower *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[PLProgressFollower initWithSourceProgress:progressHandler:]([PLProgressFollower alloc], "initWithSourceProgress:progressHandler:", v6, 0);

  objc_msgSend(v5, "addObject:", v7);
  -[PLProgressFollower outputProgress](v7, "outputProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PLAssetsdLibraryService)initWithLibraryServicesManager:(id)a3 bundleController:(id)a4 connectionAuthorization:(id)a5 assetsdService:(id)a6
{
  id v11;
  id v12;
  id v13;
  PLAssetsdLibraryService *v14;
  PLAssetsdLibraryService *v15;
  NSMutableArray *v16;
  NSMutableArray *preRunningProgressFollowers;
  NSMutableArray *v18;
  NSMutableArray *postRunningProgressFollowers;
  objc_super v21;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PLAssetsdLibraryService;
  v14 = -[PLAbstractLibraryServicesManagerService initWithLibraryServicesManager:](&v21, sel_initWithLibraryServicesManager_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_connectionAuthorization, a5);
    objc_storeStrong((id *)&v15->_libraryBundleController, a4);
    objc_storeWeak((id *)&v15->_assetsdService, v13);
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    preRunningProgressFollowers = v15->_preRunningProgressFollowers;
    v15->_preRunningProgressFollowers = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    postRunningProgressFollowers = v15->_postRunningProgressFollowers;
    v15->_postRunningProgressFollowers = v18;

  }
  return v15;
}

uint64_t __53__PLAssetsdLibraryService_postOpenProgressWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__PLAssetsdLibraryService_postOpenProgressWithReply___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modelMigrator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__PLAssetsdLibraryService_postOpenProgressWithReply___block_invoke_2;
    v5[3] = &unk_1E3676CD8;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "loadFileSystemAssetsNotifyCompleted:", v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_preRunningProgressFollowers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_postRunningProgressFollowers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "invalidate");
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

  v13.receiver = self;
  v13.super_class = (Class)PLAssetsdLibraryService;
  -[PLAssetsdLibraryService dealloc](&v13, sel_dealloc);
}

- (void)launchAssetsd
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  const char *Name;
  __int128 v6;
  __int128 v7;
  SEL sel[2];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  *(_OWORD *)sel = 0u;
  v6 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v6) = v2;
  if (v2)
  {
    *((_QWORD *)&v6 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: launchAssetsd", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(*((os_activity_t *)&v6 + 1), (os_activity_scope_state_t)((char *)&v7 + 8));
    if ((_BYTE)v6)
      os_activity_scope_leave((os_activity_scope_state_t)((char *)&v7 + 8));
  }
  if ((_QWORD)v7)
  {
    PLRequestGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v10 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v4, OS_SIGNPOST_INTERVAL_END, v7, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
}

- (void)getCurrentModelVersionWithReply:(id)a3
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
    *((_QWORD *)&v8 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: getCurrentModelVersionWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  v3[2](v3, +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion", (_QWORD)v8));
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
      _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
}

- (void)isLibraryReadyForImportWithReply:(id)a3
{
  void (**v4)(id, uint64_t, id);
  int v5;
  NSObject *v6;
  void *v7;
  PLPhotoLibraryImportValidation *v8;
  void *v9;
  PLPhotoLibraryImportValidation *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  const char *Name;
  id v17;
  __int128 v18;
  __int128 v19;
  SEL sel[2];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, id))a3;
  v19 = 0u;
  *(_OWORD *)sel = 0u;
  v18 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v18) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: isLibraryReadyForImportWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v18 + 1);
    *((_QWORD *)&v18 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  v8 = [PLPhotoLibraryImportValidation alloc];
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLPhotoLibraryImportValidation initWithLibraryManager:](v8, "initWithLibraryManager:", v9);

  v17 = 0;
  v11 = -[PLPhotoLibraryImportValidation isLibraryValidForImportWithError:](v10, "isLibraryValidForImportWithError:", &v17);
  v12 = v17;
  v4[2](v4, v11, v12);

  if ((_BYTE)v18)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  if ((_QWORD)v19)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
}

- (id)sandboxExtensionsByPathForLibraryAccessRole:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73250], "sharedBookmarkManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sandboxExtensionsByPathForClient:pathManager:libraryAccessRole:", self->_connectionAuthorization, v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)validateOrRebuildPhotoLibraryDatabaseWithReply:(id)a3
{
  void (**v4)(id, uint64_t, id);
  int v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  PLLibraryOpenerCreationOptions *v10;
  PLLibraryOpenerCreationOptions *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  id v19;
  __int128 v20;
  __int128 v21;
  SEL sel[2];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, id))a3;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v20 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v20) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: validateOrRebuildPhotoLibraryDatabaseWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v20 + 1);
    *((_QWORD *)&v20 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  v8 = -[PLAssetsdLibraryService newLibraryOpener](self, "newLibraryOpener");
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openerCreationOptions");
  v10 = (PLLibraryOpenerCreationOptions *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = [PLLibraryOpenerCreationOptions alloc];
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PLLibraryOpenerCreationOptions initWithWellKnownLibraryIdentifier:](v11, "initWithWellKnownLibraryIdentifier:", objc_msgSend(v12, "wellKnownPhotoLibraryIdentifier"));

  }
  v19 = 0;
  v13 = objc_msgSend(v8, "createPhotoLibraryDatabaseWithOptions:error:", v10, &v19);
  v14 = v19;
  v4[2](v4, v13, v14);

  if ((_BYTE)v20)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  if ((_QWORD)v21)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
}

- (void)openApplicationOwnedFoldersWithReply:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  const char *Name;
  __int128 v20;
  char v21;
  __int128 v22;
  SEL sel[2];
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  *(_OWORD *)sel = 0u;
  v20 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v20) = v5;
  if (v5)
  {
    *((_QWORD *)&v20 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: openApplicationOwnedFoldersWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v20 + 1), (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "fileExistsAtPath:", v10);

  if (v11)
  {
    -[PLAssetsdLibraryService sandboxExtensionsByPathForLibraryAccessRole:](self, "sandboxExtensionsByPathForLibraryAccessRole:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2938];
    NSStringFromPLErrorCode();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41015, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }
  -[PLAssetsdLibraryService _sendClientReply:sandboxExtensionsByPath:error:](self, "_sendClientReply:sandboxExtensionsByPath:error:", v4, v12, v13);

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
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
}

- (id)upgradePhotoLibraryDatabaseWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  char *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  char *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  PLLibraryOpenerCreationOptions *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id WeakRetained;
  NSObject *v48;
  NSObject *v49;
  os_signpost_id_t v50;
  const char *Name;
  _QWORD v53[5];
  void (**v54)(id, _QWORD, void *);
  id v55;
  id v56;
  char v57;
  __int128 v58;
  __int128 v59;
  SEL sel[2];
  uint64_t v61;
  const __CFString *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint8_t buf[4];
  const char *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v59 = 0u;
  *(_OWORD *)sel = 0u;
  v58 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v58) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: upgradePhotoLibraryDatabaseWithOptions:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v58 + 1);
    *((_QWORD *)&v58 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v59 + 8));
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "libraryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v15, &v57);
  if (v57)
    v17 = v16;
  else
    v17 = 0;

  if (!v17)
  {
    PLLibraryServicesGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "path");
      v28 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v68 = v28;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Unable to upgrade photo library because it does not exist at path %@.", buf, 0xCu);

    }
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v63 = *MEMORY[0x1E0CB2AA0];
    objc_msgSend(v14, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41015, v30);
    v26 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
    if (v26)
      goto LABEL_22;
    goto LABEL_17;
  }
  v18 = (void *)MEMORY[0x1E0D73280];
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = objc_msgSend(v18, "shouldAutoUpgradeWellKnownPhotoLibraryIdentifier:", objc_msgSend(v19, "wellKnownPhotoLibraryIdentifier"));

  if ((v18 & 1) == 0
    && !-[PLAssetsdConnectionAuthorization isClientAuthorizedForLibraryUpgrade](self->_connectionAuthorization, "isClientAuthorizedForLibraryUpgrade"))
  {
    -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.migrationpluginwrapper"));

    if ((v21 & 1) == 0)
    {
      PLLibraryServicesGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v23;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Denying upgrade request from %{public}@. Only certain clients are allowed to upgrade the library.", buf, 0xCu);

      }
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v65 = *MEMORY[0x1E0CB3308];
      v66 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41005, v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
LABEL_17:
  -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v32, "setUpgradeClient:", v31);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryCreateOptions"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v32) = objc_msgSend(v33, "unsignedIntegerValue");

  if ((v32 & 4) != 0)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "pathManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "setSqliteErrorForRebuildReason:allowsExit:", 10, 0);
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "libraryBundle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (void *)MEMORY[0x1E0CB35C8];
    v61 = *MEMORY[0x1E0CB2D50];
    v62 = CFSTR("client requested library rebuild");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41020, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_assetsdService);
    objc_msgSend(v43, "unbindAssetsdService:", WeakRetained);
    -[PLPhotoLibraryBundleController shutdownBundle:reason:](self->_libraryBundleController, "shutdownBundle:reason:", v43, v46);
    v7[2](v7, 0, v46);
    objc_msgSend(WeakRetained, "invalidateConnectionWithReason:", v46);

    v26 = 0;
    v39 = 0;
    goto LABEL_23;
  }
  v34 = -[PLLibraryOpenerCreationOptions initWithOptionsDictionary:connectionAuthorization:]([PLLibraryOpenerCreationOptions alloc], "initWithOptionsDictionary:connectionAuthorization:", v6, self->_connectionAuthorization);
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setCreateMode:options:", 0, v34);

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v37 = objc_msgSend(v36, "activate:", &v56);
  v26 = v56;

  if (v37)
  {
    objc_initWeak((id *)buf, self);
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __72__PLAssetsdLibraryService_upgradePhotoLibraryDatabaseWithOptions_reply___block_invoke;
    v53[3] = &unk_1E3674BC8;
    objc_copyWeak(&v55, (id *)buf);
    v53[4] = self;
    v54 = v7;
    objc_msgSend(v38, "awaitLibraryState:completionHandler:", 7, v53);

    objc_destroyWeak(&v55);
    objc_destroyWeak((id *)buf);

    -[PLAssetsdLibraryService _preRunningProgress](self, "_preRunningProgress");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }

LABEL_22:
  -[PLAssetsdLibraryService _sendClientReply:sandboxExtensionsByPath:error:](self, "_sendClientReply:sandboxExtensionsByPath:error:", v7, 0, v26);
  v39 = 0;
LABEL_23:

  if ((_BYTE)v58)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v59 + 8));
  if ((_QWORD)v59)
  {
    PLRequestGetLog();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = v48;
    v50 = v59;
    if ((unint64_t)(v59 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v68 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v49, OS_SIGNPOST_INTERVAL_END, v50, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
  return v39;
}

- (id)_preRunningProgress
{
  void *v3;
  void *v4;
  void *v5;

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preRunningProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdLibraryService _returnValueForProgress:addTo:](self, "_returnValueForProgress:addTo:", v4, self->_preRunningProgressFollowers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)getPhotoLibraryStoreXPCListenerEndpointWithReply:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  char v6;
  id v7;
  int v8;
  os_activity_t v9;
  void *v10;
  PLXPCPhotoLibraryStoreContainer *xpcPhotoLibraryStoreContainer;
  void *v12;
  void *v13;
  PLXPCPhotoLibraryStoreContainer *v14;
  PLXPCPhotoLibraryStoreContainer *v15;
  char *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  const char *Name;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v6 = objc_msgSend(v5, "awaitLibraryState:error:", 7, &v29);
  v7 = v29;

  if ((v6 & 1) != 0)
  {
    v27 = 0u;
    *(_OWORD *)sel = 0u;
    v26 = 0u;
    v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
    LOBYTE(v26) = v8;
    if (v8)
    {
      v9 = _os_activity_create(&dword_199541000, "PLXPC Service: getPhotoLibraryStoreXPCListenerEndpointWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      v10 = (void *)*((_QWORD *)&v26 + 1);
      *((_QWORD *)&v26 + 1) = v9;

      os_activity_scope_enter(*((os_activity_t *)&v26 + 1), (os_activity_scope_state_t)((char *)&v27 + 8));
    }
    xpcPhotoLibraryStoreContainer = self->_xpcPhotoLibraryStoreContainer;
    if (!xpcPhotoLibraryStoreContainer)
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[PLXPCPhotoLibraryStoreContainer newContainerWithPathManager:connectionAuthorization:](PLXPCPhotoLibraryStoreContainer, "newContainerWithPathManager:connectionAuthorization:", v13, self->_connectionAuthorization);
      v15 = self->_xpcPhotoLibraryStoreContainer;
      self->_xpcPhotoLibraryStoreContainer = v14;

      xpcPhotoLibraryStoreContainer = self->_xpcPhotoLibraryStoreContainer;
    }
    -[PLXPCPhotoLibraryStoreContainer listenerEndpoint](xpcPhotoLibraryStoreContainer, "listenerEndpoint", (_QWORD)v26);
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    PLGatekeeperXPCGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pathManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[PLAssetsdConnectionAuthorization clientProcessIdentifier](self->_connectionAuthorization, "clientProcessIdentifier");
      *(_DWORD *)buf = 134218754;
      v31 = v16;
      v32 = 2112;
      v33 = v19;
      v34 = 2112;
      v35 = v20;
      v36 = 1024;
      v37 = v21;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Vending XPC store endpoint %p for %@ to %@[%d]", buf, 0x26u);

    }
    v4[2](v4, v16);

    if ((_BYTE)v26)
      os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
    if ((_QWORD)v27)
    {
      PLRequestGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        Name = sel_getName(sel[1]);
        *(_DWORD *)buf = 136446210;
        v31 = Name;
        _os_signpost_emit_with_name_impl(&dword_199541000, v23, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
      }

    }
  }
  else
  {
    PLBackendGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "LibraryServicesManager is not running", (uint8_t *)&v26, 2u);
    }

    v4[2](v4, 0);
  }

}

- (id)importFileSystemAssetsWithReason:(id)a3 force:(BOOL)a4 reply:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *Name;
  _QWORD v28[4];
  id v29;
  void (**v30)(_QWORD);
  id v31;
  __int128 v32;
  __int128 v33;
  SEL sel[2];
  uint8_t buf[4];
  const char *v36;
  uint64_t v37;

  v6 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  v33 = 0u;
  *(_OWORD *)sel = 0u;
  v32 = 0u;
  v10 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v32) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199541000, "PLXPC Service: importFileSystemAssetsWithReason:force:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v32 + 1);
    *((_QWORD *)&v32 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLAssetsdLibraryService importFileSystemAssetsWithReason:force:reply:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v15 = objc_msgSend(v14, "awaitLibraryState:error:", 6, &v31);
  v16 = v31;

  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "becomeCurrentWithPendingUnitCount:", objc_msgSend(v17, "totalUnitCount"));
    if (v6)
    {
      v18 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryService importFileSystemAssetsWithReason:force:reply:]");
      objc_msgSend(v18, "globalValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setImportFilesystemAssetsState:", -1);

    }
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "modelMigrator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __72__PLAssetsdLibraryService_importFileSystemAssetsWithReason_force_reply___block_invoke;
    v28[3] = &unk_1E3674BF0;
    v29 = v13;
    v30 = v9;
    objc_msgSend(v21, "loadFileSystemDataIntoDatabaseIfNeededWithReason:completionHandler:", v8, v28);

  }
  else
  {
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "LibraryServicesManager cannot get to the PreparingAccessible state", buf, 2u);
    }

    v9[2](v9);
    v17 = 0;
  }

  if ((_BYTE)v32)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  if ((_QWORD)v33)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v36 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
  return v17;
}

- (void)recoverFromCrashIfNeeded
{
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  const char *Name;
  id v17;
  __int128 v18;
  __int128 v19;
  SEL sel[2];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  *(_OWORD *)sel = 0u;
  v18 = 0u;
  v3 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v18) = v3;
  if (v3)
  {
    v4 = _os_activity_create(&dword_199541000, "PLXPC Service: recoverFromCrashIfNeeded", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v5 = (void *)*((_QWORD *)&v18 + 1);
    *((_QWORD *)&v18 + 1) = v4;

    os_activity_scope_enter(v4, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v7 = objc_msgSend(v6, "awaitLibraryState:error:", 6, &v17);
  v8 = v17;

  if ((v7 & 1) != 0)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWriter");
    v10 = objc_claimAutoreleasedReturnValue();

    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "crashRecoverySupport");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "recoverFromCrashIfNeededWithImageWriter:", v10);
  }
  else
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "LibraryServicesManager cannot get to the PreparingAccessible state", buf, 2u);
    }
  }

  if ((_BYTE)v18)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  if ((_QWORD)v19)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
}

- (void)repairSingletonObjectsWithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  const char *Name;
  id v19;
  __int128 v20;
  __int128 v21;
  SEL sel[2];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v20 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v20) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: repairSingletonObjectsWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v20 + 1);
    *((_QWORD *)&v20 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v9 = objc_msgSend(v8, "awaitLibraryState:error:", 6, &v19);
  v10 = v19;

  if ((v9 & 1) != 0)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modelMigrator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "repairSingletonObjectsInDatabase");

    if (!v4)
      goto LABEL_10;
    v13 = 0;
  }
  else
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "LibraryServicesManager cannot get to the PreparingAccessible state", buf, 2u);
    }

    v13 = v10;
  }
  ((void (**)(id, uint64_t, id))v4)[2](v4, v9, v13);
LABEL_10:

  if ((_BYTE)v20)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  if ((_QWORD)v21)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
}

- (void)resetFaceAnalysisWithResetLevel:(int64_t)a3 withReply:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  const char *Name;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  PLAssetsdLibraryService *v25;
  id v26;
  int64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  SEL sel[2];
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v30 = 0u;
  *(_OWORD *)sel = 0u;
  v29 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v29) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199541000, "PLXPC Service: resetFaceAnalysisWithResetLevel:withReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v29 + 1);
    *((_QWORD *)&v29 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v11 = objc_msgSend(v10, "awaitLibraryState:error:", 6, &v28);
  v12 = v28;

  if ((v11 & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0D73258];
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __69__PLAssetsdLibraryService_resetFaceAnalysisWithResetLevel_withReply___block_invoke;
    v24 = &unk_1E3674C40;
    v25 = self;
    v27 = a3;
    v26 = v6;
    objc_msgSend(v13, "operationWithName:requiredState:parentProgress:execution:", CFSTR("Reset Face Analysis"), 7, 0, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", v21, v22, v23, v24, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "enqueueOperation:error:", v14, 0);

  }
  else
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "LibraryServicesManager cannot get to the PreparingAccessible state", buf, 2u);
    }

    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v12);
  }

  if ((_BYTE)v29)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  if ((_QWORD)v30)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
}

- (void)updateThumbnailsForPhotos:(id)a3 assignNewIndex:(BOOL)a4 forceRefresh:(BOOL)a5 reply:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  const char *Name;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  BOOL v34;
  BOOL v35;
  id v36;
  __int128 v37;
  __int128 v38;
  SEL sel[2];
  uint8_t buf[4];
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(_QWORD))a6;
  v38 = 0u;
  *(_OWORD *)sel = 0u;
  v37 = 0u;
  v12 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v37) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199541000, "PLXPC Service: updateThumbnailsForPhotos:assignNewIndex:forceRefresh:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v37 + 1);
    *((_QWORD *)&v37 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v38 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v16 = objc_msgSend(v15, "awaitLibraryState:error:", 6, &v36);
  v17 = v36;

  if ((v16 & 1) != 0)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "databaseContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryService updateThumbnailsForPhotos:assignNewIndex:forceRefresh:reply:]");

    objc_msgSend(v20, "managedObjectContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "persistentStoreCoordinator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __87__PLAssetsdLibraryService_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_reply___block_invoke;
    v30[3] = &unk_1E3674C68;
    v31 = v10;
    v23 = v22;
    v32 = v23;
    v24 = v20;
    v33 = v24;
    v34 = a5;
    v35 = a4;
    objc_msgSend(v24, "performTransaction:completionHandler:", v30, v11);

  }
  else
  {
    PLBackendGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "LibraryServicesManager cannot get to the PreparingAccessible state", buf, 2u);
    }

    v11[2](v11);
  }

  if ((_BYTE)v37)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v38 + 8));
  if ((_QWORD)v38)
  {
    PLRequestGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = v38;
    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v41 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
}

- (void)automaticallyDeleteEmptyAlbumWithObjectURI:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  const char *Name;
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
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v29 = 0u;
  *(_OWORD *)sel = 0u;
  v28 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v28) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: automaticallyDeleteEmptyAlbumWithObjectURI:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v28 + 1);
    *((_QWORD *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v12 = objc_msgSend(v11, "awaitLibraryState:error:", 7, &v27);
  v13 = v27;

  if ((v12 & 1) != 0)
  {
    -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "persistentStoreCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "managedObjectIDForURIRepresentation:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "imageWriter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "enqueueAutoDeleteEmptyAlbumJobWithAlbumID:", v16);

      v7[2](v7, 1, 0);
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = CFSTR("Invalid album object URI");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v22);

    }
  }
  else
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "LibraryServicesManager cannot get to the Running state", buf, 2u);
    }

    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v13);
  }

  if ((_BYTE)v28)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  if ((_QWORD)v29)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
}

- (void)publishRemoteChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLAssetsdLibraryService libraryBundle](self, "libraryBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "changeHandlingContainer");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "object");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "publishRemoteChangeEvent:delayedSaveActionsDetail:reply:", v12, v9, v8);
}

- (id)libraryBundle
{
  void *v2;
  void *v3;

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)transferAssetsWithUuids:(id)a3 fromLibraryURL:(id)a4 transferOptions:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id);
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  const char *Name;
  id v30;
  __int128 v31;
  __int128 v32;
  SEL sel[2];
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id))a6;
  v32 = 0u;
  *(_OWORD *)sel = 0u;
  v31 = 0u;
  v14 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v31) = v14;
  if (v14)
  {
    v15 = _os_activity_create(&dword_199541000, "PLXPC Service: transferAssetsWithUuids:fromLibraryURL:transferOptions:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v16 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  objc_msgSend(MEMORY[0x1E0D73250], "sharedBookmarkManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "url");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v17, "URLFromClientLibraryURL:sandboxExtension:error:", v18, 0, &v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v30;

  if (v19)
  {
    +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "openBundleAtLibraryURL:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLAssetsdLibraryService libraryBundle](self, "libraryBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transferAssets:toBundle:options:completion:", v10, v23, v12, v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13[2](v13, v20);
    v24 = 0;
  }

  if ((_BYTE)v31)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  if ((_QWORD)v32)
  {
    PLRequestGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
  return v24;
}

- (id)transferPersonsWithUuids:(id)a3 fromLibraryURL:(id)a4 transferOptions:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id);
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  const char *Name;
  id v30;
  __int128 v31;
  __int128 v32;
  SEL sel[2];
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id))a6;
  v32 = 0u;
  *(_OWORD *)sel = 0u;
  v31 = 0u;
  v14 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v31) = v14;
  if (v14)
  {
    v15 = _os_activity_create(&dword_199541000, "PLXPC Service: transferPersonsWithUuids:fromLibraryURL:transferOptions:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v16 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  objc_msgSend(MEMORY[0x1E0D73250], "sharedBookmarkManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "url");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v17, "URLFromClientLibraryURL:sandboxExtension:error:", v18, 0, &v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v30;

  if (v19)
  {
    +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "openBundleAtLibraryURL:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLAssetsdLibraryService libraryBundle](self, "libraryBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transferPersons:toBundle:options:completion:", v10, v23, v12, v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13[2](v13, v20);
    v24 = 0;
  }

  if ((_BYTE)v31)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  if ((_QWORD)v32)
  {
    PLRequestGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
  return v24;
}

- (id)resetPersonsWithReply:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const char *Name;
  __int128 v14;
  char v15;
  __int128 v16;
  SEL sel[2];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  *(_OWORD *)sel = 0u;
  v14 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v14) = v5;
  if (v5)
  {
    *((_QWORD *)&v14 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: resetPersonsWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryService resetPersonsWithReply:]");

  +[PLPerson resetAllInLibrary:completion:](PLPerson, "resetAllInLibrary:completion:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  if ((_QWORD)v16)
  {
    PLRequestGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
  return v9;
}

- (id)resetSocialGroupsWithReply:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const char *Name;
  __int128 v14;
  char v15;
  __int128 v16;
  SEL sel[2];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  *(_OWORD *)sel = 0u;
  v14 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v14) = v5;
  if (v5)
  {
    *((_QWORD *)&v14 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: resetSocialGroupsWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager", (_QWORD)v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryService resetSocialGroupsWithReply:]");

  +[PLSocialGroup resetAllInLibrary:completion:](PLSocialGroup, "resetAllInLibrary:completion:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  if ((_QWORD)v16)
  {
    PLRequestGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }

  }
  return v9;
}

- (void)proxyLockFileWithDatabasePath:(id)a3 reply:(id)a4
{
  void *v5;
  void (**v6)(id, id);
  id v7;

  v5 = (void *)MEMORY[0x1E0D73208];
  v6 = (void (**)(id, id))a4;
  objc_msgSend(v5, "proxyLockFilePathForDatabasePath:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (void)searchDonationProgressForTaskIDs:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  const char *Name;
  _QWORD v33[4];
  id v34;
  __int128 *v35;
  uint64_t *v36;
  _QWORD v37[4];
  NSObject *v38;
  __int128 *v39;
  uint64_t *v40;
  _QWORD v41[4];
  NSObject *v42;
  __int128 *p_buf;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  __int128 v50;
  __int128 v51;
  SEL sel[2];
  uint64_t v53;
  const __CFString *v54;
  __int128 buf;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v51 = 0u;
  *(_OWORD *)sel = 0u;
  v50 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v50) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: searchDonationProgressForTaskIDs:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v50 + 1);
    *((_QWORD *)&v50 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v51 + 8));
  }
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__92180;
  v58 = __Block_byref_object_dispose__92181;
  v59 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__92180;
  v48 = __Block_byref_object_dispose__92181;
  v49 = 0;
  v12 = objc_msgSend(v6, "count");
  v13 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    if (v12 == 1)
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "searchDonationProgress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntegerValue");
      v41[0] = v13;
      v41[1] = 3221225472;
      v41[2] = __66__PLAssetsdLibraryService_searchDonationProgressForTaskIDs_reply___block_invoke;
      v41[3] = &unk_1E3674C90;
      p_buf = &buf;
      v42 = v11;
      objc_msgSend(v15, "donationProgressForMediaProcessingTaskID:completionHandler:", v17, v41);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v45[5];
      v45[5] = v18;

      v20 = v42;
    }
    else
    {
      -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "searchDonationProgress");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v13;
      v37[1] = 3221225472;
      v37[2] = __66__PLAssetsdLibraryService_searchDonationProgressForTaskIDs_reply___block_invoke_2;
      v37[3] = &unk_1E3674CB8;
      v39 = &buf;
      v40 = &v44;
      v38 = v11;
      v26 = (id)objc_msgSend(v25, "donationProgressForMediaProcessingTaskIDs:completionHandler:", v6, v37);

      v20 = v38;
    }
  }
  else
  {
    dispatch_group_leave(v11);
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v53 = *MEMORY[0x1E0CB2938];
    v54 = CFSTR("No taskIDs provided");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v20);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v22;

  }
  v27 = dispatch_queue_create("-[PLAssetsdLibraryService searchDonationProgressForTaskIDs:reply:]", 0);
  v33[0] = v13;
  v33[1] = 3221225472;
  v33[2] = __66__PLAssetsdLibraryService_searchDonationProgressForTaskIDs_reply___block_invoke_3;
  v33[3] = &unk_1E3674CE0;
  v28 = v7;
  v34 = v28;
  v35 = &buf;
  v36 = &v44;
  dispatch_group_notify(v11, v27, v33);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v50)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v51 + 8));
  if ((_QWORD)v51)
  {
    PLRequestGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = v51;
    if ((unint64_t)(v51 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetsdService);
  objc_storeStrong((id *)&self->_libraryBundleController, 0);
  objc_storeStrong((id *)&self->_postRunningProgressFollowers, 0);
  objc_storeStrong((id *)&self->_preRunningProgressFollowers, 0);
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
  objc_storeStrong((id *)&self->_xpcPhotoLibraryStoreContainer, 0);
}

void __66__PLAssetsdLibraryService_searchDonationProgressForTaskIDs_reply___block_invoke(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __66__PLAssetsdLibraryService_searchDonationProgressForTaskIDs_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (!v6)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v7);
          objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "completedUnitCount");
          if (v15 <= objc_msgSend(v14, "totalUnitCount"))
            v16 = objc_msgSend(v14, "completedUnitCount");
          else
            v16 = objc_msgSend(v14, "totalUnitCount");
          v11 += v16;
          v10 += objc_msgSend(v14, "totalUnitCount");

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", v10);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setCompletedUnitCount:", v11);
    v5 = v20;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __66__PLAssetsdLibraryService_searchDonationProgressForTaskIDs_reply___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t, uint64_t, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) == 0, objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "completedUnitCount"), objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "totalUnitCount"), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
}

void __87__PLAssetsdLibraryService_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_reply___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "managedObjectIDForURIRepresentation:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v2, "addObject:", v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v5);
  }

  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v2)
    v10 = v2;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setIncludesPendingChanges:", 1);
  v32 = (void *)v11;
  objc_msgSend(v14, "setPredicate:", v11);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSortDescriptors:", v16);

  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v31 = v14;
  objc_msgSend(v17, "executeFetchRequest:error:", v14, &v37);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v37;

  if (v19)
  {
    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v19;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Fetch for repair assets failed with error %@", buf, 0xCu);
    }

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = v18;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        if (*(_BYTE *)(a1 + 56))
        {
          objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "refreshObject:mergeChanges:", v26, objc_msgSend(v26, "hasChanges"));

        }
        objc_msgSend(v26, "filename");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = objc_msgSend(v26, "effectiveThumbnailIndex");
          if (*(_BYTE *)(a1 + 57) || (v30 = v29, v29 == 0x7FFFFFFFFFFFFFFFLL))
            v30 = +[PLThumbnailIndexes nextAvailableThumbnailIndexInLibrary:](PLThumbnailIndexes, "nextAvailableThumbnailIndexInLibrary:", *(_QWORD *)(a1 + 48));
          objc_msgSend(v26, "setEffectiveThumbnailIndex:", v30);
          objc_msgSend(v26, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, 0, 0, 0);
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v23);
  }

}

void __69__PLAssetsdLibraryService_resetFaceAnalysisWithResetLevel_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryService resetFaceAnalysisWithResetLevel:withReply:]_block_invoke");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PLAssetsdLibraryService_resetFaceAnalysisWithResetLevel_withReply___block_invoke_2;
  v5[3] = &unk_1E3674C18;
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  objc_msgSend(v4, "performBlockAndWait:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __69__PLAssetsdLibraryService_resetFaceAnalysisWithResetLevel_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLModelMigrator performFaceAnalysisResetWithResetLevel:pathManager:context:](PLModelMigrator, "performFaceAnalysisResetWithResetLevel:pathManager:context:", v2, v4, v3);

}

uint64_t __72__PLAssetsdLibraryService_importFileSystemAssetsWithReason_force_reply___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stillAlive");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72__PLAssetsdLibraryService_upgradePhotoLibraryDatabaseWithOptions_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sandboxExtensionsByPathForLibraryAccessRole:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    objc_msgSend(WeakRetained, "_sendClientReply:sandboxExtensionsByPath:error:", *(_QWORD *)(a1 + 40), 0, v8);
  }

}

@end
