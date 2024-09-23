@implementation TRIInternalSystemServiceRequestHandler

- (TRIInternalSystemServiceRequestHandler)initWithEntitlementWitness:(id)a3
{
  id v5;
  TRIInternalSystemServiceRequestHandler *v6;
  TRIInternalSystemServiceRequestHandler *v7;
  TRIAssetStore *v8;
  void *v9;
  uint64_t v10;
  TRIAssetStore *store;
  uint64_t v12;
  TRIStorageManagementProtocol *storageManagement;
  TRIAssetStoreOperator *v14;
  void *v15;
  uint64_t v16;
  TRIAssetStoreOperator *operator;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TRIInternalSystemServiceRequestHandler;
  v6 = -[TRIInternalSystemServiceRequestHandler init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_entitlementWitness, a3);
    v8 = [TRIAssetStore alloc];
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TRIAssetStore initWithPaths:](v8, "initWithPaths:", v9);
    store = v7->_store;
    v7->_store = (TRIAssetStore *)v10;

    v12 = objc_opt_new();
    storageManagement = v7->_storageManagement;
    v7->_storageManagement = (TRIStorageManagementProtocol *)v12;

    v14 = [TRIAssetStoreOperator alloc];
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TRIAssetStoreOperator initWithPaths:storageManagement:assetStore:](v14, "initWithPaths:storageManagement:assetStore:", v15, v7->_storageManagement, v7->_store);
    operator = v7->_operator;
    v7->_operator = (TRIAssetStoreOperator *)v16;

  }
  return v7;
}

- (void)saveAssetWithIdentifier:(id)a3 sourcePath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 removeSourceOnFailure:(BOOL)a6 sourceExtension:(id)a7 completion:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, BOOL);
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t v21[16];
  uint8_t buf[16];

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = (void (**)(id, BOOL))a8;
  v18 = objc_retainAutorelease(v16);
  objc_msgSend(v18, "UTF8String");
  v19 = sandbox_extension_consume();
  if (v19 == -1)
  {
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Failed to consume a sandbox extension", buf, 2u);
    }
  }
  else
  {
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v21 = 0;
      _os_log_debug_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEBUG, "Successfully consumed save asset extension.", v21, 2u);
    }
  }

  v17[2](v17, -[TRIAssetStoreOperator saveAssetWithIdentifier:sourcePath:flockWitness:removeSourceOnFailure:](self->_operator, "saveAssetWithIdentifier:sourcePath:flockWitness:removeSourceOnFailure:", v14, v15, a5, v10));
  if (v19 != -1)
    sandbox_extension_release();

}

- (void)removeAssetWithIdentifier:(id)a3 completion:(id)a4
{
  TRIAssetStoreOperator *operator;
  void (**v6)(id, uint64_t);

  operator = self->_operator;
  v6 = (void (**)(id, uint64_t))a4;
  v6[2](v6, -[TRIAssetStoreOperator removeAssetWithIdentifier:](operator, "removeAssetWithIdentifier:", a3));

}

- (void)addSymlinkFromAssetWithIdentifier:(id)a3 toPath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 completion:(id)a6
{
  TRIAssetStoreOperator *operator;
  void (**v10)(id, uint64_t);

  operator = self->_operator;
  v10 = (void (**)(id, uint64_t))a6;
  v10[2](v10, -[TRIAssetStoreOperator addSymlinkFromAssetWithIdentifier:toPath:flockWitness:](operator, "addSymlinkFromAssetWithIdentifier:toPath:flockWitness:", a3, a4, a5));

}

- (void)referenceMAAutoAssetWithId:(id)a3 futurePath:(id)a4 currentPath:(id)a5 isFileFactor:(BOOL)a6 sourceExtension:(id)a7 completion:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *);
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint8_t v23[16];

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = (void (**)(id, void *))a8;
  v19 = objc_retainAutorelease(v17);
  objc_msgSend(v19, "UTF8String");
  v20 = sandbox_extension_consume();
  if (v20 == -1)
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "failed to consume a sandbox extension", v23, 2u);
    }

  }
  -[TRIAssetStoreOperator referenceMAAutoAssetWithId:futurePath:currentPath:isFileFactor:](self->_operator, "referenceMAAutoAssetWithId:futurePath:currentPath:isFileFactor:", v14, v15, v16, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2](v18, v22);

  if (v20 != -1)
    sandbox_extension_release();

}

- (void)collectGarbageOlderThanNumScans:(unsigned int)a3 deletedAssetSize:(unint64_t *)a4 ignoreRecentlyCreatedAssets:(BOOL)a5 dryRun:(BOOL)a6 includedCacheDeletableAssetIds:(id)a7 completion:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v12;
  void (**v14)(id, _BOOL8, id);
  id v15;
  _BOOL8 v16;
  id v17;

  v9 = a6;
  v10 = a5;
  v12 = *(_QWORD *)&a3;
  v14 = (void (**)(id, _BOOL8, id))a8;
  v15 = a7;
  v17 = (id)objc_opt_new();
  v16 = -[TRIAssetStoreOperator collectGarbageOlderThanNumScans:deletedAssetSize:ignoreRecentlyCreatedAssets:dryRun:includedCacheDeletableAssetIds:deletedAssetIds:](self->_operator, "collectGarbageOlderThanNumScans:deletedAssetSize:ignoreRecentlyCreatedAssets:dryRun:includedCacheDeletableAssetIds:deletedAssetIds:", v12, a4, v10, v9, v15, &v17);

  v14[2](v14, v16, v17);
}

- (void)fixFileProtectionForAssetStoreWithCompletion:(id)a3
{
  TRIAssetStoreOperator *operator;
  void (**v4)(id, uint64_t);

  operator = self->_operator;
  v4 = (void (**)(id, uint64_t))a3;
  v4[2](v4, -[TRIAssetStoreOperator fixFileProtectionForAssetStoreFiles](operator, "fixFileProtectionForAssetStoreFiles"));

}

- (void)saveFactorPackForUserId:(id)a3 toGlobalPath:(id)a4 fromTemporaryPath:(id)a5 factors:(id)a6 sourceExtension:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v13 = a4;
  v14 = a5;
  v39 = a6;
  v37 = a7;
  v15 = (void (**)(id, _QWORD))a8;
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "treatmentsDirUsingGlobal:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v13, "hasPrefix:", v17);

  if ((a7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "fileExistsAtPath:", v19);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "fileExistsAtPath:", v22);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "fileExistsAtPath:", v25);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "fileExistsAtPath:", v28);

    if ((v20 | v23 ^ 1) == 1 && v26 | v29 ^ 1)
    {
      TRILogCategory_Server();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D207F000, v30, OS_LOG_TYPE_DEFAULT, "Factor pack already exists in the global directory. Updating the factorpack instead.", buf, 2u);
      }

      -[TRIInternalSystemServiceRequestHandler updateFactorPackForUserId:atGlobalPath:populatingFactors:completion:](self, "updateFactorPackForUserId:atGlobalPath:populatingFactors:completion:", v38, v13, v39, v15);
    }
    else
    {
      objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
      v32 = sandbox_extension_consume();
      if (v32 == -1)
      {
        TRILogCategory_Server();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "failed to consume a sandbox extension", buf, 2u);
        }

      }
      objc_msgSend(v13, "stringByDeletingLastPathComponent", self);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v34) & 1) != 0)
        v15[2](v15, objc_msgSend(MEMORY[0x1E0CB3620], "triForceRenameWithSourcePath:destPath:", v14, v13) & objc_msgSend(v36, "_updateOnDemandReferenceCountsForUser:atGlobalPath:addingFactors:removingFactors:newlyUnreferencedFactors:", v38, v13, v39, 0, 0));
      else
        v15[2](v15, 0);

      if (v32 != -1)
        sandbox_extension_release();
    }
  }
  else
  {
    TRILogCategory_Server();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v41 = v14;
      v42 = 2112;
      v43 = v13;
      _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Asked to save factor pack at %@ to non-treatment directory location: %@", buf, 0x16u);
    }

    v15[2](v15, 0);
  }

}

- (void)updateFactorPackForUserId:(id)a3 atGlobalPath:(id)a4 populatingFactors:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(id, _QWORD);
  void *v15;
  void *v16;
  char v17;
  TRIFactorPackStorage *v18;
  void *v19;
  TRIFactorPackStorage *v20;
  int v21;
  TRIFBFactorPackStorage *v22;
  void *v23;
  TRIFBFactorPackStorage *v24;
  NSObject *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1E0DC0B78];
  v14 = (void (**)(id, _QWORD))a6;
  objc_msgSend(v13, "sharedSystemPaths");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "treatmentsDirUsingGlobal:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v11, "hasPrefix:", v16);

  if ((v17 & 1) != 0)
  {
    v18 = [TRIFactorPackStorage alloc];
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[TRIFactorPackStorage initWithPaths:](v18, "initWithPaths:", v19);

    v21 = -[TRIFactorPackStorage updateSavedGlobalFactorPackAt:populatingAssetsForFactorNames:](v20, "updateSavedGlobalFactorPackAt:populatingAssetsForFactorNames:", v11, v12);
    if (_os_feature_enabled_impl())
    {
      v22 = [TRIFBFactorPackStorage alloc];
      objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[TRIFBFactorPackStorage initWithPaths:](v22, "initWithPaths:", v23);

      v21 &= -[TRIFBFactorPackStorage updateSavedGlobalFactorPackAt:populatingAssetsForFactorNames:](v24, "updateSavedGlobalFactorPackAt:populatingAssetsForFactorNames:", v11, v12);
    }
    v14[2](v14, v21 & -[TRIInternalSystemServiceRequestHandler _updateOnDemandReferenceCountsForUser:atGlobalPath:addingFactors:removingFactors:newlyUnreferencedFactors:](self, "_updateOnDemandReferenceCountsForUser:atGlobalPath:addingFactors:removingFactors:newlyUnreferencedFactors:", v10, v11, v12, 0, 0));

  }
  else
  {
    TRILogCategory_Server();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = 138412290;
      v27 = v11;
      _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Asked to update factor pack at non-global or non-treatment directory location: %@", (uint8_t *)&v26, 0xCu);
    }

    v14[2](v14, 0);
  }

}

- (void)updateFactorPackForUserId:(id)a3 atGlobalPath:(id)a4 deletingFactors:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  char v16;
  TRIFactorPackStorage *v17;
  void *v18;
  TRIFactorPackStorage *v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  uint64_t v23;
  TRIFBFactorPackStorage *v24;
  void *v25;
  TRIFBFactorPackStorage *v26;
  NSObject *v27;
  _BYTE v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "treatmentsDirUsingGlobal:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "hasPrefix:", v15);

  if ((v16 & 1) != 0)
  {
    *(_QWORD *)v28 = 0;
    v17 = [TRIFactorPackStorage alloc];
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[TRIFactorPackStorage initWithPaths:](v17, "initWithPaths:", v18);

    v20 = -[TRIInternalSystemServiceRequestHandler _updateOnDemandReferenceCountsForUser:atGlobalPath:addingFactors:removingFactors:newlyUnreferencedFactors:](self, "_updateOnDemandReferenceCountsForUser:atGlobalPath:addingFactors:removingFactors:newlyUnreferencedFactors:", v10, v11, 0, v12, v28);
    v21 = *(void **)v28;
    if (!v20)
      v21 = v12;
    v22 = v21;
    v23 = v20 & -[TRIFactorPackStorage updateSavedGlobalFactorPackAt:deletingAssetsWithFactorNames:](v19, "updateSavedGlobalFactorPackAt:deletingAssetsWithFactorNames:", v11, v22);
    if (_os_feature_enabled_impl())
    {
      v24 = [TRIFBFactorPackStorage alloc];
      objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[TRIFBFactorPackStorage initWithPaths:](v24, "initWithPaths:", v25);

      v23 = v23 & -[TRIFBFactorPackStorage updateSavedGlobalFactorPackAt:deletingAssetsWithFactorNames:](v26, "updateSavedGlobalFactorPackAt:deletingAssetsWithFactorNames:", v11, v22);
    }
    v13[2](v13, v23);

  }
  else
  {
    TRILogCategory_Server();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v28 = 138412290;
      *(_QWORD *)&v28[4] = v11;
      _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Asked to delete factor pack at non-global or non-treatment directory location: %@", v28, 0xCu);
    }

    v13[2](v13, 0);
  }

}

- (void)removeUnreferencedGlobalFactorPacksWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  TRIFBFactorPackStorage *v4;
  void *v5;
  TRIFBFactorPackStorage *v6;
  uint64_t v7;
  unsigned int v8;

  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  v4 = [TRIFBFactorPackStorage alloc];
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TRIFBFactorPackStorage initWithPaths:](v4, "initWithPaths:", v5);

  v8 = 0;
  v7 = -[TRIFBFactorPackStorage removeUnreferencedGlobalFactorPacksWithRemovedCount:](v6, "removeUnreferencedGlobalFactorPacksWithRemovedCount:", &v8);
  v3[2](v3, v7, v8);

}

- (void)overwriteGlobalActiveFactorProvidersWithNamespaceMap:(id)a3 factorPackMap:(id)a4 rolloutDeploymentMap:(id)a5 completion:(id)a6
{
  void (**v9)(id, uint64_t);
  id v10;
  id v11;
  id v12;
  TRINamespaceResolverStorage *v13;
  void *v14;
  uint64_t v15;
  TRINamespaceResolverStorage *v16;

  v9 = (void (**)(id, uint64_t))a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [TRINamespaceResolverStorage alloc];
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TRINamespaceResolverStorage initWithPaths:](v13, "initWithPaths:", v14);

  v15 = -[TRINamespaceResolverStorage overwriteGlobalActiveFactorProvidersWithNamespaceMap:factorPackMap:rolloutDeploymentMap:](v16, "overwriteGlobalActiveFactorProvidersWithNamespaceMap:factorPackMap:rolloutDeploymentMap:", v12, v11, v10);
  v9[2](v9, v15);

}

- (BOOL)_getOnDemandReferenceCountsAtGlobalPath:(id)a3 onDemandFactorsPerUser:(id *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "treatmentsDirUsingGlobal:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "hasPrefix:", v9);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("onDemandFactorsSubscribedUserMap.plplist"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileExistsAtPath:", v11);

    if (v14)
    {
      v24 = 0;
      objc_msgSend(MEMORY[0x1E0D815D0], "dictionaryWithPath:error:", v11, &v24);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v24;
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "localizedDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v26 = v21;
          v27 = 2112;
          v28 = v11;
          _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Failed to open users per factors file with error %{public}@ at path %@", buf, 0x16u);

        }
        if (a5)
          *a5 = objc_retainAutorelease(v16);

        v19 = 0;
        goto LABEL_18;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_INFO, "Successfully opened the users per factors file.", buf, 2u);
      }

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __111__TRIInternalSystemServiceRequestHandler__getOnDemandReferenceCountsAtGlobalPath_onDemandFactorsPerUser_error___block_invoke;
      v22[3] = &unk_1E93315E0;
      v23 = v12;
      -[NSObject enumerateKeysAndObjectsUsingBlock:](v15, "enumerateKeysAndObjectsUsingBlock:", v22);

    }
    else
    {
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_INFO, "Couldn't locate a global users per factors file. Will create a new one when saving.", buf, 2u);
      }
    }

    *a4 = objc_retainAutorelease(v12);
    v19 = 1;
LABEL_18:

    goto LABEL_19;
  }
  TRILogCategory_Server();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v7;
    _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Asked to update ref count at non-global or non-treatment directory location: %@", buf, 0xCu);
  }
  v19 = 0;
LABEL_19:

  return v19;
}

void __111__TRIInternalSystemServiceRequestHandler__getOnDemandReferenceCountsAtGlobalPath_onDemandFactorsPerUser_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "setValue:forKey:", v6, v5);

}

- (BOOL)_updateOnDemandReferenceCountsForUser:(id)a3 atGlobalPath:(id)a4 addingFactors:(id)a5 removingFactors:(id)a6 newlyUnreferencedFactors:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  BOOL v46;
  BOOL v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v55;
  id *v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  os_log_t log;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("onDemandFactorsSubscribedUserMap.plplist"));
  v60 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  v71 = v16;
  LOBYTE(a5) = -[TRIInternalSystemServiceRequestHandler _getOnDemandReferenceCountsAtGlobalPath:onDemandFactorsPerUser:error:](self, "_getOnDemandReferenceCountsAtGlobalPath:onDemandFactorsPerUser:error:", v13, &v71, 0);
  v17 = v71;

  if ((a5 & 1) != 0)
  {
    v56 = a7;
    v57 = v14;
    v58 = v13;
    v59 = v15;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v18 = v14;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v68 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKeyedSubscript:", v23, v56);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, v23);
          }
          else
          {
            v25 = (void *)objc_opt_new();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v23);

          }
          objc_msgSend(v17, "objectForKeyedSubscript:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "containsObject:", v12);

          if ((v27 & 1) == 0)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", v23);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v12);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
      }
      while (v20);
    }

    log = (os_log_t)objc_opt_new();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v29 = v59;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v64 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
          objc_msgSend(v17, "objectForKeyedSubscript:", v34, v56);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "removeObject:", v12);

            objc_msgSend(v17, "objectForKeyedSubscript:", v34);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "count");

            if (v38)
              continue;
            objc_msgSend(v17, "removeObjectForKey:", v34);
            -[NSObject addObject:](log, "addObject:", v34);
            TRILogCategory_Server();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v73 = (uint64_t)v34;
              v40 = v39;
              v41 = "Factor %@ is now unreferenced by all users.";
LABEL_25:
              _os_log_impl(&dword_1D207F000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);
            }
          }
          else
          {
            TRILogCategory_Server();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v73 = (uint64_t)v34;
              v40 = v39;
              v41 = "Attempting to remove factor %@ that was not referenced.";
              goto LABEL_25;
            }
          }

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
      }
      while (v31);
    }

    v62 = 0;
    v42 = (void *)v60;
    objc_msgSend(MEMORY[0x1E0D815D0], "fileBackedDataWithPropertyList:writtenToPath:error:", v17, v60, &v62);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v62;
    v45 = v44;
    if (v43)
      v46 = v44 == 0;
    else
      v46 = 0;
    v47 = v46;
    TRILogCategory_Server();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v47)
    {
      v13 = v58;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v50 = objc_msgSend(v18, "count");
        v51 = objc_msgSend(v29, "count");
        v52 = -[NSObject count](log, "count");
        *(_DWORD *)buf = 134218496;
        v73 = v50;
        v42 = (void *)v60;
        v74 = 2048;
        v75 = v51;
        v76 = 2048;
        v77 = v52;
        _os_log_impl(&dword_1D207F000, v49, OS_LOG_TYPE_DEFAULT, "Successfully referenced %lu assets and unreferenced %lu assets for current user. %lu assets are to be deleted as they are not referenced by any users.", buf, 0x20u);
      }

      v14 = v57;
      v15 = v59;
      if (!v56)
        goto LABEL_47;
      v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", log);
      v49 = *v56;
      *v56 = (id)v53;
    }
    else
    {
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v45, "localizedDescription");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v73 = (uint64_t)v55;
        _os_log_error_impl(&dword_1D207F000, v49, OS_LOG_TYPE_ERROR, "Failed to write users per factor file to temp path with error: %{public}@", buf, 0xCu);

        v42 = (void *)v60;
      }
      v14 = v57;
      v13 = v58;
      v15 = v59;
    }

LABEL_47:
    goto LABEL_48;
  }
  TRILogCategory_Server();
  log = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D207F000, log, OS_LOG_TYPE_ERROR, "Could not update on demand reference counts since the existing data could not be read", buf, 2u);
  }
  v47 = 0;
  v42 = (void *)v60;
LABEL_48:

  return v47;
}

- (void)getOnDemandReferenceCountsPerUserAtGlobalPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__22;
  v25 = __Block_byref_object_dispose__22;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0DC0A98], "arrayFromDirectory:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_opt_new();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __99__TRIInternalSystemServiceRequestHandler_getOnDemandReferenceCountsPerUserAtGlobalPath_completion___block_invoke;
    v17[3] = &unk_1E9332FA8;
    v20 = &v21;
    v10 = v7;
    v19 = v10;
    v17[4] = self;
    v11 = v9;
    v18 = v11;
    if ((objc_msgSend(v8, "enumerateStringsWithBlock:", v17) & 1) == 0)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v6;
        _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Could not iterate through namespaces in %@", buf, 0xCu);
      }

    }
    (*((void (**)(id, id, uint64_t))v10 + 2))(v10, v11, v22[5]);

  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("Unable to iterate through the list of namespaces");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, v14);
    v16 = (void *)v22[5];
    v22[5] = v15;

    (*((void (**)(id, _QWORD, uint64_t))v7 + 2))(v7, 0, v22[5]);
  }

  _Block_object_dispose(&v21, 8);
}

void __99__TRIInternalSystemServiceRequestHandler_getOnDemandReferenceCountsPerUserAtGlobalPath_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("factorPacks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0DC0A98], "arrayFromDirectory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __99__TRIInternalSystemServiceRequestHandler_getOnDemandReferenceCountsPerUserAtGlobalPath_completion___block_invoke_2;
    v23[3] = &unk_1E9332FA8;
    v23[4] = *(_QWORD *)(a1 + 32);
    v22 = *(_OWORD *)(a1 + 48);
    v9 = (id)v22;
    v25 = v22;
    v10 = v8;
    v24 = v10;
    if ((objc_msgSend(v7, "enumerateStringsWithBlock:", v23) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v10, v4);
    }
    else
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v4;
        _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Could not iterate through factor packs for namespace %@", buf, 0xCu);
      }

      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v26 = *MEMORY[0x1E0CB2D50];
      v27 = CFSTR("Failed to iterate through the list of factor packs");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, v18);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v30 = *MEMORY[0x1E0CB2D50];
    v31[0] = CFSTR("Unable to iterate through the list of factor packs");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, v12);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __99__TRIInternalSystemServiceRequestHandler_getOnDemandReferenceCountsPerUserAtGlobalPath_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  id obj;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v7 + 40);
  v12 = v5;
  v8 = objc_msgSend(v6, "_getOnDemandReferenceCountsAtGlobalPath:onDemandFactorsPerUser:error:", v3, &v12, &obj);
  v9 = v12;

  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v9, v4);
  }
  else
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v3;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Could not get onDemandReferenceCounts for %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)migrateToGlobalAssetStoreIfNeededFromLocalStore:(id)a3 sourceExtension:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v11, "UTF8String");
  if (sandbox_extension_consume() == -1)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "failed to consume a sandbox extension", v13, 2u);
    }

    v10[2](v10, 0);
  }
  else
  {
    ((void (**)(id, BOOL))v10)[2](v10, -[TRIAssetStoreOperator migrateToGlobalAssetStoreFromLocalAssetStore:](self->_operator, "migrateToGlobalAssetStoreFromLocalAssetStore:", v8));
    sandbox_extension_release();
  }

}

- (void)logSystemCovariates
{
  TRISystemCovariates *v2;
  void *v3;
  TRISystemCovariates *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = [TRISystemCovariates alloc];
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TRISystemCovariates initWithPaths:](v2, "initWithPaths:", v3);

  TRILogCategory_Backtrace();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[TRISystemCovariates dictionary](v4, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "System covariates at the time of sysdiagnose: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageManagement, 0);
  objc_storeStrong((id *)&self->_operator, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_entitlementWitness, 0);
}

@end
