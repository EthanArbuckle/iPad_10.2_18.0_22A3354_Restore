@implementation SDMDMConfiguratorDaemon

+ (BOOL)isBetaEnrollmentDisabled
{
  void *v2;
  id v3;
  NSObject *v4;
  char v5;
  uint8_t v7[8];
  id v8;

  v8 = 0;
  +[SDPersistence loadMDMConfigurationWithError:](SDPersistence, "loadMDMConfigurationWithError:", &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8;
  if (v3)
  {
    +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[SDMDMConfiguratorDaemon isBetaEnrollmentDisabled].cold.1(v3, v4);
  }
  else
  {
    if (v2)
    {
      v5 = objc_msgSend(v2, "disableBetaEnrollment");
      goto LABEL_7;
    }
    +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_INFO, "No MDM configuration set", v7, 2u);
    }
  }

  v5 = 0;
LABEL_7:

  return v5;
}

+ (void)configureWithOfferProgramTokens:(id)a3 requireProgramToken:(id)a4 enrollmentPolicy:(int64_t)a5 userIdentifier:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t);
  SDMDMConfiguration *v16;
  SDMDMConfiguration *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint8_t v26[16];

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, uint64_t))a7;
  v16 = -[SDMDMConfiguration initWithPolicy:]([SDMDMConfiguration alloc], "initWithPolicy:", a5);
  v17 = v16;
  switch(a5)
  {
    case 0:
      -[SDMDMConfiguration setRestrictUserPrograms:](v16, "setRestrictUserPrograms:", 0);
      -[SDMDMConfiguration setDisableBetaEnrollment:](v17, "setDisableBetaEnrollment:", 0);
      v18 = (void *)objc_opt_new();
      -[SDMDMConfiguration setTokens:](v17, "setTokens:", v18);

      goto LABEL_8;
    case 1:
      -[SDMDMConfiguration setRestrictUserPrograms:](v16, "setRestrictUserPrograms:", 0);
      -[SDMDMConfiguration setDisableBetaEnrollment:](v17, "setDisableBetaEnrollment:", 0);
      goto LABEL_7;
    case 2:
      -[SDMDMConfiguration setRestrictUserPrograms:](v16, "setRestrictUserPrograms:", 1);
      -[SDMDMConfiguration setDisableBetaEnrollment:](v17, "setDisableBetaEnrollment:", 0);
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SDMDMConfiguration setTokens:](v17, "setTokens:", v22);

        objc_msgSend(a1, "enrollWithRequireProgramToken:userIdentifier:", v13, v14);
LABEL_12:
        v21 = objc_msgSend(a1, "applyMDMConfiguration:", v17);
      }
      else
      {
        if (!objc_msgSend(v12, "count"))
        {
          +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_1D4F89000, v25, OS_LOG_TYPE_DEFAULT, "Restricting user programs with zero Beta Enrollment tokens.", v26, 2u);
          }

        }
LABEL_7:
        -[SDMDMConfiguration setTokens:](v17, "setTokens:", v12);
LABEL_8:
        v21 = objc_msgSend(a1, "applyMDMConfiguration:", v17);
        objc_msgSend(a1, "conditionallyUnenrollIfNotMatchingOfferedTokensWithConfig:userIdentifier:", v17, v14);
      }
LABEL_13:
      v15[2](v15, v21);

      return;
    case 3:
      -[SDMDMConfiguration setRestrictUserPrograms:](v16, "setRestrictUserPrograms:", 1);
      -[SDMDMConfiguration setDisableBetaEnrollment:](v17, "setDisableBetaEnrollment:", 1);
      v23 = (void *)objc_opt_new();
      -[SDMDMConfiguration setTokens:](v17, "setTokens:", v23);

      +[SDDevice _currentDevice](SDDevice, "_currentDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_unenrollWithUserIdentifier:", v14);

      goto LABEL_12;
    default:
      +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[SDMDMConfiguratorDaemon configureWithOfferProgramTokens:requireProgramToken:enrollmentPolicy:userIdentifier:completion:].cold.1(a5, v19, v20);

      v21 = 3;
      goto LABEL_13;
  }
}

+ (int64_t)conditionallyUnenrollIfNotMatchingOfferedTokensWithConfig:(id)a3 userIdentifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136446210;
    v20 = "+[SDMDMConfiguratorDaemon conditionallyUnenrollIfNotMatchingOfferedTokensWithConfig:userIdentifier:]";
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v19, 0xCu);
  }

  +[SDBetaManager _currentBetaProgram](SDBetaManager, "_currentBetaProgram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isMDMProgram"))
  {
    objc_msgSend(v8, "betaEnrollmentToken");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v19 = 138543362;
      v20 = v9;
      _os_log_impl(&dword_1D4F89000, v10, OS_LOG_TYPE_INFO, "Currently enrolled in MDM program with token [%{public}@]", (uint8_t *)&v19, 0xCu);
    }

    if (!v9)
    {
      +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        +[SDMDMConfiguratorDaemon conditionallyUnenrollIfNotMatchingOfferedTokensWithConfig:userIdentifier:].cold.1(v8, v11);

    }
    objc_msgSend(v5, "tokens");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v9);

    if ((v13 & 1) == 0)
    {
      +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(v8, "programID");
        objc_msgSend(v8, "betaEnrollmentToken");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 134218242;
        v20 = (const char *)v15;
        v21 = 2114;
        v22 = v16;
        _os_log_impl(&dword_1D4F89000, v14, OS_LOG_TYPE_DEFAULT, "Currently enrolled MDM program [%lu: %{public}@] not in offered set. Will unenroll.", (uint8_t *)&v19, 0x16u);

      }
      +[SDDevice _currentDevice](SDDevice, "_currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_unenrollWithUserIdentifier:", v6);

    }
  }

  return 0;
}

+ (int64_t)applyMDMConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateCache");

  +[SDPersistence saveMDMConfiguration:](SDPersistence, "saveMDMConfiguration:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = 3;
  else
    v6 = 0;

  return v6;
}

+ (int64_t)enrollWithRequireProgramToken:(id)a3 userIdentifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  int64_t v13;
  uint64_t v15;
  uint64_t v16;
  intptr_t (*v17)(uint64_t, uint64_t);
  void *v18;
  NSObject *v19;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = "+[SDMDMConfiguratorDaemon enrollWithRequireProgramToken:userIdentifier:]";
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x2020000000;
  v23 = 0;
  v8 = dispatch_semaphore_create(0);
  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __72__SDMDMConfiguratorDaemon_enrollWithRequireProgramToken_userIdentifier___block_invoke;
  v18 = &unk_1E98CF6E0;
  p_buf = &buf;
  v10 = v8;
  v19 = v10;
  objc_msgSend(v9, "enrollInProgramWithToken:userIdentifier:shouldSaveToken:completion:", v5, v6, 0, &v15);

  v11 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle", v15, v16, v17, v18);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[SDMDMConfiguratorDaemon enrollWithRequireProgramToken:userIdentifier:].cold.1(v12);

    v13 = 3;
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = 3;
  }
  else
  {
    v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  }

  _Block_object_dispose(&buf, 8);
  return v13;
}

intptr_t __72__SDMDMConfiguratorDaemon_enrollWithRequireProgramToken_userIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)isBetaEnrollmentDisabled
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v4, "Failed to load mdm configuration: %{public}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1();
}

+ (void)configureWithOfferProgramTokens:(uint64_t)a3 requireProgramToken:enrollmentPolicy:userIdentifier:completion:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = "Unknown";
  if (a1 == 3)
    v3 = "AlwaysOff";
  v4 = 136446210;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, a3, "Unknown enrollment policy: [%{public}s]", (uint8_t *)&v4);
}

+ (void)conditionallyUnenrollIfNotMatchingOfferedTokensWithConfig:(void *)a1 userIdentifier:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "programID");
  _os_log_fault_impl(&dword_1D4F89000, a2, OS_LOG_TYPE_FAULT, "Unexpected nil beta enrollment token for program %lu", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)enrollWithRequireProgramToken:(os_log_t)log userIdentifier:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D4F89000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for -[SDBetaManager enrollInProgramWithToken:userIdentifier:completion:]", v1, 2u);
}

@end
