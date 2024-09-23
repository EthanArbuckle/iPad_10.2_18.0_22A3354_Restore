@implementation TRIFBFactorPackStorage

- (TRIFBFactorPackStorage)initWithPaths:(id)a3 extractor:(id)a4
{
  id v7;
  id v8;
  TRIFBFactorPackStorage *v9;
  TRIFBFactorPackStorage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIFBFactorPackStorage;
  v9 = -[TRIFBFactorPackStorage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_extractor, a4);
  }

  return v10;
}

- (TRIFBFactorPackStorage)initWithPaths:(id)a3
{
  id v4;
  TRIRemoteAssetExtractor *v5;
  TRIFBFactorPackStorage *v6;

  v4 = a3;
  v5 = -[TRIRemoteAssetExtractor initWithMonitoredActivity:]([TRIRemoteAssetExtractor alloc], "initWithMonitoredActivity:", 0);
  v6 = -[TRIFBFactorPackStorage initWithPaths:extractor:](self, "initWithPaths:extractor:", v4, v5);

  return v6;
}

- (void)useNamespaceIdInSchema:(BOOL)a3
{
  populateNamespaceIdInSchema = a3;
}

- (BOOL)saveFactorLevelsForFactorPack:(id)a3 populatingAssetsForFactorNames:(id)a4 aliasToUnaliasMap:(id)a5 factorLevelsByNamePath:(id *)a6 factorLevelsByIdPath:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  TRIAssetStore *v26;
  TRIPaths *paths;
  TRIRemoteAssetPatcher *v28;
  TRIAssetStore *v29;
  TRITempDirScopeGuard *v30;
  void *v31;
  TRITempDirScopeGuard *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  const char *v47;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  TRIAssetStore *v56;
  TRITempDirScopeGuard *v57;
  void *v58;
  void *v59;
  id v60;
  TRIAssetExtracting *extractor;
  id *v62;
  NSObject *v63;
  NSObject *obj;
  uint8_t buf[4];
  NSObject *v66;
  __int16 v67;
  NSObject *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)MEMORY[0x1D8232A5C]();
  if ((objc_msgSend(v12, "hasFactorPackId") & 1) == 0)
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v47 = "TRIClientFactorPack has missing factorPackId";
LABEL_38:
    _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, v47, buf, 2u);
    goto LABEL_32;
  }
  if (!objc_msgSend(v12, "hasSelectedNamespace")
    || (objc_msgSend(v12, "selectedNamespace"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "hasName"),
        v16,
        (v17 & 1) == 0))
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v47 = "TRIClientFactorPack has missing namespaceName";
    goto LABEL_38;
  }
  objc_msgSend(v12, "factorPackId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  TRIValidateFactorPackId();
  v19 = objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
LABEL_32:
    v35 = 0;
    goto LABEL_33;
  }
  v62 = a7;
  objc_msgSend(v12, "selectedNamespace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFBFactorPackStorage _pathForFactorLevelsWithFactorPackId:namespaceName:](self, "_pathForFactorLevelsWithFactorPackId:namespaceName:", v19, v21);
  v22 = objc_claimAutoreleasedReturnValue();

  obj = v22;
  if (!v22)
  {
    TRILogCategory_Server();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "factorPackId");
      v50 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "selectedNamespace");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "name");
      v52 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v50;
      v67 = 2114;
      v68 = v52;
      _os_log_error_impl(&dword_1D207F000, v49, OS_LOG_TYPE_ERROR, "Failed to resolve location for factor pack %{public}@ with namespace %{public}@.", buf, 0x16u);

    }
    goto LABEL_32;
  }
  objc_msgSend(v12, "selectedNamespace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFBFactorPackStorage _legacyPathForFactorLevelsWithFactorPackId:namespaceName:](self, "_legacyPathForFactorLevelsWithFactorPackId:namespaceName:", v19, v24);
  v25 = objc_claimAutoreleasedReturnValue();

  v63 = v25;
  if (v25)
  {
    v26 = [TRIAssetStore alloc];
    paths = self->_paths;
    extractor = self->_extractor;
    v28 = -[TRIRemoteAssetPatcher initWithMonitoredActivity:]([TRIRemoteAssetPatcher alloc], "initWithMonitoredActivity:", 0);
    v29 = -[TRIAssetStore initWithPaths:extractor:patcher:](v26, "initWithPaths:extractor:patcher:", paths, extractor, v28);

    v30 = [TRITempDirScopeGuard alloc];
    -[TRIPaths localTempDir](self->_paths, "localTempDir");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[TRITempDirScopeGuard initWithPath:](v30, "initWithPath:", v31);

    if (v32)
    {
      -[TRIFBFactorPackStorage _writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:](self, "_writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:", v12, obj, v13, v14, v29, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIFBFactorPackStorage _writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:](self, "_writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:", v12, v63, v13, v14, v29, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      if (v33 && v34)
      {
        v60 = v34;
        -[NSObject stringByDeletingLastPathComponent](obj, "stringByDeletingLastPathComponent");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v36)
          && objc_msgSend(MEMORY[0x1E0CB3620], "triRemoveFileProtectionIfPresentForPath:", v36)
          && (v36,
              -[NSObject stringByDeletingLastPathComponent](v63, "stringByDeletingLastPathComponent"),
              v36 = (void *)objc_claimAutoreleasedReturnValue(),
              (objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v36) & 1) != 0)
          && objc_msgSend(MEMORY[0x1E0CB3620], "triRemoveFileProtectionIfPresentForPath:", v36))
        {
          v56 = v29;
          v57 = v32;

          -[NSObject stringByAppendingPathComponent:](v63, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
          v37 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)v37;
          LOBYTE(v37) = objc_msgSend(v38, "isReadableFileAtPath:", v37);

          if ((v37 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "triSafeCopyItemAtPath:toPath:error:", v39, v59, 0);

          }
          -[NSObject stringByAppendingPathComponent:](obj, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
          v41 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)v41;
          LODWORD(v41) = objc_msgSend(v42, "isReadableFileAtPath:", v41);

          if ((_DWORD)v41)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "triSafeCopyItemAtPath:toPath:error:", v43, v58, 0);

          }
          if (objc_msgSend(MEMORY[0x1E0CB3620], "triForceRenameWithSourcePath:destPath:", v33, obj)
            && objc_msgSend(MEMORY[0x1E0CB3620], "triForceRenameWithSourcePath:destPath:", v60, v63))
          {

            TRILogCategory_Server();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v66 = v19;
              v67 = 2114;
              v68 = obj;
              _os_log_impl(&dword_1D207F000, v45, OS_LOG_TYPE_DEFAULT, "Wrote factor pack %{public}@ --> %{public}@", buf, 0x16u);
            }

            TRILogCategory_Server();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v66 = v19;
              v67 = 2114;
              v68 = v63;
              _os_log_impl(&dword_1D207F000, v46, OS_LOG_TYPE_DEFAULT, "Wrote factor pack %{public}@ --> %{public}@", buf, 0x16u);
            }

            if (a6)
              objc_storeStrong(a6, obj);
            if (v62)
              objc_storeStrong(v62, v63);
            v35 = 1;
            v29 = v56;
            v32 = v57;
          }
          else
          {

            v35 = 0;
            v29 = v56;
            v32 = v57;
          }
        }
        else
        {

          v35 = 0;
        }
        v34 = v60;
      }

    }
    else
    {
      v35 = 0;
    }

  }
  else
  {
    TRILogCategory_Server();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "factorPackId");
      v53 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "selectedNamespace");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "name");
      v55 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v53;
      v67 = 2114;
      v68 = v55;
      _os_log_error_impl(&dword_1D207F000, v63, OS_LOG_TYPE_ERROR, "Failed to resolve location for factor pack %{public}@ with namespace %{public}@.", buf, 0x16u);

    }
    v35 = 0;
  }

LABEL_33:
  objc_autoreleasePoolPop(v15);

  return v35;
}

- (BOOL)saveFactorPackToGlobal:(id)a3 forFactorNames:(id)a4 aliasToUnaliasMap:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  TRIAssetStore *v19;
  TRIPaths *paths;
  TRIAssetExtracting *extractor;
  TRIRemoteAssetPatcher *v22;
  TRITempDirScopeGuard *v23;
  void *v24;
  TRITempDirScopeGuard *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  TRIRemoteAssetStoreOperator *v32;
  _BOOL4 v33;
  NSObject *v34;
  NSObject *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  TRIAssetStore *v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _BYTE *v46;
  uint8_t buf[4];
  NSObject *v48;
  __int16 v49;
  NSObject *v50;
  _BYTE v51[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v43 = a4;
  v42 = a5;
  objc_msgSend(v8, "factorPackId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  TRIValidateFactorPackId();
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1D8232A5C]();
    -[TRIPaths treatmentsDirUsingGlobal:](self->_paths, "treatmentsDirUsingGlobal:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v8, "selectedNamespace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@/factorPacks"), v15);
    objc_msgSend(v12, "stringByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", v10);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v11);
    if (v18)
    {
      v19 = [TRIAssetStore alloc];
      paths = self->_paths;
      extractor = self->_extractor;
      v22 = -[TRIRemoteAssetPatcher initWithMonitoredActivity:]([TRIRemoteAssetPatcher alloc], "initWithMonitoredActivity:", 0);
      v41 = -[TRIAssetStore initWithPaths:extractor:patcher:](v19, "initWithPaths:extractor:patcher:", paths, extractor, v22);

      v23 = [TRITempDirScopeGuard alloc];
      -[TRIPaths localTempDir](self->_paths, "localTempDir");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[TRITempDirScopeGuard initWithPath:](v23, "initWithPath:", v24);

      if (v25)
      {
        -[TRIFBFactorPackStorage _writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:](self, "_writeFactorPack:futurePath:forFactorNames:aliasToUnaliasMap:assetStore:tempDirRef:", v8, v18, v43, v42, v41, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          -[NSObject stringByAppendingPathComponent:](v18, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringByAppendingPathComponent:", CFSTR("factorPack.pb"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v26;
          v30 = objc_msgSend(v29, "isReadableFileAtPath:", v27);

          if (v30)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "triSafeCopyItemAtPath:toPath:error:", v27, v28, 0);

          }
          *(_QWORD *)v51 = 0;
          *(_QWORD *)&v51[8] = v51;
          *(_QWORD *)&v51[16] = 0x3032000000;
          v52 = __Block_byref_object_copy__10;
          v53 = __Block_byref_object_dispose__10;
          v26 = v40;
          v54 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __82__TRIFBFactorPackStorage_saveFactorPackToGlobal_forFactorNames_aliasToUnaliasMap___block_invoke;
          v44[3] = &unk_1E9331060;
          v45 = v43;
          v46 = v51;
          objc_msgSend(v8, "enumerateFactorLevelsWithBlock:", v44);
          v32 = -[TRIRemoteAssetStoreOperator initWithPaths:]([TRIRemoteAssetStoreOperator alloc], "initWithPaths:", self->_paths);
          v33 = -[TRIRemoteAssetStoreOperator saveFactorPackToGlobalPath:fromTemporaryPath:factors:](v32, "saveFactorPackToGlobalPath:fromTemporaryPath:factors:", v18, v40, *(_QWORD *)(*(_QWORD *)&v51[8] + 40));
          if (v33)
          {
            TRILogCategory_Server();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v48 = v10;
              v49 = 2114;
              v50 = v18;
              _os_log_impl(&dword_1D207F000, v34, OS_LOG_TYPE_DEFAULT, "Wrote global factor pack %{public}@ --> %{public}@", buf, 0x16u);
            }
          }
          else
          {
            TRILogCategory_Server();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v18;
              _os_log_error_impl(&dword_1D207F000, v34, OS_LOG_TYPE_ERROR, "Failed to write global factor pack to %@", buf, 0xCu);
            }
          }

          _Block_object_dispose(v51, 8);
        }
        else
        {
          TRILogCategory_Server();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v51 = 0;
            _os_log_error_impl(&dword_1D207F000, v35, OS_LOG_TYPE_ERROR, "Failed to create or copy global fb factor pack to a temporary directory.", v51, 2u);
          }

          LOBYTE(v33) = 0;
        }

      }
      else
      {
        LOBYTE(v33) = 0;
      }

    }
    else
    {
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "factorPackId");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "selectedNamespace");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "name");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v51 = 138543618;
        *(_QWORD *)&v51[4] = v37;
        *(_WORD *)&v51[12] = 2114;
        *(_QWORD *)&v51[14] = v39;
        _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Failed to resolve location for factor pack %{public}@ with namespace %{public}@.", v51, 0x16u);

      }
      LOBYTE(v33) = 0;
    }

  }
  else
  {
    LOBYTE(v33) = 0;
  }

  return v33;
}

void __82__TRIFBFactorPackStorage_saveFactorPackToGlobal_forFactorNames_aliasToUnaliasMap___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  NSObject *v50;
  id v51;
  id v52;
  id v53;
  NSObject *oslog;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  NSObject *v69;
  id v70;
  id v71;
  NSObject *v72;
  id v73;
  TRIFBFactorPackStorage *v74;
  id v75;
  id v76;
  id v77;
  uint64_t *v78;
  _BYTE *v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD v85[3];
  int v86;
  id v87;
  uint8_t v88[4];
  NSObject *v89;
  __int16 v90;
  id v91;
  _BYTE buf[24];
  char v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v59 = a4;
  v58 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if ((objc_msgSend(v15, "hasFactorPackId") & 1) != 0)
  {
    objc_msgSend(v15, "factorPackId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    TRIValidateFactorPackId();
    v20 = objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB3940]);
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("fl-%@-%@"), v20, v23);

      objc_msgSend(v18, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByAppendingPathComponent:", v24);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v57)
        && objc_msgSend(MEMORY[0x1E0CB3620], "triRemoveFileProtectionIfPresentForPath:", v57))
      {

        objc_msgSend(v15, "data");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "length");

        objc_msgSend(v57, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = 0;
        v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCED8]), "initWithFileAtPath:capacity:error:", v55, 2 * v27, &v87);
        v53 = v87;
        if (!v56)
        {
          TRILogCategory_Server();
          oslog = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v57;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v53;
            _os_log_error_impl(&dword_1D207F000, oslog, OS_LOG_TYPE_ERROR, "Failed to create factor levels fb at %{public}@: %{public}@", buf, 0x16u);
          }
          v29 = 0;
          goto LABEL_27;
        }
        v28 = (void *)objc_opt_new();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v93 = 0;
        v85[0] = 0;
        v85[1] = v85;
        v85[2] = 0x2020000000;
        v86 = 0;
        v81 = 0;
        v82 = &v81;
        v83 = 0x2020000000;
        v84 = 0;
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke;
        v68[3] = &unk_1E93311A0;
        v78 = &v81;
        v50 = v20;
        v69 = v50;
        v79 = buf;
        v70 = v16;
        v51 = v56;
        v71 = v51;
        v80 = v85;
        oslog = v28;
        v72 = oslog;
        v73 = v58;
        v74 = self;
        v75 = v17;
        v49 = v57;
        v76 = v49;
        v77 = v59;
        objc_msgSend(v15, "enumerateFactorLevelsWithBlock:", v68);
        if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        {
          v29 = 0;
LABEL_26:

          _Block_object_dispose(&v81, 8);
          _Block_object_dispose(v85, 8);
          _Block_object_dispose(buf, 8);
LABEL_27:

          goto LABEL_12;
        }
        v31 = -[NSObject count](oslog, "count");
        if (v31 != v82[3])
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFactorPackStorage.m"), 630, CFSTR("Failed to serialize one or more factor levels"));

        }
        objc_msgSend(v51, "trifbCreateSortedVectorOfFactorLevelWithOffsets:", oslog);
        v32 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "createString:", v50);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)v32;
        objc_msgSend(v15, "selectedNamespace");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "name");
        v34 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "createString:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "selectedNamespace");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "compatibilityVersionArray_Count");
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_266;
        v66[3] = &unk_1E93311C8;
        v67 = v15;
        objc_msgSend(v51, "createVectorOfUInt32WithCount:block:", v37, v66);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2_268;
        v61[3] = &unk_1E93311F0;
        v39 = v47;
        v62 = v39;
        v46 = v45;
        v63 = v46;
        v40 = v35;
        v64 = v40;
        v48 = v38;
        v65 = v48;
        objc_msgSend(v51, "trifbCreateFastFactorLevelsUsingBlock:", v61);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0;
        LOBYTE(v34) = objc_msgSend(v51, "trifbFinishBufferWithRootFastFactorLevelsOfs:error:", v41, &v60);
        v52 = v60;
        if ((v34 & 1) != 0)
        {
          v42 = v40;
          if (+[TRIReferenceManagedDir createFromDir:](TRIReferenceManagedDir, "createFromDir:", v49))
          {
            v29 = v49;
LABEL_25:

            goto LABEL_26;
          }
        }
        else
        {
          TRILogCategory_Server();
          v43 = objc_claimAutoreleasedReturnValue();
          v42 = v40;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v88 = 138543618;
            v89 = v50;
            v90 = 2114;
            v91 = v52;
            _os_log_error_impl(&dword_1D207F000, v43, OS_LOG_TYPE_ERROR, "Failed to write factor levels for factor pack %{public}@: %{public}@", v88, 0x16u);
          }

        }
        v29 = 0;
        goto LABEL_25;
      }

    }
  }
  else
  {
    TRILogCategory_ClientFramework();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v59;
      _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Failed to find factor pack identifier when writing factor pack to path: %{public}@", buf, 0xCu);
    }
  }
  v29 = 0;
LABEL_12:

  return v29;
}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  void *v128;
  void *v129;
  _QWORD v131[4];
  id v132;
  id v133;
  _QWORD v134[4];
  id v135;
  id v136;
  id v137;
  id v138;
  _QWORD v139[4];
  id v140;
  id v141;
  _QWORD v142[4];
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  _QWORD v149[4];
  id v150;
  id v151;
  _QWORD v152[4];
  id v153;
  id v154;
  _QWORD v155[4];
  id v156;
  id v157;
  _QWORD v158[4];
  id v159;
  id v160;
  _QWORD v161[4];
  id v162;
  id v163;
  _QWORD v164[4];
  id v165;
  id v166;
  id v167;
  id v168;
  uint64_t v169;
  _BYTE *v170;
  _QWORD v171[4];
  id v172;
  id v173;
  uint8_t v174[4];
  void *v175;
  __int16 v176;
  uint64_t v177;
  _BYTE buf[24];
  char v179;
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
  if (!objc_msgSend(v4, "hasFactor")
    || (objc_msgSend(v4, "factor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasName"),
        v5,
        (v6 & 1) == 0))
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v71 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v71;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Factor level has missing factor name in factor pack %{public}@.", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "hasLevel") & 1) == 0)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "factor");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "name");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v110;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v111;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Factor %{public}@ has missing level in factor pack %{public}@.", buf, 0x16u);

    }
LABEL_8:

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
    *a3 = 1;
    goto LABEL_9;
  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v4, "factor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v4, "factor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  v129 = v12;
  objc_msgSend(*(id *)(a1 + 48), "createString:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "factor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setName:", v12);

  v17 = *(void **)(a1 + 48);
  objc_msgSend(v4, "factor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "id_p");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "createString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "level");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithCapacity:", objc_msgSend(v22, "metadata_Count"));

  objc_msgSend(v4, "level");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "metadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v171[0] = MEMORY[0x1E0C809B0];
  v171[1] = 3221225472;
  v171[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_246;
  v171[3] = &unk_1E93310B0;
  v172 = *(id *)(a1 + 48);
  v173 = v23;
  v26 = v23;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v171);

  objc_msgSend(*(id *)(a1 + 48), "trifbCreateSortedVectorOfFactorMetadataKeyValueWithOffsets:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v179 = 0;
  v164[0] = MEMORY[0x1E0C809B0];
  v164[1] = 3221225472;
  v164[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_3;
  v164[3] = &unk_1E93310D8;
  v126 = v20;
  v165 = v126;
  v125 = v15;
  v166 = v125;
  v28 = v4;
  v167 = v28;
  v29 = v27;
  v30 = *(_QWORD *)(a1 + 120);
  v127 = v29;
  v168 = v29;
  v169 = v30;
  v170 = buf;
  v128 = (void *)MEMORY[0x1D8232C48](v164);
  objc_msgSend(v28, "level");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "levelOneOfCase");

  switch(v32)
  {
    case 10:
      v33 = objc_alloc(MEMORY[0x1E0DC0A48]);
      objc_msgSend(v28, "level");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (id)objc_msgSend(v33, "initWithVal:", objc_msgSend(v34, "BOOLeanValue"));

      objc_msgSend(*(id *)(a1 + 48), "trifbCreateBoxedBoolFromBoxedBool:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(void **)(a1 + 48);
      v161[0] = MEMORY[0x1E0C809B0];
      v161[1] = 3221225472;
      v161[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_4;
      v161[3] = &unk_1E9331100;
      v38 = v36;
      v162 = v38;
      v163 = v128;
      objc_msgSend(v37, "trifbCreateFactorLevelUsingBlock:", v161);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v39);

      goto LABEL_37;
    case 11:
      v91 = *(void **)(a1 + 48);
      objc_msgSend(v28, "level");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "stringValue");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "createString:", v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      v95 = *(void **)(a1 + 48);
      v158[0] = MEMORY[0x1E0C809B0];
      v158[1] = 3221225472;
      v158[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_5;
      v158[3] = &unk_1E9331100;
      v35 = v94;
      v159 = v35;
      v160 = v128;
      objc_msgSend(v95, "trifbCreateFactorLevelUsingBlock:", v158);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v96);

      v38 = v159;
      goto LABEL_37;
    case 12:
    case 14:
      goto LABEL_38;
    case 13:
      v97 = objc_alloc(MEMORY[0x1E0DC0A58]);
      objc_msgSend(v28, "level");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (id)objc_msgSend(v97, "initWithVal:", objc_msgSend(v98, "longValue"));

      objc_msgSend(*(id *)(a1 + 48), "trifbCreateBoxedInt64FromBoxedInt64:", v35);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = *(void **)(a1 + 48);
      v155[0] = MEMORY[0x1E0C809B0];
      v155[1] = 3221225472;
      v155[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_6;
      v155[3] = &unk_1E9331100;
      v38 = v99;
      v156 = v38;
      v157 = v128;
      objc_msgSend(v100, "trifbCreateFactorLevelUsingBlock:", v155);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v101);

      goto LABEL_37;
    case 15:
      v102 = objc_alloc(MEMORY[0x1E0DC0A50]);
      objc_msgSend(v28, "level");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "doubleValue");
      v35 = (id)objc_msgSend(v102, "initWithVal:");

      objc_msgSend(*(id *)(a1 + 48), "trifbCreateBoxedDoubleFromBoxedDouble:", v35);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = *(void **)(a1 + 48);
      v152[0] = MEMORY[0x1E0C809B0];
      v152[1] = 3221225472;
      v152[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_7;
      v152[3] = &unk_1E9331100;
      v38 = v104;
      v153 = v38;
      v154 = v128;
      objc_msgSend(v105, "trifbCreateFactorLevelUsingBlock:", v152);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v106);

      goto LABEL_37;
    default:
      if ((v32 - 100) < 2)
      {
        objc_msgSend(v28, "level");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "fileOrDirectoryLevelWithIsDir:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = objc_msgSend(v41, "hasAsset");
        v43 = v129;
        if (!v42)
          goto LABEL_24;
        objc_msgSend(v41, "asset", v129);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v44, "hasCloudKitContainer") & 1) == 0)
        {
          v45 = objc_msgSend(v41, "isOnDemand");

          v43 = v129;
          if (!v45)
            goto LABEL_24;
          TRILogCategory_Server();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v28, "factor");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "name");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v174 = 138543362;
            v175 = v120;
            _os_log_debug_impl(&dword_1D207F000, v46, OS_LOG_TYPE_DEBUG, "Populating system default cloudKitContainer on asset for \"%{public}@\", v174, 0xCu);

          }
          objc_msgSend(v41, "asset");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setCloudKitContainer:", 1);
        }

        v43 = v129;
LABEL_24:
        if (!objc_msgSend(*(id *)(a1 + 64), "containsObject:", v43)
          || (objc_msgSend(*(id *)(a1 + 72), "_linkAssetsUpdatingFactorLevel:fromFactorPackWithId:usingAssetStore:currentFactorPackPath:futureFactorPackPath:", v28, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96)) & 1) != 0)
        {
          v47 = *(void **)(a1 + 48);
          objc_msgSend(v41, "path");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "createString:", v48);
          v123 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = *(void **)(a1 + 48);
          objc_msgSend(v41, "asset");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "assetId");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "createString:", v51);
          v122 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = *(void **)(a1 + 48);
          objc_msgSend(v41, "asset");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "treatmentId");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "createString:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = *(void **)(a1 + 48);
          objc_msgSend(v41, "asset");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "name");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "createString:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          v60 = *(void **)(a1 + 48);
          v61 = MEMORY[0x1E0C809B0];
          v149[0] = MEMORY[0x1E0C809B0];
          v149[1] = 3221225472;
          v149[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_253;
          v149[3] = &unk_1E9331128;
          v62 = v41;
          v150 = v62;
          v121 = v55;
          v151 = v121;
          objc_msgSend(v60, "trifbCreateCloudKitTreatmentRecordAssetUsingBlock:", v149);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = *(void **)(a1 + 48);
          v142[0] = v61;
          v142[1] = 3221225472;
          v142[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2_255;
          v142[3] = &unk_1E9331150;
          v35 = v62;
          v143 = v35;
          v38 = v123;
          v144 = v38;
          v145 = v28;
          v124 = v122;
          v146 = v124;
          v65 = v63;
          v147 = v65;
          v66 = v59;
          v148 = v66;
          objc_msgSend(v64, "trifbCreateTrialManagedAssetUsingBlock:", v142);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = *(void **)(a1 + 48);
          v139[0] = v61;
          v139[1] = 3221225472;
          v139[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_3_257;
          v139[3] = &unk_1E9331100;
          v69 = v67;
          v140 = v69;
          v141 = v128;
          objc_msgSend(v68, "trifbCreateFactorLevelUsingBlock:", v139);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v70);

LABEL_37:
          goto LABEL_38;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
        *a3 = 1;

        goto LABEL_43;
      }
      if (v32 != 104)
      {
LABEL_38:
        if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          goto LABEL_43;
        TRILogCategory_Server();
        v107 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v28, "factor");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "name");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "level");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = objc_msgSend(v114, "levelOneOfCase");
          *(_DWORD *)v174 = 138543618;
          v175 = v113;
          v176 = 1024;
          LODWORD(v177) = v115;
          _os_log_error_impl(&dword_1D207F000, v107, OS_LOG_TYPE_ERROR, "Factor %{public}@ has unsupported factor level with type %d.", v174, 0x12u);

        }
        goto LABEL_42;
      }
      if (objc_msgSend(*(id *)(a1 + 64), "containsObject:", v129)
        && (objc_msgSend(*(id *)(a1 + 72), "_linkAssetsUpdatingFactorLevel:fromFactorPackWithId:usingAssetStore:currentFactorPackPath:futureFactorPackPath:", v28, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96)) & 1) == 0)
      {
LABEL_42:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
        *a3 = 1;
        goto LABEL_43;
      }
      objc_msgSend(v28, "level");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "mobileAssetReferenceValue");
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v73, "hasAssetType")
        && objc_msgSend(v73, "hasAssetSpecifier")
        && (objc_msgSend(v73, "hasAssetVersion") & 1) != 0)
      {
        v74 = *(void **)(a1 + 48);
        objc_msgSend(v73, "assetType");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "createString:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        v77 = *(void **)(a1 + 48);
        objc_msgSend(v73, "assetSpecifier");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "createString:", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        v80 = *(void **)(a1 + 48);
        objc_msgSend(v73, "assetVersion");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "createString:", v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        v83 = *(void **)(a1 + 48);
        v84 = MEMORY[0x1E0C809B0];
        v134[0] = MEMORY[0x1E0C809B0];
        v134[1] = 3221225472;
        v134[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_258;
        v134[3] = &unk_1E9331178;
        v38 = v76;
        v135 = v38;
        v85 = v79;
        v136 = v85;
        v86 = v82;
        v137 = v86;
        v35 = v73;
        v138 = v35;
        objc_msgSend(v83, "trifbCreateMobileAssetReferenceUsingBlock:", v134);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = *(void **)(a1 + 48);
        v131[0] = v84;
        v131[1] = 3221225472;
        v131[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2_260;
        v131[3] = &unk_1E9331100;
        v89 = v87;
        v132 = v89;
        v133 = v128;
        objc_msgSend(v88, "trifbCreateFactorLevelUsingBlock:", v131);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v90);

        goto LABEL_37;
      }
      TRILogCategory_Server();
      v108 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v28, "factor");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "name");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v174 = 138543618;
        v175 = v117;
        v176 = 2114;
        v177 = v118;
        _os_log_error_impl(&dword_1D207F000, v108, OS_LOG_TYPE_ERROR, "Factor %{public}@ has missing MAAutoAsset metadata in factor pack %{public}@.", v174, 0x16u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
      *a3 = 1;

LABEL_43:
      _Block_object_dispose(buf, 8);

      break;
  }
LABEL_9:

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_246(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "createString:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "createString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2;
  v13[3] = &unk_1E9331088;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v12 = v7;
  objc_msgSend(v9, "trifbCreateFactorMetadataKeyValueUsingBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setKey:", v3);
  objc_msgSend(v4, "setVal:", *(_QWORD *)(a1 + 40));

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setFactorId:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "setName:", *(_QWORD *)(a1 + 40));
  if (populateNamespaceIdInSchema)
  {
    objc_msgSend(*(id *)(a1 + 48), "factor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasNamespaceId");

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 48), "factor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setNamespaceId:", objc_msgSend(v5, "namespaceId"));

    }
  }
  objc_msgSend(v6, "setMetadata:", *(_QWORD *)(a1 + 56));
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_msgSend(v6, "setCacheKey:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevelWithBoolVal:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevelWithStringVal:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevelWithInt64Val:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevelWithDoubleVal:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_253(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cloudKitContainer");

  if (v4 == 1)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "cloudKitContainer");

    if (v7 != 2)
      goto LABEL_6;
    v5 = 2;
  }
  objc_msgSend(v11, "setContainer:", v5);
LABEL_6:
  objc_msgSend(v11, "setTreatmentId:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasCloudKitIndex");

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAssetIndex:", objc_msgSend(v10, "cloudKitIndex"));

    objc_msgSend(v11, "setHasCkIndex:", 1);
  }

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2_255(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasPath"))
    objc_msgSend(v10, "setPath:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "level");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "levelOneOfCase") != 101;

  objc_msgSend(v10, "setFileType:", v4);
  objc_msgSend(v10, "setAssetId:", *(_QWORD *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 32), "hasAsset"))
    objc_msgSend(v10, "setCloudKitMetadataWithTreatment:", *(_QWORD *)(a1 + 64));
  if (objc_msgSend(*(id *)(a1 + 32), "hasIsOnDemand"))
  {
    objc_msgSend(v10, "setIsOnDemand:", objc_msgSend(*(id *)(a1 + 32), "isOnDemand"));
    objc_msgSend(v10, "setHasOnDemandFlag:", 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSize");

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDownloadSize:", objc_msgSend(v7, "size"));

  }
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasName");

  if (v9)
    objc_msgSend(v10, "setAssetName:", *(_QWORD *)(a1 + 72));

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_3_257(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevelWithTrialAssetVal:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_258(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setType:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setSpecifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setVersion:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setFileType:", objc_msgSend(*(id *)(a1 + 56), "isFileFactor"));
  objc_msgSend(v3, "setIsOnDemand:", objc_msgSend(*(id *)(a1 + 56), "isOnDemand"));
  if (objc_msgSend(*(id *)(a1 + 56), "hasSize"))
    objc_msgSend(v3, "setDownloadSize:", objc_msgSend(*(id *)(a1 + 56), "size"));

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2_260(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLevelWithMaRefVal:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_266(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "selectedNamespace");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "compatibilityVersionArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = objc_msgSend(v5, "valueAtIndex:", a2);

}

void __109__TRIFBFactorPackStorage__writeFactorPack_futurePath_forFactorNames_aliasToUnaliasMap_assetStore_tempDirRef___block_invoke_2_268(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setLevels:", v3);
  objc_msgSend(v4, "setSourceWithFactorPackId:", a1[5]);
  objc_msgSend(v4, "setNamespaceName:", a1[6]);
  objc_msgSend(v4, "setNcvs:", a1[7]);

}

- (id)loadFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4
{
  void *v5;
  void *v6;

  -[TRIFBFactorPackStorage pathForFactorLevelsWithFactorPackId:namespaceName:](self, "pathForFactorLevelsWithFactorPackId:namespaceName:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TRIFBFactorPackStorage loadFactorLevelsWithDir:bufferSize:](self, "loadFactorLevelsWithDir:bufferSize:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)loadFactorLevelsWithDir:(id)a3 bufferSize:(unint64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v15 = 0;
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "triVerifiedMappedDataWithFile:error:", v7, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v5;
      v18 = 2114;
      v19 = v15;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Failed to load factor levels from factor pack directory at %{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  if (a4)
    *a4 = objc_msgSend(v8, "length");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A68]), "initVerifiedRootObjectFromData:", v9);
  if (!v10)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v7;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Failed to verify content of factor levels: %{public}@", buf, 0xCu);
    }

    v11 = 0;
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v11 = v10;
  v12 = v11;
LABEL_12:

  objc_autoreleasePoolPop(v6);
  return v12;
}

- (BOOL)updateSavedFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4 populatingAssetsForFactorNames:(id)a5 aliasToUnaliasMap:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
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
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1D8232A5C]();
  if (objc_msgSend(v12, "count"))
  {
    -[TRIFBFactorPackStorage pathForFactorLevelsWithFactorPackId:namespaceName:](self, "pathForFactorLevelsWithFactorPackId:namespaceName:", v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIFBFactorPackStorage legacyPathForFactorLevelsWithFactorPackId:namespaceName:](self, "legacyPathForFactorLevelsWithFactorPackId:namespaceName:", v10, v11);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
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
        -[TRIFBFactorPackStorage _linkAssetsForFactorNames:aliasToUnaliasMap:copyingModifiedFactorLevelsWithPath:tempDirRef:](self, "_linkAssetsForFactorNames:aliasToUnaliasMap:copyingModifiedFactorLevelsWithPath:tempDirRef:", v12, v13, v15, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIFBFactorPackStorage _linkAssetsForFactorNames:aliasToUnaliasMap:copyingModifiedFactorLevelsWithPath:tempDirRef:](self, "_linkAssetsForFactorNames:aliasToUnaliasMap:copyingModifiedFactorLevelsWithPath:tempDirRef:", v12, v13, v17, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        if (v21 && v22)
        {
          v32 = v22;
          v33 = v21;
          v24 = (void *)MEMORY[0x1E0CB3620];
          objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v24;
          v21 = v33;
          if ((objc_msgSend(v26, "triRenameOrFaultWithSourcePath:destPath:", v33, v25) & 1) != 0)
          {
            v31 = (void *)MEMORY[0x1E0CB3620];
            objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
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

        goto LABEL_24;
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
        _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "updateSavedFactorLevelsWithFactorPackId failed because preexisting factor pack %{public}@ is not present on disk.", buf, 0xCu);
      }
    }
    v23 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v23 = 1;
LABEL_25:
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
    -[TRIFBFactorPackStorage _linkAssetsForFactorNames:aliasToUnaliasMap:copyingModifiedFactorLevelsWithPath:tempDirRef:](self, "_linkAssetsForFactorNames:aliasToUnaliasMap:copyingModifiedFactorLevelsWithPath:tempDirRef:", v7, MEMORY[0x1E0C9AA70], v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB3620];
      objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
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
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  void *v48;
  BOOL v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  NSObject *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
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
      v62 = v13;
      _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor with missing or empty name.", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if ((objc_msgSend(v12, "hasLevel") & 1) == 0)
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "factor");
      v33 = objc_claimAutoreleasedReturnValue();
      -[NSObject name](v33, "name");
      v34 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v62 = v13;
      v63 = 2114;
      v64 = v34;
      _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor %{public}@ with missing level.", buf, 0x16u);
LABEL_29:

      goto LABEL_37;
    }
LABEL_13:
    LOBYTE(v30) = 0;
    goto LABEL_14;
  }
  objc_msgSend(v12, "level");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fileOrDirectoryLevelWithIsDir:", 0);
  v21 = objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(v12, "level");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "levelOneOfCase");

    if (v36 != 104)
    {
LABEL_42:
      v21 = 0;
      goto LABEL_43;
    }
    objc_msgSend(v12, "factor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "namespaceString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v12, "level");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "mobileAssetReferenceValue");
      v40 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject hasAssetType](v40, "hasAssetType")
        && -[NSObject hasAssetSpecifier](v40, "hasAssetSpecifier")
        && (-[NSObject hasAssetVersion](v40, "hasAssetVersion") & 1) != 0)
      {
        v53 = objc_alloc(MEMORY[0x1E0DC0AB0]);
        -[NSObject assetType](v40, "assetType");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject assetSpecifier](v40, "assetSpecifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject assetVersion](v40, "assetVersion");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "initWithType:specifier:version:", v58, v41, v42);

        objc_msgSend(v12, "factor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "name");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSObject hasIsFileFactor](v40, "hasIsFileFactor"))
          v44 = -[NSObject isFileFactor](v40, "isFileFactor");
        else
          v44 = 0;
        v48 = (void *)v54;
        v49 = -[TRIFBFactorPackStorage _referenceMAAssetWithId:assetStore:forFactorName:isFileFactor:currentFactorPackPath:futureFactorPackPath:](self, "_referenceMAAssetWithId:assetStore:forFactorName:isFileFactor:currentFactorPackPath:futureFactorPackPath:", v54, v14, v43, v44, v15, v16, v54);

        if (v49)
        {

          goto LABEL_42;
        }
        goto LABEL_34;
      }
      TRILogCategory_Server();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "name");
        v50 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v13;
        v63 = 2114;
        v64 = v50;
        _os_log_error_impl(&dword_1D207F000, v47, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor %{public}@ with incomplete MobileAssetReference.", buf, 0x16u);

      }
    }
    else
    {
      TRILogCategory_Server();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      objc_msgSend(v17, "name");
      v47 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v62 = v13;
      v63 = 2114;
      v64 = v47;
      _os_log_error_impl(&dword_1D207F000, v40, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has factor %{public}@ with missing namespaceString.", buf, 0x16u);
    }

LABEL_34:
    v21 = 0;
    goto LABEL_13;
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
      objc_msgSend(v12, "factor");
      v34 = objc_claimAutoreleasedReturnValue();
      -[NSObject name](v34, "name");
      v45 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v62 = v13;
      v63 = 2114;
      v64 = v45;
      v46 = "Factor pack %{public}@ has factor %{public}@ with missing namespaceString.";
      goto LABEL_28;
    }
LABEL_37:

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
      objc_msgSend(v12, "factor");
      v34 = objc_claimAutoreleasedReturnValue();
      -[NSObject name](v34, "name");
      v45 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v62 = v13;
      v63 = 2114;
      v64 = v45;
      v46 = "Factor pack %{public}@ has factor %{public}@ with missing assetId.";
LABEL_28:
      _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, v46, buf, 0x16u);

      goto LABEL_29;
    }
    goto LABEL_37;
  }
  -[NSObject asset](v21, "asset");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "assetId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  TRIValidateAssetId();
  v27 = objc_claimAutoreleasedReturnValue();

  v57 = (void *)v27;
  if (!v27)
  {
    TRILogCategory_Server();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      -[NSObject asset](v21, "asset");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "assetId");
      v51 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "factor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "name");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v62 = v13;
      v63 = 2114;
      v64 = v51;
      v65 = 2114;
      v66 = v52;
      _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has unsuitable asset id \"%{public}@\" for factor %{public}@.", buf, 0x20u);

    }
    goto LABEL_37;
  }
  objc_msgSend(v12, "factor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "name");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFBFactorPackStorage _linkAssetWithId:assetStore:forFactorName:currentFactorPackPath:futureFactorPackPath:](self, "_linkAssetWithId:assetStore:forFactorName:currentFactorPackPath:futureFactorPackPath:", v57, v14, v29, v15, v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v16, "stringByAppendingPathComponent:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPath:](v21, "setPath:", v31);

LABEL_43:
    LOBYTE(v30) = 1;
    goto LABEL_14;
  }

LABEL_14:
  return (char)v30;
}

- (id)_linkAssetsForFactorNames:(id)a3 aliasToUnaliasMap:(id)a4 copyingModifiedFactorLevelsWithPath:(id)a5 tempDirRef:(id)a6
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
  TRIAssetStore *v19;
  TRIPaths *paths;
  TRIAssetExtracting *extractor;
  TRIRemoteAssetPatcher *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v41;
  id v43;
  TRIAssetStore *v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  TRIFBFactorPackStorage *v51;
  TRIAssetStore *v52;
  id v53;
  id v54;
  NSObject *v55;
  __int128 *p_buf;
  id v57;
  uint64_t v58;
  uint8_t v59[4];
  id v60;
  __int128 buf;
  uint64_t v62;
  char v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v58 = 0;
  -[TRIFBFactorPackStorage loadFactorLevelsWithDir:bufferSize:](self, "loadFactorLevelsWithDir:bufferSize:", v11, &v58);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("fl-update-%@.fb"), v17);
    objc_msgSend(v14, "stringByAppendingPathComponent:", v18);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = [TRIAssetStore alloc];
    paths = self->_paths;
    extractor = self->_extractor;
    v22 = -[TRIRemoteAssetPatcher initWithMonitoredActivity:]([TRIRemoteAssetPatcher alloc], "initWithMonitoredActivity:", 0);
    v44 = -[TRIAssetStore initWithPaths:extractor:patcher:](v19, "initWithPaths:extractor:patcher:", paths, extractor, v22);

    v23 = objc_alloc(MEMORY[0x1E0CFCED8]);
    v24 = *MEMORY[0x1E0CB2AE0];
    v57 = 0;
    v25 = (void *)objc_msgSend(v23, "initWithFileAtPath:protection:capacity:error:", v45, v24, (unint64_t)(3 * v58) >> 1, &v57);
    v43 = v57;
    if (v25)
    {
      v26 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v13, "levels");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithCapacity:", objc_msgSend(v27, "count"));

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v62 = 0x2020000000;
      v63 = 0;
      objc_msgSend(v13, "levels");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __117__TRIFBFactorPackStorage__linkAssetsForFactorNames_aliasToUnaliasMap_copyingModifiedFactorLevelsWithPath_tempDirRef___block_invoke;
      v48[3] = &unk_1E9331218;
      v49 = v10;
      p_buf = &buf;
      v50 = v46;
      v51 = self;
      v52 = v44;
      v53 = v11;
      v30 = v25;
      v54 = v30;
      v31 = v28;
      v55 = v31;
      objc_msgSend(v29, "enumerateObjectsUsingBlock:", v48);

      if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      {
        v32 = 0;
      }
      else
      {
        v33 = -[NSObject count](v31, "count");
        objc_msgSend(v13, "levels");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v33) = v33 == objc_msgSend(v34, "count");

        if ((v33 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFactorPackStorage.m"), 1028, CFSTR("dropped factor level during update operation"));

        }
        objc_msgSend(v30, "trifbCreateSortedVectorOfFactorLevelWithOffsets:", v31);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_opt_new();
        objc_msgSend(v36, "replaceLevels:", v35);
        objc_msgSend(v13, "deepCopyUsingBufferBuilder:changes:", v30, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = 0;
        LOBYTE(v35) = objc_msgSend(v30, "trifbFinishBufferWithRootFastFactorLevelsOfs:error:", v37, &v47);
        v38 = v47;
        if ((v35 & 1) != 0)
        {
          v32 = v45;
        }
        else
        {
          TRILogCategory_Server();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v59 = 138543362;
            v60 = v38;
            _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "Failed to write updated factor levels: %{public}@", v59, 0xCu);
          }

          v32 = 0;
        }

      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      TRILogCategory_Server();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v43;
        _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Failed to instantiate buffer builder: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

void __117__TRIFBFactorPackStorage__linkAssetsForFactorNames_aliasToUnaliasMap_copyingModifiedFactorLevelsWithPath_tempDirRef___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v6, "name");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  if (!objc_msgSend(*(id *)(a1 + 40), "containsObject:", v12))
    goto LABEL_19;
  v13 = objc_msgSend(v6, "levelType");
  if (v13 == 6)
  {
    objc_msgSend(v6, "levelAsMaRefVal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_alloc(MEMORY[0x1E0DC0AB0]);
    objc_msgSend(v14, "type");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "specifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "version");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v29, "initWithType:specifier:version:", v30, v31, v32);

    v33 = *(void **)(a1 + 48);
    v34 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v6, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v33) = objc_msgSend(v33, "_referenceMAAssetWithId:assetStore:forFactorName:isFileFactor:currentFactorPackPath:futureFactorPackPath:", v17, v34, v35, objc_msgSend(v14, "hasFileType"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64));

    if ((v33 & 1) == 0)
      goto LABEL_22;

LABEL_18:
    goto LABEL_19;
  }
  if (v13 == 5)
  {
    objc_msgSend(v6, "levelAsTrialAssetVal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(v14, "assetId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateAssetId();
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
        *a4 = 1;
        goto LABEL_23;
      }
      v18 = *(void **)(a1 + 48);
      v19 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v6, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_linkAssetWithId:assetStore:forFactorName:currentFactorPackPath:futureFactorPackPath:", v17, v19, v20, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(*(id *)(a1 + 64), "stringByAppendingPathComponent:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!+[TRIReferenceManagedDir saveFromGarbageCollectionItemWithPath:](TRIReferenceManagedDir, "saveFromGarbageCollectionItemWithPath:", v22))
        {
          TRILogCategory_Server();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v36 = 138543362;
            v37 = v22;
            _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "Unable to prevent newly linked asset at path %{public}@ from being garbage collected in the future", (uint8_t *)&v36, 0xCu);
          }

        }
        objc_msgSend(*(id *)(a1 + 72), "createString:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_opt_new();
        objc_msgSend(v25, "replacePath:", v24);
        objc_msgSend(v14, "deepCopyUsingBufferBuilder:changes:", *(_QWORD *)(a1 + 72), v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (void *)objc_opt_new();
        objc_msgSend(v27, "replaceLevelWithTrialAssetVal:", v26);
        objc_msgSend(v6, "deepCopyUsingBufferBuilder:changes:", *(_QWORD *)(a1 + 72), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          goto LABEL_20;
        goto LABEL_19;
      }
LABEL_22:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      *a4 = 1;

LABEL_23:
      goto LABEL_21;
    }
    goto LABEL_18;
  }
LABEL_19:
  objc_msgSend(v6, "deepCopyUsingBufferBuilder:", *(_QWORD *)(a1 + 72));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
  objc_msgSend(*(id *)(a1 + 80), "addObject:", v28);

LABEL_21:
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

- (BOOL)updateSavedFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4 deletingAssetsWithFactorNames:(id)a5 inUseAssetBehavior:(unsigned __int8)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  TRITempDirScopeGuard *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *context;
  _QWORD v50[4];
  id v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  id v59;
  uint64_t v60;

  v6 = a6;
  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  context = (void *)MEMORY[0x1D8232A5C]();
  -[TRIFBFactorPackStorage pathForFactorLevelsWithFactorPackId:namespaceName:](self, "pathForFactorLevelsWithFactorPackId:namespaceName:", v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFBFactorPackStorage legacyPathForFactorLevelsWithFactorPackId:namespaceName:](self, "legacyPathForFactorLevelsWithFactorPackId:namespaceName:", v10, v11);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13 && v14)
  {
    v48 = (void *)v14;
    v16 = [TRITempDirScopeGuard alloc];
    -[TRIPaths localTempDir](self->_paths, "localTempDir");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TRITempDirScopeGuard initWithPath:](v16, "initWithPath:", v17);

    if (v18)
    {
      v19 = objc_opt_new();
      v47 = (void *)objc_opt_new();
      -[TRIFBFactorPackStorage _removeAssetsWithFactorNames:copyingModifiedFactorLevelsWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:](self, "_removeAssetsWithFactorNames:copyingModifiedFactorLevelsWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:", v12, v13, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v15 = v48;
      v45 = (void *)v19;
      -[TRIFBFactorPackStorage _removeAssetsWithFactorNames:copyingModifiedFactorLevelsWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:](self, "_removeAssetsWithFactorNames:copyingModifiedFactorLevelsWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:", v12, v48, v19, 0, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(self) = 0;
      v46 = (void *)v20;
      if (v20 && v21)
      {
        v43 = v12;
        v44 = v21;
        v22 = (void *)MEMORY[0x1E0CB3620];
        objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "triRenameOrFaultWithSourcePath:destPath:", v20, v23) & 1) != 0)
        {
          self = (TRIFBFactorPackStorage *)MEMORY[0x1E0CB3620];
          objc_msgSend(v48, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(self) = -[TRIFBFactorPackStorage triRenameOrFaultWithSourcePath:destPath:](self, "triRenameOrFaultWithSourcePath:destPath:", v44, v24);

          if ((_DWORD)self)
          {
            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            v25 = v45;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
            if (v26)
            {
              v27 = v26;
              v40 = v10;
              v28 = *(_QWORD *)v54;
              v41 = v25;
              v42 = v11;
              while (2)
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v54 != v28)
                    objc_enumerationMutation(v25);
                  v30 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
                  v52 = 0;
                  if (+[TRIReferenceManagedDir removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:](TRIReferenceManagedDir, "removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:", v30, v6, &v52, v40))
                  {
                    if ((_DWORD)v6 == 3)
                    {
                      objc_msgSend(v47, "objectForKeyedSubscript:", v30);
                      v31 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v31)
                      {
                        objc_msgSend(v47, "objectForKeyedSubscript:", v30);
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        v33 = (void *)objc_opt_new();
                        objc_msgSend(v33, "createAutoAssetWithId:decryptionKey:error:", v32, 0, 0);
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v34, "assetSelector");
                        v35 = v13;
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        v50[0] = MEMORY[0x1E0C809B0];
                        v50[1] = 3221225472;
                        v50[2] = __129__TRIFBFactorPackStorage_updateSavedFactorLevelsWithFactorPackId_namespaceName_deletingAssetsWithFactorNames_inUseAssetBehavior___block_invoke;
                        v50[3] = &unk_1E9331240;
                        v51 = v34;
                        v37 = v34;
                        objc_msgSend(v33, "eliminateAllForSelector:completion:", v36, v50);

                        v13 = v35;
                        v25 = v41;
                        v11 = v42;

                      }
                    }
                  }
                  else if ((_os_feature_enabled_impl() & 1) == 0)
                  {
                    TRILogCategory_Server();
                    v38 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v59 = v25;
                      _os_log_error_impl(&dword_1D207F000, v38, OS_LOG_TYPE_ERROR, "Failed to remove files %{public}@ in managed dir", buf, 0xCu);
                    }

                    LOBYTE(self) = 0;
                    goto LABEL_30;
                  }
                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
                if (v27)
                  continue;
                break;
              }
              LOBYTE(self) = 1;
LABEL_30:
              v10 = v40;
            }
            else
            {
              LOBYTE(self) = 1;
            }
            v12 = v43;

          }
        }
        else
        {

          LOBYTE(self) = 0;
        }
        v15 = v48;
        v21 = v44;
      }

    }
    else
    {
      LOBYTE(self) = 0;
      v15 = v48;
    }
  }
  else
  {
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v59 = v10;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "updateSavedFactorLevelsWithFactorPackId failed because preexisting factor pack %{public}@ is not present on disk.", buf, 0xCu);
    }
    LOBYTE(self) = 0;
  }

  objc_autoreleasePoolPop(context);
  return (char)self;
}

void __129__TRIFBFactorPackStorage_updateSavedFactorLevelsWithFactorPackId_namespaceName_deletingAssetsWithFactorNames_inUseAssetBehavior___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    -[TRIFBFactorPackStorage _removeAssetsWithFactorNames:copyingModifiedFactorLevelsWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:](self, "_removeAssetsWithFactorNames:copyingModifiedFactorLevelsWithPath:appendingToPathsToRemove:appendingToMARefsToRemove:tempDirRef:", v7, v6, v13, 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3620];
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
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

- (id)_removeAssetsWithFactorNames:(id)a3 copyingModifiedFactorLevelsWithPath:(id)a4 appendingToPathsToRemove:(id)a5 appendingToMARefsToRemove:(id)a6 tempDirRef:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v47;
  SEL v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  TRIFBFactorPackStorage *v60;
  id v61;
  id v62;
  NSObject *v63;
  id v64;
  uint64_t v65;
  uint8_t buf[4];
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v65 = 0;
  -[TRIFBFactorPackStorage loadFactorLevelsWithDir:bufferSize:](self, "loadFactorLevelsWithDir:bufferSize:", v14, &v65);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v48 = a2;
    v54 = v16;
    v51 = v17;
    objc_msgSend(v17, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0CB3940]);
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("fl-update-%@.fb"), v22);
    objc_msgSend(v19, "stringByAppendingPathComponent:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc(MEMORY[0x1E0CFCED8]);
    v26 = *MEMORY[0x1E0CB2AE0];
    v64 = 0;
    v53 = (void *)v24;
    v27 = (void *)objc_msgSend(v25, "initWithFileAtPath:protection:capacity:error:", v24, v26, (unint64_t)(3 * v65) >> 1, &v64);
    v28 = v64;
    v52 = v28;
    if (v27)
    {
      v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v18, "levels");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v29, "initWithCapacity:", objc_msgSend(v30, "count"));

      objc_msgSend(v18, "levels");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __153__TRIFBFactorPackStorage__removeAssetsWithFactorNames_copyingModifiedFactorLevelsWithPath_appendingToPathsToRemove_appendingToMARefsToRemove_tempDirRef___block_invoke;
      v56[3] = &unk_1E9331268;
      v50 = v13;
      v57 = v13;
      v49 = v15;
      v58 = v15;
      v33 = v27;
      v59 = v33;
      v60 = self;
      v61 = v14;
      v62 = v54;
      v34 = v31;
      v63 = v34;
      objc_msgSend(v32, "enumerateObjectsUsingBlock:", v56);

      v35 = -[NSObject count](v34, "count");
      objc_msgSend(v18, "levels");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "count");

      if (v35 != v37)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", v48, self, CFSTR("TRIFBFactorPackStorage.m"), 1340, CFSTR("dropped factor level during update operation"));

      }
      objc_msgSend(v33, "trifbCreateSortedVectorOfFactorLevelWithOffsets:", v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_opt_new();
      objc_msgSend(v39, "replaceLevels:", v38);
      objc_msgSend(v18, "deepCopyUsingBufferBuilder:changes:", v33, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = 0;
      v41 = objc_msgSend(v33, "trifbFinishBufferWithRootFastFactorLevelsOfs:error:", v40, &v55);
      v42 = v55;
      v17 = v51;
      if ((v41 & 1) != 0)
      {
        v43 = v53;
        v15 = v49;
        v13 = v50;
      }
      else
      {
        TRILogCategory_Server();
        v45 = objc_claimAutoreleasedReturnValue();
        v15 = v49;
        v13 = v50;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v67 = v42;
          _os_log_error_impl(&dword_1D207F000, v45, OS_LOG_TYPE_ERROR, "Failed to write updated factor levels: %{public}@", buf, 0xCu);
        }

        v43 = 0;
      }

      v16 = v54;
    }
    else
    {
      v44 = v28;
      TRILogCategory_Server();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v67 = v44;
        _os_log_error_impl(&dword_1D207F000, v34, OS_LOG_TYPE_ERROR, "Failed to instantiate buffer builder: %{public}@", buf, 0xCu);
      }
      v43 = 0;
      v16 = v54;
      v17 = v51;
    }

  }
  else
  {
    v43 = 0;
  }

  return v43;
}

void __153__TRIFBFactorPackStorage__removeAssetsWithFactorNames_copyingModifiedFactorLevelsWithPath_appendingToPathsToRemove_appendingToMARefsToRemove_tempDirRef___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if (!(_DWORD)v4)
    goto LABEL_20;
  v6 = objc_msgSend(v3, "levelType");
  if (v6 == 6)
  {
    objc_msgSend(v3, "levelAsMaRefVal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isOnDemand"))
    {
      v15 = *(void **)(a1 + 32);
      objc_msgSend(v3, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = objc_msgSend(v15, "containsObject:", v16);

      if ((_DWORD)v15)
      {
        v17 = (void *)objc_opt_class();
        objc_msgSend(v3, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "relPathForMAReferenceWithFactorName:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 64), "stringByAppendingPathComponent:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "fileExistsAtPath:", v20);

        if (v22)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);
          v23 = objc_alloc(MEMORY[0x1E0DC0AB0]);
          objc_msgSend(v7, "type");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "specifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "version");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(v23, "initWithType:specifier:version:", v24, v25, v26);

          v28 = *(void **)(a1 + 72);
          if (v28)
            objc_msgSend(v28, "setObject:forKey:", v27, v20);
          v29 = (void *)objc_opt_new();
          v33 = 0;
          v30 = objc_msgSend(v29, "writeToFile:options:error:", v20, 0x10000000, &v33);
          v31 = v33;

          if ((v30 & 1) == 0)
          {
            TRILogCategory_Server();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v35 = v20;
              _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "Unable to nil out MARef by creating a blank file at %{public}@", buf, 0xCu);
            }

          }
        }

      }
    }
    goto LABEL_19;
  }
  if (v6 != 5)
  {
LABEL_20:
    objc_msgSend(v3, "deepCopyUsingBufferBuilder:", *(_QWORD *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  objc_msgSend(v3, "levelAsTrialAssetVal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isOnDemand")
    || (objc_msgSend(v7, "path"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
LABEL_19:

    goto LABEL_20;
  }
  v9 = *(void **)(a1 + 40);
  objc_msgSend(v7, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "omitPath");
  objc_msgSend(v7, "deepCopyUsingBufferBuilder:changes:", *(_QWORD *)(a1 + 48), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "replaceLevelWithTrialAssetVal:", v12);
  objc_msgSend(v3, "deepCopyUsingBufferBuilder:changes:", *(_QWORD *)(a1 + 48), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_20;
LABEL_21:
  objc_msgSend(*(id *)(a1 + 80), "addObject:", v14);

}

- (id)pathForFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4
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
  -[TRIFBFactorPackStorage _pathForFactorLevelsWithFactorPackId:namespaceName:](self, "_pathForFactorLevelsWithFactorPackId:namespaceName:", a3, a4);
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

- (id)_pathForFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[TRIFBFactorPackStorage _parentDirForFactorLevelsWithNamespaceName:](self, "_parentDirForFactorLevelsWithNamespaceName:", v7);
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

- (id)_parentDirForFactorLevelsWithNamespaceName:(id)a3
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
      v12 = "-[TRIFBFactorPackStorage _parentDirForFactorLevelsWithNamespaceName:]";
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "%s has empty path arg: namespaceName", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (id)legacyPathForFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[TRIFBFactorPackStorage _legacyPathForFactorLevelsWithFactorPackId:namespaceName:](self, "_legacyPathForFactorLevelsWithFactorPackId:namespaceName:", a3, a4);
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

- (id)_legacyPathForFactorLevelsWithFactorPackId:(id)a3 namespaceName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[TRIFBFactorPackStorage _legacyParentDirForFactorLevelsWithNamespaceName:](self, "_legacyParentDirForFactorLevelsWithNamespaceName:", v7);
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

- (id)_legacyParentDirForFactorLevelsWithNamespaceName:(id)a3
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
      v15 = "-[TRIFBFactorPackStorage _legacyParentDirForFactorLevelsWithNamespaceName:]";
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

- (BOOL)removeUnreferencedFactorLevelsWithRemovedCount:(unsigned int *)a3
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
              v8 &= -[TRIFBFactorPackStorage _removeUnreferencedFactorPackSetsWithNamespaceName:removedCount:](self, "_removeUnreferencedFactorPackSetsWithNamespaceName:removedCount:", v16, &v21);
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
          v8 &= -[TRIFBFactorPackStorage _removeUnreferencedFactorPackSetsWithNamespaceName:removedCount:](self, "_removeUnreferencedFactorPackSetsWithNamespaceName:removedCount:", v14, &v21);
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
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFactorPackStorage.m"), 1475, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("removedCount"));

  }
  if (objc_msgSend(v7, "length"))
  {
    -[TRIFBFactorPackStorage _parentDirForFactorLevelsWithNamespaceName:](self, "_parentDirForFactorLevelsWithNamespaceName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    -[TRIFBFactorPackStorage _legacyParentDirForFactorLevelsWithNamespaceName:](self, "_legacyParentDirForFactorLevelsWithNamespaceName:", v7);
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
            v15 &= -[TRIFBFactorPackStorage _removeUnreferencedFactorPackSetsWithParentDir:removedCount:](self, "_removeUnreferencedFactorPackSetsWithParentDir:removedCount:", v17, a4);
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
      v30 = "-[TRIFBFactorPackStorage _removeUnreferencedFactorPackSetsWithNamespaceName:removedCount:]";
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
      v13[2] = __86__TRIFBFactorPackStorage__removeUnreferencedFactorPackSetsWithParentDir_removedCount___block_invoke;
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

void __86__TRIFBFactorPackStorage__removeUnreferencedFactorPackSetsWithParentDir_removedCount___block_invoke(uint64_t a1, void *a2)
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

- (void)reportFactorPackDiskUsagesUsingContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  -[TRIPaths treatmentsDir](self->_paths, "treatmentsDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, 0, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v10 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v8, "nextObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v13 = (void *)v11;
    *(_QWORD *)&v12 = 138543362;
    v20 = v12;
    while (1)
    {
      objc_msgSend(v13, "lastPathComponent", v20);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        break;
LABEL_16:

      objc_autoreleasePoolPop(v10);
      v10 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v8, "nextObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_21;
    }
    v15 = (void *)v14;
    v22 = -1;
    if (objc_msgSend(MEMORY[0x1E0DC0AD0], "convertFromString:usingBase:toI64:", v14, 10, &v22))
    {
      if ((unint64_t)(v22 - 1) > 0x7FFFFFFE)
      {
        TRILogCategory_Server();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v24 = v22;
          _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, "Skipping reporting disk usage of factor packs for unrecognized id-based namespace: %lld", buf, 0xCu);
        }
        goto LABEL_14;
      }
      TRINamespace_NamespaceId_EnumDescriptor();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textFormatNameForValue:", v22);
      v17 = objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        TRILogCategory_Server();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v24 = v22;
          _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, "Skipping reporting disk usage of factor packs for unrecognized id-based namespace: %lld", buf, 0xCu);
        }
        goto LABEL_14;
      }

      v15 = (void *)v17;
    }
    if (!objc_msgSend(v9, "containsObject:", v15))
    {
      objc_msgSend(v13, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIFBFactorPackStorage _reportFactorPackDiskUsagesWithNamespaceName:namespaceDirName:context:](self, "_reportFactorPackDiskUsagesWithNamespaceName:namespaceDirName:context:", v15, v19, v21);

      objc_msgSend(v9, "addObject:", v15);
LABEL_15:

      goto LABEL_16;
    }
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v20;
      v24 = (uint64_t)v15;
      _os_log_debug_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEBUG, "Skipping reporting disk usage of factor packs for already visited namespace: %{public}@", buf, 0xCu);
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_21:
  objc_autoreleasePoolPop(v10);

}

- (void)_reportFactorPackDiskUsagesWithNamespaceName:(id)a3 namespaceDirName:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TRIFBFactorPackStorage _parentDirForFactorLevelsWithNamespaceName:](self, "_parentDirForFactorLevelsWithNamespaceName:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(MEMORY[0x1E0DC0A98], "arrayFromDirectory:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __96__TRIFBFactorPackStorage__reportFactorPackDiskUsagesWithNamespaceName_namespaceDirName_context___block_invoke;
      v15[3] = &unk_1E93312B8;
      v16 = v8;
      v17 = v10;
      if ((objc_msgSend(v13, "enumerateStringsWithBlock:", v15) & 1) == 0)
      {
        TRILogCategory_Server();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v19 = v13;
          _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failed to enumerate %{public}@ to report factor pack disk usage", buf, 0xCu);
        }

      }
    }

    objc_autoreleasePoolPop(v12);
  }

}

void __96__TRIFBFactorPackStorage__reportFactorPackDiskUsagesWithNamespaceName_namespaceDirName_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TRIValidateFactorPackId();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "triDiskUsageForDirectory:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("triald_disk_usage"), -[NSObject compressedSum](v6, "compressedSum"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_opt_new();
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v9, "ensureFactorFields");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNamespaceName:", v10);

      objc_msgSend(v9, "ensureFactorFields");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setClientFactorPackId:", v5);

      objc_msgSend(*(id *)(a1 + 40), "client");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "client");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "trackingId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v16, v17, 0, v9);

    }
    else
    {
      TRILogCategory_Server();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v3;
        _os_log_debug_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEBUG, "Skipping reporting disk usage for dir %{public}@ as it couldn't be determined", buf, 0xCu);
      }
    }

  }
  else
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v3;
      _os_log_debug_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEBUG, "Skipping reporting disk usage for dir %{public}@ whose last path component isn't a valid factor pack id", buf, 0xCu);
    }
  }

}

- (BOOL)removeUnreferencedGlobalFactorPacksWithRemovedCount:(unsigned int *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v24;
  void *v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  uint8_t *v29;
  uint8_t v30[8];
  uint8_t *v31;
  uint64_t v32;
  int v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[TRIFBFactorPackStorage _globalFactorPackProviderPlist](self, "_globalFactorPackProviderPlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("namespaceFactorPackMap"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v30 = 0;
    v31 = v30;
    v32 = 0x2020000000;
    v33 = 0;
    -[TRIPaths treatmentsDirUsingGlobal:](self->_paths, "treatmentsDirUsingGlobal:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, 0, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 1;
    do
    {
      v10 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v8, "nextObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)MEMORY[0x1D8232A5C]();
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/factorPacks"), v13);
          objc_msgSend(v5, "stringByAppendingPathComponent:", v15);
          v16 = objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v14);
          objc_msgSend(MEMORY[0x1E0DC0A98], "arrayFromDirectory:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = __78__TRIFBFactorPackStorage_removeUnreferencedGlobalFactorPacksWithRemovedCount___block_invoke;
            v26[3] = &unk_1E93312E0;
            v27 = v25;
            v28 = v13;
            v29 = v30;
            v18 = objc_msgSend(v17, "enumerateStringsWithBlock:", v26);

            v19 = 0;
            v9 &= v18;
            v20 = v27;
          }
          else
          {
            TRILogCategory_Server();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v13;
              _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Couldn't locate global factor packs for namespace name: %@", buf, 0xCu);
            }
            v9 = 0;
            v19 = 3;
          }

        }
        else
        {
          TRILogCategory_Server();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Invalid namespace name found in global treatment directory.", buf, 2u);
          }
          v19 = 3;
        }

      }
      else
      {
        v19 = 2;
      }

      objc_autoreleasePoolPop(v10);
    }
    while (v19 != 2);
    if (a3)
      *a3 = *((_DWORD *)v31 + 6);

    _Block_object_dispose(v30, 8);
  }
  else
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1D207F000, v21, OS_LOG_TYPE_DEFAULT, "Couldn't open global factor pack provider plist. Stopping the removal of unreferenced global factor packs.", v30, 2u);
    }

    v9 = 0;
    if (a3)
      *a3 = 0;
  }

  return v9 & 1;
}

void __78__TRIFBFactorPackStorage_removeUnreferencedGlobalFactorPacksWithRemovedCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v3;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Invalid factor pack Id in global factor pack directory %{public}@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v9 = objc_msgSend(v8, "triForceRemoveItemAtPath:error:", v3, &v13);
    v10 = v13;

    if (v10)
    {
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[NSObject localizedDescription](v10, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v3;
        v16 = 2112;
        v17 = v12;
        _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Failed to remove factor pack at %{public}@ with the following error %@", buf, 0x16u);

      }
    }
    if (v9)
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
LABEL_12:

  }
}

- (id)_globalFactorPackProviderPlist
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[TRIPaths namespaceDescriptorsDirUsingGlobal:](self->_paths, "namespaceDescriptorsDirUsingGlobal:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("v2/globalActiveFactorProviders.plplist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  *__error() = 0;
  v4 = objc_retainAutorelease(v3);
  if (access((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 4))
  {
    if (*__error() == 1)
    {
      TRILogCategory_Server();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Cannot access global factor pack provider plplist.", buf, 2u);
      }
LABEL_8:
      v6 = 0;
      goto LABEL_16;
    }
    if (*__error() == 2)
    {
      TRILogCategory_Server();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Global factor pack provider plplist file not present: %@", buf, 0xCu);
      }
      goto LABEL_8;
    }
  }
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0D815D0], "propertyListWithPath:error:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v5 = v7;
  if (v6)
  {
    v8 = v6;
  }
  else if (v7)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v5;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Error opening global factor pack provider plplist \"%@\": %@", buf, 0x16u);
    }

  }
LABEL_16:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
