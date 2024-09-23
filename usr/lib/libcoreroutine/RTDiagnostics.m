@implementation RTDiagnostics

+ (BOOL)fileNameEligibleForCollection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("routined")) & 1) != 0
    || objc_msgSend(v3, "containsString:", CFSTR("CoreRoutineHelperService")))
  {
    v4 = objc_msgSend(v3, "containsString:", CFSTR("Sandbox")) ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (id)createDiagnosticsURLWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:isDirectory:relativeToURL:", v8, 1, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v23);
    v12 = v23;

    if (v11)
      v13 = v12 == 0;
    else
      v13 = 0;
    if (v13)
    {
      v18 = v9;
    }
    else
    {
      if (a3)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = *MEMORY[0x1E0D18598];
        v24 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create diagnostic url at path, %@, error, %@"), v5, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 1, v17);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      v18 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "+[RTDiagnostics createDiagnosticsURLWithError:]";
      v30 = 1024;
      v31 = 65;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Temporary diagnostics parent path was nil. (in %s:%d)", buf, 0x12u);
    }

    if (!a3)
    {
      v18 = 0;
      goto LABEL_16;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D18598];
    v26 = *MEMORY[0x1E0CB2D50];
    v27 = CFSTR("failed to create diagnostic url, parent path was nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 1, v5);
    v18 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_16:
  return v18;
}

+ (BOOL)createArchiveSourceURL:(id)a3 destinationURL:(id)a4 error:(id *)a5
{
  id v7;
  RTArchiver *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  RTArchiver *v15;
  RTArchiver *v16;
  BOOL v17;
  NSObject *v18;
  RTArchiver *v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  RTArchiver *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (RTArchiver *)a4;
  -[RTArchiver path](v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v14 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v22);
    v15 = (RTArchiver *)v22;

    if (!v14 || v15)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "error while creating archive destination directory, %@", buf, 0xCu);
      }

      if (a5)
      {
        v19 = objc_retainAutorelease(v15);
        v15 = v19;
        goto LABEL_14;
      }
LABEL_16:
      v17 = 0;
      goto LABEL_17;
    }
  }
  v16 = -[RTArchiver initWithOutputURL:compress:]([RTArchiver alloc], "initWithOutputURL:compress:", v8, 1);
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "error while creating archive at destination url, %@", buf, 0xCu);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, MEMORY[0x1E0C9AA70]);
      v19 = (RTArchiver *)(id)objc_claimAutoreleasedReturnValue();
      v15 = 0;
LABEL_14:
      v17 = 0;
      *a5 = v19;
      goto LABEL_17;
    }
    v15 = 0;
    goto LABEL_16;
  }
  v15 = v16;
  -[RTArchiver addDirectoryToArchive:](v16, "addDirectoryToArchive:", v7);
  -[RTArchiver closeArchive](v15, "closeArchive");
  v17 = 1;
LABEL_17:

  return v17;
}

+ (id)stringFromDateWithFormat
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDateFormat:", CFSTR("MM-dd-YYYY-HHmmss"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (RTDiagnostics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_platform_);
}

- (RTDiagnostics)initWithDefaultsManager:(id)a3 platform:(id)a4
{
  id v7;
  id v8;
  RTDiagnostics *v9;
  RTDiagnostics *v10;
  uint64_t v11;
  NSMutableArray *diagnosticProviders;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTDiagnostics;
  v9 = -[RTNotifier init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_defaultsManager, a3);
    objc_storeStrong((id *)&v10->_platform, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    diagnosticProviders = v10->_diagnosticProviders;
    v10->_diagnosticProviders = (NSMutableArray *)v11;

  }
  return v10;
}

- (void)logProcessDiagnosticInformation
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__RTDiagnostics_logProcessDiagnosticInformation__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __48__RTDiagnostics_logProcessDiagnosticInformation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  pid_t v4;
  NSObject *v5;
  void *v6;
  char *v7;
  NSObject *v8;
  char *v9;
  char *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "Aug 13 2024";
    v25 = 2080;
    v26 = "21:28:30";
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEFAULT, "/usr/libexec/routined was compiled on %s @ %s", buf, 0x16u);
  }

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = getpid();
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEFAULT, "pid, %d", buf, 8u);
  }

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "_coreroutineBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v7;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "CoreRoutine-%{public}@", buf, 0xCu);

  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "systemModel");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "buildVersion");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "productType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v9;
    v25 = 2114;
    v26 = v10;
    v27 = 2114;
    v28 = v11;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "system model, %{public}@, version, %{public}@, product, %{public}@", buf, 0x20u);

  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localeIdentifier");
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredLocalizations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "_coreroutineBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferredLocalizations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v24 = v13;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v18;
    v29 = 2112;
    v30 = v21;
    _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "preferredLanguage, %@, locale, %@, mainBundlePreferredLocalization, %@, frameworkPreferredLocalization, %@", buf, 0x2Au);

  }
}

- (void)logDiagnosticStateWithReason:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke;
  block[3] = &unk_1E9297BC8;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_group_create();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          dispatch_group_enter(v3);
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke_2;
          v17[3] = &unk_1E92A3B58;
          v17[4] = *(_QWORD *)(a1 + 32);
          v18 = v2;
          v19 = v9;
          v20 = v3;
          objc_msgSend(v9, "fetchDiagnosticLogsWithHandler:", v17);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke_4;
  block[3] = &unk_1E9297BC8;
  v11 = *(void **)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v14 = v11;
  v15 = v2;
  v12 = v2;
  dispatch_group_notify(v3, v10, block);

}

void __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke_3;
  v9[3] = &unk_1E929E650;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v10 = v5;
  v11 = v6;
  v12 = v3;
  v13 = v7;
  v8 = v3;
  dispatch_async(v4, v9);

}

void __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(void **)(a1 + 32);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("diagnostic provider, %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __46__RTDiagnostics_logDiagnosticStateWithReason___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412802;
    v20 = v3;
    v21 = 2112;
    v22 = v4;
    v23 = 2048;
    v24 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "============== %@, %@, footprint, %.2f MB ==============", buf, 0x20u);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v11;
          _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "====================================", buf, 2u);
  }

}

- (void)addDiagnosticProvider:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTDiagnostics *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__RTDiagnostics_addDiagnosticProvider___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __39__RTDiagnostics_addDiagnosticProvider___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 48), "addObject:");
  return result;
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableArray removeAllObjects](self->_diagnosticProviders, "removeAllObjects");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (id)_collectDiagnosticFilesWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t i;
  void *v15;
  dispatch_semaphore_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  dispatch_time_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  char v34;
  id v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  dispatch_semaphore_t v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  dispatch_time_t v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  char v60;
  id v61;
  NSObject *v62;
  objc_class *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  id v73;
  char v74;
  NSObject *v75;
  void *v76;
  void *v77;
  char v78;
  id v79;
  char v80;
  NSObject *v81;
  void *v82;
  objc_class *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  RTDiagnostics *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  NSMutableArray *obj;
  NSMutableArray *obja;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  id v106;
  _QWORD v107[4];
  NSObject *v108;
  _BYTE *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[4];
  NSObject *v115;
  _BYTE *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  id v121;
  _BYTE v122[128];
  _BYTE buf[12];
  __int16 v124;
  uint64_t v125;
  _BYTE v126[24];
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  _BYTE v130[128];
  _QWORD v131[4];

  v131[1] = *MEMORY[0x1E0C80C00];
  v102 = a3;
  v91 = self;
  v121 = 0;
  objc_msgSend((id)objc_opt_class(), "createDiagnosticsURLWithError:", &v121);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v121;
  v89 = v6;
  if (v6)
  {
    v7 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }
  else
  {
    v99 = (void *)objc_opt_new();
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v10, v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "UTF8String");
    v88 = (void *)os_transaction_create();

    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v84 = (objc_class *)objc_opt_class();
      NSStringFromClass(v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v126 = 138412546;
      *(_QWORD *)&v126[4] = v85;
      *(_WORD *)&v126[12] = 2112;
      *(_QWORD *)&v126[14] = v86;
      _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", v126, 0x16u);

    }
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    obj = v91->_diagnosticProviders;
    v103 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v117, v130, 16);
    if (v103)
    {
      v100 = *(_QWORD *)v118;
      v92 = *MEMORY[0x1E0D18598];
      v94 = *MEMORY[0x1E0CB2D50];
      do
      {
        for (i = 0; i != v103; ++i)
        {
          if (*(_QWORD *)v118 != v100)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v16 = dispatch_semaphore_create(0);
            *(_QWORD *)v126 = 0;
            *(_QWORD *)&v126[8] = v126;
            *(_QWORD *)&v126[16] = 0x3032000000;
            v127 = __Block_byref_object_copy__137;
            v128 = __Block_byref_object_dispose__137;
            v129 = 0;
            v114[0] = MEMORY[0x1E0C809B0];
            v114[1] = 3221225472;
            v114[2] = __58__RTDiagnostics__collectDiagnosticFilesWithOptions_error___block_invoke;
            v114[3] = &unk_1E9297038;
            v116 = v126;
            v17 = v16;
            v115 = v17;
            objc_msgSend(v15, "flushToCacheWithOptions:handler:", v102, v114);
            v18 = v17;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = dispatch_time(0, 300000000000);
            if (!dispatch_semaphore_wait(v18, v20))
              goto LABEL_17;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "timeIntervalSinceDate:", v19);
            v23 = v22;
            v24 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_108);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "filteredArrayUsingPredicate:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "firstObject");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "submitToCoreAnalytics:type:duration:", v28, 1, v23);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            v30 = (void *)MEMORY[0x1E0CB35C8];
            v131[0] = v94;
            *(_QWORD *)buf = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v131, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "errorWithDomain:code:userInfo:", v92, 15, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              v33 = objc_retainAutorelease(v32);

              v34 = 0;
            }
            else
            {
LABEL_17:
              v33 = 0;
              v34 = 1;
            }

            v35 = v33;
            if ((v34 & 1) == 0)
              objc_storeStrong((id *)(*(_QWORD *)&v126[8] + 40), v33);
            if (*(_QWORD *)(*(_QWORD *)&v126[8] + 40))
            {
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                v37 = (objc_class *)objc_opt_class();
                NSStringFromClass(v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = *(_QWORD *)(*(_QWORD *)&v126[8] + 40);
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v38;
                v124 = 2112;
                v125 = v39;
                _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "%@, failed to flush to cache, error, %@", buf, 0x16u);

              }
              objc_msgSend(v99, "addObject:", *(_QWORD *)(*(_QWORD *)&v126[8] + 40));
            }

            _Block_object_dispose(v126, 8);
          }
        }
        v103 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v117, v130, 16);
      }
      while (v103);
    }

    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    obja = v91->_diagnosticProviders;
    v104 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v110, v122, 16);
    if (v104)
    {
      v101 = *(_QWORD *)v111;
      v93 = *MEMORY[0x1E0D18598];
      v95 = *MEMORY[0x1E0CB2D50];
      do
      {
        for (j = 0; j != v104; ++j)
        {
          if (*(_QWORD *)v111 != v101)
            objc_enumerationMutation(obja);
          v41 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v42 = dispatch_semaphore_create(0);
            *(_QWORD *)v126 = 0;
            *(_QWORD *)&v126[8] = v126;
            *(_QWORD *)&v126[16] = 0x3032000000;
            v127 = __Block_byref_object_copy__137;
            v128 = __Block_byref_object_dispose__137;
            v129 = 0;
            v107[0] = MEMORY[0x1E0C809B0];
            v107[1] = 3221225472;
            v107[2] = __58__RTDiagnostics__collectDiagnosticFilesWithOptions_error___block_invoke_46;
            v107[3] = &unk_1E9297038;
            v109 = v126;
            v43 = v42;
            v108 = v43;
            objc_msgSend(v41, "sendDiagnosticsToURL:options:handler:", v96, v102, v107);
            v44 = v43;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = dispatch_time(0, 300000000000);
            if (!dispatch_semaphore_wait(v44, v46))
              goto LABEL_38;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "timeIntervalSinceDate:", v45);
            v49 = v48;
            v50 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_108);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "filteredArrayUsingPredicate:", v51);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "firstObject");
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v50, "submitToCoreAnalytics:type:duration:", v54, 1, v49);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            v56 = (void *)MEMORY[0x1E0CB35C8];
            v131[0] = v95;
            *(_QWORD *)buf = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v131, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "errorWithDomain:code:userInfo:", v93, 15, v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            if (v58)
            {
              v59 = objc_retainAutorelease(v58);

              v60 = 0;
            }
            else
            {
LABEL_38:
              v59 = 0;
              v60 = 1;
            }

            v61 = v59;
            if ((v60 & 1) == 0)
              objc_storeStrong((id *)(*(_QWORD *)&v126[8] + 40), v59);
            if (*(_QWORD *)(*(_QWORD *)&v126[8] + 40))
            {
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v62 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              {
                v63 = (objc_class *)objc_opt_class();
                NSStringFromClass(v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = *(_QWORD *)(*(_QWORD *)&v126[8] + 40);
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v64;
                v124 = 2112;
                v125 = v65;
                _os_log_error_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_ERROR, "%@, failed to send diagnostics to URL, error, %@", buf, 0x16u);

              }
              objc_msgSend(v99, "addObject:", *(_QWORD *)(*(_QWORD *)&v126[8] + 40));
            }

            _Block_object_dispose(v126, 8);
          }
        }
        v104 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v110, v122, 16);
      }
      while (v104);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "crashReporterPath");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "stringByAppendingPathComponent:", CFSTR("CoreRoutineDiagnosticFiles"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "stringFromDateWithFormat");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "stringByAppendingFormat:", CFSTR("-%@"), v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "stringByAppendingPathExtension:", CFSTR("tar.gz"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = 0;
    v72 = objc_msgSend(v70, "createArchiveSourceURL:destinationURL:error:", v96, v71, &v106);
    v73 = v106;

    if (v73)
      v74 = 0;
    else
      v74 = v72;
    if ((v74 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v126 = 138412290;
        *(_QWORD *)&v126[4] = v73;
        _os_log_error_impl(&dword_1D1A22000, v75, OS_LOG_TYPE_ERROR, "failed to create archive, error, %@", v126, 0xCu);
      }

      if (v73)
        objc_msgSend(v99, "addObject:", v73);

      v7 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "path");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = 0;
    v78 = objc_msgSend(v76, "removeItemAtPath:error:", v77, &v105);
    v79 = v105;

    if (v79)
      v80 = 0;
    else
      v80 = v78;
    if ((v80 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v96, "path");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v126 = 138412546;
        *(_QWORD *)&v126[4] = v87;
        *(_WORD *)&v126[12] = 2112;
        *(_QWORD *)&v126[14] = v79;
        _os_log_error_impl(&dword_1D1A22000, v81, OS_LOG_TYPE_ERROR, "failed to remove temporary directory, %@, error, %@", v126, 0x16u);

      }
    }
    if (a4)
    {
      _RTSafeArray();
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

void __58__RTDiagnostics__collectDiagnosticFilesWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __58__RTDiagnostics__collectDiagnosticFilesWithOptions_error___block_invoke_46(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_fetchPathToDiagnosticFilesWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    if (v8)
    {
      v13 = 0;
      -[RTDiagnostics _collectDiagnosticFilesWithOptions:error:](self, "_collectDiagnosticFilesWithOptions:error:", v6, &v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      v7[2](v7, v9, v10);
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D18598];
      v14 = *MEMORY[0x1E0CB2D50];
      v15[0] = CFSTR("encrypetd data unavailable - please ensure the device is unlocked and try again.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 5, v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v10);
    }

  }
}

- (void)fetchPathToDiagnosticFilesWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__RTDiagnostics_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __63__RTDiagnostics_fetchPathToDiagnosticFilesWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPathToDiagnosticFilesWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_collectBackupWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "crashReporterPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("CoreRoutineBackup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringFromDateWithFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("-%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("tar.gz"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_class();
  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3620], "routineCacheDirectoryPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:isDirectory:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  LODWORD(v7) = objc_msgSend(v9, "createArchiveSourceURL:destinationURL:error:", v12, v13, &v18);
  v14 = v18;

  if (!(_DWORD)v7 || v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "failed to create archive, error, %@", buf, 0xCu);
    }

    v15 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v14);
  }
  else
  {
    v15 = v8;
  }

  return v15;
}

- (void)_fetchPathToBackupWithHandler:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, id))a3;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    if (v5)
    {
      v10 = 0;
      -[RTDiagnostics _collectBackupWithError:](self, "_collectBackupWithError:", &v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      v4[2](v4, v6, v7);
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0D18598];
      v11 = *MEMORY[0x1E0CB2D50];
      v12[0] = CFSTR("encrypetd data unavailable - please ensure the device is unlocked and try again.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 5, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v6);
    }

  }
}

- (void)fetchPathToBackupWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__RTDiagnostics_fetchPathToBackupWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __46__RTDiagnostics_fetchPathToBackupWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPathToBackupWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticProviders, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
