@implementation SLDStorageDirectory

void __SLDStorageDirectory_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectAtIndexedSubscript:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("SocialLayer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)SLDStorageDirectory_dir;
  SLDStorageDirectory_dir = v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", SLDStorageDirectory_dir, 1, 0, &v14);
  v5 = v14;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "code") == 640)
    {
      objc_msgSend(v6, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

      if (v8)
      {
        SLDaemonLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __SLDStorageDirectory_block_invoke_cold_1();
LABEL_9:

        v10 = (void *)SLDStorageDirectory_dir;
        SLDStorageDirectory_dir = 0;

        goto LABEL_12;
      }
    }
    if (objc_msgSend(v6, "code") == 513)
    {
      SLDaemonLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __SLDStorageDirectory_block_invoke_cold_2();
      goto LABEL_9;
    }
  }
  if (SLDStorageDirectory_dir)
  {
    v11 = (void *)MEMORY[0x19AEC48EC]();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", SLDStorageDirectory_dir);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)SLDStorageDirectory_dirURL;
    SLDStorageDirectory_dirURL = v12;

    objc_autoreleasePoolPop(v11);
  }
LABEL_12:

}

void __SLDStorageDirectory_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "#SLDCK social layer unable to create directory due to lack of disk space while creating ~/Library/SocialLayer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __SLDStorageDirectory_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "#SLDCK social layer unable to create directory due to lack of write permissions to directory %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
