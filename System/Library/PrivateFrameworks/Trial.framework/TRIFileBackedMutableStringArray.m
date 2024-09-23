@implementation TRIFileBackedMutableStringArray

- (TRIFileBackedMutableStringArray)init
{
  TRIFileBackedMutableStringArray *v2;
  TRIFileBackedMutableStringArray *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  TRIFileBackedMutableStringArray *v11;
  NSObject *v12;
  void *v14;
  int *v15;
  char *v16;
  int v17;
  id v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)TRIFileBackedMutableStringArray;
  v2 = -[TRIFileBackedMutableStringArray init](&v19, sel_init);
  v3 = v2;
  if (!v2)
  {
LABEL_8:
    v11 = v3;
    goto LABEL_12;
  }
  v2->_fd = -1;
  v2->_count = 0;
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("TRIFileBackedMutableStringArray-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_msgSend(MEMORY[0x1E0D815B0], "mkstempWithPrefix:error:", v5, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (v6)
  {
    objc_msgSend(v6, "path");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = unlink((const char *)objc_msgSend(v8, "fileSystemRepresentation"));

    if (v9)
    {
      TRILogCategory_ClientFramework();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = __error();
        v16 = strerror(*v15);
        v17 = *__error();
        *(_DWORD *)buf = 138412802;
        v21 = v14;
        v22 = 2080;
        v23 = v16;
        v24 = 1024;
        v25 = v17;
        _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "Failed to unlink tempfile \"%@\": %s (%d)", buf, 0x1Cu);

      }
    }
    v3->_fd = objc_msgSend(v6, "fd");

    goto LABEL_8;
  }
  TRILogCategory_ClientFramework();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v5;
    v22 = 2112;
    v23 = (char *)v7;
    _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "Failed to create tempfile \"%@XXXXXX\" for TRIFileBackedMutableStringArray: %@", buf, 0x16u);
  }

  v11 = 0;
LABEL_12:

  return v11;
}

- (void)dealloc
{
  int fd;
  objc_super v4;

  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
    close(fd);
  v4.receiver = self;
  v4.super_class = (Class)TRIFileBackedMutableStringArray;
  -[TRIFileBackedMutableStringArray dealloc](&v4, sel_dealloc);
}

+ (id)arrayFromDirectory:(id)a3
{
  id v5;
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

  v5 = a3;
  v6 = (void *)objc_opt_new();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, 0, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1A1AC6B8C]();
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
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIFileBackedMutableStringArray.m"), 73, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("url.path"));

        }
        v14 = objc_msgSend(v6, "addString:", v13);

        objc_autoreleasePoolPop(v10);
        if (!v14)
          break;
        v10 = (void *)MEMORY[0x1A1AC6B8C]();
        objc_msgSend(v9, "nextObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_8;
      }
      v16 = 0;
    }
    else
    {
LABEL_8:
      objc_autoreleasePoolPop(v10);
      v16 = v6;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)addString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC6B8C]();
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "UTF8String");
  if (v7)
  {
    v8 = (const char *)v7;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", self->_fd, 0);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v8, strlen(v8) + 1, 0);
    v15 = 0;
    v11 = -[NSObject writeData:error:](v9, "writeData:error:", v10, &v15);
    v12 = v15;
    if ((v11 & 1) != 0)
    {
      ++self->_count;
    }
    else
    {
      TRILogCategory_ClientFramework();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_error_impl(&dword_19B89C000, v13, OS_LOG_TYPE_ERROR, "Failed to append string to TRIFileBackedMutableStringArray: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, "Failed to add non-UTF-8 string to TRIFileBackedMutableStringArray: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v11;
}

- (BOOL)enumerateStringsWithBlock:(id)a3
{
  void (**v5)(id, void *, stat *);
  NSObject *v6;
  BOOL v7;
  size_t st_size;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int *v19;
  char *v20;
  int v21;
  const char *v22;
  uint8_t *v23;
  int *v24;
  char *v25;
  int v26;
  int *v27;
  char *v28;
  int v29;
  void *v30;
  uint8_t buf[4];
  char *v32;
  __int16 v33;
  int v34;
  stat v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, stat *))a3;
  memset(&v35, 0, sizeof(v35));
  if (!fstat(self->_fd, &v35))
  {
    st_size = v35.st_size;
    if (v35.st_size)
    {
      v9 = (char *)mmap(0, v35.st_size, 1, 1, self->_fd, 0);
      if (v9 == (char *)-1)
      {
        TRILogCategory_ClientFramework();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          goto LABEL_3;
        v19 = __error();
        v20 = strerror(*v19);
        v21 = *__error();
        v35.st_dev = 136315394;
        *(_QWORD *)&v35.st_mode = v20;
        WORD2(v35.st_ino) = 1024;
        *(_DWORD *)((char *)&v35.st_ino + 6) = v21;
        v22 = "Failed to mmap() tempfile: %s (%d)";
        v23 = (uint8_t *)&v35;
LABEL_21:
        _os_log_error_impl(&dword_19B89C000, v6, OS_LOG_TYPE_ERROR, v22, v23, 0x12u);
        goto LABEL_3;
      }
      v10 = v9;
      v11 = &v9[st_size];
      v12 = v9;
      do
      {
        if (v12 >= v11)
          break;
        v13 = (char *)memchr(v12, 0, v11 - v12);
        if (!v13)
          break;
        v14 = v13;
        LOBYTE(v35.st_dev) = 0;
        v15 = (void *)MEMORY[0x1A1AC6B8C]();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v12);
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFileBackedMutableStringArray.m"), 151, CFSTR("String somehow did not survive round-trip to UTF-8."));

        }
        v5[2](v5, v16, &v35);

        objc_autoreleasePoolPop(v15);
        v12 = v14 + 1;
      }
      while (!LOBYTE(v35.st_dev));
      if (munmap(v10, st_size))
      {
        TRILogCategory_ClientFramework();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v27 = __error();
          v28 = strerror(*v27);
          v29 = *__error();
          v35.st_dev = 136315394;
          *(_QWORD *)&v35.st_mode = v28;
          WORD2(v35.st_ino) = 1024;
          *(_DWORD *)((char *)&v35.st_ino + 6) = v29;
          _os_log_error_impl(&dword_19B89C000, v17, OS_LOG_TYPE_ERROR, "Failed to munmap TRIFileBackedMutableStringArray buffer: %s (%d)", (uint8_t *)&v35, 0x12u);
        }

      }
    }
    v7 = 1;
    goto LABEL_17;
  }
  TRILogCategory_ClientFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v24 = __error();
    v25 = strerror(*v24);
    v26 = *__error();
    *(_DWORD *)buf = 136315394;
    v32 = v25;
    v33 = 1024;
    v34 = v26;
    v22 = "Failed to stat tempfile for TRIFileBackedMutableStringArray enumeration: %s (%d)";
    v23 = buf;
    goto LABEL_21;
  }
LABEL_3:

  v7 = 0;
LABEL_17:

  return v7;
}

- (unint64_t)count
{
  return self->_count;
}

@end
