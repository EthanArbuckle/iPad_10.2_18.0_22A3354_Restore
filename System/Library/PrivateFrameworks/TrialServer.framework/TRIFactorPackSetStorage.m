@implementation TRIFactorPackSetStorage

- (TRIFactorPackSetStorage)initWithPaths:(id)a3
{
  id v5;
  TRIFactorPackSetStorage *v6;
  TRIFactorPackSetStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFactorPackSetStorage;
  v6 = -[TRIFactorPackSetStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_paths, a3);

  return v7;
}

- (BOOL)saveFactorPackSet:(id)a3
{
  void *v3;
  TRITempDirScopeGuard *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TRIFactorPackStorage *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  char v31;
  void *v32;
  NSObject *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  id v50;
  id v51;
  id v52;
  TRIFBFactorPackStorage *v53;
  uint64_t (**v54)(_QWORD, _QWORD, _QWORD, _QWORD);
  char v55;
  NSObject *v56;
  id v57;
  void *v58;
  id obj;
  void *v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t v78[128];
  uint8_t buf[4];
  NSObject *v80;
  __int16 v81;
  id v82;
  _BYTE v83[128];
  _QWORD v84[3];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  objc_msgSend(v57, "ident");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFactorPackSetStorage pathForFactorPackSetWithId:](self, "pathForFactorPackSetWithId:", v3);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = _os_feature_enabled_impl();
  v4 = [TRITempDirScopeGuard alloc];
  -[TRIPaths localTempDir](self->_paths, "localTempDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TRITempDirScopeGuard initWithPath:](v4, "initWithPath:", v5);

  v56 = v6;
  if (!v6)
    goto LABEL_58;
  -[NSObject path](v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("fp-set-%@"), v10);
  objc_msgSend(v7, "stringByAppendingPathComponent:", v11);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v60, "stringByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v12;
  objc_msgSend(v58, "stringByAppendingPathComponent:", CFSTR("factorPacks"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v13;
  objc_msgSend(v58, "stringByAppendingPathComponent:", CFSTR("legacyNamespaceFactorPacks"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 3);
  v15 = (TRIFactorPackStorage *)objc_claimAutoreleasedReturnValue();

  v16 = -[TRIFactorPackStorage countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v75 != v17)
          objc_enumerationMutation(v15);
        if (!objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i)))
        {
          LOBYTE(v6) = 0;
          goto LABEL_57;
        }
      }
      v16 = -[TRIFactorPackStorage countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
    }
    while (v16);
  }

  v15 = -[TRIFactorPackStorage initWithPaths:]([TRIFactorPackStorage alloc], "initWithPaths:", self->_paths);
  v53 = -[TRIFBFactorPackStorage initWithPaths:]([TRIFBFactorPackStorage alloc], "initWithPaths:", self->_paths);
  v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v57, "packs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));

  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __45__TRIFactorPackSetStorage_saveFactorPackSet___block_invoke;
  v70[3] = &unk_1E9333CB8;
  v51 = v21;
  v71 = v51;
  v52 = v58;
  v72 = v52;
  v50 = v60;
  v73 = v50;
  v54 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v70);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v57, "packs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
  if (!v23)
    goto LABEL_41;
  v24 = *(_QWORD *)v67;
  obj = v22;
  do
  {
    v25 = 0;
    do
    {
      if (*(_QWORD *)v67 != v24)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v25);
      v27 = (void *)MEMORY[0x1D8232A5C]();
      if ((objc_msgSend(v26, "hasFactorPackId") & 1) == 0)
      {
        TRILogCategory_Server();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v57, "ident");
          v38 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v80 = v38;
          _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Factor pack set %{public}@ contains factor pack with missing id.", buf, 0xCu);

        }
LABEL_22:
        v34 = 1;
        goto LABEL_32;
      }
      objc_msgSend(v26, "factorPackId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateFactorPackId();
      v29 = objc_claimAutoreleasedReturnValue();

      if (!v29)
        goto LABEL_22;
      objc_msgSend(v26, "selectedNamespace");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "hasName");

      if ((v31 & 1) != 0)
      {
        objc_msgSend(v26, "selectedNamespace");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "name");
        v33 = objc_claimAutoreleasedReturnValue();

        if ((v55 & 1) != 0)
          -[TRIFBFactorPackStorage pathForFactorLevelsWithFactorPackId:namespaceName:](v53, "pathForFactorLevelsWithFactorPackId:namespaceName:", v29, v33);
        else
          -[TRIFactorPackStorage pathForFactorPackWithId:namespaceName:](v15, "pathForFactorPackWithId:namespaceName:", v29, v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), CFSTR("factorPacks"), v33);
          v37 = ((uint64_t (**)(_QWORD, NSObject *, void *, void *))v54)[2](v54, v33, v36, v35);

          if (v37)
          {
            if ((v55 & 1) != 0)
              -[TRIFBFactorPackStorage legacyPathForFactorLevelsWithFactorPackId:namespaceName:](v53, "legacyPathForFactorLevelsWithFactorPackId:namespaceName:", v29, v33);
            else
              -[TRIFactorPackStorage legacyPathForFactorPackWithId:namespaceName:](v15, "legacyPathForFactorPackWithId:namespaceName:", v29, v33);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v39)
            {
              v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), CFSTR("legacyNamespaceFactorPacks"), v33);
              v41 = ((uint64_t (**)(_QWORD, NSObject *, void *, void *))v54)[2](v54, v33, v40, v39);

              v34 = v41 ^ 1;
            }
            else
            {
              v34 = 1;
            }

            goto LABEL_31;
          }
        }
      }
      else
      {
        TRILogCategory_Server();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v80 = v29;
          _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ contains no namespace name.", buf, 0xCu);
        }
      }
      v34 = 1;
LABEL_31:

LABEL_32:
      objc_autoreleasePoolPop(v27);
      if (v34)
      {

        goto LABEL_48;
      }
      ++v25;
    }
    while (v23 != v25);
    v22 = obj;
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
    v23 = v42;
  }
  while (v42);
LABEL_41:

  if (+[TRIReferenceManagedDir createFromDir:](TRIReferenceManagedDir, "createFromDir:", v52)
    && -[TRIFactorPackSetStorage _nonAtomicOverwriteWithSrc:dest:](self, "_nonAtomicOverwriteWithSrc:dest:", v52, v50))
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v57, "ident");
      v43 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v80 = v43;
      v81 = 2114;
      v82 = v50;
      _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "Wrote factor pack set %{public}@ --> %{public}@", buf, 0x16u);

    }
    LOBYTE(v6) = 1;
  }
  else
  {
LABEL_48:
    LOBYTE(v6) = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "triForceRemoveItemAtPath:error:", v52, 0);

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v45 = v51;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v63 != v47)
          objc_enumerationMutation(v45);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "unlock");
      }
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
    }
    while (v46);
  }

LABEL_57:
LABEL_58:

  return (char)v6;
}

BOOL __45__TRIFactorPackSetStorage_saveFactorPackSet___block_invoke(id *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B50]), "initWithDir:", v7);
  if (v8)
  {
    objc_msgSend(a1[4], "addObject:", v8);
    objc_msgSend(a1[5], "stringByAppendingPathComponent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "stringByAppendingPathComponent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v11);

    v12 = +[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:](TRIReferenceManagedDir, "symlinkFromCurrentPath:withFuturePath:toManagedPath:", v9, v10, v7);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_nonAtomicOverwriteWithSrc:(id)a3 dest:(id)a4
{
  id v6;
  id v7;
  id v8;
  const std::__fs::filesystem::path *v9;
  id v10;
  const std::__fs::filesystem::path *v11;
  std::error_code *v12;
  int v13;
  TRITempDirScopeGuard *v14;
  void *v15;
  TRITempDirScopeGuard *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const std::__fs::filesystem::path *v22;
  id v23;
  const std::__fs::filesystem::path *v24;
  std::error_code *v25;
  int v26;
  NSObject *v27;
  int *v28;
  char *v29;
  int v30;
  const char *v31;
  BOOL v32;
  id v33;
  const std::__fs::filesystem::path *v34;
  id v35;
  const std::__fs::filesystem::path *v36;
  std::error_code *v37;
  int v38;
  const std::__fs::filesystem::path *v39;
  id v40;
  const std::__fs::filesystem::path *v41;
  std::error_code *v42;
  int *v44;
  char *v45;
  int v46;
  int v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  char *v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  v9 = (const std::__fs::filesystem::path *)objc_msgSend(v8, "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v7);
  v11 = (const std::__fs::filesystem::path *)objc_msgSend(v10, "fileSystemRepresentation");
  rename(v9, v11, v12);
  if (v13)
  {
    v14 = [TRITempDirScopeGuard alloc];
    -[TRIPaths localTempDir](self->_paths, "localTempDir");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TRITempDirScopeGuard initWithPath:](v14, "initWithPath:", v15);

    if (!v16)
    {
      v32 = 0;
LABEL_12:

      goto LABEL_13;
    }
    -[TRITempDirScopeGuard path](v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_retainAutorelease(v10);
    v22 = (const std::__fs::filesystem::path *)objc_msgSend(v21, "fileSystemRepresentation");
    v23 = objc_retainAutorelease(v20);
    v24 = (const std::__fs::filesystem::path *)objc_msgSend(v23, "fileSystemRepresentation");
    rename(v22, v24, v25);
    if (v26)
    {
      TRILogCategory_Server();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = __error();
        v29 = strerror(*v28);
        v30 = *__error();
        v47 = 138544130;
        v48 = v21;
        v49 = 2114;
        v50 = v23;
        v51 = 2080;
        v52 = v29;
        v53 = 1024;
        v54 = v30;
        v31 = "Failed rename() to relocate before overwrite %{public}@ -> %{public}@: %s (%d)";
LABEL_16:
        _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&v47, 0x26u);
      }
    }
    else
    {
      v33 = objc_retainAutorelease(v8);
      v34 = (const std::__fs::filesystem::path *)objc_msgSend(v33, "fileSystemRepresentation");
      v35 = objc_retainAutorelease(v21);
      v36 = (const std::__fs::filesystem::path *)objc_msgSend(v35, "fileSystemRepresentation");
      rename(v34, v36, v37);
      if (!v38)
      {
        -[TRIFactorPackSetStorage _forceRemoveItemAtPath:](self, "_forceRemoveItemAtPath:", v23);
        v32 = 1;
        goto LABEL_11;
      }
      v39 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v23), "fileSystemRepresentation");
      v40 = objc_retainAutorelease(v35);
      v41 = (const std::__fs::filesystem::path *)objc_msgSend(v40, "fileSystemRepresentation");
      rename(v39, v41, v42);
      TRILogCategory_Server();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v44 = __error();
        v45 = strerror(*v44);
        v46 = *__error();
        v47 = 138544130;
        v48 = v33;
        v49 = 2114;
        v50 = v40;
        v51 = 2080;
        v52 = v45;
        v53 = 1024;
        v54 = v46;
        v31 = "Failed to rename() even after relocating destination: %{public}@ --> %{public}@: %s (%d)";
        goto LABEL_16;
      }
    }

    v32 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v32 = 1;
LABEL_13:

  return v32;
}

- (BOOL)_forceRemoveItemAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "triForceRemoveItemAtPath:error:", v4, &v10);

  v7 = v10;
  if ((v6 & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Failed to force-remove: %{public}@", buf, 0xCu);
    }

  }
  return v6;
}

- (id)parentDirForFactorPackSets
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("v2/factorPackSets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)pathForFactorPackSetWithId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIFactorPackSetStorage parentDirForFactorPackSets](self, "parentDirForFactorPackSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (BOOL)hasFactorPackSetWithId:(id)a3 path:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorPackSetStorage.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

  }
  -[TRIFactorPackSetStorage pathForFactorPackSetWithId:](self, "pathForFactorPackSetWithId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    objc_storeStrong(a4, v8);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  return v10;
}

- (id)_collectFactorPackSets
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  v4 = (void *)objc_opt_new();
  if (v4)
  {
    -[TRIFactorPackSetStorage parentDirForFactorPackSets](self, "parentDirForFactorPackSets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, 0, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v9, "nextObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      while (1)
      {
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorPackSetStorage.m"), 318, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

        }
        v14 = objc_msgSend(v4, "addString:", v13);

        objc_autoreleasePoolPop(v10);
        if (!v14)
          break;
        v10 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(v9, "nextObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_8;
      }

      objc_autoreleasePoolPop(v6);
      v16 = 0;
    }
    else
    {
LABEL_8:
      objc_autoreleasePoolPop(v10);

      objc_autoreleasePoolPop(v6);
      v16 = v4;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)removeUnreferencedFactorPackSetsWithServerContext:(id)a3 removedCount:(unsigned int *)a4
{
  id v7;
  void *v8;
  TRIFactorPackSetExternalReferenceStore *v9;
  TRITempDirScopeGuard *v10;
  void *v11;
  TRITempDirScopeGuard *v12;
  int v13;
  BOOL v14;
  void *v16;
  _QWORD v17[4];
  TRIFactorPackSetExternalReferenceStore *v18;
  TRITempDirScopeGuard *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorPackSetStorage.m"), 330, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

  }
  -[TRIFactorPackSetStorage _collectFactorPackSets](self, "_collectFactorPackSets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[TRIFactorPackSetExternalReferenceStore initWithServerContext:]([TRIFactorPackSetExternalReferenceStore alloc], "initWithServerContext:", v7);
    v10 = [TRITempDirScopeGuard alloc];
    -[TRIPaths localTempDir](self->_paths, "localTempDir");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TRITempDirScopeGuard initWithPath:](v10, "initWithPath:", v11);

    if (v12)
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v29 = 0;
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 1;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __90__TRIFactorPackSetStorage_removeUnreferencedFactorPackSetsWithServerContext_removedCount___block_invoke;
      v17[3] = &unk_1E932FE58;
      v20 = &v22;
      v18 = v9;
      v19 = v12;
      v21 = &v26;
      v13 = objc_msgSend(v8, "enumerateStringsWithBlock:", v17);
      if (a4)
        *a4 = *((_DWORD *)v27 + 6);
      if (v13)
        v14 = *((_BYTE *)v23 + 24) != 0;
      else
        v14 = 0;

      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v26, 8);
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __90__TRIFactorPackSetStorage_removeUnreferencedFactorPackSetsWithServerContext_removedCount___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  char v10;

  v10 = 0;
  v3 = a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[TRIReferenceManagedDir collectGarbageForManagedDir:withExternalReferenceStore:usingTempDir:managedDirWasDeleted:](TRIReferenceManagedDir, "collectGarbageForManagedDir:withExternalReferenceStore:usingTempDir:managedDirWasDeleted:", v5, v3, v6, &v10);

  v8 = *(_QWORD *)(a1[6] + 8);
  if (*(_BYTE *)(v8 + 24))
    v9 = v7;
  else
    v9 = 0;
  *(_BYTE *)(v8 + 24) = v9;

  if (v10)
    ++*(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
}

- (void)enumerateOnlyProtobufFactorPacksForFactorPackSet:(id)a3 withBlock:(id)a4
{
  void (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TRIFactorPackStorage *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[TRIFactorPackSetStorage pathForFactorPackSetWithId:](self, "pathForFactorPackSetWithId:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@/%@"), v9, CFSTR("factorPacks"));

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, 0, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[TRIFactorPackStorage initWithPaths:]([TRIFactorPackStorage alloc], "initWithPaths:", self->_paths);
  v15 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v13, "nextObject");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    do
    {
      objc_msgSend(v17, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorPackSetStorage.m"), 385, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

      }
      -[TRIFactorPackStorage loadFactorPackWithDir:](v14, "loadFactorPackWithDir:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        v7[2](v7, v19);

      objc_autoreleasePoolPop(v15);
      v15 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v13, "nextObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v17);
  }
  objc_autoreleasePoolPop(v15);

}

- (void)enumerateFactorPacksForFactorPackSet:(id)a3 usingLegacyPaths:(BOOL)a4 withBlock:(id)a5
{
  _BOOL4 v6;
  id v9;
  void (**v10)(id, _QWORD, void *, char *);
  const __CFString *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  TRIFBFactorPackStorage *v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  SEL v34;
  TRIFactorPackSetStorage *v35;
  void *v36;
  void *v37;
  TRIFactorPackStorage *v38;
  char v39;

  v6 = a4;
  v9 = a3;
  v10 = (void (**)(id, _QWORD, void *, char *))a5;
  if (v6)
    v11 = CFSTR("legacyNamespaceFactorPacks");
  else
    v11 = CFSTR("factorPacks");
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[TRIFactorPackSetStorage pathForFactorPackSetWithId:](self, "pathForFactorPackSetWithId:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@/%@"), v13, v11);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v16, 0, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = -[TRIFactorPackStorage initWithPaths:]([TRIFactorPackStorage alloc], "initWithPaths:", self->_paths);
  v35 = self;
  v18 = -[TRIFBFactorPackStorage initWithPaths:]([TRIFBFactorPackStorage alloc], "initWithPaths:", self->_paths);
  v19 = _os_feature_enabled_impl();
  v20 = _os_feature_enabled_impl();
  v39 = 0;
  v21 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v17, "nextObject");
  v22 = objc_claimAutoreleasedReturnValue();
  v37 = v9;
  if (v22)
  {
    v23 = (void *)v22;
    v34 = a2;
    v24 = v19 & v20;
    do
    {
      objc_msgSend(v23, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "fileExistsAtPath:", v26);

      LODWORD(v27) = v28 & v24;
      objc_msgSend(v23, "path");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      if ((_DWORD)v27 == 1)
      {
        if (!v29)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v34, v35, CFSTR("TRIFactorPackSetStorage.m"), 434, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

        }
        -[TRIFBFactorPackStorage loadFactorLevelsWithDir:bufferSize:](v18, "loadFactorLevelsWithDir:bufferSize:", v30, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
          goto LABEL_16;
        v10[2](v10, 0, v31, &v39);
      }
      else
      {
        if (!v29)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v34, v35, CFSTR("TRIFactorPackSetStorage.m"), 442, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

        }
        -[TRIFactorPackStorage loadFactorPackWithDir:](v38, "loadFactorPackWithDir:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
          goto LABEL_16;
        ((void (**)(id, void *, void *, char *))v10)[2](v10, v31, 0, &v39);
      }
      if (v39)
      {

        break;
      }
LABEL_16:

      objc_autoreleasePoolPop(v21);
      v21 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v17, "nextObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v23);
  }
  objc_autoreleasePoolPop(v21);

}

- (void)enumerateCompatibleFactorPacksForFactorPackSet:(id)a3 usingLegacyPaths:(BOOL)a4 withBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__TRIFactorPackSetStorage_enumerateCompatibleFactorPacksForFactorPackSet_usingLegacyPaths_withBlock___block_invoke;
  v12[3] = &unk_1E9333D30;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[TRIFactorPackSetStorage enumerateFactorPacksForFactorPackSet:usingLegacyPaths:withBlock:](self, "enumerateFactorPacksForFactorPackSet:usingLegacyPaths:withBlock:", v11, v6, v12);

}

void __101__TRIFactorPackSetStorage_enumerateCompatibleFactorPacksForFactorPackSet_usingLegacyPaths_withBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _BYTE *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _BYTE *v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1D8232A5C]();
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0DC0AD8];
    objc_msgSend(v8, "namespaceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "namespaceDescriptorsDefaultDir");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadWithNamespaceName:fromDirectory:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v8, "ncvs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __101__TRIFactorPackSetStorage_enumerateCompatibleFactorPacksForFactorPackSet_usingLegacyPaths_withBlock___block_invoke_91;
      v38[3] = &unk_1E9333CE0;
      v39 = v14;
      v41 = *(id *)(a1 + 40);
      v40 = v8;
      v42 = a4;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v38);

      v16 = v39;
LABEL_7:

LABEL_17:
      goto LABEL_18;
    }
    TRILogCategory_Server();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "namespaceName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v27;
      v45 = 2114;
      v46 = v28;
      _os_log_impl(&dword_1D207F000, v26, OS_LOG_TYPE_DEFAULT, "Factor pack set (via Flatbuffers) %{public}@ requires namespace %{public}@ which is not registered in Trial.", buf, 0x16u);
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_msgSend(v7, "selectedNamespace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasName");

  if ((v18 & 1) != 0)
  {
    v19 = (void *)MEMORY[0x1E0DC0AD8];
    objc_msgSend(v7, "selectedNamespace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "namespaceDescriptorsDefaultDir");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "loadWithNamespaceName:fromDirectory:", v21, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v7, "selectedNamespace");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "compatibilityVersionArray");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __101__TRIFactorPackSetStorage_enumerateCompatibleFactorPacksForFactorPackSet_usingLegacyPaths_withBlock___block_invoke_93;
      v33[3] = &unk_1E9333D08;
      v34 = v14;
      v36 = *(id *)(a1 + 40);
      v35 = v7;
      v37 = a4;
      objc_msgSend(v25, "enumerateValuesWithBlock:", v33);

      v16 = v34;
      goto LABEL_7;
    }
    TRILogCategory_Server();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "selectedNamespace");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v30;
      v45 = 2114;
      v46 = v31;
      _os_log_impl(&dword_1D207F000, v26, OS_LOG_TYPE_DEFAULT, "Factor pack set (via protobufs) %{public}@ requires namespace %{public}@ which is not registered in Trial.", buf, 0x16u);

      goto LABEL_15;
    }
LABEL_16:

    *a4 = 1;
    goto LABEL_17;
  }
  TRILogCategory_Server();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v32 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v44 = v32;
    _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Factor pack set (via protobufs) %{public}@, when loaded from disk, had a factor pack with missing namespace. Treating this as an NCV incompatibility.", buf, 0xCu);
  }

  *a4 = 1;
LABEL_18:
  objc_autoreleasePoolPop(v9);

}

void __101__TRIFactorPackSetStorage_enumerateCompatibleFactorPacksForFactorPackSet_usingLegacyPaths_withBlock___block_invoke_91(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  uint64_t v8;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  LODWORD(v6) = objc_msgSend(v6, "downloadNCV");
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == v6)
  {
    *a4 = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __101__TRIFactorPackSetStorage_enumerateCompatibleFactorPacksForFactorPackSet_usingLegacyPaths_withBlock___block_invoke_93(uint64_t a1, int a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "downloadNCV");
  if ((_DWORD)result == a2)
  {
    *a4 = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  return result;
}

- (void)enumerateFBFactorPacksForFactorPackSet:(id)a3 usingLegacyPaths:(BOOL)a4 withBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  const __CFString *v9;
  id v10;
  void *v11;
  uint64_t v12;
  TRIFBFactorPackStorage *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  TRIFactorPackSetStorage *v27;
  void *context;
  void *v30;
  void *v31;
  void (**v32)(id, void *, _BYTE *);
  char v33;

  v6 = a4;
  v8 = a3;
  v32 = (void (**)(id, void *, _BYTE *))a5;
  if (v6)
    v9 = CFSTR("legacyNamespaceFactorPacks");
  else
    v9 = CFSTR("factorPacks");
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v31 = v8;
  -[TRIFactorPackSetStorage pathForFactorPackSetWithId:](self, "pathForFactorPackSetWithId:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "initWithFormat:", CFSTR("%@/%@"), v11, v9);

  context = (void *)MEMORY[0x1D8232A5C]();
  v27 = self;
  v13 = -[TRIFBFactorPackStorage initWithPaths:]([TRIFBFactorPackStorage alloc], "initWithPaths:", self->_paths);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v15, 0, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  while (1)
  {
    v17 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v16, "nextObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
      break;
    v19 = (void *)v18;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "fileExistsAtPath:", v22))
    {
      objc_msgSend(v19, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v27, CFSTR("TRIFactorPackSetStorage.m"), 534, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

      }
      -[TRIFBFactorPackStorage loadFactorLevelsWithDir:bufferSize:](v13, "loadFactorLevelsWithDir:bufferSize:", v23, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 && (v32[2](v32, v24, &v33), v33))
        v25 = 3;
      else
        v25 = 0;

    }
    else
    {
      v25 = 3;
    }

    objc_autoreleasePoolPop(v17);
    if (v25)
      goto LABEL_18;
  }
  objc_autoreleasePoolPop(v17);
LABEL_18:

  objc_autoreleasePoolPop(context);
}

- (BOOL)migrateEligibleFactorPacksToGlobalWithServerContext:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  TRIGloballyAvailableNamespaces *v10;
  void *v11;
  TRIGloballyAvailableNamespaces *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  TRIFactorPackStorage *v16;
  TRIFBFactorPackStorage *v17;
  TRIFactorPackStorage *v18;
  TRIFBFactorPackStorage *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  char v29;
  BOOL v30;
  uint64_t v32;
  void *context;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  TRIFactorPackStorage *v39;
  TRIFBFactorPackStorage *v40;
  __int128 *p_buf;
  id v42;
  id location;
  _QWORD v44[4];
  id v45;
  uint8_t v46[4];
  uint64_t v47;
  __int128 buf;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Considering migrating the local rollout factor packs.", (uint8_t *)&buf, 2u);
  }

  context = (void *)MEMORY[0x1D8232A5C]();
  v5 = (void *)MEMORY[0x1E0DC0AD8];
  -[TRIPaths namespaceDescriptorsDefaultDir](self->_paths, "namespaceDescriptorsDefaultDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptorsForDirectory:filterBlock:", v6, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __79__TRIFactorPackSetStorage_migrateEligibleFactorPacksToGlobalWithServerContext___block_invoke;
  v44[3] = &unk_1E9333D58;
  v8 = v7;
  v45 = v8;
  objc_msgSend(v34, "enumerateObjectsUsingBlock:", v44);
  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "Found the following namespaces that should be available globally: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v10 = [TRIGloballyAvailableNamespaces alloc];
  objc_msgSend(v35, "keyValueStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[TRIGloballyAvailableNamespaces initWithKVStore:](v10, "initWithKVStore:", v11);

  -[TRIGloballyAvailableNamespaces namespaces](v12, "namespaces");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Found the following namespaces that are already available globally: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v8, "minusSet:", v13);
  v15 = objc_msgSend(v8, "count");
  if (v15)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__30;
    v51 = __Block_byref_object_dispose__30;
    v52 = (id)objc_opt_new();
    v16 = -[TRIFactorPackStorage initWithPaths:]([TRIFactorPackStorage alloc], "initWithPaths:", self->_paths);
    v17 = -[TRIFBFactorPackStorage initWithPaths:]([TRIFBFactorPackStorage alloc], "initWithPaths:", self->_paths);
    objc_initWeak(&location, self);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __79__TRIFactorPackSetStorage_migrateEligibleFactorPacksToGlobalWithServerContext___block_invoke_101;
    v38[3] = &unk_1E9333D80;
    objc_copyWeak(&v42, &location);
    v18 = v16;
    v39 = v18;
    v19 = v17;
    v40 = v19;
    p_buf = &buf;
    v20 = MEMORY[0x1D8232C48](v38);
    objc_msgSend(v35, "rolloutDatabase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __79__TRIFactorPackSetStorage_migrateEligibleFactorPacksToGlobalWithServerContext___block_invoke_104;
    v36[3] = &unk_1E9333DA8;
    v36[4] = self;
    v22 = (id)v20;
    v37 = v22;
    LOBYTE(v20) = objc_msgSend(v21, "enumerateRecordsOverlappingNamespaces:usingTransaction:block:", v8, 0, v36);

    if ((v20 & 1) != 0)
    {
      v23 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
      if (v23)
      {
        TRILogCategory_Server();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v32 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          *(_DWORD *)v46 = 138412290;
          v47 = v32;
          _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "Failed to update factorpacks for the following namespaces globally: %@", v46, 0xCu);
        }

        objc_msgSend(v8, "minusSet:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      }
      v25 = !-[TRIGloballyAvailableNamespaces setNamespaces:](v12, "setNamespaces:", v8);
      if (v23)
        LOBYTE(v25) = 1;
      if ((v25 & 1) != 0)
      {
        v27 = 0;
        v29 = 0;
        goto LABEL_27;
      }
      TRILogCategory_Server();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_1D207F000, v26, OS_LOG_TYPE_DEFAULT, "Completed factor packs migration successfully.", v46, 2u);
      }
      v27 = 0;
    }
    else
    {
      TRILogCategory_Server();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v46 = 0;
        _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "Failed to enumerate factor packs to be migrated.", v46, 2u);
      }
      v27 = 1;
    }

    v29 = 1;
LABEL_27:

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    _Block_object_dispose(&buf, 8);
    goto LABEL_28;
  }
  TRILogCategory_Server();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D207F000, v28, OS_LOG_TYPE_DEFAULT, "No namespaces need to be migrated to be available globally.", (uint8_t *)&buf, 2u);
  }

  v27 = 1;
  v29 = 1;
LABEL_28:

  objc_autoreleasePoolPop(context);
  if (v27)
    v30 = v15 == 0;
  else
    v30 = v29;

  return v30;
}

void __79__TRIFactorPackSetStorage_migrateEligibleFactorPacksToGlobalWithServerContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "availableToRootUser"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "namespaceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __79__TRIFactorPackSetStorage_migrateEligibleFactorPacksToGlobalWithServerContext___block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D8232A5C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v3, "selectedNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "downloadedFactorsWithPaths:", WeakRetained[1]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "factorPackId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_INFO, "Migrating factor pack with id: %@ in namespace: %@ populating factors: %@", (uint8_t *)&v13, 0x20u);

  }
  +[TRIClientFactorPackUtils aliasesInNamespace:](TRIClientFactorPackUtils, "aliasesInNamespace:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 32), "saveFactorPackToGlobal:forFactorNames:aliasToUnaliasMap:", v3, v8, v11);
  if ((v12 & objc_msgSend(*(id *)(a1 + 40), "saveFactorPackToGlobal:forFactorNames:aliasToUnaliasMap:", v3, v8, v11) & 1) == 0&& v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);
  }

  objc_autoreleasePoolPop(v4);
}

void __79__TRIFactorPackSetStorage_migrateEligibleFactorPacksToGlobalWithServerContext___block_invoke_104(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "activeFactorPackSetId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "activeFactorPackSetId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumerateOnlyProtobufFactorPacksForFactorPackSet:withBlock:", v5, *(_QWORD *)(a1 + 40));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
