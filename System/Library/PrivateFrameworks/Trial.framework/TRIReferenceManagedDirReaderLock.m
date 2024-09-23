@implementation TRIReferenceManagedDirReaderLock

void __42__TRIReferenceManagedDirReaderLock_unlock__block_invoke(uint64_t a1, int *a2)
{
  int v2;
  int *v4;
  NSObject *v5;
  int *v6;
  char *v7;
  int v8;
  int v9;
  char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2[2];
  if ((v2 & 0x80000000) == 0)
  {
    v4 = a2;
    if (flock(v2, 8))
    {
      TRILogCategory_ClientFramework();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = __error();
        v7 = strerror(*v6);
        v8 = *__error();
        v9 = 136315394;
        v10 = v7;
        v11 = 1024;
        v12 = v8;
        _os_log_error_impl(&dword_19B89C000, v5, OS_LOG_TYPE_ERROR, "Unable to unlock managed-directory: %s (%d)", (uint8_t *)&v9, 0x12u);
      }

    }
    close(a2[2]);
    a2[2] = -1;

  }
}

- (void)unlock
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_13);
}

- (TRIReferenceManagedDirReaderLock)initWithDir:(id)a3
{
  id v6;
  TRIReferenceManagedDirReaderLock *v7;
  TRIReferenceManagedDirReaderLock *v8;
  NSString **p_dir;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  TRIReferenceManagedDirReaderLock *v14;
  _DWORD *v15;
  uint64_t v16;
  _PASLock *lock;
  NSString *v19;
  int *v20;
  char *v21;
  int v22;
  NSString *v23;
  int *v24;
  char *v25;
  int v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIReferenceManagedDirReaderLock.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dir"));

  }
  v28.receiver = self;
  v28.super_class = (Class)TRIReferenceManagedDirReaderLock;
  v7 = -[TRIReferenceManagedDirReaderLock init](&v28, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_14;
  p_dir = &v7->_dir;
  objc_storeStrong((id *)&v7->_dir, a3);
  v10 = open(-[NSString fileSystemRepresentation](v8->_dir, "fileSystemRepresentation"), 0x100000);
  if (v10 < 0)
  {
    TRILogCategory_ClientFramework();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v23 = *p_dir;
      v24 = __error();
      v25 = strerror(*v24);
      v26 = *__error();
      *(_DWORD *)buf = 138412802;
      v30 = v23;
      v31 = 2080;
      v32 = v25;
      v33 = 1024;
      v34 = v26;
      _os_log_error_impl(&dword_19B89C000, v13, OS_LOG_TYPE_ERROR, "Unable to open managed-directory \"%@\" to acquire lock: %s (%d)", buf, 0x1Cu);
    }

    goto LABEL_12;
  }
  v11 = v10;
  if (!flock(v10, 5))
  {
    v15 = (_DWORD *)objc_opt_new();
    v15[2] = v11;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v15);
    lock = v8->_lock;
    v8->_lock = (_PASLock *)v16;

LABEL_14:
    v14 = v8;
    goto LABEL_15;
  }
  TRILogCategory_ClientFramework();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v19 = *p_dir;
    v20 = __error();
    v21 = strerror(*v20);
    v22 = *__error();
    *(_DWORD *)buf = 138412802;
    v30 = v19;
    v31 = 2080;
    v32 = v21;
    v33 = 1024;
    v34 = v22;
    _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "Unable to acquire shared lock on managed-directory \"%@\": %s (%d)", buf, 0x1Cu);
  }

  close(v11);
LABEL_12:
  v14 = 0;
LABEL_15:

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[TRIReferenceManagedDirReaderLock unlock](self, "unlock");
  v3.receiver = self;
  v3.super_class = (Class)TRIReferenceManagedDirReaderLock;
  -[TRIReferenceManagedDirReaderLock dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_dir, 0);
}

@end
