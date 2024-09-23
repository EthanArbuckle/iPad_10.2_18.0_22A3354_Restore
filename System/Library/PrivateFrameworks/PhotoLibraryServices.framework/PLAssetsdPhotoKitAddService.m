@implementation PLAssetsdPhotoKitAddService

- (PLAssetsdPhotoKitAddService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4
{
  id v6;
  id v7;
  PLAssetsdPhotoKitAddService *v8;
  PLAssetsdPhotoKitAddService *v9;
  uint64_t v10;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  void *v12;
  PLCameraCaptureTaskConstraintCoordinator *v13;
  PLCameraCaptureTaskConstraintCoordinator *cameraTaskConstraintCoordinator;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLAssetsdPhotoKitAddService;
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PhotoKitAddService: %@"), v7);
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
  v3.super_class = (Class)PLAssetsdPhotoKitAddService;
  -[PLAssetsdPhotoKitAddService dealloc](&v3, sel_dealloc);
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
    v19 = "-[PLAssetsdPhotoKitAddService applyChangesRequest:reply:]";
    v20 = 2112;
    v21 = v6;
    v22 = 1024;
    v23 = v10;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "##### %s %@ entitled:%d", buf, 0x1Cu);
  }

  -[PLAssetsdPhotoKitAddService commitRequest:reply:](self, "commitRequest:reply:", v6, v7);
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
  return 2;
}

- (BOOL)validatePhotosAccessScopeForChangesRequest:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "accessScopeOptionsRequiredForRequestedChanges") < 2;
}

- (void)commitRequest:(id)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  void (**v8)(id, _QWORD, uint64_t);

  v8 = (void (**)(id, _QWORD, uint64_t))a4;
  v6 = a3;
  if (-[PLAssetsdPhotoKitAddService validatePhotosAccessScopeForChangesRequest:](self, "validatePhotosAccessScopeForChangesRequest:", v6))
  {
    objc_msgSend(v6, "executeWithService:reply:", self, v8);
  }
  else
  {
    objc_msgSend(v6, "errorWithLocalizedDescription:", CFSTR("Authorization failure for changes"));
    v7 = objc_claimAutoreleasedReturnValue();

    v8[2](v8, 0, v7);
    v6 = (id)v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraTaskConstraintCoordinator, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

@end
