@implementation SUCorePolicyExtensionManagedUpdates

- (SUCorePolicyExtensionManagedUpdates)init
{
  SUCorePolicyExtensionManagedUpdates *v2;
  SUCorePolicyExtensionManagedUpdates *v3;
  NSString *requestedPMV;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUCorePolicyExtensionManagedUpdates;
  v2 = -[SUCorePolicyExtension init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_supervised = 0;
    requestedPMV = v2->_requestedPMV;
    v2->_requestedPMV = 0;

    v3->_MDMUseDelayPeriod = 0;
    v3->_delayPeriodSecs = 0;
    v3->_mdmSoftwareUpdatePath = 0;
  }
  return v3;
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  return a3;
}

- (id)filterDocumentationAssetArray:(id)a3
{
  return a3;
}

- (void)extendMASoftwareUpdateCatalogDownloadOptions:(id)a3
{
  id v4;
  int v5;
  const __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  SUCorePolicyExtensionManagedUpdates *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "supervised");
    v6 = CFSTR("NO");
    if (v5)
      v6 = CFSTR("YES");
    objc_msgSend(CFSTR("|"), "stringByAppendingFormat:", CFSTR("supervised:%@|"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
    {
      objc_msgSend(v4, "setSupervised:", -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"));
      -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setRequestedProductVersion:", v9);

        objc_msgSend(v4, "requestedProductVersion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR("requestedPMV:%@|"), v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v7 = (__CFString *)v11;
      }
      if (-[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"))
      {
        if (-[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs") < 0)
        {
          objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ with MDMUseDelayPeriod, yet delayPeriodSecs < 0 (ignoring delay period)"), self);
          objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] DOWNLOAD_OPTIONS"), v17, 8102, 0);

        }
        else
        {
          objc_msgSend(v4, "setDelayPeriod:", -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs") / 86400);
          -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR("delayPeriod:%ld|"), objc_msgSend(v4, "delayPeriod"));
          v12 = v7;
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

      }
      objc_msgSend(v4, "additionalServerParams");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSafeObject:forKey:", v19, CFSTR("MDMSoftwareUpdatePath"));

      objc_msgSend(v4, "additionalServerParams");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:](SUCorePolicyExtensionManagedUpdates, "nameForMDMSoftwareUpdatePath:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSafeObject:forKey:", v21, CFSTR("MDMSoftwareUpdatePathName"));

      objc_msgSend(v4, "additionalServerParams");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR("%@:%lld|"), CFSTR("MDMSoftwareUpdatePath"), objc_msgSend(v22, "safeULLForKey:", CFSTR("MDMSoftwareUpdatePath")));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "additionalServerParams");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safeStringForKey:", CFSTR("MDMSoftwareUpdatePathName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("%@:%@|"), CFSTR("MDMSoftwareUpdatePathName"), v16);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ without supervised = YES, yet calling extendMASoftwareUpdateCatalogDownloadOptions (no extended download options will be added)"), self);
      objc_msgSend(v15, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] DOWNLOAD_OPTIONS"), v16, 8102, 0);
    }

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = self;
      v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading software update catalog with extended download options: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "Options class is not MAMsuDownloadOptions, so unable to set managed options.", buf, 2u);
    }
    v7 = CFSTR("|");
  }

}

- (void)extendMADocumentationCatalogDownloadOptions:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint8_t buf[4];
  SUCorePolicyExtensionManagedUpdates *v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
    {
      objc_msgSend(v6, "setSupervised:", -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"));
      v8 = objc_msgSend(v6, "supervised");
      v9 = CFSTR("NO");
      if (v8)
        v9 = CFSTR("YES");
      objc_msgSend(CFSTR("|"), "stringByAppendingFormat:", CFSTR("supervised:%@|"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "productVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRequestedProductVersion:", v11);

      objc_msgSend(v6, "requestedProductVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("requestedPMV:%@|"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "additionalServerParams");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSafeObject:forKey:", v15, CFSTR("MDMSoftwareUpdatePath"));

      objc_msgSend(v6, "additionalServerParams");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:](SUCorePolicyExtensionManagedUpdates, "nameForMDMSoftwareUpdatePath:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSafeObject:forKey:", v17, CFSTR("MDMSoftwareUpdatePathName"));

      objc_msgSend(v6, "additionalServerParams");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("%@:%lld|"), CFSTR("MDMSoftwareUpdatePath"), objc_msgSend(v18, "safeULLForKey:", CFSTR("MDMSoftwareUpdatePath")));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "additionalServerParams");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "safeStringForKey:", CFSTR("MDMSoftwareUpdatePathName"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByAppendingFormat:", CFSTR("%@:%@|"), CFSTR("MDMSoftwareUpdatePathName"), v21);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = CFSTR("|");
    }
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "oslog");
    v24 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v27 = self;
      v28 = 2114;
      v29 = v22;
      _os_log_impl(&dword_1DDFDD000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading documentation catalog with extended download options: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "oslog");
    v24 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v24, OS_LOG_TYPE_DEFAULT, "Options class is not MAMsuDownloadOptions, so unable to set managed options.", buf, 2u);
    }
    v22 = CFSTR("|");
  }

}

- (void)extendMASoftwareUpdateAssetDownloadOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint8_t buf[4];
  SUCorePolicyExtensionManagedUpdates *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "additionalServerParams");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSafeObject:forKey:", v7, CFSTR("RequestedProductVersion"));

    objc_msgSend(v4, "additionalServerParams");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeStringForKey:", CFSTR("RequestedProductVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("|"), "stringByAppendingFormat:", CFSTR("%@:%@|"), CFSTR("RequestedProductVersion"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("|");
  }
  if (-[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"))
  {
    if (-[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs") < 0)
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ with MDMUseDelayPeriod, yet delayPeriodSecs < 0 (ignoring delay period)"), self);
      objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] DOWNLOAD_OPTIONS"), v14, 8102, 0);
    }
    else
    {
      objc_msgSend(v4, "additionalServerParams");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSafeObject:forKey:", v12, CFSTR("DelayPeriod"));

      objc_msgSend(v4, "additionalServerParams");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safeObjectForKey:ofClass:", CFSTR("DelayPeriod"), objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", CFSTR("%@:%@|"), CFSTR("DelayPeriod"), v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v10 = (__CFString *)v15;
    }

  }
  objc_msgSend(v4, "additionalServerParams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSafeObject:forKey:", v17, CFSTR("MDMSoftwareUpdatePath"));

  objc_msgSend(v4, "additionalServerParams");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:](SUCorePolicyExtensionManagedUpdates, "nameForMDMSoftwareUpdatePath:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSafeObject:forKey:", v19, CFSTR("MDMSoftwareUpdatePathName"));

  objc_msgSend(v4, "additionalServerParams");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"))
    v21 = CFSTR("true");
  else
    v21 = CFSTR("false");
  objc_msgSend(v20, "setSafeObject:forKey:", v21, CFSTR("DelayRequested"));

  objc_msgSend(v4, "additionalServerParams");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
    v23 = CFSTR("true");
  else
    v23 = CFSTR("false");
  objc_msgSend(v22, "setSafeObject:forKey:", v23, CFSTR("Supervised"));

  objc_msgSend(v4, "additionalServerParams");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "safeStringForKey:", CFSTR("DelayRequested"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", CFSTR("%@:%@|"), CFSTR("DelayRequested"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "additionalServerParams");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "safeStringForKey:", CFSTR("Supervised"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringByAppendingFormat:", CFSTR("%@:%@|"), CFSTR("Supervised"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "additionalServerParams");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringByAppendingFormat:", CFSTR("%@:%lld|"), CFSTR("MDMSoftwareUpdatePath"), objc_msgSend(v30, "safeULLForKey:", CFSTR("MDMSoftwareUpdatePath")));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "additionalServerParams");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "safeStringForKey:", CFSTR("MDMSoftwareUpdatePathName"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringByAppendingFormat:", CFSTR("%@:%@|"), CFSTR("MDMSoftwareUpdatePathName"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "oslog");
  v36 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v38 = self;
    v39 = 2114;
    v40 = v34;
    _os_log_impl(&dword_1DDFDD000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading software update asset with extended download options: %{public}@", buf, 0x16u);
  }

}

- (void)extendMSUApplyOptions:(id)a3
{
  __CFDictionary *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  NSObject *v8;
  int v9;
  SUCorePolicyExtensionManagedUpdates *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (__CFDictionary *)a3;
  if (-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
  {
    CFDictionaryAddValue(v4, (const void *)*MEMORY[0x1E0D4F808], (const void *)*MEMORY[0x1E0C9AE50]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("enabledManagedRequest|"));
    objc_msgSend(CFSTR("|"), "stringByAppendingString:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("|");
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ MSU apply options with extended options: %{public}@", (uint8_t *)&v9, 0x16u);
  }

}

- (BOOL)isRequestedPMVSupervisedPolicy
{
  void *v3;
  BOOL v4;

  if (!-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
    return 0;
  -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)delayPeriodDays
{
  if (-[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"))
    return -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs") / 86400;
  else
    return 0;
}

- (id)mdmPathName
{
  char *v3;
  void *v4;
  void *v5;

  v3 = -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath");
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown mdmPath value: %lu"), -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
      objc_msgSend(v4, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] SCAN_OPTIONS"), v5, 8102, 0);

      v3 = 0;
    }
  }
  else
  {
    +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:](SUCorePolicyExtensionManagedUpdates, "nameForMDMSoftwareUpdatePath:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
    v3 = (char *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (SUCorePolicyExtensionManagedUpdates)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyExtensionManagedUpdates *v5;
  uint64_t v6;
  NSString *requestedPMV;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyExtensionManagedUpdates;
  v5 = -[SUCorePolicyExtension init](&v9, sel_init);
  if (v5)
  {
    v5->_supervised = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Supervised"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RequestedPMV"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestedPMV = v5->_requestedPMV;
    v5->_requestedPMV = (NSString *)v6;

    v5->_MDMUseDelayPeriod = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MDMUseDelayPeriod"));
    v5->_delayPeriodSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DelayPeriodSecs"));
    v5->_mdmSoftwareUpdatePath = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MDMSoftwareUpdatePath"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"), CFSTR("Supervised"));
  -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("RequestedPMV"));

  objc_msgSend(v5, "encodeBool:forKey:", -[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"), CFSTR("MDMUseDelayPeriod"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs"), CFSTR("DelayPeriodSecs"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"), CFSTR("MDMSoftwareUpdatePath"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyExtensionManagedUpdates *v4;
  SUCorePolicyExtensionManagedUpdates *v5;
  _BOOL4 v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (SUCorePolicyExtensionManagedUpdates *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SUCorePolicyExtensionManagedUpdates supervised](v5, "supervised");
      if (v6 == -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
      {
        v8 = (void *)MEMORY[0x1E0DA8920];
        -[SUCorePolicyExtensionManagedUpdates requestedPMV](v5, "requestedPMV");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "stringIsEqual:to:", v9, v10)
          && (v11 = -[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](v5, "MDMUseDelayPeriod"),
              v11 == -[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"))
          && (v12 = -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](v5, "delayPeriodSecs"),
              v12 == -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs")))
        {
          v13 = -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](v5, "mdmSoftwareUpdatePath");
          v7 = v13 == -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath");
        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)extensionName
{
  return CFSTR("SUCorePolicyExtensionManagedUpdates");
}

+ (id)nameForMDMSoftwareUpdatePath:(unint64_t)a3
{
  if (a3 < 3)
    return off_1EA8794F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SUCoreMDMSoftwareUpdatePathUnknown(%ld)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)summary
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
  {
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", CFSTR("|supervised"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1EA87A8E8;
  }
  -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR("|requestedPMV=%@"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v6;
  }
  if (-[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"))
  {
    -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR("|MDMDelay=%ld"), -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs"));
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v7;
  }
  if (-[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"))
  {
    +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:](SUCorePolicyExtensionManagedUpdates, "nameForMDMSoftwareUpdatePath:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR("|mdmSoftwareUpdatePath=%@"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v9;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("|"));
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v10;
  }
  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  int64_t v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicyExtensionManagedUpdates extensionName](self, "extensionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs");
  +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:](SUCorePolicyExtensionManagedUpdates, "nameForMDMSoftwareUpdatePath:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@(supervised:%@|requestedPMV:%@|MDMUseDelayPeriod:%@|delayPeriodSecs:%ld|mdmSoftwareUpdatePath:%@)"), v4, v5, v6, v7, v8, v9);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SUCorePolicyExtensionManagedUpdates *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(SUCorePolicyExtensionManagedUpdates);
  -[SUCorePolicyExtensionManagedUpdates setSupervised:](v5, "setSupervised:", -[SUCorePolicyExtensionManagedUpdates supervised](self, "supervised"));
  -[SUCorePolicyExtensionManagedUpdates requestedPMV](self, "requestedPMV");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[SUCorePolicyExtensionManagedUpdates setRequestedPMV:](v5, "setRequestedPMV:", v7);

  -[SUCorePolicyExtensionManagedUpdates setMDMUseDelayPeriod:](v5, "setMDMUseDelayPeriod:", -[SUCorePolicyExtensionManagedUpdates MDMUseDelayPeriod](self, "MDMUseDelayPeriod"));
  -[SUCorePolicyExtensionManagedUpdates setDelayPeriodSecs:](v5, "setDelayPeriodSecs:", -[SUCorePolicyExtensionManagedUpdates delayPeriodSecs](self, "delayPeriodSecs"));
  -[SUCorePolicyExtensionManagedUpdates setMdmSoftwareUpdatePath:](v5, "setMdmSoftwareUpdatePath:", -[SUCorePolicyExtensionManagedUpdates mdmSoftwareUpdatePath](self, "mdmSoftwareUpdatePath"));
  return v5;
}

- (BOOL)supervised
{
  return self->_supervised;
}

- (void)setSupervised:(BOOL)a3
{
  self->_supervised = a3;
}

- (NSString)requestedPMV
{
  return self->_requestedPMV;
}

- (void)setRequestedPMV:(id)a3
{
  objc_storeStrong((id *)&self->_requestedPMV, a3);
}

- (BOOL)MDMUseDelayPeriod
{
  return self->_MDMUseDelayPeriod;
}

- (void)setMDMUseDelayPeriod:(BOOL)a3
{
  self->_MDMUseDelayPeriod = a3;
}

- (int64_t)delayPeriodSecs
{
  return self->_delayPeriodSecs;
}

- (void)setDelayPeriodSecs:(int64_t)a3
{
  self->_delayPeriodSecs = a3;
}

- (unint64_t)mdmSoftwareUpdatePath
{
  return self->_mdmSoftwareUpdatePath;
}

- (void)setMdmSoftwareUpdatePath:(unint64_t)a3
{
  self->_mdmSoftwareUpdatePath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedPMV, 0);
}

@end
