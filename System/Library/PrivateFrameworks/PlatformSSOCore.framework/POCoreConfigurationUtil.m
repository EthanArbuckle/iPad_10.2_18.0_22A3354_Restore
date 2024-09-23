@implementation POCoreConfigurationUtil

+ (BOOL)platformSSOEnabled
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;

  PO_LOG_POCoreConfigurationUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[POCoreConfigurationUtil platformSSOEnabled].cold.2();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[POCoreConfigurationUtil platformSSOTriggerFile](POCoreConfigurationUtil, "platformSSOTriggerFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    PO_LOG_POCoreConfigurationUtil();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[POCoreConfigurationUtil platformSSOEnabled].cold.1();

  }
  return v5;
}

+ (BOOL)appSSOEnabled
{
  NSObject *v2;
  void *v3;
  char v4;

  PO_LOG_POCoreConfigurationUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[POCoreConfigurationUtil appSSOEnabled].cold.1();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/mobile/Library/ExtensibleSSO/Configuration/com.apple.AppSSO.configuration.plist"));

  return v4;
}

+ (BOOL)platformSSODevModeEnabled
{
  NSObject *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;

  PO_LOG_POCoreConfigurationUtil();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[POCoreConfigurationUtil platformSSODevModeEnabled].cold.2();

  v4 = objc_msgSend(a1, "isInternalBuild");
  if (v4)
  {
    if ((_os_feature_enabled_impl() & 1) != 0
      || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          +[POCoreConfigurationUtil platformSSODevModeTriggerFile](POCoreConfigurationUtil, "platformSSODevModeTriggerFile"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v5, "fileExistsAtPath:", v6), v6, v5, v7))
    {
      PO_LOG_POCoreConfigurationUtil();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        +[POCoreConfigurationUtil platformSSODevModeEnabled].cold.1();

      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (void)writeTriggerFileToPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v5 = objc_msgSend(v4, "writeToFile:options:error:", v3, 268435457, &v22);
  v6 = v22;
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    v23 = *MEMORY[0x24BDD0CC8];
    v24[0] = &unk_251521008;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v7;
    v10 = objc_msgSend(v9, "setAttributes:ofItemAtPath:error:", v8, v3, &v18);
    v11 = v18;

    if ((v10 & 1) != 0)
    {
      PO_LOG_POCoreConfigurationUtil();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[POCoreConfigurationUtil writeTriggerFileToPath:].cold.1();
    }
    else
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke_15;
      v15[3] = &unk_2514FFCB0;
      v16 = v11;
      v17 = v3;
      v14 = __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke_15((uint64_t)v15);

      v12 = v16;
    }

  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke;
    v19[3] = &unk_2514FFCB0;
    v11 = v6;
    v20 = v11;
    v21 = v3;
    v13 = __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke((uint64_t)v19);

    v8 = v20;
  }

}

id __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to create trigger file"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POCoreConfigurationUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke_cold_1();

  return v1;
}

id __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke_15(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to set trigger file attributes"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POCoreConfigurationUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke_cold_1();

  return v1;
}

+ (void)updateTriggerFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

id __44__POCoreConfigurationUtil_updateTriggerFile__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1004, *(_QWORD *)(a1 + 32), CFSTR("Did not find configuration files."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POCoreConfigurationUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __44__POCoreConfigurationUtil_updateTriggerFile__block_invoke_cold_1((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8);

  return v1;
}

id __44__POCoreConfigurationUtil_updateTriggerFile__block_invoke_22(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to remove trigger file."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POCoreConfigurationUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __44__POCoreConfigurationUtil_updateTriggerFile__block_invoke_cold_1((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8);

  return v1;
}

+ (id)platformSSOTriggerFile
{
  return (id)objc_msgSend(CFSTR("/var/mobile/Library/ExtensibleSSO/Configuration/PlatformSSO"), "stringByAppendingPathComponent:", CFSTR("psso.configured"));
}

+ (id)platformSSODevModeTriggerFile
{
  return (id)objc_msgSend(CFSTR("/var/mobile/Library/ExtensibleSSO/Configuration/PlatformSSO"), "stringByAppendingPathComponent:", CFSTR("psso.development"));
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_20);
  return isInternalBuild_internalBuild;
}

void __42__POCoreConfigurationUtil_isInternalBuild__block_invoke()
{
  NSObject *v0;

  isInternalBuild_internalBuild = os_variant_has_internal_content();
  PO_LOG_POCoreConfigurationUtil();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __42__POCoreConfigurationUtil_isInternalBuild__block_invoke_cold_1(v0);

}

+ (void)platformSSOEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
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

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)platformSSODevModeEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)writeTriggerFileToPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "trigger file created", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(&dword_24440D000, v0, v1, "%{public}@, %{public}@");
  OUTLINED_FUNCTION_1();
}

void __44__POCoreConfigurationUtil_updateTriggerFile__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24440D000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __42__POCoreConfigurationUtil_isInternalBuild__block_invoke_cold_1(os_log_t log)
{
  const char *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (isInternalBuild_internalBuild)
    v1 = "YES";
  else
    v1 = "NO";
  v2 = 136446210;
  v3 = v1;
  _os_log_debug_impl(&dword_24440D000, log, OS_LOG_TYPE_DEBUG, "isInternalBuild=%{public}s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
