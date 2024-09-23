@implementation TRIRemoteAssetStoreOperator

- (TRIRemoteAssetStoreOperator)initWithPaths:(id)a3
{
  id v5;
  TRIRemoteAssetStoreOperator *v6;
  TRIRemoteAssetStoreOperator *v7;
  uint64_t v8;
  TRIStorageManagementProtocol *storageManagement;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _PASXPCClientHelper *internalHelper;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TRIRemoteAssetStoreOperator;
  v6 = -[TRIRemoteAssetStoreOperator init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paths, a3);
    v8 = objc_opt_new();
    storageManagement = v7->_storageManagement;
    v7->_storageManagement = (TRIStorageManagementProtocol *)v8;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC7F860);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0D81640]);
    TRILogCategory_Server();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:allowSystemToUserConnection:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.triald.system.internal"), v10, 0, 0, 1, &__block_literal_global_36, &__block_literal_global_225, v12);
    internalHelper = v7->_internalHelper;
    v7->_internalHelper = (_PASXPCClientHelper *)v13;

  }
  return v7;
}

- (BOOL)saveAssetWithIdentifier:(id)a3 sourcePath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 removeSourceOnFailure:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v28;
  _BOOL4 v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[5];
  id v36;
  _BYTE buf[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v29 = a6;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  NSTemporaryDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "UUIDString");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  LOBYTE(v14) = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v36);
  v17 = v36;

  if ((v14 & 1) == 0)
  {
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Unable to create global source path at %{public}@: %@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "triForceRenameWithSourcePath:destPath:", v11, v15);
  v19 = v15;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRemoteAssetStoreOperator.m"), 72, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("globalSourcePath"));

  }
  +[TRISandboxExtensionFactory extensionTokenForPath:extensionClass:](TRISandboxExtensionFactory, "extensionTokenForPath:extensionClass:", v19, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  TRILogCategory_Server();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D207F000, v22, OS_LOG_TYPE_DEBUG, "Successfully created save asset extension.", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v38 = __Block_byref_object_copy__60;
    v39 = __Block_byref_object_dispose__60;
    v23 = MEMORY[0x1E0C809B0];
    v40 = 0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __101__TRIRemoteAssetStoreOperator_saveAssetWithIdentifier_sourcePath_flockWitness_removeSourceOnFailure___block_invoke;
    v35[3] = &unk_1E9333890;
    v35[4] = buf;
    v24 = (void *)MEMORY[0x1D8232C48](v35);
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v30[0] = v23;
    v30[1] = 3221225472;
    v30[2] = __101__TRIRemoteAssetStoreOperator_saveAssetWithIdentifier_sourcePath_flockWitness_removeSourceOnFailure___block_invoke_2;
    v30[3] = &unk_1E9334E50;
    v30[4] = &v31;
    objc_msgSend(v25, "saveAssetWithIdentifier:sourcePath:flockWitness:removeSourceOnFailure:sourceExtension:completion:", v10, v19, a5, v29, v20, v30);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      v26 = 0;
    else
      v26 = *((_BYTE *)v32 + 24) != 0;
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "Unable to get extension token. Bailing out from saveAssetWithIdentifier", buf, 2u);
    }

    v26 = 0;
  }

  return v26;
}

void __101__TRIRemoteAssetStoreOperator_saveAssetWithIdentifier_sourcePath_flockWitness_removeSourceOnFailure___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __101__TRIRemoteAssetStoreOperator_saveAssetWithIdentifier_sourcePath_flockWitness_removeSourceOnFailure___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)removeAssetWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__60;
  v20 = __Block_byref_object_dispose__60;
  v5 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__TRIRemoteAssetStoreOperator_removeAssetWithIdentifier___block_invoke;
  v15[3] = &unk_1E9333890;
  v15[4] = &v16;
  v6 = (void *)MEMORY[0x1D8232C48](v15);
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __57__TRIRemoteAssetStoreOperator_removeAssetWithIdentifier___block_invoke_2;
  v10[3] = &unk_1E9334E50;
  v10[4] = &v11;
  objc_msgSend(v7, "removeAssetWithIdentifier:completion:", v4, v10);
  if (v17[5])
    v8 = 0;
  else
    v8 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __57__TRIRemoteAssetStoreOperator_removeAssetWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __57__TRIRemoteAssetStoreOperator_removeAssetWithIdentifier___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)addSymlinkFromAssetWithIdentifier:(id)a3 toPath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5
{
  id v8;
  id v9;
  TRIAssetStore *v10;
  TRIAssetStoreOperator *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(MEMORY[0x1E0DC0B40], "hostingProcessIsTrialdSystem"))
  {
    v10 = -[TRIAssetStore initWithPaths:]([TRIAssetStore alloc], "initWithPaths:", self->_paths);
    v11 = -[TRIAssetStoreOperator initWithPaths:storageManagement:assetStore:]([TRIAssetStoreOperator alloc], "initWithPaths:storageManagement:assetStore:", self->_paths, self->_storageManagement, v10);
    v12 = -[TRIAssetStoreOperator addSymlinkFromAssetWithIdentifier:toPath:flockWitness:](v11, "addSymlinkFromAssetWithIdentifier:toPath:flockWitness:", v8, v9, a5);

  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__60;
    v27 = __Block_byref_object_dispose__60;
    v13 = MEMORY[0x1E0C809B0];
    v28 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __85__TRIRemoteAssetStoreOperator_addSymlinkFromAssetWithIdentifier_toPath_flockWitness___block_invoke;
    v22[3] = &unk_1E9333890;
    v22[4] = &v23;
    v14 = (void *)MEMORY[0x1D8232C48](v22);
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __85__TRIRemoteAssetStoreOperator_addSymlinkFromAssetWithIdentifier_toPath_flockWitness___block_invoke_2;
    v17[3] = &unk_1E9334E50;
    v17[4] = &v18;
    objc_msgSend(v15, "addSymlinkFromAssetWithIdentifier:toPath:flockWitness:completion:", v8, v9, a5, v17);
    if (v24[5])
      v12 = 0;
    else
      v12 = *((_BYTE *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v23, 8);
  }

  return v12;
}

void __85__TRIRemoteAssetStoreOperator_addSymlinkFromAssetWithIdentifier_toPath_flockWitness___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __85__TRIRemoteAssetStoreOperator_addSymlinkFromAssetWithIdentifier_toPath_flockWitness___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)referenceMAAutoAssetWithId:(id)a3 futurePath:(id)a4 currentPath:(id)a5 isFileFactor:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  id v13;
  TRIAssetStore *v14;
  TRIAssetStoreOperator *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[5];
  id v47;
  uint8_t v48[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  _BYTE buf[24];
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v6 = a6;
  v56 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v38 = v11;
  if (objc_msgSend(MEMORY[0x1E0DC0B40], "hostingProcessIsTrialdSystem"))
  {
    v14 = -[TRIAssetStore initWithPaths:]([TRIAssetStore alloc], "initWithPaths:", self->_paths);
    v15 = -[TRIAssetStoreOperator initWithPaths:storageManagement:assetStore:]([TRIAssetStoreOperator alloc], "initWithPaths:storageManagement:assetStore:", self->_paths, self->_storageManagement, v14);
    -[TRIAssetStoreOperator referenceMAAutoAssetWithId:futurePath:currentPath:isFileFactor:](v15, "referenceMAAutoAssetWithId:futurePath:currentPath:isFileFactor:", v11, v12, v13, v6);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSTemporaryDirectory();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "UUIDString");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", v19);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    LOBYTE(v19) = objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v37, 1, 0, &v47);
    v36 = v47;

    if ((v19 & 1) == 0)
    {
      TRILogCategory_Server();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v37;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v36;
        _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Unable to create global temp path at %{public}@: %@", buf, 0x16u);
      }

    }
    objc_msgSend(v13, "lastPathComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringByAppendingPathComponent:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    TRILogCategory_Server();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v23;
      _os_log_impl(&dword_1D207F000, v24, OS_LOG_TYPE_DEFAULT, "Trying to create maRef at %{public}@. To support this on macOS, we'll create it in a global location at %{public}@ first.", buf, 0x16u);
    }

    v25 = v23;
    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRemoteAssetStoreOperator.m"), 179, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("globalPath"));

    }
    +[TRISandboxExtensionFactory extensionTokenForPath:extensionClass:](TRISandboxExtensionFactory, "extensionTokenForPath:extensionClass:", v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v53 = __Block_byref_object_copy__60;
      v54 = __Block_byref_object_dispose__60;
      v27 = MEMORY[0x1E0C809B0];
      v55 = 0;
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __94__TRIRemoteAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke;
      v46[3] = &unk_1E9333890;
      v46[4] = buf;
      v28 = (void *)MEMORY[0x1D8232C48](v46);
      -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      v41 = &v40;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__60;
      v44 = __Block_byref_object_dispose__60;
      v45 = 0;
      v39[0] = v27;
      v39[1] = 3221225472;
      v39[2] = __94__TRIRemoteAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke_2;
      v39[3] = &unk_1E9336BC0;
      v39[4] = &v40;
      objc_msgSend(v29, "referenceMAAutoAssetWithId:futurePath:currentPath:isFileFactor:sourceExtension:completion:", v38, v12, v25, v6, v26, v39);
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        v16 = 0;
      }
      else
      {
        v31 = (void *)v41[5];
        if (v31)
        {
          TRILogCategory_Server();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = v41[5];
            *(_DWORD *)v48 = 138543618;
            v49 = v33;
            v50 = 2114;
            v51 = v13;
            _os_log_impl(&dword_1D207F000, v32, OS_LOG_TYPE_DEFAULT, "Now that the maRef has been created at %{public}@ we will move it back to %{public}@.", v48, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0CB3620], "triForceRenameWithSourcePath:destPath:", v41[5], v13);
          v31 = (void *)v41[5];
        }
        v16 = v31;
      }
      _Block_object_dispose(&v40, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      TRILogCategory_Server();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "Unable to get extension token. Bailing out from referenceMAAutoAssetWithId", buf, 2u);
      }

      v16 = 0;
    }

  }
  return v16;
}

void __94__TRIRemoteAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __94__TRIRemoteAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)collectGarbageOlderThanNumScans:(unsigned int)a3 deletedAssetSize:(unint64_t *)a4 ignoreRecentlyCreatedAssets:(BOOL)a5 dryRun:(BOOL)a6 includedCacheDeletableAssetIds:(id)a7 deletedAssetIds:(id *)a8
{
  uint64_t v10;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  _BOOL4 v18;
  _BOOL4 v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v18 = a5;
  v19 = a6;
  v10 = *(_QWORD *)&a3;
  v12 = a7;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__60;
  v36 = __Block_byref_object_dispose__60;
  v13 = MEMORY[0x1E0C809B0];
  v37 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __162__TRIRemoteAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke;
  v31[3] = &unk_1E9333890;
  v31[4] = &v32;
  v14 = (void *)MEMORY[0x1D8232C48](v31);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__60;
  v29 = __Block_byref_object_dispose__60;
  v30 = 0;
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __162__TRIRemoteAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke_2;
  v20[3] = &unk_1E9336BE8;
  v20[4] = &v21;
  v20[5] = &v25;
  objc_msgSend(v15, "collectGarbageOlderThanNumScans:deletedAssetSize:ignoreRecentlyCreatedAssets:dryRun:includedCacheDeletableAssetIds:completion:", v10, a4, v18, v19, v12, v20);
  if (a8)
    objc_storeStrong(a8, (id)v26[5]);
  if (v33[5])
    v16 = 0;
  else
    v16 = *((_BYTE *)v22 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v32, 8);

  return v16;
}

void __162__TRIRemoteAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __162__TRIRemoteAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)fixFileProtectionForAssetStoreFiles
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__60;
  v18 = __Block_byref_object_dispose__60;
  v3 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__TRIRemoteAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke;
  v13[3] = &unk_1E9333890;
  v13[4] = &v14;
  v4 = (void *)MEMORY[0x1D8232C48](v13, a2);
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __66__TRIRemoteAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke_2;
  v8[3] = &unk_1E9334E50;
  v8[4] = &v9;
  objc_msgSend(v5, "fixFileProtectionForAssetStoreWithCompletion:", v8);
  if (v15[5])
    v6 = 0;
  else
    v6 = *((_BYTE *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __66__TRIRemoteAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __66__TRIRemoteAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)saveFactorPackToGlobalPath:(id)a3 fromTemporaryPath:(id)a4 factors:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__60;
  v31 = __Block_byref_object_dispose__60;
  v12 = MEMORY[0x1E0C809B0];
  v32 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __84__TRIRemoteAssetStoreOperator_saveFactorPackToGlobalPath_fromTemporaryPath_factors___block_invoke;
  v26[3] = &unk_1E9333890;
  v26[4] = &v27;
  v13 = (void *)MEMORY[0x1D8232C48](v26);
  v14 = v10;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRemoteAssetStoreOperator.m"), 269, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("temporaryPath"));

  }
  +[TRISandboxExtensionFactory extensionTokenForPath:extensionClass:](TRISandboxExtensionFactory, "extensionTokenForPath:extensionClass:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v23 = buf;
    v24 = 0x2020000000;
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), getuid());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __84__TRIRemoteAssetStoreOperator_saveFactorPackToGlobalPath_fromTemporaryPath_factors___block_invoke_250;
    v21[3] = &unk_1E9334E50;
    v21[4] = buf;
    -[NSObject saveFactorPackForUserId:toGlobalPath:fromTemporaryPath:factors:sourceExtension:completion:](v16, "saveFactorPackForUserId:toGlobalPath:fromTemporaryPath:factors:sourceExtension:completion:", v17, v9, v14, v11, v15, v21);

    if (v28[5])
      v18 = 0;
    else
      v18 = v23[24] != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Unable to get extension token. Bailing out from saveFactorPackToGlobalPath", buf, 2u);
    }
    v18 = 0;
  }

  _Block_object_dispose(&v27, 8);
  return v18;
}

void __84__TRIRemoteAssetStoreOperator_saveFactorPackToGlobalPath_fromTemporaryPath_factors___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __84__TRIRemoteAssetStoreOperator_saveFactorPackToGlobalPath_fromTemporaryPath_factors___block_invoke_250(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updateFactorPackAtGlobalPath:(id)a3 withFactors:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__60;
  v24 = __Block_byref_object_dispose__60;
  v8 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_withFactors___block_invoke;
  v19[3] = &unk_1E9333890;
  v19[4] = &v20;
  v9 = (void *)MEMORY[0x1D8232C48](v19);
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), getuid());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __72__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_withFactors___block_invoke_2;
  v14[3] = &unk_1E9334E50;
  v14[4] = &v15;
  objc_msgSend(v10, "updateFactorPackForUserId:atGlobalPath:populatingFactors:completion:", v11, v6, v7, v14);

  if (v21[5])
    v12 = 0;
  else
    v12 = *((_BYTE *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __72__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_withFactors___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __72__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_withFactors___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updateFactorPackAtGlobalPath:(id)a3 deletingFactors:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__60;
  v24 = __Block_byref_object_dispose__60;
  v8 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_deletingFactors___block_invoke;
  v19[3] = &unk_1E9333890;
  v19[4] = &v20;
  v9 = (void *)MEMORY[0x1D8232C48](v19);
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), getuid());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __76__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_deletingFactors___block_invoke_2;
  v14[3] = &unk_1E9334E50;
  v14[4] = &v15;
  objc_msgSend(v10, "updateFactorPackForUserId:atGlobalPath:deletingFactors:completion:", v11, v6, v7, v14);

  if (v21[5])
    v12 = 0;
  else
    v12 = *((_BYTE *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __76__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_deletingFactors___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __76__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_deletingFactors___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)removeUnreferencedGlobalFactorPacksWithRemovedCount:(unsigned int *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__60;
  v20 = __Block_byref_object_dispose__60;
  v5 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__TRIRemoteAssetStoreOperator_removeUnreferencedGlobalFactorPacksWithRemovedCount___block_invoke;
  v15[3] = &unk_1E9333890;
  v15[4] = &v16;
  v6 = (void *)MEMORY[0x1D8232C48](v15, a2);
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __83__TRIRemoteAssetStoreOperator_removeUnreferencedGlobalFactorPacksWithRemovedCount___block_invoke_2;
  v10[3] = &unk_1E9336C10;
  v10[4] = &v11;
  v10[5] = a3;
  objc_msgSend(v7, "removeUnreferencedGlobalFactorPacksWithCompletion:", v10);
  if (v17[5])
    v8 = 0;
  else
    v8 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __83__TRIRemoteAssetStoreOperator_removeUnreferencedGlobalFactorPacksWithRemovedCount___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __83__TRIRemoteAssetStoreOperator_removeUnreferencedGlobalFactorPacksWithRemovedCount___block_invoke_2(uint64_t result, char a2, int a3)
{
  _DWORD *v3;

  v3 = *(_DWORD **)(result + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  if (v3)
    *v3 = a3;
  return result;
}

- (BOOL)overwriteGlobalActiveFactorProvidersWithNamespaceMap:(id)a3 factorPackMap:(id)a4 rolloutDeploymentMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__60;
  v26 = __Block_byref_object_dispose__60;
  v11 = MEMORY[0x1E0C809B0];
  v27 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __119__TRIRemoteAssetStoreOperator_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap___block_invoke;
  v21[3] = &unk_1E9333890;
  v21[4] = &v22;
  v12 = (void *)MEMORY[0x1D8232C48](v21);
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __119__TRIRemoteAssetStoreOperator_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap___block_invoke_2;
  v16[3] = &unk_1E9334E50;
  v16[4] = &v17;
  objc_msgSend(v13, "overwriteGlobalActiveFactorProvidersWithNamespaceMap:factorPackMap:rolloutDeploymentMap:completion:", v8, v9, v10, v16);
  if (v23[5])
    v14 = 0;
  else
    v14 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __119__TRIRemoteAssetStoreOperator_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __119__TRIRemoteAssetStoreOperator_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)migrateToGlobalAssetStoreIfNeeded
{
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v21;
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD v28[5];
  uint8_t v29[4];
  void *v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_INFO, "Considering migrating to the global asset store.", (uint8_t *)&buf, 2u);
  }

  -[TRIPaths assetStoreUsingGlobal:](self->_paths, "assetStoreUsingGlobal:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) != 0)
  {
    -[TRIPaths trialRootDirUsingGlobal:](self->_paths, "trialRootDirUsingGlobal:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRemoteAssetStoreOperator.m"), 390, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("extensionPath"));

    }
    +[TRISandboxExtensionFactory extensionTokenForPath:extensionClass:](TRISandboxExtensionFactory, "extensionTokenForPath:extensionClass:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__60;
      v34 = __Block_byref_object_dispose__60;
      v10 = MEMORY[0x1E0C809B0];
      v35 = 0;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __64__TRIRemoteAssetStoreOperator_migrateToGlobalAssetStoreIfNeeded__block_invoke;
      v28[3] = &unk_1E9333890;
      v28[4] = &buf;
      v11 = (void *)MEMORY[0x1D8232C48](v28);
      -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 0;
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __64__TRIRemoteAssetStoreOperator_migrateToGlobalAssetStoreIfNeeded__block_invoke_2;
      v23[3] = &unk_1E9334E50;
      v23[4] = &v24;
      objc_msgSend(v12, "migrateToGlobalAssetStoreIfNeededFromLocalStore:sourceExtension:completion:", v5, v9, v23);
      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40) || !*((_BYTE *)v25 + 24))
      {
        v13 = 0;
      }
      else
      {
        TRILogCategory_Server();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Removing local asset store following successful migration to global.", v29, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        v17 = objc_msgSend(v16, "triForceRemoveItemAtPath:error:", v5, &v22);
        v18 = v22;

        if ((v17 & 1) == 0)
        {
          TRILogCategory_Server();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v29 = 138543362;
            v30 = v5;
            _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Failed to delete local asset store after successfully migrating: %{public}@", v29, 0xCu);
          }

          *((_BYTE *)v25 + 24) = 0;
        }

        v13 = *((_BYTE *)v25 + 24) != 0;
      }
      _Block_object_dispose(&v24, 8);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Unable to get extension token. Bailing out from migrateToGlobalAssetStoreIfNeeded", (uint8_t *)&buf, 2u);
      }

      v13 = 0;
    }

  }
  else
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    v13 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_INFO, "No local asset store exists at %{public}@. No need to migrate.", (uint8_t *)&buf, 0xCu);
    }
  }

  return v13;
}

void __64__TRIRemoteAssetStoreOperator_migrateToGlobalAssetStoreIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __64__TRIRemoteAssetStoreOperator_migrateToGlobalAssetStoreIfNeeded__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageManagement, 0);
  objc_storeStrong((id *)&self->_internalHelper, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
