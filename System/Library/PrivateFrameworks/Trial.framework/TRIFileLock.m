@implementation TRIFileLock

+ ($A5A652246548B43F8BC05201A1C72A70)acquireLockOnPath:(id)a3 fileLockMode:(id)a4 blocking:(BOOL)a5 andRunBlock:(id)a6
{
  _BOOL4 v7;
  id v10;
  void (**v11)(id, uint8_t *);
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  $A5A652246548B43F8BC05201A1C72A70 v21;
  NSObject *v22;
  int *v24;
  char *v25;
  int v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, uint8_t *))a6;
  v12 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(v10, "stringByAppendingString:", CFSTR(".lock"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(a1, "_lockingFlagsFromFileLockMode:", a4.var0);
  if (v7)
    v15 = v14;
  else
    v15 = v14 | 4;
  if (a4.var0 == 1)
  {
    v17 = (void *)MEMORY[0x1E0CB3620];
    objc_msgSend(v13, "stringByDeletingLastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v17, "triIdempotentCreateDirectoryOrFaultWithPath:", v18);

    if (!(_DWORD)v17)
      goto LABEL_18;
    v16 = open((const char *)objc_msgSend(objc_retainAutorelease(v13), "fileSystemRepresentation"), v15 | 0x200, 432);
  }
  else
  {
    if (a4.var0)
    {
LABEL_11:
      if (*__error() == 2)
      {
        v21.var0 = 1;
        goto LABEL_19;
      }
      if (*__error() == 35)
      {
        v21.var0 = 2;
        goto LABEL_19;
      }
      TRILogCategory_ClientFramework();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v24 = __error();
        v25 = strerror(*v24);
        v26 = *__error();
        *(_DWORD *)buf = 138412802;
        v28 = v10;
        v29 = 2080;
        v30 = v25;
        v31 = 1024;
        v32 = v26;
        _os_log_error_impl(&dword_19B89C000, v22, OS_LOG_TYPE_ERROR, "Failed to open lock on path %@: %s (%d)", buf, 0x1Cu);
      }

LABEL_18:
      v21.var0 = 3;
      goto LABEL_19;
    }
    v16 = open((const char *)objc_msgSend(objc_retainAutorelease(v13), "fileSystemRepresentation"), v15);
  }
  v19 = v16;
  if (v16 < 0)
    goto LABEL_11;
  v20 = (void *)MEMORY[0x1A1AC6B8C]();
  *(_DWORD *)buf = v19;
  v11[2](v11, buf);
  objc_autoreleasePoolPop(v20);
  close(v19);
  v21.var0 = 0;
LABEL_19:

  objc_autoreleasePoolPop(v12);
  return v21;
}

+ (int)_lockingFlagsFromFileLockMode:(id)a3
{
  if (a3.var0)
    return 32;
  else
    return 16;
}

@end
