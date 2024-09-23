@implementation NSURL

void __79__NSURL_Sharing__coordinateReadingWithSaveToTempDir_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject lastPathComponent](v4, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "temporaryDirectory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v6, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v8, 1, &v23);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v23;

      if (!v9)
      {
        utilities_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __79__NSURL_Sharing__coordinateReadingWithSaveToTempDir_options_completionHandler___block_invoke_cold_2((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

        objc_msgSend(v6, "temporaryDirectory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "URLByAppendingPathComponent:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v10;
      v19 = objc_msgSend(v6, "copyItemAtURL:toURL:error:", v4, v18, &v22);
      v20 = v22;

      if (v19)
      {
        v5 = v18;
        v21 = v4;
      }
      else
      {
        utilities_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __79__NSURL_Sharing__coordinateReadingWithSaveToTempDir_options_completionHandler___block_invoke_cold_1((uint64_t)v4, (uint64_t)v20, v21);
        v5 = v4;
      }

    }
  }
  else
  {
    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __79__NSURL_Sharing__coordinateReadingWithSaveToTempDir_options_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A2830000, log, OS_LOG_TYPE_ERROR, "Failed to copy file %@ to temporary directory with error %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __79__NSURL_Sharing__coordinateReadingWithSaveToTempDir_options_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, a2, a3, "Failed to create a temporary directory with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
