@implementation WBSFileLockFactoryPOSIX

- (id)coordinationLockURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("file"));

  if ((v5 & 1) == 0)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[WBSFileLockFactoryPOSIX coordinationLockURL:].cold.1((uint64_t)v3, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_6;
  }
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("-lock"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (id)lockURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  WBSFileLockPOSIX *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  int v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("file"));

  if ((v8 & 1) == 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[WBSFileLockFactoryPOSIX coordinationLockURL:].cold.1((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_14;
  }
  -[WBSFileLockFactoryPOSIX coordinationLockURL:](self, "coordinationLockURL:", v6);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");

  if (!v10)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[WBSFileLockFactoryPOSIX lockURL:error:].cold.1((uint64_t)v6, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_14;
  }
  v11 = open(v10, 512, 438);
  if ((_DWORD)v11 == -1)
  {
    v29 = *__error();
    v30 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136380931;
      v39 = v10;
      v40 = 1024;
      v41 = v29;
      _os_log_impl(&dword_1A3D90000, v30, OS_LOG_TYPE_INFO, "Failed to open coordination lock at %{private}s: %{errno}d", buf, 0x12u);
    }
    if (a4)
    {
      v31 = v29;
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2FE0];
LABEL_24:
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, v31, 0);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v12 = v11;
  if (flock(v11, 6) == -1)
  {
    v34 = *__error();
    close(v12);
    v35 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = v35;
      v37 = *__error();
      *(_DWORD *)buf = 136380931;
      v39 = v10;
      v40 = 1024;
      v41 = v37;
      _os_log_impl(&dword_1A3D90000, v36, OS_LOG_TYPE_INFO, "Failed to acquire coordination lock at %{private}s: %{errno}d", buf, 0x12u);

    }
    if (a4)
    {
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2FE0];
      v31 = v34;
      goto LABEL_24;
    }
    goto LABEL_14;
  }
  v13 = -[WBSFileLockPOSIX initWithFileDescriptor:]([WBSFileLockPOSIX alloc], "initWithFileDescriptor:", v12);
LABEL_15:

  return v13;
}

- (void)coordinationLockURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Unsupported scheme: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)lockURL:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Invalid URL: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_2();
}

@end
