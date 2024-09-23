@implementation HKSPAnalyticsManager

- (HKSPAnalyticsManager)initWithUserDefaults:(id)a3 ihaOptInStatusProvider:(id)a4 diagnosticsOptInStatusProvider:(id)a5 analyticsEventConsumer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKSPAnalyticsManager *v14;
  HKSPAnalyticsStore *v15;
  HKSPAnalyticsStore *analyticsStore;
  uint64_t v17;
  id ihaOptInStatusProvider;
  uint64_t v19;
  id diagnosticsOptInStatusProvider;
  uint64_t v21;
  id analyticsEventConsumer;
  HKSPAnalyticsManager *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HKSPAnalyticsManager;
  v14 = -[HKSPAnalyticsManager init](&v25, sel_init);
  if (v14)
  {
    v15 = -[HKSPAnalyticsStore initWithUserDefaults:diagnosticsOptInStatusProvider:]([HKSPAnalyticsStore alloc], "initWithUserDefaults:diagnosticsOptInStatusProvider:", v10, v12);
    analyticsStore = v14->_analyticsStore;
    v14->_analyticsStore = v15;

    v17 = objc_msgSend(v11, "copy");
    ihaOptInStatusProvider = v14->_ihaOptInStatusProvider;
    v14->_ihaOptInStatusProvider = (id)v17;

    v19 = objc_msgSend(v12, "copy");
    diagnosticsOptInStatusProvider = v14->_diagnosticsOptInStatusProvider;
    v14->_diagnosticsOptInStatusProvider = (id)v19;

    v21 = objc_msgSend(v13, "copy");
    analyticsEventConsumer = v14->_analyticsEventConsumer;
    v14->_analyticsEventConsumer = (id)v21;

    v23 = v14;
  }

  return v14;
}

- (HKSPAnalyticsManager)initWithUserDefaults:(id)a3
{
  return -[HKSPAnalyticsManager initWithUserDefaults:ihaOptInStatusProvider:diagnosticsOptInStatusProvider:analyticsEventConsumer:](self, "initWithUserDefaults:ihaOptInStatusProvider:diagnosticsOptInStatusProvider:analyticsEventConsumer:", a3, &__block_literal_global_1, &__block_literal_global_184_0, &__block_literal_global_186);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_analyticsEventConsumer, 0);
  objc_storeStrong(&self->_diagnosticsOptInStatusProvider, 0);
  objc_storeStrong(&self->_ihaOptInStatusProvider, 0);
  objc_storeStrong((id *)&self->_analyticsStore, 0);
}

BOOL __45__HKSPAnalyticsManager_initWithUserDefaults___block_invoke_2()
{
  return +[HKSPAnalyticsManager defaultIsDiagnosticDataSubmissionAllowed](HKSPAnalyticsManager, "defaultIsDiagnosticDataSubmissionAllowed");
}

void __45__HKSPAnalyticsManager_initWithUserDefaults___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  HKSPLogForCategory(0x11uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_INFO, "AnalyticsSendEvent(%{public}@, %{public}@)", (uint8_t *)&v7, 0x16u);
  }

  AnalyticsSendEvent();
}

- (void)trackEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPAnalyticsManager trackEvents:](self, "trackEvents:", v6, v7, v8);
}

- (void)trackEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void (**analyticsEventConsumer)(id, void *, void *);
  void *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    v8 = "[%{public}@] Tracking event %{public}@";
    do
    {
      v9 = 0;
      v28 = v6;
      do
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        HKSPLogForCategory(0x11uLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v36 = v12;
          v37 = 2114;
          v38 = v10;
          v13 = v12;
          _os_log_impl(&dword_1A4F0E000, v11, OS_LOG_TYPE_INFO, v8, buf, 0x16u);

        }
        objc_msgSend(v10, "eventPayload");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HKSPAnalyticsManager isImproveHealthAndActivitySubmissionAllowed](self, "isImproveHealthAndActivitySubmissionAllowed")&& (objc_opt_respondsToSelector() & 1) != 0)
        {
          v15 = v7;
          v16 = v8;
          v17 = v4;
          v18 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v10, "keysRequiringIHAGating");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setWithArray:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          HKSPLogForCategory(0x11uLL);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v36 = v22;
            v37 = 2114;
            v38 = v20;
            v23 = v22;
            _os_log_impl(&dword_1A4F0E000, v21, OS_LOG_TYPE_INFO, "[%{public}@] Removing IHA gated keys %{public}@", buf, 0x16u);

          }
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __36__HKSPAnalyticsManager_trackEvents___block_invoke;
          v29[3] = &unk_1E4E3AB28;
          v30 = v20;
          v24 = v20;
          objc_msgSend(v14, "na_filter:", v29);
          v25 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v25;
          v4 = v17;
          v8 = v16;
          v7 = v15;
          v6 = v28;
        }
        if (objc_msgSend(v14, "count", v28))
        {
          analyticsEventConsumer = (void (**)(id, void *, void *))self->_analyticsEventConsumer;
          objc_msgSend(v10, "eventName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          analyticsEventConsumer[2](analyticsEventConsumer, v27, v14);

        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v6);
  }

}

uint64_t __36__HKSPAnalyticsManager_trackEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

+ (BOOL)defaultIsDiagnosticDataSubmissionAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDiagnosticSubmissionAllowed");

  return v3;
}

- (BOOL)isDiagnosticDataSubmissionAllowed
{
  return (*((uint64_t (**)(void))self->_diagnosticsOptInStatusProvider + 2))();
}

- (BOOL)isImproveHealthAndActivitySubmissionAllowed
{
  return (*((uint64_t (**)(void))self->_ihaOptInStatusProvider + 2))();
}

+ (id)currentDeviceType
{
  void *v2;
  uint64_t v3;
  __CFString **v4;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hksp_device");

  v4 = HKSPAnalyticsDeviceWatch;
  switch(v3)
  {
    case 2:
      return *v4;
    case 4:
      v4 = HKSPAnalyticsDevicePad;
      break;
    case 5:
      v4 = HKSPAnalyticsDeviceMac;
      break;
    case 6:
      v4 = HKSPAnalyticsDeviceReality;
      break;
    default:
      v4 = HKSPAnalyticsDevicePhone;
      break;
  }
  return *v4;
}

+ (id)activePairedWatchProductType
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0D51738]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HKSPAnalyticsStore)analyticsStore
{
  return self->_analyticsStore;
}

- (void)setAnalyticsStore:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsStore, a3);
}

- (id)ihaOptInStatusProvider
{
  return self->_ihaOptInStatusProvider;
}

- (void)setIhaOptInStatusProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)diagnosticsOptInStatusProvider
{
  return self->_diagnosticsOptInStatusProvider;
}

- (void)setDiagnosticsOptInStatusProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)analyticsEventConsumer
{
  return self->_analyticsEventConsumer;
}

- (void)setAnalyticsEventConsumer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
