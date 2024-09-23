@implementation PLAssetsdConnectionAuthorization

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)self[1].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)_trackCAConnectionEvent
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSString **p_trustedCallerBundleID;
  uint64_t *v10;
  void *v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[6];
  uint64_t v27;
  NSString *trustedCallerBundleID;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (-[PLAssetsdConnectionAuthorization _shouldTrackEventForBundle:](self, "_shouldTrackEventForBundle:", self->_trustedCallerBundleID))
  {
    -[NSString lowercaseString](self->_trustedCallerBundleID, "lowercaseString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("null"));

    v7 = *MEMORY[0x1E0D73590];
    if (v6)
    {
      v29 = *MEMORY[0x1E0D735D8];
      v30[0] = *MEMORY[0x1E0D735E0];
      v8 = (void *)MEMORY[0x1E0C99D80];
      p_trustedCallerBundleID = (NSString **)v30;
      v10 = &v29;
    }
    else
    {
      v27 = *MEMORY[0x1E0D735D8];
      trustedCallerBundleID = self->_trustedCallerBundleID;
      v8 = (void *)MEMORY[0x1E0C99D80];
      p_trustedCallerBundleID = &trustedCallerBundleID;
      v10 = &v27;
    }
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", p_trustedCallerBundleID, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x19AEC0B7C](v7, v11);

    v12 = -[PLAssetsdConnectionAuthorization isClientInFullLibraryMode](self, "isClientInFullLibraryMode");
    v13 = -[PLAssetsdConnectionAuthorization isClientInLimitedLibraryMode](self, "isClientInLimitedLibraryMode");
    v14 = -[PLAssetsdConnectionAuthorization isClientAuthorizedForTCCServicePhotosAdd](self, "isClientAuthorizedForTCCServicePhotosAdd");
    v15 = -[PLAssetsdConnectionAuthorization isClientInRestrictedMode](self, "isClientInRestrictedMode");
    v16 = !v12 && !v13;
    v17 = *MEMORY[0x1E0D73BD8];
    v26[0] = self->_trustedCallerBundleID;
    v18 = *MEMORY[0x1E0D73BE0];
    v25[0] = *MEMORY[0x1E0D73C08];
    v25[1] = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v19;
    v25[2] = *MEMORY[0x1E0D73BF0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v20;
    v25[3] = *MEMORY[0x1E0D73BF8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v21;
    v25[4] = *MEMORY[0x1E0D73C00];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[4] = v22;
    v25[5] = *MEMORY[0x1E0D73BE8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[5] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x19AEC0B7C](v17, v24);

  }
}

- (BOOL)isClientInRestrictedMode
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  _OWORD v7[2];

  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v4;
  v5 = objc_msgSend(v3, "photosAccessAllowedWithScope:auditToken:clientAuthorization:", 7, v7, self);

  return v5 == 3;
}

- (BOOL)isClientInLimitedLibraryMode
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  _OWORD v7[2];

  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v4;
  v5 = objc_msgSend(v3, "photosAccessAllowedWithScope:auditToken:clientAuthorization:", 7, v7, self);

  return v5 == 4;
}

- (BOOL)isClientInFullLibraryMode
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  _OWORD v7[2];

  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v4;
  v5 = objc_msgSend(v3, "photosAccessAllowedWithScope:auditToken:clientAuthorization:", 7, v7, self);

  return v5 == 0;
}

- (BOOL)isClientAuthorizedForTCCServicePhotosAdd
{
  void *v2;
  char v3;

  -[PLLazyObject objectValue](self->_lazyPhotosAddAccessAllowed, "objectValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)_shouldTrackEventForBundle:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "length")
    && (!objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple."))
     || (objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.mobileslideshow")) & 1) != 0
     || (PLIsCameraBundleIdentifier() & 1) != 0
     || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Photos")));

  return v4;
}

- (BOOL)smartSharingCacheWriteEntitled
{
  return self->_smartSharingCacheWriteEntitled;
}

- (BOOL)smartSharingCacheReadEntitled
{
  return self->_smartSharingCacheReadEntitled;
}

- (BOOL)internalDataReadWriteAuthorized
{
  return self->_internalDataReadWriteAuthorized;
}

- (BOOL)directDatabaseWriteAuthorized
{
  return self->_directDatabaseWriteAuthorized;
}

- (BOOL)directDatabaseAccessAuthorized
{
  return self->_directDatabaseAccessAuthorized;
}

- (BOOL)analyticsCacheWriteEntitled
{
  return self->_analyticsCacheWriteEntitled;
}

- (BOOL)analyticsCacheReadEntitled
{
  return self->_analyticsCacheReadEntitled;
}

- (BOOL)photoKitEntitled
{
  return self->_photoKitEntitled;
}

- (BOOL)isClientEntitledForPhotoKitOrPrivatePhotosTCC
{
  return self->_clientEntitledForPhotoKitOrPrivatePhotosTCC;
}

- (void)invalidateClientAuthorizationCache
{
  -[PLLazyObject resetObject](self->_lazyPhotosAccessAllowed, "resetObject");
  -[PLLazyObject resetObject](self->_lazyPhotosAddAccessAllowed, "resetObject");
}

- (BOOL)isClientAuthorizedForTCCServicePhotos
{
  void *v2;
  char v3;

  -[PLLazyObject objectValue](self->_lazyPhotosAccessAllowed, "objectValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isClientAuthorizedForLibraryUpgrade
{
  return self->_clientAuthorizedForLibraryUpgrade;
}

- (NSString)trustedCallerBundleID
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (PLAssetsdConnectionAuthorization)initWithConnection:(id)a3 daemonServices:(id)a4
{
  id v6;
  id v7;
  PLAssetsdConnectionAuthorization *v8;
  PLAssetsdConnectionAuthorization *v9;
  $0B20F48E2CD2D778BD1F216BA81B71CE *p_auditToken;
  __int128 v11;
  int v12;
  const __CFAllocator **v13;
  const __CFAllocator *v14;
  __int128 v15;
  __SecTask *v16;
  __SecTask *v17;
  CFStringRef v18;
  NSString *trustedCallerBundleID;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSSet *photoKitEntitlements;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  char v33;
  void *v34;
  void *v35;
  __int128 v36;
  int v37;
  NSObject *v38;
  int v39;
  int *v40;
  char *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  PLLazyObject *lazyPhotosAccessAllowed;
  id v55;
  id v56;
  uint64_t v57;
  PLLazyObject *lazyPhotosAddAccessAllowed;
  id v59;
  id v60;
  uint64_t v61;
  PLLazyObject *lazytrustedCallerContainingBundleRecord;
  id v63;
  id v64;
  uint64_t v65;
  PLLazyObject *lazyTrustedCallerDisplayName;
  id v67;
  id v68;
  uint64_t v69;
  PLLazyObject *lazyTrustedCallerPhotoLibraryUsageDescription;
  id v71;
  id v72;
  uint64_t v73;
  PLLazyObject *lazyFetchFilterIdentifier;
  id v75;
  id v76;
  uint64_t v77;
  PLLazyObject *lazyCaptureSessionState;
  PLAssetsdConnectionAuthorization *v79;
  uint64_t v81;
  uint64_t v82;
  id (*v83)(uint64_t);
  void *v84;
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[4];
  id v97;
  objc_super v98;
  _QWORD v99[3];
  audit_token_t token;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v98.receiver = self;
  v98.super_class = (Class)PLAssetsdConnectionAuthorization;
  v8 = -[PLAssetsdConnectionAuthorization init](&v98, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_daemonServices, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
    if (v6)
      objc_msgSend(v6, "auditToken");
    else
      memset(&token, 0, sizeof(token));
    p_auditToken = &v9->_auditToken;
    v11 = *(_OWORD *)&token.val[4];
    *(_OWORD *)v9->_auditToken.val = *(_OWORD *)token.val;
    *(_OWORD *)&v9->_auditToken.val[4] = v11;
    v12 = objc_msgSend(v6, "processIdentifier");
    v13 = (const __CFAllocator **)MEMORY[0x1E0C9AE00];
    v9->_clientProcessIdentifier = v12;
    v14 = *v13;
    v15 = *(_OWORD *)&v9->_auditToken.val[4];
    *(_OWORD *)token.val = *(_OWORD *)v9->_auditToken.val;
    *(_OWORD *)&token.val[4] = v15;
    v16 = SecTaskCreateWithAuditToken(v14, &token);
    v17 = v16;
    if (v16)
    {
      v18 = SecTaskCopySigningIdentifier(v16, 0);
      trustedCallerBundleID = v9->_trustedCallerBundleID;
      v9->_trustedCallerBundleID = &v18->isa;

      CFRelease(v17);
    }
    v20 = (void *)MEMORY[0x1E0D732D8];
    objc_msgSend(v6, "_xpcConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0D749E0];
    v99[0] = *MEMORY[0x1E0D749D8];
    v99[1] = v22;
    v99[2] = *MEMORY[0x1E0D749C8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "connection:grantedEntitlements:", v21, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    photoKitEntitlements = v9->_photoKitEntitlements;
    v9->_photoKitEntitlements = (NSSet *)v24;

    v9->_photoKitEntitled = objc_msgSend(MEMORY[0x1E0D732D8], "containsPhotoKitEntitlement:", v9->_photoKitEntitlements);
    v26 = (void *)MEMORY[0x1E0D732D8];
    objc_msgSend(v6, "_xpcConnection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_clientAuthorizedForLibraryUpgrade = objc_msgSend(v26, "connection:hasEntitlement:", v27, *MEMORY[0x1E0D749D0]);

    v28 = (void *)MEMORY[0x1E0D732D8];
    objc_msgSend(v6, "_xpcConnection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_cloudInternalEntitled = objc_msgSend(v28, "connection:hasEntitlement:", v29, *MEMORY[0x1E0D73428]);

    v30 = (void *)MEMORY[0x1E0D732D8];
    objc_msgSend(v6, "_xpcConnection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_managedSpotlightIndexReadWriteEntitled = objc_msgSend(v30, "connection:hasEntitlement:", v31, *MEMORY[0x1E0D74A18]);

    -[PLAssetsdConnectionAuthorization _setupAnalyticsCacheWithConnection:](v9, "_setupAnalyticsCacheWithConnection:", v6);
    -[PLAssetsdConnectionAuthorization _setupSmartSharingCacheWithConnection:](v9, "_setupSmartSharingCacheWithConnection:", v6);
    v32 = *(_OWORD *)&v9->_auditToken.val[4];
    *(_OWORD *)token.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&token.val[4] = v32;
    v33 = objc_msgSend(MEMORY[0x1E0D732D8], "isEntitledForPhotoKitOrPrivatePhotosTCCForToken:", &token);
    v9->_clientEntitledForPhotoKitOrPrivatePhotosTCC = v33;
    v9->_directDatabaseAccessAuthorized = v33;
    v34 = (void *)MEMORY[0x1E0D732D8];
    objc_msgSend(v6, "_xpcConnection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_directDatabaseWriteAuthorized = objc_msgSend(v34, "connection:hasEntitlement:", v35, *MEMORY[0x1E0D749F8]);

    v36 = *(_OWORD *)&v9->_auditToken.val[4];
    *(_OWORD *)token.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&token.val[4] = v36;
    v37 = sandbox_check_by_audit_token();
    if (v37 == -1)
    {
      PLBackendGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = *__error();
        v40 = __error();
        v41 = strerror(*v40);
        token.val[0] = 67109378;
        token.val[1] = v39;
        LOWORD(token.val[2]) = 2080;
        *(_QWORD *)((char *)&token.val[2] + 2) = v41;
        _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "Error checking client sandbox: errno %d %s", (uint8_t *)&token, 0x12u);
      }

    }
    v9->_clientIsSandboxed = v37 == 1;
    v42 = (void *)MEMORY[0x1E0D732D8];
    objc_msgSend(v6, "_xpcConnection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_photosDataVaultEntitled = objc_msgSend(v42, "connection:hasEntitlement:", v43, CFSTR("com.apple.private.security.storage.PhotosLibraries"));

    v44 = (void *)MEMORY[0x1E0D732D8];
    objc_msgSend(v6, "_xpcConnection");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_internalDataReadWriteAuthorized = objc_msgSend(v44, "connection:hasEntitlement:", v45, *MEMORY[0x1E0D74A00]);

    v46 = (void *)MEMORY[0x1E0D732D8];
    objc_msgSend(v6, "_xpcConnection");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_coreSceneUnderstandingTaxonomyReadAuthorized = objc_msgSend(v46, "connection:hasEntitlement:", v47, CFSTR("com.apple.private.photos.coresceneunderstanding.taxonomy.read-only"));

    v48 = (void *)MEMORY[0x1E0D732D8];
    objc_msgSend(v6, "_xpcConnection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_coreSceneUnderstandingTaxonomyWriteAuthorized = objc_msgSend(v48, "connection:hasEntitlement:", v49, CFSTR("com.apple.private.photos.coresceneunderstanding.taxonomy.read-write"));

    v50 = objc_initWeak((id *)&token, v9);
    v51 = objc_alloc(MEMORY[0x1E0D73248]);
    v52 = MEMORY[0x1E0C809B0];
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke;
    v96[3] = &unk_1E36759D8;
    objc_copyWeak(&v97, (id *)&token);
    v53 = objc_msgSend(v51, "initWithRetriableBlock:", v96);
    objc_destroyWeak(&v97);
    objc_destroyWeak((id *)&token);
    lazyPhotosAccessAllowed = v9->_lazyPhotosAccessAllowed;
    v9->_lazyPhotosAccessAllowed = (PLLazyObject *)v53;

    v55 = objc_initWeak((id *)&token, v9);
    v56 = objc_alloc(MEMORY[0x1E0D73248]);
    v94[0] = v52;
    v94[1] = 3221225472;
    v94[2] = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_2;
    v94[3] = &unk_1E36759D8;
    objc_copyWeak(&v95, (id *)&token);
    v57 = objc_msgSend(v56, "initWithRetriableBlock:", v94);
    objc_destroyWeak(&v95);
    objc_destroyWeak((id *)&token);
    lazyPhotosAddAccessAllowed = v9->_lazyPhotosAddAccessAllowed;
    v9->_lazyPhotosAddAccessAllowed = (PLLazyObject *)v57;

    v59 = objc_initWeak((id *)&token, v9);
    v60 = objc_alloc(MEMORY[0x1E0D73248]);
    v92[0] = v52;
    v92[1] = 3221225472;
    v92[2] = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_3;
    v92[3] = &unk_1E36759D8;
    objc_copyWeak(&v93, (id *)&token);
    v61 = objc_msgSend(v60, "initWithRetriableBlock:", v92);
    objc_destroyWeak(&v93);
    objc_destroyWeak((id *)&token);
    lazytrustedCallerContainingBundleRecord = v9->_lazytrustedCallerContainingBundleRecord;
    v9->_lazytrustedCallerContainingBundleRecord = (PLLazyObject *)v61;

    v63 = objc_initWeak((id *)&token, v9);
    v64 = objc_alloc(MEMORY[0x1E0D73248]);
    v90[0] = v52;
    v90[1] = 3221225472;
    v90[2] = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_4;
    v90[3] = &unk_1E36759D8;
    objc_copyWeak(&v91, (id *)&token);
    v65 = objc_msgSend(v64, "initWithRetriableBlock:", v90);
    objc_destroyWeak(&v91);
    objc_destroyWeak((id *)&token);
    lazyTrustedCallerDisplayName = v9->_lazyTrustedCallerDisplayName;
    v9->_lazyTrustedCallerDisplayName = (PLLazyObject *)v65;

    v67 = objc_initWeak((id *)&token, v9);
    v68 = objc_alloc(MEMORY[0x1E0D73248]);
    v88[0] = v52;
    v88[1] = 3221225472;
    v88[2] = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_5;
    v88[3] = &unk_1E36759D8;
    objc_copyWeak(&v89, (id *)&token);
    v69 = objc_msgSend(v68, "initWithRetriableBlock:", v88);
    objc_destroyWeak(&v89);
    objc_destroyWeak((id *)&token);
    lazyTrustedCallerPhotoLibraryUsageDescription = v9->_lazyTrustedCallerPhotoLibraryUsageDescription;
    v9->_lazyTrustedCallerPhotoLibraryUsageDescription = (PLLazyObject *)v69;

    v71 = objc_initWeak((id *)&token, v9);
    v72 = objc_alloc(MEMORY[0x1E0D73248]);
    v86[0] = v52;
    v86[1] = 3221225472;
    v86[2] = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_6;
    v86[3] = &unk_1E36759D8;
    objc_copyWeak(&v87, (id *)&token);
    v73 = objc_msgSend(v72, "initWithRetriableBlock:", v86);
    objc_destroyWeak(&v87);
    objc_destroyWeak((id *)&token);
    lazyFetchFilterIdentifier = v9->_lazyFetchFilterIdentifier;
    v9->_lazyFetchFilterIdentifier = (PLLazyObject *)v73;

    v75 = objc_initWeak((id *)&token, v9);
    v76 = objc_alloc(MEMORY[0x1E0D73248]);
    v81 = v52;
    v82 = 3221225472;
    v83 = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_7;
    v84 = &unk_1E36759D8;
    objc_copyWeak(&v85, (id *)&token);
    v77 = objc_msgSend(v76, "initWithBlock:", &v81);
    objc_destroyWeak(&v85);
    objc_destroyWeak((id *)&token);
    lazyCaptureSessionState = v9->_lazyCaptureSessionState;
    v9->_lazyCaptureSessionState = (PLLazyObject *)v77;

    if (v17)
      -[PLAssetsdConnectionAuthorization _trackCAConnectionEvent](v9, "_trackCAConnectionEvent", v81, v82, v83, v84);
    v79 = v9;
  }

  return v9;
}

- (void)_setupAnalyticsCacheWithConnection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSString *trustedCallerBundleID;
  int v12;
  NSString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D732D8];
  v5 = a3;
  objc_msgSend(v5, "_xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_analyticsCacheReadEntitled = objc_msgSend(v4, "connection:hasEntitlement:", v6, *MEMORY[0x1E0D749E8]);

  v7 = (void *)MEMORY[0x1E0D732D8];
  objc_msgSend(v5, "_xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0D749F0];
  LODWORD(v5) = objc_msgSend(v7, "connection:hasEntitlement:", v8, *MEMORY[0x1E0D749F0]);

  if ((_DWORD)v5)
  {
    if (-[NSString isEqualToString:](self->_trustedCallerBundleID, "isEqualToString:", CFSTR("com.apple.photoanalysisd")))
    {
      self->_analyticsCacheWriteEntitled = 1;
    }
    else
    {
      self->_analyticsCacheWriteEntitled = 0;
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        trustedCallerBundleID = self->_trustedCallerBundleID;
        v12 = 138412546;
        v13 = trustedCallerBundleID;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_FAULT, "BundleID: %@ not permitted for %@", (uint8_t *)&v12, 0x16u);
      }

    }
  }
}

- (void)_setupSmartSharingCacheWithConnection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSString *trustedCallerBundleID;
  int v12;
  NSString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D732D8];
  v5 = a3;
  objc_msgSend(v5, "_xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_smartSharingCacheReadEntitled = objc_msgSend(v4, "connection:hasEntitlement:", v6, *MEMORY[0x1E0D74A08]);

  v7 = (void *)MEMORY[0x1E0D732D8];
  objc_msgSend(v5, "_xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0D74A10];
  LODWORD(v5) = objc_msgSend(v7, "connection:hasEntitlement:", v8, *MEMORY[0x1E0D74A10]);

  if ((_DWORD)v5)
  {
    if (-[NSString isEqualToString:](self->_trustedCallerBundleID, "isEqualToString:", CFSTR("com.apple.photoanalysisd")))
    {
      self->_smartSharingCacheWriteEntitled = 1;
    }
    else
    {
      self->_smartSharingCacheWriteEntitled = 0;
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        trustedCallerBundleID = self->_trustedCallerBundleID;
        v12 = 138412546;
        v13 = trustedCallerBundleID;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_FAULT, "BundleID: %@ not permitted for %@", (uint8_t *)&v12, 0x16u);
      }

    }
  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%d)"), self->_trustedCallerBundleID, self->_clientProcessIdentifier);
}

- (id)_isPhotosAccessAllowed
{
  void *v3;
  __int128 v4;
  _OWORD v6[2];

  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)&self->_auditToken.val[4];
  v6[0] = *(_OWORD *)self->_auditToken.val;
  v6[1] = v4;
  objc_msgSend(v3, "photosAccessAllowedWithScope:auditToken:clientAuthorization:", 7, v6, self);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PLPhotosAccessAllowed());
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_isPhotosAddAccessAllowed
{
  void *v3;
  __int128 v4;
  _OWORD v6[2];

  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)&self->_auditToken.val[4];
  v6[0] = *(_OWORD *)self->_auditToken.val;
  v6[1] = v4;
  objc_msgSend(v3, "photosAccessAllowedWithScope:auditToken:clientAuthorization:", 1, v6, self);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PLPhotosAccessAllowed());
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setClientLimitedLibraryCapable:(BOOL)a3
{
  PLRunWithUnfairLock();
}

- (BOOL)isClientLimitedLibraryCapable
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  PLRunWithUnfairLock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)setClientMainBundleSandboxedURL:(id)a3
{
  objc_storeStrong((id *)&self->_clientMainBundleSandboxedURL, a3);
}

- (BOOL)isPhotosClient
{
  return -[NSString isEqualToString:](self->_trustedCallerBundleID, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));
}

- (BOOL)isQuickCheckReadyForAnalysisClient
{
  return -[PLAssetsdConnectionAuthorization isCameraClient](self, "isCameraClient")
      || -[PLAssetsdConnectionAuthorization isPhotosClient](self, "isPhotosClient")
      || -[PLAssetsdConnectionAuthorization _isPhotosPickerClient](self, "_isPhotosPickerClient")
      || -[PLAssetsdConnectionAuthorization _isPreferencesClient](self, "_isPreferencesClient")
      || -[NSString containsString:](self->_trustedCallerBundleID, "containsString:", CFSTR("photosctl"));
}

- (BOOL)_isPhotosPickerClient
{
  if (self->_trustedCallerBundleID)
    return objc_msgSend(&unk_1E3763EF0, "containsObject:");
  else
    return 0;
}

- (BOOL)_isPreferencesClient
{
  return -[NSString isEqualToString:](self->_trustedCallerBundleID, "isEqualToString:", CFSTR("com.apple.Preferences"));
}

- (BOOL)isCameraClient
{
  return PLIsCameraBundleIdentifier();
}

- (BOOL)isClientAuthorizedForSandboxExtensions
{
  uint64_t v2;
  __int128 v3;
  _OWORD v5[2];

  v2 = *MEMORY[0x1E0D73470];
  v3 = *(_OWORD *)&self->_auditToken.val[4];
  v5[0] = *(_OWORD *)self->_auditToken.val;
  v5[1] = v3;
  return objc_msgSend(MEMORY[0x1E0D732D8], "auditToken:hasEntitlement:", v5, v2);
}

- (LSBundleRecord)trustedCallerContainingBundleRecord
{
  return (LSBundleRecord *)-[PLLazyObject objectValue](self->_lazytrustedCallerContainingBundleRecord, "objectValue");
}

- (id)_trustedCallerContainingBundleRecord
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CA5848]);
  -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self, "trustedCallerBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:error:", v4, &v13);
  v6 = v13;

  if (!v5)
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self, "trustedCallerBundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Unable to get application record for bundleID: %@ with error: %@", buf, 0x16u);

    }
    goto LABEL_7;
  }
  objc_msgSend(v5, "containingBundleRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "containingBundleRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v9;
}

- (NSString)trustedCallerDisplayName
{
  return (NSString *)-[PLLazyObject objectValue](self->_lazyTrustedCallerDisplayName, "objectValue");
}

- (id)_trustedCallerDisplayName
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  __int128 v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _BYTE buf[32];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x19AEC04BC](self, a2))
  {
    -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self, "trustedCallerBundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "containsString:", CFSTR("photosctl")))
    {

LABEL_5:
      -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self, "trustedCallerBundleID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "copy");

      return v7;
    }
    -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self, "trustedCallerBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsString:", CFSTR("jujubectl"));

    if (v5)
      goto LABEL_5;
  }
  v18 = 0;
  v9 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v9;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", buf, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  -[PLAssetsdConnectionAuthorization trustedCallerContainingBundleRecord](self, "trustedCallerContainingBundleRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PLAssetsdConnectionAuthorization trustedCallerContainingBundleRecord](self, "trustedCallerContainingBundleRecord");
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  if (!v10)
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "%@ failed to get bundle proxy with error %@", buf, 0x16u);
    }
    v14 = 0;
    goto LABEL_14;
  }
  v14 = 0;
  if (!objc_msgSend(0, "length"))
  {
    objc_msgSend(v10, "localizedName");
    v15 = objc_claimAutoreleasedReturnValue();
    v14 = -[NSObject copy](v15, "copy");
LABEL_14:

  }
  if (!objc_msgSend(v14, "length"))
  {
    -[PLAssetsdConnectionAuthorization trustedCallerBundleID](self, "trustedCallerBundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");

    v14 = (id)v17;
  }

  return v14;
}

- (NSString)trustedCallerPhotoLibraryUsageDescription
{
  return (NSString *)-[PLLazyObject objectValue](self->_lazyTrustedCallerPhotoLibraryUsageDescription, "objectValue");
}

- (id)_trustedCallerPhotoLibraryUsageDescription
{
  __int128 v3;
  void *v4;
  id v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  id v10;
  _BYTE buf[32];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v3 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v3;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", buf, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (!v4)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "%@ failed to get bundle proxy with error %@", buf, 0x16u);
    }

    goto LABEL_7;
  }
  objc_msgSend(v4, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:ofClass:", *MEMORY[0x1E0D74468], objc_opt_class());
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v7)
LABEL_7:
    v7 = &stru_1E36789C0;

  return v7;
}

- (NSString)fetchFilterIdentifier
{
  return (NSString *)-[PLLazyObject objectValue](self->_lazyFetchFilterIdentifier, "objectValue");
}

- (id)_fetchFilterIdentifier
{
  return +[PLLimitedLibraryFetchFilter fetchFilterIdentifierForConnectionAuthorization:](PLLimitedLibraryFetchFilter, "fetchFilterIdentifierForConnectionAuthorization:", self);
}

- (BOOL)photoKitEntitledFor:(id)a3
{
  return -[NSSet containsObject:](self->_photoKitEntitlements, "containsObject:", a3);
}

- (PLCaptureSessionState)captureSessionState
{
  return (PLCaptureSessionState *)-[PLLazyObject objectValue](self->_lazyCaptureSessionState, "objectValue");
}

- (id)_captureSessionState
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)&self->_auditToken.val[4];
  v4[0] = *(_OWORD *)self->_auditToken.val;
  v4[1] = v2;
  -[PLAssetsdConnectionAuthorization _captureSessionStateFromAuditToken:](self, "_captureSessionStateFromAuditToken:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_captureSessionStateFromAuditToken:(id *)a3
{
  PLDaemonServices *daemonServices;
  __int128 v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _BYTE v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((PLIsCaptureSessionEnabled() & 1) != 0)
  {
    daemonServices = self->_daemonServices;
    v6 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v11 = *(_OWORD *)a3->var0;
    *(_OWORD *)&v11[16] = v6;
    -[PLDaemonServices captureSessionStateFromAuditToken:](daemonServices, "captureSessionStateFromAuditToken:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLGatekeeperXPCGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PLAssetsdConnectionAuthorization description](self, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v11 = 138543618;
      *(_QWORD *)&v11[4] = v9;
      *(_WORD *)&v11[12] = 2114;
      *(_QWORD *)&v11[14] = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Capture Session: [client %{public}@] Session state from audit token: %{public}@", v11, 0x16u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73198], "none");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (BOOL)cloudInternalEntitled
{
  return self->_cloudInternalEntitled;
}

- (BOOL)clientIsSandboxed
{
  return self->_clientIsSandboxed;
}

- (BOOL)photosDataVaultEntitled
{
  return self->_photosDataVaultEntitled;
}

- (BOOL)coreSceneUnderstandingTaxonomyReadAuthorized
{
  return self->_coreSceneUnderstandingTaxonomyReadAuthorized;
}

- (BOOL)coreSceneUnderstandingTaxonomyWriteAuthorized
{
  return self->_coreSceneUnderstandingTaxonomyWriteAuthorized;
}

- (BOOL)managedSpotlightIndexReadWriteEntitled
{
  return self->_managedSpotlightIndexReadWriteEntitled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedCallerBundleID, 0);
  objc_storeStrong((id *)&self->_clientMainBundleSandboxedURL, 0);
  objc_storeStrong((id *)&self->_lazyCaptureSessionState, 0);
  objc_storeStrong((id *)&self->_lazyFetchFilterIdentifier, 0);
  objc_storeStrong((id *)&self->_lazyTrustedCallerPhotoLibraryUsageDescription, 0);
  objc_storeStrong((id *)&self->_lazyTrustedCallerDisplayName, 0);
  objc_storeStrong((id *)&self->_lazytrustedCallerContainingBundleRecord, 0);
  objc_storeStrong((id *)&self->_lazyPhotosAddAccessAllowed, 0);
  objc_storeStrong((id *)&self->_lazyPhotosAccessAllowed, 0);
  objc_storeStrong((id *)&self->_photoKitEntitlements, 0);
  objc_storeStrong((id *)&self->_daemonServices, 0);
}

uint64_t __65__PLAssetsdConnectionAuthorization_isClientLimitedLibraryCapable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 116);
  return result;
}

uint64_t __67__PLAssetsdConnectionAuthorization_setClientLimitedLibraryCapable___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 116) = *(_BYTE *)(result + 40);
  return result;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_isPhotosAccessAllowed");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_isPhotosAddAccessAllowed");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_trustedCallerContainingBundleRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_trustedCallerDisplayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_trustedCallerPhotoLibraryUsageDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_fetchFilterIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_captureSessionState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
