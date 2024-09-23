@implementation SBCPlaybackPositionService

- (SBCPlaybackPositionService)initWithPlaybackPositionDomain:(id)a3
{
  id v5;
  SBCClientConfiguration *v6;
  SBCPlaybackPositionService *v7;
  SBCPlaybackPositionService *v8;
  objc_super v10;

  v5 = a3;
  v6 = -[SBCClientConfiguration initWithPlaybackPositionDomain:]([SBCClientConfiguration alloc], "initWithPlaybackPositionDomain:", v5);
  v10.receiver = self;
  v10.super_class = (Class)SBCPlaybackPositionService;
  v7 = -[SBCXPCService initWithClientConfiguration:](&v10, sel_initWithClientConfiguration_, v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_playbackPositionDomain, a3);

  return v8;
}

- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BEC8910];
  v10 = a3;
  objc_msgSend(v9, "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iTunesCloudEntity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __89__SBCPlaybackPositionService_persistPlaybackPositionEntity_isCheckpoint_completionBlock___block_invoke;
  v14[3] = &unk_24F0D6DE0;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "persistPlaybackPositionEntity:isCheckpoint:completionBlock:", v12, v5, v14);

}

- (void)deletePlaybackPositionEntity:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BEC8910];
  v4 = a3;
  objc_msgSend(v3, "sharedService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iTunesCloudEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "deletePlaybackPositionEntity:", v5);
}

- (void)deletePlaybackPositionEntities
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEC8910], "sharedService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deletePlaybackPositionEntitiesFromLibraryWithIdentifier:", v3);

}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BEC8910];
  v4 = a3;
  objc_msgSend(v3, "sharedService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iTunesCloudEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateForeignDatabaseWithValuesFromPlaybackPositionEntity:", v5);
}

- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x24BEC8910], "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCPlaybackPositionDomain domainIdentifier](self->_playbackPositionDomain, "domainIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronizePlaybackPositionsForLibraryWithIdentifier:forDomain:isCheckpoint:", v6, v7, 0);

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
    v8 = v9;
  }

}

- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BEC8910];
  v8 = a3;
  objc_msgSend(v7, "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCPlaybackPositionDomain domainIdentifier](self->_playbackPositionDomain, "domainIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "libraryUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __92__SBCPlaybackPositionService_pullLocalPlaybackPositionForEntityIdentifiers_completionBlock___block_invoke;
  v14[3] = &unk_24F0D6E30;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v9, "getLocalPlaybackPositionForEntityIdentifiers:forDomain:fromLibraryWithIdentifier:completionBlock:", v8, v10, v12, v14);

}

- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BEC8910];
  v8 = a3;
  objc_msgSend(v7, "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iTunesCloudEntity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__SBCPlaybackPositionService_pullPlaybackPositionEntity_completionBlock___block_invoke;
  v12[3] = &unk_24F0D6E58;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "pullPlaybackPositionEntity:completionBlock:", v10, v12);

}

- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BEC8910];
  v8 = a3;
  objc_msgSend(v7, "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iTunesCloudEntity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__SBCPlaybackPositionService_pushPlaybackPositionEntity_completionBlock___block_invoke;
  v12[3] = &unk_24F0D6E58;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "pushPlaybackPositionEntity:completionBlock:", v10, v12);

}

- (SBCPlaybackPositionDomain)playbackPositionDomain
{
  return self->_playbackPositionDomain;
}

- (BOOL)usingPlaybackPositions
{
  return self->_usingPlaybackPositions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackPositionDomain, 0);
}

void __73__SBCPlaybackPositionService_pushPlaybackPositionEntity_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.amp.StoreBookkeeperClient", "Default");
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "msv_description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v11;
      v18 = 1024;
      v19 = a2;
      v20 = 2114;
      v21 = v8;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_228272000, v10, OS_LOG_TYPE_ERROR, "%{public}@ pushPlaybackPositionEntity completed. success=%{BOOL}u entity=%{public}@ error=%{public}@", (uint8_t *)&v16, 0x26u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v16 = 138543874;
    v17 = v13;
    v18 = 1024;
    v19 = a2;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_228272000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ pushPlaybackPositionEntity completed. success=%{BOOL}u entity=%{public}@", (uint8_t *)&v16, 0x1Cu);
  }

  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
  {
    objc_msgSend(v8, "sbcEntity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id, void *))(v14 + 16))(v14, a2, v7, v15);

  }
}

void __73__SBCPlaybackPositionService_pullPlaybackPositionEntity_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.amp.StoreBookkeeperClient", "Default");
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "msv_description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v11;
      v18 = 1024;
      v19 = a2;
      v20 = 2114;
      v21 = v8;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_228272000, v10, OS_LOG_TYPE_ERROR, "%{public}@ pullPlaybackPositionEntity completed. success=%{BOOL}u entity=%{public}@ error=%{public}@", (uint8_t *)&v16, 0x26u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v16 = 138543874;
    v17 = v13;
    v18 = 1024;
    v19 = a2;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_228272000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ pullPlaybackPositionEntity completed. success=%{BOOL}u entity=%{public}@", (uint8_t *)&v16, 0x1Cu);
  }

  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
  {
    objc_msgSend(v8, "sbcEntity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id, void *))(v14 + 16))(v14, a2, v7, v15);

  }
}

void __92__SBCPlaybackPositionService_pullLocalPlaybackPositionForEntityIdentifiers_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.amp.StoreBookkeeperClient", "Default");
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = objc_msgSend(v8, "count");
      objc_msgSend(v7, "msv_description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v11;
      v22 = 2048;
      v23 = v12;
      v24 = 1024;
      v25 = a2;
      v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_228272000, v10, OS_LOG_TYPE_ERROR, "%{public}@ pullLocalPlaybackPositionForEntityIdentifiers completed with %lu entities. success=%{BOOL}u error=%{public}@", buf, 0x26u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v21 = v14;
    v22 = 2048;
    v23 = objc_msgSend(v8, "count");
    v24 = 1024;
    v25 = a2;
    _os_log_impl(&dword_228272000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ pullLocalPlaybackPositionForEntityIdentifiers completed with %lu entities. success=%{BOOL}u", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __92__SBCPlaybackPositionService_pullLocalPlaybackPositionForEntityIdentifiers_completionBlock___block_invoke_7;
  v18[3] = &unk_24F0D6E08;
  v16 = v15;
  v19 = v16;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, uint64_t, id, id))(v17 + 16))(v17, a2, v7, v16);

}

void __92__SBCPlaybackPositionService_pullLocalPlaybackPositionForEntityIdentifiers_completionBlock___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sbcEntity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __89__SBCPlaybackPositionService_persistPlaybackPositionEntity_isCheckpoint_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.StoreBookkeeperClient", "Default");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v8;
      v14 = 1024;
      v15 = a2;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_228272000, v7, OS_LOG_TYPE_ERROR, "%{public}@ persistPlaybackPositionEntity completed. success=%{BOOL}u error=%{public}@", (uint8_t *)&v12, 0x1Cu);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v12 = 138543618;
    v13 = v10;
    v14 = 1024;
    v15 = a2;
    _os_log_impl(&dword_228272000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ persistPlaybackPositionEntity completed. success=%{BOOL}u", (uint8_t *)&v12, 0x12u);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, a2);

}

+ (id)serviceForSyncDomain:(id)a3
{
  id v3;
  SBCPlaybackPositionSyncService *v4;

  v3 = a3;
  v4 = -[SBCPlaybackPositionService initWithPlaybackPositionDomain:]([SBCPlaybackPositionSyncService alloc], "initWithPlaybackPositionDomain:", v3);

  return v4;
}

+ (id)serviceForValueDomain:(id)a3
{
  id v3;
  SBCPlaybackPositionValueService *v4;

  v3 = a3;
  v4 = -[SBCPlaybackPositionService initWithPlaybackPositionDomain:]([SBCPlaybackPositionValueService alloc], "initWithPlaybackPositionDomain:", v3);

  return v4;
}

+ (Class)XPCServiceInterfaceClass
{
  return (Class)objc_opt_class();
}

@end
