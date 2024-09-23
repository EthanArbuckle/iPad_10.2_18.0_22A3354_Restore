@implementation SDMDMConfigurator

+ (void)configureWithOfferProgramTokens:(id)a3 requireProgramToken:(id)a4 enrollmentPolicy:(int64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  int64_t v26;
  id *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a5 > 3)
      v12 = "Unknown";
    else
      v12 = off_1E98CF5F0[a5];
    *(_DWORD *)buf = 136446723;
    v35 = "+[SDMDMConfigurator configureWithOfferProgramTokens:requireProgramToken:enrollmentPolicy:error:]";
    v36 = 2113;
    v37 = v10;
    v38 = 2082;
    v39 = v12;
    _os_log_impl(&dword_1D4F89000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}s requireToken [%{private}@] policy [%{public}s]", buf, 0x20u);
  }

  v13 = objc_msgSend(v9, "count");
  +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v14, OS_LOG_TYPE_DEFAULT, "offerTokens:", buf, 2u);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v14 = v9;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v16)
    {
      v17 = v16;
      v25 = v10;
      v26 = a5;
      v27 = a6;
      v28 = v9;
      v18 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v14);
          v20 = *(const char **)(*((_QWORD *)&v29 + 1) + 8 * i);
          +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle", v25, v26, v27, v28);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v35 = v20;
            _os_log_impl(&dword_1D4F89000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]", buf, 0xCu);
          }

        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v17);
      a6 = v27;
      v9 = v28;
      v10 = v25;
      a5 = v26;
    }
  }
  else if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4F89000, v14, OS_LOG_TYPE_DEFAULT, "No offer-tokens given.", buf, 2u);
  }

  v22 = objc_msgSend(v9, "count");
  if ((unint64_t)a5 <= 1 && !v10 && !v22)
  {
    +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v23, OS_LOG_TYPE_DEFAULT, "Called with parameters matching reset condition.", buf, 2u);
    }

  }
  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configureWithOfferProgramTokens:requireProgramToken:enrollmentPolicy:error:", v9, v10, a5, a6);

}

+ (void)resetMDMConfigurationWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446210;
    v8 = "+[SDMDMConfigurator resetMDMConfigurationWithError:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(a1, "configureWithOfferProgramTokens:requireProgramToken:enrollmentPolicy:error:", v6, 0, 0, a3);

}

+ (void)enrollInProgramWithMDMToken:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446467;
    v10 = "+[SDMDMConfigurator enrollInProgramWithMDMToken:completion:]";
    v11 = 2113;
    v12 = v5;
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s token [%{private}@]", (uint8_t *)&v9, 0x16u);
  }

  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enrollInProgramWithToken:completion:", v5, v6);

}

+ (void)setupAssistant_enrollInProgramWithMDMToken:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446467;
    v10 = "+[SDMDMConfigurator setupAssistant_enrollInProgramWithMDMToken:completion:]";
    v11 = 2113;
    v12 = v5;
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s token [%{private}@]", (uint8_t *)&v9, 0x16u);
  }

  +[SDBetaEnrollmentHelper sharedInstance](SDBetaEnrollmentHelper, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setupAssistant_enrollInProgramWithBetaEnrollmentToken:completion:", v5, v6);

}

+ (id)loadMDMConfigurationWithError:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging mdmHandle](SDSeedingLogging, "mdmHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446210;
    v9 = "+[SDMDMConfigurator loadMDMConfigurationWithError:]";
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v8, 0xCu);
  }

  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadMDMConfigurationWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
