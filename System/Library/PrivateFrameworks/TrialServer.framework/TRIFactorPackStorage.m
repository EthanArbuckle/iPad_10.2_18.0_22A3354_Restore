@implementation TRIFactorPackStorage

- (TRIFactorPackStorage)initWithPaths:(id)a3 extractor:(id)a4
{
  id v7;
  id v8;
  TRIFactorPackStorage *v9;
  TRIFactorPackStorage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIFactorPackStorage;
  v9 = -[TRIFactorPackStorage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_extractor, a4);
  }

  return v10;
}

- (TRIFactorPackStorage)initWithPaths:(id)a3
{
  id v4;
  TRIRemoteAssetExtractor *v5;
  TRIFactorPackStorage *v6;

  v4 = a3;
  v5 = -[TRIRemoteAssetExtractor initWithMonitoredActivity:]([TRIRemoteAssetExtractor alloc], "initWithMonitoredActivity:", 0);
  v6 = -[TRIFactorPackStorage initWithPaths:extractor:](self, "initWithPaths:extractor:", v4, v5);

  return v6;
}

- (BOOL)saveFactorPack:(id)a3 populatingAssetsForFactorNames:(id)a4 aliasToUnaliasMap:(id)a5 factorPackByNamePath:(id *)a6 factorPackByIdPath:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  TRIAssetStore *v24;
  TRIPaths *paths;
  TRIAssetExtracting *extractor;
  TRIRemoteAssetPatcher *v27;
  TRIAssetStore *v28;
  TRITempDirScopeGuard *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id *location;
  NSObject *v55;
  id *v56;
  NSObject *obj;
  uint8_t buf[4];
  NSObject *v59;
  __int16 v60;
  NSObject *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)MEMORY[0x1D8232A5C]();
  if ((objc_msgSend(v12, "hasFactorPackId") & 1) != 0)
  {
    objc_msgSend(v12, "factorPackId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    TRIValidateFactorPackId();
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v56 = a6;
      objc_msgSend(v12, "selectedNamespace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIFactorPackStorage _pathForFactorPackWithId:namespaceName:](self, "_pathForFactorPackWithId:namespaceName:", v17, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      obj = v20;
      if (v20)
      {
        location = a7;
        objc_msgSend(v12, "selectedNamespace");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIFactorPackStorage _legacyPathForFactorPackWithId:namespaceName:](self, "_legacyPathForFactorPackWithId:namespaceName:", v17, v22);
        v23 = objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          TRILogCategory_Server();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "factorPackId");
            v49 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "selectedNamespace");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "name");
            v51 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v59 = v49;
            v60 = 2114;
            v61 = v51;
            _os_log_error_impl(&dword_1D207F000, v36, OS_LOG_TYPE_ERROR, "Failed to resolve location for factor pack %{public}@ with namespace %{public}@.", buf, 0x16u);

          }
          v35 = 0;
          goto LABEL_38;
        }
        v55 = v23;
        v24 = [TRIAssetStore alloc];
        paths = self->_paths;
        extractor = self->_extractor;
        v27 = -[TRIRemoteAssetPatcher initWithMonitoredActivity:]([TRIRemoteAssetPatcher alloc], "initWithMonitoredActivity:", 0);
        v28 = -[TRIAssetStore initWithPaths:extractor:patcher:](v24, "initWithPaths:extractor:patcher:", paths, extractor, v27);

        v29 = [TRITempDirScopeGuard alloc];
        -[TRIPaths localTempDir](self->_paths, "localTempDir");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[TRITempDirScopeGuard initWithPath:](v29, "initWithPath:", v30);

        v32 = (void *)v31;
        if (!v31)
        {
          v35 = 0;
          v36 = v55;
LABEL_37:

LABEL_38:
          goto LABEL_24;
        }
        -[TRIFactorPackStorage _writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:](self, "_writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:", v12, obj, v13, v14, v28, v31);
        v33 = objc_claimAutoreleasedReturnValue();
        -[TRIFactorPackStorage _writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:](self, "_writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:", v12);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        v53 = (void *)v33;
        if (!v33)
        {
          v36 = v55;
          goto LABEL_36;
        }
        v36 = v55;
        if (!v34)
        {
LABEL_36:

          goto LABEL_37;
        }
        v37 = v34;
        v52 = v32;
        -[NSObject stringByDeletingLastPathComponent](obj, "stringByDeletingLastPathComponent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v38);

        if (v39
          && (-[NSObject stringByDeletingLastPathComponent](v55, "stringByDeletingLastPathComponent"),
              v40 = (void *)objc_claimAutoreleasedReturnValue(),
              v41 = objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v40),
              v40,
              v41)
          && objc_msgSend(MEMORY[0x1E0CB3620], "triForceRenameWithSourcePath:destPath:", v53, obj))
        {
          v36 = v55;
          v32 = v52;
          if (!objc_msgSend(MEMORY[0x1E0CB3620], "triForceRenameWithSourcePath:destPath:", v37, v55))
          {
            v35 = 0;
            goto LABEL_34;
          }
          TRILogCategory_Server();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v59 = v17;
            v60 = 2114;
            v61 = obj;
            _os_log_impl(&dword_1D207F000, v42, OS_LOG_TYPE_DEFAULT, "Wrote factor pack %{public}@ --> %{public}@", buf, 0x16u);
          }

          TRILogCategory_Server();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v59 = v17;
            v60 = 2114;
            v61 = v55;
            _os_log_impl(&dword_1D207F000, v43, OS_LOG_TYPE_DEFAULT, "Wrote factor pack %{public}@ --> %{public}@", buf, 0x16u);
          }

          if (v56)
            objc_storeStrong(v56, obj);
          if (location)
            objc_storeStrong(location, v55);
          v35 = 1;
        }
        else
        {
          v35 = 0;
          v36 = v55;
        }
        v32 = v52;
LABEL_34:
        v34 = v37;
        goto LABEL_36;
      }
      TRILogCategory_Server();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "factorPackId");
        v46 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "selectedNamespace");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "name");
        v48 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v46;
        v60 = 2114;
        v61 = v48;
        _os_log_error_impl(&dword_1D207F000, v45, OS_LOG_TYPE_ERROR, "Failed to resolve location for factor pack %{public}@ with namespace %{public}@.", buf, 0x16u);

      }
    }
  }
  else
  {
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "TRIClientFactorPack has nil factorPackId", buf, 2u);
    }
  }
  v35 = 0;
LABEL_24:

  objc_autoreleasePoolPop(v15);
  return v35;
}

- (BOOL)saveFactorPackToGlobal:(id)a3 forFactorNames:(id)a4 aliasToUnaliasMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  TRIAssetStore *v19;
  TRIPaths *paths;
  TRIAssetExtracting *extractor;
  TRIRemoteAssetPatcher *v22;
  TRITempDirScopeGuard *v23;
  void *v24;
  TRITempDirScopeGuard *v25;
  void *v26;
  TRIRemoteAssetStoreOperator *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  TRIAssetStore *v35;
  NSObject *v36;
  _QWORD v37[4];
  id v38;
  _BYTE *v39;
  uint8_t buf[4];
  NSObject *v41;
  __int16 v42;
  NSObject *v43;
  _BYTE v44[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "hasFactorPackId") & 1) == 0)
  {
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v44 = 0;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failed to find factor pack identifier when saving factor pack globally", v44, 2u);
    }
    goto LABEL_11;
  }
  objc_msgSend(v8, "factorPackId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TRIValidateFactorPackId();
  v12 = objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_11:
    LOBYTE(v28) = 0;
    goto LABEL_12;
  }
  v13 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIPaths treatmentsDirUsingGlobal:](self->_paths, "treatmentsDirUsingGlobal:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v8, "selectedNamespace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@/factorPacks/%@"), v17, v12);
  objc_msgSend(v14, "stringByAppendingPathComponent:", v18);
  v36 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v13);
  if (!v36)
  {
    TRILogCategory_Server();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "selectedNamespace");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v44 = 138543618;
      *(_QWORD *)&v44[4] = v12;
      *(_WORD *)&v44[12] = 2114;
      *(_QWORD *)&v44[14] = v34;
      _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Failed to resolve location for factor pack %{public}@ with namespace %{public}@.", v44, 0x16u);

    }
    goto LABEL_11;
  }
  v19 = [TRIAssetStore alloc];
  paths = self->_paths;
  extractor = self->_extractor;
  v22 = -[TRIRemoteAssetPatcher initWithMonitoredActivity:]([TRIRemoteAssetPatcher alloc], "initWithMonitoredActivity:", 0);
  v35 = -[TRIAssetStore initWithPaths:extractor:patcher:](v19, "initWithPaths:extractor:patcher:", paths, extractor, v22);

  v23 = [TRITempDirScopeGuard alloc];
  -[TRIPaths localTempDir](self->_paths, "localTempDir");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[TRITempDirScopeGuard initWithPath:](v23, "initWithPath:", v24);

  if (v25)
  {
    -[TRIFactorPackStorage _writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:](self, "_writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:", v8, v36, v9, v10, v35, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      *(_QWORD *)v44 = 0;
      *(_QWORD *)&v44[8] = v44;
      *(_QWORD *)&v44[16] = 0x3032000000;
      v45 = __Block_byref_object_copy__21;
      v46 = __Block_byref_object_dispose__21;
      v47 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __80__TRIFactorPackStorage_saveFactorPackToGlobal_forFactorNames_aliasToUnaliasMap___block_invoke;
      v37[3] = &unk_1E9331060;
      v38 = v9;
      v39 = v44;
      objc_msgSend(v8, "enumerateFactorLevelsWithBlock:", v37);
      v27 = -[TRIRemoteAssetStoreOperator initWithPaths:]([TRIRemoteAssetStoreOperator alloc], "initWithPaths:", self->_paths);
      v28 = -[TRIRemoteAssetStoreOperator saveFactorPackToGlobalPath:fromTemporaryPath:factors:](v27, "saveFactorPackToGlobalPath:fromTemporaryPath:factors:", v36, v26, *(_QWORD *)(*(_QWORD *)&v44[8] + 40));
      if (v28)
      {
        TRILogCategory_Server();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v41 = v12;
          v42 = 2114;
          v43 = v36;
          _os_log_impl(&dword_1D207F000, v29, OS_LOG_TYPE_DEFAULT, "Wrote global factor pack %{public}@ --> %{public}@", buf, 0x16u);
        }
      }
      else
      {
        TRILogCategory_Server();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v36;
          _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Failed to write global factor pack to %@", buf, 0xCu);
        }
      }

      _Block_object_dispose(v44, 8);
    }
    else
    {
      TRILogCategory_Server();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v44 = 0;
        _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "Failed to create or copy global factor pack to a temporary directory.", v44, 2u);
      }

      LOBYTE(v28) = 0;
    }

  }
  else
  {
    LOBYTE(v28) = 0;
  }

LABEL_12:
  return v28;
}

void __80__TRIFactorPackStorage_saveFactorPackToGlobal_forFactorNames_aliasToUnaliasMap___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "hasLevel");
  v4 = v11;
  if (v3)
  {
    objc_msgSend(v11, "level");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isFactorOnDemand"))
    {
LABEL_5:

      v4 = v11;
      goto LABEL_6;
    }
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v11, "factor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "containsObject:", v8);

    v4 = v11;
    if ((_DWORD)v6)
    {
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(v11, "factor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

      goto LABEL_5;
    }
  }
LABEL_6:

}

- (id)_writeFactorPack:(id)a3 futurePath:(id)a4 forFactorNames:(id)a5 aliasToUnaliasMap:(id)a6 assetStore:(id)a7 tempDirRef:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  TRIFactorPackStorage *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  __int128 *p_buf;
  uint8_t v44[4];
  NSObject *v45;
  __int16 v46;
  id v47;
  __int128 buf;
  uint64_t v49;
  char v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v33 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if ((objc_msgSend(v14, "hasFactorPackId") & 1) != 0)
  {
    objc_msgSend(v14, "factorPackId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    TRIValidateFactorPackId();
    v20 = objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB3940]);
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("fp-%@-%@"), v20, v23);

      objc_msgSend(v18, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByAppendingPathComponent:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v26))
      {

        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v49 = 0x2020000000;
        v50 = 0;
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __107__TRIFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke;
        v35[3] = &unk_1E9332F28;
        p_buf = &buf;
        v36 = v16;
        v37 = v15;
        v38 = self;
        v20 = v20;
        v39 = v20;
        v40 = v17;
        v27 = v26;
        v41 = v27;
        v42 = v33;
        v32 = (void *)MEMORY[0x1D8232C48](v35);
        -[NSObject stringByAppendingPathComponent:](v27, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        if ((objc_msgSend(MEMORY[0x1E0DC09E0], "copySourceFactorPack:toDestPath:error:modifyFactorLevel:", v14, v28, &v34, v32) & 1) != 0)
        {
          if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
          {
            if (objc_msgSend(MEMORY[0x1E0CB3620], "triRemoveFileProtectionIfPresentForPath:", v28)
              && +[TRIReferenceManagedDir createFromDir:](TRIReferenceManagedDir, "createFromDir:", v27))
            {
              v30 = v27;
              goto LABEL_18;
            }
LABEL_17:
            v30 = 0;
LABEL_18:

            _Block_object_dispose(&buf, 8);
            goto LABEL_13;
          }
          TRILogCategory_Server();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v44 = 138412290;
            v45 = v20;
            _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Failed to link assets for factor pack with Id: %@", v44, 0xCu);
          }
        }
        else
        {
          TRILogCategory_Server();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v44 = 138543618;
            v45 = v27;
            v46 = 2114;
            v47 = v34;
            _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Failed to copy factor pack to %{public}@: %{public}@", v44, 0x16u);
          }
        }

        goto LABEL_17;
      }

    }
  }
  else
  {
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v33;
      _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Failed to find factor pack identifier when writing factor pack to path: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  v30 = 0;
LABEL_13:

  return v30;
}

id __107__TRIFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    return v4;
  if (objc_msgSend(v3, "hasLevel"))
  {
    objc_msgSend(v4, "level");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileOrDirectoryLevelWithIsDir:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "hasAsset"))
    {
      objc_msgSend(v6, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hasCloudKitContainer"))
      {
LABEL_9:

        goto LABEL_10;
      }
      v8 = objc_msgSend(v6, "isOnDemand");

      if (v8)
      {
        TRILogCategory_Server();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "factor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543362;
          v23 = v21;
          _os_log_debug_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEBUG, "Populating system default cloudKitContainer on asset for \"%{public}@\", (uint8_t *)&v22, 0xCu);

        }
        objc_msgSend(v6, "asset");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCloudKitContainer:", 1);
        goto LABEL_9;
      }
    }
LABEL_10:

  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v4, "factor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(v4, "factor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "factor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setName:", v15);

  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v15)
    && (objc_msgSend(*(id *)(a1 + 48), "_linkAssetsUpdatingFactorLevel:fromFactorPackWithId:usingAssetStore:currentFactorPackPath:futureFactorPackPath:", v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80)) & 1) == 0)
  {
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = 138412290;
      v23 = v15;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Failed to link asset for factor name: %@", (uint8_t *)&v22, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  }

  return v4;
}

- (id)loadParsedFactorPackWithId:(id)a3 namespaceName:(id)a4
{
  void *v5;
  void *v6;

  -[TRIFactorPackStorage pathForFactorPackWithId:namespaceName:](self, "pathForFactorPackWithId:namespaceName:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TRIFactorPackStorage loadParsedFactorPackWithDir:](self, "loadParsedFactorPackWithDir:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)loadFactorPackWithDir:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 8, &v14);
  v7 = v14;
  v8 = v7;
  v15 = v7;
  if (!v6)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v3;
      v18 = 2114;
      v19 = v8;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Failed to load TRIClientFactorPack from factor pack directory at %{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  v15 = 0;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC09D8]), "initWithData:error:", v6, &v15);
  if (!v9)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v5;
      v18 = 2114;
      v19 = v15;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failed to parse TRIClientFactorPack at %{public}@: %{public}@", buf, 0x16u);
    }

    v10 = 0;
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v10 = v9;
  v11 = v10;
LABEL_10:

  objc_autoreleasePoolPop(v4);
  return v11;
}

- (id)loadParsedFactorPackWithDir:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 8, &v15);
  v7 = v15;
  v8 = v7;
  if (!v6)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v3;
      v18 = 2114;
      v19 = v8;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Failed to load TRIClientFactorPack from factor pack directory at %{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_9;
  }

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0DC0E90], "parseFromData:error:", v6, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (!v9)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v5;
      v18 = 2114;
      v19 = v8;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failed to parse TRIClientFactorPack at %{public}@: %{public}@", buf, 0x16u);
    }

    v10 = 0;
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v10 = v9;
  v11 = v10;
LABEL_10:

  objc_autoreleasePoolPop(v4);
  return v11;
}

- (id)loadFactorPackWithId:(id)a3 namespaceName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIFactorPackStorage pathForFactorPackWithId:namespaceName:](self, "pathForFactorPackWithId:namespaceName:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[TRIFactorPackStorage loadFactorPackWithDir:](self, "loadFactorPackWithDir:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  objc_autoreleasePoolPop(v8);
  return v10;
}

- (BOOL)updateSavedFactorPackWithId:(id)a3 namespaceName:(id)a4 populatingAssetsForFactorNames:(id)a5 aliasToUnaliasMap:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  TRITempDirScopeGuard *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v31;
  id v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1D8232A5C]();
  if (objc_msgSend(v12, "count"))
  {
    -[TRIFactorPackStorage pathForFactorPackWithId:namespaceName:](self, "pathForFactorPackWithId:namespaceName:", v10, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    -[TRIFactorPackStorage legacyPathForFactorPackWithId:namespaceName:](self, "legacyPathForFactorPackWithId:namespaceName:", v10, v11);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 && v16)
    {
      v18 = [TRITempDirScopeGuard alloc];
      -[TRIPaths localTempDir](self->_paths, "localTempDir");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[TRITempDirScopeGuard initWithPath:](v18, "initWithPath:", v19);

      if (v20)
      {
        if (!v13)
          v13 = (id)MEMORY[0x1E0C9AA70];
        -[TRIFactorPackStorage _linkAssetsForFactorNames:aliasToUnaliasMap:copyingModifiedFactorPackWithPath:tempDirRef:](self, "_linkAssetsForFactorNames:aliasToUnaliasMap:copyingModifiedFactorPackWithPath:tempDirRef:", v12, v13, v15, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIFactorPackStorage _linkAssetsForFactorNames:aliasToUnaliasMap:copyingModifiedFactorPackWithPath:tempDirRef:](self, "_linkAssetsForFactorNames:aliasToUnaliasMap:copyingModifiedFactorPackWithPath:tempDirRef:", v12, v13, v17, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        if (v21 && v22)
        {
          v32 = v22;
          v33 = v21;
          v24 = (void *)MEMORY[0x1E0CB3620];
          -[NSObject stringByAppendingPathComponent:](v15, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v24;
          v21 = v33;
          if ((objc_msgSend(v26, "triRenameOrFaultWithSourcePath:destPath:", v33, v25) & 1) != 0)
          {
            v31 = (void *)MEMORY[0x1E0CB3620];
            -[NSObject stringByAppendingPathComponent:](v17, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v31) = objc_msgSend(v31, "triRenameOrFaultWithSourcePath:destPath:", v32, v27);

            if ((_DWORD)v31)
            {
              TRILogCategory_Server();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v35 = v10;
                v36 = 2114;
                v37 = v15;
                _os_log_impl(&dword_1D207F000, v28, OS_LOG_TYPE_DEFAULT, "Updated factor pack %{public}@ --> %{public}@", buf, 0x16u);
              }

              TRILogCategory_Server();
              v29 = objc_claimAutoreleasedReturnValue();
              v21 = v33;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v35 = v10;
                v36 = 2114;
                v37 = v17;
                _os_log_impl(&dword_1D207F000, v29, OS_LOG_TYPE_DEFAULT, "Updated factor pack %{public}@ --> %{public}@", buf, 0x16u);
              }

              v23 = 1;
            }
            else
            {
              v23 = 0;
              v21 = v33;
            }
          }
          else
          {

            v23 = 0;
          }
          v22 = v32;
        }

        goto LABEL_26;
      }
    }
    else
    {
      TRILogCategory_Server();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v10;
        _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "updateSavedFactorPackWithId failed because preexisting factor pack %{public}@ is not present on disk.", buf, 0xCu);
      }
    }
    v23 = 0;
LABEL_26:

    goto LABEL_27;
  }
  TRILogCategory_Server();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v10;
    _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Updating factor pack %{public}@ was a no-op. No factor names specified", buf, 0xCu);
  }
  v23 = 1;
LABEL_27:

  objc_autoreleasePoolPop(v14);
  return v23;
}

- (BOOL)updateSavedGlobalFactorPackAt:(id)a3 populatingAssetsForFactorNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TRITempDirScopeGuard *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v6 = a3;
  v7 = a4;
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[TRITempDirScopeGuard initWithPath:]([TRITempDirScopeGuard alloc], "initWithPath:", v11);
  if (v12)
  {
    -[TRIFactorPackStorage _linkAssetsForFactorNames:aliasToUnaliasMap:copyingModifiedFactorPackWithPath:tempDirRef:](self, "_linkAssetsForFactorNames:aliasToUnaliasMap:copyingModifiedFactorPackWithPath:tempDirRef:", v7, 0, v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB3620];
      objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "triRenameOrFaultWithSourcePath:destPath:", v13, v15);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_linkAssetsUpdatingFactorLevel:(id)a3 fromFactorPackWithId:(id)a4 usingAssetStore:(id)a5 currentFactorPackPath:(id)a6 futureFactorPackPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  BOOL v50;
  NSObject *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  NSObject *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "factor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "hasName")
    || (objc_msgSend(v17, "name"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "length"),
        v18,
        !v19))
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v13;
      _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor with missing or empty name.", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if ((objc_msgSend(v12, "hasLevel") & 1) == 0)
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_13:
      LOBYTE(v30) = 0;
      goto LABEL_14;
    }
    objc_msgSend(v17, "name");
    v33 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v61 = v13;
    v62 = 2114;
    v63 = v33;
    _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor %{public}@ with missing level.", buf, 0x16u);
    goto LABEL_27;
  }
  objc_msgSend(v12, "level");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fileOrDirectoryLevelWithIsDir:", 0);
  v21 = objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(v12, "level");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "levelOneOfCase");

    if (v35 != 104)
    {
LABEL_41:
      v21 = 0;
      goto LABEL_42;
    }
    objc_msgSend(v12, "factor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "namespaceString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v12, "level");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "mobileAssetReferenceValue");
      v39 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject hasAssetType](v39, "hasAssetType")
        && -[NSObject hasAssetSpecifier](v39, "hasAssetSpecifier")
        && (-[NSObject hasAssetVersion](v39, "hasAssetVersion") & 1) != 0)
      {
        v52 = objc_alloc(MEMORY[0x1E0DC0AB0]);
        -[NSObject assetType](v39, "assetType");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject assetSpecifier](v39, "assetSpecifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject assetVersion](v39, "assetVersion");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "initWithType:specifier:version:", v57, v40, v41);

        objc_msgSend(v12, "factor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "name");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSObject hasIsFileFactor](v39, "hasIsFileFactor"))
          v43 = -[NSObject isFileFactor](v39, "isFileFactor");
        else
          v43 = 0;
        v49 = (void *)v53;
        v50 = -[TRIFactorPackStorage _referenceMAAssetWithId:assetStore:forFactorName:isFileFactor:currentFactorPackPath:futureFactorPackPath:](self, "_referenceMAAssetWithId:assetStore:forFactorName:isFileFactor:currentFactorPackPath:futureFactorPackPath:", v53, v14, v42, v43, v15, v16, v53);

        if (v50)
        {

          goto LABEL_41;
        }
LABEL_32:

        v21 = 0;
        goto LABEL_13;
      }
      TRILogCategory_Server();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "name");
        v51 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v13;
        v62 = 2114;
        v63 = v51;
        _os_log_error_impl(&dword_1D207F000, v46, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor %{public}@ with incomplete MobileAssetReference.", buf, 0x16u);

      }
    }
    else
    {
      TRILogCategory_Server();
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      objc_msgSend(v17, "name");
      v46 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v13;
      v62 = 2114;
      v63 = v46;
      _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor %{public}@ with missing namespaceString.", buf, 0x16u);
    }

    goto LABEL_32;
  }
  objc_msgSend(v12, "factor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "namespaceString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    TRILogCategory_Server();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "name");
      v44 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v13;
      v62 = 2114;
      v63 = v44;
      v45 = "Factor pack %{public}@ has factor %{public}@ with missing namespaceString.";
      goto LABEL_37;
    }
LABEL_27:

    goto LABEL_13;
  }
  if (!-[NSObject hasAsset](v21, "hasAsset")
    || (-[NSObject asset](v21, "asset"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v24, "hasAssetId"),
        v24,
        (v25 & 1) == 0))
  {
    TRILogCategory_Server();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "name");
      v44 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v13;
      v62 = 2114;
      v63 = v44;
      v45 = "Factor pack %{public}@ has factor %{public}@ with missing assetId.";
LABEL_37:
      _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, v45, buf, 0x16u);

      goto LABEL_27;
    }
    goto LABEL_27;
  }
  -[NSObject asset](v21, "asset");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "assetId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  TRIValidateAssetId();
  v27 = objc_claimAutoreleasedReturnValue();

  v56 = (void *)v27;
  if (!v27)
  {
    TRILogCategory_Server();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      -[NSObject asset](v21, "asset");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "assetId");
      v47 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "factor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "name");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v61 = v13;
      v62 = 2114;
      v63 = v47;
      v64 = 2114;
      v65 = v48;
      _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has unsuitable asset id \"%{public}@\" for factor %{public}@.", buf, 0x20u);

    }
    goto LABEL_27;
  }
  objc_msgSend(v12, "factor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "name");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFactorPackStorage _linkAssetWithId:assetStore:forFactorName:currentFactorPackPath:futureFactorPackPath:](self, "_linkAssetWithId:assetStore:forFactorName:currentFactorPackPath:futureFactorPackPath:", v56, v14, v29, v15, v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v16, "stringByAppendingPathComponent:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPath:](v21, "setPath:", v31);

LABEL_42:
    LOBYTE(v30) = 1;
    goto LABEL_14;
  }

LABEL_14:
  return (char)v30;
}

- (id)_linkAssetsForFactorNames:(id)a3 aliasToUnaliasMap:(id)a4 copyingModifiedFactorPackWithPath:(id)a5 tempDirRef:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  TRIAssetStore *v20;
  TRIPaths *paths;
  TRIAssetExtracting *extractor;
  TRIRemoteAssetPatcher *v23;
  TRIAssetStore *v24;
  TRIAssetStore *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  TRIFactorPackStorage *v35;
  TRIAssetStore *v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[TRIFactorPackStorage loadFactorPackWithDir:](self, "loadFactorPackWithDir:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("fp-update-%@.pb"), v17);
    objc_msgSend(v14, "stringByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = [TRIAssetStore alloc];
    paths = self->_paths;
    extractor = self->_extractor;
    v23 = -[TRIRemoteAssetPatcher initWithMonitoredActivity:]([TRIRemoteAssetPatcher alloc], "initWithMonitoredActivity:", 0);
    v24 = -[TRIAssetStore initWithPaths:extractor:patcher:](v20, "initWithPaths:extractor:patcher:", paths, extractor, v23);

    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __113__TRIFactorPackStorage__linkAssetsForFactorNames_aliasToUnaliasMap_copyingModifiedFactorPackWithPath_tempDirRef___block_invoke;
    v32[3] = &unk_1E9332F50;
    v38 = &v39;
    v33 = v10;
    v34 = v30;
    v35 = self;
    v25 = v24;
    v36 = v25;
    v37 = v11;
    v26 = (void *)MEMORY[0x1D8232C48](v32);
    v31 = 0;
    if ((objc_msgSend(MEMORY[0x1E0DC09E0], "copySourceFactorPack:toDestPath:error:modifyFactorLevel:", v13, v19, &v31, v26) & 1) != 0)
    {
      if (!*((_BYTE *)v40 + 24)
        && objc_msgSend(MEMORY[0x1E0CB3620], "triRemoveFileProtectionIfPresentForPath:", v19))
      {
        v27 = v19;
LABEL_11:

        _Block_object_dispose(&v39, 8);
        goto LABEL_12;
      }
    }
    else
    {
      TRILogCategory_Server();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v31;
        _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "Failed to make modified copy of factor pack: %{public}@", buf, 0xCu);
      }

    }
    v27 = 0;
    goto LABEL_11;
  }
  v27 = 0;
LABEL_12:

  return v27;
}

id __113__TRIFactorPackStorage__linkAssetsForFactorNames_aliasToUnaliasMap_copyingModifiedFactorPackWithPath_tempDirRef___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  char v46;
  id v47;
  int v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if (objc_msgSend(v4, "hasFactor"))
    {
      objc_msgSend(v5, "factor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasName");

      if ((v7 & 1) != 0)
      {
        v8 = *(void **)(a1 + 32);
        if (v8
          && (objc_msgSend(v5, "factor"),
              v7 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend((id)v7, "name"),
              v2 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v8, "objectForKeyedSubscript:", v2),
              (v9 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v10 = (void *)v9;
          v11 = *(void **)(a1 + 32);
          objc_msgSend(v5, "factor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v5, "factor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v8)
            goto LABEL_11;
        }

LABEL_11:
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v14) & 1) == 0)
        {
          v32 = v5;
LABEL_37:

          goto LABEL_8;
        }
        objc_msgSend(v5, "level");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileOrDirectoryLevelWithIsDir:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          if ((objc_msgSend(v19, "hasPath") & 1) != 0)
            goto LABEL_35;
          if (!objc_msgSend(v19, "hasAsset"))
            goto LABEL_35;
          objc_msgSend(v19, "asset");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "hasAssetId");

          if ((v21 & 1) == 0)
            goto LABEL_35;
          objc_msgSend(v19, "asset");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "assetId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          TRIValidateAssetId();
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
            goto LABEL_35;
          v25 = *(void **)(a1 + 48);
          v26 = *(_QWORD *)(a1 + 56);
          objc_msgSend(v5, "factor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_linkAssetWithId:assetStore:forFactorName:currentFactorPackPath:futureFactorPackPath:", v24, v26, v28, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(*(id *)(a1 + 64), "stringByAppendingPathComponent:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (!+[TRIReferenceManagedDir saveFromGarbageCollectionItemWithPath:](TRIReferenceManagedDir, "saveFromGarbageCollectionItemWithPath:", v30))
            {
              TRILogCategory_Server();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                v48 = 138543362;
                v49 = v30;
                _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Unable to prevent newly linked asset at path %{public}@ from being garbage collected in the future", (uint8_t *)&v48, 0xCu);
              }

            }
            objc_msgSend(v19, "setPath:", v30);

            goto LABEL_34;
          }
        }
        else
        {
          objc_msgSend(v5, "level");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "levelOneOfCase");

          if (v34 != 104)
          {
LABEL_35:
            v47 = v5;
            goto LABEL_36;
          }
          objc_msgSend(v5, "level");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "mobileAssetReferenceValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v24, "hasAssetType")
            || !objc_msgSend(v24, "hasAssetSpecifier")
            || (objc_msgSend(v24, "hasAssetVersion") & 1) == 0)
          {
            v45 = v5;

LABEL_36:
            goto LABEL_37;
          }
          v36 = objc_alloc(MEMORY[0x1E0DC0AB0]);
          objc_msgSend(v24, "assetType");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "assetSpecifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "assetVersion");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v36, "initWithType:specifier:version:", v37, v38, v39);

          v40 = *(void **)(a1 + 48);
          v41 = *(_QWORD *)(a1 + 56);
          objc_msgSend(v5, "factor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "name");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "hasIsFileFactor"))
            v44 = objc_msgSend(v24, "isFileFactor");
          else
            v44 = 0;
          v46 = objc_msgSend(v40, "_referenceMAAssetWithId:assetStore:forFactorName:isFileFactor:currentFactorPackPath:futureFactorPackPath:", v29, v41, v43, v44, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64));

          if ((v46 & 1) != 0)
          {
LABEL_34:

            goto LABEL_35;
          }
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        goto LABEL_34;
      }
    }
  }
  v15 = v5;
LABEL_8:

  return v5;
}

- (id)_linkAssetWithId:(id)a3 assetStore:(id)a4 forFactorName:(id)a5 currentFactorPackPath:(id)a6 futureFactorPackPath:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend(a5, "triFilenameForFactorName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3620];
  objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("assets"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "triIdempotentCreateDirectoryOrFaultWithPath:", v17);

  objc_msgSend(CFSTR("assets"), "stringByAppendingPathComponent:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByAppendingPathComponent:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = objc_msgSend(v13, "linkAssetWithIdentifier:toCurrentPath:futurePath:", v14, v19, v20);
  if ((_DWORD)v11)
    v21 = v18;
  else
    v21 = 0;
  v22 = v21;

  return v22;
}

+ (id)relPathForMAReferenceWithFactorName:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "triFilenameForFactorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("maRefs"), "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_referenceMAAssetWithId:(id)a3 assetStore:(id)a4 forFactorName:(id)a5 isFileFactor:(BOOL)a6 currentFactorPackPath:(id)a7 futureFactorPackPath:(id)a8
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v9 = a6;
  v13 = a8;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend((id)objc_opt_class(), "relPathForMAReferenceWithFactorName:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringByAppendingPathComponent:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByDeletingLastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v20);
  objc_msgSend(v14, "stringByAppendingPathComponent:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringByAppendingPathComponent:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v16, "referenceMAAutoAssetWithId:isFileFactor:usingCurrentPath:futurePath:", v17, v9, v21, v22);
  return v9;
}

- (BOOL)updateSavedFactorPackWithId:(id)a3 namespaceName:(id)a4 deletingAssetsWithFactorNames:(id)a5 inUseAssetBehavior:(unsigned __int8)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  TRITempDirScopeGuard *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  __objc2_class **v33;
  void *v34;
  uint64_t i;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  __objc2_class **v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v51;
  id v52;
  id v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned int v61;
  id v62;
  void *v63;
  int v64;
  _QWORD v65[4];
  id v66;
  char v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  id v74;
  uint64_t v75;

  v6 = a6;
  v75 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIFactorPackStorage pathForFactorPackWithId:namespaceName:](self, "pathForFactorPackWithId:namespaceName:", v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFactorPackStorage legacyPathForFactorPackWithId:namespaceName:](self, "legacyPathForFactorPackWithId:namespaceName:", v10, v11);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v14 || !v15)
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v74 = v10;
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "updateSavedFactorPackWithId failed because preexisting factor pack %{public}@ is not present on disk.", buf, 0xCu);
    }
    v23 = 0;
    goto LABEL_35;
  }
  v60 = (void *)v15;
  v17 = [TRITempDirScopeGuard alloc];
  -[TRIPaths localTempDir](self->_paths, "localTempDir");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[TRITempDirScopeGuard initWithPath:](v17, "initWithPath:", v18);

  if (!v19)
  {
    v23 = 0;
    v16 = v60;
    goto LABEL_35;
  }
  v57 = v13;
  v20 = objc_opt_new();
  v63 = (void *)objc_opt_new();
  -[TRIFactorPackStorage _removeAssetsWithFactorNames:copyingModifiedFactorPackWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:](self, "_removeAssetsWithFactorNames:copyingModifiedFactorPackWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:", v12, v14, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v16 = v60;
  v58 = (void *)v20;
  -[TRIFactorPackStorage _removeAssetsWithFactorNames:copyingModifiedFactorPackWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:](self, "_removeAssetsWithFactorNames:copyingModifiedFactorPackWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:", v12, v60, v20, 0, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v59 = (void *)v21;
  if (!v21)
  {
    v13 = v57;
    goto LABEL_34;
  }
  v13 = v57;
  if (!v22)
    goto LABEL_34;
  v55 = v19;
  v56 = v22;
  v24 = (void *)MEMORY[0x1E0CB3620];
  objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "triRenameOrFaultWithSourcePath:destPath:", v59, v25) & 1) == 0)
  {

    goto LABEL_30;
  }
  v26 = (void *)MEMORY[0x1E0CB3620];
  objc_msgSend(v60, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = objc_msgSend(v26, "triRenameOrFaultWithSourcePath:destPath:", v56, v27);

  if (!(_DWORD)v26)
  {
LABEL_30:
    v23 = 0;
    goto LABEL_33;
  }
  v51 = v14;
  v52 = v12;
  v53 = v11;
  v54 = v10;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v28 = v58;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (!v29)
  {
    LOBYTE(v32) = 1;
    goto LABEL_32;
  }
  v30 = v29;
  v31 = *(_QWORD *)v69;
  v32 = 1;
  v33 = off_1E932E000;
  v34 = v63;
  v62 = v28;
  v61 = v6;
  do
  {
    for (i = 0; i != v30; ++i)
    {
      if (*(_QWORD *)v69 != v31)
        objc_enumerationMutation(v28);
      v36 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
      v67 = 0;
      if (!-[__objc2_class removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:](v33[103], "removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:", v36, v6, &v67, v51, v52, v53, v54))
      {
        TRILogCategory_Server();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v74 = v36;
          _os_log_error_impl(&dword_1D207F000, v38, OS_LOG_TYPE_ERROR, "Failed to remove file %{public}@ in managed dir", buf, 0xCu);
        }
        v32 = 0;
        goto LABEL_20;
      }
      if ((_DWORD)v6 == 3)
      {
        objc_msgSend(v34, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v34, "objectForKeyedSubscript:", v36);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_opt_new();
          v40 = objc_alloc(MEMORY[0x1E0DC0AB0]);
          -[NSObject assetType](v38, "assetType");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject assetSpecifier](v38, "assetSpecifier");
          v64 = v32;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject assetVersion](v38, "assetVersion");
          v43 = v33;
          v44 = v31;
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v40, "initWithType:specifier:version:", v41, v42, v45);

          v31 = v44;
          v33 = v43;

          objc_msgSend(v39, "createAutoAssetWithId:decryptionKey:error:", v46, 0, 0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "assetSelector");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __115__TRIFactorPackStorage_updateSavedFactorPackWithId_namespaceName_deletingAssetsWithFactorNames_inUseAssetBehavior___block_invoke;
          v65[3] = &unk_1E9331240;
          v66 = v47;
          v49 = v47;
          objc_msgSend(v39, "eliminateAllForSelector:completion:", v48, v65);

          v32 = v64;
          v6 = v61;

          v34 = v63;
          v28 = v62;
LABEL_20:

          continue;
        }
      }
    }
    v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  }
  while (v30);
LABEL_32:
  v23 = v32;

  v11 = v53;
  v10 = v54;
  v14 = v51;
  v12 = v52;
  v13 = v57;
LABEL_33:
  v16 = v60;
  v19 = v55;
  v22 = v56;
LABEL_34:

LABEL_35:
  objc_autoreleasePoolPop(v13);

  return v23 & 1;
}

void __115__TRIFactorPackStorage_updateSavedFactorPackWithId_namespaceName_deletingAssetsWithFactorNames_inUseAssetBehavior___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v4;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Failed to eliminate MAAutoAsset %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "Eliminated MAAutoAsset: %{public}@", (uint8_t *)&v9, 0xCu);
  }

}

- (BOOL)updateSavedGlobalFactorPackAt:(id)a3 deletingAssetsWithFactorNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TRITempDirScopeGuard *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v27;
  TRITempDirScopeGuard *v28;
  id v29;
  id v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  int buf;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[TRITempDirScopeGuard initWithPath:]([TRITempDirScopeGuard alloc], "initWithPath:", v11);
  if (v12)
  {
    v13 = objc_opt_new();
    -[TRIFactorPackStorage _removeAssetsWithFactorNames:copyingModifiedFactorPackWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:](self, "_removeAssetsWithFactorNames:copyingModifiedFactorPackWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:", v7, v6, v13, 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3620];
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend(v15, "triRenameOrFaultWithSourcePath:destPath:", v14, v16);

    if ((v15 & 1) != 0)
    {
      v27 = v14;
      v28 = v12;
      v29 = v7;
      v30 = v6;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = v13;
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v33;
        v21 = 1;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            v31 = 0;
            if (!+[TRIReferenceManagedDir removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:](TRIReferenceManagedDir, "removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:", v23, 2, &v31, v27))
            {
              TRILogCategory_Server();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                buf = 138543362;
                v38 = v23;
                _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "Failed to remove file %{public}@ in global managed dir", (uint8_t *)&buf, 0xCu);
              }

              v21 = 0;
            }
          }
          v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v19);
      }
      else
      {
        v21 = 1;
      }

      TRILogCategory_Server();
      v25 = objc_claimAutoreleasedReturnValue();
      v6 = v30;
      v14 = v27;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D207F000, v25, OS_LOG_TYPE_INFO, "Successfuly removed factors from global path.", (uint8_t *)&buf, 2u);
      }
      v7 = v29;
      v12 = v28;
    }
    else
    {
      TRILogCategory_Server();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        buf = 138543618;
        v38 = v14;
        v39 = 2114;
        v40 = v6;
        _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Failed to move the temp factorPack.pb file in %{public}@ to the global path %{public}@", (uint8_t *)&buf, 0x16u);
      }
      v21 = 0;
    }

  }
  else
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Failed to create temp directory while attempting to delete assets from global directory.", (uint8_t *)&buf, 2u);
    }
    v21 = 0;
  }

  return v21 & 1;
}

- (id)_removeAssetsWithFactorNames:(id)a3 copyingModifiedFactorPackWithPath:(id)a4 appendingToPathsToRemove:(id)a5 appendingToMARefsToRemove:(id)a6 tempDirRef:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  TRIFactorPackStorage *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  TRIFactorPackStorage *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[TRIFactorPackStorage loadFactorPackWithDir:](self, "loadFactorPackWithDir:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v34 = v16;
    objc_msgSend(v16, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = self;
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "UUIDString");
    v21 = v17;
    v22 = v13;
    v23 = v15;
    v24 = v12;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v14;
    v27 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("fp-update-%@.pb"), v25);
    objc_msgSend(v18, "stringByAppendingPathComponent:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v26;
    v12 = v24;
    v15 = v23;
    v13 = v22;
    v17 = v21;

    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __149__TRIFactorPackStorage__removeAssetsWithFactorNames_copyingModifiedFactorPackWithPath_appendingToPathsToRemove_appendingToMARefsToRemove_tempDirRef___block_invoke;
    v36[3] = &unk_1E9332F78;
    v37 = v12;
    v38 = v26;
    v39 = v33;
    v40 = v13;
    v41 = v15;
    v29 = (void *)MEMORY[0x1D8232C48](v36);
    v35 = 0;
    if ((objc_msgSend(MEMORY[0x1E0DC09E0], "copySourceFactorPack:toDestPath:error:modifyFactorLevel:", v17, v28, &v35, v29) & 1) != 0)
    {
      if (objc_msgSend(MEMORY[0x1E0CB3620], "triRemoveFileProtectionIfPresentForPath:", v28))
      {
        v30 = v28;
LABEL_10:
        v16 = v34;

        goto LABEL_11;
      }
    }
    else
    {
      TRILogCategory_Server();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v35;
        _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Failed to make modified copy of factor pack: %{public}@", buf, 0xCu);
      }

    }
    v30 = 0;
    goto LABEL_10;
  }
  v30 = 0;
LABEL_11:

  return v30;
}

id __149__TRIFactorPackStorage__removeAssetsWithFactorNames_copyingModifiedFactorPackWithPath_appendingToPathsToRemove_appendingToMARefsToRemove_tempDirRef___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "factor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasName");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "level");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileOrDirectoryLevelWithIsDir:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (objc_msgSend(v7, "isOnDemand"))
      {
        if (objc_msgSend(v7, "hasPath"))
        {
          v8 = *(void **)(a1 + 32);
          objc_msgSend(v3, "factor");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v10);

          if ((v8 & 1) != 0)
          {
            v11 = *(void **)(a1 + 40);
            objc_msgSend(v7, "path");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v12);

            objc_msgSend(v7, "setPath:", 0);
          }
        }
      }
    }
    else
    {
      objc_msgSend(v3, "level");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "levelOneOfCase");

      if (v15 == 104)
      {
        objc_msgSend(v3, "level");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "mobileAssetReferenceValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v17, "isOnDemand"))
          goto LABEL_22;
        v18 = *(void **)(a1 + 32);
        objc_msgSend(v3, "factor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v18) = objc_msgSend(v18, "containsObject:", v20);

        if ((v18 & 1) != 0)
        {
          v21 = (void *)objc_opt_class();
          objc_msgSend(v3, "factor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "relPathForMAReferenceWithFactorName:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 56), "stringByAppendingPathComponent:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "fileExistsAtPath:", v25);

          if ((v27 & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v25);
            v28 = *(void **)(a1 + 64);
            if (v28)
              objc_msgSend(v28, "setObject:forKey:", v17, v25);
            v29 = (void *)objc_opt_new();
            v38 = 0;
            v30 = objc_msgSend(v29, "writeToFile:options:error:", v25, 0x10000000, &v38);
            v31 = v38;

            if ((v30 & 1) == 0)
            {
              TRILogCategory_Server();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v40 = v25;
                _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "Unable to nil out MARef by creating a blank file at %{public}@", buf, 0xCu);
              }

            }
            v33 = v3;

          }
          else
          {
            v37 = v3;
          }

        }
        else
        {
LABEL_22:
          v36 = v3;
        }

        goto LABEL_20;
      }
    }
    v34 = v3;
LABEL_20:

    goto LABEL_21;
  }
  v13 = v3;
LABEL_21:

  return v3;
}

- (id)pathForFactorPackWithId:(id)a3 namespaceName:(id)a4
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[TRIFactorPackStorage _pathForFactorPackWithId:namespaceName:](self, "_pathForFactorPackWithId:namespaceName:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Factor pack does not exist at %{public}@", (uint8_t *)&v10, 0xCu);
    }

    goto LABEL_7;
  }
  v7 = v4;
LABEL_8:

  return v7;
}

- (id)_pathForFactorPackWithId:(id)a3 namespaceName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[TRIFactorPackStorage _parentDirForFactorPackWithNamespaceName:](self, "_parentDirForFactorPackWithNamespaceName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_parentDirForFactorPackWithNamespaceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x1D8232A5C]();
    -[TRIPaths treatmentsDir](self->_paths, "treatmentsDir");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/factorPacks"), v4);
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[TRIFactorPackStorage _parentDirForFactorPackWithNamespaceName:]";
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "%s has empty path arg: namespaceName", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (id)legacyPathForFactorPackWithId:(id)a3 namespaceName:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[TRIFactorPackStorage _legacyPathForFactorPackWithId:namespaceName:](self, "_legacyPathForFactorPackWithId:namespaceName:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "fileExistsAtPath:", v4))
      v6 = v4;
    else
      v6 = 0;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_legacyPathForFactorPackWithId:(id)a3 namespaceName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[TRIFactorPackStorage _legacyParentDirForFactorPackWithNamespaceName:](self, "_legacyParentDirForFactorPackWithNamespaceName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_legacyParentDirForFactorPackWithNamespaceName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[TRIFactorPackStorage _legacyParentDirForFactorPackWithNamespaceName:]";
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "%s has empty path arg: namespaceName", buf, 0xCu);
    }

    goto LABEL_7;
  }
  *(_DWORD *)buf = 0;
  TRINamespace_NamespaceId_EnumDescriptor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getValue:forEnumTextFormatName:", buf, v4);

  if (!v6)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v7 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIPaths treatmentsDir](self->_paths, "treatmentsDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%d/factorPacks"), *(unsigned int *)buf);
  objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
LABEL_8:

  return v11;
}

- (BOOL)removeUnreferencedFactorPacksWithRemovedCount:(unsigned int *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  uint64_t v20;
  unsigned int v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  -[TRIPaths treatmentsDir](self->_paths, "treatmentsDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 1;
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, 0, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v9, "nextObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v13 = (void *)v11;
    v8 = 1;
    *(_QWORD *)&v12 = 134217984;
    v18 = v12;
    do
    {
      objc_msgSend(v13, "lastPathComponent", v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v20 = -1;
        if (objc_msgSend(MEMORY[0x1E0DC0AD0], "convertFromString:usingBase:toI64:", v14, 10, &v20))
        {
          if ((unint64_t)(v20 - 1) > 0x7FFFFFFE)
          {
            TRILogCategory_Server();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v18;
              v23 = v20;
              _os_log_debug_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEBUG, "Skipping removal of factor packs for unrecognized id-based namespace: %lld", buf, 0xCu);
            }
          }
          else
          {
            TRINamespace_NamespaceId_EnumDescriptor();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "textFormatNameForValue:", v20);
            v16 = objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              v8 &= -[TRIFactorPackStorage _removeUnreferencedFactorPackSetsWithNamespaceName:removedCount:](self, "_removeUnreferencedFactorPackSetsWithNamespaceName:removedCount:", v16, &v21);
            }
            else
            {
              TRILogCategory_Server();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v18;
                v23 = v20;
                _os_log_debug_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEBUG, "Skipping removal of factor packs for unrecognized id-based namespace: %lld", buf, 0xCu);
              }
            }
          }

        }
        else
        {
          v8 &= -[TRIFactorPackStorage _removeUnreferencedFactorPackSetsWithNamespaceName:removedCount:](self, "_removeUnreferencedFactorPackSetsWithNamespaceName:removedCount:", v14, &v21);
        }
      }

      objc_autoreleasePoolPop(v10);
      v10 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v9, "nextObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v13);
  }
  objc_autoreleasePoolPop(v10);
  if (a3)
    *a3 = v21;

  return v8 & 1;
}

- (BOOL)_removeUnreferencedFactorPackSetsWithNamespaceName:(id)a3 removedCount:(unsigned int *)a4
{
  char *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = (char *)a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorPackStorage.m"), 1133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("removedCount"));

  }
  if (objc_msgSend(v7, "length"))
  {
    -[TRIFactorPackStorage _parentDirForFactorPackWithNamespaceName:](self, "_parentDirForFactorPackWithNamespaceName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    -[TRIFactorPackStorage _legacyParentDirForFactorPackWithNamespaceName:](self, "_legacyParentDirForFactorPackWithNamespaceName:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v27[0] = v8;
      v27[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v12)
      {
        v13 = v12;
        v21 = v10;
        v22 = v8;
        v14 = *(_QWORD *)v24;
        v15 = 1;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            v18 = (void *)MEMORY[0x1D8232A5C]();
            v15 &= -[TRIFactorPackStorage _removeUnreferencedFactorPackSetsWithParentDir:removedCount:](self, "_removeUnreferencedFactorPackSetsWithParentDir:removedCount:", v17, a4);
            objc_autoreleasePoolPop(v18);
          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v13);
        v10 = v21;
        v8 = v22;
      }
      else
      {
        LOBYTE(v15) = 1;
      }
    }
    else
    {
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v30 = v7;
        _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Unable to determine parent dir(s) for factor pack with namespace name: %{public}@", buf, 0xCu);
      }
      LOBYTE(v15) = 0;
    }

  }
  else
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[TRIFactorPackStorage _removeUnreferencedFactorPackSetsWithNamespaceName:removedCount:]";
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "%s has empty path arg: namespaceName", buf, 0xCu);
    }
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (BOOL)_removeUnreferencedFactorPackSetsWithParentDir:(id)a3 removedCount:(unsigned int *)a4
{
  id v6;
  void *v7;
  TRITempDirScopeGuard *v8;
  void *v9;
  TRITempDirScopeGuard *v10;
  BOOL v11;
  _QWORD v13[4];
  TRITempDirScopeGuard *v14;
  uint64_t *v15;
  unsigned int *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC0A98], "arrayFromDirectory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = [TRITempDirScopeGuard alloc];
    -[TRIPaths localTempDir](self->_paths, "localTempDir");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TRITempDirScopeGuard initWithPath:](v8, "initWithPath:", v9);

    if (v10)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 1;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __84__TRIFactorPackStorage__removeUnreferencedFactorPackSetsWithParentDir_removedCount___block_invoke;
      v13[3] = &unk_1E9331290;
      v15 = &v17;
      v14 = v10;
      v16 = a4;
      if (objc_msgSend(v7, "enumerateStringsWithBlock:", v13))
        v11 = *((_BYTE *)v18 + 24) != 0;
      else
        v11 = 0;

      _Block_object_dispose(&v17, 8);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __84__TRIFactorPackStorage__removeUnreferencedFactorPackSetsWithParentDir_removedCount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  char v9;

  v9 = 0;
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[TRIReferenceManagedDir collectGarbageForManagedDir:withExternalReferenceStore:usingTempDir:managedDirWasDeleted:](TRIReferenceManagedDir, "collectGarbageForManagedDir:withExternalReferenceStore:usingTempDir:managedDirWasDeleted:", v4, 0, v5, &v9);

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = v6;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;

  if (v9)
    ++**(_DWORD **)(a1 + 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
