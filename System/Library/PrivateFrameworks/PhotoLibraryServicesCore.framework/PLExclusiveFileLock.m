@implementation PLExclusiveFileLock

- (PLExclusiveFileLock)init
{
  -[PLExclusiveFileLock doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PLExclusiveFileLock)initWithURL:(id)a3
{
  id v5;
  PLExclusiveFileLock *v6;
  PLExclusiveFileLock *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLExclusiveFileLock;
  v6 = -[PLExclusiveFileLock init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_fd = -1;
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_fd != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_url, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLExclusiveFileLock.m"), 73, CFSTR("deallocated while locked: %@"), v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)PLExclusiveFileLock;
  -[PLExclusiveFileLock dealloc](&v6, sel_dealloc);
}

- (BOOL)isLocked
{
  return self->_fd >= 0;
}

- (PLExclusiveFileLock)lockWithError:(id *)a3
{
  id *v3;
  id v5;
  void *v6;
  int fd;
  id v8;
  PLExclusiveFileLock *result;
  int v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v3 = a3;
  v24[2] = *MEMORY[0x1E0C80C00];
  if (self->_fd == -1)
  {
    if (a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_url, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLExclusiveFileLock.m"), 83, CFSTR("already locked: %@"), v21);

  if (!v3)
  {
LABEL_3:
    v22 = 0;
    v3 = (id *)&v22;
  }
LABEL_4:
  if (lockWithError__onceToken != -1)
    dispatch_once(&lockWithError__onceToken, &__block_literal_global_5795);
  -[NSURL path](self->_url, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  self->_fd = open((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 1573, 420);

  if (self->_fd == -1)
  {
    v10 = *__error();
    if (v10 == 35 || v10 == 16)
    {
      -[PLExclusiveFileLock lockFailure](self, "lockFailure");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *v3 = v11;
    }
    else if (v10 == 4)
    {
      return -[PLExclusiveFileLock lockWithError:](self, "lockWithError:", v3);
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2FE0];
      v14 = *__error();
      v23[0] = *MEMORY[0x1E0CB2938];
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = __error();
      objc_msgSend(v15, "stringWithUTF8String:", strerror(*v16));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = *MEMORY[0x1E0CB3308];
      v24[0] = v17;
      v24[1] = self->_url;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v18);
      *v3 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
  }
  else
  {
    -[PLExclusiveFileLock lockData](self, "lockData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    fd = self->_fd;
    v8 = objc_retainAutorelease(v6);
    write(fd, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
    fsync(self->_fd);

    return (PLExclusiveFileLock *)1;
  }
  return result;
}

- (void)unlock
{
  id v3;

  if ((self->_fd & 0x80000000) == 0)
  {
    -[NSURL path](self->_url, "path");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    unlink((const char *)objc_msgSend(v3, "fileSystemRepresentation"));

    close(self->_fd);
    self->_fd = -1;
  }
}

- (id)lockData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v15[0] = qword_1EE3723D0;
  v14[0] = CFSTR("hostuuid");
  v14[1] = CFSTR("hostname");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &unk_1EE3722CC);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v2;
  v14[2] = CFSTR("pid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", processInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v3;
  v14[3] = CFSTR("processname");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &unk_1EE3722AC);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v4;
  v14[4] = CFSTR("uid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", getuid());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 100, 0, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (!v7)
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_DEFAULT, "error serializing lock info: %@", buf, 0xCu);
    }

  }
  return v7;
}

- (id)lockFailure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  NSURL *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSURL *url;
  void *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  pid_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v41;
  _QWORD v42[3];
  _QWORD v43[3];
  _OWORD buffer[4];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[4];

  v54[3] = *MEMORY[0x1E0C80C00];
  v41 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", self->_url, 0, &v41);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v41);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "intValue");

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hostuuid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", qword_1EE3723D0);

      if ((v9 & 1) != 0)
      {
        if (!(_DWORD)v7)
        {
          v10 = (void *)MEMORY[0x1E0CB35C8];
          v29 = *MEMORY[0x1E0CB3308];
          v47[0] = *MEMORY[0x1E0CB2938];
          v47[1] = v29;
          url = self->_url;
          v48[0] = CFSTR("locked by unknown process");
          v48[1] = url;
          v13 = (void *)MEMORY[0x1E0C99D80];
          v14 = v48;
          v15 = v47;
          goto LABEL_14;
        }
        if ((_DWORD)v7 == getpid())
        {
          v10 = (void *)MEMORY[0x1E0CB35C8];
          v11 = *MEMORY[0x1E0CB3308];
          v45[0] = *MEMORY[0x1E0CB2938];
          v45[1] = v11;
          v12 = self->_url;
          v46[0] = CFSTR("locked by this process");
          v46[1] = v12;
          v13 = (void *)MEMORY[0x1E0C99D80];
          v14 = v46;
          v15 = v45;
LABEL_14:
          objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 46010, v31);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_22;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("processname"));
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        v34 = CFSTR("hostname");
        if (v32)
          v34 = (__CFString *)v32;
        v25 = v34;

        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("locked by process %@(%d)"), v25, v7);
        memset(buffer, 0, sizeof(buffer));
        v35 = getpid();
        if (proc_pidinfo(v35, 13, 1uLL, buffer, 64) && HIDWORD(buffer[0]) == 5)
        {
          v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("locked by zombie process %@(%d)"), v25, v7);

          v28 = (void *)v36;
        }
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v38 = *MEMORY[0x1E0CB2D68];
        v42[0] = *MEMORY[0x1E0CB2938];
        v42[1] = v38;
        v43[0] = CFSTR("locked by another process");
        v43[1] = v28;
        v42[2] = *MEMORY[0x1E0CB3308];
        v43[2] = self->_url;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 46010, v39);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hostname"));
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        if (v22)
          v24 = (const __CFString *)v22;
        else
          v24 = CFSTR("unknown");
        objc_msgSend(CFSTR("locked by host "), "stringByAppendingString:", v24);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)MEMORY[0x1E0CB35C8];
        v27 = *MEMORY[0x1E0CB2D68];
        v49[0] = *MEMORY[0x1E0CB2938];
        v49[1] = v27;
        v50[0] = CFSTR("locked by remote host");
        v50[1] = v25;
        v49[2] = *MEMORY[0x1E0CB3308];
        v50[2] = self->_url;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 46010, v28);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_22;
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB3388];
    v51[0] = *MEMORY[0x1E0CB2938];
    v51[1] = v20;
    v52[0] = CFSTR("error reading lock information");
    v52[1] = v41;
    v51[2] = *MEMORY[0x1E0CB3308];
    v52[2] = self->_url;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 46010, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = 0;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB3388];
    v53[0] = *MEMORY[0x1E0CB2938];
    v53[1] = v17;
    v54[0] = CFSTR("error reading lock information");
    v54[1] = v41;
    v53[2] = *MEMORY[0x1E0CB3308];
    v54[2] = self->_url;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 46010, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

void __37__PLExclusiveFileLock_lockWithError___block_invoke()
{
  pid_t v0;
  void *v1;
  uint64_t v2;
  timespec v3;
  uuid_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = getpid();
  proc_name(v0, &unk_1EE3722AC, 0x20u);
  gethostname(byte_1EE3722CC, 0xFFuLL);
  processInfo = v0;
  memset(v4, 0, sizeof(v4));
  v3.tv_sec = 0;
  v3.tv_nsec = 0;
  gethostuuid(v4, &v3);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v4);
  objc_msgSend(v1, "UUIDString");
  v2 = objc_claimAutoreleasedReturnValue();

  qword_1EE3723D0 = v2;
}

@end
