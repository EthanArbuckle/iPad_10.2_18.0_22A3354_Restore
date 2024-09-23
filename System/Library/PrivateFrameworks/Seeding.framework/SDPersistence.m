@implementation SDPersistence

+ (void)saveBetaEnrollmentTokens:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446210;
    v9 = "+[SDPersistence saveBetaEnrollmentTokens:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v8, 0xCu);
  }

  +[SDMDMConfiguration defaultConfigurationForSetupAssistantFlowWithTokens:](SDMDMConfiguration, "defaultConfigurationForSetupAssistantFlowWithTokens:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(a1, "saveMDMConfiguration:", v6);
}

+ (id)betaEnrollmentTokensFromOldLocation
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v8[16];

  SeedingDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("BetaEnrollmentTokens"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "No Beta Enrollment Tokens found in old location", v8, 2u);
    }

    v4 = objc_opt_new();
  }
  v6 = (void *)v4;

  return v6;
}

+ (id)saveMDMConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  char *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v21 = "+[SDPersistence saveMDMConfiguration:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  objc_msgSend(a1, "deleteBetaEnrollmentTokensFromOldLocations");
  objc_msgSend(a1, "persistenceDirectory:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;
    if (v8)
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[SDPersistence saveMDMConfiguration:].cold.2();

      v10 = v8;
    }
    else
    {
      objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("MDMConfiguration.plist"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v7, "writeToFile:options:error:", v12, 1, &v18);
      v10 = v18;

      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v10)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          +[SDPersistence saveMDMConfiguration:].cold.1();

        v15 = v10;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "path");
          v16 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v21 = v16;
          _os_log_impl(&dword_1D4F89000, v14, OS_LOG_TYPE_DEFAULT, "Saved [%{public}@]", buf, 0xCu);

        }
      }

    }
  }
  else
  {
    SDGenericError();
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)loadMDMConfigurationWithError:(id *)a3
{
  char *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  unint64_t v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  id v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "betaEnrollmentTokensFromOldLocation");
  v5 = (char *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v5;
      _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, "Migrating beta enrollment tokens from old path with token: [%{public}@]", buf, 0xCu);
    }

    +[SDMDMConfiguration defaultConfigurationForSetupAssistantFlowWithTokens:](SDMDMConfiguration, "defaultConfigurationForSetupAssistantFlowWithTokens:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(a1, "saveMDMConfiguration:", v7);
    objc_msgSend(a1, "deleteBetaEnrollmentTokensFromOldLocations");
  }
  else
  {
    objc_msgSend(a1, "persistenceDirectory:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("MDMConfiguration.plist"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

      if ((v14 & 1) != 0)
      {
        v15 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v11, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        objc_msgSend(v15, "dataWithContentsOfFile:options:error:", v16, 0, &v31);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v31;

        if (v18)
        {
          +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            +[SDPersistence loadMDMConfigurationWithError:].cold.2((uint64_t)v18, v19);

          if (a3)
          {
            SDGenericError();
            v7 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v7 = 0;
          }
        }
        else
        {
          v30 = 0;
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v17, &v30);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v30;
          +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v22)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              +[SDPersistence loadMDMConfigurationWithError:].cold.1(v22, v24);

            if (a3)
            {
              SDGenericError();
              v7 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v7 = 0;
            }
          }
          else
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v25 = objc_msgSend(v21, "policy");
              if (v25 > 3)
                v26 = "Unknown";
              else
                v26 = off_1E98CFE20[v25];
              objc_msgSend(v21, "tokens");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "count");
              *(_DWORD *)buf = 136446466;
              v33 = v26;
              v34 = 2048;
              v35 = v28;
              _os_log_impl(&dword_1D4F89000, v24, OS_LOG_TYPE_DEFAULT, "Loaded MDM configuration: [%{public}s] with [%lu] tokens", buf, 0x16u);

            }
            v7 = v21;
          }

        }
      }
      else
      {
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D4F89000, v18, OS_LOG_TYPE_INFO, "MDM Configuration has not been set", buf, 2u);
        }
        v7 = 0;
      }

    }
    else
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4F89000, v20, OS_LOG_TYPE_DEFAULT, "could not load MDM Configuration ", buf, 2u);
      }

      if (a3)
      {
        SDGenericError();
        v7 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
    }

  }
  return v7;
}

+ (void)deleteBetaEnrollmentTokensFromOldLocations
{
  id v2;

  SeedingDefaults();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("BetaEnrollmentTokens"));

}

+ (id)persistenceDirectory:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v12[4];
  NSObject *v13;
  id v14;

  v3 = a3;
  objc_msgSend(a1, "containerURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SDPersistence persistenceDirectory:].cold.1();
    goto LABEL_12;
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v14);
    v6 = v14;

    if (v6)
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[SDPersistence persistenceDirectory:].cold.2((uint64_t)v6, v7, v8);

LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__SDPersistence_persistenceDirectory___block_invoke;
  v12[3] = &unk_1E98CF0A0;
  v9 = v4;
  v13 = v9;
  if (persistenceDirectory__onceToken != -1)
    dispatch_once(&persistenceDirectory__onceToken, v12);
  v10 = v9;
  v6 = v13;
LABEL_13:

  return v10;
}

void __38__SDPersistence_persistenceDirectory___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_DEFAULT, "Seeding directory [%{public}@]", (uint8_t *)&v4, 0xCu);

  }
}

+ (id)containerURL
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.seeding"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[SDPersistence containerURL].cold.1();

  }
  return v3;
}

+ (void)saveMDMConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1D4F89000, v0, v1, "Failed to write MDM configuration to disk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

+ (void)saveMDMConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1D4F89000, v0, v1, "Failed to serialize MDM configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

+ (void)loadMDMConfigurationWithError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v4, "Failed to deserialize MDM configuration object - %{public}@.", (uint8_t *)&v5);

}

+ (void)loadMDMConfigurationWithError:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446466;
  v3 = "+[SDPersistence loadMDMConfigurationWithError:]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_1D4F89000, a2, OS_LOG_TYPE_ERROR, "[%{public}s] [%{public}@]", (uint8_t *)&v2, 0x16u);
}

+ (void)persistenceDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1D4F89000, v0, v1, "Group container URL was null.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

+ (void)persistenceDirectory:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, a3, "Failed to generate persistence directory: [%{public}@]", (uint8_t *)&v3);
}

+ (void)containerURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1D4F89000, v0, v1, "Could not find group container.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
