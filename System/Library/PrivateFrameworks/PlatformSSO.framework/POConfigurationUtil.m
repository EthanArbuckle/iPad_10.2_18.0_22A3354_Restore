@implementation POConfigurationUtil

+ (BOOL)platformSSOEnabled
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  PO_LOG_POConfigurationUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[POConfigurationUtil platformSSOEnabled].cold.2();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[POConfigurationUtil platformSSOTriggerFile](POConfigurationUtil, "platformSSOTriggerFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    PO_LOG_POConfigurationUtil();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[POConfigurationUtil platformSSOEnabled].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  return v5;
}

+ (BOOL)appSSOEnabled
{
  NSObject *v2;
  void *v3;
  char v4;

  PO_LOG_POConfigurationUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[POConfigurationUtil appSSOEnabled].cold.1();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/mobile/Library/ExtensibleSSO/Configuration/com.apple.AppSSO.configuration.plist"));

  return v4;
}

+ (BOOL)platformSSOEnabledForUsername:(id)a3
{
  id v3;
  POConfigurationManager *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = -[POConfigurationManager initWithUserName:]([POConfigurationManager alloc], "initWithUserName:", v3);

  -[POConfigurationManager currentDeviceConfiguration](v4, "currentDeviceConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "registrationCompleted"))
  {
    -[POConfigurationManager currentUserConfiguration](v4, "currentUserConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)updateTriggerFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

id __40__POConfigurationUtil_updateTriggerFile__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1004, *(_QWORD *)(a1 + 32), CFSTR("Did not find configuration files."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __40__POConfigurationUtil_updateTriggerFile__block_invoke_10(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to create trigger file"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __40__POConfigurationUtil_updateTriggerFile__block_invoke_15(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to set trigger file attributes"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __40__POConfigurationUtil_updateTriggerFile__block_invoke_20(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to remove trigger file."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

+ (id)platformSSOTriggerFile
{
  return (id)objc_msgSend((id)*MEMORY[0x24BE72F80], "stringByAppendingPathComponent:", CFSTR("psso.configured"));
}

+ (void)platformSSOEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)appSSOEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22307D000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
