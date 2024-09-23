@implementation NSFileManager(TRI)

- (uint64_t)triSafeCopyItemAtPath:()TRI toPath:error:
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
  {
    v10 = objc_msgSend(a1, "copyItemAtPath:toPath:error:", v8, v9, a5);
    v11 = v10;
    if (a5 && (_DWORD)v10)
    {
      *a5 = 0;
      v11 = 1;
    }
  }
  else
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -22, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "attempted to copy with invalid paths src:%@ dst:%@", (uint8_t *)&v14, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

- (__CFString)triPath:()TRI relativeToParentPath:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "stringByStandardizingPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByStandardizingPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "hasPrefix:", v7) & 1) == 0)
  {
    objc_msgSend(v6, "triStringByResolvingSymlinksInPath");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "triStringByResolvingSymlinksInPath");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
    v6 = (void *)v8;
  }
  if ((objc_msgSend(v6, "hasPrefix:", v7) & 1) != 0)
  {
    objc_msgSend(v6, "pathComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "count");
    if (v12 == objc_msgSend(v11, "count"))
    {
      v13 = CFSTR(".");
    }
    else
    {
      objc_msgSend(v10, "subarrayWithRange:", objc_msgSend(v11, "count"), objc_msgSend(v10, "count") - objc_msgSend(v11, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v15);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    TRILogCategory_ClientFramework();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_error_impl(&dword_19B89C000, v14, OS_LOG_TYPE_ERROR, "expected path to be a prefix of parent path: path=%@, parent=%@", (uint8_t *)&v17, 0x16u);
    }

    v13 = v6;
  }

  return v13;
}

- (id)triCreateDirectoryForPath:()TRI isDirectory:error:
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (a4)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v20 = 0;
  if ((objc_msgSend(a1, "fileExistsAtPath:isDirectory:", v10, &v20) & 1) != 0)
  {
    if (!v20)
    {
      TRILogCategory_ClientFramework();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v11;
        v23 = 2112;
        v24 = v9;
        _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "could not create directory %@ for path %@ -- file exists", buf, 0x16u);
      }

LABEL_17:
      v16 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    v19 = 0;
    v13 = objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v19);
    v14 = v19;
    v15 = v14;
    if ((v13 & 1) == 0)
    {
      TRILogCategory_ClientFramework();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v22 = v11;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = v15;
        _os_log_error_impl(&dword_19B89C000, v17, OS_LOG_TYPE_ERROR, "could not create directory %@ for path %@ -- %@", buf, 0x20u);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v15);

      goto LABEL_17;
    }

  }
  v16 = v11;
LABEL_18:

  return v16;
}

- (uint64_t)triRemoveItemAtPath:()TRI error:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int16 v30;
  id v31;
  void *v33;
  _QWORD *v34;
  void *v35;
  uint64_t v36;
  stat v37;
  char v38;
  uint64_t v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileManager+TRI.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v38 = 0;
  if (!objc_msgSend(a1, "fileExistsAtPath:isDirectory:", v7, &v38))
  {
    v16 = 1;
    goto LABEL_19;
  }
  if (!v38)
  {
LABEL_18:
    v16 = objc_msgSend(a1, "removeItemAtPath:error:", v7, a4);
    goto LABEL_19;
  }
  memset(&v37, 0, sizeof(v37));
  v8 = objc_retainAutorelease(v7);
  if (!stat((const char *)objc_msgSend(v8, "fileSystemRepresentation"), &v37))
  {
    v34 = a4;
    v17 = v37.st_mode & 0x1FF;
    v18 = objc_retainAutorelease(v8);
    chmod((const char *)objc_msgSend(v18, "fileSystemRepresentation"), v17 | 0x90);
    v35 = v18;
    objc_msgSend(a1, "enumeratorAtPath:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC6B8C]();
    objc_msgSend(v19, "nextObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      v23 = *MEMORY[0x1E0CB2B18];
      v24 = (void *)*MEMORY[0x1E0CB2B20];
      v36 = *MEMORY[0x1E0CB2AA8];
      do
      {
        objc_msgSend(v19, "fileAttributes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26 == v24)
        {
          objc_msgSend(v19, "fileAttributes");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v36);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v35, "stringByAppendingPathComponent:", v22);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v28, "unsignedShortValue");
            v31 = objc_retainAutorelease(v29);
            chmod((const char *)objc_msgSend(v31, "fileSystemRepresentation"), v30 | 0x90);

          }
        }

        objc_autoreleasePoolPop(v20);
        v20 = (void *)MEMORY[0x1A1AC6B8C]();
        objc_msgSend(v19, "nextObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      while (v22);
    }
    objc_autoreleasePoolPop(v20);

    a4 = v34;
    goto LABEL_18;
  }
  if (a4)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = *MEMORY[0x1E0CB2FE0];
    v11 = *__error();
    v39 = *MEMORY[0x1E0CB2D50];
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    v13 = __error();
    v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("Could not stat %@: %s"), v8, strerror(*v13));
    v40[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, v11, v15);

  }
  v16 = 0;
LABEL_19:

  return v16;
}

+ (uint64_t)triHasFileProtection:()TRI
{
  id v3;
  int v4;
  int v5;
  int v6;
  int *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  int *v11;
  char *v12;
  int v13;
  uint64_t v14;
  int v16;
  id v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0);
  if (v4 < 0)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = __error();
      v12 = strerror(*v11);
      v13 = *__error();
      v16 = 138543874;
      v17 = v3;
      v18 = 2080;
      v19 = v12;
      v20 = 1024;
      v21 = v13;
      v10 = "Unable to open %{public}@ to get file protection: %s (%d)";
      goto LABEL_8;
    }
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v5 = v4;
  v6 = fcntl(v4, 63);
  close(v5);
  v7 = __error();
  if (v6 == 4)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16 = 138543362;
      v17 = v3;
      _os_log_impl(&dword_19B89C000, v9, OS_LOG_TYPE_INFO, "File %{public}@ has no file protection already", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_11;
  }
  if (v6 == -1)
  {
    v8 = *v7;
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = 138543874;
      v17 = v3;
      v18 = 2080;
      v19 = strerror(v8);
      v20 = 1024;
      v21 = v8;
      v10 = "Failed to get protection class for file %{public}@: %s (%d)";
LABEL_8:
      _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, 0x1Cu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  v14 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v16 = 138543618;
    v17 = v3;
    v18 = 1024;
    LODWORD(v19) = v6;
    _os_log_impl(&dword_19B89C000, v9, OS_LOG_TYPE_INFO, "File %{public}@ has file protection class %d", (uint8_t *)&v16, 0x12u);
  }
LABEL_12:

  return v14;
}

+ (uint64_t)triRemoveFileProtectionIfPresentForPath:()TRI
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  int *v11;
  char *v12;
  int v13;
  const char *v14;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "triHasFileProtection:", v4))
  {
    v5 = objc_retainAutorelease(v4);
    v6 = open((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 2);
    if (v6 < 0)
    {
      if (*__error() != 21
        || (v6 = open((const char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation"), 0), v6 < 0))
      {
        TRILogCategory_Server();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = __error();
          v12 = strerror(*v11);
          v13 = *__error();
          *(_DWORD *)buf = 138543874;
          v17 = v5;
          v18 = 2080;
          v19 = v12;
          v20 = 1024;
          v21 = v13;
          v14 = "Unable to open %{public}@ to set file protection: %s (%d)";
LABEL_13:
          _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, v14, buf, 0x1Cu);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    v7 = fcntl(v6, 64, 4);
    v8 = *__error();
    close(v6);
    if (v7 == -1)
    {
      TRILogCategory_Server();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v17 = v5;
        v18 = 2080;
        v19 = strerror(v8);
        v20 = 1024;
        v21 = v8;
        v14 = "Unable to disable file protection on %{public}@: %s (%d)";
        goto LABEL_13;
      }
LABEL_10:

      v9 = 0;
      goto LABEL_11;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

+ (uint64_t)triIdempotentCreateDirectoryOrFaultWithPath:()TRI
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
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
  v6 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v10);

  v7 = v10;
  if ((v6 & 1) == 0)
  {
    TRILogCategory_ClientFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_error_impl(&dword_19B89C000, v8, OS_LOG_TYPE_ERROR, "Failed to create directory: %@", buf, 0xCu);
    }

  }
  return v6;
}

+ (id)triArbitraryFileInDirWithPath:()TRI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorAtPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(v5, "nextObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)*MEMORY[0x1E0CB2B28];
    while (1)
    {
      objc_msgSend(v5, "fileAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 == v9)
        break;

      objc_autoreleasePoolPop(v6);
      v6 = (void *)MEMORY[0x1A1AC6B8C]();
      objc_msgSend(v5, "nextObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_5;
    }
    objc_msgSend(v3, "stringByAppendingPathComponent:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v12 = 0;
  }
  objc_autoreleasePoolPop(v6);

  return v12;
}

@end
