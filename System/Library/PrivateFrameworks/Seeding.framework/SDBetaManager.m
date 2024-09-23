@implementation SDBetaManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_7);
  return (id)sharedManager__self;
}

uint64_t __30__SDBetaManager_sharedManager__block_invoke()
{
  SDBetaManager *v0;
  void *v1;

  v0 = objc_alloc_init(SDBetaManager);
  v1 = (void *)sharedManager__self;
  sharedManager__self = (uint64_t)v0;

  return objc_msgSend((id)sharedManager__self, "setIsMigratingFromProfiles:", 0);
}

- (id)verifyURLForCatalog:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("catalog_url");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SDBetaManager serverURLWithPath:arguments:](self, "serverURLWithPath:arguments:", CFSTR("/catalog/verify"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)verifyURLForAssetAudience:(id)a3 programID:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("asset_audience");
  v13[1] = CFSTR("id");
  v14[0] = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SDBetaManager serverURLWithPath:arguments:](self, "serverURLWithPath:arguments:", CFSTR("/catalog/verify"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)migrateURLForAssetAudience:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("asset_audience");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SDBetaManager serverURLWithPath:arguments:](self, "serverURLWithPath:arguments:", CFSTR("/catalog/migrate"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)membershipURL
{
  return -[SDBetaManager membershipURLForPlatforms:](self, "membershipURLForPlatforms:", 4);
}

- (id)membershipURLForPlatforms:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("platforms");
  SDStringArrayFromPlatforms(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDBetaManager serverURLWithPath:arguments:](self, "serverURLWithPath:arguments:", CFSTR("/membership/programs"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)serverURLWithPath:(id)a3 arguments:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[SDHTTPClient sharedInstance](SDHTTPClient, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/api/v4"), "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "stringByAppendingPathComponent:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPath:", v12);

    if (!v6)
      goto LABEL_13;
  }
  else
  {
    objc_msgSend(v9, "setPath:", v5);
    if (!v6)
      goto LABEL_13;
  }
  v28 = v9;
  v29 = v5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v6, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x1E0CB39D8];
        objc_msgSend(v6, "objectForKeyedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "queryItemWithName:value:", v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "addObject:", v22);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;
  objc_msgSend(v28, "setQueryItems:", v23);

  v5 = v29;
  v11 = v27;
LABEL_13:
  objc_msgSend(v9, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");

  return v25;
}

- (void)invalidateCache
{
  NSObject *v3;
  uint8_t v4[16];

  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D4F89000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating program cache", v4, 2u);
  }

  -[SDBetaManager setCachedPrograms:](self, "setCachedPrograms:", 0);
  -[SDBetaManager setCachedPlatform:](self, "setCachedPlatform:", 0);
  -[SDBetaManager setLastCached:](self, "setLastCached:", 0);
}

- (void)invalidateCacheWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SDBetaManager invalidateCacheWithCompletion:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  -[SDBetaManager invalidateCache](self, "invalidateCache");
  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__SDBetaManager_invalidateCacheWithCompletion___block_invoke;
  v8[3] = &unk_1E98CF330;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "invalidateCacheWithCompletion:", v8);

}

uint64_t __47__SDBetaManager_invalidateCacheWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isCacheValidForPlatforms:(unint64_t)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  _BOOL4 v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  BOOL v18;
  int v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[SDBetaManager cachedPrograms](self, "cachedPrograms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SDBetaManager cachedPrograms](self, "cachedPrograms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v7 = 0;
  }

  v8 = -[SDBetaManager cachedPlatform](self, "cachedPlatform");
  -[SDBetaManager lastCached](self, "lastCached");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaManager lastCached](self, "lastCached");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    v13 = v12 < 300.0;

  }
  else
  {
    v13 = 0;
  }

  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("false");
    if (v7)
      v16 = CFSTR("true");
    else
      v16 = CFSTR("false");
    if (v8 == a3)
      v17 = CFSTR("true");
    else
      v17 = CFSTR("false");
    v20 = 138543874;
    v21 = v16;
    v22 = 2114;
    v23 = v17;
    if (v13)
      v15 = CFSTR("true");
    v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_1D4F89000, v14, OS_LOG_TYPE_DEFAULT, "IsCacheValid: hasPrograms [%{public}@], hasMatchingPlatform [%{public}@], isWithinTimeout: [%{public}@]", (uint8_t *)&v20, 0x20u);
  }

  v18 = v8 == a3 && v7;
  return v18 && v13;
}

- (BOOL)canCurrentDeviceEnrollInBetaUpdates
{
  NSObject *v2;
  void *v3;
  char v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6 = 136446210;
    v7 = "-[SDBetaManager canCurrentDeviceEnrollInBetaUpdates]";
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canCurrentDeviceEnrollInBetaProgram");

  return v4;
}

- (BOOL)_canCurrentDeviceEnrollInBetaUpdates
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  int v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  SeedingDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("AlwaysShowBetaUpdates"));

  +[SDDevice _currentDevice](SDDevice, "_currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDBetaManager availableBetaProgramsForPlatforms:](self, "availableBetaProgramsForPlatforms:", objc_msgSend(v5, "platform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = -[SDBetaManager _isEnrolledInBetaProgram](self, "_isEnrolledInBetaProgram");
  v9 = -[SDBetaManager _isEnrollmentAllowedByDeviceManagement_legacy](self, "_isEnrollmentAllowedByDeviceManagement_legacy");
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = CFSTR("NO");
    if (v4)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    if (v8)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v19 = 138544130;
    v20 = v12;
    if (v7)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v21 = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v14;
    if (v9)
      v11 = CFSTR("YES");
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_1D4F89000, v10, OS_LOG_TYPE_INFO, "Can Enroll? Override: %{public}@ || Enrolled: %{public}@ || HasPrograms: %{public}@ && isMDMAllowed: %{public}@", (uint8_t *)&v19, 0x2Au);
  }

  if (v7)
    v15 = v9;
  else
    v15 = 0;
  v16 = v8 || v15;
  v17 = (v4 & 1) != 0 || v16;

  return v17;
}

- (BOOL)_isEnrollmentAllowedByDeviceManagement_legacy
{
  void *v2;
  char v3;

  SeedingDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("RestrictEnrollment"));

  return (v3 & 1) == 0
      && +[SDProfileUtilities isProfileInstallationAllowed](SDProfileUtilities, "isProfileInstallationAllowed");
}

- (void)queryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  void (**v12)(id, void *, _QWORD);
  unint64_t v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, _QWORD))a4;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[SDBetaManager queryProgramsForSystemAccountsWithPlatforms:completion:]";
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  if (-[SDBetaManager isCacheValidForPlatforms:](self, "isCacheValidForPlatforms:", a3))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v8, OS_LOG_TYPE_DEFAULT, "Returning cached programs.", buf, 2u);
    }

    -[SDBetaManager cachedPrograms](self, "cachedPrograms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v9, 0);

  }
  else
  {
    +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__SDBetaManager_queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke;
    v11[3] = &unk_1E98CFA20;
    v11[4] = self;
    v13 = a3;
    v12 = v6;
    objc_msgSend(v10, "queryProgramsForSystemAccountsWithPlatforms:completion:", a3, v11);

  }
}

void __72__SDBetaManager_queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "programs returned: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "savePrograms:forPlatforms:", v3, *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_queryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 completion:(id)a4
{
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  BOOL v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *context;
  void *v36;
  void *v37;
  int v38;
  void (**v39)(id, _QWORD, uint64_t);
  SDBetaManager *v40;
  void *v41;
  _QWORD block[5];
  id v43;
  void (**v44)(id, _QWORD, uint64_t);
  __int128 *v45;
  unint64_t v46;
  char v47;
  _QWORD v48[5];
  NSObject *v49;
  id v50;
  __int128 *p_buf;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t v57[4];
  uint64_t v58;
  __int128 buf;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v39 = (void (**)(id, _QWORD, uint64_t))a4;
  v40 = self;
  v6 = -[SDBetaManager isCacheValidForPlatforms:](self, "isCacheValidForPlatforms:", a3);
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a3;
      _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "Fetching new program list from server for platform [%ld] (resetting cache).", (uint8_t *)&buf, 0xCu);
    }

    -[SDBetaManager setCachedPlatform:](self, "setCachedPlatform:", 0);
    -[SDBetaManager setLastCached:](self, "setLastCached:", 0);
    context = (void *)MEMORY[0x1D826D430](-[SDBetaManager setCachedPrograms:](self, "setCachedPrograms:", MEMORY[0x1E0C9AA60]));
    v10 = dispatch_group_create();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__1;
    v62 = __Block_byref_object_dispose__1;
    v63 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
    +[SDPersistence loadMDMConfigurationWithError:](SDPersistence, "loadMDMConfigurationWithError:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v38 = objc_msgSend(v11, "restrictUserPrograms");
    }
    else
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v57 = 0;
        _os_log_impl(&dword_1D4F89000, v13, OS_LOG_TYPE_INFO, "No MDM configuration found", v57, 2u);
      }

      v38 = 0;
    }
    objc_msgSend(v12, "tokens");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    if (v38)
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[SDBetaManager _queryProgramsForSystemAccountsWithPlatforms:completion:].cold.1();

      dispatch_group_enter(v10);
      dispatch_group_leave(v10);
    }
    else
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[SDBetaManager _queryProgramsForSystemAccountsWithPlatforms:completion:].cold.3();

      objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "aida_accountForPrimaryiCloudAccount");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      SeedingDefaults();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringForKey:", CFSTR("AppleAccountIdentifier"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v41, "accountWithIdentifier:");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v57 = 0;
          _os_log_impl(&dword_1D4F89000, v17, OS_LOG_TYPE_DEFAULT, "Will use iCloud account", v57, 2u);
        }

        objc_msgSend(v36, "addObject:", v33);
      }
      if (v32)
      {
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v57 = 0;
          _os_log_impl(&dword_1D4F89000, v18, OS_LOG_TYPE_DEFAULT, "Will use Seeding account", v57, 2u);
        }

        objc_msgSend(v36, "addObject:", v32);
      }
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v36, "count");
        *(_DWORD *)v57 = 134217984;
        v58 = v20;
        _os_log_impl(&dword_1D4F89000, v19, OS_LOG_TYPE_DEFAULT, "Fetched accounts [%lu]", v57, 0xCu);
      }

      v30 = objc_msgSend(v36, "count");
      if (v30)
      {
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v21 = v36;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v53 != v23)
                objc_enumerationMutation(v21);
              v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
              v26 = (void *)MEMORY[0x1D826D430]();
              dispatch_group_enter(v10);
              v48[0] = MEMORY[0x1E0C809B0];
              v48[1] = 3221225472;
              v48[2] = __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke;
              v48[3] = &unk_1E98CFA48;
              v48[4] = v25;
              v49 = v10;
              v50 = v41;
              p_buf = &buf;
              objc_msgSend(v25, "fetchCredentialTokenWithCompletion:", v48);

              objc_autoreleasePoolPop(v26);
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
          }
          while (v22);
        }

        v27 = v30;
      }
      else
      {
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[SDBetaManager _queryProgramsForSystemAccountsWithPlatforms:completion:].cold.2();

        v39[2](v39, 0, 1);
        v27 = 0;
      }
      v29 = v27 == 0;

      if (v29)
        goto LABEL_45;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke_233;
    block[3] = &unk_1E98CFA70;
    v45 = &buf;
    v47 = v38;
    v44 = v39;
    block[4] = v40;
    v46 = a3;
    v43 = v37;
    dispatch_group_notify(v10, MEMORY[0x1E0C80D38], block);

LABEL_45:
    _Block_object_dispose(&buf, 8);

    objc_autoreleasePoolPop(context);
    goto LABEL_46;
  }
  if (v8)
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "Query for platforms [%ld] was cached, reusing answer.", (uint8_t *)&buf, 0xCu);
  }

  -[SDBetaManager cachedPrograms](self, "cachedPrograms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, uint64_t))v39)[2](v39, v9, 0);

LABEL_46:
}

void __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[2];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "credentialForAccount:serviceID:", *(_QWORD *)(a1 + 32), CFSTR("com.apple.gs.beta.auth"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "aida_alternateDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = (uint64_t)v5;
      _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_INFO, "altDSID:     %@", buf, 0xCu);
    }

    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "username");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = (uint64_t)v8;
      _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_INFO, "username:    %@", buf, 0xCu);

    }
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "keysForCredentialItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 134217984;
      v21 = v11;
      _os_log_impl(&dword_1D4F89000, v9, OS_LOG_TYPE_INFO, "credentials: %ld", buf, 0xCu);

    }
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "token");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = (uint64_t)v13;
      _os_log_impl(&dword_1D4F89000, v12, OS_LOG_TYPE_INFO, "cred token:  %@", buf, 0xCu);

    }
    if (v5)
    {
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v18[0] = CFSTR("credential_token");
      v18[1] = CFSTR("adsid_token");
      v19[0] = v3;
      v19[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);
    }
    else
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke_cold_1((id *)(a1 + 32), v15);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_impl(&dword_1D4F89000, v16, OS_LOG_TYPE_DEFAULT, "No credential token for account %@", buf, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

uint64_t __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke_233(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v8[16];

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
    return objc_msgSend(*(id *)(a1 + 32), "_finallyQueryProgramsForSystemAccountsWithPlatforms:credentials:betaEnrollmentTokens:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(unsigned __int8 *)(a1 + 72);
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "Not using AppleID accounts to query for programs.", v8, 2u);
    }

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    return objc_msgSend(*(id *)(a1 + 32), "_finallyQueryProgramsForSystemAccountsWithPlatforms:credentials:betaEnrollmentTokens:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke_233_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_finallyQueryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 credentials:(id)a4 betaEnrollmentTokens:(id)a5 completion:(id)a6
{
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  SDBetaManager *v51;
  id v52;
  id v53[2];
  uint8_t buf[4];
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v45 = a4;
  v9 = a5;
  v39 = a6;
  v46 = v9;
  LODWORD(v9) = objc_msgSend(v9, "count") == 0;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v9)
  {
    if (!v11)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v12 = "Querying programs";
    v13 = v10;
    v14 = 2;
  }
  else
  {
    if (!v11)
      goto LABEL_7;
    *(_DWORD *)buf = 134217984;
    v55 = objc_msgSend(v46, "count");
    v12 = "Querying programs with [%ld] Beta Enrollment Tokens";
    v13 = v10;
    v14 = 12;
  }
  _os_log_impl(&dword_1D4F89000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_7:

  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E0C80D38], &__block_literal_global_236);
  objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "uniqueDeviceIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "serverFriendlyDescription");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB37A8];
  -[SDBetaManager membershipURLForPlatforms:](self, "membershipURLForPlatforms:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "requestWithURL:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", CFSTR("com.apple.gs.beta.auth"));
  objc_msgSend(v18, "appleIDHeadersForRequest:", v17);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v17, "allHTTPHeaderFields");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryWithDictionary:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addEntriesFromDictionary:", v42);
  objc_msgSend(v21, "setValue:forKey:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(v21, "setValue:forKey:", CFSTR("application/json"), CFSTR("Accept"));
  objc_msgSend(v21, "setValue:forKey:", v43, CFSTR("X-Mme-Device-Id"));
  objc_msgSend(v21, "setValue:forKey:", CFSTR("AAAABQAAABAxmM8oXLJsHORxxxxxxxxxAAAAAw=="), CFSTR("X-Apple-I-MD"));
  objc_msgSend(v21, "setValue:forKey:", v41, CFSTR("X-MMe-Client-Info"));
  objc_msgSend(v17, "setAllHTTPHeaderFields:", v21);
  +[SDHTTPClient sharedInstance](SDHTTPClient, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "urlSession");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "set_appleIDContext:", v18);
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v55 = (uint64_t)v21;
    _os_log_impl(&dword_1D4F89000, v24, OS_LOG_TYPE_INFO, "headers: %@", buf, 0xCu);
  }

  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v23, "HTTPAdditionalHeaders");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v55 = (uint64_t)v26;
    _os_log_impl(&dword_1D4F89000, v25, OS_LOG_TYPE_INFO, "Additional Headers: %{public}@", buf, 0xCu);

  }
  v27 = (void *)MEMORY[0x1E0CB39F0];
  +[SDHTTPClient sharedInstance](SDHTTPClient, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sessionWithConfiguration:delegate:delegateQueue:", v23, v28, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  if (v46)
  {
    objc_msgSend(v46, "allObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("beta_enrollment_tokens"));

  }
  if (v45)
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v45, CFSTR("tokens"));
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    -[SDBetaManager _finallyQueryProgramsForSystemAccountsWithPlatforms:credentials:betaEnrollmentTokens:completion:].cold.2(v17, v32);

  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    -[SDBetaManager _finallyQueryProgramsForSystemAccountsWithPlatforms:credentials:betaEnrollmentTokens:completion:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v30, 1, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHTTPBody:", v34);
  objc_msgSend(v17, "setHTTPMethod:", CFSTR("POST"));
  objc_initWeak((id *)buf, self);
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_263;
  v48[3] = &unk_1E98CFAB8;
  v35 = v18;
  v49 = v35;
  v36 = v17;
  v50 = v36;
  v37 = v39;
  v51 = self;
  v52 = v37;
  objc_copyWeak(v53, (id *)buf);
  v53[1] = (id)a3;
  objc_msgSend(v29, "dataTaskWithRequest:completionHandler:", v36, v48);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "resume");

  objc_destroyWeak(v53);
  objc_destroyWeak((id *)buf);

}

void __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_263(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id WeakRetained;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  char v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v58 = 1;
  v10 = v8;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "allHeaderFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("X-Request-Id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v61 = v13;
    _os_log_impl(&dword_1D4F89000, v11, OS_LOG_TYPE_DEFAULT, "/programs X-Request-Id: %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "handleResponse:forRequest:shouldRetry:", v10, *(_QWORD *)(a1 + 40), &v58);
  if (v9)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_263_cold_3();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setProfilesEnabledFromHeaderInResponse:", v10);
    v57 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v57);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v57;
    if (v15)
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("programs"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v43 = v16;
        v44 = v15;
        v46 = v10;
        v47 = v7;
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        v45 = a1;
        objc_msgSend(WeakRetained, "saveResponse:platforms:", v17, *(_QWORD *)(a1 + 72));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        obj = v19;
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v54 != v22)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v24, "title");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v24, "programID");
                objc_msgSend(v24, "assetAudience");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v61 = v26;
                v62 = 2048;
                v63 = v27;
                v64 = 2114;
                v65 = v28;
                _os_log_impl(&dword_1D4F89000, v25, OS_LOG_TYPE_DEFAULT, "Loaded program [%{public}@ - %lu] assetAudience: [%{public}@]", buf, 0x20u);

              }
            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
          }
          while (v21);
        }

        objc_msgSend((id)objc_opt_class(), "_currentBetaProgram");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v30 = obj;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v50;
            while (2)
            {
              for (j = 0; j != v32; ++j)
              {
                if (*(_QWORD *)v50 != v33)
                  objc_enumerationMutation(v30);
                v35 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
                v36 = objc_msgSend(v35, "programID");
                if (v36 == objc_msgSend(v29, "programID"))
                {
                  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v29, "description");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "description");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v61 = v40;
                    v62 = 2114;
                    v63 = (uint64_t)v41;
                    _os_log_impl(&dword_1D4F89000, v39, OS_LOG_TYPE_DEFAULT, "Replacing current program %{public}@ with new program %{public}@", buf, 0x16u);

                  }
                  objc_msgSend(*(id *)(v45 + 48), "_saveBetaProgram:", v35);
                  goto LABEL_37;
                }
              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
              if (v32)
                continue;
              break;
            }
          }
LABEL_37:

        }
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v42 = objc_claimAutoreleasedReturnValue();
        v9 = 0;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v61 = v17;
          _os_log_impl(&dword_1D4F89000, v42, OS_LOG_TYPE_DEFAULT, "JSON response: %{private}@", buf, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(v45 + 56) + 16))();
        v7 = v47;
        v10 = v46;
        v16 = v43;
        v15 = v44;
      }
      else
      {
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_263_cold_2();

        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }

    }
    else
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_263_cold_1();

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

- (void)savePrograms:(id)a3 forPlatforms:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a4;
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "Saving programs to cache for platforms [%ld].", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDBetaManager setLastCached:](self, "setLastCached:", v8);

  -[SDBetaManager setCachedPlatform:](self, "setCachedPlatform:", a4);
  -[SDBetaManager setCachedPrograms:](self, "setCachedPrograms:", v6);

}

- (id)saveResponse:(id)a3 platforms:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  SDBetaManager *v24;
  void *v25;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SDDevice osBuild](SDDevice, "osBuild");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v29 = v7;
    v27 = a4;
    if (SDIsInternalInstall())
    {
      SeedingDefaults();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("DisableBuildFiltering"));

      if (v9)
      {
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D4F89000, v10, OS_LOG_TYPE_DEFAULT, "Skipping build prefix filtering", buf, 2u);
        }

        v11 = 1;
      }
      else
      {
        v11 = 0;
      }
      v7 = v29;
    }
    else
    {
      v11 = 0;
    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v28 = v6;
    obj = v6;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      v16 = 0x1E98CE000uLL;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(v16 + 2576), "betaProgramWithJSON:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v27);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            if ((v11 & 1) != 0
              || (v19 = (void *)objc_opt_class(),
                  objc_msgSend(v18, "buildPrefix"),
                  v20 = v16,
                  v21 = (void *)objc_claimAutoreleasedReturnValue(),
                  LODWORD(v19) = objc_msgSend(v19, "isBuildPrefix:greaterThanOrEqualToBuild:", v21, v7),
                  v21,
                  v16 = v20,
                  (_DWORD)v19))
            {
              objc_msgSend(v30, "addObject:", v18);
            }
            else
            {
              +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v18, "description");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "buildPrefix");
                v24 = self;
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v37 = v23;
                v38 = 2114;
                v39 = v25;
                _os_log_impl(&dword_1D4F89000, v22, OS_LOG_TYPE_DEFAULT, "Skipping beta program %{public}@ because build prefix %{public}@ doesn't match device build.", buf, 0x16u);

                self = v24;
                v7 = v29;

                v16 = v20;
              }

            }
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v14);
    }

    -[SDBetaManager savePrograms:forPlatforms:](self, "savePrograms:forPlatforms:", v30, v27);
    -[SDBetaManager cachedPrograms](self, "cachedPrograms");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v28;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

+ (BOOL)isBuildPrefix:(id)a3 greaterThanOrEqualToBuild:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 1;
  if (v5 && v6)
  {
    v9 = objc_msgSend(v5, "length");
    if (v9 > objc_msgSend(v7, "length"))
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[SDBetaManager isBuildPrefix:greaterThanOrEqualToBuild:].cold.1();
      v8 = 1;
LABEL_26:

      goto LABEL_27;
    }
    if ((objc_msgSend(v7, "hasPrefix:", v5) & 1) == 0)
    {
      v34 = 0;
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(\\d+)([A-Za-z])?"), 1, &v34);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v34;
      if (v10)
      {
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          +[SDBetaManager isBuildPrefix:greaterThanOrEqualToBuild:].cold.3(v10, v12);
        v8 = 1;
      }
      else
      {
        objc_msgSend(v11, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v12 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12
          && v15
          && -[NSObject numberOfRanges](v12, "numberOfRanges") == 3
          && objc_msgSend(v15, "numberOfRanges") == 3)
        {
          v8 = 1;
          v16 = -[NSObject rangeAtIndex:](v12, "rangeAtIndex:", 1);
          objc_msgSend(v7, "substringWithRange:", v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "integerValue");

          v20 = objc_msgSend(v15, "rangeAtIndex:", 1);
          objc_msgSend(v5, "substringWithRange:", v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "integerValue");

          if (v23 <= v19)
          {
            if (objc_msgSend(v15, "rangeAtIndex:", 2) == 0x7FFFFFFFFFFFFFFFLL
              || -[NSObject rangeAtIndex:](v12, "rangeAtIndex:", 2) == 0x7FFFFFFFFFFFFFFFLL)
            {
              v8 = v23 == v19;
            }
            else if (v23 == v19)
            {
              v26 = -[NSObject rangeAtIndex:](v12, "rangeAtIndex:", 2);
              objc_msgSend(v7, "substringWithRange:", v26, v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "uppercaseString");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              v30 = objc_msgSend(v15, "rangeAtIndex:", 2);
              objc_msgSend(v7, "substringWithRange:", v30, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "uppercaseString");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v8 = objc_msgSend(v33, "compare:", v29) != 1;
            }
            else
            {
              v8 = 0;
            }
          }
        }
        else
        {
          +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            +[SDBetaManager isBuildPrefix:greaterThanOrEqualToBuild:].cold.2();

          v8 = 1;
        }

      }
      goto LABEL_26;
    }
    v8 = 1;
  }
LABEL_27:

  return v8;
}

- (id)availableBetaProgramsForPlatforms:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v20 = "-[SDBetaManager availableBetaProgramsForPlatforms:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  v6 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SDBetaManager cachedPrograms](self, "cachedPrograms", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v12, "platform") & a3) != 0)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)enrollDevice:(id)a3 inBetaProgram:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, void *);
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v19 = "-[SDBetaManager enrollDevice:inBetaProgram:completion:]";
    _os_log_impl(&dword_1D4F89000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  if (objc_msgSend(v7, "isErrorDevice"))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SDBetaManager enrollDevice:inBetaProgram:completion:].cold.1(v11, v12, v13);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), 14, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v14);
  }
  else
  {
    +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__SDBetaManager_enrollDevice_inBetaProgram_completion___block_invoke;
    v16[3] = &unk_1E98CF330;
    v17 = v9;
    objc_msgSend(v15, "enrollDevice:inProgram:completion:", v7, v8, v16);

    v14 = v17;
  }

}

uint64_t __55__SDBetaManager_enrollDevice_inBetaProgram_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enrollDevice:(id)a3 withEnrollmentMetadata:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void (**v21)(id, void *);
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  void (**v25)(id, void *);
  void (**v26)(id, void *);
  _QWORD v27[5];
  id v28;
  void (**v29)(id, void *);
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = a4;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4F89000, v11, OS_LOG_TYPE_DEFAULT, "Enrolling device with metadata", buf, 2u);
  }

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AssetAudience"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProgramID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isErrorDevice"))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SDBetaManager enrollDevice:withEnrollmentMetadata:completion:].cold.1(v14, v15, v16);

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = 14;
    goto LABEL_13;
  }
  if (!v12)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = 4;
LABEL_13:
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), v18, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v22);

    goto LABEL_18;
  }
  if (v13)
  {
    v19 = objc_msgSend(v13, "integerValue");
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v13;
      _os_log_impl(&dword_1D4F89000, v20, OS_LOG_TYPE_DEFAULT, "Metadata has catalog ID %{public}@, will verify", buf, 0xCu);
    }

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __64__SDBetaManager_enrollDevice_withEnrollmentMetadata_completion___block_invoke_274;
    v24[3] = &unk_1E98CF778;
    v24[4] = self;
    v25 = (void (**)(id, void *))v8;
    v26 = v9;
    -[SDBetaManager verifyAssetAudience:programID:accountID:skipEnrollmentCheck:withCompletion:](self, "verifyAssetAudience:programID:accountID:skipEnrollmentCheck:withCompletion:", v12, v19, 0, 1, v24);

    v21 = v25;
  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v23, OS_LOG_TYPE_DEFAULT, "Metadata has no catalog ID, will migrate", buf, 2u);
    }

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __64__SDBetaManager_enrollDevice_withEnrollmentMetadata_completion___block_invoke;
    v27[3] = &unk_1E98CFAE0;
    v29 = v9;
    v27[4] = self;
    v28 = v8;
    -[SDBetaManager getMigrationProgramForAssetAudience:completion:](self, "getMigrationProgramForAssetAudience:completion:", v12, v27);

    v21 = v29;
  }

LABEL_18:
}

void __64__SDBetaManager_enrollDevice_withEnrollmentMetadata_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, "Metadata enroll via migration returned %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if (a3)
  {
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), 7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "enrollDevice:inBetaProgram:completion:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));
  }

}

void __64__SDBetaManager_enrollDevice_withEnrollmentMetadata_completion___block_invoke_274(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, "Metadata enroll via verify returned %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if (v5 && a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "enrollDevice:inBetaProgram:completion:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), 7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

- (void)enrollCurrentDeviceWithEnrollmentMetadata:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[SDBetaManager enrollCurrentDeviceWithEnrollmentMetadata:completion:]";
    _os_log_impl(&dword_1D4F89000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__SDBetaManager_enrollCurrentDeviceWithEnrollmentMetadata_completion___block_invoke;
  v11[3] = &unk_1E98CFB08;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  +[SDDevice getCurrentDevice:](SDDevice, "getCurrentDevice:", v11);

}

void __70__SDBetaManager_enrollCurrentDeviceWithEnrollmentMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isErrorDevice"))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__SDBetaManager_enrollCurrentDeviceWithEnrollmentMetadata_completion___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), 14, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "enrollDevice:withEnrollmentMetadata:completion:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)enrollmentMetadataForDevice:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136446210;
    v19 = "-[SDBetaManager enrollmentMetadataForDevice:completion:]";
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v18, 0xCu);
  }

  if (objc_msgSend(v5, "isErrorDevice"))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SDBetaManager enrollmentMetadataForDevice:completion:].cold.1(v8, v9, v10);

  }
  objc_msgSend(v5, "currentConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetAudience");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("AssetAudience"));

  objc_msgSend(v11, "seedProgramID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("ProgramID"));

  +[SDSeedProgramManager stringForSeedProgram:](SDSeedProgramManager, "stringForSeedProgram:", objc_msgSend(v11, "seedProgram"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("SeedProgram"));

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v17);

}

- (id)enrollmentMetadataForCurrentDevice
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v8 = 136446210;
    v9 = "-[SDBetaManager enrollmentMetadataForCurrentDevice]";
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getCurrentDeviceSynchronously");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enrollmentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enrollmentMetadataForCurrentDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v10 = "-[SDBetaManager enrollmentMetadataForCurrentDeviceWithCompletion:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__SDBetaManager_enrollmentMetadataForCurrentDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E98CFB30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[SDDevice getCurrentDevice:](SDDevice, "getCurrentDevice:", v7);

}

uint64_t __66__SDBetaManager_enrollmentMetadataForCurrentDeviceWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "enrollmentMetadataForDevice:completion:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_enrollUsingSeedingConfiguration:(id)a3
{
  -[SDBetaManager _enrollUsingSeedingConfiguration:userIdentifier:](self, "_enrollUsingSeedingConfiguration:userIdentifier:", a3, 0);
}

- (void)_enrollUsingSeedingConfiguration:(id)a3 userIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1D4F89000, v8, OS_LOG_TYPE_DEFAULT, "Enrolling [%{public}@]", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(v6, "assetAudience");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDBetaManager _setAssetAudienceString:](self, "_setAssetAudienceString:", v9);

  objc_msgSend(v6, "catalog");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v6, "catalog");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", &stru_1E98D0E68);

    if ((v13 & 1) == 0)
    {
      objc_msgSend(v6, "catalog");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SDBetaManager _setAssetServerURLString:](self, "_setAssetServerURLString:", v14);

    }
  }
  +[SDSeedProgramManager _setSeedProgramPref:](SDSeedProgramManager, "_setSeedProgramPref:", objc_msgSend(v6, "seedProgram"));
  -[SDBetaManager _setMemberEnrolled:](self, "_setMemberEnrolled:", 1);
  if (objc_msgSend(v6, "seedProgram") != 4)
    -[SDBetaManager _changeFBAVisibilityWithUserIdentifier:isVisible:](self, "_changeFBAVisibilityWithUserIdentifier:isVisible:", v7, 1);
  -[SDBetaManager _synchronizeCFPreferences](self, "_synchronizeCFPreferences");

}

- (void)_saveBetaProgram:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v3 = a3;
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SDBetaManager _saveBetaProgram:].cold.2(v3, v5, v7);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SDBetaManager _saveBetaProgram:].cold.1();

    CFPreferencesSetValue(CFSTR("BetaProgramObject"), v4, CFSTR("com.apple.seeding"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  }

}

- (void)_deleteBetaProgram
{
  CFPreferencesSetValue(CFSTR("BetaProgramObject"), 0, CFSTR("com.apple.seeding"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

+ (id)_currentBetaProgram
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v8;

  v2 = (void *)CFPreferencesCopyValue(CFSTR("BetaProgramObject"), CFSTR("com.apple.seeding"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v2)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v4)
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[SDBetaManager _currentBetaProgram].cold.1(v4, v5);

      v6 = 0;
    }
    else
    {
      v6 = v3;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)enrolledBetaProgramForDevice:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, _QWORD);
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "Getting current program for device %{public}@", buf, 0xCu);

  }
  if (objc_msgSend(v5, "isErrorDevice"))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SDBetaManager enrolledBetaProgramForDevice:completion:].cold.1(v9, v10, v11);

    v6[2](v6, 0);
  }
  else
  {
    +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__SDBetaManager_enrolledBetaProgramForDevice_completion___block_invoke;
    v13[3] = &unk_1E98CFB58;
    v14 = v6;
    objc_msgSend(v12, "enrolledBetaProgramForDevice:completion:", v5, v13);

  }
}

uint64_t __57__SDBetaManager_enrolledBetaProgramForDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)enrolledBetaProgramForCurrentDevice
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6 = 136446210;
    v7 = "-[SDBetaManager enrolledBetaProgramForCurrentDevice]";
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getCurrentDeviceEnrolledBetaProgramSynchronously");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)verifyCatalog:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1D4F89000, v8, OS_LOG_TYPE_DEFAULT, "Verifying %@", buf, 0xCu);
  }

  v9 = (void *)MEMORY[0x1E0CB37A8];
  -[SDBetaManager verifyURLForCatalog:](self, "verifyURLForCatalog:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestWithURL:cachePolicy:timeoutInterval:", v10, 1, 15.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[SDHTTPClient sharedInstance](SDHTTPClient, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "urlSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHTTPMethod:", CFSTR("GET"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke;
  v16[3] = &unk_1E98CFB80;
  v17 = v7;
  v14 = v7;
  objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v11, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resume");

}

void __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void (*v11)(void);
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_3();

    goto LABEL_5;
  }
  if (objc_msgSend(v8, "statusCode") != 200)
  {
    if (objc_msgSend(v8, "statusCode") == 204)
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_2();

      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_6;
    }
LABEL_5:
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_6:
    v11();
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("catalog"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[SDBetaProgram betaProgramWithJSON:](SDBetaProgram, "betaProgramWithJSON:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

LABEL_7:
}

- (void)verifyAssetAudience:(id)a3 programID:(int64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 136446210;
    v12 = "-[SDBetaManager verifyAssetAudience:programID:withCompletion:]";
    _os_log_impl(&dword_1D4F89000, v10, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v11, 0xCu);
  }

  -[SDBetaManager verifyAssetAudience:programID:accountID:skipEnrollmentCheck:withCompletion:](self, "verifyAssetAudience:programID:accountID:skipEnrollmentCheck:withCompletion:", v9, a4, 0, 0, v8);
}

- (void)verifyAssetAudience:(id)a3 programID:(int64_t)a4 accountID:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = 136446210;
    v15 = "-[SDBetaManager verifyAssetAudience:programID:accountID:withCompletion:]";
    _os_log_impl(&dword_1D4F89000, v13, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v14, 0xCu);
  }

  -[SDBetaManager verifyAssetAudience:programID:accountID:skipEnrollmentCheck:withCompletion:](self, "verifyAssetAudience:programID:accountID:skipEnrollmentCheck:withCompletion:", v12, a4, v11, 0, v10);
}

- (void)verifyAssetAudience:(id)a3 programID:(int64_t)a4 accountID:(id)a5 skipEnrollmentCheck:(BOOL)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *, uint64_t);
  void *v28;
  SDBetaManager *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (a6 || -[SDBetaManager _isEnrolledInBetaProgram](self, "_isEnrolledInBetaProgram"))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v12;
      _os_log_impl(&dword_1D4F89000, v15, OS_LOG_TYPE_DEFAULT, "Verifying asset audience %@", buf, 0xCu);
    }

    v16 = (void *)MEMORY[0x1E0CB37A8];
    -[SDBetaManager verifyURLForAssetAudience:programID:](self, "verifyURLForAssetAudience:programID:", v12, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "requestWithURL:cachePolicy:timeoutInterval:", v17, 1, 15.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[SDHTTPClient sharedInstance](SDHTTPClient, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "urlSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setHTTPMethod:", CFSTR("GET"));
    if (v13)
    {
      objc_msgSend(v13, "stringValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValue:forHTTPHeaderField:", v21, CFSTR("Seeding-Account-Id"));

    }
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v13;
      _os_log_impl(&dword_1D4F89000, v22, OS_LOG_TYPE_INFO, "[VERIFY] Seeding-Account-Id: %@", buf, 0xCu);
    }

    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __92__SDBetaManager_verifyAssetAudience_programID_accountID_skipEnrollmentCheck_withCompletion___block_invoke;
    v28 = &unk_1E98CF590;
    v29 = self;
    v30 = v14;
    objc_msgSend(v20, "dataTaskWithRequest:completionHandler:", v18, &v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resume", v25, v26, v27, v28);

  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v24, OS_LOG_TYPE_DEFAULT, "Device is not enrolled in a beta program, will not verify.", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);
  }

}

void __92__SDBetaManager_verifyAssetAudience_programID_accountID_skipEnrollmentCheck_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void (*v26)(void);
  NSObject *v27;
  int v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "allHeaderFields");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("X-Request-Id"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("(null)");
      if (v11)
        v13 = (__CFString *)v11;
      v14 = v13;

    }
    else
    {
      v14 = CFSTR("(non-HTTP response)");
    }
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138543362;
      v29 = v14;
      _os_log_impl(&dword_1D4F89000, v24, OS_LOG_TYPE_DEFAULT, "/verify X-Request-Id: %{public}@", (uint8_t *)&v28, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v14 = (__CFString *)v8;
    -[__CFString allHeaderFields](v14, "allHeaderFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("X-Request-Id"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = CFSTR("(null)");
    if (v16)
      v18 = (__CFString *)v16;
    v19 = v18;

    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138543362;
      v29 = v19;
      _os_log_impl(&dword_1D4F89000, v20, OS_LOG_TYPE_DEFAULT, "/verify X-Request-Id: %{public}@", (uint8_t *)&v28, 0xCu);
    }

    if (-[__CFString statusCode](v14, "statusCode") == 200)
    {
      objc_msgSend(*(id *)(a1 + 32), "setProfilesEnabledFromHeaderInResponse:", v14);
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", CFSTR("catalog"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        +[SDBetaProgram betaProgramWithJSON:](SDBetaProgram, "betaProgramWithJSON:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      else
      {
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_1();

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

    }
    else
    {
      if (-[__CFString statusCode](v14, "statusCode") == 204)
      {
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_2();

        objc_msgSend(*(id *)(a1 + 32), "setProfilesEnabledFromHeaderInResponse:", v14);
        v26 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      }
      else
      {
        v26 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      }
      v26();
    }

  }
}

- (void)unenrollDevice:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(id, _QWORD);
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[SDBetaManager unenrollDevice:completion:]";
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  if (objc_msgSend(v5, "isErrorDevice"))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SDBetaManager unenrollDevice:completion:].cold.1(v8, v9, v10);

    v6[2](v6, 0);
  }
  else
  {
    +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__SDBetaManager_unenrollDevice_completion___block_invoke;
    v12[3] = &unk_1E98CFBA8;
    v13 = v6;
    objc_msgSend(v11, "unenrollDevice:completion:", v5, v12);

  }
}

uint64_t __43__SDBetaManager_unenrollDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_unenrollFromBetaProgramWithUserIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v13 = 136446210;
    v14 = "-[SDBetaManager _unenrollFromBetaProgramWithUserIdentifier:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v13, 0xCu);
  }

  if (-[SDBetaManager _isEnrolledInBetaProgram](self, "_isEnrolledInBetaProgram"))
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.seeding"));
    v6 = (const __CFString *)*MEMORY[0x1E0C9B240];
    v7 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v8 = CFPreferencesCopyValue(CFSTR("OriginalSoftwareUpdate"), CFSTR("com.apple.seeding"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v9 = (void *)CFPreferencesCopyValue(CFSTR("OriginalUpdateBrain"), CFSTR("com.apple.seeding"), v6, v7);
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SDBetaManager _unenrollFromBetaProgramWithUserIdentifier:].cold.1();

    -[SDBetaManager _setAssetServerURLString:](self, "_setAssetServerURLString:", v8);
    -[SDBetaManager _setBrainServerURLString:](self, "_setBrainServerURLString:", v9);
    CFPreferencesAppSynchronize(CFSTR("com.apple.seeding"));
    v11 = (const __CFString *)*MEMORY[0x1E0C9B260];
    CFPreferencesSetValue(CFSTR("OriginalSoftwareUpdate"), 0, CFSTR("com.apple.seeding"), (CFStringRef)*MEMORY[0x1E0C9B260], v7);
    CFPreferencesSetValue(CFSTR("OriginalUpdateBrain"), 0, CFSTR("com.apple.seeding"), v11, v7);
    -[SDBetaManager _setMemberEnrolled:](self, "_setMemberEnrolled:", 0);
    -[SDBetaManager _deleteBetaProgram](self, "_deleteBetaProgram");
    -[SDBetaManager _changeFBAVisibilityWithUserIdentifier:isVisible:](self, "_changeFBAVisibilityWithUserIdentifier:isVisible:", v4, 0);
    -[SDBetaManager _synchronizeCFPreferences](self, "_synchronizeCFPreferences");
    -[SDBetaManager _resetAssetAudience](self, "_resetAssetAudience");
    +[SDAnalytics deviceDidUnenrollFromSeeding](SDAnalytics, "deviceDidUnenrollFromSeeding");

  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1D4F89000, v8, OS_LOG_TYPE_DEFAULT, "Unenrolling device that is already unenrolled.", (uint8_t *)&v13, 2u);
    }
  }

  return 1;
}

- (void)isDeviceEnrolledInBetaProgram:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(id, _QWORD);
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[SDBetaManager isDeviceEnrolledInBetaProgram:completion:]";
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  if (objc_msgSend(v5, "isErrorDevice"))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SDBetaManager isDeviceEnrolledInBetaProgram:completion:].cold.1(v8, v9, v10);

    v6[2](v6, 0);
  }
  else
  {
    +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__SDBetaManager_isDeviceEnrolledInBetaProgram_completion___block_invoke;
    v12[3] = &unk_1E98CFBA8;
    v13 = v6;
    objc_msgSend(v11, "isDeviceEnrolledInBetaProgram:completion:", v5, v12);

  }
}

uint64_t __58__SDBetaManager_isDeviceEnrolledInBetaProgram_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_isEnrolledInBetaProgram
{
  return objc_msgSend((id)objc_opt_class(), "_isEnrolledInBetaProgram");
}

+ (BOOL)_isEnrolledInBetaProgram
{
  void *v2;
  BOOL v3;
  CFPropertyListRef v4;

  objc_msgSend(a1, "_currentBetaProgram");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 1;
  }
  else
  {
    v4 = CFPreferencesCopyValue(CFSTR("MemberEnrolled"), CFSTR("com.apple.seeding"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v3 = v4 == (CFPropertyListRef)*MEMORY[0x1E0C9AE50];
    if (v4)
      CFRelease(v4);
  }

  return v3;
}

- (void)_setMemberEnrolled:(BOOL)a3
{
  const void *v3;

  if (a3)
    v3 = (const void *)*MEMORY[0x1E0C9AE50];
  else
    v3 = 0;
  CFPreferencesSetValue(CFSTR("MemberEnrolled"), v3, CFSTR("com.apple.seeding"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (void)_synchronizeCFPreferences
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.seeding"));
}

- (id)_assetServerURLString
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ASServerURLForAssetType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (v3)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v8 = CFSTR("com.apple.MobileAsset.SoftwareUpdate");
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_INFO, "Failed to get asset URL for type:%@ [%@]", buf, 0x16u);
    }

  }
  objc_msgSend(v2, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setAssetServerURLString:(id)a3
{
  __CFString *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || !-[__CFString length](v3, "length"))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "Setting asset server to %@", (uint8_t *)&v7, 0xCu);
    }

    ASSetAssetServerURLForAssetType();
  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = CFSTR("com.apple.MobileAsset.SoftwareUpdate");
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_INFO, "Failed to set asset URL for type:%@ (bad URL string %@)", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (id)_brainServerURLString
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ASServerURLForAssetType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (v3)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v8 = CFSTR("com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain");
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_INFO, "Failed to get brain URL for type:%@ [%@]", buf, 0x16u);
    }

  }
  objc_msgSend(v2, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setBrainServerURLString:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || !objc_msgSend(v3, "length"))
  {
    ASSetAssetServerURLForAssetType();
  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412546;
      v7 = CFSTR("com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain");
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "Failed to set brain URL for type:%@ (bad URL string %@)", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (void)_setAssetAudienceString:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = (uint64_t)v3;
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "will set mobile asset audience [%{public}@]", (uint8_t *)&v11, 0xCu);
  }

  if (objc_msgSend(v3, "length"))
  {
    v5 = MASetPallasAudience();
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = v5;
      v7 = "did set mobile asset audience with result [%lld]";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 12;
LABEL_8:
      _os_log_impl(&dword_1D4F89000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      v7 = "Failed to set audience: given value is nil";
      v8 = v6;
      v9 = OS_LOG_TYPE_INFO;
      v10 = 2;
      goto LABEL_8;
    }
  }

}

- (void)_resetAssetAudience
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_DEFAULT, "will reset mobile asset audience", (uint8_t *)&v5, 2u);
  }

  v3 = MASetPallasAudience();
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "did reset mobile asset audience with result [%lld]", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_changeFBAVisibilityWithUserIdentifier:(id)a3 isVisible:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unsigned int v7;
  NSObject *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  const void *v14;
  const __CFString *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v17;
  __CFString *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[SDBetaManager canToggleFBAVisibility](self, "canToggleFBAVisibility"))
  {
    v7 = objc_msgSend(v6, "longValue");
    if (!v7)
      goto LABEL_6;
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v17 = 134217984;
      v18 = (__CFString *)v7;
      _os_log_impl(&dword_1D4F89000, v8, OS_LOG_TYPE_INFO, "Fetching user for uid: [%lu]", (uint8_t *)&v17, 0xCu);
    }

    _CFPreferencesGetUserIdentifierForUID();
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_6:
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D4F89000, v10, OS_LOG_TYPE_INFO, "Falling back to default user", (uint8_t *)&v17, 2u);
      }

      v9 = CFSTR("mobile");
    }
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v12)
      {
        v17 = 138477827;
        v18 = v9;
        v13 = "Making FBA visible for user: [%{private}@]";
LABEL_16:
        _os_log_impl(&dword_1D4F89000, v11, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v17, 0xCu);
      }
    }
    else if (v12)
    {
      v17 = 138477827;
      v18 = v9;
      v13 = "Hiding FBA for user: [%{private}@]";
      goto LABEL_16;
    }

    if (v4)
      v14 = (const void *)*MEMORY[0x1E0C9AE50];
    else
      v14 = 0;
    v15 = (const __CFString *)*MEMORY[0x1E0C9B230];
    CFPreferencesSetValue(CFSTR("SBIconVisibility"), v14, CFSTR("com.apple.appleseed.FeedbackAssistant"), v9, (CFStringRef)*MEMORY[0x1E0C9B230]);
    CFPreferencesSynchronize(CFSTR("com.apple.appleseed.FeedbackAssistant"), (CFStringRef)*MEMORY[0x1E0C9B240], v15);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.appIconVisibilityPreferencesChanged"), 0, 0, 1u);
    goto LABEL_21;
  }
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1D4F89000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Device cannot file feedback. Cannot change FBA visibility", (uint8_t *)&v17, 2u);
  }
LABEL_21:

}

- (BOOL)canToggleFBAVisibility
{
  return +[SDBuildInfo isFeedbackAssistantAvailable](SDBuildInfo, "isFeedbackAssistantAvailable");
}

- (void)canFileFeedbackOnDevice:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(id, _QWORD);
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[SDBetaManager canFileFeedbackOnDevice:completion:]";
    _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  if (objc_msgSend(v5, "isErrorDevice"))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SDBetaManager canFileFeedbackOnDevice:completion:].cold.1(v8, v9, v10);

    v6[2](v6, 0);
  }
  else
  {
    +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__SDBetaManager_canFileFeedbackOnDevice_completion___block_invoke;
    v12[3] = &unk_1E98CFBA8;
    v13 = v6;
    objc_msgSend(v11, "canFileFeedbackOnDevice:completion:", v5, v12);

  }
}

uint64_t __52__SDBetaManager_canFileFeedbackOnDevice_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
    a2 = 0;
  else
    a2 = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

+ (BOOL)canFileFeedbackOnThisDevice:(id *)a3
{
  NSObject *v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  BOOL v9;
  dispatch_semaphore_t v10;
  void *v11;
  uint64_t v12;
  dispatch_time_t v13;
  uint64_t v15;
  uint64_t v16;
  intptr_t (*v17)(uint64_t, char);
  void *v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _QWORD v25[4];
  NSObject *v26;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = "+[SDBetaManager canFileFeedbackOnThisDevice:]";
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __45__SDBetaManager_canFileFeedbackOnThisDevice___block_invoke;
  v25[3] = &unk_1E98CFBD0;
  p_buf = &buf;
  v7 = v5;
  v26 = v7;
  +[SDDevice getCurrentDevice:](SDDevice, "getCurrentDevice:", v25);
  v8 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), 6, 0);
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v10 = dispatch_semaphore_create(0);

    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v15 = v6;
    v16 = 3221225472;
    v17 = __45__SDBetaManager_canFileFeedbackOnThisDevice___block_invoke_2;
    v18 = &unk_1E98CFBF8;
    v20 = &v21;
    v7 = v10;
    v19 = v7;
    objc_msgSend(v11, "canFileFeedbackOnDevice:completion:", v12, &v15);

    v13 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v7, v13))
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), 6, 0, v15, v16, v17, v18);
        v9 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = *((_BYTE *)v22 + 24) != 0;
    }

    _Block_object_dispose(&v21, 8);
  }

  _Block_object_dispose(&buf, 8);
  return v9;
}

void __45__SDBetaManager_canFileFeedbackOnThisDevice___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t __45__SDBetaManager_canFileFeedbackOnThisDevice___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)canFileFeedbackOnThisDeviceWithCompletion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[3];
  char v18;

  v3 = a3;
  dispatch_get_global_queue(0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke;
  v13[3] = &unk_1E98CFC70;
  v6 = v4;
  v14 = v6;
  v16 = v17;
  v7 = v3;
  v15 = v7;
  +[SDDevice getCurrentDevice:](SDDevice, "getCurrentDevice:", v13);
  v8 = dispatch_time(0, 15000000000);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke_4;
  block[3] = &unk_1E98CFC98;
  v11 = v7;
  v12 = v17;
  v9 = v7;
  dispatch_after(v8, v6, block);

  _Block_object_dispose(v17, 8);
}

void __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v3 = a2;
  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke_2;
  v7[3] = &unk_1E98CFC48;
  v8 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v9 = v6;
  objc_msgSend(v4, "canFileFeedbackOnDevice:completion:", v3, v7);

}

void __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;
  id v4;
  __int128 v5;
  _QWORD block[4];
  __int128 v7;
  char v8;

  v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke_3;
  block[3] = &unk_1E98CFC20;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  v8 = a2;
  dispatch_async(v3, block);

}

uint64_t __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), 0);
}

void __59__SDBetaManager_canFileFeedbackOnThisDeviceWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v1 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), 6, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

- (void)enrollInProgramWithToken:(id)a3 userIdentifier:(id)a4 completion:(id)a5
{
  -[SDBetaManager enrollInProgramWithToken:userIdentifier:shouldSaveToken:completion:](self, "enrollInProgramWithToken:userIdentifier:shouldSaveToken:completion:", a3, a4, 1, a5);
}

- (void)enrollInProgramWithToken:(id)a3 userIdentifier:(id)a4 shouldSaveToken:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v7 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v21 = "-[SDBetaManager enrollInProgramWithToken:userIdentifier:shouldSaveToken:completion:]";
    _os_log_impl(&dword_1D4F89000, v11, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SDPersistence saveBetaEnrollmentTokens:](SDPersistence, "saveBetaEnrollmentTokens:", v12);

  }
  v13 = +[SDDevice devicePlatform](SDDevice, "devicePlatform");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke;
  v17[3] = &unk_1E98CFCC0;
  v18 = v9;
  v19 = v10;
  v15 = v10;
  v16 = v9;
  -[SDBetaManager _finallyQueryProgramsForSystemAccountsWithPlatforms:credentials:betaEnrollmentTokens:completion:](self, "_finallyQueryProgramsForSystemAccountsWithPlatforms:credentials:betaEnrollmentTokens:completion:", v13, 0, v14, v17);

}

void __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (*v8)(void);
  NSObject *v9;
  NSObject *v10;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke_cold_3();

    }
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "platform");
    if (v6 == +[SDDevice devicePlatform](SDDevice, "devicePlatform"))
    {
      +[SDDevice _currentDevice](SDDevice, "_currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_enrollInBetaProgram:", v5);

      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke_cold_2(v5, a1, v10);

      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v8();

  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_migrateFromProfilesIfNeeded
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v4, "Migration failed: Could not read Asset Audience ID with error [%{public}@]", v5);

  OUTLINED_FUNCTION_1();
}

void __45__SDBetaManager__migrateFromProfilesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        objc_msgSend(v5, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "Migrating into program %{public}@", (uint8_t *)&v10, 0xCu);

      }
      +[SDProfileUtilities forceRemoveSeedingProfile](SDProfileUtilities, "forceRemoveSeedingProfile");
      +[SDDevice _currentDevice](SDDevice, "_currentDevice");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject _enrollInBetaProgram:userIdentifier:](v7, "_enrollInBetaProgram:userIdentifier:", v5, 0);
    }
    else if (v8)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "Profile migration returned no program and no error, setting complete flag.", (uint8_t *)&v10, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_markMigrationComplete");
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsMigratingFromProfiles:", 0);

}

- (BOOL)_hasMigratedProfiles
{
  void *v2;
  char v3;

  SeedingDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("HasRunMigration"));

  return v3;
}

- (void)_markMigrationComplete
{
  id v2;

  SeedingDefaults();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("HasRunMigration"));

}

- (void)getMigrationProgramForAssetAudience:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  SDBetaManager *v18;
  id v19;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB37A8];
  -[SDBetaManager migrateURLForAssetAudience:](self, "migrateURLForAssetAudience:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestWithURL:cachePolicy:timeoutInterval:", v8, 1, 15.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[SDHTTPClient sharedInstance](SDHTTPClient, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "urlSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setHTTPMethod:", CFSTR("GET"));
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SDBetaManager getMigrationProgramForAssetAudience:completion:].cold.1(v9, v12);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke;
  v16[3] = &unk_1E98CFD10;
  v18 = self;
  v19 = v6;
  v17 = v9;
  v13 = v6;
  v14 = v9;
  objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v14, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resume");

}

void __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "allHeaderFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("X-Request-Id"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("(null)");
    if (v13)
      v15 = (const __CFString *)v13;
    *(_DWORD *)buf = 138543362;
    v32 = (uint64_t)v15;
    _os_log_impl(&dword_1D4F89000, v11, OS_LOG_TYPE_DEFAULT, "/migrate X-Request-Id: %{public}@", buf, 0xCu);

  }
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_5(a1, v10, v16);

  if (!v9)
  {
    if (objc_msgSend(v10, "statusCode") > 499 || objc_msgSend(v10, "statusCode") == 403)
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_1(v10, v18);

      v19 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), 3, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v20);
LABEL_16:

      goto LABEL_17;
    }
    v21 = objc_msgSend(v10, "statusCode");
    objc_msgSend(*(id *)(a1 + 40), "setProfilesEnabledFromHeaderInResponse:", v10);
    if (v21 != 200)
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v10, "statusCode");
        *(_DWORD *)buf = 134217984;
        v32 = v26;
        _os_log_impl(&dword_1D4F89000, v17, OS_LOG_TYPE_DEFAULT, "Received code [%lu]. Considering migration successful.", buf, 0xCu);
      }
      goto LABEL_10;
    }
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v30;
    if (v22)
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_3();
    }
    else
    {
      objc_msgSend(v20, "objectForKey:", CFSTR("catalog"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        +[SDBetaProgram betaProgramWithJSON:](SDBetaProgram, "betaProgramWithJSON:", v20);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v32 = (uint64_t)v28;
          _os_log_impl(&dword_1D4F89000, v29, OS_LOG_TYPE_DEFAULT, "Received program %{public}@ for migration", buf, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_16;
      }
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_2();
    }

    v24 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), 8, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v25);

    goto LABEL_17;
  }
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_4(v9, v17);
LABEL_10:

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_17:

}

- (BOOL)isMigratingFromProfiles
{
  SDBetaManager *v2;
  BOOL isMigratingFromProfiles;

  v2 = self;
  objc_sync_enter(v2);
  isMigratingFromProfiles = v2->_isMigratingFromProfiles;
  objc_sync_exit(v2);

  return isMigratingFromProfiles;
}

- (void)setIsMigratingFromProfiles:(BOOL)a3
{
  _BOOL4 v3;
  SDBetaManager *v4;
  _BOOL4 isMigratingFromProfiles;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  _QWORD block[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[8];
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  isMigratingFromProfiles = v4->_isMigratingFromProfiles;
  v4->_isMigratingFromProfiles = v3;
  if (v3)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, "Migrating from profiles", buf, 2u);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (isMigratingFromProfiles)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "Profile migration finished", buf, 2u);
    }

    -[SDBetaManager postMigrationTasks](v4, "postMigrationTasks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;

    if (!v9)
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4F89000, v10, OS_LOG_TYPE_DEFAULT, "Found pending tasks. Executing now", buf, 2u);
      }

      dispatch_get_global_queue(25, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[SDBetaManager postMigrationTasks](v4, "postMigrationTasks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v20;
        v14 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            block[0] = v14;
            block[1] = 3221225472;
            block[2] = __44__SDBetaManager_setIsMigratingFromProfiles___block_invoke;
            block[3] = &unk_1E98CF240;
            block[4] = v16;
            dispatch_async(v6, block);
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v12);
      }

      -[SDBetaManager postMigrationTasks](v4, "postMigrationTasks");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeAllObjects");

      goto LABEL_18;
    }
  }
LABEL_19:
  objc_sync_exit(v4);

}

uint64_t __44__SDBetaManager_setIsMigratingFromProfiles___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ensureThisRunsAfterMigration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  if (-[SDBetaManager isMigratingFromProfiles](self, "isMigratingFromProfiles"))
  {
    -[SDBetaManager postMigrationTasks](self, "postMigrationTasks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      -[SDBetaManager setPostMigrationTasks:](self, "setPostMigrationTasks:", v5);

    }
    -[SDBetaManager postMigrationTasks](self, "postMigrationTasks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1D826D598](v8);
    objc_msgSend(v6, "addObject:", v7);

  }
  else
  {
    v8[2]();
  }

}

- (void)setProfilesEnabledFromHeaderInResponse:(id)a3
{
  id v3;
  int v4;
  __CFString *v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  int v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = _os_feature_enabled_impl();
  if (v3 && v4)
  {
    objc_msgSend(v3, "valueForHTTPHeaderField:", CFSTR("Disable-Profile"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("(null)");
      if (v5)
        v7 = v5;
      v18 = 138543362;
      v19 = v7;
      _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, "Disable-Profile: %{public}@", (uint8_t *)&v18, 0xCu);
    }

    if (v5)
    {
      v8 = SDPlatformsFromCommaSeparatedString(v5);
      SeedingDefaults();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("EnableProfiles"));

      v11 = +[SDDevice devicePlatform](SDDevice, "devicePlatform") & v8;
      if (v10 && v11)
      {
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1D4F89000, v12, OS_LOG_TYPE_DEFAULT, "Profiles are no longer allowed on this platform, disabling and removing.", (uint8_t *)&v18, 2u);
        }

        SeedingDefaults();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBool:forKey:", 0, CFSTR("EnableProfiles"));

        +[SDProfileUtilities removeSeedProfileIfRestricted](SDProfileUtilities, "removeSeedProfileIfRestricted");
      }
      else
      {
        if (v11)
          v15 = 1;
        else
          v15 = v10;
        if ((v15 & 1) == 0)
        {
          +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v18) = 0;
            _os_log_impl(&dword_1D4F89000, v16, OS_LOG_TYPE_DEFAULT, "Profiles are now enabled on this platform.", (uint8_t *)&v18, 2u);
          }

          SeedingDefaults();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setBool:forKey:", 1, CFSTR("EnableProfiles"));

        }
      }
    }
    else
    {
      SeedingDefaults();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", CFSTR("EnableProfiles"));

    }
  }

}

- (id)seedingAppleIDUsernameForCurrentDevice
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6 = 136446210;
    v7 = "-[SDBetaManager seedingAppleIDUsernameForCurrentDevice]";
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "seedingAppleIDUsernameForCurrentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)seedingAppleIDUsernameForCurrentDeviceWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v10 = "-[SDBetaManager seedingAppleIDUsernameForCurrentDeviceWithCompletion:]";
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SDBetaManager_seedingAppleIDUsernameForCurrentDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E98CF8E0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "seedingAppleIDUsernameForCurrentDevice:", v7);

}

uint64_t __70__SDBetaManager_seedingAppleIDUsernameForCurrentDeviceWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_seedingAppleIDUsername
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  SeedingDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("AppleAccountIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "accountWithIdentifier:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("AppleAccountIdentifier"));
  }
  objc_msgSend(v5, "aida_accountForPrimaryiCloudAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = 0;
    goto LABEL_8;
  }
LABEL_6:
  objc_msgSend(v6, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v7;
}

- (id)deviceAppleIDUsernameForCurrentDevice
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6 = 136446210;
    v7 = "-[SDBetaManager deviceAppleIDUsernameForCurrentDevice]";
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceAppleIDUsernameForCurrentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_deviceAppleIDUsername
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aida_accountForPrimaryiCloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isCurrentDeviceUsingSeedingAppleID
{
  NSObject *v2;
  void *v3;
  char v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6 = 136446210;
    v7 = "-[SDBetaManager isCurrentDeviceUsingSeedingAppleID]";
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentDeviceUsingSeedingAppleID");

  return v4;
}

- (BOOL)_isUsingSeedingAppleID
{
  void *v2;
  void *v3;
  BOOL v4;

  SeedingDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("AppleAccountIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)saveAppleAccountIdentifierWithAlternateDSIDForCurrentDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v14 = "-[SDBetaManager saveAppleAccountIdentifierWithAlternateDSIDForCurrentDevice:completion:]";
    _os_log_impl(&dword_1D4F89000, v8, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__SDBetaManager_saveAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke;
  v11[3] = &unk_1E98CFD38;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice:completion:", v7, v11);

}

void __88__SDBetaManager_saveAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidateCache");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_saveAppleAccountIdentifierWithAlternateDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  SDBetaManager *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  SeedingDefaults();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", CFSTR("AppleAccountIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "aida_accountForPrimaryiCloudAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke;
  v16[3] = &unk_1E98CFD88;
  v20 = self;
  v21 = v7;
  v17 = v6;
  v18 = v9;
  v19 = v11;
  v12 = v11;
  v13 = v9;
  v14 = v7;
  v15 = v6;
  -[SDBetaManager getAppleIDAuthenticationAccountForAlternateDSID:attempt:completion:](self, "getAppleIDAuthenticationAccountForAlternateDSID:attempt:completion:", v15, 0, v16);

}

void __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_1();

    v7 = *(_QWORD *)(a1 + 64);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = 11;
    goto LABEL_7;
  }
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {

LABEL_9:
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_2(v4, v14);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_12;
  }
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
    goto LABEL_9;
  objc_msgSend(v4, "username");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "username");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if (v17)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_3();

    SeedingDefaults();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", CFSTR("AppleAccountIdentifier"));

    v7 = *(_QWORD *)(a1 + 64);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = 12;
LABEL_7:
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);

    goto LABEL_12;
  }
  objc_msgSend(v4, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_4();

    v22 = *(void **)(a1 + 56);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_312;
    v23[3] = &unk_1E98CFD60;
    v23[4] = v22;
    v24 = v20;
    v25 = *(id *)(a1 + 64);
    objc_msgSend(v22, "_deleteSeedingAppleAccountWithCompletion:", v23);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "_saveAppleAccountIdentifier:", v20);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 56), "invalidateCache");

LABEL_12:
}

void __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_312(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "_saveAppleAccountIdentifier:", v4);
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)getAppleIDAuthenticationAccountForAlternateDSID:(id)a3 attempt:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(_QWORD, _QWORD);
  int64_t v17;

  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (a4 < 8)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aida_accountForAltDSID:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      ((void (**)(_QWORD, void *))v10)[2](v10, v12);
    }
    else
    {
      v13 = dispatch_time(0, 250000000);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __84__SDBetaManager_getAppleIDAuthenticationAccountForAlternateDSID_attempt_completion___block_invoke;
      v14[3] = &unk_1E98CFDB0;
      v14[4] = self;
      v15 = v8;
      v17 = a4;
      v16 = v10;
      dispatch_after(v13, MEMORY[0x1E0C80D38], v14);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

uint64_t __84__SDBetaManager_getAppleIDAuthenticationAccountForAlternateDSID_attempt_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getAppleIDAuthenticationAccountForAlternateDSID:attempt:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

- (void)_saveAppleAccountIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "Saving new Seeding account %@", (uint8_t *)&v6, 0xCu);
    }

    SeedingDefaults();
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v4, "setObject:forKey:", v3, CFSTR("AppleAccountIdentifier"));
  }
  else if (v5)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "Attempted to save a nil account identifier.", (uint8_t *)&v6, 2u);
  }

}

- (void)deleteSeedingAppleAccountForCurrentDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SDBetaManager deleteSeedingAppleAccountForCurrentDeviceWithCompletion:]";
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__SDBetaManager_deleteSeedingAppleAccountForCurrentDeviceWithCompletion___block_invoke;
  v8[3] = &unk_1E98CFD38;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "deleteSeedingAppleAccountWithCompletion:", v8);

}

void __73__SDBetaManager_deleteSeedingAppleAccountForCurrentDeviceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidateCache");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_deleteSeedingAppleAccountWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  void (**v22)(id, void *);
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  SeedingDefaults();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", CFSTR("AppleAccountIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountWithIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "username");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "aida_accountForPrimaryiCloudAccount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "username");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqualToString:", v12);

      if (v13)
      {
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          -[SDBetaManager _deleteSeedingAppleAccountWithCompletion:].cold.3();

        SeedingDefaults();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObjectForKey:", CFSTR("AppleAccountIdentifier"));

        -[SDBetaManager invalidateCache](self, "invalidateCache");
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), 12, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v16);

      }
      else
      {
        -[SDBetaManager invalidateCache](self, "invalidateCache");
        +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v6;
          _os_log_impl(&dword_1D4F89000, v20, OS_LOG_TYPE_DEFAULT, "Removing Seeding account %@ from account store", buf, 0xCu);
        }

        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __58__SDBetaManager__deleteSeedingAppleAccountWithCompletion___block_invoke;
        v21[3] = &unk_1E98CFBA8;
        v22 = v4;
        objc_msgSend(v7, "removeAccount:withCompletionHandler:", v9, v21);

      }
    }
    else
    {
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SDBetaManager _deleteSeedingAppleAccountWithCompletion:].cold.2();

      SeedingDefaults();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObjectForKey:", CFSTR("AppleAccountIdentifier"));

      -[SDBetaManager invalidateCache](self, "invalidateCache");
      v4[2](v4, 0);
    }

  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SDBetaManager _deleteSeedingAppleAccountWithCompletion:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.beta-manager"), 10, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);
  }

}

void __58__SDBetaManager__deleteSeedingAppleAccountWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void (*v9)(void);
  uint8_t v10[16];

  v5 = a3;
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "Seeding account deleted successfully", v10, 2u);
    }

    SeedingDefaults();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("AppleAccountIdentifier"));

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __58__SDBetaManager__deleteSeedingAppleAccountWithCompletion___block_invoke_cold_1(v5, v7);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

- (NSArray)cachedPrograms
{
  return self->_cachedPrograms;
}

- (void)setCachedPrograms:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPrograms, a3);
}

- (NSDate)lastCached
{
  return self->_lastCached;
}

- (void)setLastCached:(id)a3
{
  objc_storeStrong((id *)&self->_lastCached, a3);
}

- (unint64_t)cachedPlatform
{
  return self->_cachedPlatform;
}

- (void)setCachedPlatform:(unint64_t)a3
{
  self->_cachedPlatform = a3;
}

- (NSMutableArray)postMigrationTasks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPostMigrationTasks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postMigrationTasks, 0);
  objc_storeStrong((id *)&self->_lastCached, 0);
  objc_storeStrong((id *)&self->_cachedPrograms, 0);
}

- (void)_queryProgramsForSystemAccountsWithPlatforms:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1D4F89000, v0, v1, "Skipping credential fetch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_queryProgramsForSystemAccountsWithPlatforms:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1D4F89000, v0, v1, "No accounts available.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_queryProgramsForSystemAccountsWithPlatforms:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1D4F89000, v0, v1, "Will fetch accounts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v4, "ADSID token not available for account %@", v5);

  OUTLINED_FUNCTION_1();
}

void __73__SDBetaManager__queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke_233_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1D4F89000, v0, v1, "No credential tokens available.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_finallyQueryProgramsForSystemAccountsWithPlatforms:credentials:betaEnrollmentTokens:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_1D4F89000, v0, v1, "Body:\n%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_finallyQueryProgramsForSystemAccountsWithPlatforms:(void *)a1 credentials:(NSObject *)a2 betaEnrollmentTokens:completion:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(&dword_1D4F89000, a2, OS_LOG_TYPE_DEBUG, "URL: %@", v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

void __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_263_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10(&dword_1D4F89000, v0, v1, "Failed to parse JSON, got response %{public}@ with error %{public}@.\n");
  OUTLINED_FUNCTION_5();
}

void __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_263_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "No 'programs' dictionary from the server. Response: %{public}@", v2);
  OUTLINED_FUNCTION_5();
}

void __113__SDBetaManager__finallyQueryProgramsForSystemAccountsWithPlatforms_credentials_betaEnrollmentTokens_completion___block_invoke_263_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10(&dword_1D4F89000, v0, v1, "Got response %{public}@ with error %{public}@.\n");
  OUTLINED_FUNCTION_5();
}

+ (void)isBuildPrefix:greaterThanOrEqualToBuild:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "Prefix %{public}@ is longer than device build. This is a configuration error, but allowing.", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)isBuildPrefix:greaterThanOrEqualToBuild:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10(&dword_1D4F89000, v0, v1, "Malformed build %{public}@ or prefix %{public}@, could not match.");
  OUTLINED_FUNCTION_5();
}

+ (void)isBuildPrefix:(void *)a1 greaterThanOrEqualToBuild:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v4, "Failed to compile regex with error %{public}@}", v5);

  OUTLINED_FUNCTION_1();
}

- (void)enrollDevice:(NSObject *)a1 inBetaProgram:(uint64_t)a2 completion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136446210;
  v4 = "-[SDBetaManager enrollDevice:inBetaProgram:completion:]";
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a1, a3, "Error device passed into %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)enrollDevice:(NSObject *)a1 withEnrollmentMetadata:(uint64_t)a2 completion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136446210;
  v4 = "-[SDBetaManager enrollDevice:withEnrollmentMetadata:completion:]";
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a1, a3, "Error device passed into %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void __70__SDBetaManager_enrollCurrentDeviceWithEnrollmentMetadata_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1D4F89000, v0, v1, "Error device passed into -[SDBetaManager enrollCurrentDeviceWithEnrollmentMetadata:]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)enrollmentMetadataForDevice:(uint64_t)a3 completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136446210;
  v4 = "-[SDBetaManager enrollmentMetadataForDevice:completion:]";
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a1, a3, "Error device passed into %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)_saveBetaProgram:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_1D4F89000, v0, v1, "Saving beta program object %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_saveBetaProgram:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "programID");
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  _os_log_error_impl(&dword_1D4F89000, a3, OS_LOG_TYPE_ERROR, "Failed to serialize beta program object for catalog %ld - %{public}@.", v6, 0x16u);

  OUTLINED_FUNCTION_13();
}

+ (void)_currentBetaProgram
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v4, "Failed to deserialize beta program object - %{public}@.", v5);

  OUTLINED_FUNCTION_1();
}

- (void)enrolledBetaProgramForDevice:(uint64_t)a3 completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136446210;
  v4 = "-[SDBetaManager enrolledBetaProgramForDevice:completion:]";
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a1, a3, "Error device passed into %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "No 'catalog' value in the verify response. Response: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1D4F89000, v0, v1, "Beta Program API returned no content, catalog is inactive.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __46__SDBetaManager_verifyCatalog_withCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "Catalog verify error: %{public}@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)unenrollDevice:(uint64_t)a3 completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136446210;
  v4 = "-[SDBetaManager unenrollDevice:completion:]";
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a1, a3, "Error device passed into %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)_unenrollFromBetaProgramWithUserIdentifier:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_15(&dword_1D4F89000, v0, (uint64_t)v0, "Original asset server [%{public}@] original brain server [%{public}@]", v1);
  OUTLINED_FUNCTION_5();
}

- (void)isDeviceEnrolledInBetaProgram:(uint64_t)a3 completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136446210;
  v4 = "-[SDBetaManager isDeviceEnrolledInBetaProgram:completion:]";
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a1, a3, "Error device passed into %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)canFileFeedbackOnDevice:(uint64_t)a3 completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136446210;
  v4 = "-[SDBetaManager canFileFeedbackOnDevice:completion:]";
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a1, a3, "Error device passed into %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "No programs found for token [%{private}@]", v2);
  OUTLINED_FUNCTION_5();
}

void __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "programID");
  v7 = *(_QWORD *)(a2 + 32);
  SDStringForPlatform(objc_msgSend(a1, "platform"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134218499;
  v10 = v6;
  v11 = 2113;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_1D4F89000, a3, OS_LOG_TYPE_ERROR, "Catalog [%lu] for token [%{private}@] has platform [%{public}@] and does not match this device. Will not enroll", (uint8_t *)&v9, 0x20u);

  OUTLINED_FUNCTION_11();
}

void __84__SDBetaManager_enrollInProgramWithToken_userIdentifier_shouldSaveToken_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "More than one program retuned for token [%{private}@]. Will use first", v2);
  OUTLINED_FUNCTION_5();
}

- (void)getMigrationProgramForAssetAudience:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "HTTPMethod");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_15(&dword_1D4F89000, a2, v7, "-> %{public}@ %{public}@", v8);

  OUTLINED_FUNCTION_13();
}

void __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "statusCode");
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v3, "HTTP Error: Received status code [%lu].", v4);
  OUTLINED_FUNCTION_1();
}

void __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "Data Error: No 'catalog' value in the migrate response. Response: [%{public}@]", v2);
  OUTLINED_FUNCTION_5();
}

void __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "Parse Error: Failed to parse response with Error [%{public}@]", v2);
  OUTLINED_FUNCTION_5();
}

void __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v4, "HTTP Session Error: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

void __64__SDBetaManager_getMigrationProgramForAssetAudience_completion___block_invoke_cold_5(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "HTTPMethod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v6;
  v11 = 2114;
  v12 = v8;
  v13 = 2048;
  v14 = objc_msgSend(a2, "statusCode");
  _os_log_debug_impl(&dword_1D4F89000, a3, OS_LOG_TYPE_DEBUG, "<- %{public}@ %{public}@ %li", (uint8_t *)&v9, 0x20u);

  OUTLINED_FUNCTION_11();
}

void __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "Failed to find account for ADSID [%@]", v2);
  OUTLINED_FUNCTION_5();
}

void __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v4, "A second auth request for an existing account [%@] came in, assuming success.", v5);

  OUTLINED_FUNCTION_1();
}

void __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1D4F89000, v0, v1, "Attempted to save same account as device iCloud account, this is not allowed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __73__SDBetaManager__saveAppleAccountIdentifierWithAlternateDSID_completion___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "A Seeding account [%@] already exists, deleting before continuing.", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_deleteSeedingAppleAccountWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1D4F89000, v0, v1, "Attempted to delete the Seeding account, but Seeding is not tracking an account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_deleteSeedingAppleAccountWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1D4F89000, v0, v1, "Seeding account is no longer in the account store.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_deleteSeedingAppleAccountWithCompletion:.cold.3()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_1D4F89000, v0, OS_LOG_TYPE_FAULT, "Attempted to delete the system iCloud account.", v1, 2u);
  OUTLINED_FUNCTION_3_0();
}

void __58__SDBetaManager__deleteSeedingAppleAccountWithCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v4, "Error deleting Seeding account: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

@end
