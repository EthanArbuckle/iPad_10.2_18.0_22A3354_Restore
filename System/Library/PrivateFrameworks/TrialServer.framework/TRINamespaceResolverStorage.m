@implementation TRINamespaceResolverStorage

- (TRINamespaceResolverStorage)initWithPaths:(id)a3
{
  id v5;
  TRINamespaceResolverStorage *v6;
  TRINamespaceResolverStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRINamespaceResolverStorage;
  v6 = -[TRINamespaceResolverStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_paths, a3);

  return v7;
}

- (BOOL)rewriteRolloutDeployment:(id)a3 rampId:(id)a4 targetedFactorPackSetId:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  TRIFactorPackSetStorage *v14;
  id v15;
  NSObject *v16;
  TRITempDirScopeGuard *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  TRITempDirScopeGuard *v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  objc_msgSend(v9, "rolloutId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

    }
    v14 = -[TRIFactorPackSetStorage initWithPaths:]([TRIFactorPackSetStorage alloc], "initWithPaths:", self->_paths);
    v43 = 0;
    if (-[TRIFactorPackSetStorage hasFactorPackSetWithId:path:](v14, "hasFactorPackSetWithId:path:", v11, &v43))
    {
      if (!v43)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 357, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetPath"));

      }
      v15 = objc_alloc(MEMORY[0x1E0DC0B50]);
      v16 = objc_msgSend(v15, "initWithDir:", v43);
      if (v16)
      {
        v17 = [TRITempDirScopeGuard alloc];
        -[TRIPaths localTempDir](self->_paths, "localTempDir");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[TRITempDirScopeGuard initWithPath:](v17, "initWithPath:", v18);

        if (!v42)
        {
          v25 = 0;
LABEL_32:

          -[NSObject unlock](v16, "unlock");
          goto LABEL_33;
        }
        -[TRINamespaceResolverStorage pathForRolloutDeployment:](self, "pathForRolloutDeployment:", v9);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          if (v10 && !-[TRINamespaceResolverStorage _writeRampId:parentDir:](self, "_writeRampId:parentDir:", v10, v40))
          {
            v25 = 0;
            goto LABEL_31;
          }
          -[TRITempDirScopeGuard path](v42, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_alloc(MEMORY[0x1E0CB3940]);
          v21 = (void *)objc_opt_new();
          objc_msgSend(v21, "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("targeting-link-%@"), v22);
          objc_msgSend(v19, "stringByAppendingPathComponent:", v23);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "stringByAppendingPathComponent:", CFSTR("targetedFactorPackSet"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:](TRIReferenceManagedDir, "symlinkFromCurrentPath:withFuturePath:toManagedPath:", v41, v24, v43))
          {
            goto LABEL_15;
          }
        }
        else
        {
          -[TRITempDirScopeGuard path](v42, "path");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_alloc(MEMORY[0x1E0CB3940]);
          v27 = (void *)objc_opt_new();
          objc_msgSend(v27, "UUIDString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("new-deployment-%@"), v28);
          objc_msgSend(v39, "stringByAppendingPathComponent:", v29);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          -[TRINamespaceResolverStorage _pathForRolloutDeployment:](self, "_pathForRolloutDeployment:", v9);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v41);
            v30 = (void *)MEMORY[0x1E0CB3620];
            objc_msgSend(v24, "stringByDeletingLastPathComponent");
            v31 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "triIdempotentCreateDirectoryOrFaultWithPath:", v31);

            objc_msgSend(v41, "stringByAppendingPathComponent:", CFSTR("targetedFactorPackSet"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringByAppendingPathComponent:", CFSTR("targetedFactorPackSet"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v31) = +[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:](TRIReferenceManagedDir, "symlinkFromCurrentPath:withFuturePath:toManagedPath:", v32, v33, v43);

            if ((v31 & 1) != 0
              && +[TRIReferenceManagedDir createFromDir:](TRIReferenceManagedDir, "createFromDir:", v41)
              && (!v10
               || -[TRINamespaceResolverStorage _writeRampId:parentDir:](self, "_writeRampId:parentDir:", v10, v41)))
            {
LABEL_15:
              v25 = objc_msgSend(MEMORY[0x1E0CB3620], "triRenameOrFaultWithSourcePath:destPath:", v41, v24);
LABEL_30:

LABEL_31:
              goto LABEL_32;
            }
          }
        }
        v25 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "shortDesc");
        v35 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v35;
        v46 = 2114;
        v47 = v11;
        _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Unable to update rollout %{public}@; targeted factor pack set %{public}@ is missing.",
          buf,
          0x16u);

      }
    }
    v25 = 0;
LABEL_33:

    goto LABEL_34;
  }
  TRILogCategory_Server();
  v14 = (TRIFactorPackSetStorage *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[TRINamespaceResolverStorage rewriteRolloutDeployment:rampId:targetedFactorPackSetId:]";
    _os_log_error_impl(&dword_1D207F000, &v14->super, OS_LOG_TYPE_ERROR, "%s has empty path arg: deployment.rolloutId", buf, 0xCu);
  }
  v25 = 0;
LABEL_34:

  return v25 & 1;
}

- (BOOL)_writeRampId:(id)a3 parentDir:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "stringByAppendingPathComponent:", CFSTR("rampId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v8 = objc_msgSend(v7, "writeToFile:options:error:", v6, 268435457, &v12);
  v9 = v12;
  if ((v8 & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      v15 = 2114;
      v16 = v9;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Failed to write ramp ID into namespace resolver storage at %{public}@: %{public}@", buf, 0x16u);
    }

  }
  return v8;
}

- (id)parentDirForRolloutDeployments
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("v2/rolloutV2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)_pathForRolloutDeployment:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 447, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  objc_msgSend(v5, "rolloutId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D8232A5C]();
    -[TRINamespaceResolverStorage parentDirForRolloutDeployments](self, "parentDirForRolloutDeployments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v5, "rolloutId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@/%d"), v11, objc_msgSend(v5, "deploymentId"));
    objc_msgSend(v9, "stringByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[TRINamespaceResolverStorage _pathForRolloutDeployment:]";
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: deployment.rolloutId", buf, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (id)pathForRolloutDeployment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TRINamespaceResolverStorage _pathForRolloutDeployment:](self, "_pathForRolloutDeployment:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "fileExistsAtPath:", v3))
      v5 = v3;
    else
      v5 = 0;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pathForTargetedFactorPackSetWithDeployment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TRINamespaceResolverStorage pathForRolloutDeployment:](self, "pathForRolloutDeployment:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("targetedFactorPackSet"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_removeUnreferencedDeploymentsWithRefStore:(id)a3 topLevelDir:(id)a4 removedCount:(unsigned int *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v22;
  SEL v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  unsigned int *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, 0, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  v15 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v13, "nextObject");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    v23 = a2;
    do
    {
      objc_msgSend(v17, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v23, self, CFSTR("TRINamespaceResolverStorage.m"), 487, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

      }
      objc_msgSend(v14, "addString:", v18);

      objc_autoreleasePoolPop(v15);
      v15 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v13, "nextObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v17);
  }
  objc_autoreleasePoolPop(v15);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __99__TRINamespaceResolverStorage__removeUnreferencedDeploymentsWithRefStore_topLevelDir_removedCount___block_invoke;
  v24[3] = &unk_1E9331518;
  v26 = &v28;
  v24[4] = self;
  v19 = v9;
  v25 = v19;
  v27 = a5;
  if (objc_msgSend(v14, "enumerateStringsWithBlock:", v24))
    v20 = *((_BYTE *)v29 + 24) != 0;
  else
    v20 = 0;

  _Block_object_dispose(&v28, 8);
  return v20;
}

uint64_t __99__TRINamespaceResolverStorage__removeUnreferencedDeploymentsWithRefStore_topLevelDir_removedCount___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = objc_msgSend(*(id *)(a1 + 32), "_removeUnreferencedDeploymentsWithRefStore:parentDir:removedCount:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 56));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v4 + 24))
    v5 = result;
  else
    v5 = 0;
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

- (BOOL)_removeUnreferencedDeploymentsWithRefStore:(id)a3 parentDir:(id)a4 removedCount:(unsigned int *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  TRITempDirScopeGuard *v19;
  void *v20;
  TRITempDirScopeGuard *v21;
  int v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  TRITempDirScopeGuard *v27;
  uint64_t *v28;
  unsigned int *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, 0, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
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
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 516, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

      }
      objc_msgSend(v14, "addString:", v18);

      objc_autoreleasePoolPop(v15);
      v15 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v13, "nextObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v17);
  }
  objc_autoreleasePoolPop(v15);
  v19 = [TRITempDirScopeGuard alloc];
  -[TRIPaths localTempDir](self->_paths, "localTempDir");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[TRITempDirScopeGuard initWithPath:](v19, "initWithPath:", v20);

  if (v21)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 1;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __97__TRINamespaceResolverStorage__removeUnreferencedDeploymentsWithRefStore_parentDir_removedCount___block_invoke;
    v25[3] = &unk_1E9331518;
    v28 = &v30;
    v26 = v9;
    v27 = v21;
    v29 = a5;
    v22 = objc_msgSend(v14, "enumerateStringsWithBlock:", v25);
    rmdir((const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"));
    if (v22)
      LOBYTE(v22) = *((_BYTE *)v31 + 24) != 0;

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  return v22;
}

void __97__TRINamespaceResolverStorage__removeUnreferencedDeploymentsWithRefStore_parentDir_removedCount___block_invoke(uint64_t a1, void *a2)
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
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[TRIReferenceManagedDir collectGarbageForManagedDir:withExternalReferenceStore:usingTempDir:managedDirWasDeleted:](TRIReferenceManagedDir, "collectGarbageForManagedDir:withExternalReferenceStore:usingTempDir:managedDirWasDeleted:", v5, v3, v6, &v10);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v8 + 24))
    v9 = v7;
  else
    v9 = 0;
  *(_BYTE *)(v8 + 24) = v9;

  if (v10)
    ++**(_DWORD **)(a1 + 56);
}

- (BOOL)removeUnreferencedRolloutDeploymentsWithServerContext:(id)a3 removedCount:(unsigned int *)a4
{
  id v6;
  TRIRolloutDeploymentRefStore *v7;
  void *v8;
  BOOL v9;
  unsigned int v11;

  v6 = a3;
  v7 = -[TRIRolloutDeploymentRefStore initWithServerContext:]([TRIRolloutDeploymentRefStore alloc], "initWithServerContext:", v6);

  v11 = 0;
  -[TRINamespaceResolverStorage parentDirForRolloutDeployments](self, "parentDirForRolloutDeployments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TRINamespaceResolverStorage _removeUnreferencedDeploymentsWithRefStore:topLevelDir:removedCount:](self, "_removeUnreferencedDeploymentsWithRefStore:topLevelDir:removedCount:", v7, v8, &v11);

  if (a4)
    *a4 = v11;

  return v9;
}

- (BOOL)rewriteExperimentDeployment:(id)a3 targetedTreatmentId:(id)a4
{
  return -[TRINamespaceResolverStorage _rewriteExperimentDeployment:targetedTreatmentId:factorPackSetId:](self, "_rewriteExperimentDeployment:targetedTreatmentId:factorPackSetId:", a3, a4, 0);
}

- (BOOL)_rewriteExperimentDeployment:(id)a3 targetedTreatmentId:(id)a4 factorPackSetId:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  char v14;
  int v15;
  int v16;
  int v17;
  BOOL v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  char *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 572, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  objc_msgSend(v9, "experimentId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 574, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId"));

    }
    v14 = _os_feature_enabled_impl();
    v15 = _os_feature_enabled_impl();
    if (v11)
      v16 = v15;
    else
      v16 = 0;
    v17 = _os_feature_enabled_impl();
    if (v11 && (v14 & 1) != 0)
    {
      v18 = 0;
      if (!v16)
        goto LABEL_23;
    }
    else
    {
      v18 = -[TRINamespaceResolverStorage _rewriteExperimentDeploymentForTreatmentPath:targetedTreatmentId:](self, "_rewriteExperimentDeploymentForTreatmentPath:targetedTreatmentId:", v9, v10);
      if (!v16)
        goto LABEL_23;
    }
    v20 = -[TRINamespaceResolverStorage _rewriteExperimentDeploymentForFPSPath:targetedTreatmentId:factorPackSetId:](self, "_rewriteExperimentDeploymentForFPSPath:targetedTreatmentId:factorPackSetId:", v9, v10, v11);
    if (!v20)
    {
      TRILogCategory_Server();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "shortDesc");
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v23;
        v28 = 2114;
        v29 = v11;
        _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Unable to update experiment deployment %{public}@ for targeted factor pack set %{public}@.", buf, 0x16u);

      }
    }
    if (v17)
      v18 = v20;
  }
  else
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[TRINamespaceResolverStorage _rewriteExperimentDeployment:targetedTreatmentId:factorPackSetId:]";
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "%s has empty path arg: deployment.experimentId", buf, 0xCu);
    }

    v18 = 0;
  }
LABEL_23:

  return v18;
}

- (BOOL)_rewriteExperimentDeploymentForTreatmentPath:(id)a3 targetedTreatmentId:(id)a4
{
  id v7;
  id v8;
  TRINamespaceDescriptorSetStorage *v9;
  id v10;
  NSObject *v11;
  TRITempDirScopeGuard *v12;
  void *v13;
  TRITempDirScopeGuard *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[TRINamespaceDescriptorSetStorage initWithPaths:]([TRINamespaceDescriptorSetStorage alloc], "initWithPaths:", self->_paths);
  v36 = 0;
  if (-[TRINamespaceDescriptorSetStorage hasNamespaceDescriptorsForTreatmentWithId:path:](v9, "hasNamespaceDescriptorsForTreatmentWithId:path:", v8, &v36))
  {
    if (!v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 617, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceDescriptorSetPath"));

    }
    v10 = objc_alloc(MEMORY[0x1E0DC0B50]);
    v11 = objc_msgSend(v10, "initWithDir:", v36);
    if (v11)
    {
      v12 = [TRITempDirScopeGuard alloc];
      -[TRIPaths localTempDir](self->_paths, "localTempDir");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[TRITempDirScopeGuard initWithPath:](v12, "initWithPath:", v13);

      if (!v14)
      {
        v22 = 0;
LABEL_18:

        -[NSObject unlock](v11, "unlock");
        goto LABEL_19;
      }
      -[TRINamespaceResolverStorage pathForExperimentDeployment:](self, "pathForExperimentDeployment:", v7);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        -[TRITempDirScopeGuard path](v14, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_alloc(MEMORY[0x1E0CB3940]);
        v17 = (void *)objc_opt_new();
        objc_msgSend(v17, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("targeting-link-%@"), v18);
        objc_msgSend(v15, "stringByAppendingPathComponent:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "stringByAppendingPathComponent:", CFSTR("targetedNamespaceDescriptorSet"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:](TRIReferenceManagedDir, "symlinkFromCurrentPath:withFuturePath:toManagedPath:", v20, v21, v36))
        {
LABEL_8:
          v22 = objc_msgSend(MEMORY[0x1E0CB3620], "triRenameOrFaultWithSourcePath:destPath:", v20, v21);
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        -[TRITempDirScopeGuard path](v14, "path");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_alloc(MEMORY[0x1E0CB3940]);
        v24 = (void *)objc_opt_new();
        objc_msgSend(v24, "UUIDString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("new-deployment-%@"), v25);
        objc_msgSend(v34, "stringByAppendingPathComponent:", v26);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[TRINamespaceResolverStorage _pathForExperimentDeployment:](self, "_pathForExperimentDeployment:", v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v20);
          v27 = (void *)MEMORY[0x1E0CB3620];
          objc_msgSend(v21, "stringByDeletingLastPathComponent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "triIdempotentCreateDirectoryOrFaultWithPath:", v28);

          objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("targetedNamespaceDescriptorSet"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringByAppendingPathComponent:", CFSTR("targetedNamespaceDescriptorSet"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v27) = +[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:](TRIReferenceManagedDir, "symlinkFromCurrentPath:withFuturePath:toManagedPath:", v29, v30, v36);

          if ((v27 & 1) != 0)
          {
            if (+[TRIReferenceManagedDir createFromDir:](TRIReferenceManagedDir, "createFromDir:", v20))
              goto LABEL_8;
          }
        }
      }
      v22 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "shortDesc");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v32;
      v39 = 2112;
      v40 = v8;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Unable to update experiment %{public}@; targeted treatment set %@ is missing.",
        buf,
        0x16u);

    }
  }
  v22 = 0;
LABEL_19:

  return v22 & 1;
}

- (BOOL)_rewriteExperimentDeploymentForFPSPath:(id)a3 targetedTreatmentId:(id)a4 factorPackSetId:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRIFactorPackSetStorage *v12;
  id v13;
  NSObject *v14;
  TRITempDirScopeGuard *v15;
  void *v16;
  TRITempDirScopeGuard *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 684, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

  }
  v12 = -[TRIFactorPackSetStorage initWithPaths:]([TRIFactorPackSetStorage alloc], "initWithPaths:", self->_paths);
  v25 = 0;
  if (!-[TRIFactorPackSetStorage hasFactorPackSetWithId:path:](v12, "hasFactorPackSetWithId:path:", v11, &v25))
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v9, "shortDesc");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2114;
      v29 = v11;
      _os_log_fault_impl(&dword_1D207F000, v14, OS_LOG_TYPE_FAULT, "Unable to update experiment %{public}@; targeted factor pack set %{public}@ is missing.",
        buf,
        0x16u);

    }
    goto LABEL_12;
  }
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 695, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetPath"));

  }
  v13 = objc_alloc(MEMORY[0x1E0DC0B50]);
  v14 = objc_msgSend(v13, "initWithDir:", v25);
  if (!v14)
  {
LABEL_12:
    v19 = 0;
    goto LABEL_20;
  }
  v15 = [TRITempDirScopeGuard alloc];
  -[TRIPaths localTempDir](self->_paths, "localTempDir");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[TRITempDirScopeGuard initWithPath:](v15, "initWithPath:", v16);

  if (v17)
  {
    -[TRINamespaceResolverStorage pathForExperimentDeployment:](self, "pathForExperimentDeployment:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = -[TRINamespaceResolverStorage _updateTargetedFactorPackSetWithTempDirRef:existingDeploymentDir:factorPackSetPath:](self, "_updateTargetedFactorPackSetWithTempDirRef:existingDeploymentDir:factorPackSetPath:", v17, v18, v25);
    }
    else
    {
      -[TRINamespaceResolverStorage _pathForExperimentDeployment:](self, "_pathForExperimentDeployment:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        v19 = -[TRINamespaceResolverStorage _createDeploymentDirectoryAndAddFactorPackSetWithTempDirRef:newDeploymentDir:factorPackSetPath:](self, "_createDeploymentDirectoryAndAddFactorPackSetWithTempDirRef:newDeploymentDir:factorPackSetPath:", v17, v20, v25);
      else
        v19 = 0;

    }
  }
  else
  {
    v19 = 0;
  }

  -[NSObject unlock](v14, "unlock");
LABEL_20:

  return v19;
}

- (BOOL)_updateTargetedFactorPackSetWithTempDirRef:(id)a3 existingDeploymentDir:(id)a4 factorPackSetPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("targeting-link-%@"), v12);
  objc_msgSend(v9, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("targetedFactorPackSet"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = +[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:](TRIReferenceManagedDir, "symlinkFromCurrentPath:withFuturePath:toManagedPath:", v14, v15, v7);
  if ((_DWORD)v8)
    v16 = objc_msgSend(MEMORY[0x1E0CB3620], "triRenameOrFaultWithSourcePath:destPath:", v14, v15);
  else
    v16 = 0;

  return v16;
}

- (BOOL)_createDeploymentDirectoryAndAddFactorPackSetWithTempDirRef:(id)a3 newDeploymentDir:(id)a4 factorPackSetPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("new-deployment-%@"), v12);
  objc_msgSend(v9, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v14);
  v15 = (void *)MEMORY[0x1E0CB3620];
  objc_msgSend(v7, "stringByDeletingLastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "triIdempotentCreateDirectoryOrFaultWithPath:", v16);

  objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("targetedFactorPackSet"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("targetedFactorPackSet"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = +[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:](TRIReferenceManagedDir, "symlinkFromCurrentPath:withFuturePath:toManagedPath:", v17, v18, v8);

  if ((_DWORD)v15
    && +[TRIReferenceManagedDir createFromDir:](TRIReferenceManagedDir, "createFromDir:", v14))
  {
    v19 = objc_msgSend(MEMORY[0x1E0CB3620], "triRenameOrFaultWithSourcePath:destPath:", v14, v7);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)parentDirForExperimentDeployments
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("v2/experiment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)_pathForExperimentDeployment:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 856, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  objc_msgSend(v5, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D8232A5C]();
    -[TRINamespaceResolverStorage parentDirForExperimentDeployments](self, "parentDirForExperimentDeployments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v5, "experimentId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@/%d"), v11, objc_msgSend(v5, "deploymentId"));
    objc_msgSend(v9, "stringByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[TRINamespaceResolverStorage _pathForExperimentDeployment:]";
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: deployment.experimentId", buf, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (id)pathForExperimentDeployment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TRINamespaceResolverStorage _pathForExperimentDeployment:](self, "_pathForExperimentDeployment:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "fileExistsAtPath:", v3))
      v5 = v3;
    else
      v5 = 0;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)removeUnreferencedExperimentDeploymentsWithServerContext:(id)a3 removedCount:(unsigned int *)a4
{
  id v6;
  TRIExperimentDeploymentRefStore *v7;
  void *v8;
  BOOL v9;
  unsigned int v11;

  v6 = a3;
  v7 = -[TRIExperimentDeploymentRefStore initWithServerContext:]([TRIExperimentDeploymentRefStore alloc], "initWithServerContext:", v6);

  v11 = 0;
  -[TRINamespaceResolverStorage parentDirForExperimentDeployments](self, "parentDirForExperimentDeployments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TRINamespaceResolverStorage _removeUnreferencedDeploymentsWithRefStore:topLevelDir:removedCount:](self, "_removeUnreferencedDeploymentsWithRefStore:topLevelDir:removedCount:", v7, v8, &v11);

  if (a4)
    *a4 = v11;

  return v9;
}

- (BOOL)overwriteActiveFactorProvidersUsingTransaction:(id)a3 fromContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TRIFactorPackSetStorage *v13;
  void *v14;
  uint64_t v15;
  id v16;
  TRIFactorPackSetStorage *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  void *context;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  TRIFactorPackSetStorage *v38;
  TRINamespaceResolverStorage *v39;
  id v40;
  SEL v41;
  _QWORD v42[4];
  id v43;
  id v44;
  TRIFactorPackSetStorage *v45;
  TRINamespaceResolverStorage *v46;
  id v47;
  SEL v48;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v33 = v6;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 885, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 886, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

LABEL_3:
  context = (void *)MEMORY[0x1D8232A5C]();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v32 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v13 = -[TRIFactorPackSetStorage initWithPaths:]([TRIFactorPackSetStorage alloc], "initWithPaths:", self->_paths);
  objc_msgSend(v8, "rolloutDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke;
  v42[3] = &unk_1E9331568;
  v29 = v11;
  v43 = v29;
  v16 = v9;
  v44 = v16;
  v17 = v13;
  v48 = a2;
  v45 = v17;
  v46 = self;
  v18 = v10;
  v47 = v18;
  v19 = objc_msgSend(v14, "enumerateActiveRecordsWithVisibility:usingTransaction:block:", 1, v33, v42);

  if (!_os_feature_enabled_impl())
  {
    v21 = v12;
    v23 = v32;
    if (!v19)
      goto LABEL_5;
LABEL_7:
    v25 = v29;
    v24 = -[TRINamespaceResolverStorage _overwriteActiveFactorProvidersUsingGlobalPath:withNamespaceMap:rolloutDeploymentMap:experimentDeploymentMap:experimentTreatmentMap:factorPackMap:](self, "_overwriteActiveFactorProvidersUsingGlobalPath:withNamespaceMap:rolloutDeploymentMap:experimentDeploymentMap:experimentTreatmentMap:factorPackMap:", 0, v16, v29, v23, v21, 0);
    goto LABEL_8;
  }
  objc_msgSend(v8, "experimentDatabase");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v15;
  v34[1] = 3221225472;
  v34[2] = __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke_2;
  v34[3] = &unk_1E9331590;
  v35 = v32;
  v21 = v12;
  v36 = v12;
  v37 = v16;
  v41 = a2;
  v38 = v17;
  v39 = self;
  v40 = v18;
  v22 = v19 & objc_msgSend(v20, "enumerateActiveExperimentRecordsWithVisibility:block:", 1, v34);

  v23 = v32;
  if ((v22 & 1) != 0)
    goto LABEL_7;
LABEL_5:
  v24 = 0;
  v25 = v29;
LABEL_8:

  objc_autoreleasePoolPop(context);
  return v24;
}

void __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  __int128 v42;
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  uint8_t v50[128];
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "activeFactorPackSetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "deployment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rolloutId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = v3;
    if (v8)
    {
      TRILogCategory_Server();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "deployment");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "rolloutId");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(void **)(a1 + 32);
        objc_msgSend(v3, "deployment");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "rolloutId");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "deployment");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v52 = v34;
        v53 = 2112;
        v54 = v38;
        v55 = 1024;
        v56 = objc_msgSend(v39, "deploymentId");
        _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Rollout database has conflicting active deployments for rollout %{public}@: (%@, %d)", buf, 0x1Cu);

        v3 = v40;
      }

    }
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "deployment", v40);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "deploymentId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v3, "deployment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rolloutId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v15);

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v3, "namespaces");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          v22 = objc_alloc(MEMORY[0x1E0DC0A90]);
          objc_msgSend(v3, "deployment");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "rolloutId");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v22, "initWithType:value:", 0, v24);

          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "arrayByAddingObject:", v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v28, v21);

            v3 = v41;
          }
          else
          {
            v49 = v25;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v27, v21);
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v18);
    }

    v29 = *(void **)(a1 + 48);
    objc_msgSend(v3, "activeFactorPackSetId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke_129;
    v43[3] = &unk_1E9331540;
    v43[4] = *(_QWORD *)(a1 + 56);
    v42 = *(_OWORD *)(a1 + 64);
    v31 = (id)v42;
    v44 = v42;
    objc_msgSend(v29, "enumerateCompatibleFactorPacksForFactorPackSet:usingLegacyPaths:withBlock:", v30, 0, v43);

  }
  else
  {
    TRILogCategory_Server();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v52 = v3;
      _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "Found \"active\" rollout with missing activeFactorPackSetId: %{public}@", buf, 0xCu);
    }

  }
}

void __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
    {
      objc_msgSend((id)v6, "namespaceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sourceAsFactorPackId");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRINamespaceResolverStorage.m"), 926, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pbFactorPack || fbFactorLevel"));

  }
  objc_msgSend((id)v5, "selectedNamespace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v5, "factorPackId");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = (void *)v9;
  if (v9)
  {
    if (v8)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRINamespaceResolverStorage.m"), 929, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackId"));

    if (v8)
      goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRINamespaceResolverStorage.m"), 930, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_8:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A90]), "initWithType:value:", 0, v12);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObject:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v16, v8);

  }
  else
  {
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v15, v8);
  }

}

void __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  uint8_t v47[128];
  uint8_t buf[4];
  NSObject *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  -[NSObject factorPackSetId](v4, "factorPackSetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSObject experimentDeployment](v4, "experimentDeployment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "experimentId");
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject experimentDeployment](v4, "experimentDeployment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "deploymentId");

    -[NSObject treatmentId](v4, "treatmentId");
    v10 = objc_claimAutoreleasedReturnValue();
    v34 = a1;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v7;
        v50 = 2112;
        v51 = v29;
        v52 = 1024;
        v53 = v9;
        _os_log_fault_impl(&dword_1D207F000, v12, OS_LOG_TYPE_FAULT, "Experiment database has conflicting active deployments for experiment %{public}@: (%@, %d)", buf, 0x1Cu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v34;
    objc_msgSend(*(id *)(v34 + 32), "setObject:forKeyedSubscript:", v13, v7);

    v30 = (void *)v10;
    objc_msgSend(*(id *)(v34 + 40), "setObject:forKeyedSubscript:", v10, v7);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v31 = v4;
    -[NSObject namespaces](v4, "namespaces");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v35)
    {
      v33 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v43 != v33)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A90]), "initWithType:value:", 2, v7);
          v18 = *(void **)(v14 + 48);
          objc_msgSend(v16, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = *(void **)(v14 + 48);
            objc_msgSend(v16, "name");
            v38 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "arrayByAddingObject:", v17);
            v22 = objc_claimAutoreleasedReturnValue();
            v36 = (void *)v22;
          }
          else
          {
            v46 = v17;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
            v2 = objc_claimAutoreleasedReturnValue();
            v22 = v2;
          }
          v23 = *(void **)(v14 + 48);
          objc_msgSend(v16, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

          v25 = (void *)v2;
          if (v20)
          {

            v25 = (void *)v38;
          }

          v14 = v34;
        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v35);
    }

    v26 = *(void **)(v14 + 56);
    v4 = v31;
    -[NSObject factorPackSetId](v31, "factorPackSetId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke_138;
    v40[3] = &unk_1E9331540;
    v40[4] = *(_QWORD *)(v14 + 64);
    v39 = *(_OWORD *)(v14 + 72);
    v28 = (id)v39;
    v41 = v39;
    objc_msgSend(v26, "enumerateCompatibleFactorPacksForFactorPackSet:usingLegacyPaths:withBlock:", v27, 0, v40);

  }
  else
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v4;
      _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Found \"active\" experiment with missing factorPackSetId: %{public}@", buf, 0xCu);
    }
  }

}

void __90__TRINamespaceResolverStorage_overwriteActiveFactorProvidersUsingTransaction_fromContext___block_invoke_138(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
    {
      objc_msgSend((id)v6, "namespaceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sourceAsFactorPackId");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRINamespaceResolverStorage.m"), 963, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pbFactorPack || fbFactorLevel"));

  }
  objc_msgSend((id)v5, "selectedNamespace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v5, "factorPackId");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = (void *)v9;
  if (v9)
  {
    if (v8)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRINamespaceResolverStorage.m"), 966, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackId"));

    if (v8)
      goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRINamespaceResolverStorage.m"), 967, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_8:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A90]), "initWithType:value:", 2, v12);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObject:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v16, v8);

  }
  else
  {
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v15, v8);
  }

}

- (BOOL)overwriteGlobalActiveFactorProvidersWithNamespaceMap:(id)a3 factorPackMap:(id)a4 rolloutDeploymentMap:(id)a5
{
  return -[TRINamespaceResolverStorage _overwriteActiveFactorProvidersUsingGlobalPath:withNamespaceMap:rolloutDeploymentMap:experimentDeploymentMap:experimentTreatmentMap:factorPackMap:](self, "_overwriteActiveFactorProvidersUsingGlobalPath:withNamespaceMap:rolloutDeploymentMap:experimentDeploymentMap:experimentTreatmentMap:factorPackMap:", 1, a3, a5, 0, 0, a4);
}

- (BOOL)_overwriteActiveFactorProvidersUsingGlobalPath:(BOOL)a3 withNamespaceMap:(id)a4 rolloutDeploymentMap:(id)a5 experimentDeploymentMap:(id)a6 experimentTreatmentMap:(id)a7 factorPackMap:(id)a8
{
  _BOOL8 v12;
  id v15;
  id v16;
  TRIPaths *paths;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  TRITempDirScopeGuard *v33;
  TRITempDirScopeGuard *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  char v44;
  NSObject *v45;
  int *v47;
  char *v48;
  int v49;
  NSObject *log;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[5];
  id v60;
  SEL v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  char *v65;
  __int16 v66;
  int v67;
  _QWORD v68[2];
  _QWORD v69[4];

  v12 = a3;
  v69[2] = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v54 = a6;
  v55 = a7;
  v16 = a8;
  paths = self->_paths;
  v18 = a4;
  -[TRIPaths namespaceDescriptorsDirUsingGlobal:](paths, "namespaceDescriptorsDirUsingGlobal:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v12)
    v21 = CFSTR("v2/globalActiveFactorProviders.plplist");
  else
    v21 = CFSTR("v2/activeFactorProviders.plplist");
  objc_msgSend(v19, "stringByAppendingPathComponent:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v22;
  objc_msgSend(v22, "stringByDeletingLastPathComponent");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:");
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v18, "count"));
  v24 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __177__TRINamespaceResolverStorage__overwriteActiveFactorProvidersUsingGlobalPath_withNamespaceMap_rolloutDeploymentMap_experimentDeploymentMap_experimentTreatmentMap_factorPackMap___block_invoke;
  v59[3] = &unk_1E93315B8;
  v61 = a2;
  v59[4] = self;
  v25 = v23;
  v60 = v25;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v59);

  v68[0] = CFSTR("namespaceMap");
  v68[1] = CFSTR("rolloutV2Deployments");
  v69[0] = v25;
  v69[1] = v15;
  v52 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "mutableCopy");

  if (_os_feature_enabled_impl())
  {
    if (v54 && objc_msgSend(v54, "count"))
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v54, CFSTR("experimentDeployments"));
    if (v55 && objc_msgSend(v55, "count"))
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v55, CFSTR("experimentTreatments"));
  }
  if (v16)
  {
    v57[0] = v24;
    v57[1] = 3221225472;
    v57[2] = __177__TRINamespaceResolverStorage__overwriteActiveFactorProvidersUsingGlobalPath_withNamespaceMap_rolloutDeploymentMap_experimentDeploymentMap_experimentTreatmentMap_factorPackMap___block_invoke_2;
    v57[3] = &unk_1E93315E0;
    v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v16, "count"));
    v28 = v58;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v57);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("namespaceFactorPackMap"));

  }
  if (v12)
  {
    NSTemporaryDirectory();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_opt_new();
    objc_msgSend(v30, "UUIDString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingPathComponent:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TRIPaths localTempDir](self->_paths, "localTempDir");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = -[TRITempDirScopeGuard initWithPath:]([TRITempDirScopeGuard alloc], "initWithPath:", v32);
  v34 = v33;
  if (v33)
  {
    -[TRITempDirScopeGuard path](v33, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc(MEMORY[0x1E0CB3940]);
    v37 = (void *)objc_opt_new();
    objc_msgSend(v37, "UUIDString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v36, "initWithFormat:", CFSTR("plplist-%@"), v38);
    objc_msgSend(v35, "stringByAppendingPathComponent:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = 0;
    objc_msgSend(MEMORY[0x1E0D815D0], "fileBackedDataWithPropertyList:writtenToPath:error:", v27, v40, &v56);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v56;
    if (v41)
    {
      v22 = v53;
      if (objc_msgSend(MEMORY[0x1E0CB3620], "triRemoveFileProtectionIfPresentForPath:", v40))
      {
        v43 = objc_retainAutorelease(v40);
        if (!chmod((const char *)objc_msgSend(v43, "fileSystemRepresentation"), 0x124u))
        {
          v44 = objc_msgSend(MEMORY[0x1E0CB3620], "triRenameOrFaultWithSourcePath:destPath:", v43, v53);
          goto LABEL_28;
        }
        TRILogCategory_Server();
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          v47 = __error();
          v48 = strerror(*v47);
          v49 = *__error();
          *(_DWORD *)buf = 138543874;
          v63 = v43;
          v64 = 2080;
          v65 = v48;
          v22 = v53;
          v66 = 1024;
          v67 = v49;
          _os_log_error_impl(&dword_1D207F000, log, OS_LOG_TYPE_ERROR, "Failed to set permissions on plplist %{public}@: %s (%d))", buf, 0x1Cu);
        }

      }
    }
    else
    {
      TRILogCategory_Server();
      v45 = objc_claimAutoreleasedReturnValue();
      v22 = v53;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v63 = v42;
        _os_log_error_impl(&dword_1D207F000, v45, OS_LOG_TYPE_ERROR, "Failed to write plplist: %{public}@", buf, 0xCu);
      }

    }
    v44 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v44 = 0;
LABEL_29:

  return v44;
}

void __177__TRINamespaceResolverStorage__overwriteActiveFactorProvidersUsingGlobalPath_withNamespaceMap_rolloutDeploymentMap_experimentDeploymentMap_experimentTreatmentMap_factorPackMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v18 = a1;
  v27 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "type", v18);
        if (v12 == 2)
        {
          v24[0] = CFSTR("experiment");
          objc_msgSend(v11, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v24[1] = v13;
          v14 = v24;
        }
        else
        {
          if (v12)
            continue;
          v25[0] = CFSTR("rolloutV2");
          objc_msgSend(v11, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v25[1] = v13;
          v14 = v25;
        }
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }

  v16 = objc_msgSend(v5, "count");
  if (v16 != objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v18 + 48), *(_QWORD *)(v18 + 32), CFSTR("TRINamespaceResolverStorage.m"), 1043, CFSTR("unhandled factor provider type"));

  }
  objc_msgSend(*(id *)(v18 + 40), "setObject:forKeyedSubscript:", v5, v19, v18);

}

void __177__TRINamespaceResolverStorage__overwriteActiveFactorProvidersUsingGlobalPath_withNamespaceMap_rolloutDeploymentMap_experimentDeploymentMap_experimentTreatmentMap_factorPackMap___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  _OWORD v8[4];
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  memset(v8, 0, sizeof(v8));
  if (objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", v8, v9, 16))
  {
    objc_msgSend(**((id **)&v8[0] + 1), "value");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

    }
  }

}

- (BOOL)_setProvisionalFactorpackMetadata:(id)a3 forNamespaceName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  TRITempDirScopeGuard *v12;
  void *v13;
  TRITempDirScopeGuard *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  void *v26;
  NSObject *v27;
  uint64_t v29;
  void *v30;
  _QWORD v31[9];
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__12;
  v32[4] = __Block_byref_object_dispose__12;
  v33 = 0;
  if (a5)
  {
    v10 = *a5;
    *a5 = 0;

  }
  objc_msgSend(MEMORY[0x1E0DC0B08], "promotionDirForNamespaceName:withPaths:", v9, self->_paths);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [TRITempDirScopeGuard alloc];
  -[TRIPaths localTempDir](self->_paths, "localTempDir");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TRITempDirScopeGuard initWithPath:](v12, "initWithPath:", v13);

  if (v14)
  {
    -[TRITempDirScopeGuard path](v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("fp-provisional-%@"), v18);
    objc_msgSend(v15, "stringByAppendingPathComponent:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __88__TRINamespaceResolverStorage__setProvisionalFactorpackMetadata_forNamespaceName_error___block_invoke;
    v31[3] = &unk_1E9331608;
    v21 = v11;
    v31[4] = v21;
    v22 = v20;
    v31[5] = v22;
    v23 = v8;
    v31[6] = v23;
    v31[8] = v32;
    v24 = v9;
    v31[7] = v24;
    v25 = __88__TRINamespaceResolverStorage__setProvisionalFactorpackMetadata_forNamespaceName_error___block_invoke((uint64_t)v31);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "triForceRemoveItemAtPath:error:", v22, 0);

    if ((v25 & 1) == 0)
    {
      TRILogCategory_Server();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v23, "factorPackId");
        v29 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v29;
        v36 = 2114;
        v37 = v24;
        v30 = (void *)v29;
        _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Failed to set factor pack %{public}@ as provisional for namespace %{public}@", buf, 0x16u);

      }
    }

  }
  else
  {
    v25 = 0;
  }

  _Block_object_dispose(v32, 8);
  return v25;
}

uint64_t __88__TRINamespaceResolverStorage__setProvisionalFactorpackMetadata_forNamespaceName_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  NSObject *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[2];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v2 = *(_QWORD *)(a1 + 40);
  v42[0] = *(_QWORD *)(a1 + 32);
  v42[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v7)))
        {
          v15 = 0;
          goto LABEL_22;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", CFSTR("provisional.pb"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", CFSTR("provisional.pb"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v9, "writeToFile:options:error:", v3, 0x10000000, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);

  if ((v11 & 1) != 0)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3620], "triRenameOrFaultWithSourcePath:destPath:", v3, v8))
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "factorPackId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        v37 = v13;
        v38 = 2114;
        v39 = v14;
        _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Set factor pack %{public}@ as provisional for namespace %{public}@", buf, 0x16u);

      }
      v15 = 1;
      goto LABEL_21;
    }
    v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v34 = *MEMORY[0x1E0CB2D50];
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to rename %@ to %@"), v3, v8);
    v35 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v24);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v40 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to write %@"), v3);
      v41 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v18);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

    }
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v37 = v3;
      v38 = 2114;
      v39 = v22;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failed write \"%{public}@\": %{public}@", buf, 0x16u);
    }
  }
  v15 = 0;
LABEL_21:

LABEL_22:
  return v15;
}

- (id)_getProvisionalFactorpackMetadataForNamespaceName:(id)a3 mustExist:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v6 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5)
  {
    v9 = *a5;
    *a5 = 0;

  }
  objc_msgSend(MEMORY[0x1E0DC0B08], "promotionDirForNamespaceName:withPaths:", v8, self->_paths);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("provisional.pb"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

  if ((v13 & 1) != 0)
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v11, 0, &v23);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v23;
    if (v14)
    {
      v22 = v15;
      objc_msgSend(MEMORY[0x1E0DC0F68], "parseFromData:error:", v14, &v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v22;

      if (v16)
      {
        v18 = v16;
        v19 = v18;
      }
      else
      {
        TRILogCategory_Server();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v25 = v11;
          v26 = 2114;
          v27 = v8;
          v28 = 2114;
          v29 = v17;
          _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Error parsing provisional file \"%{public}@\" for namespace \"%{public}@\": %{public}@", buf, 0x20u);
        }

        v18 = 0;
        v19 = 0;
      }
    }
    else
    {
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v25 = v11;
        v26 = 2114;
        v27 = v8;
        v28 = 2114;
        v29 = v15;
        _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Error opening provisional file \"%{public}@\" for namespace \"%{public}@\": %{public}@", buf, 0x20u);
      }
      v19 = 0;
      v17 = v15;
    }

LABEL_19:
    goto LABEL_20;
  }
  if (v6)
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v25 = v11;
      v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Provisional file \"%{public}@\" for namespace \"%{public}@\" does not exist", buf, 0x16u);
    }
    v17 = 0;
    v19 = 0;
    goto LABEL_19;
  }
  v17 = 0;
  v19 = 0;
LABEL_20:

  return v19;
}

- (BOOL)setProvisionalFactorPackId:(id)a3 forNamespaceName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0DC0F68]);
  objc_msgSend(v10, "setFactorPackId:", v8);
  objc_msgSend(v10, "setAttempts:", 1);
  -[TRINamespaceResolverStorage _getProvisionalFactorpackMetadataForNamespaceName:mustExist:error:](self, "_getProvisionalFactorpackMetadataForNamespaceName:mustExist:error:", v9, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "hasFactorPackId"))
  {
    objc_msgSend(v12, "factorPackId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", v8) & 1) != 0)
    {
      v14 = objc_msgSend(v12, "hasAttempts");

      if (v14)
        objc_msgSend(v10, "setAttempts:", objc_msgSend(v10, "attempts") + objc_msgSend(v12, "attempts"));
    }
    else
    {

    }
  }
  v15 = -[TRINamespaceResolverStorage _setProvisionalFactorpackMetadata:forNamespaceName:error:](self, "_setProvisionalFactorpackMetadata:forNamespaceName:error:", v10, v9, a5);
  if (v15)
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Set factor pack %{public}@ as provisional for namespace %{public}@", (uint8_t *)&v18, 0x16u);
    }

  }
  return v15;
}

- (BOOL)rejectFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  const char *v19;
  int v20;
  __CFString *v21;
  BOOL v22;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24 = 0;
  if (a6)
  {
    v13 = *a6;
    *a6 = 0;

  }
  -[TRINamespaceResolverStorage _getProvisionalFactorpackMetadataForNamespaceName:mustExist:error:](self, "_getProvisionalFactorpackMetadataForNamespaceName:mustExist:error:", v11, 1, &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if (objc_msgSend(v14, "hasFactorPackId"))
    {
      objc_msgSend(v15, "factorPackId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v10);

      if ((v17 & 1) != 0)
      {
        if (objc_msgSend(v15, "hasRejected") && objc_msgSend(v15, "rejected"))
        {
          TRILogCategory_Server();
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
LABEL_22:
            v22 = 1;
            goto LABEL_16;
          }
          *(_DWORD *)buf = 138543618;
          v26 = v10;
          v27 = 2114;
          v28 = v11;
          v19 = "Skipping setting factor pack %{public}@ as rejected for namespace %{public}@ as it is already set";
        }
        else
        {
          objc_msgSend(v15, "setRejected:", 1);
          if (!-[TRINamespaceResolverStorage _setProvisionalFactorpackMetadata:forNamespaceName:error:](self, "_setProvisionalFactorpackMetadata:forNamespaceName:error:", v15, v11, a6))
          {
            v22 = 0;
            goto LABEL_17;
          }
          TRILogCategory_Server();
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            goto LABEL_22;
          *(_DWORD *)buf = 138543618;
          v26 = v10;
          v27 = 2114;
          v28 = v11;
          v19 = "Set factor pack %{public}@ as rejected for namespace %{public}@";
        }
        _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
        goto LABEL_22;
      }
    }
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(v15, "hasFactorPackId");
      if (v20)
      {
        objc_msgSend(v15, "factorPackId");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = &stru_1E9336E60;
      }
      *(_DWORD *)buf = 138543874;
      v26 = v10;
      v27 = 2114;
      v28 = v11;
      v29 = 2114;
      v30 = v21;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Can't reject factorpack \"%{public}@\" when currently provisional factorpack for namespace \"%{public}@\" is \"%{public}@\", buf, 0x20u);
      if (v20)

    }
  }
  else
  {
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v11;
      v27 = 2114;
      v28 = v24;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Failed to get provisional file for namespace \"%{public}@\": %{public}@", buf, 0x16u);
    }
  }
  v22 = 0;
LABEL_16:

LABEL_17:
  return v22;
}

- (BOOL)promoteFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  TRIFactorPackStorage *v14;
  TRIFBFactorPackStorage *v15;
  void *v16;
  void *v17;
  int v18;
  char v19;
  int v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  char v35;
  id v36;
  uint64_t v37;
  void *v38;
  TRITempDirScopeGuard *v39;
  void *v40;
  TRITempDirScopeGuard *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v57;
  id v58;
  void *v59;
  TRIFactorPackStorage *v60;
  id v61;
  void *v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  TRITempDirScopeGuard *v79;
  uint64_t v80;
  void *v81;
  uint8_t buf[4];
  id v83;
  __int16 v84;
  id v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v61 = a5;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__12;
  v76 = __Block_byref_object_dispose__12;
  v77 = 0;
  if (a6)
  {
    v13 = *a6;
    *a6 = 0;

  }
  v14 = -[TRIFactorPackStorage initWithPaths:]([TRIFactorPackStorage alloc], "initWithPaths:", self->_paths);
  -[TRIFactorPackStorage pathForFactorPackWithId:namespaceName:](v14, "pathForFactorPackWithId:namespaceName:", v11, v12);
  *((_QWORD *)&v63 + 1) = objc_claimAutoreleasedReturnValue();
  v60 = v14;
  -[TRIFactorPackStorage legacyPathForFactorPackWithId:namespaceName:](v14, "legacyPathForFactorPackWithId:namespaceName:", v11, v12);
  *(_QWORD *)&v63 = objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    v15 = -[TRIFBFactorPackStorage initWithPaths:]([TRIFBFactorPackStorage alloc], "initWithPaths:", self->_paths);
    -[TRIFBFactorPackStorage pathForFactorLevelsWithFactorPackId:namespaceName:](v15, "pathForFactorLevelsWithFactorPackId:namespaceName:", v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIFBFactorPackStorage legacyPathForFactorLevelsWithFactorPackId:namespaceName:](v15, "legacyPathForFactorLevelsWithFactorPackId:namespaceName:", v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    if (*((_QWORD *)&v63 + 1) && v16)
      v18 = objc_msgSend(*((id *)&v63 + 1), "isEqualToString:", v16);
    v19 = 0;
    if ((_QWORD)v63 && v17 && (v20 = objc_msgSend((id)v63, "isEqualToString:", v17), v19 = v20, (v18 & v20 & 1) != 0))
    {
      if (!_os_feature_enabled_impl())
      {
LABEL_20:

        goto LABEL_21;
      }
      v21 = v16;

      v22 = v63;
      *(_QWORD *)&v63 = v17;
      *((_QWORD *)&v63 + 1) = v21;
    }
    else
    {
      if ((v18 & 1) == 0)
      {
        TRILogCategory_Server();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v83 = v11;
          v84 = 2112;
          v85 = (id)*((_QWORD *)&v63 + 1);
          v86 = 2112;
          v87 = v16;
          _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "pb and factor paths do not match for factor pack id:%@, pb path:%@, fb path:%@", buf, 0x20u);
        }

      }
      if ((v19 & 1) != 0)
        goto LABEL_20;
      TRILogCategory_Server();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v83 = v11;
        v84 = 2112;
        v85 = (id)v63;
        v86 = 2112;
        v87 = v17;
        _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "pb and  factor paths do not match for factor pack id:%@, pb path:%@, fb path:%@", buf, 0x20u);
      }
    }

    goto LABEL_20;
  }
LABEL_21:
  if (v63 == 0)
  {
    v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v80 = *MEMORY[0x1E0CB2D50];
    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FactorPackId %@ unknown"), v11);
    v81 = v62;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v28);
    v35 = 0;
    v31 = (id)v73[5];
    v73[5] = v37;
    goto LABEL_47;
  }
  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), CFSTR("v2/promotion"), v12);
  objc_msgSend(v24, "stringByAppendingPathComponent:", v25);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v62, "stringByAppendingPathComponent:", CFSTR("promoted"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v26;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 1363, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("existingPromotedPath"));

  }
  v29 = objc_msgSend(v27, "fileExistsAtPath:", v28);

  if (!v29)
  {
LABEL_34:
    v38 = (void *)*((_QWORD *)&v63 + 1);
    if (!*((_QWORD *)&v63 + 1))
      v38 = (void *)v63;
    v31 = v38;
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B50]), "initWithDir:", v31);
    if (v59)
    {
      v39 = [TRITempDirScopeGuard alloc];
      -[TRIPaths localTempDir](self->_paths, "localTempDir");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[TRITempDirScopeGuard initWithPath:](v39, "initWithPath:", v40);

      if (!v41)
      {
        v35 = 0;
        goto LABEL_46;
      }
      -[TRITempDirScopeGuard path](v41, "path");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_alloc(MEMORY[0x1E0CB3940]);
      v44 = (void *)objc_opt_new();
      objc_msgSend(v44, "UUIDString");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR("fp-promotion-%@"), v45);
      objc_msgSend(v42, "stringByAppendingPathComponent:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __92__TRINamespaceResolverStorage_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke;
      v64[3] = &unk_1E9331658;
      v65 = v62;
      v48 = v47;
      v66 = v48;
      v71 = &v72;
      v67 = *((id *)&v63 + 1);
      v49 = (id)v63;
      v68 = v49;
      v58 = v11;
      v69 = v58;
      v50 = v12;
      v70 = v50;
      v35 = __92__TRINamespaceResolverStorage_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke((uint64_t)v64);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "triForceRemoveItemAtPath:error:", v48, 0);

      objc_msgSend(v59, "unlock");
      if ((v35 & 1) == 0)
      {
        TRILogCategory_Server();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v83 = v58;
          v84 = 2114;
          v85 = v50;
          _os_log_error_impl(&dword_1D207F000, v52, OS_LOG_TYPE_ERROR, "Failed to promote factor pack %{public}@ for namespace %{public}@", buf, 0x16u);
        }

      }
      v53 = v65;
    }
    else
    {
      v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v78 = *MEMORY[0x1E0CB2D50];
      v41 = (TRITempDirScopeGuard *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to lock %@"), v31);
      v79 = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v48 = (id)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v48);
      v35 = 0;
      v53 = (void *)v73[5];
      v73[5] = v55;
    }

LABEL_46:
    goto LABEL_47;
  }
  objc_msgSend(v28, "triStringByResolvingSymlinksInPath");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v30)
  {
LABEL_33:

    goto LABEL_34;
  }
  objc_msgSend(v30, "lastPathComponent");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  TRIValidateFactorPackId();
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33 || !objc_msgSend(v33, "isEqualToString:", v11))
  {

    goto LABEL_33;
  }
  TRILogCategory_Server();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v83 = v11;
    v84 = 2114;
    v85 = v12;
    _os_log_impl(&dword_1D207F000, v34, OS_LOG_TYPE_DEFAULT, "Skipping promotion of factor pack %{public}@ for namespace %{public}@ as it is already promoted", buf, 0x16u);
  }

  v35 = 1;
LABEL_47:

  _Block_object_dispose(&v72, 8);
  return v35;
}

uint64_t __92__TRINamespaceResolverStorage_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (**v12)(_QWORD, _QWORD);
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[2];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = *(_QWORD *)(a1 + 40);
  v38[0] = *(_QWORD *)(a1 + 32);
  v38[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (!objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v8))
        {
          v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0CB2D50];
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to create %@"), v8);
          v37 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v19);
          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v22 = *(void **)(v21 + 40);
          *(_QWORD *)(v21 + 40) = v20;

          v16 = 0;
          goto LABEL_19;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      if (v5)
        continue;
      break;
    }
  }

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __92__TRINamespaceResolverStorage_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke_2;
  v24[3] = &unk_1E9331630;
  v25 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 80);
  v26 = v9;
  v27 = v10;
  v11 = MEMORY[0x1D8232C48](v24);
  v12 = (unsigned int (**)(_QWORD, _QWORD))v11;
  if (*(_QWORD *)(a1 + 48)
    && !(*(unsigned int (**)(uint64_t, const __CFString *))(v11 + 16))(v11, CFSTR("promoted"))
    || *(_QWORD *)(a1 + 56)
    && !((unsigned int (**)(_QWORD, const __CFString *))v12)[2](v12, CFSTR("legacyPromoted")))
  {
    v16 = 0;
  }
  else
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 64);
      v15 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 138543618;
      v33 = v14;
      v34 = 2114;
      v35 = v15;
      _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Promoted factor pack %{public}@ for namespace %{public}@", buf, 0x16u);
    }

    v16 = 1;
  }

  v3 = v25;
LABEL_19:

  return v16;
}

uint64_t __92__TRINamespaceResolverStorage_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:](TRIReferenceManagedDir, "symlinkFromCurrentPath:withFuturePath:toManagedPath:", v8, v9, v5))
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB3620], "triRenameOrFaultWithSourcePath:destPath:", v8, v9);
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to symlink to %@ for %@ from %@"), v8, v9, v5, v18);
    v19[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v13);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v10 = 0;
  }

  return v10;
}

- (BOOL)removeUnneededPromotionsWithRemovedCount:(unsigned int *)a3 removeAll:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  SEL v31;
  void *v32;
  void *context;
  TRINamespaceResolverStorage *v34;
  void *v35;
  id obj;
  uint64_t v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D8232A5C]();
  v34 = self;
  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("v2/promotion"));
  v7 = objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = 1;
  v35 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *MEMORY[0x1E0C999D0];
  v51[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v9;
  objc_msgSend(v10, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v13)
  {
    v14 = v13;
    v31 = a2;
    v15 = *(_QWORD *)v43;
    v8 = 1;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1D8232A5C]();
        v40 = 0;
        v41 = 0;
        v19 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v41, v39, &v40);
        v20 = v41;
        v21 = v40;
        if ((v19 & 1) == 0)
        {
          TRILogCategory_Server();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v47 = v17;
            v48 = 2114;
            v49 = v21;
            _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Failed to determine if %{public}@ is a directory: %{public}@", buf, 0x16u);
          }

          objc_autoreleasePoolPop(v18);
          LOBYTE(v8) = 0;
          goto LABEL_25;
        }
        if (objc_msgSend(v20, "BOOLValue"))
        {
          objc_msgSend(v17, "lastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v31, v34, CFSTR("TRINamespaceResolverStorage.m"), 1480, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("dirEntry.lastPathComponent"));

          }
          if (a4
            || (objc_msgSend(MEMORY[0x1E0DC0AE8], "factorProviderWithPaths:namespaceName:", v34->_paths, v22),
                v23 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v23, "providerForTreatmentLayer:", 2),
                v24 = (void *)objc_claimAutoreleasedReturnValue(),
                v24,
                v23,
                !v24))
          {
            TRILogCategory_Server();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v47 = v22;
              _os_log_impl(&dword_1D207F000, v25, OS_LOG_TYPE_DEFAULT, "Removing promotion dir for %{public}@", buf, 0xCu);
            }

            objc_msgSend(v35, "stringByAppendingPathComponent:", v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v8 &= objc_msgSend(v27, "triForceRemoveItemAtPath:error:", v26, 0);

            if (a3 && v8)
              ++*a3;

          }
        }

        objc_autoreleasePoolPop(v18);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_25:

  objc_autoreleasePoolPop(context);
  return v8 & 1;
}

- (BOOL)rewriteBMLTDeployment:(id)a3 targetedFactorPackSetId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  TRIFactorPackSetStorage *v11;
  id v12;
  NSObject *v13;
  TRITempDirScopeGuard *v14;
  void *v15;
  TRITempDirScopeGuard *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 1509, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  objc_msgSend(v7, "backgroundMLTaskId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 1511, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

    }
    v11 = -[TRIFactorPackSetStorage initWithPaths:]([TRIFactorPackSetStorage alloc], "initWithPaths:", self->_paths);
    v40 = 0;
    if (-[TRIFactorPackSetStorage hasFactorPackSetWithId:path:](v11, "hasFactorPackSetWithId:path:", v8, &v40))
    {
      if (!v40)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 1521, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetPath"));

      }
      v12 = objc_alloc(MEMORY[0x1E0DC0B50]);
      v13 = objc_msgSend(v12, "initWithDir:", v40);
      if (v13)
      {
        v14 = [TRITempDirScopeGuard alloc];
        -[TRIPaths localTempDir](self->_paths, "localTempDir");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[TRITempDirScopeGuard initWithPath:](v14, "initWithPath:", v15);

        if (!v16)
        {
          v24 = 0;
LABEL_26:

          -[NSObject unlock](v13, "unlock");
          goto LABEL_27;
        }
        -[TRINamespaceResolverStorage pathForBMLTDeployment:](self, "pathForBMLTDeployment:", v7);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          -[TRITempDirScopeGuard path](v16, "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_alloc(MEMORY[0x1E0CB3940]);
          v19 = (void *)objc_opt_new();
          objc_msgSend(v19, "UUIDString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("targeting-link-%@"), v20);
          objc_msgSend(v17, "stringByAppendingPathComponent:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "stringByAppendingPathComponent:", CFSTR("targetedFactorPackSet"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:](TRIReferenceManagedDir, "symlinkFromCurrentPath:withFuturePath:toManagedPath:", v22, v23, v40))
          {
LABEL_13:
            v24 = objc_msgSend(MEMORY[0x1E0CB3620], "triRenameOrFaultWithSourcePath:destPath:", v22, v23);
LABEL_25:

            goto LABEL_26;
          }
        }
        else
        {
          -[TRITempDirScopeGuard path](v16, "path");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_alloc(MEMORY[0x1E0CB3940]);
          v26 = (void *)objc_opt_new();
          objc_msgSend(v26, "UUIDString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("new-deployment-%@"), v27);
          objc_msgSend(v38, "stringByAppendingPathComponent:", v28);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[TRINamespaceResolverStorage _pathForBMLTDeployment:](self, "_pathForBMLTDeployment:", v7);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v22);
            v29 = (void *)MEMORY[0x1E0CB3620];
            objc_msgSend(v23, "stringByDeletingLastPathComponent");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "triIdempotentCreateDirectoryOrFaultWithPath:", v30);

            objc_msgSend(v22, "stringByAppendingPathComponent:", CFSTR("targetedFactorPackSet"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringByAppendingPathComponent:", CFSTR("targetedFactorPackSet"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v29) = +[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:](TRIReferenceManagedDir, "symlinkFromCurrentPath:withFuturePath:toManagedPath:", v31, v32, v40);

            if ((v29 & 1) != 0)
            {
              if (+[TRIReferenceManagedDir createFromDir:](TRIReferenceManagedDir, "createFromDir:", v22))
                goto LABEL_13;
            }
          }
        }
        v24 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "shortDesc");
        v34 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v34;
        v43 = 2114;
        v44 = v8;
        _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Unable to update BMLT %{public}@; targeted factor pack set %{public}@ is missing.",
          buf,
          0x16u);

      }
    }
    v24 = 0;
LABEL_27:

    goto LABEL_28;
  }
  TRILogCategory_Server();
  v11 = (TRIFactorPackSetStorage *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v42 = "-[TRINamespaceResolverStorage rewriteBMLTDeployment:targetedFactorPackSetId:]";
    _os_log_error_impl(&dword_1D207F000, &v11->super, OS_LOG_TYPE_ERROR, "%s has empty path arg: deployment.backgroundMLTaskId", buf, 0xCu);
  }
  v24 = 0;
LABEL_28:

  return v24 & 1;
}

- (id)parentDirForBMLTDeployments
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("v2/bmlt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)_pathForBMLTDeployment:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 1585, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  objc_msgSend(v5, "backgroundMLTaskId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D8232A5C]();
    -[TRINamespaceResolverStorage parentDirForBMLTDeployments](self, "parentDirForBMLTDeployments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v5, "backgroundMLTaskId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@/%d"), v11, objc_msgSend(v5, "deploymentId"));
    objc_msgSend(v9, "stringByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[TRINamespaceResolverStorage _pathForBMLTDeployment:]";
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: deployment.backgroundMLTaskId", buf, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (id)pathForBMLTDeployment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TRINamespaceResolverStorage _pathForBMLTDeployment:](self, "_pathForBMLTDeployment:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "fileExistsAtPath:", v3))
      v5 = v3;
    else
      v5 = 0;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pathForTargetedFactorPackSetWithTaskDeployment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TRINamespaceResolverStorage pathForBMLTDeployment:](self, "pathForBMLTDeployment:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("targetedFactorPackSet"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_removeUnreferencedBMLTDeploymentsWithRefStore:(id)a3 topLevelDir:(id)a4 removedCount:(unsigned int *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v22;
  SEL v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  unsigned int *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, 0, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  v15 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v13, "nextObject");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    v23 = a2;
    do
    {
      objc_msgSend(v17, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v23, self, CFSTR("TRINamespaceResolverStorage.m"), 1625, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

      }
      objc_msgSend(v14, "addString:", v18);

      objc_autoreleasePoolPop(v15);
      v15 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v13, "nextObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v17);
  }
  objc_autoreleasePoolPop(v15);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __103__TRINamespaceResolverStorage__removeUnreferencedBMLTDeploymentsWithRefStore_topLevelDir_removedCount___block_invoke;
  v24[3] = &unk_1E9331518;
  v26 = &v28;
  v24[4] = self;
  v19 = v9;
  v25 = v19;
  v27 = a5;
  if (objc_msgSend(v14, "enumerateStringsWithBlock:", v24))
    v20 = *((_BYTE *)v29 + 24) != 0;
  else
    v20 = 0;

  _Block_object_dispose(&v28, 8);
  return v20;
}

uint64_t __103__TRINamespaceResolverStorage__removeUnreferencedBMLTDeploymentsWithRefStore_topLevelDir_removedCount___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = objc_msgSend(*(id *)(a1 + 32), "_removeUnreferencedDeploymentsWithRefStore:parentDir:removedCount:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 56));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v4 + 24))
    v5 = result;
  else
    v5 = 0;
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

- (BOOL)_removeUnreferencedBMLTDeploymentsWithRefStore:(id)a3 parentDir:(id)a4 removedCount:(unsigned int *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  TRITempDirScopeGuard *v19;
  void *v20;
  TRITempDirScopeGuard *v21;
  int v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  TRITempDirScopeGuard *v27;
  uint64_t *v28;
  unsigned int *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, 0, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
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
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolverStorage.m"), 1654, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

      }
      objc_msgSend(v14, "addString:", v18);

      objc_autoreleasePoolPop(v15);
      v15 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v13, "nextObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v17);
  }
  objc_autoreleasePoolPop(v15);
  v19 = [TRITempDirScopeGuard alloc];
  -[TRIPaths localTempDir](self->_paths, "localTempDir");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[TRITempDirScopeGuard initWithPath:](v19, "initWithPath:", v20);

  if (v21)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 1;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __101__TRINamespaceResolverStorage__removeUnreferencedBMLTDeploymentsWithRefStore_parentDir_removedCount___block_invoke;
    v25[3] = &unk_1E9331518;
    v28 = &v30;
    v26 = v9;
    v27 = v21;
    v29 = a5;
    v22 = objc_msgSend(v14, "enumerateStringsWithBlock:", v25);
    rmdir((const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"));
    if (v22)
      LOBYTE(v22) = *((_BYTE *)v31 + 24) != 0;

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  return v22;
}

void __101__TRINamespaceResolverStorage__removeUnreferencedBMLTDeploymentsWithRefStore_parentDir_removedCount___block_invoke(uint64_t a1, void *a2)
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
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[TRIReferenceManagedDir collectGarbageForManagedDir:withExternalReferenceStore:usingTempDir:managedDirWasDeleted:](TRIReferenceManagedDir, "collectGarbageForManagedDir:withExternalReferenceStore:usingTempDir:managedDirWasDeleted:", v5, v3, v6, &v10);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v8 + 24))
    v9 = v7;
  else
    v9 = 0;
  *(_BYTE *)(v8 + 24) = v9;

  if (v10)
    ++**(_DWORD **)(a1 + 56);
}

- (BOOL)removeUnreferencedBMLTDeploymentsWithServerContext:(id)a3 removedCount:(unsigned int *)a4
{
  id v6;
  TRIBMLTDeploymentRefStore *v7;
  void *v8;
  BOOL v9;
  unsigned int v11;

  v6 = a3;
  v7 = -[TRIBMLTDeploymentRefStore initWithServerContext:]([TRIBMLTDeploymentRefStore alloc], "initWithServerContext:", v6);

  v11 = 0;
  -[TRINamespaceResolverStorage parentDirForBMLTDeployments](self, "parentDirForBMLTDeployments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TRINamespaceResolverStorage _removeUnreferencedDeploymentsWithRefStore:topLevelDir:removedCount:](self, "_removeUnreferencedDeploymentsWithRefStore:topLevelDir:removedCount:", v7, v8, &v11);

  if (a4)
    *a4 = v11;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
