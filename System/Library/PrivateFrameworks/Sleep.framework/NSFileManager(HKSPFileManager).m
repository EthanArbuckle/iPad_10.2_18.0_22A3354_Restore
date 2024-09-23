@implementation NSFileManager(HKSPFileManager)

+ (id)_bundleCacheDirectory
{
  if (qword_1ED05F250 != -1)
    dispatch_once(&qword_1ED05F250, &__block_literal_global_9);
  return (id)_MergedGlobals_13;
}

+ (id)_bundleCachePathForFile:()HKSPFileManager
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_bundleCacheDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)hkspFileWithNameExistsInCache:()HKSPFileManager
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_bundleCachePathForFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(a1, "fileExistsAtPath:isDirectory:", v5, 0);
  return v6;
}

- (id)hkspDataForCacheFileWithName:()HKSPFileManager
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend((id)objc_opt_class(), "_bundleCachePathForFile:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithContentsOfFile:", v6);
  return v7;
}

- (uint64_t)hkspWriteData:()HKSPFileManager toCacheFileWithName:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(a1, "hkspFileWithNameExistsInCache:", v9) & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "_bundleCacheDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x1E0CB2AD8];
    v35[0] = *MEMORY[0x1E0CB2AB8];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, v11, &v27);
    v12 = v27;

    if (v12)
    {
      HKSPLogForCategory(7uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_opt_class();
        v24 = v23;
        objc_msgSend((id)objc_opt_class(), "_bundleCacheDirectory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v23;
        v30 = 2114;
        v31 = v25;
        v32 = 2114;
        v33 = v12;
        _os_log_error_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create directory at %{public}@ with error %{public}@", buf, 0x20u);

      }
      v14 = v12;
      if (a5)
      {
LABEL_6:
        *a5 = objc_retainAutorelease(v14);
LABEL_15:

        v16 = 0;
        goto LABEL_16;
      }
LABEL_12:
      HKSPLogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v14;
        _os_log_error_impl(&dword_1A4F0E000, v19, OS_LOG_TYPE_ERROR, "Dropping error because caller did not provide an errorOut pointer: %{public}@", buf, 0xCu);
      }

      goto LABEL_15;
    }
  }
  objc_msgSend((id)objc_opt_class(), "_bundleCachePathForFile:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v16 = 1;
  v17 = objc_msgSend(v8, "writeToFile:options:error:", v15, 1, &v26);
  v14 = v26;

  if ((v17 & 1) == 0)
  {
    HKSPLogForCategory(7uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      v30 = 2114;
      v31 = v14;
      v22 = v21;
      _os_log_error_impl(&dword_1A4F0E000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] failed to write data to file with error %{public}@", buf, 0x16u);

    }
    v14 = v14;
    if (!v14)
      goto LABEL_15;
    if (a5)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_16:

  return v16;
}

- (uint64_t)hkspRemoveFileWithNameFromCache:()HKSPFileManager error:
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_bundleCachePathForFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(a1, "removeItemAtPath:error:", v7, a4);
  return v8;
}

@end
