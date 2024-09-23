@implementation PLDefaultAssetsdServiceContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)hasEntitlement:(id)a3
{
  void *v3;
  char v4;

  -[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (PLDefaultAssetsdServiceContext)initWithSelector:(SEL)a3 connection:(id)a4 libraryBundle:(id)a5 connectionAuthorization:(id)a6
{
  id v11;
  id v12;
  id v13;
  PLDefaultAssetsdServiceContext *v14;
  PLDefaultAssetsdServiceContext *v15;
  PLDefaultAssetsdServiceContext *v16;
  objc_super v18;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PLDefaultAssetsdServiceContext;
  v14 = -[PLDefaultAssetsdServiceContext init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_selector = a3;
    objc_storeStrong((id *)&v14->_connection, a4);
    objc_storeStrong((id *)&v15->_libraryBundle, a5);
    objc_storeStrong((id *)&v15->_connectionAuthorization, a6);
    v16 = v15;
  }

  return v15;
}

- (void)invalidateClientAuthorizationCache
{
  -[PLAssetsdConnectionAuthorization invalidateClientAuthorizationCache](self->_connectionAuthorization, "invalidateClientAuthorizationCache");
}

- (NSError)shutdownReason
{
  return -[PLPhotoLibraryBundle shutdownReason](self->_libraryBundle, "shutdownReason");
}

- (void)awaitLibraryState:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t, id);
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, id))a4;
  -[PLDefaultAssetsdServiceContext libraryServicesManager](self, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v16 = 0;
    v9 = objc_msgSend(v7, "awaitLibraryState:error:", a3, &v16);
    v10 = v16;
    v6[2](v6, v9, v10);
  }
  else
  {
    PLGatekeeperXPCGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      -[PLDefaultAssetsdServiceContext clientDebugDescription](self, "clientDebugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_FAULT, "No library services manager: %{public}@", buf, 0xCu);

    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D74498];
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = CFSTR("No library services manager");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 41012, v15);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v6[2](v6, 0, v10);
  }

}

- (id)libraryServicesManager
{
  return -[PLPhotoLibraryBundle libraryServicesManager](self->_libraryBundle, "libraryServicesManager");
}

- (BOOL)isClientAuthorizedForTCCServicePhotos
{
  return -[PLAssetsdConnectionAuthorization isClientAuthorizedForTCCServicePhotos](self->_connectionAuthorization, "isClientAuthorizedForTCCServicePhotos");
}

- (BOOL)isClientAuthorizedForTCCServicePhotosAdd
{
  return -[PLAssetsdConnectionAuthorization isClientAuthorizedForTCCServicePhotosAdd](self->_connectionAuthorization, "isClientAuthorizedForTCCServicePhotosAdd");
}

- (NSString)clientDebugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  PLClientBundleIdentifierFromXPCConnection();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  NSStringFromSelector(self->_selector);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PID: %d, bundle ID: %@, selector: %@"), v5, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

@end
