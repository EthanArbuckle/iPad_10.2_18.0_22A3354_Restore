@implementation TRIIntegrationTestLogHandler

- (TRIIntegrationTestLogHandler)init
{
  TRIIntegrationTestLogHandler *v2;
  void *v3;
  uint64_t v4;
  NSString *tempDir;
  void *v6;
  NSString *v7;
  char v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSString *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSString *v16;
  void *v17;
  NSString *v18;
  char v19;
  NSString *v20;
  NSObject *v21;
  id v23;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  NSString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)TRIIntegrationTestLogHandler;
  v2 = -[TRIIntegrationTestLogHandler init](&v25, sel_init);
  if (!v2)
    return v2;
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("integration-test-logs"));
  v4 = objc_claimAutoreleasedReturnValue();
  tempDir = v2->_tempDir;
  v2->_tempDir = (NSString *)v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2->_tempDir;
  v24 = 0;
  v8 = objc_msgSend(v6, "removeItemAtPath:error:", v7, &v24);
  v9 = v24;

  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if ((v8 & 1) != 0)
  {
    if (v11)
    {
      v12 = v2->_tempDir;
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      v13 = "Cleared temp directory %@ during test log handler setup.";
      v14 = v10;
      v15 = 12;
LABEL_7:
      _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
    }
  }
  else if (v11)
  {
    v16 = v2->_tempDir;
    *(_DWORD *)buf = 138412546;
    v27 = v16;
    v28 = 2112;
    v29 = v9;
    v13 = "Couldn't remove directory (it may already be gone, which is fine) %@: %@";
    v14 = v10;
    v15 = 22;
    goto LABEL_7;
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v2->_tempDir;
  v23 = v9;
  v19 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v23);
  v20 = (NSString *)v23;

  if ((v19 & 1) == 0)
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Failed to setup integration test log handler: %@", buf, 0xCu);
    }

  }
  return v2;
}

+ (BOOL)shouldUseOverrideLogHandler
{
  _BOOL4 v2;
  NSObject *v3;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = +[TRIIntegrationTestingDefaultsOverrides shouldUseIntegrationTestLogger](TRIIntegrationTestingDefaultsOverrides, "shouldUseIntegrationTestLogger");
  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = CFSTR("NO");
    if (v2)
      v5 = CFSTR("YES");
    v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEBUG, "Should use integration test logger? %@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

+ (void)addTestLoggerInPlaceOnClient:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = a3;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEBUG, "Adding integration test logger to triald loggers", v10, 2u);
  }

  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObject:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0AB8]), "initWithClient:projectId:logHandlers:", v3, 1, v8);
  objc_msgSend(v3, "setLogger:", v9);

}

- (void)logEvent:(id)a3 subgroupName:(id)a4 queue:(id)a5
{
  NSString *tempDir;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  tempDir = self->_tempDir;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](tempDir, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_debug_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEBUG, "Integration test logger logging to: %@", buf, 0xCu);
  }

  objc_msgSend(v6, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v12 = objc_msgSend(v11, "writeToFile:options:error:", v9, 1, &v15);
  v13 = v15;
  if ((v12 & 1) == 0)
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v13;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failed to write event to file %@: %@", buf, 0x16u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempDir, 0);
}

@end
