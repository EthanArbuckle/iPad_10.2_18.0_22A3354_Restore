@implementation PLClientPhotoLibraryBundle

- (id)newChangePublisher
{
  PLClientChangePublisher *v3;
  void *v4;
  PLClientChangePublisher *v5;

  v3 = [PLClientChangePublisher alloc];
  -[PLPhotoLibraryBundle assetsdClient](self, "assetsdClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLClientChangePublisher initWithAssetsdClient:](v3, "initWithAssetsdClient:", v4);

  return v5;
}

- (id)newLibraryServicesManager
{
  return 0;
}

- (id)newAssetsdClient
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D73168]), "initWithPhotoLibraryURL:", self->super._libraryURL);
}

- (PLClientPhotoLibraryBundle)initWithLibraryURL:(id)a3 bundleController:(id)a4
{
  PLClientPhotoLibraryBundle *v4;
  PLClientPhotoLibraryBundle *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLClientPhotoLibraryBundle;
  v4 = -[PLPhotoLibraryBundle initWithLibraryURL:bundleController:](&v7, sel_initWithLibraryURL_bundleController_, a3, a4);
  v5 = v4;
  if (v4)
    -[PLClientPhotoLibraryBundle _initClientSandboxExtensionCache](v4, "_initClientSandboxExtensionCache");
  return v5;
}

- (void)_initClientSandboxExtensionCache
{
  id v3;
  id v4;
  PLLazyObject *v5;
  PLLazyObject *lazyClientSandboxExtensionCache;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = objc_initWeak(&location, self);

  v4 = objc_alloc(MEMORY[0x1E0D73248]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PLClientPhotoLibraryBundle__initClientSandboxExtensionCache__block_invoke;
  v7[3] = &unk_1E36759D8;
  objc_copyWeak(&v8, &location);
  v5 = (PLLazyObject *)objc_msgSend(v4, "initWithBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  lazyClientSandboxExtensionCache = self->_lazyClientSandboxExtensionCache;
  self->_lazyClientSandboxExtensionCache = v5;

}

- (id)newBoundAssetsdServicesTable
{
  return 0;
}

- (id)transferAssets:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(a4, "assetsdClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "libraryClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transferAssetsWithUuids:fromLibraryURL:transferOptions:completionHandler:", v12, v15, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)transferPersons:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(a4, "assetsdClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "libraryClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transferPersonsWithUuids:fromLibraryURL:transferOptions:completionHandler:", v12, v15, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)close
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  PLClientPhotoLibraryBundle *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v8 = objc_opt_class();
    v9 = 2048;
    v10 = self;
    v11 = 2080;
    v12 = "-[PLClientPhotoLibraryBundle close]";
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p %s", buf, 0x20u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PLClientPhotoLibraryBundle;
  -[PLPhotoLibraryBundle close](&v6, sel_close);
  -[PLPhotoLibraryBundle pathManager](self, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLLibraryIDFromPathManager();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLUnregisterDataStoresForLibraryID(v5);

}

- (id)clientSandboxExtensionCache
{
  return (id)-[PLLazyObject objectValue](self->_lazyClientSandboxExtensionCache, "objectValue");
}

- (void)_invalidateClientSandboxExtensionCache
{
  -[PLLazyObject invalidate](self->_lazyClientSandboxExtensionCache, "invalidate");
}

- (void)setCloudPhotoLibraryEnabled:(BOOL)a3
{
  -[PLClientPhotoLibraryBundle _setCloudPhotoLibraryEnabled:sync:](self, "_setCloudPhotoLibraryEnabled:sync:", a3, 0);
}

- (void)setCloudPhotoLibraryEnabledSync:(BOOL)a3
{
  -[PLClientPhotoLibraryBundle _setCloudPhotoLibraryEnabled:sync:](self, "_setCloudPhotoLibraryEnabled:sync:", a3, 1);
}

- (void)_setCloudPhotoLibraryEnabled:(BOOL)a3 sync:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a4;
  v5 = a3;
  -[PLPhotoLibraryBundle indicatorFileCoordinator](self, "indicatorFileCoordinator");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logCloudServiceEnableEvent:serviceName:reason:", v5, CFSTR("CPL"), 0);
  -[PLPhotoLibraryBundle assetsdClient](self, "assetsdClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudInternalClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v11, "writeDisableICloudPhotosMarker");
    v9 = v8;
    v10 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v11, "writeEnableICloudPhotosMarker");
  v9 = v8;
  v10 = 1;
  if (v4)
  {
LABEL_5:
    objc_msgSend(v9, "setCloudPhotoLibraryEnabledStateSync:", v10);
    goto LABEL_6;
  }
  objc_msgSend(v8, "setCloudPhotoLibraryEnabledState:", 1);
LABEL_6:

}

- (void)setSharedAlbumEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PLPhotoLibraryBundle indicatorFileCoordinator](self, "indicatorFileCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logCloudServiceEnableEvent:serviceName:reason:", v3, CFSTR("SharedAlbum"), 0);

  -[PLPhotoLibraryBundle pathManager](self, "pathManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharingEnablingJob enableCloudSharing:withPathManager:](PLCloudSharingEnablingJob, "enableCloudSharing:withPathManager:", v3, v6);

}

- (void)setPhotoStreamEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  -[PLPhotoLibraryBundle indicatorFileCoordinator](self, "indicatorFileCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCloudServiceEnableEvent:serviceName:reason:", v3, CFSTR("MPS"), 0);

  +[PLPhotoLibrary setPhotoStreamEnabled:](PLPhotoLibrary, "setPhotoStreamEnabled:", v3);
}

- (BOOL)calculateTotalSizeWithResult:(id)a3
{
  void (**v5)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v5 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))a3;
  -[PLPhotoLibraryBundle assetsdClient](self, "assetsdClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryManagementClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryBundle.m"), 591, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("managementClient"));

  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__73314;
  v16 = __Block_byref_object_dispose__73315;
  v17 = 0;
  -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__PLClientPhotoLibraryBundle_calculateTotalSizeWithResult___block_invoke;
  v11[3] = &unk_1E3670A60;
  v11[4] = &v12;
  v11[5] = &v30;
  v11[6] = &v26;
  v11[7] = &v22;
  v11[8] = &v18;
  objc_msgSend(v7, "filesystemSizeForLibraryURL:result:", v8, v11);

  v5[2](v5, v31[3], v27[3], v23[3], v19[3], v13[5]);
  LOBYTE(v8) = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return (char)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyClientSandboxExtensionCache, 0);
}

void __59__PLClientPhotoLibraryBundle_calculateTotalSizeWithResult___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v12;
  id v13;

  v12 = a6;
  if (v12)
  {
    v13 = v12;
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a6);
    v12 = v13;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a4;
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = a5;
  }

}

PLClientSandboxExtensionCache *__62__PLClientPhotoLibraryBundle__initClientSandboxExtensionCache__block_invoke(uint64_t a1)
{
  id WeakRetained;
  PLClientSandboxExtensionCache *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLClientSandboxExtensionCache initWithCacheLimit:]([PLClientSandboxExtensionCache alloc], "initWithCacheLimit:", 200);
  else
    v2 = 0;

  return v2;
}

@end
