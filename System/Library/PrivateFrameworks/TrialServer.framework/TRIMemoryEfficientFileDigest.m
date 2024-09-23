@implementation TRIMemoryEfficientFileDigest

+ (id)sha256DigestForFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v17;
  unsigned __int8 *v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  CC_SHA256_CTX c;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3608];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v3);
  v21 = 0;
  objc_msgSend(v4, "fileHandleForReadingFromURL:error:", v5, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;

  if (v6)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
    memset(&c, 0, sizeof(c));
    v9 = CC_SHA256_Init(&c);
    while (1)
    {
      v10 = (void *)MEMORY[0x1D8232A5C](v9);
      v20 = 0;
      objc_msgSend(v6, "readDataUpToLength:error:", 0x20000, &v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v20;
      if (!v11)
        break;
      if (!objc_msgSend(v11, "length"))
      {

        objc_autoreleasePoolPop(v10);
        v17 = objc_retainAutorelease(v8);
        v18 = (unsigned __int8 *)-[NSObject mutableBytes](v17, "mutableBytes");
        if (!v18)
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v19);
        }
        CC_SHA256_Final(v18, &c);
        v15 = v17;
        goto LABEL_12;
      }
      v13 = objc_retainAutorelease(v11);
      CC_SHA256_Update(&c, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

      objc_autoreleasePoolPop(v10);
    }
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v3;
      v24 = 2114;
      v25 = v12;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failed to read from %{public}@ during digest creation with error %{public}@", buf, 0x16u);
    }

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      c.count[0] = 138543618;
      *(_QWORD *)&c.count[1] = v3;
      LOWORD(c.hash[1]) = 2114;
      *(_QWORD *)((char *)&c.hash[1] + 2) = v7;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Failed to create handle for %{public}@ with error %{public}@", (uint8_t *)&c, 0x16u);
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

@end
