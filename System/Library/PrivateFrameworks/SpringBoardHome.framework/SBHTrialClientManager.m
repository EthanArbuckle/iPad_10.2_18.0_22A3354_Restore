@implementation SBHTrialClientManager

- (SBHTrialClientManager)init
{
  SBHTrialClientManager *v2;
  uint64_t v3;
  TRIClient *trialClient;
  uint64_t v5;
  NSString *homeScreenNamespace;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHTrialClientManager;
  v2 = -[SBHTrialClientManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 271);
    v3 = objc_claimAutoreleasedReturnValue();
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v3;

    objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", 962);
    v5 = objc_claimAutoreleasedReturnValue();
    homeScreenNamespace = v2->_homeScreenNamespace;
    v2->_homeScreenNamespace = (NSString *)v5;

  }
  return v2;
}

- (void)immediatelyFetchSpringBoardHomeNamespace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[SBHTrialClientManager homeScreenNamespace](self, "homeScreenNamespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHTrialClientManager trialClient](self, "trialClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "immediateDownloadForNamespaceNames:allowExpensiveNetworking:error:", v6, 1, &v12);
  v9 = v12;

  if (v9)
  {
    SBLogWidgetDiscoverabilityMigration();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "Immediate download onboarding factor error: %@", buf, 0xCu);
    }

  }
  if ((v8 & 1) == 0)
  {
    SBLogWidgetDiscoverabilityMigration();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "Immediate download onboarding factor failed.", buf, 2u);
    }

  }
}

- (BOOL)widgetDiscoverabilityGoSwitchEnabled
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHTrialClientManager trialClient](self, "trialClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTrialClientManager homeScreenNamespace](self, "homeScreenNamespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "levelForFactor:withNamespaceName:", CFSTR("goSwitch"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "BOOLeanValue");
  return (char)v4;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (NSString)homeScreenNamespace
{
  return self->_homeScreenNamespace;
}

- (void)setHomeScreenNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenNamespace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenNamespace, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end
