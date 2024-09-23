@implementation PLAssetsdLibraryManagementService

+ (void)setPhotosXPCEndpoint:(id)a3
{
  objc_storeStrong((id *)&PLPhotosXPCEndpoint, a3);
}

- (PLAssetsdLibraryManagementService)initWithConnectionAuthorization:(id)a3 bundleController:(id)a4
{
  id v7;
  id v8;
  PLAssetsdLibraryManagementService *v9;
  PLAssetsdLibraryManagementService *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLAssetsdLibraryManagementService;
  v9 = -[PLAssetsdLibraryManagementService init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectionAuthorization, a3);
    objc_storeStrong((id *)&v10->_bundleController, a4);
  }

  return v10;
}

- (void)setSystemPhotoLibraryURL:(id)a3 sandboxExtension:(id)a4 options:(unsigned __int16)a5 reply:(id)a6
{
  uint64_t v7;
  id v9;
  void (**v10)(id, id);
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  os_log_type_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  char *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  os_signpost_id_t v52;
  const char *Name;
  uint64_t v54;
  id v55;
  char v56;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  SEL sel[2];
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;
  const __CFString *v73;
  uint64_t v74;
  const __CFString *v75;
  uint64_t v76;
  _QWORD v77[3];

  v7 = a5;
  v77[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v58 = a4;
  v10 = (void (**)(id, id))a6;
  v64 = 0u;
  *(_OWORD *)sel = 0u;
  v63 = 0u;
  v11 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v63) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199541000, "PLXPC Service: setSystemPhotoLibraryURL:sandboxExtension:options:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v63 + 1);
    *((_QWORD *)&v63 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v64 + 8));
  }
  objc_msgSend(MEMORY[0x1E0D73288], "systemLibraryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 3) == 2)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0D73288], "systemLibraryURL");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v15 = 0;
      v56 = 1;
      if (!v14)
        goto LABEL_32;
LABEL_24:
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "fileExistsAtPath:", v27);

      if (v28)
      {
        if (+[PLCacheDeleteSupport clearPurgeableFlagsForAllResourcesInPhotoLibraryURL:](PLCacheDeleteSupport, "clearPurgeableFlagsForAllResourcesInPhotoLibraryURL:", v14))
        {
          PLBackendGetLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v67 = (const char *)v14;
            v30 = "Cleared purgeable flags for %@";
            v31 = v29;
            v32 = OS_LOG_TYPE_DEFAULT;
LABEL_30:
            _os_log_impl(&dword_199541000, v31, v32, v30, buf, 0xCu);
          }
        }
        else
        {
          PLBackendGetLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v67 = (const char *)v14;
            v30 = "Failed to clear purgeable flags for %@";
            v31 = v29;
            v32 = OS_LOG_TYPE_ERROR;
            goto LABEL_30;
          }
        }

      }
LABEL_32:
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v72 = *MEMORY[0x1E0CB2D68];
      v73 = CFSTR("User is changing the system photo library");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41019, v34);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = os_transaction_create();
      if (v14)
      {
        -[PLPhotoLibraryBundleController openBundleAtLibraryURL:](self->_bundleController, "openBundleAtLibraryURL:", v14, v54);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "invalidateClientConnectionsWithReason:", v22);
        objc_msgSend(v35, "libraryServicesManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v37 = objc_msgSend(v36, "willBecomeNonSyncablePhotoLibrary:", &v61);
        v38 = (char *)v61;

        if ((v37 & 1) == 0)
        {
          PLBackendGetLog();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v67 = (const char *)v14;
            v68 = 2112;
            v69 = v38;
            _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "SPL Change: failed to prepare previous SPL %@ to become non-SPL: %@", buf, 0x16u);
          }

          objc_msgSend(v35, "clearInvalidateClientsReason");
          v35 = 0;
        }

      }
      else
      {
        v35 = 0;
      }
      if ((v56 & 1) != 0)
        goto LABEL_49;
      -[PLPhotoLibraryBundleController bundleForLibraryURL:](self->_bundleController, "bundleForLibraryURL:", v21);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        PLBackendGetLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v21;
          _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_DEFAULT, "SPL Change: Shutting down library for restart as new SPL at %@", buf, 0xCu);
        }

        -[PLPhotoLibraryBundleController shutdownBundle:reason:](self->_bundleController, "shutdownBundle:reason:", v40, v22);
      }

      if (v15
        || (v60 = 0,
            v42 = objc_msgSend(MEMORY[0x1E0D73288], "setSystemLibraryURL:options:error:", v21, v7, &v60),
            v15 = (char *)v60,
            !v42))
      {
LABEL_49:
        objc_msgSend(v35, "libraryServicesManager", v54);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "didRemainSyncablePhotoLibrary");
        v47 = 0;
      }
      else
      {
        PLBackendGetLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v67 = v21;
          v68 = 2112;
          v69 = (const char *)v14;
          _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_DEFAULT, "SPL Changed to: %@ from: %@", buf, 0x16u);
        }

        v44 = (void *)MEMORY[0x1E0D73288];
        objc_msgSend(v14, "path");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "recordPrevSystemLibraryPath:", v45);

        objc_msgSend(v35, "libraryServicesManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "didBecomeNonSyncablePhotoLibrary");
        v47 = 1;
      }

      if (v59)
      {
        objc_msgSend(MEMORY[0x1E0D73250], "sharedBookmarkManager");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "removeSSBForLibraryURL:", v59);

      }
      if ((v47 & 1) == 0)
      {
        PLBackendGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v67 = v15;
          v68 = 2112;
          v69 = v21;
          v70 = 2112;
          v71 = v14;
          _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "Unable to set the System Photo Library URL (error = %@) to %@ from %@", buf, 0x20u);
        }

      }
      objc_msgSend(v35, "clearInvalidateClientsReason", v54);
      v10[2](v10, v15);

      v9 = (id)v21;
      goto LABEL_57;
    }
    v9 = v9;
    v15 = 0;
    v59 = v9;
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D73208], "fileURL:isEqualToFileURL:", v9, v14))
    {
      v10[2](v10, 0);
      v15 = 0;
      goto LABEL_58;
    }
    v15 = 0;
    if (v9 && v58)
    {
      objc_msgSend(MEMORY[0x1E0D73250], "sharedBookmarkManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0;
      objc_msgSend(v16, "URLFromClientLibraryURL:sandboxExtension:error:", v9, v58, &v62);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v62;

      v15 = 0;
      if (!v17 && v18)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v76 = *MEMORY[0x1E0CB3388];
        v77[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41027, v20);
        v15 = (char *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v17 = (uint64_t)v9;
    }
    v21 = 0;
    if (!v17)
    {
      v56 = 1;
      v59 = 0;
      if (!v14)
        goto LABEL_32;
      goto LABEL_24;
    }
    v9 = (id)v17;
    v59 = 0;
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73280]), "initWithLibraryURL:", v9);
  if (!objc_msgSend(v22, "isAppLibraryPathManager"))
  {

    v56 = 0;
    v21 = (const char *)v9;
    if (!v14)
      goto LABEL_32;
    goto LABEL_24;
  }
  v23 = (void *)MEMORY[0x1E0CB35C8];
  v74 = *MEMORY[0x1E0CB2938];
  v75 = CFSTR("Cannot set an app library as the SPL");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41019, v24);
  v25 = objc_claimAutoreleasedReturnValue();

  v10[2](v10, (id)v25);
  v15 = (char *)v25;
LABEL_57:

LABEL_58:
  if ((_BYTE)v63)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v64 + 8));
  if ((_QWORD)v64)
  {
    PLRequestGetLog();
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v50;
    v52 = v64;
    if ((unint64_t)(v64 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v67 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v51, OS_SIGNPOST_INTERVAL_END, v52, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getActivePhotoLibrariesWithReply:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  int v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const char *Name;
  __int128 v10;
  char v11;
  __int128 v12;
  SEL sel[2];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  v12 = 0u;
  *(_OWORD *)sel = 0u;
  v10 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v10) = v5;
  if (v5)
  {
    *((_QWORD *)&v10 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: getActivePhotoLibrariesWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v12 + 8));
  }
  -[PLPhotoLibraryBundleController libraryBundlePaths](self->_bundleController, "libraryBundlePaths", (_QWORD)v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6, 0);

  if (v11)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v12 + 8));
  if ((_QWORD)v12)
  {
    PLRequestGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v15 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_INTERVAL_END, v12, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getPhotoLibraryURLsWithLibraryURL:(id)a3 reply:(id)a4
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
  void **v15;
  id v16;
  void *v17;
  id v18;
  PLAssetsdConnectionAuthorization *connectionAuthorization;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  const char *Name;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *, uint64_t, uint64_t);
  void *v36;
  id v37;
  __int128 *p_buf;
  __int128 v39;
  __int128 v40;
  SEL sel[2];
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46[3];

  v46[2] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v40 = 0u;
  *(_OWORD *)sel = 0u;
  v39 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v39) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_199541000, "PLXPC Service: getPhotoLibraryURLsWithLibraryURL:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)&v39 + 1);
    *((_QWORD *)&v39 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v40 + 8));
  }
  objc_msgSend(MEMORY[0x1E0D73288], "systemLibraryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__95587;
  v45 = __Block_byref_object_dispose__95588;
  v46[0] = 0;
  if (v11)
  {
    if ((objc_msgSend(v11, "isEqual:", v6) & 1) != 0)
    {
      -[PLPhotoLibraryBundleController libraryBundles](self->_bundleController, "libraryBundles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = MEMORY[0x1E0C809B0];
      v34 = 3221225472;
      v35 = __77__PLAssetsdLibraryManagementService_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke;
      v36 = &unk_1E3675F58;
      v37 = v12;
      p_buf = &buf;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v33);

      v14 = v37;
      goto LABEL_9;
    }
    v15 = (void **)(*((_QWORD *)&buf + 1) + 40);
  }
  else
  {
    v15 = v46;
  }
  v16 = v6;
  v14 = *v15;
  *v15 = v16;
LABEL_9:

  if (-[PLAssetsdConnectionAuthorization isClientAuthorizedForSandboxExtensions](self->_connectionAuthorization, "isClientAuthorizedForSandboxExtensions"))
  {
    objc_msgSend(MEMORY[0x1E0D73250], "sharedBookmarkManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v12)
    {
      connectionAuthorization = self->_connectionAuthorization;
      if (connectionAuthorization)
      {
        -[PLAssetsdConnectionAuthorization clientAuditToken](connectionAuthorization, "clientAuditToken");
      }
      else
      {
        v31 = 0u;
        v32 = 0u;
      }
      objc_msgSend(v12, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v17, "newSandboxExtensionDataForClient:path:writable:", &v31, v20, 0);

      if (v21)
        objc_msgSend(v18, "addObject:", v21);

    }
    v22 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v22)
    {
      if (self->_connectionAuthorization)
      {
        -[PLAssetsdConnectionAuthorization clientAuditToken](self->_connectionAuthorization, "clientAuditToken");
        v22 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      }
      else
      {
        v29 = 0u;
        v30 = 0u;
      }
      objc_msgSend(v22, "path", v29, v30, v31, v32, v33, v34, v35, v36);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v17, "newSandboxExtensionDataForClient:path:writable:", &v29, v23, 0);

      if (v24)
        objc_msgSend(v18, "addObject:", v24);

    }
  }
  else
  {
    v18 = 0;
  }
  (*((void (**)(id, void *, _QWORD, id, _QWORD))v7 + 2))(v7, v12, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v18, 0);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v39)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v40 + 8));
  if ((_QWORD)v40)
  {
    PLRequestGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = v40;
    if ((unint64_t)(v40 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_END, v27, "Cleared purgeable flags for %@", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)closePhotoLibraryAtURL:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
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
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  *(_OWORD *)sel = 0u;
  v12 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v12) = v8;
  if (v8)
  {
    *((_QWORD *)&v12 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: closePhotoLibraryAtURL:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  -[PLAssetsdLibraryManagementService _closePhotoLibraryAtURL:delete:reply:](self, "_closePhotoLibraryAtURL:delete:reply:", v6, 0, v7, (_QWORD)v12);
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
      _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v14, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)closeAndDeletePhotoLibraryAtURL:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  int v8;
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
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  *(_OWORD *)sel = 0u;
  v12 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v12) = v8;
  if (v8)
  {
    *((_QWORD *)&v12 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: closeAndDeletePhotoLibraryAtURL:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  -[PLAssetsdLibraryManagementService _closePhotoLibraryAtURL:delete:reply:](self, "_closePhotoLibraryAtURL:delete:reply:", v6, 1, v7, (_QWORD)v12);
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
      _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v14, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)resetSyndicationLibraryWithReply:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  const char *Name;
  _QWORD v13[4];
  id v14;
  PLAssetsdLibraryManagementService *v15;
  uint64_t *v16;
  __int128 *p_buf;
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30[3];

  v30[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v23) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_199541000, "PLXPC Service: resetSyndicationLibraryWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((_QWORD *)&v23 + 1);
    *((_QWORD *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__95587;
  v29 = __Block_byref_object_dispose__95588;
  v30[0] = 0;
  obj = 0;
  v8 = (void *)PLCreateShortLivedWellKnownPhotoLibrary(3, (uint64_t)"-[PLAssetsdLibraryManagementService resetSyndicationLibraryWithReply:]", &obj);
  objc_storeStrong(v30, obj);
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__PLAssetsdLibraryManagementService_resetSyndicationLibraryWithReply___block_invoke;
    v13[3] = &unk_1E3676348;
    v16 = &v19;
    p_buf = &buf;
    v14 = v8;
    v15 = self;
    objc_msgSend(v14, "performBlockAndWait:", v13);

  }
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *((unsigned __int8 *)v20 + 24), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v19, 8);
  if ((_BYTE)v23)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  if ((_QWORD)v24)
  {
    PLRequestGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(*((SEL *)&v25 + 1));
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v11, "Cleared purgeable flags for %@", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (BOOL)_validateClientPermissionsToCloseLibraryAtURL:(id)a3 delete:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D73280], "isSystemPhotoLibraryURL:", v8) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryIdentifierForURL:", v8))
  {
    v9 = 41005;
  }
  else
  {
    if (-[PLAssetsdConnectionAuthorization isClientEntitledForPhotoKitOrPrivatePhotosTCC](self->_connectionAuthorization, "isClientEntitledForPhotoKitOrPrivatePhotosTCC"))
    {
      v12 = 1;
      goto LABEL_7;
    }
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (v6)
        v15 = CFSTR("close and delete");
      else
        v15 = CFSTR("close");
      -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Cannot %{public}@ library, client %@ is missing required entitlements", (uint8_t *)&v17, 0x16u);

    }
    v9 = 41009;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a5)
    *a5 = objc_retainAutorelease(v10);

  v12 = 0;
LABEL_7:

  return v12;
}

- (void)_closePhotoLibraryAtURL:(id)a3 delete:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, id);
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void (**v22)(id, _QWORD, id);
  _BOOL4 v23;
  PLAssetsdLibraryManagementService *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  void *v36;
  _BOOL8 v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  _BYTE v54[18];
  __int16 v55;
  _BOOL4 v56;
  __int16 v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[2];

  v6 = a4;
  v60[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  v50 = 0;
  v10 = -[PLAssetsdLibraryManagementService _validateClientPermissionsToCloseLibraryAtURL:delete:error:](self, "_validateClientPermissionsToCloseLibraryAtURL:delete:error:", v8, v6, &v50);
  v11 = v50;
  if (!v10)
  {
    v9[2](v9, 0, v11);
    goto LABEL_35;
  }
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "openBundleAtLibraryURL:", v8);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v47)
  {
    PLBackendGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = (uint64_t)v8;
      _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "_closePhotoLibraryAtURL: No bundle found for libraryURL %@", buf, 0xCu);
    }

    if (!v6)
    {
      v45 = v12;
      v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3308]);
      objc_msgSend(v32, "setObject:forKeyedSubscript:", CFSTR("No bundle found for libraryURL"), *MEMORY[0x1E0CB2938]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41004, v32);
      v33 = objc_claimAutoreleasedReturnValue();
      v31 = 0;
LABEL_31:

      v29 = (void *)v33;
      v12 = v45;
      goto LABEL_32;
    }
    v46 = v8;
    v29 = 0;
    v31 = 1;
    goto LABEL_20;
  }
  objc_msgSend(v47, "libraryServicesManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v46 = v8;
  if (v6 && v13)
  {
    v49 = 0;
    v15 = objc_msgSend(v13, "disableiCPLForLibraryDeletionWithError:", &v49);
    v16 = v49;
    v17 = v16;
    if (!v15)
    {
      v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3308]);
      objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("Couldn't open library"), *MEMORY[0x1E0CB2938]);
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB3388]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      goto LABEL_19;
    }

  }
  if (v6)
    v18 = 41025;
  else
    v18 = 41029;
  v19 = (void *)MEMORY[0x1E0CB35C8];
  v20 = v8;
  v21 = v14;
  v22 = v9;
  v23 = v6;
  v6 = (_BOOL8)v12;
  v24 = self;
  v25 = v11;
  v26 = *MEMORY[0x1E0D74498];
  v59 = *MEMORY[0x1E0CB3308];
  v60[0] = v20;
  v44 = 1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  v11 = v25;
  self = v24;
  v12 = (void *)v6;
  LODWORD(v6) = v23;
  v9 = v22;
  v14 = v21;
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", v27, v18, v17);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shutdownBundle:reason:", v47, v28);
  v29 = 0;
LABEL_19:

  v31 = v44;
  if (!(_DWORD)v44)
  {
    v8 = v46;
    goto LABEL_32;
  }
LABEL_20:
  v8 = v46;
  if (v6)
  {
    v43 = v11;
    v45 = v12;
    PLBackendGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = -[PLAssetsdConnectionAuthorization clientProcessIdentifier](self->_connectionAuthorization, "clientProcessIdentifier");
      -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v52 = (uint64_t)v46;
      v53 = 1024;
      *(_DWORD *)v54 = v35;
      *(_WORD *)&v54[4] = 2114;
      *(_QWORD *)&v54[6] = v36;
      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Deleting photo library from file system at %@, requested by [%d] %{public}@", buf, 0x1Cu);

    }
    v48 = 0;
    v37 = +[PLPhotoLibraryOpener deleteLibraryFromFilesystemAtURL:error:](PLPhotoLibraryOpener, "deleteLibraryFromFilesystemAtURL:error:", v46, &v48);
    v32 = v48;
    objc_msgSend(MEMORY[0x1E0D73250], "sharedBookmarkManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "removeSSBForLibraryURL:", v46);

    v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v40 = v39;
    if (v46)
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v46, *MEMORY[0x1E0CB3308]);
    if (v32)
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0CB3388]);
    v11 = v43;
    v31 = v37;
    if (v37)
    {
      v33 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41026, v40);
      v33 = objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_31;
  }
LABEL_32:
  PLPhotosObjectLifecycleGetLog();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    v42 = objc_opt_class();
    *(_DWORD *)buf = 138413314;
    v52 = v42;
    v53 = 2048;
    *(_QWORD *)v54 = self;
    *(_WORD *)&v54[8] = 2112;
    *(_QWORD *)&v54[10] = v8;
    v55 = 1024;
    v56 = v6;
    v57 = 2112;
    v58 = v29;
    _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_DEBUG, "%@ %p _closePhotoLibraryURL:%@ delete:%d error:%@", buf, 0x30u);
  }

  v9[2](v9, v31, v29);
LABEL_35:

}

- (void)getPhotosXPCEndpointWithReply:(id)a3
{
  void (**v3)(id, uint64_t, id, _QWORD);
  int v4;
  id v5;
  NSObject *v6;
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
  v3 = (void (**)(id, uint64_t, id, _QWORD))a3;
  v11 = 0u;
  *(_OWORD *)sel = 0u;
  v10 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v10) = v4;
  if (v4)
  {
    *((_QWORD *)&v10 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: getPhotosXPCEndpointWithReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if (PLPhotosXPCEndpoint)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
    objc_msgSend(v5, "_setEndpoint:", PLPhotosXPCEndpoint);
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to get photos XPC endpoint when it's not set", buf, 2u);
    }

    v5 = 0;
  }
  v3[2](v3, 1, v5, 0);

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
      _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_INTERVAL_END, v11, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)filesystemSizeForLibraryURL:(id)a3 reply:(id)a4
{
  id v5;
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
  __int128 v19;
  __int128 v20;
  SEL sel[2];
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20 = 0u;
  *(_OWORD *)sel = 0u;
  v19 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v19) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199541000, "PLXPC Service: filesystemSizeForLibraryURL:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v19 + 1);
    *((_QWORD *)&v19 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v20 + 8));
  }
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lookupOrCreateBundleForLibraryURL:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__PLAssetsdLibraryManagementService_filesystemSizeForLibraryURL_reply___block_invoke;
  v17[3] = &unk_1E3675F80;
  v12 = v6;
  v18 = v12;
  objc_msgSend(v11, "calculateTotalSizeWithResult:", v17);

  if ((_BYTE)v19)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v20 + 8));
  if ((_QWORD)v20)
  {
    PLRequestGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v20;
    if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v23 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v15, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)getPhotoLibraryIdentifierWithLibraryURL:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, void *, id);
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
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
  v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v17) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199541000, "PLXPC Service: getPhotoLibraryIdentifierWithLibraryURL:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v17 + 1);
    *((_QWORD *)&v17 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  v16 = 0;
  +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:](PLPhotoLibraryIdentifier, "photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:", v5, 1, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  v6[2](v6, v10, v11);

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
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v14, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)findPhotoLibraryIdentifiersMatchingSearchCriteria:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, void *, id);
  int v7;
  NSObject *v8;
  void *v9;
  PLPhotoLibraryFinder *v10;
  void *v11;
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
  v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  v19 = 0u;
  *(_OWORD *)sel = 0u;
  v18 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v18) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_199541000, "PLXPC Service: findPhotoLibraryIdentifiersMatchingSearchCriteria:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((_QWORD *)&v18 + 1);
    *((_QWORD *)&v18 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  v10 = -[PLPhotoLibraryFinder initWithSearchCriteria:]([PLPhotoLibraryFinder alloc], "initWithSearchCriteria:", v5);
  v17 = 0;
  -[PLPhotoLibraryFinder findMatchingPhotoLibraryIdentifiersAndReturnError:](v10, "findMatchingPhotoLibraryIdentifiersAndReturnError:", &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  v6[2](v6, v11, v12);

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
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v15, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)createManagedPhotoLibraryWithOptions:(id)a3 sandboxExtension:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, PLLibraryOpenerCreationOptions *);
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  PLLibraryOpenerCreationOptions *v25;
  void *v26;
  PLLibraryOpenerCreationOptions *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  const char *Name;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  SEL sel[2];
  _QWORD v38[2];
  _QWORD v39[2];
  uint64_t v40;
  id v41;
  uint8_t buf[4];
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, PLLibraryOpenerCreationOptions *))a5;
  v36 = 0u;
  *(_OWORD *)sel = 0u;
  v35 = 0u;
  v11 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v35) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_199541000, "PLXPC Service: createManagedPhotoLibraryWithOptions:sandboxExtension:reply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((_QWORD *)&v35 + 1);
    *((_QWORD *)&v35 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryOpenerOptionsBundleURLKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryOpenerOptionsTestOptionsKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D74130]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v9 && v14)
  {
    objc_msgSend(MEMORY[0x1E0D73250], "sharedBookmarkManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v16, "URLFromClientLibraryURL:sandboxExtension:error:", v14, v9, &v34);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v34;

    if (v17 || !v18)
    {

    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB3388];
      v40 = *MEMORY[0x1E0CB3388];
      v41 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x1E0D74498];
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41027, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v38[0] = *MEMORY[0x1E0CB3308];
        v38[1] = v20;
        v39[0] = 0;
        v39[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", v22, 46018, v24);
        v25 = (PLLibraryOpenerCreationOptions *)objc_claimAutoreleasedReturnValue();

        v10[2](v10, 0, v25);
        goto LABEL_17;
      }
    }
  }
  else
  {
    v17 = v14;
  }
  v25 = -[PLLibraryOpenerCreationOptions initWithOptionsDictionary:connectionAuthorization:]([PLLibraryOpenerCreationOptions alloc], "initWithOptionsDictionary:connectionAuthorization:", v8, self->_connectionAuthorization);
  if (v25)
  {
    v33 = 0;
    +[PLPhotoLibraryOpener createManagedPhotoLibraryOnFilesystemWithOptions:error:](PLPhotoLibraryOpener, "createManagedPhotoLibraryOnFilesystemWithOptions:error:", v25, &v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (PLLibraryOpenerCreationOptions *)v33;
    objc_msgSend(v26, "libraryURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, PLLibraryOpenerCreationOptions *))v10)[2](v10, v28, v27);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46018, 0);
    v27 = (PLLibraryOpenerCreationOptions *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v27);
  }

LABEL_17:
  if ((_BYTE)v35)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  if ((_QWORD)v36)
  {
    PLRequestGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v43 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v30, OS_SIGNPOST_INTERVAL_END, v31, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleController, 0);
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

uint64_t __71__PLAssetsdLibraryManagementService_filesystemSizeForLibraryURL_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__PLAssetsdLibraryManagementService_resetSyndicationLibraryWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  PLPhotoLibraryOpener *v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id obj;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  v5 = PLResetSyndicationLibraryWithManagedObjectContext(v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lookupOrCreateBundleForLibraryURL:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    -[NSObject libraryServicesManager](v8, "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PLPhotoLibraryOpener initWithLibraryServicesManager:reportInProgressUpgrades:]([PLPhotoLibraryOpener alloc], "initWithLibraryServicesManager:reportInProgressUpgrades:", v9, 0);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v24 = *(id *)(v11 + 40);
    v12 = -[PLPhotoLibraryOpener openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:](v10, "openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:", 1, 0, &v24);
    objc_storeStrong((id *)(v11 + 40), v24);
    if (v12)
    {
      objc_msgSend(v9, "databaseContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryManagementService resetSyndicationLibraryWithReply:]_block_invoke");

      -[NSObject managedObjectContext](v14, "managedObjectContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject pathManager](v14, "pathManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAssetsdLibraryManagementService resetSyndicationLibraryWithReply:]_block_invoke");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v23 = *(id *)(v18 + 40);
      v19 = PLDeleteGuestAssetsInLibraryWithManagedObjectContext(v15, v16, v17, 0, &v23);
      objc_storeStrong((id *)(v18 + 40), v23);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v19;

    }
    else
    {
      PLSyndicationGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "resetSyndicationLibrary: failed to open system photo library %@", buf, 0xCu);
      }
    }

    objc_msgSend(v9, "backgroundJobService");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "signalBackgroundProcessingNeededOnBundle:", v8);

  }
  else
  {
    PLSyndicationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "resetSyndicationLibrary: failed with error %@", buf, 0xCu);
    }
  }

}

void __77__PLAssetsdLibraryManagementService_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "boundAssetsdServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__PLAssetsdLibraryManagementService_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke_2;
  v9[3] = &unk_1E3675F30;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  v12 = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __77__PLAssetsdLibraryManagementService_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = objc_msgSend(v10, "isPhotosClient");
  v7 = v10;
  if (v6)
  {
    objc_msgSend(v10, "libraryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    if (!v9 || (objc_msgSend(v9, "isEqual:", v8) & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
    *a4 = 1;
    **(_BYTE **)(a1 + 48) = 1;

    v7 = v10;
  }

}

@end
