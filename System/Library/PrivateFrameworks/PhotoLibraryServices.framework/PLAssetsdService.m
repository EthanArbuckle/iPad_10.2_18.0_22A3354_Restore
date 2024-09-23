@implementation PLAssetsdService

- (void)getLibraryServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerLibraryService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerLibraryService)
  {
    -[PLAssetsdService permissionsForLibraryService](self, "permissionsForLibraryService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForLibraryService](self, "requiredStateForLibraryService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __47__PLAssetsdService_getLibraryServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerLibraryService = self->_innerLibraryService;
    self->_innerLibraryService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerLibraryService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (id)permissionsForLibraryService
{
  PLAssetsdServicePermissions *v2;

  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 1);
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", MEMORY[0x1E0C9AA60]);
  return v2;
}

- (int64_t)requiredStateForLibraryService
{
  return +[PLAssetsdLibraryService requiredLibraryServicesStateForURL:](PLAssetsdLibraryService, "requiredLibraryServicesStateForURL:", self->_libraryURL);
}

- (void)getResourceInternalServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerResourceInternalService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerResourceInternalService)
  {
    -[PLAssetsdService permissionsForResourceInternalService](self, "permissionsForResourceInternalService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForResourceInternalService](self, "requiredStateForResourceInternalService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __56__PLAssetsdService_getResourceInternalServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerResourceInternalService = self->_innerResourceInternalService;
    self->_innerResourceInternalService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerResourceInternalService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (id)serviceContextWithSelector:(SEL)a3
{
  PLDefaultAssetsdServiceContext *v5;
  id WeakRetained;
  PLDefaultAssetsdServiceContext *v7;

  v5 = [PLDefaultAssetsdServiceContext alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v7 = -[PLDefaultAssetsdServiceContext initWithSelector:connection:libraryBundle:connectionAuthorization:](v5, "initWithSelector:connection:libraryBundle:connectionAuthorization:", a3, WeakRetained, self->_libraryBundle, self->_connectionAuthorization);

  return v7;
}

- (int64_t)requiredStateForResourceInternalService
{
  return 6;
}

- (id)permissionsForResourceInternalService
{
  PLAssetsdServicePermissions *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 0);
  v5[0] = *MEMORY[0x1E0D73468];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", v3);

  return v2;
}

- (void)bindToPhotoLibraryURL:(id)a3 sandboxExtension:(id)a4 clientOptions:(id)a5 withReply:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  PLPhotoLibraryBundle *v28;
  PLPhotoLibraryBundle *libraryBundle;
  void *v30;
  PLLibraryOpenerCreationOptions *v31;
  PLLibraryOpenerCreationOptions *v32;
  PLAssetsdXPCUserInfo *v33;
  id WeakRetained;
  id v35;
  id v36;
  void *v37;
  char v38;
  void *v39;
  uint64_t v40;
  int v41;
  id v42;
  PLPhotoLibraryBundleController *libraryBundleController;
  PLPhotoLibraryBundle *v44;
  BOOL v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  os_signpost_id_t v54;
  const char *Name;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  const char *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  SEL sel[2];
  uint64_t v70;
  const __CFString *v71;
  _QWORD v72[2];
  _QWORD v73[2];
  uint8_t buf[4];
  const char *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v63 = a4;
  v62 = a5;
  v11 = (void (**)(id, void *))a6;
  v68 = 0u;
  *(_OWORD *)sel = 0u;
  v67 = 0u;
  v12 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v67) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_199541000, "PLXPC Service: bindToPhotoLibraryURL:sandboxExtension:clientOptions:withReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((_QWORD *)&v67 + 1);
    *((_QWORD *)&v67 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v68 + 8));
  }
  objc_msgSend(MEMORY[0x1E0D73250], "sharedBookmarkManager");
  v66 = 0;
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "URLFromClientLibraryURL:sandboxExtension:error:", v10, v63, &v66);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v66;
  v65 = 0;
  objc_msgSend((id)objc_opt_class(), "autoCreateWellKnownPhotoLibraryIfNeededWithURL:wellKnownLibraryIdentifier:", v10, &v65);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;

    v15 = v18;
  }
  if (self->_libraryURL && (objc_msgSend(v15, "isEqual:") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdService.m"), 706, CFSTR("Cannot update _libraryURL %@ to %@ after it is assigned"), self->_libraryURL, v10);

  }
  if (((unint64_t)v65 & 0xFFFFFFFFFFFFFFFELL) != 2
    || -[PLAssetsdConnectionAuthorization clientIsSandboxed](self->_connectionAuthorization, "clientIsSandboxed")
    || -[PLAssetsdConnectionAuthorization photosDataVaultEntitled](self->_connectionAuthorization, "photosDataVaultEntitled"))
  {
    goto LABEL_62;
  }
  NSStringFromPLErrorCode();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB35C8];
  v21 = *MEMORY[0x1E0CB2938];
  v72[0] = *MEMORY[0x1E0CB3308];
  v72[1] = v21;
  v73[0] = v15;
  v73[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41030, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v75 = v65;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "bindToPhotoLibraryURL failed for well known library %td because client is not sanboxed and is missing the photos data vault entitlement", buf, 0xCu);
  }

  if (!v23)
  {
LABEL_62:
    if (self->_libraryBundle)
    {
      v23 = 0;
      goto LABEL_51;
    }
    if (v62)
    {
      objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E0D74318]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "BOOLValue");

      if (v26)
        -[PLAssetsdConnectionAuthorization setClientLimitedLibraryCapable:](self->_connectionAuthorization, "setClientLimitedLibraryCapable:", 1);
      objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E0D73418]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        -[PLAssetsdConnectionAuthorization setClientMainBundleSandboxedURL:](self->_connectionAuthorization, "setClientMainBundleSandboxedURL:", v27);

    }
    if (v15)
    {
      if (!-[PLAssetsdConnectionAuthorization photoKitEntitled](self->_connectionAuthorization, "photoKitEntitled")
        && !-[PLAssetsdConnectionAuthorization isClientAuthorizedForTCCServicePhotos](self->_connectionAuthorization, "isClientAuthorizedForTCCServicePhotos")&& !-[PLAssetsdConnectionAuthorization isClientAuthorizedForTCCServicePhotosAdd](self->_connectionAuthorization, "isClientAuthorizedForTCCServicePhotosAdd"))
      {
        v56 = (void *)MEMORY[0x1E0CB35C8];
        v70 = *MEMORY[0x1E0CB2D50];
        v71 = CFSTR("Unauthorized access: client does not have valid TCC authorization");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41011, v30);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_50;
      }
      objc_storeStrong((id *)&self->_libraryURL, v15);
      -[PLPhotoLibraryBundleController openBundleAtLibraryURL:](self->_libraryBundleController, "openBundleAtLibraryURL:", self->_libraryURL);
      v28 = (PLPhotoLibraryBundle *)objc_claimAutoreleasedReturnValue();
      libraryBundle = self->_libraryBundle;
      self->_libraryBundle = v28;

      -[PLPhotoLibraryBundle libraryServicesManager](self->_libraryBundle, "libraryServicesManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v31 = [PLLibraryOpenerCreationOptions alloc];
        v32 = -[PLLibraryOpenerCreationOptions initWithWellKnownLibraryIdentifier:](v31, "initWithWellKnownLibraryIdentifier:", v65);
        if (!v32)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdService.m"), 772, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("openerCreationOptions != nil"));

        }
        objc_msgSend(v30, "setCreateMode:options:", 1, v32);

      }
      v33 = -[PLAssetsdXPCUserInfo initWithLibraryServicesManager:]([PLAssetsdXPCUserInfo alloc], "initWithLibraryServicesManager:", v30);
      WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
      objc_msgSend(WeakRetained, "setUserInfo:", v33);

      if (v30)
      {
        v23 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      libraryBundleController = self->_libraryBundleController;
      v44 = self->_libraryBundle;
      v64 = 0;
      v45 = -[PLPhotoLibraryBundleController bindAssetsdService:toBundle:error:](libraryBundleController, "bindAssetsdService:toBundle:error:", self, v44, &v64);
      v46 = v64;
      v36 = v46;
      if (!v45)
      {
        v47 = v46;

        v23 = v47;
      }
      if (objc_msgSend(v30, "wellKnownPhotoLibraryIdentifier") == 1
        && !-[PLAssetsdConnectionAuthorization isClientEntitledForPhotoKitOrPrivatePhotosTCC](self->_connectionAuthorization, "isClientEntitledForPhotoKitOrPrivatePhotosTCC"))
      {
        objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "reportPhotosUseWithClientAuthorization:", self->_connectionAuthorization);

        objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "logPhotosAccessWithClientAuthorization:", self->_connectionAuthorization);

      }
LABEL_49:

LABEL_50:
      goto LABEL_51;
    }
    v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v30 = v35;
    if (v10)
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB3308]);
    v36 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    buf[0] = 0;
    objc_msgSend(v10, "path");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "fileExistsAtPath:isDirectory:", v37, buf);

    if ((v38 & 1) != 0)
    {
      objc_msgSend(v61, "domain");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *MEMORY[0x1E0D74498];
      v41 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0D74498]);

      if (v41)
      {
        v42 = v61;
LABEL_48:
        v23 = v42;
        goto LABEL_49;
      }
      if (v61)
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v61, *MEMORY[0x1E0CB3388]);
      v50 = (void *)MEMORY[0x1E0CB35C8];
      v51 = 41014;
    }
    else
    {
      v50 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0D74498];
      v51 = 41015;
    }
    objc_msgSend(v50, "errorWithDomain:code:userInfo:", v40, v51, v30);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_48;
  }
LABEL_51:
  -[PLPhotoLibraryBundle touch](self->_libraryBundle, "touch");
  v11[2](v11, v23);

  if ((_BYTE)v67)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v68 + 8));
  if ((_QWORD)v68)
  {
    PLRequestGetLog();
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = v52;
    v54 = v68;
    if ((unint64_t)(v68 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v75 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v53, OS_SIGNPOST_INTERVAL_END, v54, "failed to load photo library %{public}s with url %@, %@", "Connection opened for client with PID: %d, bundle ID: %@ at QoS: %{public}@", buf, 0xCu);
    }

  }
}

+ (id)autoCreateWellKnownPhotoLibraryIfNeededWithURL:(id)a3 wellKnownLibraryIdentifier:(int64_t *)a4
{
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  const char *v21;
  char *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  id v30;
  uint64_t v31;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAssetsdService.m"), 826, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outIdentifier"));

  }
  if ((objc_msgSend(MEMORY[0x1E0D73280], "isSystemPhotoLibraryURL:", v7) & 1) != 0)
  {
    v8 = 1;
    goto LABEL_6;
  }
  v8 = objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryIdentifierForURL:", v7);
  if (v8)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        PLStringFromWellKnownPhotoLibraryIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = (uint64_t)v14;
        v39 = 2112;
        v40 = v7;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ library directory exists at URL %@", buf, 0x16u);

      }
      v15 = 0;
      v16 = 0;
      goto LABEL_24;
    }
    if (v13)
    {
      PLStringFromWellKnownPhotoLibraryIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = (uint64_t)v17;
      v39 = 2112;
      v40 = v7;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Auto-creating %{public}@ at URL %@", buf, 0x16u);

    }
    objc_msgSend(v7, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v19 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v36);
    v16 = v36;

    if (v19)
    {
      v20 = objc_retainAutorelease(v7);
      objc_msgSend(v20, "fileSystemRepresentation");
      v21 = (const char *)sandbox_extension_issue_file_to_self();
      if (v21)
      {
        v22 = (char *)v21;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21, strlen(v21) + 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        free(v22);
        objc_msgSend(MEMORY[0x1E0D73250], "sharedBookmarkManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        objc_msgSend(v24, "URLFromClientLibraryURL:sandboxExtension:error:", v20, v23, &v35);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v35;
        if (v15)
        {

          *a4 = v8;
LABEL_24:
          v30 = v15;

          goto LABEL_25;
        }
        PLBackendGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = (uint64_t)v25;
          _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Auto-create library failed with resolutionError %@", buf, 0xCu);
        }

LABEL_23:
        v15 = 0;
        goto LABEL_24;
      }
      PLBackendGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v31 = objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation");
        *(_DWORD *)buf = 136315138;
        v38 = v31;
        v27 = "sandbox_extension_issue_file_to_self failed for path %s";
        v28 = v26;
        v29 = 12;
        goto LABEL_21;
      }
    }
    else
    {
      PLBackendGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v38 = (uint64_t)v7;
        v39 = 2112;
        v40 = v16;
        v27 = "Error creating directory at %@: %@";
        v28 = v26;
        v29 = 22;
LABEL_21:
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
      }
    }

    goto LABEL_23;
  }
  v30 = 0;
LABEL_25:

  return v30;
}

id __56__PLAssetsdService_getResourceInternalServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newResourceInternalService");
  else
    v3 = 0;

  return v3;
}

- (id)newResourceInternalService
{
  NSObject *v3;
  void *v4;
  PLAssetsdResourceInternalService *v5;
  void *v6;
  void *v7;
  PLAssetsdResourceInternalService *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdResourceInternalService for client: %@", (uint8_t *)&v10, 0xCu);

  }
  v5 = [PLAssetsdResourceInternalService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLAssetsdResourceInternalService initWithLibraryServicesManager:trustedCallerBundleID:](v5, "initWithLibraryServicesManager:trustedCallerBundleID:", v6, v7);

  return v8;
}

id __47__PLAssetsdService_getLibraryServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newLibraryService");
  else
    v3 = 0;

  return v3;
}

- (id)newLibraryService
{
  NSObject *v3;
  void *v4;
  PLAssetsdLibraryService *v5;
  void *v6;
  PLAssetsdLibraryService *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdLibraryService for client: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = [PLAssetsdLibraryService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLAssetsdLibraryService initWithLibraryServicesManager:bundleController:connectionAuthorization:assetsdService:](v5, "initWithLibraryServicesManager:bundleController:connectionAuthorization:assetsdService:", v6, self->_libraryBundleController, self->_connectionAuthorization, self);

  return v7;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return -[PLPhotoLibraryBundle libraryServicesManager](self->_libraryBundle, "libraryServicesManager");
}

id __51__PLAssetsdService_getDiagnosticsServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newDiagnosticsService");
  else
    v3 = 0;

  return v3;
}

- (int64_t)requiredStateForDiagnosticsService
{
  return 6;
}

- (id)permissionsForDiagnosticsService
{
  PLAssetsdServicePermissions *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 0);
  v5[0] = *MEMORY[0x1E0D73440];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", v3);

  return v2;
}

- (id)newDiagnosticsService
{
  NSObject *v3;
  void *v4;
  PLAssetsdDiagnosticsService *v5;
  void *v6;
  PLAssetsdDiagnosticsService *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdDiagnosticsService for client: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = [PLAssetsdDiagnosticsService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLAbstractLibraryServicesManagerService initWithLibraryServicesManager:](v5, "initWithLibraryServicesManager:", v6);

  return v7;
}

- (void)getDiagnosticsServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerDiagnosticsService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerDiagnosticsService)
  {
    -[PLAssetsdService permissionsForDiagnosticsService](self, "permissionsForDiagnosticsService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForDiagnosticsService](self, "requiredStateForDiagnosticsService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __51__PLAssetsdService_getDiagnosticsServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerDiagnosticsService = self->_innerDiagnosticsService;
    self->_innerDiagnosticsService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerDiagnosticsService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (PLAssetsdService)initWithConnection:(id)a3 libraryBundleController:(id)a4 daemonServices:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLAssetsdService *v11;
  PLAssetsdService *v12;
  PLAssetsdConnectionAuthorization *v13;
  PLAssetsdConnectionAuthorization *connectionAuthorization;
  id WeakRetained;
  PLCacheMetricsCollectorServerShell *v16;
  PLCacheMetricsCollectorServerShell *cacheMetricsShellObject;
  NSObject *v18;
  int remotePID;
  id v20;
  void *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PLAssetsdService;
  v11 = -[PLAssetsdService init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_connection, v8);
    objc_storeStrong((id *)&v12->_libraryBundleController, a4);
    v13 = -[PLAssetsdConnectionAuthorization initWithConnection:daemonServices:]([PLAssetsdConnectionAuthorization alloc], "initWithConnection:daemonServices:", v8, v10);
    connectionAuthorization = v12->_connectionAuthorization;
    v12->_connectionAuthorization = v13;

    WeakRetained = objc_loadWeakRetained((id *)&v12->_connection);
    v12->_remotePID = objc_msgSend(WeakRetained, "processIdentifier");

    v16 = objc_alloc_init(PLCacheMetricsCollectorServerShell);
    cacheMetricsShellObject = v12->_cacheMetricsShellObject;
    v12->_cacheMetricsShellObject = v16;

    PLGatekeeperXPCGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      remotePID = v12->_remotePID;
      v20 = objc_loadWeakRetained((id *)&v12->_connection);
      PLClientBundleIdentifierFromXPCConnection();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      qos_class_self();
      PLStringFromQoSClass();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v26 = remotePID;
      v27 = 2112;
      v28 = v21;
      v29 = 2114;
      v30 = v22;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Connection opened for client with PID: %d, bundle ID: %@ at QoS: %{public}@", buf, 0x1Cu);

    }
  }

  return v12;
}

- (BOOL)isPhotosClient
{
  return -[PLAssetsdConnectionAuthorization isPhotosClient](self->_connectionAuthorization, "isPhotosClient");
}

- (id)_photoLibrary
{
  void *v3;
  PLPhotoLibraryOptions *v4;
  PLPhotoLibraryBundle *libraryBundle;
  PLPhotoLibrary *v6;
  id v7;
  PLPhotoLibrary *photoLibrary;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->_photoLibrary)
  {
    -[PLAssetsdService libraryURL](self, "libraryURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = objc_alloc_init(PLPhotoLibraryOptions);
      -[PLPhotoLibraryOptions setRequiredState:](v4, "setRequiredState:", 6);
      -[PLPhotoLibraryOptions setAutomaticallyPinToFirstFetch:](v4, "setAutomaticallyPinToFirstFetch:", 0);
      libraryBundle = self->_libraryBundle;
      v12 = 0;
      v6 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", "-[PLAssetsdService _photoLibrary]", libraryBundle, v4, &v12);
      v7 = v12;
      photoLibrary = self->_photoLibrary;
      self->_photoLibrary = v6;

      if (!self->_photoLibrary)
      {
        PLBackendGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          -[PLAssetsdService libraryURL](self, "libraryURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446722;
          v14 = "-[PLAssetsdService _photoLibrary]";
          v15 = 2112;
          v16 = v10;
          v17 = 2112;
          v18 = v7;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);

        }
      }

    }
  }
  return self->_photoLibrary;
}

- (id)resourceDownloader
{
  PLAssetsdCPLResourceDownloader *resourceDownloader;
  PLAssetsdCPLResourceDownloader *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  PLAssetsdCPLResourceDownloader *v8;
  PLAssetsdCPLResourceDownloader *v9;

  resourceDownloader = self->_resourceDownloader;
  if (!resourceDownloader)
  {
    v4 = [PLAssetsdCPLResourceDownloader alloc];
    -[PLAssetsdService _photoLibrary](self, "_photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v8 = -[PLAssetsdCPLResourceDownloader initWithPhotoLibrary:trustedCallerBundleID:clientConnection:](v4, "initWithPhotoLibrary:trustedCallerBundleID:clientConnection:", v5, v6, WeakRetained);
    v9 = self->_resourceDownloader;
    self->_resourceDownloader = v8;

    resourceDownloader = self->_resourceDownloader;
  }
  return resourceDownloader;
}

- (NSString)description
{
  void *v2;
  PLAssetsdConnectionAuthorization *connectionAuthorization;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  connectionAuthorization = self->_connectionAuthorization;
  -[PLAssetsdService libraryURL](self, "libraryURL");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("<no library>");
  if (v4)
    v6 = (const __CFString *)v4;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@: %@"), connectionAuthorization, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)stateDescription
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  -[PLAssetsdService libraryURL](self, "libraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D73208];
    -[PLAssetsdService libraryURL](self, "libraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "redactedDescriptionForFileURL:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("<no library>");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), self->_connectionAuthorization, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)handleInterruption
{
  NSObject *v3;
  int remotePID;
  id WeakRetained;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    remotePID = self->_remotePID;
    v8[0] = 67109120;
    v8[1] = remotePID;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Connection interrupted for client with PID: %d", (uint8_t *)v8, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "setDelegate:", 0);

  if (-[PLAssetsdConnectionAuthorization isPhotosClient](self->_connectionAuthorization, "isPhotosClient"))
  {
    -[PLPhotoLibraryBundle libraryServicesManager](self->_libraryBundle, "libraryServicesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "migrationServiceProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unboost");

  }
}

- (void)handleInvalidation
{
  NSObject *v3;
  int remotePID;
  id WeakRetained;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    remotePID = self->_remotePID;
    v8[0] = 67109120;
    v8[1] = remotePID;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated for client with PID: %d", (uint8_t *)v8, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "setDelegate:", 0);

  -[PLAssetsdCPLResourceDownloader handleInvalidation](self->_resourceDownloader, "handleInvalidation");
  if (-[PLAssetsdConnectionAuthorization isPhotosClient](self->_connectionAuthorization, "isPhotosClient"))
  {
    -[PLPhotoLibraryBundle libraryServicesManager](self->_libraryBundle, "libraryServicesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "migrationServiceProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unboost");

  }
}

- (void)getLibraryInternalServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerLibraryInternalService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerLibraryInternalService)
  {
    -[PLAssetsdService permissionsForLibraryInternalService](self, "permissionsForLibraryInternalService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForLibraryInternalService](self, "requiredStateForLibraryInternalService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __55__PLAssetsdService_getLibraryInternalServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerLibraryInternalService = self->_innerLibraryInternalService;
    self->_innerLibraryInternalService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerLibraryInternalService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getSystemLibraryURLReadOnlyServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerSystemLibraryURLReadOnlyService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerSystemLibraryURLReadOnlyService)
  {
    -[PLAssetsdService permissionsForSystemLibraryURLReadOnlyService](self, "permissionsForSystemLibraryURLReadOnlyService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForSystemLibraryURLReadOnlyService](self, "requiredStateForSystemLibraryURLReadOnlyService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __64__PLAssetsdService_getSystemLibraryURLReadOnlyServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerSystemLibraryURLReadOnlyService = self->_innerSystemLibraryURLReadOnlyService;
    self->_innerSystemLibraryURLReadOnlyService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerSystemLibraryURLReadOnlyService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getLibraryManagementServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerLibraryManagementService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerLibraryManagementService)
  {
    -[PLAssetsdService permissionsForLibraryManagementService](self, "permissionsForLibraryManagementService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForLibraryManagementService](self, "requiredStateForLibraryManagementService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __57__PLAssetsdService_getLibraryManagementServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerLibraryManagementService = self->_innerLibraryManagementService;
    self->_innerLibraryManagementService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerLibraryManagementService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getPhotoKitServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerPhotoKitService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerPhotoKitService)
  {
    -[PLAssetsdService permissionsForPhotoKitService](self, "permissionsForPhotoKitService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForPhotoKitService](self, "requiredStateForPhotoKitService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __48__PLAssetsdService_getPhotoKitServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerPhotoKitService = self->_innerPhotoKitService;
    self->_innerPhotoKitService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerPhotoKitService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getPhotoKitAddServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerPhotoKitAddService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerPhotoKitAddService)
  {
    -[PLAssetsdService permissionsForPhotoKitAddService](self, "permissionsForPhotoKitAddService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForPhotoKitAddService](self, "requiredStateForPhotoKitAddService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __51__PLAssetsdService_getPhotoKitAddServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerPhotoKitAddService = self->_innerPhotoKitAddService;
    self->_innerPhotoKitAddService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerPhotoKitAddService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getResourceAvailabilityServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerResourceAvailabilityService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerResourceAvailabilityService)
  {
    -[PLAssetsdService permissionsForResourceAvailabilityService](self, "permissionsForResourceAvailabilityService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForResourceAvailabilityService](self, "requiredStateForResourceAvailabilityService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __60__PLAssetsdService_getResourceAvailabilityServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerResourceAvailabilityService = self->_innerResourceAvailabilityService;
    self->_innerResourceAvailabilityService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerResourceAvailabilityService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getResourceServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerResourceService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerResourceService)
  {
    -[PLAssetsdService permissionsForResourceService](self, "permissionsForResourceService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForResourceService](self, "requiredStateForResourceService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __48__PLAssetsdService_getResourceServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerResourceService = self->_innerResourceService;
    self->_innerResourceService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerResourceService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getResourceWriteOnlyServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerResourceWriteOnlyService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerResourceWriteOnlyService)
  {
    -[PLAssetsdService permissionsForResourceWriteOnlyService](self, "permissionsForResourceWriteOnlyService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForResourceWriteOnlyService](self, "requiredStateForResourceWriteOnlyService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __57__PLAssetsdService_getResourceWriteOnlyServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerResourceWriteOnlyService = self->_innerResourceWriteOnlyService;
    self->_innerResourceWriteOnlyService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerResourceWriteOnlyService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getCloudServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerCloudService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerCloudService)
  {
    -[PLAssetsdService permissionsForCloudService](self, "permissionsForCloudService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForCloudService](self, "requiredStateForCloudService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __45__PLAssetsdService_getCloudServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerCloudService = self->_innerCloudService;
    self->_innerCloudService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerCloudService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getCloudInternalServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerCloudInternalService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerCloudInternalService)
  {
    -[PLAssetsdService permissionsForCloudInternalService](self, "permissionsForCloudInternalService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForCloudInternalService](self, "requiredStateForCloudInternalService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __53__PLAssetsdService_getCloudInternalServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerCloudInternalService = self->_innerCloudInternalService;
    self->_innerCloudInternalService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerCloudInternalService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getMigrationServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerMigrationService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerMigrationService)
  {
    -[PLAssetsdService permissionsForMigrationService](self, "permissionsForMigrationService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForMigrationService](self, "requiredStateForMigrationService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __49__PLAssetsdService_getMigrationServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerMigrationService = self->_innerMigrationService;
    self->_innerMigrationService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerMigrationService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getSyncServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerSyncService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerSyncService)
  {
    -[PLAssetsdService permissionsForSyncService](self, "permissionsForSyncService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForSyncService](self, "requiredStateForSyncService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __44__PLAssetsdService_getSyncServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerSyncService = self->_innerSyncService;
    self->_innerSyncService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerSyncService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getNotificationServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerNotificationService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerNotificationService)
  {
    -[PLAssetsdService permissionsForNotificationService](self, "permissionsForNotificationService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForNotificationService](self, "requiredStateForNotificationService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __52__PLAssetsdService_getNotificationServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerNotificationService = self->_innerNotificationService;
    self->_innerNotificationService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerNotificationService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getDemoServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerDemoService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerDemoService)
  {
    -[PLAssetsdService permissionsForDemoService](self, "permissionsForDemoService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForDemoService](self, "requiredStateForDemoService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __44__PLAssetsdService_getDemoServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerDemoService = self->_innerDemoService;
    self->_innerDemoService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerDemoService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getDebugServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerDebugService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerDebugService)
  {
    -[PLAssetsdService permissionsForDebugService](self, "permissionsForDebugService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForDebugService](self, "requiredStateForDebugService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __45__PLAssetsdService_getDebugServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerDebugService = self->_innerDebugService;
    self->_innerDebugService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerDebugService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (void)getPrivacySupportServiceWithReply:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  PLAssetsdInnerService *v11;
  PLAssetsdInnerService *v12;
  PLAssetsdInnerService *innerPrivacySupportService;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v5 = a3;
  if (!self->_innerPrivacySupportService)
  {
    -[PLAssetsdService permissionsForPrivacySupportService](self, "permissionsForPrivacySupportService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLAssetsdService requiredStateForPrivacySupportService](self, "requiredStateForPrivacySupportService");
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __54__PLAssetsdService_getPrivacySupportServiceWithReply___block_invoke;
    v18 = &unk_1E36759D8;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_msgSend(v9, "initWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    v11 = [PLAssetsdInnerService alloc];
    v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerPrivacySupportService = self->_innerPrivacySupportService;
    self->_innerPrivacySupportService = v12;

  }
  -[PLAssetsdService serviceContextWithSelector:](self, "serviceContextWithSelector:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdInnerService getInnerServiceWithContext:reply:](self->_innerPrivacySupportService, "getInnerServiceWithContext:reply:", v14, v5);

}

- (int64_t)requiredStateForLibraryInternalService
{
  return 6;
}

- (id)permissionsForLibraryInternalService
{
  PLAssetsdServicePermissions *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 1);
  v5[0] = *MEMORY[0x1E0D73448];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", v3);

  return v2;
}

- (id)newLibraryInternalService
{
  NSObject *v3;
  void *v4;
  PLAssetsdLibraryInternalService *v5;
  void *v6;
  PLAssetsdLibraryInternalService *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdLibraryInternalService for client: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = [PLAssetsdLibraryInternalService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLAssetsdLibraryInternalService initWithLibraryServicesManager:connectionAuthorization:](v5, "initWithLibraryServicesManager:connectionAuthorization:", v6, self->_connectionAuthorization);

  return v7;
}

- (int64_t)requiredStateForSystemLibraryURLReadOnlyService
{
  return 0;
}

- (id)permissionsForSystemLibraryURLReadOnlyService
{
  PLAssetsdServicePermissions *v2;

  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 0);
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", MEMORY[0x1E0C9AA60]);
  return v2;
}

- (id)newSystemLibraryURLReadOnlyService
{
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdSystemLibraryURLReadOnlyService for client: %@", (uint8_t *)&v6, 0xCu);

  }
  return -[PLAssetsdSystemLibraryURLReadOnlyService initWithConnectionAuthorization:]([PLAssetsdSystemLibraryURLReadOnlyService alloc], "initWithConnectionAuthorization:", self->_connectionAuthorization);
}

- (int64_t)requiredStateForPrivacySupportService
{
  return 0;
}

- (id)permissionsForPrivacySupportService
{
  PLAssetsdServicePermissions *v2;

  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 0);
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", MEMORY[0x1E0C9AA60]);
  return v2;
}

- (id)newPrivacySupportService
{
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdPrivacySupportService for client: %@", (uint8_t *)&v6, 0xCu);

  }
  return -[PLAssetsdPrivacySupportService initWithConnectionAuthorization:]([PLAssetsdPrivacySupportService alloc], "initWithConnectionAuthorization:", self->_connectionAuthorization);
}

- (int64_t)requiredStateForLibraryManagementService
{
  return 0;
}

- (id)permissionsForLibraryManagementService
{
  PLAssetsdServicePermissions *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 1);
  v5[0] = *MEMORY[0x1E0D73450];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", v3);

  return v2;
}

- (id)newLibraryManagementService
{
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdLibraryManagementService for client: %@", (uint8_t *)&v6, 0xCu);

  }
  return -[PLAssetsdLibraryManagementService initWithConnectionAuthorization:bundleController:]([PLAssetsdLibraryManagementService alloc], "initWithConnectionAuthorization:bundleController:", self->_connectionAuthorization, self->_libraryBundleController);
}

- (int64_t)requiredStateForPhotoKitService
{
  return 6;
}

- (id)permissionsForPhotoKitService
{
  PLAssetsdServicePermissions *v2;

  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setAllowsAuthorizationWithPhotoKitEntitlement:](v2, "setAllowsAuthorizationWithPhotoKitEntitlement:", 1);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 1);
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", MEMORY[0x1E0C9AA60]);
  return v2;
}

- (id)newPhotoKitService
{
  NSObject *v3;
  void *v4;
  PLAssetsdPhotoKitService *v5;
  void *v6;
  PLAssetsdPhotoKitService *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdPhotoKitService for client: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = [PLAssetsdPhotoKitService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLAssetsdPhotoKitService initWithLibraryServicesManager:connectionAuthorization:](v5, "initWithLibraryServicesManager:connectionAuthorization:", v6, self->_connectionAuthorization);

  return v7;
}

- (int64_t)requiredStateForPhotoKitAddService
{
  return 6;
}

- (id)permissionsForPhotoKitAddService
{
  PLAssetsdServicePermissions *v2;

  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setAllowsAuthorizationWithPhotoKitEntitlement:](v2, "setAllowsAuthorizationWithPhotoKitEntitlement:", 1);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 2);
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", MEMORY[0x1E0C9AA60]);
  return v2;
}

- (id)newPhotoKitAddService
{
  NSObject *v3;
  void *v4;
  PLAssetsdPhotoKitAddService *v5;
  void *v6;
  PLAssetsdPhotoKitAddService *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdPhotoKitAddService for client: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = [PLAssetsdPhotoKitAddService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLAssetsdPhotoKitAddService initWithLibraryServicesManager:connectionAuthorization:](v5, "initWithLibraryServicesManager:connectionAuthorization:", v6, self->_connectionAuthorization);

  return v7;
}

- (int64_t)requiredStateForResourceAvailabilityService
{
  return 6;
}

- (id)permissionsForResourceAvailabilityService
{
  PLAssetsdServicePermissions *v2;

  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setAllowsAuthorizationWithPhotoKitEntitlement:](v2, "setAllowsAuthorizationWithPhotoKitEntitlement:", 1);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 2);
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", MEMORY[0x1E0C9AA60]);
  return v2;
}

- (id)newResourceAvailabilityService
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdResourceAvailabilityService for client: %@", (uint8_t *)&v14, 0xCu);

  }
  v6 = NSClassFromString(CFSTR("PLAssetsdResourceAvailabilityService"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdService.m"), 390, CFSTR("no PLAssetsdResourceAvailabilityService class found"));

  }
  v7 = [v6 alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdService cacheMetricsShellObject](self, "cacheMetricsShellObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithLibraryServicesManager:shellObject:trustedCallerBundleID:clientPid:", v8, v9, v10, self->_remotePID);

  return v11;
}

- (int64_t)requiredStateForResourceService
{
  return 6;
}

- (id)permissionsForResourceService
{
  PLAssetsdServicePermissions *v2;

  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 1);
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", MEMORY[0x1E0C9AA60]);
  return v2;
}

- (id)newResourceService
{
  NSObject *v3;
  void *v4;
  PLAssetsdResourceService *v5;
  void *v6;
  PLAssetsdConnectionAuthorization *connectionAuthorization;
  void *v8;
  PLAssetsdResourceService *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdResourceService for client: %@", (uint8_t *)&v11, 0xCu);

  }
  v5 = [PLAssetsdResourceService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  connectionAuthorization = self->_connectionAuthorization;
  -[PLAssetsdService resourceDownloader](self, "resourceDownloader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLAssetsdResourceService initWithLibraryServicesManager:connectionAuthorization:resourceDownloader:](v5, "initWithLibraryServicesManager:connectionAuthorization:resourceDownloader:", v6, connectionAuthorization, v8);

  return v9;
}

- (int64_t)requiredStateForResourceWriteOnlyService
{
  return 6;
}

- (id)permissionsForResourceWriteOnlyService
{
  PLAssetsdServicePermissions *v2;

  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 2);
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", MEMORY[0x1E0C9AA60]);
  return v2;
}

- (id)newResourceWriteOnlyService
{
  NSObject *v3;
  void *v4;
  PLAssetsdResourceWriteOnlyService *v5;
  void *v6;
  PLAssetsdResourceWriteOnlyService *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new newResourceWriteOnlyService for client: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = [PLAssetsdResourceWriteOnlyService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLAssetsdResourceWriteOnlyService initWithLibraryServicesManager:connectionAuthorization:](v5, "initWithLibraryServicesManager:connectionAuthorization:", v6, self->_connectionAuthorization);

  return v7;
}

- (int64_t)requiredStateForCloudService
{
  return 6;
}

- (id)permissionsForCloudService
{
  PLAssetsdServicePermissions *v2;

  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 1);
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", MEMORY[0x1E0C9AA60]);
  return v2;
}

- (id)newCloudService
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  PLAssetsdCloudService *v8;
  void *v9;
  PLAssetsdCloudService *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdCloudService for client: %@", buf, 0xCu);

  }
  v5 = objc_initWeak((id *)buf, self);

  v6 = objc_alloc(MEMORY[0x1E0D73248]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__PLAssetsdService_newCloudService__block_invoke;
  v12[3] = &unk_1E36759D8;
  objc_copyWeak(&v13, (id *)buf);
  v7 = (void *)objc_msgSend(v6, "initWithBlock:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  v8 = [PLAssetsdCloudService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLAssetsdCloudService initWithLibraryServicesManager:lazyResourceDownloader:](v8, "initWithLibraryServicesManager:lazyResourceDownloader:", v9, v7);

  return v10;
}

- (int64_t)requiredStateForCloudInternalService
{
  return 6;
}

- (id)permissionsForCloudInternalService
{
  PLAssetsdServicePermissions *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 0);
  v5[0] = *MEMORY[0x1E0D73428];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", v3);

  return v2;
}

- (id)newCloudInternalService
{
  NSObject *v3;
  void *v4;
  PLAssetsdCloudInternalService *v5;
  void *v6;
  PLAssetsdCloudInternalService *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdCloudInternalService for client: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = [PLAssetsdCloudInternalService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLAssetsdCloudInternalService initWithLibraryServicesManager:connectionAuthorization:](v5, "initWithLibraryServicesManager:connectionAuthorization:", v6, self->_connectionAuthorization);

  return v7;
}

- (int64_t)requiredStateForMigrationService
{
  return 1;
}

- (id)permissionsForMigrationService
{
  PLAssetsdServicePermissions *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 0);
  v5[0] = *MEMORY[0x1E0D73458];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", v3);

  return v2;
}

- (id)newMigrationService
{
  NSObject *v3;
  void *v4;
  PLAssetsdMigrationService *v5;
  void *v6;
  PLAssetsdMigrationService *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdMigrationService for client: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = [PLAssetsdMigrationService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLAssetsdMigrationService initWithLibraryServicesManager:](v5, "initWithLibraryServicesManager:", v6);

  return v7;
}

- (int64_t)requiredStateForSyncService
{
  return 6;
}

- (id)permissionsForSyncService
{
  PLAssetsdServicePermissions *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 0);
  v5[0] = *MEMORY[0x1E0D73478];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", v3);

  return v2;
}

- (id)newSyncService
{
  NSObject *v3;
  void *v4;
  PLAssetsdSyncService *v5;
  void *v6;
  PLAssetsdSyncService *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdSyncService for client: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = [PLAssetsdSyncService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLAssetsdSyncService initWithLibraryServicesManager:](v5, "initWithLibraryServicesManager:", v6);

  return v7;
}

- (int64_t)requiredStateForNotificationService
{
  return 6;
}

- (id)permissionsForNotificationService
{
  PLAssetsdServicePermissions *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 0);
  v5[0] = *MEMORY[0x1E0D73460];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", v3);

  return v2;
}

- (id)newNotificationService
{
  NSObject *v3;
  void *v4;
  PLAssetsdNotificationService *v5;
  void *v6;
  PLAssetsdNotificationService *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdNotificationService for client: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = [PLAssetsdNotificationService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLAbstractLibraryServicesManagerService initWithLibraryServicesManager:](v5, "initWithLibraryServicesManager:", v6);

  return v7;
}

- (int64_t)requiredStateForDemoService
{
  return 0;
}

- (id)permissionsForDemoService
{
  PLAssetsdServicePermissions *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 0);
  v5[0] = *MEMORY[0x1E0D73438];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", v3);

  return v2;
}

- (id)newDemoService
{
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdDemoService for client: %@", (uint8_t *)&v6, 0xCu);

  }
  return -[PLAssetsdDemoService initWithConnectionAuthorization:]([PLAssetsdDemoService alloc], "initWithConnectionAuthorization:", self->_connectionAuthorization);
}

- (int64_t)requiredStateForDebugService
{
  return 6;
}

- (id)permissionsForDebugService
{
  PLAssetsdServicePermissions *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  -[PLAssetsdServicePermissions setRequiredAuthorization:](v2, "setRequiredAuthorization:", 0);
  v5[0] = *MEMORY[0x1E0D73430];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdServicePermissions setRequiredEntitlements:](v2, "setRequiredEntitlements:", v3);

  return v2;
}

- (id)newDebugService
{
  NSObject *v3;
  void *v4;
  PLAssetsdDebugService *v5;
  void *v6;
  void *v7;
  PLAssetsdDebugService *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLAssetsdService clientDebugDescription](self, "clientDebugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdDebugService for client: %@", (uint8_t *)&v10, 0xCu);

  }
  v5 = [PLAssetsdDebugService alloc];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetsdService resourceDownloader](self, "resourceDownloader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLAssetsdDebugService initWithLibraryServicesManager:resourceDownloader:bundleController:connectionAuthorization:](v5, "initWithLibraryServicesManager:resourceDownloader:bundleController:connectionAuthorization:", v6, v7, self->_libraryBundleController, self->_connectionAuthorization);

  return v8;
}

- (void)photoLibraryDeletedAtURL:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "valueForEntitlement:", CFSTR("com.apple.private.photos.library.deleted"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__PLAssetsdService_photoLibraryDeletedAtURL_reply___block_invoke;
    v14[3] = &unk_1E3676398;
    v15 = v6;
    v16 = v7;
    +[PLSpotlightDonationManager handleDeletionForPhotoLibraryWithURL:completion:](PLSpotlightDonationManager, "handleDeletionForPhotoLibraryWithURL:completion:", v15, v14);

    v10 = v15;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D74498];
    v17 = *MEMORY[0x1E0CB2938];
    v18[0] = CFSTR("Missing entitlement for photoLibraryDeletedAtURL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 46104, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v13);

  }
}

- (void)runDaemonJob:(id)a3 isSerial:(BOOL)a4
{
  -[PLAssetsdService runDaemonJob:isSerial:withReply:](self, "runDaemonJob:isSerial:withReply:", a3, a4, 0);
}

- (void)runDaemonJob:(id)a3 isSerial:(BOOL)a4 withReply:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, NSObject *, _QWORD);
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  const char *Name;
  NSObject *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  SEL sel[2];
  uint8_t buf[4];
  _DWORD v35[7];

  v6 = a4;
  *(_QWORD *)&v35[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, NSObject *, _QWORD))a5;
  +[PLFileDescriptorFuse checkFileDescriptorFuse](PLFileDescriptorFuse, "checkFileDescriptorFuse");
  v32 = 0u;
  *(_OWORD *)sel = 0u;
  v31 = 0u;
  v10 = objc_msgSend(MEMORY[0x1E0D73338], "enabled");
  LOBYTE(v31) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_199541000, "PLXPC Service: runDaemonJob:isSerial:withReply:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((_QWORD *)&v31 + 1);
    *((_QWORD *)&v31 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  PLGatekeeperXPCGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v35 = v8;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "runDaemonJob:isSerial:withReply: with job %@", buf, 0xCu);
  }

  v30 = 0;
  v14 = -[PLAssetsdService _prepareToRunDaemonJob:error:](self, "_prepareToRunDaemonJob:error:", v8, &v30);
  v15 = v30;
  if (v14)
  {
    if (v9)
      objc_msgSend(v8, "setReplyHandler:", v9);
    if (v6)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSObject setObject:forKey:](v16, "setObject:forKey:", *MEMORY[0x1E0D74E40], *MEMORY[0x1E0D74DB8]);
      -[NSObject setObject:forKey:](v16, "setObject:forKey:", v8, CFSTR("kPLImageWriterDaemonJobEventKey"));
      if (-[PLAssetsdConnectionAuthorization isClientInLimitedLibraryMode](self->_connectionAuthorization, "isClientInLimitedLibraryMode"))
      {
        -[NSObject setObject:forKey:](v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("job.private.ClientInLimitedLibraryMode"));
        -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self->_connectionAuthorization, "trustedCallerBundleID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length"))
        {
          PLGatekeeperXPCGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = -[PLAssetsdConnectionAuthorization clientProcessIdentifier](self->_connectionAuthorization, "clientProcessIdentifier");
            *(_DWORD *)buf = 67109378;
            v35[0] = v19;
            LOWORD(v35[1]) = 2112;
            *(_QWORD *)((char *)&v35[1] + 2) = v17;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Running job for limited library client (%d) %@", buf, 0x12u);
          }

          -[NSObject setObject:forKey:](v16, "setObject:forKey:", v17, CFSTR("job.private.LimitedLibraryClientFetchFilterIdentifier"));
          -[NSObject setObject:forKey:](v16, "setObject:forKey:", self->_connectionAuthorization, CFSTR("job.private.LimitedLibraryClientAuthorization"));
        }
        else
        {
          PLGatekeeperXPCGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = -[PLAssetsdConnectionAuthorization clientProcessIdentifier](self->_connectionAuthorization, "clientProcessIdentifier");
            *(_DWORD *)buf = 67109120;
            v35[0] = v22;
            _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Running job for limited library client %d without client identifier", buf, 8u);
          }

        }
      }
      -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "imageWriter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "enqueueJob:", v16);

    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v8;
      pl_dispatch_async();

      v16 = v29;
    }
  }
  else if (v9)
  {
    -[PLAssetsdService _waitForLibraryServicesForDaemonJob](self, "_waitForLibraryServicesForDaemonJob");
    v16 = objc_claimAutoreleasedReturnValue();
    v9[2](v9, v16, 0);
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v35 = v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed in prepare to run daemon job: %@", buf, 0xCu);
    }
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
      *(_QWORD *)v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_END, v27, "failed to load photo library %{public}s with url %@, %@", "Connection opened for client with PID: %d, bundle ID: %@ at QoS: %{public}@", buf, 0xCu);
    }

  }
}

- (id)_waitForLibraryServicesForDaemonJob
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = *MEMORY[0x1E0D74498];
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("No library services manager");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 41012, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)bindToPhotoLibraryURL:(id)a3 sandboxExtension:(id)a4 withReply:(id)a5
{
  -[PLAssetsdService bindToPhotoLibraryURL:sandboxExtension:clientOptions:withReply:](self, "bindToPhotoLibraryURL:sandboxExtension:clientOptions:withReply:", a3, a4, 0, a5);
}

- (void)collectCacheMetrics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PLAssetsdService cacheMetricsShellObject](self, "cacheMetricsShellObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cacheMetricsCollectorServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "resourceCacheMetrics");
    v8 = v7;
    -[PLAssetsdService cacheMetricsShellObject](self, "cacheMetricsShellObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cacheMetricsCollectorServer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "getSharedImageRequestCacheMetrics");
    v12 = (v11 + v6);
    v14 = (v13 + v8);
    v15 = v13 + (v8 & 0xFFFFFFFF00000000);
    v16 = v11 + (v6 & 0xFFFFFFFF00000000);

    objc_msgSend(v5, "setResourceCacheMetrics:", v16 & 0xFFFFFFFF00000000 | v12, v14 | v15 & 0xFFFFFFFF00000000);
    PLCacheMetricsCollectorGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = 134218752;
      v19 = v12;
      v20 = 2048;
      v21 = HIDWORD(v16);
      v22 = 2048;
      v23 = v14;
      v24 = 2048;
      v25 = HIDWORD(v15);
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "CacheMetrics Aggregation done, current data is: [%ld, %ld, %ld, %ld]", (uint8_t *)&v18, 0x2Au);
    }

  }
}

- (BOOL)_prepareToRunDaemonJob:(id)a3 error:(id *)a4
{
  id v7;
  id WeakRetained;
  BOOL readyForDaemonJobs;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v19[7];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v19[1] = (id)MEMORY[0x1E0C809B0];
  v19[2] = (id)3221225472;
  v19[3] = __49__PLAssetsdService__prepareToRunDaemonJob_error___block_invoke;
  v19[4] = &unk_1E3674C18;
  v19[5] = self;
  v19[6] = (id)a2;
  pl_dispatch_once();
  if (objc_msgSend(v7, "daemonOperation") == 13 || objc_msgSend(v7, "daemonOperation") == 16)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(v7, "setClientConnection:", WeakRetained);

  }
  if (!self->_readyForDaemonJobs)
  {
    -[PLAssetsdService libraryServicesManager](self, "libraryServicesManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v19[0] = 0;
      v12 = objc_msgSend(v10, "awaitLibraryState:error:", 6, v19);
      v13 = v19[0];
      v14 = v13;
      if ((v12 & 1) != 0)
      {
        self->_readyForDaemonJobs = 1;
LABEL_14:

        goto LABEL_15;
      }
      if (!a4)
        goto LABEL_14;
      v17 = objc_retainAutorelease(v13);
      v14 = v17;
    }
    else
    {
      if (!a4)
      {
LABEL_15:

        readyForDaemonJobs = self->_readyForDaemonJobs;
        goto LABEL_16;
      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D74498];
      v20 = *MEMORY[0x1E0CB2D50];
      v21[0] = CFSTR("No library services manager");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 41012, v14);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a4 = v17;
    goto LABEL_14;
  }
  readyForDaemonJobs = 1;
LABEL_16:

  return readyForDaemonJobs;
}

- (void)invalidateConnectionWithReason:(id)a3
{
  id v5;
  NSXPCConnection **p_connection;
  id WeakRetained;
  char v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdService.m"), 953, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason != nil"));

  }
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (WeakRetained)
  {
    v8 = PLIsErrorEqualToCode();
    v9 = PLIsErrorEqualToCode();
    if ((v8 & 1) == 0 && (v9 & 1) == 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_connection);
      objc_msgSend(v10, "_unboostingRemoteObjectProxy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          v14 = (void *)MEMORY[0x1E0CB37E8];
          v15 = objc_loadWeakRetained((id *)&self->_connection);
          objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "processIdentifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v16;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Sending libraryBecameUnavailable to PID %{public}@", buf, 0xCu);

        }
        -[PLAssetsdService libraryURL](self, "libraryURL");
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "libraryBecameUnavailable:reason:", v12, v5);
      }
      else if (v13)
      {
        v17 = (void *)MEMORY[0x1E0CB37E8];
        v18 = objc_loadWeakRetained((id *)p_connection);
        objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "processIdentifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v19;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "No remoteObjectProxy for client PID %{public}@", buf, 0xCu);

      }
    }
    v20 = objc_loadWeakRetained((id *)p_connection);
    objc_msgSend(v20, "invalidate");

    objc_storeWeak((id *)p_connection, 0);
  }

}

- (id)clientDebugDescription
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  PLClientBundleIdentifierFromXPCConnection();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PID: %d, bundle ID: %@"), self->_remotePID, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSURL)libraryURL
{
  return self->_libraryURL;
}

- (PLCacheMetricsCollectorServerShell)cacheMetricsShellObject
{
  return self->_cacheMetricsShellObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheMetricsShellObject, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_resourceDownloader, 0);
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
  objc_storeStrong((id *)&self->_libraryBundleController, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_innerPrivacySupportService, 0);
  objc_storeStrong((id *)&self->_innerDebugService, 0);
  objc_storeStrong((id *)&self->_innerDiagnosticsService, 0);
  objc_storeStrong((id *)&self->_innerDemoService, 0);
  objc_storeStrong((id *)&self->_innerNotificationService, 0);
  objc_storeStrong((id *)&self->_innerSyncService, 0);
  objc_storeStrong((id *)&self->_innerMigrationService, 0);
  objc_storeStrong((id *)&self->_innerCloudInternalService, 0);
  objc_storeStrong((id *)&self->_innerCloudService, 0);
  objc_storeStrong((id *)&self->_innerResourceInternalService, 0);
  objc_storeStrong((id *)&self->_innerResourceWriteOnlyService, 0);
  objc_storeStrong((id *)&self->_innerResourceService, 0);
  objc_storeStrong((id *)&self->_innerResourceAvailabilityService, 0);
  objc_storeStrong((id *)&self->_innerPhotoKitAddService, 0);
  objc_storeStrong((id *)&self->_innerPhotoKitService, 0);
  objc_storeStrong((id *)&self->_innerLibraryManagementService, 0);
  objc_storeStrong((id *)&self->_innerSystemLibraryURLReadOnlyService, 0);
  objc_storeStrong((id *)&self->_innerLibraryInternalService, 0);
  objc_storeStrong((id *)&self->_innerLibraryService, 0);
}

void __49__PLAssetsdService__prepareToRunDaemonJob_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelMigrator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharingJob recoveredEventsWithPathManager:](PLCloudSharingJob, "recoveredEventsWithPathManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D74DE8];
    objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0D74DE8], *MEMORY[0x1E0D74DB8]);
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("kPLImageWriterDaemonJobRecoveredEventsKey"));
    PLGatekeeperXPCGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v7;
      v16 = 1024;
      v17 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "[%@] enqueing job %@ with %d recovered events", (uint8_t *)&v12, 0x1Cu);

    }
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWriter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enqueueJob:", v6);

  }
}

uint64_t __52__PLAssetsdService_runDaemonJob_isSerial_withReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runDaemonSide");
}

void __51__PLAssetsdService_photoLibraryDeletedAtURL_reply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Failed to handle deletion for photoLibrary with URL: %@, %@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __35__PLAssetsdService_newCloudService__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "resourceDownloader");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __54__PLAssetsdService_getPrivacySupportServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newPrivacySupportService");
  else
    v3 = 0;

  return v3;
}

id __45__PLAssetsdService_getDebugServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newDebugService");
  else
    v3 = 0;

  return v3;
}

id __44__PLAssetsdService_getDemoServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newDemoService");
  else
    v3 = 0;

  return v3;
}

id __52__PLAssetsdService_getNotificationServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newNotificationService");
  else
    v3 = 0;

  return v3;
}

id __44__PLAssetsdService_getSyncServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newSyncService");
  else
    v3 = 0;

  return v3;
}

id __49__PLAssetsdService_getMigrationServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newMigrationService");
  else
    v3 = 0;

  return v3;
}

id __53__PLAssetsdService_getCloudInternalServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newCloudInternalService");
  else
    v3 = 0;

  return v3;
}

id __45__PLAssetsdService_getCloudServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newCloudService");
  else
    v3 = 0;

  return v3;
}

id __57__PLAssetsdService_getResourceWriteOnlyServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newResourceWriteOnlyService");
  else
    v3 = 0;

  return v3;
}

id __48__PLAssetsdService_getResourceServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newResourceService");
  else
    v3 = 0;

  return v3;
}

id __60__PLAssetsdService_getResourceAvailabilityServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newResourceAvailabilityService");
  else
    v3 = 0;

  return v3;
}

id __51__PLAssetsdService_getPhotoKitAddServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newPhotoKitAddService");
  else
    v3 = 0;

  return v3;
}

id __48__PLAssetsdService_getPhotoKitServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newPhotoKitService");
  else
    v3 = 0;

  return v3;
}

id __57__PLAssetsdService_getLibraryManagementServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newLibraryManagementService");
  else
    v3 = 0;

  return v3;
}

id __64__PLAssetsdService_getSystemLibraryURLReadOnlyServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newSystemLibraryURLReadOnlyService");
  else
    v3 = 0;

  return v3;
}

id __55__PLAssetsdService_getLibraryInternalServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newLibraryInternalService");
  else
    v3 = 0;

  return v3;
}

@end
