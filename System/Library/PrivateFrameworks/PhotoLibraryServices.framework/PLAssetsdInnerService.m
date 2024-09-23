@implementation PLAssetsdInnerService

- (PLAssetsdInnerService)initWithPermissions:(id)a3 requiredLibraryServicesState:(int64_t)a4 lazyService:(id)a5
{
  id v8;
  id v9;
  PLAssetsdInnerService *v10;
  uint64_t v11;
  PLAssetsdServicePermissions *permissions;
  PLAssetsdInnerService *v13;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLAssetsdInnerService;
  v10 = -[PLAssetsdInnerService init](&v15, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    permissions = v10->_permissions;
    v10->_permissions = (PLAssetsdServicePermissions *)v11;

    v10->_requiredState = a4;
    objc_storeStrong((id *)&v10->_lazyService, a5);
    v13 = v10;
  }

  return v10;
}

- (void)getInnerServiceWithContext:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  PLAssetsdInnerService *v13;
  void (**v14)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[PLAssetsdServicePermissions refreshCachedAuthorizationsWithContext:](self->_permissions, "refreshCachedAuthorizationsWithContext:", v6);
  -[PLAssetsdServicePermissions verifyPermissionsWithContext:](self->_permissions, "verifyPermissionsWithContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    PLGatekeeperXPCGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "clientDebugDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Verify permissions error: %@ for client: %{public}@", buf, 0x16u);

    }
    v7[2](v7, 0, v8);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__PLAssetsdInnerService_getInnerServiceWithContext_reply___block_invoke;
    v11[3] = &unk_1E36778D0;
    v12 = v6;
    v13 = self;
    v14 = v7;
    -[PLAssetsdInnerService _awaitForRequiredLibraryStateWithContext:completionHandler:](self, "_awaitForRequiredLibraryStateWithContext:completionHandler:", v12, v11);

  }
}

- (void)_awaitForRequiredLibraryStateWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  NSObject *v9;
  int64_t requiredState;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(id, void *);
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(v6, "shutdownReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    PLGatekeeperXPCGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Library is shutting down: %@", buf, 0xCu);
    }

    v7[2](v7, v8);
  }
  else
  {
    requiredState = self->_requiredState;
    PLGatekeeperXPCGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (requiredState)
    {
      if (v12)
      {
        PLStringFromLibraryServicesState();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "clientDebugDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v13;
        v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "Waiting for library services manager state: %@ for client: %@", buf, 0x16u);

      }
      v15 = self->_requiredState;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __84__PLAssetsdInnerService__awaitForRequiredLibraryStateWithContext_completionHandler___block_invoke;
      v17[3] = &unk_1E36768D0;
      v18 = v7;
      objc_msgSend(v6, "awaitLibraryState:completionHandler:", v15, v17);

    }
    else
    {
      if (v12)
      {
        objc_msgSend(v6, "clientDebugDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v16;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "No required library services manager state for client: %@", buf, 0xCu);

      }
      v7[2](v7, 0);
    }
  }

}

uint64_t __84__PLAssetsdInnerService__awaitForRequiredLibraryStateWithContext_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
    v4 = 0;
  else
    v4 = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

void __58__PLAssetsdInnerService_getInnerServiceWithContext_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLGatekeeperXPCGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "clientDebugDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v3;
      v19 = 2114;
      v20 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Await for required library state error: %@ for client: %{public}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLGatekeeperXPCGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "clientDebugDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v6;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Sending back service: %@ for client: %@", buf, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "clientDebugDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_FAULT, "assetsd service could not be initialized for client: %@", buf, 0xCu);

      }
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D74498];
      v15 = *MEMORY[0x1E0CB2D50];
      v16 = CFSTR("assetsd service could not be initialized");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 46501, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

- (id)instantiateInnerService
{
  return (id)-[PLLazyObject objectValue](self->_lazyService, "objectValue");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyService, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
}

@end
