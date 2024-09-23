@implementation TRITempDirScopeGuard

+ (id)refCountsLock
{
  if (qword_1EFC74450 != -1)
    dispatch_once(&qword_1EFC74450, &__block_literal_global_26);
  return (id)_MergedGlobals_43;
}

void __37__TRITempDirScopeGuard_refCountsLock__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1D8232A5C]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)_MergedGlobals_43;
  _MergedGlobals_43 = v3;

  objc_autoreleasePoolPop(v0);
}

- (TRITempDirScopeGuard)initWithPath:(id)a3
{
  id v5;
  TRITempDirScopeGuard *v6;
  TRITempDirScopeGuard *v7;
  void *v8;
  TRITempDirScopeGuard *v9;
  TRITempDirScopeGuard *v10;
  _QWORD v12[4];
  id v13;
  TRITempDirScopeGuard *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TRITempDirScopeGuard;
  v6 = -[TRITempDirScopeGuard init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    objc_msgSend((id)objc_opt_class(), "refCountsLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__TRITempDirScopeGuard_initWithPath___block_invoke;
    v12[3] = &unk_1E93359C0;
    v13 = v5;
    v15 = &v16;
    v9 = v7;
    v14 = v9;
    objc_msgSend(v8, "runWithLockAcquired:", v12);
    if (!*((_BYTE *)v17 + 24))
    {
      v9->_isDisposed = 1;

      _Block_object_dispose(&v16, 8);
      v10 = 0;
      goto LABEL_6;
    }

    _Block_object_dispose(&v16, 8);
  }
  v10 = v7;
LABEL_6:

  return v10;
}

void __37__TRITempDirScopeGuard_initWithPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  char *v15;
  int *v16;
  char *v17;
  int v18;
  int v19;
  char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  char v25[1024];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_13;
  }
  bzero(v25, 0x400uLL);
  *__error() = 0;
  v4 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation"), v25);
  if (!v4)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = *(char **)(a1 + 32);
      v16 = __error();
      v17 = strerror(*v16);
      v18 = *__error();
      v19 = 138543874;
      v20 = v15;
      v21 = 2080;
      v22 = v17;
      v23 = 1024;
      v24 = v18;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Unable to canonicalize %{public}@: %s (%d)", (uint8_t *)&v19, 0x1Cu);
    }

    goto LABEL_12;
  }
  v5 = v4;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v4);
  if (!v6)
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315138;
      v20 = v5;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Canonicalized path is not Unicode: %s", (uint8_t *)&v19, 0xCu);
    }

    goto LABEL_12;
  }
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v6;

  objc_msgSend(*(id *)(a1 + 40), "canonicalPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "intValue") + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "canonicalPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "canonicalPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9363F90, v11);
  }

LABEL_13:
}

- (BOOL)dispose
{
  void *v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  objc_msgSend((id)objc_opt_class(), "refCountsLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__TRITempDirScopeGuard_dispose__block_invoke;
  v6[3] = &unk_1E93359E8;
  v6[5] = &v7;
  v6[6] = a2;
  v6[4] = self;
  objc_msgSend(v4, "runWithLockAcquired:", v6);
  LOBYTE(a2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)a2;
}

void __31__TRITempDirScopeGuard_dispose__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_BYTE **)(a1 + 32);
  if (!v4[8])
  {
    objc_msgSend(v4, "canonicalPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRITempDirScopeGuard.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prevRefCountBoxed != nil"));

    }
    v7 = objc_msgSend(v6, "intValue");
    if (v7 > 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v7 - 1));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "canonicalPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v16);

    }
    else
    {
      TRILogCategory_Server();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v9;
        _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_INFO, "TRITempDirScopeGuard cleaning up: %{public}@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "canonicalPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v10);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v13 = objc_msgSend(v11, "triForceRemoveItemAtPath:error:", v12, &v19);
      v14 = v19;

      if ((v13 & 1) == 0)
      {
        TRILogCategory_Server();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v21 = v17;
          v22 = 2114;
          v23 = v14;
          _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "TRITempDirScopeGuard failed to clean up \"%{public}@\": %{public}@", buf, 0x16u);

        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      }
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[TRITempDirScopeGuard dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)TRITempDirScopeGuard;
  -[TRITempDirScopeGuard dealloc](&v3, sel_dealloc);
}

+ (BOOL)ifUnreferencedCleanupPath:(id)a3
{
  id v3;
  TRITempDirScopeGuard *v4;
  BOOL v5;

  v3 = a3;
  v4 = -[TRITempDirScopeGuard initWithPath:]([TRITempDirScopeGuard alloc], "initWithPath:", v3);

  if (v4)
    v5 = -[TRITempDirScopeGuard dispose](v4, "dispose");
  else
    v5 = 0;

  return v5;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)canonicalPath
{
  return self->_canonicalPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalPath, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
