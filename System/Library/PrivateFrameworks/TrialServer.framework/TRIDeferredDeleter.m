@implementation TRIDeferredDeleter

- (id)initForRootDir:(id)a3
{
  id v4;
  TRIDeferredDeleter *v5;
  uint64_t v6;
  NSString *rootDir;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIDeferredDeleter;
  v5 = -[TRIDeferredDeleter init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stringByStandardizingPath");
    v6 = objc_claimAutoreleasedReturnValue();
    rootDir = v5->_rootDir;
    v5->_rootDir = (NSString *)v6;

  }
  return v5;
}

- (BOOL)markItemAtRelativePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  -[NSString stringByAppendingPathComponent:](self->_rootDir, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByStandardizingPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", self->_rootDir);

  if (v8)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543362;
      v16 = v6;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Cannot mark root directory %{public}@ for deferred deletion", (uint8_t *)&v15, 0xCu);
    }
    v10 = 0;
  }
  else
  {
    -[TRIDeferredDeleter _deferredDeletedLinksDir](self, "_deferredDeletedLinksDir");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", v4);
    v9 = objc_claimAutoreleasedReturnValue();

    -[NSObject stringByDeletingLastPathComponent](v9, "stringByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v12)
      && objc_msgSend((id)objc_opt_class(), "_createSymlinkIfNonExistentAtPath:withDestinationPath:", v9, v6))
    {
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v15 = 138543362;
        v16 = v6;
        _os_log_debug_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEBUG, "Marked %{public}@ for deferred deletion", (uint8_t *)&v15, 0xCu);
      }

      v10 = 1;
    }
    else
    {
      v10 = 0;
    }

  }
  objc_autoreleasePoolPop(v5);

  return v10;
}

+ (BOOL)_createSymlinkIfNonExistentAtPath:(id)a3 withDestinationPath:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  int *v12;
  char *v13;
  int v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_retainAutorelease(a4);
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
  v8 = objc_retainAutorelease(v5);
  if (symlink(v7, (const char *)objc_msgSend(v8, "fileSystemRepresentation")) && *__error() != 17)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = __error();
      v13 = strerror(*v12);
      v14 = *__error();
      v15 = 138544130;
      v16 = v8;
      v17 = 2114;
      v18 = v6;
      v19 = 2080;
      v20 = v13;
      v21 = 1024;
      v22 = v14;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Failed to create symlink %{public}@ --> %{public}@: %s (%d)", (uint8_t *)&v15, 0x26u);
    }

    v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)unmarkItemAtRelativePath:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  int *v12;
  char *v13;
  int v14;
  int v15;
  NSObject *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSString stringByAppendingPathComponent:](self->_rootDir, "stringByAppendingPathComponent:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  -[NSObject stringByStandardizingPath](v5, "stringByStandardizingPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", self->_rootDir);

  if (v7)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543362;
      v16 = v5;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Cannot unmark root directory %{public}@ for deferred deletion", (uint8_t *)&v15, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    -[TRIDeferredDeleter _linkPathForDeferredDeletedItemAtPath:](self, "_linkPathForDeferredDeletedItemAtPath:", v4);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (unlink((const char *)-[NSObject fileSystemRepresentation](v8, "fileSystemRepresentation")) && *__error() != 2)
    {
      TRILogCategory_Server();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = __error();
        v13 = strerror(*v12);
        v14 = *__error();
        v15 = 138543874;
        v16 = v8;
        v17 = 2080;
        v18 = v13;
        v19 = 1024;
        v20 = v14;
        _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Failed to unmark item for deferred deletion at path %{public}@: %s (%d)", (uint8_t *)&v15, 0x1Cu);
      }
      v9 = 0;
    }
    else
    {
      TRILogCategory_Server();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v15 = 138543362;
        v16 = v8;
        _os_log_debug_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEBUG, "Removed deferred deletion mark %{public}@", (uint8_t *)&v15, 0xCu);
      }
      v9 = 1;
    }

  }
  return v9;
}

- (BOOL)collectGarbageWithRootDirLockWitness:(TRIFlockWitness_ *)a3 externalReferenceStore:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  char v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  NSString *rootDir;
  char v16;
  NSObject *v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  int *v25;
  char *v26;
  int v27;
  int *v28;
  char *v29;
  int v30;
  int *v31;
  char *v32;
  int v33;
  uint8_t v34[16];
  uint8_t buf[4];
  NSString *v36;
  __int16 v37;
  char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[TRIDeferredDeleter _deferredDeletedLinksDir](self, "_deferredDeletedLinksDir");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0);
  if ((v7 & 0x80000000) == 0)
  {
    v8 = v7;
    if (flock(v7, 6))
    {
      if (*__error() == 35)
      {
        TRILogCategory_Server();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v36 = (NSString *)v6;
          _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "Unable to lock deferred deleted items directory %{public}@, skipping garbage collecting deferred deleted items", buf, 0xCu);
        }

        v10 = 2;
        v11 = 1;
      }
      else
      {
        TRILogCategory_Server();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v25 = __error();
          v26 = strerror(*v25);
          v27 = *__error();
          *(_DWORD *)buf = 138543874;
          v36 = (NSString *)v6;
          v37 = 2080;
          v38 = v26;
          v39 = 1024;
          v40 = v27;
          _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Unable to acquire exclusive lock on deferred deleted items dir %{public}@: %s (%d)", buf, 0x1Cu);
        }

        v11 = 0;
        v10 = 2;
      }
LABEL_31:
      close(v8);
      v16 = v11 | (v10 == 0);
      goto LABEL_32;
    }
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = (NSString *)v6;
      _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Running garbage collection on deferred deleted items in dir %{public}@", buf, 0xCu);
    }

    *(_DWORD *)buf = v8;
    if (-[TRIDeferredDeleter _cleanupWithLinksDirLockWitness:externalReferenceStore:](self, "_cleanupWithLinksDirLockWitness:externalReferenceStore:", buf, v5))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "triRemoveNestedEmptyDirectoriesAtPath:", v6);

      if ((v19 & 1) != 0)
      {
        v10 = 0;
LABEL_26:
        if (flock(v8, 8))
        {
          TRILogCategory_Server();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v31 = __error();
            v32 = strerror(*v31);
            v33 = *__error();
            *(_DWORD *)buf = 138543874;
            v36 = (NSString *)v6;
            v37 = 2080;
            v38 = v32;
            v39 = 1024;
            v40 = v33;
            _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "Unable to release exclusive lock on deferred deleted items dir %{public}@: %s (%d)", buf, 0x1Cu);
          }

        }
        v11 = 0;
        goto LABEL_31;
      }
      TRILogCategory_Server();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
LABEL_25:

        v10 = 1;
        goto LABEL_26;
      }
      *(_WORD *)v34 = 0;
      v22 = "Empty deferred link directories cleanup failed";
    }
    else
    {
      TRILogCategory_Server();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_WORD *)v34 = 0;
      v22 = "Deferred deleted items cleanup failed";
    }
    _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, v22, v34, 2u);
    goto LABEL_25;
  }
  v12 = *__error() == 2;
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      rootDir = self->_rootDir;
      *(_DWORD *)buf = 138543362;
      v36 = rootDir;
      _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "No deferred deleted items to garbage collect for root directory %{public}@", buf, 0xCu);
    }

    v16 = 1;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v28 = __error();
      v29 = strerror(*v28);
      v30 = *__error();
      *(_DWORD *)buf = 138543874;
      v36 = (NSString *)v6;
      v37 = 2080;
      v38 = v29;
      v39 = 1024;
      v40 = v30;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failed to open lock on dir %{public}@: %s (%d)", buf, 0x1Cu);
    }

    v16 = 0;
  }
LABEL_32:

  return v16 & 1;
}

- (BOOL)_cleanupWithLinksDirLockWitness:(TRIFlockWitness_ *)a3 externalReferenceStore:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  TRIDeferredDeleter *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a4;
  -[TRIDeferredDeleter _collectRelativeLinkPathsWithLinksDirLockWitness:](self, "_collectRelativeLinkPathsWithLinksDirLockWitness:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 1;
    -[TRIDeferredDeleter _deferredDeletedLinksDir](self, "_deferredDeletedLinksDir");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__TRIDeferredDeleter__cleanupWithLinksDirLockWitness_externalReferenceStore___block_invoke;
    v12[3] = &unk_1E9333B18;
    v9 = v8;
    v13 = v9;
    v14 = self;
    v15 = v6;
    v16 = &v17;
    if (objc_msgSend(v7, "enumerateStringsWithBlock:", v12))
      v10 = *((_BYTE *)v18 + 24) != 0;
    else
      v10 = 0;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __77__TRIDeferredDeleter__cleanupWithLinksDirLockWitness_externalReferenceStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (!objc_msgSend((id)objc_opt_class(), "_removeDeferredDeletedItemWithLink:externalReferenceStore:wasDeleted:", v4, *(_QWORD *)(a1 + 48), &v5)|| v5 && (objc_msgSend(*(id *)(a1 + 40), "unmarkItemAtRelativePath:", v3) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (id)_collectRelativeLinkPathsWithLinksDirLockWitness:(TRIFlockWitness_ *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D8232A5C](self, a2, a3);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIDeferredDeleter _deferredDeletedLinksDir](self, "_deferredDeletedLinksDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratorAtPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v7, "nextObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v12 = (void *)v10;
      v13 = (void *)*MEMORY[0x1E0CB2B20];
      v14 = (void *)*MEMORY[0x1E0CB2B30];
      *(_QWORD *)&v11 = 138543362;
      v20 = v11;
      do
      {
        objc_msgSend(v7, "fileAttributes", v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "fileType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 == v13 || v16 == v14)
        {
          if (v16 == v14 && (objc_msgSend(v8, "addString:", v12) & 1) == 0)
          {

            objc_autoreleasePoolPop(v9);
            goto LABEL_14;
          }
        }
        else
        {
          TRILogCategory_Server();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v22 = v12;
            _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Found unexpected non symbolic link file %{public}@", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v9);
        v9 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(v7, "nextObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      while (v12);
    }
    objc_autoreleasePoolPop(v9);
    v18 = v8;
  }
  else
  {
LABEL_14:
    v18 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v18;
}

+ (BOOL)_removeDeferredDeletedItemWithLink:(id)a3 externalReferenceStore:(id)a4 wasDeleted:(BOOL *)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  *a5 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "triTargetPathForSymlink:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v7;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Found deferred deletion symlink with path %{public}@ with no valid target", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (v8 && objc_msgSend(v8, "hasReferenceToPath:", v9))
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v7;
      _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Deferred Deletion garbage collection found a nonzero external reference count for path: %{public}@", buf, 0xCu);
    }
    v11 = 1;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v13 = objc_msgSend(v12, "triForceRemoveItemAtPath:error:", v9, &v17);
  v10 = v17;

  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Failed to remove path %{public}@ marked for deferred deletion: %{public}@", buf, 0x16u);
    }

LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v9;
    _os_log_debug_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEBUG, "Deleted deferred item %{public}@", buf, 0xCu);
  }

  v11 = 1;
  *a5 = 1;
LABEL_17:

  return v11;
}

- (id)_linkPathForDeferredDeletedItemAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TRIDeferredDeleter _deferredDeletedLinksDir](self, "_deferredDeletedLinksDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_deferredDeletedLinksDir
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  -[NSString stringByAppendingPathComponent:](self->_rootDir, "stringByAppendingPathComponent:", CFSTR("_deferredDeletedLinks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootDir, 0);
}

@end
