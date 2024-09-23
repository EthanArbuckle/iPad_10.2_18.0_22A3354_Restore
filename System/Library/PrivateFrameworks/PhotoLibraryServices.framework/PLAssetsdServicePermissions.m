@implementation PLAssetsdServicePermissions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredEntitlements, 0);
}

- (PLAssetsdServicePermissions)initWithPermissions:(id)a3
{
  id v5;
  PLAssetsdServicePermissions *v6;
  PLAssetsdServicePermissions *v7;
  uint64_t v8;
  NSArray *requiredEntitlements;
  PLAssetsdServicePermissions *v10;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdServicePermissions.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("permissions != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PLAssetsdServicePermissions;
  v6 = -[PLAssetsdServicePermissions init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_requiredAuthorization = *((_QWORD *)v5 + 2);
    v6->_allowsAuthorizationWithPhotoKitEntitlement = *((_BYTE *)v5 + 8);
    v8 = objc_msgSend(*((id *)v5 + 3), "copy");
    requiredEntitlements = v7->_requiredEntitlements;
    v7->_requiredEntitlements = (NSArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PLAssetsdServicePermissions initWithPermissions:]([PLAssetsdServicePermissions alloc], "initWithPermissions:", self);
}

uint64_t __62__PLAssetsdServicePermissions__verifyEntitlementsWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasEntitlement:", a2) ^ 1;
}

- (void)setRequiredEntitlements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setRequiredAuthorization:(int64_t)a3
{
  self->_requiredAuthorization = a3;
}

- (id)verifyPermissionsWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAssetsdServicePermissions _verifyAuthorizationWithContext:](self, "_verifyAuthorizationWithContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    PLGatekeeperXPCGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "clientDebugDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v5;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Authorization error: %@ for client: %{public}@", (uint8_t *)&v13, 0x16u);

    }
    v8 = v5;
  }
  else
  {
    -[PLAssetsdServicePermissions _verifyEntitlementsWithContext:](self, "_verifyEntitlementsWithContext:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      PLGatekeeperXPCGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "clientDebugDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v8;
        v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Entitlements error: %@ for client: %{public}@", (uint8_t *)&v13, 0x16u);

      }
      v11 = v8;
    }

  }
  return v8;
}

- (void)refreshCachedAuthorizationsWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating cached client authorizations", v5, 2u);
  }

  objc_msgSend(v3, "invalidateClientAuthorizationCache");
}

- (id)_verifyEntitlementsWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSArray *requiredEntitlements;
  void *v7;
  NSArray *v8;
  id v9;
  NSArray *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  NSArray *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLGatekeeperXPCGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    requiredEntitlements = self->_requiredEntitlements;
    objc_msgSend(v4, "clientDebugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = requiredEntitlements;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Checking entitlements: %@ for client: %@", buf, 0x16u);

  }
  v8 = self->_requiredEntitlements;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__PLAssetsdServicePermissions__verifyEntitlementsWithContext___block_invoke;
  v15[3] = &unk_1E3663348;
  v9 = v4;
  v16 = v9;
  -[NSArray _pl_filter:](v8, "_pl_filter:", v15);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  PLGatekeeperXPCGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "clientDebugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "Missing entitlements: %@ for client: %@", buf, 0x16u);

  }
  if (-[NSArray count](v10, "count"))
  {
    -[PLAssetsdServicePermissions _errorForMissingEntitlements:withContext:](self, "_errorForMissingEntitlements:withContext:", v10, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_verifyAuthorizationWithContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[PLAssetsdServicePermissions _isAuthorizedViaTCCWithContext:](self, "_isAuthorizedViaTCCWithContext:", v4)
    || -[PLAssetsdServicePermissions _isAuthorizedViaPhotoKitEntitlementWithContext:](self, "_isAuthorizedViaPhotoKitEntitlementWithContext:", v4))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46104, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)_isAuthorizedViaTCCWithContext:(id)a3
{
  id v4;
  int64_t requiredAuthorization;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  requiredAuthorization = self->_requiredAuthorization;
  if (requiredAuthorization)
  {
    if (requiredAuthorization == 2)
    {
      v6 = -[PLAssetsdServicePermissions _isAuthorizedForWriteOnlyWithContext:](self, "_isAuthorizedForWriteOnlyWithContext:", v4);
    }
    else
    {
      if (requiredAuthorization != 1)
      {
        v7 = 0;
        goto LABEL_9;
      }
      v6 = -[PLAssetsdServicePermissions _isAuthorizedForReadWriteWithContext:](self, "_isAuthorizedForReadWriteWithContext:", v4);
    }
    v7 = v6;
  }
  else
  {
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (BOOL)_isAuthorizedForReadWriteWithContext:(id)a3
{
  return objc_msgSend(a3, "isClientAuthorizedForTCCServicePhotos");
}

- (BOOL)_isAuthorizedForWriteOnlyWithContext:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isClientAuthorizedForTCCServicePhotosAdd") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isClientAuthorizedForTCCServicePhotos");

  return v4;
}

- (BOOL)_isAuthorizedViaPhotoKitEntitlementWithContext:(id)a3
{
  if (self->_allowsAuthorizationWithPhotoKitEntitlement)
    return objc_msgSend(a3, "hasEntitlement:", *MEMORY[0x1E0D749D8]);
  else
    return 0;
}

- (id)_errorForMissingEntitlements:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PLGatekeeperXPCGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "clientDebugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "assetsd client %{public}@ is missing required entitlements: %{public}@", buf, 0x16u);

  }
  v12 = CFSTR("MissingEntitlements");
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46104, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)requiredAuthorization
{
  return self->_requiredAuthorization;
}

- (BOOL)allowsAuthorizationWithPhotoKitEntitlement
{
  return self->_allowsAuthorizationWithPhotoKitEntitlement;
}

- (void)setAllowsAuthorizationWithPhotoKitEntitlement:(BOOL)a3
{
  self->_allowsAuthorizationWithPhotoKitEntitlement = a3;
}

- (NSArray)requiredEntitlements
{
  return self->_requiredEntitlements;
}

@end
