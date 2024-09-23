@implementation TRINamespaceDescriptorSetStorage

- (TRINamespaceDescriptorSetStorage)initWithPaths:(id)a3
{
  id v5;
  TRINamespaceDescriptorSetStorage *v6;
  TRINamespaceDescriptorSetStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRINamespaceDescriptorSetStorage;
  v6 = -[TRINamespaceDescriptorSetStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_paths, a3);

  return v7;
}

- (BOOL)overwriteNamespaceDescriptors:(id)a3 forTreatmentId:(id)a4
{
  TRITempDirScopeGuard *v6;
  void *v7;
  TRITempDirScopeGuard *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  BOOL v31;
  void *v32;
  id v34;
  id v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  _QWORD v51[2];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v34 = a4;
  -[TRINamespaceDescriptorSetStorage pathForNamespaceDescriptorsWithTreatmentId:](self, "pathForNamespaceDescriptorsWithTreatmentId:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v6 = [TRITempDirScopeGuard alloc];
    -[TRIPaths localTempDir](self->_paths, "localTempDir");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TRITempDirScopeGuard initWithPath:](v6, "initWithPath:", v7);

    if (v8)
    {
      -[TRITempDirScopeGuard path](v8, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("ns-desc-set-%@"), v12);
      objc_msgSend(v9, "stringByAppendingPathComponent:", v13);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      objc_msgSend(v36, "stringByDeletingLastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v14;
      objc_msgSend(v37, "stringByAppendingPathComponent:", CFSTR("legacyNamespaceDescriptors"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v43;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v43 != v18)
              objc_enumerationMutation(v16);
            if (!objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i)))
            {

              v31 = 0;
              goto LABEL_34;
            }
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          if (v17)
            continue;
          break;
        }
      }

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v20 = v35;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v39;
        while (2)
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v39 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
            v25 = (void *)MEMORY[0x1D8232A5C]();
            objc_msgSend(v37, "stringByAppendingPathComponent:", CFSTR("legacyNamespaceDescriptors"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v24, "saveToDirectory:", v26);

            if ((v27 & 1) == 0)
            {
              TRILogCategory_Server();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v47 = v34;
                _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "Failed to save namespace descriptor set for treatment %@.", buf, 0xCu);
              }

            }
            objc_autoreleasePoolPop(v25);
            if (!v27)
            {

              goto LABEL_32;
            }
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          if (v21)
            continue;
          break;
        }
      }

      if (+[TRIReferenceManagedDir createFromDir:](TRIReferenceManagedDir, "createFromDir:", v37)
        && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v29, "triForceRemoveItemAtPath:error:", v36, 0),
            v29,
            objc_msgSend(MEMORY[0x1E0CB3620], "triRenameOrFaultWithSourcePath:destPath:", v37, v36)))
      {
        TRILogCategory_Server();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v47 = v34;
          v48 = 2112;
          v49 = v36;
          _os_log_impl(&dword_1D207F000, v30, OS_LOG_TYPE_DEFAULT, "Wrote namespace descriptor set %@ --> %@", buf, 0x16u);
        }

        v31 = 1;
      }
      else
      {
LABEL_32:
        v31 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "triForceRemoveItemAtPath:error:", v37, 0);

LABEL_34:
    }
    else
    {
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)pathForNamespaceDescriptorsWithTreatmentId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "triIsPathSafePlausibleUniqueId") & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1D8232A5C]();
    -[TRINamespaceDescriptorSetStorage parentDirForNamespaceDescriptorSets](self, "parentDirForNamespaceDescriptorSets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Rejecting use of bad treatmentId: \"%@\", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)parentDirForNamespaceDescriptorSets
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("v2/namespaceDescriptorSets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)hasNamespaceDescriptorsForTreatmentWithId:(id)a3 path:(id *)a4
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDescriptorSetStorage.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId"));

  }
  -[TRINamespaceDescriptorSetStorage pathForNamespaceDescriptorsWithTreatmentId:](self, "pathForNamespaceDescriptorsWithTreatmentId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a4)
      objc_storeStrong(a4, v8);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_collectNamespaceDescriptorSets
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
    -[TRINamespaceDescriptorSetStorage parentDirForNamespaceDescriptorSets](self, "parentDirForNamespaceDescriptorSets");
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
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDescriptorSetStorage.m"), 204, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

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

- (BOOL)removeUnreferencedNamespaceDescriptorSetsWithServerContext:(id)a3 removedCount:(unsigned int *)a4
{
  id v7;
  void *v8;
  TRITempDirScopeGuard *v9;
  void *v10;
  TRITempDirScopeGuard *v11;
  TRINamespaceDescriptorSetExternalRefStore *v12;
  TRINamespaceDescriptorSetExternalRefStore *v13;
  int v14;
  BOOL v15;
  void *v17;
  _QWORD v18[4];
  TRINamespaceDescriptorSetExternalRefStore *v19;
  TRITempDirScopeGuard *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceDescriptorSetStorage.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

  }
  -[TRINamespaceDescriptorSetStorage _collectNamespaceDescriptorSets](self, "_collectNamespaceDescriptorSets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [TRITempDirScopeGuard alloc];
    -[TRIPaths localTempDir](self->_paths, "localTempDir");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRITempDirScopeGuard initWithPath:](v9, "initWithPath:", v10);

    if (v11)
    {
      v12 = -[TRINamespaceDescriptorSetExternalRefStore initWithServerContext:]([TRINamespaceDescriptorSetExternalRefStore alloc], "initWithServerContext:", v7);
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 0;
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 1;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __108__TRINamespaceDescriptorSetStorage_removeUnreferencedNamespaceDescriptorSetsWithServerContext_removedCount___block_invoke;
      v18[3] = &unk_1E932FE58;
      v21 = &v23;
      v13 = v12;
      v19 = v13;
      v20 = v11;
      v22 = &v27;
      v14 = objc_msgSend(v8, "enumerateStringsWithBlock:", v18);
      if (a4)
        *a4 = *((_DWORD *)v28 + 6);
      if (v14)
        v15 = *((_BYTE *)v24 + 24) != 0;
      else
        v15 = 0;

      _Block_object_dispose(&v23, 8);
      _Block_object_dispose(&v27, 8);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __108__TRINamespaceDescriptorSetStorage_removeUnreferencedNamespaceDescriptorSetsWithServerContext_removedCount___block_invoke(_QWORD *a1, void *a2)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
