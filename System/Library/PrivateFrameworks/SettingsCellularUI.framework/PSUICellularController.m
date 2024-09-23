@implementation PSUICellularController

- (PSUICellularController)init
{
  PSUICellularController *v2;
  id v3;
  uint64_t v4;
  CoreTelephonyClient *coreTelephonyClient;
  PSUIAppsAndCategoriesDataUsageSubgroup *v6;
  void *v7;
  PSUIAppsAndCategoriesDataUsageSubgroup *v8;
  PSUITopAppUsageGroup *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PSUITopAppUsageGroup *topAppUsageGroup;
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
  void *v25;
  objc_super v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PSUICellularController;
  v2 = -[PSUICellularController init](&v28, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDC2810]);
    v4 = objc_msgSend(v3, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v4;

    -[CoreTelephonyClient setDelegate:](v2->_coreTelephonyClient, "setDelegate:", v2);
    v6 = [PSUIAppsAndCategoriesDataUsageSubgroup alloc];
    objc_msgSend(MEMORY[0x24BE85698], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PSUIAppsAndCategoriesDataUsageSubgroup initWithPolicySpecifierDelegate:statisticsCache:](v6, "initWithPolicySpecifierDelegate:statisticsCache:", v2, v7);

    v9 = [PSUITopAppUsageGroup alloc];
    objc_msgSend(MEMORY[0x24BE85688], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE85698], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PSUITopAppUsageGroup initWithHostController:cellularManagementCache:dataUsageStatisticsCache:carrierSpaceManager:appsAndCategoriesSubgroup:](v9, "initWithHostController:cellularManagementCache:dataUsageStatisticsCache:carrierSpaceManager:appsAndCategoriesSubgroup:", v2, v10, v11, v12, v8);
    topAppUsageGroup = v2->_topAppUsageGroup;
    v2->_topAppUsageGroup = (PSUITopAppUsageGroup *)v13;

    objc_msgSend(MEMORY[0x24BE85698], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "refreshCacheIfNeeded");

    v27.receiver = v2;
    v27.super_class = (Class)PSUICellularController;
    -[PSUICellularController setPrefetchingEnabled:](&v27, sel_setPrefetchingEnabled_, 1);
    +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "refresh");

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel_newCarrierNotification, CFSTR("PSNewCarrierNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, sel_entitlementStatusChanged, *MEMORY[0x24BE30308], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel_cellularPlanChanged_, CFSTR("PSUICellularPlanChanged"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v2, sel_wirelessDataUsageChangedNotification, *MEMORY[0x24BE856D8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v2, sel_carrierItemsChanged, *MEMORY[0x24BE158A8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v2, sel_cellularDataSettingChanged, 0x24D507FE8, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v2, sel_airplaneModeChanged, 0x24D508008, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v2, sel_perAppNetworkDataAccessPolicyChanged, *MEMORY[0x24BE856C0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v2, sel_wirelessDataUsageCacheRefreshed, *MEMORY[0x24BE856D0], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSUICellularController;
  -[PSUICellularController dealloc](&v4, sel_dealloc);
}

- (void)setSpecifier:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "setName:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PSUICellularController;
  -[PSUICellularController setSpecifier:](&v5, sel_setSpecifier_, v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[PSUICellularController viewWillAppear:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)PSUICellularController;
  -[PSUICellularController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
  -[PSUISubscriptionContextMenusGroup viewWillAppear](self->_subscriptionContextMenus, "viewWillAppear");
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__PSUICellularController_viewWillAppear___block_invoke;
  v8[3] = &unk_24D501E00;
  v8[4] = self;
  objc_msgSend(v6, "startProvisioningWithCompletion:", v8);

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearCachedCarrierItemsAndRemotePlans");

  -[PSUICellularController reloadSpecifiers](self, "reloadSpecifiers");
}

void __41__PSUICellularController_viewWillAppear___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("failed");
    if (a2)
      v4 = CFSTR("succeeded");
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "provisioning start: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  CoreTelephonyClient *coreTelephonyClient;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)PSUICellularController;
  -[PSUICellularController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = 0;
LABEL_9:
    -[PSUICellularController emitNavigationEvent](self, "emitNavigationEvent");
    goto LABEL_10;
  }
  coreTelephonyClient = self->_coreTelephonyClient;
  v10 = 0;
  -[CoreTelephonyClient needToLaunchSetUpeSIM:](coreTelephonyClient, "needToLaunchSetUpeSIM:", &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v5)
  {
    if (objc_msgSend(v5, "BOOLValue"))
    {
      -[PSUICellularController getLogger](self, "getLogger");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Need to launch Set Up eSIM", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PSUICellularPlanSetUpNeeded"), 0, 0);

    }
    goto LABEL_9;
  }
  -[PSUICellularController getLogger](self, "getLogger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "Error with checking setup eSIM: %@", buf, 0xCu);
  }

LABEL_10:
}

- (void)emitNavigationEvent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Cellular"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithKey:table:locale:bundleURL:", CFSTR("Cellular"), 0, v4, v6);

  -[PSUICellularController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.cellular-settings"), v7, MEMORY[0x24BDBD1A8], v8);
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  PSUIDeferredDeepLink *v14;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CELLULAR")) & 1) != 0
    || (objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "specifierForID:", v9), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    v13 = 1;
  }
  else
  {
    v14 = -[PSUIDeferredDeepLink initWithSpecifierID:resourceDictionary:completion:]([PSUIDeferredDeepLink alloc], "initWithSpecifierID:resourceDictionary:completion:", v9, v10, v11);
    -[PSUICellularController setDeferredDeepLink:](self, "setDeferredDeepLink:", v14);

    v13 = 0;
  }

  return v13;
}

- (void)launchDeferredDeepLinkIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[5];
  id v11;

  -[PSUICellularController deferredDeepLink](self, "deferredDeepLink");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
    -[PSUICellularController deferredDeepLink](self, "deferredDeepLink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "specifierID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v10[0] = 0;
      v10[1] = v10;
      v10[2] = 0x3032000000;
      v10[3] = __Block_byref_object_copy__1;
      v10[4] = __Block_byref_object_dispose__1;
      v11 = 0;
      -[PSUICellularController deferredDeepLink](self, "deferredDeepLink");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[PSUICellularController setDeferredDeepLink:](self, "setDeferredDeepLink:", 0);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __56__PSUICellularController_launchDeferredDeepLinkIfNeeded__block_invoke;
      v9[3] = &unk_24D501E28;
      v9[4] = self;
      v9[5] = v10;
      dispatch_async(MEMORY[0x24BDAC9B8], v9);
      _Block_object_dispose(v10, 8);

    }
  }
}

void __56__PSUICellularController_launchDeferredDeepLinkIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resourceDictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "completion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleURL:withCompletion:", v4, v3);

}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("travelEducation")) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PSUICellularController;
    v9 = -[PSUICellularController shouldDeferPushForSpecifierID:urlDictionary:](&v11, sel_shouldDeferPushForSpecifierID_urlDictionary_, v6, v7);
  }

  return v9;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v18;
  void *v19;
  char v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[5];
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[PSUICellularController getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[PSUICellularController handleURL:withCompletion:]";
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[PSUICellularController viewIfLoaded](self, "viewIfLoaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("travelEducation")))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("client"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.CommCenter"));

      -[PSUICellularController getLogger](self, "getLogger");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if ((v13 & 1) != 0)
      {
        if (v15)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "launching SIMSetup Travel Education Flow", buf, 2u);
        }

        -[PSUICellularController launchTravelEducationFlow:](self, "launchTravelEducationFlow:", v6);
        goto LABEL_23;
      }
      if (!v15)
        goto LABEL_16;
      *(_WORD *)buf = 0;
      v18 = "invalid travel education client";
    }
    else
    {
      if (+[SettingsCellularUtils isCaseInsensitiveEqual:withString:](SettingsCellularUtils, "isCaseInsensitiveEqual:withString:", v11, CFSTR("esim_qrcode_provisioning")))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("carddata"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
        {
          coreTelephonyClient = self->_coreTelephonyClient;
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __51__PSUICellularController_handleURL_withCompletion___block_invoke;
          v26[3] = &unk_24D501E90;
          v26[4] = self;
          -[CoreTelephonyClient getActionForCardData:completionHandler:](coreTelephonyClient, "getActionForCardData:completionHandler:", v16, v26);
          v7[2](v7);
        }
        else
        {
          -[PSUICellularController getLogger](self, "getLogger");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2161C6000, v22, OS_LOG_TYPE_DEFAULT, "Emtpy eSIM QR code data", buf, 2u);
          }

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSUICellularController _createESIMCardDataAlert:](self, "_createESIMCardDataAlert:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          -[PSUICellularController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);
          v7[2](v7);

        }
        goto LABEL_28;
      }
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("addeSIM")))
        goto LABEL_22;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("client"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.Siri"));

      -[PSUICellularController getLogger](self, "getLogger");
      v14 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if ((v20 & 1) != 0)
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "launching add eSIM Flow", buf, 2u);
        }

        -[PSUICellularController launchAddeSIMFlow](self, "launchAddeSIMFlow");
        goto LABEL_23;
      }
      if (!v21)
      {
LABEL_16:

LABEL_22:
        v25.receiver = self;
        v25.super_class = (Class)PSUICellularController;
        -[PSUICellularController handleURL:withCompletion:](&v25, sel_handleURL_withCompletion_, v6, &__block_literal_global_96);
LABEL_23:
        v7[2](v7);
LABEL_28:

        goto LABEL_29;
      }
      *(_WORD *)buf = 0;
      v18 = "invalid add eSIM client";
    }
    _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    goto LABEL_16;
  }
  v27.receiver = self;
  v27.super_class = (Class)PSUICellularController;
  -[PSUICellularController handleURL:withCompletion:](&v27, sel_handleURL_withCompletion_, v6, v7);
LABEL_29:

}

void __51__PSUICellularController_handleURL_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "getActionForCardData callback: Success - %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(v5, "performWithCompletionHandler:", &__block_literal_global_12);
  }
  else
  {
    if (v8)
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Failed getActionForCardData with error %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_createESIMCardDataAlert:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v9, 1, 0);

  }
}

- (id)_createESIMCardDataAlert:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ESIM_ACTIVATION_FAILED_ACTION_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "code") == 22)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("ESIM_ACTIVATION_FAILED_PARSE_MESSAGE");
  }
  else if (objc_msgSend(v3, "code") == 19)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("ESIM_ACTIVATION_DEVICE_NOT_SUPPORTED_MESSAGE");
  }
  else
  {
    v9 = objc_msgSend(v3, "code");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v9 == 45)
      v8 = CFSTR("ESIM_ACTIVATION_POLICY_MISMATCH_MESSAGE");
    else
      v8 = CFSTR("ESIM_ACTIVATION_FAILED_ACTION_MESSAGE");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24D5028C8, CFSTR("Cellular"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v5, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON"), &stru_24D5028C8, CFSTR("Cellular"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 2, &__block_literal_global_115);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v15);
  return v11;
}

- (void)learnMoreLinkTapped
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)*MEMORY[0x24BEBDF78];
  v3 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE_AT_LINK"), &stru_24D5028C8, CFSTR("Cellular"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:options:completionHandler:", v5, MEMORY[0x24BDBD1B8], 0);

}

- (id)_deadTelephonySpecifiers
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v17;
  const char *v18;
  uint64_t v19;
  NSRange v20;

  v19 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315138;
    v18 = "-[PSUICellularController _deadTelephonySpecifiers]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v17, 0xCu);
  }

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PSUICellularController setUpCellularDiagnosticsGroup:](self, "setUpCellularDiagnosticsGroup:", v4);
  if (!objc_msgSend(v4, "count"))
  {
    -[PSUICellularController getLogger](self, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_2161C6000, v5, OS_LOG_TYPE_ERROR, "No Cellular Diagnostics. Fall back", (uint8_t *)&v17, 2u);
    }

    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("UPDATE_REQUIRED_FOR_CELLULAR"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UPDATE_REQUIRED_FOR_CELLULAR"), &stru_24D5028C8, CFSTR("Cellular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v8, *MEMORY[0x24BE75A68]);

    objc_msgSend(v6, "setProperty:forKey:", &unk_24D51C3F8, *MEMORY[0x24BE75A28]);
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("LEARN_MORE_AT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_24D5028C8, CFSTR("Cellular"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setProperty:forKey:", v11, *MEMORY[0x24BE75A58]);
    v20.location = objc_msgSend(v11, "rangeOfString:", v11);
    NSStringFromRange(v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v12, *MEMORY[0x24BE75A40]);

    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v14, *MEMORY[0x24BE75A30]);

    objc_msgSend(v9, "setProperty:forKey:", &unk_24D51C3F8, *MEMORY[0x24BE75860]);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v15, *MEMORY[0x24BE75A50]);

    objc_msgSend(v9, "setProperty:forKey:", CFSTR("learnMoreLinkTapped"), *MEMORY[0x24BE75A38]);
    objc_msgSend(v4, "addObject:", v6);
    objc_msgSend(v4, "addObject:", v9);

  }
  return v4;
}

- (void)retryCarrierListFetch:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PSUICellularController retryCarrierListFetch:]";
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCachedCarrierItemsAndRemotePlans");

  -[PSUICellularController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)turnOnLocationServicesPressed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[PSUICellularController turnOnLocationServicesPressed:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openSensitiveURL:withOptions:", v8, 0);

}

- (void)turnOnWifiPressed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[PSUICellularController turnOnWifiPressed:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openSensitiveURL:withOptions:", v8, 0);

}

- (id)specifiers
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315138;
    v18 = "-[PSUICellularController specifiers]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v17, 0xCu);
  }

  v4 = (int)*MEMORY[0x24BE756E0];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v4))
    goto LABEL_24;
  -[PSUICellularController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315138;
    v18 = "-[PSUICellularController specifiers]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s (re)loading specifiers", (uint8_t *)&v17, 0xCu);
  }

  if (!PSIsTelephonyDead())
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[PSUICellularController cellularPlacardSpecifier](self, "cellularPlacardSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("PLACARD_GROUP"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);
      objc_msgSend(v8, "ps_addSpecifier:toGroup:", v9, v10);

    }
    -[PSUICellularController setUpCellularDiagnosticsGroup:](self, "setUpCellularDiagnosticsGroup:", v8);
    v11 = -[PSUICellularController shouldShowNoSIMsOrActivatePlansUI](self, "shouldShowNoSIMsOrActivatePlansUI");
    -[PSUICellularController getLogger](self, "getLogger");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        v17 = 136315138;
        v18 = "-[PSUICellularController specifiers]";
        _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "%s Setting up the no SIMs or activated plans specifiers", (uint8_t *)&v17, 0xCu);
      }

      -[PSUICellularController setUpActivationSpecifiers:](self, "setUpActivationSpecifiers:", v8);
      if (+[SettingsCellularUtils shouldShowPendingTransferPlanOnPad](SettingsCellularUtils, "shouldShowPendingTransferPlanOnPad"))
      {
        -[PSUICellularController setUpPlanPendingTransferListGroup:](self, "setUpPlanPendingTransferListGroup:", v8);
      }
    }
    else
    {
      if (v13)
      {
        v17 = 136315138;
        v18 = "-[PSUICellularController specifiers]";
        _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "%s plan items count is non-zero; continuing with normal specifier layout",
          (uint8_t *)&v17,
          0xCu);
      }

      -[PSUICellularController setUpCellularDataOptionsGroup:](self, "setUpCellularDataOptionsGroup:", v8);
      -[PSUICellularController setUpDefaultVoiceGroup:](self, "setUpDefaultVoiceGroup:", v8);
      if (+[SettingsCellularUtils isUIDualSIM](SettingsCellularUtils, "isUIDualSIM"))
      {
        -[PSUICellularController setUpCellularListGroup:](self, "setUpCellularListGroup:", v8);
        -[PSUICellularController setUpPrivateNetworkListGroup:](self, "setUpPrivateNetworkListGroup:", v8);
      }
      else
      {
        -[PSUICellularController getLogger](self, "getLogger");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136315138;
          v18 = "-[PSUICellularController specifiers]";
          _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "%s showing single sim specifiers", (uint8_t *)&v17, 0xCu);
        }

        -[PSUICellularController setUpDataOnlyPlanListGroupIfNeeded:](self, "setUpDataOnlyPlanListGroupIfNeeded:", v8);
        -[PSUICellularController setSubscriptionContextAndPlanProperties](self, "setSubscriptionContextAndPlanProperties");
        -[PSUICellularController setUpSubscriptionContextMenusGroup:](self, "setUpSubscriptionContextMenusGroup:", v8);
        -[PSUICellularController setUpAddPlanGroup:](self, "setUpAddPlanGroup:", v8);
      }
      -[PSUICellularController setUpFacetimeSetupGroup:](self, "setUpFacetimeSetupGroup:", v8);
      -[PSUICellularController setUpTopAppUsageGroup:](self, "setUpTopAppUsageGroup:", v8);
      -[PSUICellularController setUpMiscOptionsGroup:](self, "setUpMiscOptionsGroup:", v8);
    }
    -[PSUICellularController disableSpecifiersIfNeeded:](self, "disableSpecifiersIfNeeded:", v8);
    objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v8, CFSTR("[PSUICellularController specifiers] end"));
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)v8;

LABEL_24:
    -[PSUICellularController launchDeferredDeepLinkIfNeeded](self, "launchDeferredDeepLinkIfNeeded");
    return *(id *)((char *)&self->super.super.super.super.super.isa + v4);
  }
  -[PSUICellularController _deadTelephonySpecifiers](self, "_deadTelephonySpecifiers");
  v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = v6;

  return *(id *)((char *)&self->super.super.super.super.super.isa + v4);
}

- (id)cellularPlacardSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLACARD"), &stru_24D5028C8, CFSTR("Cellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProperty:forKey:", NSClassFromString(CFSTR("SettingsCellularUI.SettingsCellularUIPlacardCell")), *MEMORY[0x24BE75948]);
  objc_msgSend(v6, "setIdentifier:", CFSTR("CELLULAR_PLACARD"));
  return v6;
}

- (void)setUpActivationSpecifiers:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  PSUIPendingInstallPlanGroup *v8;
  void *v9;
  void *v10;
  void *v11;
  PSUIOtherOptionsGroup *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  PSUICellularPlanListGroup *v18;
  PSUICellularPlanListGroup *cellularPlanListGroup;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v48 = 136315138;
    v49 = "-[PSUICellularController setUpActivationSpecifiers:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v48, 0xCu);
  }

  v6 = _os_feature_enabled_impl();
  if (v6 && -[PSUICellularController shouldShowPendingInstallPlan](self, "shouldShowPendingInstallPlan"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("PENDING_INSTALL_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);
    v8 = -[PSUIPendingInstallPlanGroup initWithListController:groupSpecifier:]([PSUIPendingInstallPlanGroup alloc], "initWithListController:groupSpecifier:", self, v7);
    -[PSUICellularController setPendingInstallPlanGroup:](self, "setPendingInstallPlanGroup:", v8);

    -[PSUICellularController pendingInstallPlanGroup](self, "pendingInstallPlanGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "specifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v10, v7);

    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("OTHER_OPTIONS_GROUP"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);
    v12 = -[PSUIOtherOptionsGroup initWithListController:groupSpecifier:]([PSUIOtherOptionsGroup alloc], "initWithListController:groupSpecifier:", self, v11);
    -[PSUICellularController setOtherOptionsGroup:](self, "setOtherOptionsGroup:", v12);

    -[PSUICellularController otherOptionsGroup](self, "otherOptionsGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:
    v46 = v13;
    objc_msgSend(v13, "specifiers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v47, v11);

    goto LABEL_38;
  }
  if (!-[PSUICellularController deviceIsDualSIMCapableAndPlansExist](self, "deviceIsDualSIMCapableAndPlansExist"))
  {
    if (!-[PSUICellularController shouldShowAddPlanButton](self, "shouldShowAddPlanButton"))
    {
      v7 = 0;
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  -[PSUICellularController getLogger](self, "getLogger");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v48 = 136315138;
    v49 = "-[PSUICellularController setUpActivationSpecifiers:]";
    _os_log_debug_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEBUG, "%s device is dual sim capable, and plan items count is non-zero", (uint8_t *)&v48, 0xCu);
  }

  v15 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLANS"), &stru_24D5028C8, CFSTR("Cellular"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "groupSpecifierWithName:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  objc_msgSend(v4, "addObject:", v7);
  v18 = -[PSUICellularPlanListGroup initWithListController:groupSpecifier:isPrivateNetworkPlansList:]([PSUICellularPlanListGroup alloc], "initWithListController:groupSpecifier:isPrivateNetworkPlansList:", self, v7, 0);
  cellularPlanListGroup = self->_cellularPlanListGroup;
  self->_cellularPlanListGroup = v18;

  -[PSUICellularPlanListGroup specifiers](self->_cellularPlanListGroup, "specifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v20, v7);

  -[PSUICellularController setUpPrivateNetworkListGroup:](self, "setUpPrivateNetworkListGroup:", v4);
  if (-[PSUICellularController shouldShowAddPlanButton](self, "shouldShowAddPlanButton"))
  {
    if (v7)
    {
LABEL_16:
      -[PSUICellularController createAddCellularPlanSpecifierIfNeeded](self, "createAddCellularPlanSpecifierIfNeeded");
      objc_msgSend(v4, "ps_addSpecifier:toGroup:", self->_addCellularPlanSpecifier, v7);
      -[PSUICellularController addLocationFooterIfNecessary:](self, "addLocationFooterIfNecessary:", v7);
      goto LABEL_18;
    }
LABEL_13:
    -[PSUICellularController getLogger](self, "getLogger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v48 = 136315138;
      v49 = "-[PSUICellularController setUpActivationSpecifiers:]";
      _os_log_debug_impl(&dword_2161C6000, v21, OS_LOG_TYPE_DEBUG, "%s device is not dual sim capable, or plan items count is zero; showing separate add cellular plan group",
        (uint8_t *)&v48,
        0xCu);
    }

    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ADD_CELLULAR_PLAN_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);
    goto LABEL_16;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "sf_isiPad");

  if (v23)
  {
    if (!v7)
    {
      -[PSUICellularController transferPlanGroupSpecifier](self, "transferPlanGroupSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUICellularController createTransferPlanGroupIfNeeded:](self, "createTransferPlanGroupIfNeeded:", v7);
      -[PSUICellularController planPendingTransferGroup](self, "planPendingTransferGroup");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "specifiers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if (v26)
      {
        objc_msgSend(v4, "addObject:", v7);
        -[PSUICellularController planPendingTransferGroup](self, "planPendingTransferGroup");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "specifiers");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v28, v7);

      }
    }
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "sf_isiPad");

  if (v30)
  {
    -[PSUICellularController getLogger](self, "getLogger");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v48 = 136315138;
      v49 = "-[PSUICellularController setUpActivationSpecifiers:]";
      _os_log_debug_impl(&dword_2161C6000, v31, OS_LOG_TYPE_DEBUG, "%s showing add on plan group", (uint8_t *)&v48, 0xCu);
    }

    -[PSUICellularController addOnPlanGroupSpecifier](self, "addOnPlanGroupSpecifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v32);
    -[PSUICellularController createAddOnPlanGroupIfNeeded:showAddOnPlans:](self, "createAddOnPlanGroupIfNeeded:showAddOnPlans:", v32, v6 ^ 1u);
    -[PSUICellularController addOnPlanGroup](self, "addOnPlanGroup");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "specifiers");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v34, v32);

    if (((v6 ^ 1) & 1) == 0)
    {
      -[PSUICellularController addOnPlanGroup](self, "addOnPlanGroup");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "specifiers");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "count");

      if (!v37)
        objc_msgSend(v4, "removeObject:", v32);
    }

  }
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isCarrierItemFlowSupported");

  if (v39)
  {
    -[PSUICellularController getLogger](self, "getLogger");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v48 = 136315138;
      v49 = "-[PSUICellularController setUpActivationSpecifiers:]";
      _os_log_debug_impl(&dword_2161C6000, v40, OS_LOG_TYPE_DEBUG, "%s showing add new network group", (uint8_t *)&v48, 0xCu);
    }

    -[PSUICellularController carrierItemGroupSpecifier](self, "carrierItemGroupSpecifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularController createCarrierItemGroupIfNeeded:showCarrierItems:](self, "createCarrierItemGroupIfNeeded:showCarrierItems:", v41, v6 ^ 1u);
    if (-[PSUICellularController _shouldShowCarrierItemGroup](self, "_shouldShowCarrierItemGroup"))
    {
      objc_msgSend(v4, "addObject:", v41);
      -[PSUICellularController carrierItemGroup](self, "carrierItemGroup");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "specifiers");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v43, v41);

    }
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "sf_isiPad");

  if (v45)
  {
    -[PSUICellularController QRCodeGroupSpecifier](self, "QRCodeGroupSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);
    -[PSUICellularController createQRCodeGroupIfNeeded:](self, "createQRCodeGroupIfNeeded:", v11);
    -[PSUICellularController QRCodeGroup](self, "QRCodeGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
LABEL_38:

}

- (void)setUpCellularDiagnosticsGroup:(id)a3
{
  id v4;
  PSUICellularDiagnosticsSpecifier *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = objc_alloc_init(PSUICellularDiagnosticsSpecifier);
  if (-[PSUICellularDiagnosticsSpecifier cellularIssueFound](v5, "cellularIssueFound"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CELLULAR_DIAGNOSTICS_GROUP"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);
    objc_msgSend(v4, "ps_addSpecifier:toGroup:", v5, v6);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DIAGNOSTICS_GROUP_FOOTER"), &stru_24D5028C8, CFSTR("Cellular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setProperty:forKey:](v6, "setProperty:forKey:", v8, *MEMORY[0x24BE75A68]);

  }
  else
  {
    -[PSUICellularController getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Cellular Diagnostics: No cellular issue detected and not add Diagnostics menu", v9, 2u);
    }
  }

}

- (void)setUpCellularDataOptionsGroup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PSUICellularDataSpecifier *v9;
  void *v10;
  uint64_t v11;
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
  PSSpecifier *v22;
  PSSpecifier *personalHotspotSpecifier;
  PSSpecifier *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[PSUICellularController setUpCellularDataOptionsGroup:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s showing cellular data options group", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CELLULAR_DATA_OPTIONS_GROUP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAnyPlanActivating") ^ 1;

  v9 = -[PSUICellularDataSpecifier initWithHostController:]([PSUICellularDataSpecifier alloc], "initWithHostController:", self);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE75A18];
  -[PSUICellularDataSpecifier setProperty:forKey:](v9, "setProperty:forKey:", v10, *MEMORY[0x24BE75A18]);

  objc_msgSend(v4, "ps_addSpecifier:toGroup:", v9, v6);
  if (!+[SettingsCellularUtils isUIDualSIM](SettingsCellularUtils, "isUIDualSIM"))
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectedPlanItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DATA_OPTIONS"), &stru_24D5028C8, CFSTR("Cellular"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, self, 0, sel_cellularDataOptionsDetailText_, objc_opt_class(), 2, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setIdentifier:", CFSTR("CELLULAR_DATA_OPTIONS"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setProperty:forKey:", v18, v11);

      objc_msgSend(v17, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(v4, "ps_addSpecifier:toGroup:", v17, v6);

    }
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", v20, &stru_24D5028C8, CFSTR("Cellular"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProperty:forKey:", v21, *MEMORY[0x24BE75A68]);
  -[PSUICellularController createPersonalHotspotSpecifier](self, "createPersonalHotspotSpecifier");
  v22 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  personalHotspotSpecifier = self->_personalHotspotSpecifier;
  self->_personalHotspotSpecifier = v22;

  v24 = self->_personalHotspotSpecifier;
  if (v24)
    objc_msgSend(v4, "ps_addSpecifier:toGroup:", v24, v6);

}

- (void)setUpDefaultVoiceGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[SettingsCellularUtils isUIDualSIM](SettingsCellularUtils, "isUIDualSIM"))
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "planItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 >= 2)
    {
      -[PSUICellularController getLogger](self, "getLogger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315138;
        v12 = "-[PSUICellularController setUpDefaultVoiceGroup:]";
        _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s showing default voice group", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DEFAULT_VOICE_LINE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);
      v10 = -[PSUIDefaultVoiceLineSpecifier initSpecifier]([PSUIDefaultVoiceLineSpecifier alloc], "initSpecifier");
      objc_msgSend(v4, "ps_addSpecifier:toGroup:", v10, v9);

    }
  }

}

- (void)setUpPlanPendingTransferListGroup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PSUIPlanPendingTransferListGroup *v10;
  PSUIPlanPendingTransferListGroup *planPendingTransferGroup;
  void *v12;
  uint8_t v13[16];

  v4 = a3;
  -[PSUICellularController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "showing plan pending transfer list group", v13, 2u);
  }

  v6 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLANS"), &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupSpecifierWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  objc_msgSend(v4, "addObject:", v9);
  v10 = -[PSUIPlanPendingTransferListGroup initWithListController:groupSpecifier:]([PSUIPlanPendingTransferListGroup alloc], "initWithListController:groupSpecifier:", self, v9);
  planPendingTransferGroup = self->_planPendingTransferGroup;
  self->_planPendingTransferGroup = v10;

  -[PSUIPlanPendingTransferListGroup specifiers](self->_planPendingTransferGroup, "specifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v12, v9);

}

- (void)setUpCellularListGroup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PSUICellularPlanListGroup *v10;
  PSUICellularPlanListGroup *cellularPlanListGroup;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[PSUICellularController setUpCellularListGroup:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s showing dual sim cellular plans list group", (uint8_t *)&v14, 0xCu);
  }

  v6 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLANS"), &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupSpecifierWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  objc_msgSend(v4, "addObject:", v9);
  v10 = -[PSUICellularPlanListGroup initWithListController:groupSpecifier:isPrivateNetworkPlansList:]([PSUICellularPlanListGroup alloc], "initWithListController:groupSpecifier:isPrivateNetworkPlansList:", self, v9, 0);
  cellularPlanListGroup = self->_cellularPlanListGroup;
  self->_cellularPlanListGroup = v10;

  -[PSUICellularPlanListGroup specifiers](self->_cellularPlanListGroup, "specifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v12, v9);

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v13, "isActivationCodeFlowSupported");

  if ((_DWORD)v8)
  {
    -[PSUICellularController createAddCellularPlanSpecifierIfNeeded](self, "createAddCellularPlanSpecifierIfNeeded");
    objc_msgSend(v4, "ps_addSpecifier:toGroup:", self->_addCellularPlanSpecifier, v9);
    -[PSUICellularController _maybeAddCrossPlatformSIMTransferSpecifier:toGroup:](self, "_maybeAddCrossPlatformSIMTransferSpecifier:toGroup:", v4, v9);
  }

}

- (void)setUpPrivateNetworkListGroup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PSUICellularPlanListGroup *v10;
  PSUICellularPlanListGroup *privateNetworkPlanListGroup;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[PSUICellularController shouldShowPrivateNetworkPlansList](self, "shouldShowPrivateNetworkPlansList"))
  {
    -[PSUICellularController getLogger](self, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[PSUICellularController setUpPrivateNetworkListGroup:]";
      _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s showing dual sim private network plans list group", (uint8_t *)&v16, 0xCu);
    }

    v6 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NON_PUBLIC_NETWORK_PLANS"), &stru_24D5028C8, CFSTR("Cellular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupSpecifierWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
    objc_msgSend(v4, "addObject:", v9);
    v10 = -[PSUICellularPlanListGroup initWithListController:groupSpecifier:isPrivateNetworkPlansList:]([PSUICellularPlanListGroup alloc], "initWithListController:groupSpecifier:isPrivateNetworkPlansList:", self, v9, 1);
    privateNetworkPlanListGroup = self->_privateNetworkPlanListGroup;
    self->_privateNetworkPlanListGroup = v10;

    -[PSUICellularPlanListGroup specifiers](self->_privateNetworkPlanListGroup, "specifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v12, v9);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SFLocalizableWAPIStringKeyForKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_24D5028C8, CFSTR("Cellular"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setProperty:forKey:", v15, *MEMORY[0x24BE75A68]);
  }

}

- (void)setUpDataOnlyPlanListGroupIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  PSUICellularDataPlanListGroup *v12;
  PSUICellularDataPlanListGroup *cellularDataPlanListGroup;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  PSUICellularDataPlanListGroup *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[PSUICellularController shouldShowDataPlans](self, "shouldShowDataPlans"))
  {
    -[PSUICellularController getLogger](self, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[PSUICellularController setUpDataOnlyPlanListGroupIfNeeded:]";
      _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s showing data plans", buf, 0xCu);
    }

    v6 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLANS"), &stru_24D5028C8, CFSTR("Cellular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupSpecifierWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAnyPlanActivating");

    +[PSUICellularDataPlanListGroup groupWithListController:groupSpecifier:](PSUICellularDataPlanListGroup, "groupWithListController:groupSpecifier:", self, v9);
    v12 = (PSUICellularDataPlanListGroup *)objc_claimAutoreleasedReturnValue();
    cellularDataPlanListGroup = self->_cellularDataPlanListGroup;
    self->_cellularDataPlanListGroup = v12;

    -[PSUICellularDataPlanListGroup specifiers](self->_cellularDataPlanListGroup, "specifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      if (v11)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v24;
          v19 = *MEMORY[0x24BE75A18];
          v20 = MEMORY[0x24BDBD1C0];
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v24 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v21++), "setProperty:forKey:", v20, v19, (_QWORD)v23);
            }
            while (v17 != v21);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v17);
        }

      }
      objc_msgSend(v4, "addObject:", v9, (_QWORD)v23);
      objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v14, v9);
    }
    else
    {
      v22 = self->_cellularDataPlanListGroup;
      self->_cellularDataPlanListGroup = 0;

    }
  }

}

- (void)setSubscriptionContextAndPlanProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionsInUse");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscriptionContexts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (int)*MEMORY[0x24BE757A8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "setProperty:forKey:", v4, *MEMORY[0x24BE75CE8]);
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedPlanItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "selectedPlanItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
    +[PSUICellularPlanUniversalReference referenceFromPlanItem:](PSUICellularPlanUniversalReference, "referenceFromPlanItem:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProperty:forKey:", v14, *MEMORY[0x24BE75958]);

  }
  else
  {
    objc_msgSend(v10, "planItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16 == 1)
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "planItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
      +[PSUICellularPlanUniversalReference referenceFromPlanItem:](PSUICellularPlanUniversalReference, "referenceFromPlanItem:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setProperty:forKey:", v21, *MEMORY[0x24BE75958]);

    }
    else
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "removePropertyForKey:", *MEMORY[0x24BE75958]);
    }
  }

}

- (void)setUpSubscriptionContextMenusGroup:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isiPhone");

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CARRIER_SPACE_CARRIER"), &stru_24D5028C8, CFSTR("Cellular"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupSpecifierWithID:name:", CFSTR("SUBSCRIPTION_CONTEXT_MENUS_GROUP"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSUICellularController createOrUpdateSubscriptionContextMenuGroup:](self, "createOrUpdateSubscriptionContextMenuGroup:", v10);
    -[PSUISubscriptionContextMenusGroup specifiers](self->_subscriptionContextMenus, "specifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      -[PSUICellularController getLogger](self, "getLogger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315138;
        v14 = "-[PSUICellularController setUpSubscriptionContextMenusGroup:]";
        _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "%s showing subscription context menus group", (uint8_t *)&v13, 0xCu);
      }

      objc_msgSend(v4, "addObject:", v10);
      objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v11, v10);
    }

  }
}

- (void)setUpAddPlanGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isDualSimCapable") & 1) == 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActivationCodeFlowSupported");

  if (v7)
  {
    -[PSUICellularController getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[PSUICellularController setUpAddPlanGroup:]";
      _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s showing add plan group", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ADD_CELLULAR_PLAN_GROUP"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);
    -[PSUICellularController createAddCellularPlanSpecifierIfNeeded](self, "createAddCellularPlanSpecifierIfNeeded");
    objc_msgSend(v4, "ps_addSpecifier:toGroup:", self->_addCellularPlanSpecifier, v5);
    -[PSUICellularController _maybeAddCrossPlatformSIMTransferSpecifier:toGroup:](self, "_maybeAddCrossPlatformSIMTransferSpecifier:toGroup:", v4, v5);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)setUpFacetimeSetupGroup:(id)a3
{
  id v4;
  PSSpecifier *v5;
  PSSpecifier *facetimeSetupGroup;
  void *v7;
  void *v8;
  void *v9;
  PSSpecifier *v10;
  PSSpecifier *facetimeSetupButton;
  NSObject *v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_facetimeSetupGroup)
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SETUP_FACETIME_CELLULAR_GROUP"));
    v5 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    facetimeSetupGroup = self->_facetimeSetupGroup;
    self->_facetimeSetupGroup = v5;

  }
  if (!self->_facetimeSetupButton)
  {
    v7 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SETUP_FACETIME_CELLULAR"), &stru_24D5028C8, CFSTR("Cellular"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, 13, 0);
    v10 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    facetimeSetupButton = self->_facetimeSetupButton;
    self->_facetimeSetupButton = v10;

    -[PSSpecifier setIdentifier:](self->_facetimeSetupButton, "setIdentifier:", CFSTR("SETUP_FACETIME_CELLULAR"));
    -[PSSpecifier setButtonAction:](self->_facetimeSetupButton, "setButtonAction:", sel_setupCellularFaceTime_);
    -[PSSpecifier setProperty:forKey:](self->_facetimeSetupButton, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75CB8]);
  }
  if (-[PSUICellularController shouldShowFaceTimeSetup](self, "shouldShowFaceTimeSetup"))
  {
    -[PSUICellularController getLogger](self, "getLogger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[PSUICellularController setUpFacetimeSetupGroup:]";
      _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "%s showing facetime setup group", buf, 0xCu);
    }

    objc_msgSend(v4, "addObject:", self->_facetimeSetupButton);
    objc_msgSend(v4, "addObject:", self->_facetimeSetupGroup);
  }

}

- (void)setUpTopAppUsageGroup:(id)a3
{
  PSUITopAppUsageGroup *topAppUsageGroup;
  id v5;
  void *v6;
  id v7;

  topAppUsageGroup = self->_topAppUsageGroup;
  v5 = a3;
  -[PSUICellularController topAppUsageGroupTitle](self, "topAppUsageGroupTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUITopAppUsageGroup setGroupSpecifierTitle:](topAppUsageGroup, "setGroupSpecifierTitle:", v6);

  -[PSUITopAppUsageGroup specifiers](self->_topAppUsageGroup, "specifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

}

- (void)setUpMiscOptionsGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PSUIMBManagerWrapper *v9;
  id v10;
  void *v11;
  PSUIMiscOptionsGroup *v12;
  PSUIMiscOptionsGroup *miscOptionsGroup;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  PSUIMiscOptionsGroup *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_miscOptionsGroup)
  {
    v21 = [PSUIMiscOptionsGroup alloc];
    objc_msgSend(MEMORY[0x24BE85688], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(PSUIMBManagerWrapper);
    v10 = objc_alloc_init(MEMORY[0x24BE14938]);
    -[PSUICellularController accountStore](self, "accountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PSUIMiscOptionsGroup initWithHostController:cellularManagementCache:carrierSpaceManager:dataCache:carrierBundleCache:backupManagerWrapper:callHistoryManager:appleAccountStore:resetStatisticsDelegate:](v21, "initWithHostController:cellularManagementCache:carrierSpaceManager:dataCache:carrierBundleCache:backupManagerWrapper:callHistoryManager:appleAccountStore:resetStatisticsDelegate:", self, v5, v6, v7, v8, v9, v10, v11, self);
    miscOptionsGroup = self->_miscOptionsGroup;
    self->_miscOptionsGroup = v12;

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[PSUIMiscOptionsGroup setBillingPeriodSource:](self->_miscOptionsGroup, "setBillingPeriodSource:", v19);
          goto LABEL_13;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_13:

  -[PSUIMiscOptionsGroup specifiers](self->_miscOptionsGroup, "specifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v20);

}

- (void)disableSpecifiersIfNeeded:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isiPad");

  if (v6)
  {
    v7 = -[PSUICellularController isCellularDisabled](self, "isCellularDisabled");
    self->_disabled = v7;
    if (v7)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = v4;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v23;
        v12 = *MEMORY[0x24BE75A18];
        v13 = *MEMORY[0x24BE75D18];
        v14 = MEMORY[0x24BDBD1C0];
        v21 = v8;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v8);
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
            -[PSUICellularController getLogger](self, "getLogger");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v16, "name");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v27 = "-[PSUICellularController disableSpecifiersIfNeeded:]";
              v28 = 2112;
              v29 = v19;
              _os_log_debug_impl(&dword_2161C6000, v17, OS_LOG_TYPE_DEBUG, "%s disabling specifier: %@", buf, 0x16u);

              v8 = v21;
            }

            objc_msgSend(v16, "setProperty:forKey:", v14, v12);
            objc_msgSend(v16, "propertyForKey:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setCellEnabled:", 0);

            ++v15;
          }
          while (v10 != v15);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v10);
      }

      v4 = v20;
    }
  }

}

- (id)createPersonalHotspotSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PSBundleController *v7;
  PSBundleController *personalHotspotBundleController;
  PSBundleController *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v14[16];

  PSBundlePathForPreferenceBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1488];
  SFRuntimeAbsoluteFilePathForPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (PSBundleController *)objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "principalClass")), "initWithParentListController:", self);
  personalHotspotBundleController = self->_personalHotspotBundleController;
  self->_personalHotspotBundleController = v7;

  v9 = self->_personalHotspotBundleController;
  if (v9)
  {
    -[PSBundleController specifiersWithSpecifier:](v9, "specifiersWithSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PSUICellularController getLogger](self, "getLogger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_2161C6000, v12, OS_LOG_TYPE_ERROR, "Failed to load Wireless Modem Settings aka Personal Hotspot bundle controller", v14, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (void)createOrUpdateSubscriptionContextMenuGroup:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PSUISubscriptionContextMenusGroup *v13;
  PSUISubscriptionContextMenusProductionFactory *v14;
  PSUISubscriptionContextMenusProductionFactory *v15;
  PSUISubscriptionContextMenusGroup *v16;
  PSUISubscriptionContextMenusGroup *subscriptionContextMenus;
  id v18;

  v18 = a3;
  if (self->_subscriptionContextMenus)
  {
    v4 = (int)*MEMORY[0x24BE757A8];
    v5 = *MEMORY[0x24BE75CE8];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PSUISubscriptionContextMenusGroup parentSpecifier](self->_subscriptionContextMenus, "parentSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "propertyForKey:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProperty:forKey:", v8, v5);

    }
    v9 = *MEMORY[0x24BE75958];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "propertyForKey:", *MEMORY[0x24BE75958]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[PSUISubscriptionContextMenusGroup parentSpecifier](self->_subscriptionContextMenus, "parentSpecifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "propertyForKey:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setProperty:forKey:", v12, v9);

    }
    -[PSUISubscriptionContextMenusGroup setGroupSpecifier:](self->_subscriptionContextMenus, "setGroupSpecifier:", v18);
  }
  else
  {
    v13 = [PSUISubscriptionContextMenusGroup alloc];
    v14 = [PSUISubscriptionContextMenusProductionFactory alloc];
    v15 = -[PSUISubscriptionContextMenusProductionFactory initWithHostController:parentSpecifier:groupSpecifier:popViewControllerOnPlanRemoval:](v14, "initWithHostController:parentSpecifier:groupSpecifier:popViewControllerOnPlanRemoval:", self, *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), v18, 0);
    v16 = -[PSUISubscriptionContextMenusGroup initWithFactory:](v13, "initWithFactory:", v15);
    subscriptionContextMenus = self->_subscriptionContextMenus;
    self->_subscriptionContextMenus = v16;

  }
}

- (id)transferPlanGroupSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  -[PSUICellularController planPendingTransferGroup](self, "planPendingTransferGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PSUICellularController planPendingTransferGroup](self, "planPendingTransferGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("TRANSFER_PLAN_GROUP"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)createTransferPlanGroupIfNeeded:(id)a3
{
  void *v4;
  PSUIPlanPendingTransferListGroup *v5;
  id v6;

  v6 = a3;
  -[PSUICellularController planPendingTransferGroup](self, "planPendingTransferGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[PSUIPlanPendingTransferListGroup initWithListController:groupSpecifier:]([PSUIPlanPendingTransferListGroup alloc], "initWithListController:groupSpecifier:", self, v6);
    -[PSUICellularController setPlanPendingTransferGroup:](self, "setPlanPendingTransferGroup:", v5);

  }
}

- (id)addOnPlanGroupSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  -[PSUICellularController addOnPlanGroup](self, "addOnPlanGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PSUICellularController addOnPlanGroup](self, "addOnPlanGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ADD_ON_PLAN_GROUP"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)createAddOnPlanGroupIfNeeded:(id)a3 showAddOnPlans:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  PSUIAddOnPlanGroup *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[PSUICellularController addOnPlanGroup](self, "addOnPlanGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = -[PSUIAddOnPlanGroup initWithListController:groupSpecifier:showAddOnPlans:]([PSUIAddOnPlanGroup alloc], "initWithListController:groupSpecifier:showAddOnPlans:", self, v8, v4);
    -[PSUICellularController setAddOnPlanGroup:](self, "setAddOnPlanGroup:", v7);

  }
}

- (id)carrierItemGroupSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  -[PSUICellularController carrierItemGroup](self, "carrierItemGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PSUICellularController carrierItemGroup](self, "carrierItemGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ADD_NEW_NETWORK_GROUP"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)createCarrierItemGroupIfNeeded:(id)a3 showCarrierItems:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  PSUICarrierItemGroup *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[PSUICellularController carrierItemGroup](self, "carrierItemGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = -[PSUICarrierItemGroup initWithListController:groupSpecifier:showCarrierItems:]([PSUICarrierItemGroup alloc], "initWithListController:groupSpecifier:showCarrierItems:", self, v8, v4);
    -[PSUICellularController setCarrierItemGroup:](self, "setCarrierItemGroup:", v7);

  }
}

- (void)createAddCellularPlanSpecifierIfNeeded
{
  PSUIAddCellularPlanSpecifier *v3;
  PSSpecifier *addCellularPlanSpecifier;

  if (!self->_addCellularPlanSpecifier)
  {
    v3 = -[PSUIAddCellularPlanSpecifier initWithHostController:isEmbeddedInCarrierList:]([PSUIAddCellularPlanSpecifier alloc], "initWithHostController:isEmbeddedInCarrierList:", self, 0);
    addCellularPlanSpecifier = self->_addCellularPlanSpecifier;
    self->_addCellularPlanSpecifier = &v3->super;

  }
}

- (id)QRCodeGroupSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  -[PSUICellularController QRCodeGroup](self, "QRCodeGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PSUICellularController QRCodeGroup](self, "QRCodeGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("QR_CODE_GROUP"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)createQRCodeGroupIfNeeded:(id)a3
{
  void *v4;
  PSUIQRCodeGroup *v5;
  id v6;

  v6 = a3;
  -[PSUICellularController QRCodeGroup](self, "QRCodeGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[PSUIQRCodeGroup initWithListController:groupSpecifier:]([PSUIQRCodeGroup alloc], "initWithListController:groupSpecifier:", self, v6);
    -[PSUICellularController setQRCodeGroup:](self, "setQRCodeGroup:", v5);

  }
}

- (void)_maybeAddCrossPlatformSIMTransferSpecifier:(id)a3 toGroup:(id)a4
{
  id v6;
  PSSpecifier *crossPlatformSIMTransferSpecifier;
  PSUICrossPlatformSIMTransferSpecifier *v8;
  PSSpecifier *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (_os_feature_enabled_impl())
  {
    crossPlatformSIMTransferSpecifier = self->_crossPlatformSIMTransferSpecifier;
    if (crossPlatformSIMTransferSpecifier
      || (v8 = -[PSUICrossPlatformSIMTransferSpecifier initWithHostController:]([PSUICrossPlatformSIMTransferSpecifier alloc], "initWithHostController:", self), v9 = self->_crossPlatformSIMTransferSpecifier, self->_crossPlatformSIMTransferSpecifier = &v8->super, v9, (crossPlatformSIMTransferSpecifier = self->_crossPlatformSIMTransferSpecifier) != 0))
    {
      objc_msgSend(v10, "ps_addSpecifier:toGroup:", crossPlatformSIMTransferSpecifier, v6);
    }
  }

}

- (void)configureAddOnPlanTurnOnWifi:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PSUICellularController *v25;
  uint8_t buf[16];
  NSRange v27;

  v4 = a3;
  -[PSUICellularController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Cellular: Wifi off", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TURN_ON_WIFI_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING"), &stru_24D5028C8, CFSTR("Cellular"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TURN_ON_WIFI_FAUX_CARD_SCANNER_FOOTER_%@"), &stru_24D5028C8, CFSTR("Cellular"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "sf_isChinaRegionCellularDevice");

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TURN_ON_WLAN_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING"), &stru_24D5028C8, CFSTR("Cellular"));
    v25 = self;
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TURN_ON_WLAN_FAUX_CARD_SCANNER_FOOTER_%@"), &stru_24D5028C8, CFSTR("Cellular"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v18, v15);
    v19 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v15;
    self = v25;
    v11 = (void *)v19;
  }
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v21, *MEMORY[0x24BE75A30]);

  objc_msgSend(v4, "setProperty:forKey:", v11, *MEMORY[0x24BE75A58]);
  v27.location = objc_msgSend(v11, "rangeOfString:", v7);
  NSStringFromRange(v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v22, *MEMORY[0x24BE75A40]);

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=WIFI"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v23, *MEMORY[0x24BE75A60]);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v24, *MEMORY[0x24BE75A50]);

  objc_msgSend(v4, "setProperty:forKey:", CFSTR("turnOnWifiPressed:"), *MEMORY[0x24BE75A38]);
}

- (void)addLocationFooterIfNecessary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  __CFString *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _Unwind_Exception *v31;
  const __CFString *v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  void *v36;
  NSRange v37;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isiPad");

  if (v6)
  {
    *(_QWORD *)buf = 0;
    v34 = buf;
    v35 = 0x2020000000;
    v7 = getCLCopyAppsUsingLocationSymbolLoc_ptr_0;
    v36 = getCLCopyAppsUsingLocationSymbolLoc_ptr_0;
    if (!getCLCopyAppsUsingLocationSymbolLoc_ptr_0)
    {
      v8 = (void *)CoreLocationLibrary_0();
      v7 = dlsym(v8, "CLCopyAppsUsingLocation");
      *((_QWORD *)v34 + 3) = v7;
      getCLCopyAppsUsingLocationSymbolLoc_ptr_0 = v7;
    }
    _Block_object_dispose(buf, 8);
    if (!v7)
    {
      dlerror();
      v31 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(buf, 8);
      _Unwind_Resume(v31);
    }
    v9 = (void *)((uint64_t (*)(void))v7)();
    objc_msgSend(v9, "objectForKey:", CFSTR("/System/Library/Frameworks/CoreTelephony.framework"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("com.apple.locationd.bundle-/System/Library/Frameworks/CoreTelephony.framework"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(getCLLocationManagerClass_0(), "locationServicesEnabled");
    v12 = objc_msgSend(getCLLocationManagerClass_0(), "isEntityAuthorizedForLocationDictionary:", v10);
    if (v11 && (v12 & 1) != 0)
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isActivationCodeFlowSupported"))
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!-[__CFString sf_isChinaRegionCellularDevice](v14, "sf_isChinaRegionCellularDevice"))
      {
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "sf_isiPad");

      if (!v16)
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CELLULAR_SETUP_DATA_COLLECTION_DISCLOSURE"), &stru_24D5028C8, CFSTR("Cellular"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x24BE75A68];
      v18 = v4;
      v19 = v14;
    }
    else
    {
      -[PSUICellularController getLogger](self, "getLogger");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2161C6000, v20, OS_LOG_TYPE_DEFAULT, "Cellular: Location Services off", buf, 2u);
      }

      v21 = CFSTR("prefs:root=Privacy&path=LOCATION");
      if (v11)
        v21 = CFSTR("prefs:root=Privacy&path=LOCATION/SYSTEM_SERVICES");
      v32 = v21;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING"), &stru_24D5028C8, CFSTR("Cellular"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_%@"), &stru_24D5028C8, CFSTR("Cellular"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v25, v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setProperty:forKey:", v27, *MEMORY[0x24BE75A30]);

      objc_msgSend(v4, "setProperty:forKey:", v14, *MEMORY[0x24BE75A58]);
      v37.location = -[__CFString rangeOfString:](v14, "rangeOfString:", v13);
      NSStringFromRange(v37);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setProperty:forKey:", v28, *MEMORY[0x24BE75A40]);

      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setProperty:forKey:", v29, *MEMORY[0x24BE75A60]);

      objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setProperty:forKey:", v30, *MEMORY[0x24BE75A50]);

      v17 = *MEMORY[0x24BE75A38];
      v19 = CFSTR("turnOnLocationServicesPressed:");
      v18 = v4;
    }
    objc_msgSend(v18, "setProperty:forKey:", v19, v17);
    goto LABEL_19;
  }
LABEL_22:

}

- (id)topAppUsageGroupTitle
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_isChinaRegionCellularDevice");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("APP_WIRELESS_DATA_USAGE");
  else
    v7 = CFSTR("APP_DATA_USAGE");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUICellularController activeDataPlanLabel](self, "activeDataPlanLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isDualSimCapable"))
    goto LABEL_9;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "planItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "count") <= 1)
  {

LABEL_9:
    goto LABEL_10;
  }
  v13 = objc_msgSend(v9, "length");

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("APP_DATA_USAGE_FOR_%@"), &stru_24D5028C8, CFSTR("Cellular"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v16, v9);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "sf_isiPad");

  if (v19)
  {
    -[PSUICellularController activeDataPlanCarrierName](self, "activeDataPlanCarrierName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "length"))
    {
LABEL_14:

      goto LABEL_15;
    }
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("APP_DATA_USAGE_FOR_%@"), &stru_24D5028C8, CFSTR("Cellular"));
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v21, v15);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v21;
LABEL_13:

    v8 = (void *)v17;
    goto LABEL_14;
  }
LABEL_15:

  return v8;
}

- (id)activeDataPlanLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "planItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v6 = 136315394;
    v17 = v6;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isActiveDataPlan", v17) & 1) != 0)
        {
          objc_msgSend(v10, "userLabel");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "label");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
        -[PSUICellularController getLogger](self, "getLogger");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "userLabel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "label");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v17;
          v23 = "-[PSUICellularController activeDataPlanLabel]";
          v24 = 2112;
          v25 = v13;
          _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEFAULT, "%s Not adding app data usage for plan %@ because it's not active", buf, 0x16u);

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)activeDataPlanCarrierName
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "planItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isActiveDataPlan") & 1) != 0)
        {
          objc_msgSend(v7, "carrierName");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)accountStore
{
  if (qword_254E35A90 != -1)
    dispatch_once(&qword_254E35A90, &__block_literal_global_253);
  return (id)qword_254E35A88;
}

void __38__PSUICellularController_accountStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDB4398]);
  v1 = (void *)qword_254E35A88;
  qword_254E35A88 = (uint64_t)v0;

}

- (BOOL)shouldShowNoSIMsOrActivatePlansUI
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  BOOL v7;
  CoreTelephonyClient *coreTelephonyClient;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PSUISubscriptionContextMenusGroup *subscriptionContextMenus;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_isiPad");

  if (!v4)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v22 = 0;
    -[CoreTelephonyClient isEmbeddedSIMOnlyConfig:](coreTelephonyClient, "isEmbeddedSIMOnlyConfig:", &v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v22;
    if (v10)
    {
      -[PSUICellularController getLogger](self, "getLogger");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_error_impl(&dword_2161C6000, v11, OS_LOG_TYPE_ERROR, "Embedded SIM config error: %@", buf, 0xCu);
      }

    }
    else if (objc_msgSend(v9, "BOOLValue"))
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "planItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (!v14)
        goto LABEL_13;
      if (v14 == 1)
      {
        +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isAnyPlanActivating");

        if ((v16 & 1) != 0)
          goto LABEL_13;
      }
    }
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subscriptionsInUse");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v7 = 0;
LABEL_14:

      return v7;
    }
LABEL_13:
    subscriptionContextMenus = self->_subscriptionContextMenus;
    self->_subscriptionContextMenus = 0;

    v7 = 1;
    goto LABEL_14;
  }
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "planItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 0;

  return v7;
}

- (BOOL)eSIMExistsInSubscriptionContexts
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscriptionContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "simHardwareInfo:", v7);

        if (v9 == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)deviceIsDualSIMCapableAndPlansExist
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isDualSimCapable"))
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "planItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = 1;
    }
    else
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "danglingPlanItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        v5 = 1;
      }
      else
      {
        +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "plansPendingTransfer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v9, "count") != 0;

      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowAddPlanButton
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isCarrierItemFlowSupported") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isActivationCodeFlowSupported"))
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "sf_isiPad") ^ 1;

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (BOOL)shouldShowDataPlans
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  NSObject *v16;
  uint8_t v17[16];

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDualSimCapable");

  if ((v4 & 1) == 0)
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "planItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "planItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10 > 1)
        return 1;
      if (-[PSUICellularController eSIMExistsInSubscriptionContexts](self, "eSIMExistsInSubscriptionContexts"))
        return 1;
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isAnyLocalFlowTypeSupported");

      if ((v12 & 1) != 0)
        return 1;
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "sf_isChinaRegionCellularDevice");

      if ((v14 & 1) != 0)
        return 1;
      -[PSUICellularController getLogger](self, "getLogger");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_2161C6000, v16, OS_LOG_TYPE_DEFAULT, "No cellular plans shown", v17, 2u);
      }

    }
  }
  return 0;
}

- (BOOL)shouldUpdateHeaderForSIM
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__PSUICellularController_shouldUpdateHeaderForSIM__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  if (qword_254E35A98 != -1)
    dispatch_once(&qword_254E35A98, block);
  return _MergedGlobals_3;
}

void __50__PSUICellularController_shouldUpdateHeaderForSIM__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1544);
  v6 = 0;
  objc_msgSend(v2, "isEmbeddedSIMOnlyConfig:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_error_impl(&dword_2161C6000, v5, OS_LOG_TYPE_ERROR, "Embedded SIM config error: %@", buf, 0xCu);
    }

  }
  else
  {
    _MergedGlobals_3 = objc_msgSend(v3, "BOOLValue");
  }

}

- (BOOL)shouldShowPendingInstallPlan
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "sf_isiPad"))
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "planItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = 0;
    }
    else
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pendingInstallPlans");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "plans");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "count") != 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v28;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v28;
    objc_msgSend(v8, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLANS"), &stru_24D5028C8, CFSTR("Cellular"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uppercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v13)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLANS"), &stru_24D5028C8, CFSTR("Cellular"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setText:", v24);

      if (-[PSUICellularController shouldUpdateHeaderForSIM](self, "shouldUpdateHeaderForSIM"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = CFSTR("CELLULAR_PLANS_eSIMs");
        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend(v8, "textLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NON_PUBLIC_NETWORK_PLANS"), &stru_24D5028C8, CFSTR("Cellular"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uppercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v15, "isEqualToString:", v18);

      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = CFSTR("NON_PUBLIC_NETWORK_PLANS");
LABEL_7:
        objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_24D5028C8, CFSTR("Cellular"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "textLabel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setText:", v26);

      }
    }

    v7 = v28;
  }

}

- (BOOL)shouldShowPrivateNetworkPlansList
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  const char *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "planItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
      if (!objc_msgSend(v9, "settingsMode") || objc_msgSend(v9, "settingsMode") == 1)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    -[PSUICellularController getLogger](self, "getLogger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_DWORD *)buf = 136315138;
    v29 = "-[PSUICellularController shouldShowPrivateNetworkPlansList]";
    v17 = "%s Private network SIM exists on device, show private network plans list";
  }
  else
  {
LABEL_10:

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "danglingPlanItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (!v11)
    {
LABEL_18:
      v15 = 0;
      goto LABEL_25;
    }
    v12 = v11;
    v13 = *(_QWORD *)v20;
LABEL_12:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v13)
        objc_enumerationMutation(v4);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "isPrivateNetworkSim"))
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
    -[PSUICellularController getLogger](self, "getLogger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_DWORD *)buf = 136315138;
    v29 = "-[PSUICellularController shouldShowPrivateNetworkPlansList]";
    v17 = "%s Private network dangling plan exists on device, show private network plans list";
  }
  _os_log_impl(&dword_2161C6000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
LABEL_24:

  v15 = 1;
LABEL_25:

  return v15;
}

- (void)prefetchResourcesFor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  -[PSUICellularController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("APP_DATA_USAGE")))
    {
      objc_msgSend(v16, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("DATA_USAGE_IN_PERIOD")) & 1) != 0)
      {
        v9 = 0;
        v10 = 1;
      }
      else
      {
        objc_msgSend(v16, "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ROAMING_DATA_USAGE_IN_PERIOD")) & 1) == 0)
        {

          goto LABEL_25;
        }
        v10 = 1;
        v9 = 1;
      }
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  objc_msgSend(v16, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", 0x24D507828) & 1) != 0)
  {

    v12 = 1;
    if (v9)
      goto LABEL_9;
LABEL_15:
    if (!v10)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(v16, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", 0x24D503CC8) & 1) != 0)
  {

    v12 = 1;
    if ((v9 & 1) == 0)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(v16, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "isEqualToString:", 0x24D502E28);

    if ((v9 & 1) == 0)
      goto LABEL_15;
  }
LABEL_9:

  if ((v10 & 1) != 0)
LABEL_16:

LABEL_17:
  if (v8)
  {

    if ((v12 & 1) == 0)
      goto LABEL_26;
  }
  else if (!v12)
  {
    goto LABEL_26;
  }
LABEL_25:
  v15 = (id)objc_msgSend(v16, "performGetter");
LABEL_26:

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSUICellularController;
  v6 = a4;
  -[PSUICellularController tableView:didSelectRowAtIndexPath:](&v10, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  v7 = -[PSUICellularController indexForIndexPath:](self, "indexForIndexPath:", v6, v10.receiver, v10.super_class);

  -[PSUICellularController specifierAtIndex:](self, "specifierAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularController cellularDataPlanListGroup](self, "cellularDataPlanListGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "listController:didSelectSpecifier:", self, v8);

}

- (void)entitlementStatusChanged
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *MEMORY[0x24BE30308];
    v5 = 136315394;
    v6 = "-[PSUICellularController entitlementStatusChanged]";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", (uint8_t *)&v5, 0x16u);
  }

  if (self->_ignoreNextEntitlementStatusChange)
  {
    self->_ignoreNextEntitlementStatusChange = 0;
  }
  else
  {
    self->_ignoreNextEntitlementStatusChange = 1;
    -[PSUICellularController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

- (BOOL)isCellularDisabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isSIMMissing") && PSSimIsRequired())
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isCellularDisabled");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)updatePaneWithCellularDataState:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  char v7;
  PSSpecifier *personalHotspotSpecifier;
  void *v9;
  void *v10;
  NSObject *v11;
  PSSpecifier *facetimeSetupButton;
  void *v13;
  PSSpecifier *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  PSSpecifier *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE75790]));
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), 1);

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldShowAccountSetup");

  if (!v3 || (v7 & 1) != 0 || -[PSUICellularController showDataPlanOnly](self, "showDataPlanOnly"))
  {
    personalHotspotSpecifier = self->_personalHotspotSpecifier;
    if (personalHotspotSpecifier)
    {
      -[PSSpecifier identifier](personalHotspotSpecifier, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUICellularController specifierForID:](self, "specifierForID:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[PSUICellularController getLogger](self, "getLogger");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v24 = "-[PSUICellularController updatePaneWithCellularDataState:]";
          _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEFAULT, "%s Removing personal hotspot", buf, 0xCu);
        }

        -[PSUICellularController removeSpecifier:animated:](self, "removeSpecifier:animated:", self->_personalHotspotSpecifier, 1);
      }
    }
    if (-[PSUICellularController containsSpecifier:](self, "containsSpecifier:", self->_facetimeSetupButton))
    {
      facetimeSetupButton = self->_facetimeSetupButton;
      v21[0] = self->_facetimeSetupGroup;
      v21[1] = facetimeSetupButton;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUICellularController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v13, 1);
LABEL_11:

    }
  }
  else
  {
    v14 = self->_personalHotspotSpecifier;
    if (v14)
    {
      -[PSSpecifier identifier](v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUICellularController specifierForID:](self, "specifierForID:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        -[PSUICellularController getLogger](self, "getLogger");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v24 = "-[PSUICellularController updatePaneWithCellularDataState:]";
          _os_log_impl(&dword_2161C6000, v17, OS_LOG_TYPE_DEFAULT, "%s Adding personal hotspot back", buf, 0xCu);
        }

        -[PSUICellularController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", self->_personalHotspotSpecifier, CFSTR("CELLULAR_DATA_OPTIONS"), 1);
      }
    }
    if (-[PSUICellularController shouldShowFaceTimeSetup](self, "shouldShowFaceTimeSetup"))
    {
      if ((-[PSUICellularController containsSpecifier:](self, "containsSpecifier:", self->_facetimeSetupButton) & 1) == 0)
      {
        v18 = self->_facetimeSetupButton;
        if (v18)
        {
          if (self->_facetimeSetupGroup)
          {
            v22[0] = self->_facetimeSetupGroup;
            v22[1] = v18;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[PSUICellularController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v13, CFSTR("VIEW_ACCOUNT"), 1);
            goto LABEL_11;
          }
        }
      }
    }
  }
  -[PSUICellularController getLogger](self, "getLogger");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[PSUICellularController updatePaneWithCellularDataState:]";
    _os_log_impl(&dword_2161C6000, v19, OS_LOG_TYPE_DEFAULT, "%s Reloading cellular data options", buf, 0xCu);
  }

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "specifierForID:", CFSTR("CELLULAR_DATA_OPTIONS"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularController reloadSpecifier:](self, "reloadSpecifier:", v20);

}

- (BOOL)showDataPlanOnly
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultipleDataPlanSupportAvailable");

  if (!v3)
    return 0;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isSelectedPlanActivating") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "shouldShowPlanSelector") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "shouldShowAccountSetup");

    }
  }

  return v5;
}

- (id)cellularDataOptionsDetailText:(id)a3
{
  void *v3;
  int v4;
  int v5;
  int v6;
  __CFString *v7;
  int v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCellularDataEnabled");

  if (!PSIsVoiceRoamingOptionAvailable())
  {
    v5 = 0;
    if (!v4)
      goto LABEL_3;
LABEL_6:
    if (PSIsVoiceRoamingEnabled())
      v6 = PSIsDataRoamingEnabled();
    else
      v6 = 0;
    PSIsVoiceRoamingOptionAvailable();
    goto LABEL_11;
  }
  v5 = PSIsVoiceRoamingEnabled();
  if (v4)
    goto LABEL_6;
LABEL_3:
  if (!PSIsVoiceRoamingOptionAvailable())
  {
    v7 = &stru_24D5028C8;
    return v7;
  }
  v6 = 0;
LABEL_11:
  v8 = v5 | v6;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = CFSTR("CELLULAR_ACCOUNT_OPTIONS_ROAMING_ON");
  else
    v11 = CFSTR("CELLULAR_ACCOUNT_OPTIONS_ROAMING_OFF");
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24D5028C8, CFSTR("Cellular"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getTetheringStatus:(id)a3
{
  void *v3;
  __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE755D0], "sharedManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTetheringEnabled") & 1) != 0)
  {
    v4 = &stru_24D5028C8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OFF"), &stru_24D5028C8, CFSTR("Cellular"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sf_isiPad");

  if (v7)
  {
    -[PSUICellularController specifierAtIndexPath:](self, "specifierAtIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75958]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "planFromReferenceSafe:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v11) = 0;
    if (v8 && v10)
    {
      objc_msgSend(v10, "plan");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v10, "plan");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = objc_msgSend(v13, "isDeleteNotAllowed") ^ 1;

      }
      else
      {
        LOBYTE(v11) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return (char)v11;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  id v28;
  id location;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sf_isiPad");

  if (v9)
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__1;
    v46 = __Block_byref_object_dispose__1;
    v47 = 0;
    -[PSUICellularController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
    v47 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__1;
    v40 = __Block_byref_object_dispose__1;
    v41 = 0;
    objc_msgSend((id)v43[5], "propertyForKey:", *MEMORY[0x24BE75958]);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__1;
    v34 = __Block_byref_object_dispose__1;
    v35 = 0;
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "planFromReference:", v37[5]);
    v35 = (id)objc_claimAutoreleasedReturnValue();

    if (!v43[5])
      goto LABEL_6;
    v11 = (void *)v31[5];
    if (!v11)
      goto LABEL_6;
    objc_msgSend(v11, "plan");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && (objc_msgSend((id)v31[5], "plan"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "isDeleteNotAllowed"),
          v13,
          v12,
          (v14 & 1) == 0))
    {
      location = 0;
      objc_initWeak(&location, self);
      v17 = (void *)MEMORY[0x24BEBD508];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("REMOVE"), &stru_24D5028C8, CFSTR("Cellular"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
      v23[3] = &unk_24D501F90;
      v25 = &v30;
      v26 = &v36;
      v23[4] = self;
      v24 = v7;
      v27 = &v42;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v17, "contextualActionWithStyle:title:handler:", 1, v19, v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x24BEBD9A8];
      v48[0] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "configurationWithActions:", v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setPerformsFirstActionWithFullSwipe:", 0);
      objc_destroyWeak(&v28);

      objc_destroyWeak(&location);
    }
    else
    {
LABEL_6:
      v15 = 0;
    }
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id WeakRetained;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "planFromReference:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 136316162;
    v38 = "-[PSUICellularController tableView:trailingSwipeActionsConfigurationForRowAtIndexPath:]_block_invoke";
    v39 = 2112;
    v40 = v13;
    v41 = 2112;
    v42 = v11;
    v43 = 2112;
    v44 = v12;
    v45 = 2112;
    v46 = v14;
    _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "%s remove plan: %@, %@, %@, %@", buf, 0x34u);
  }

  v15 = (void *)MEMORY[0x24BEBD3B0];
  +[SettingsCellularUtils removePlanConfirmationTitle:](SettingsCellularUtils, "removePlanConfirmationTitle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SettingsCellularUtils removePlanConfirmationMessage:](SettingsCellularUtils, "removePlanConfirmationMessage:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v16, v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("REMOVE"), &stru_24D5028C8, CFSTR("Cellular"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_277;
  v34[3] = &unk_24D501F40;
  v23 = *(_QWORD *)(a1 + 48);
  v34[4] = *(_QWORD *)(a1 + 32);
  v36 = v23;
  v24 = v5;
  v35 = v24;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 2, v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addAction:", v25);
  v26 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Cellular"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v22;
  v32[1] = 3221225472;
  v32[2] = __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_282;
  v32[3] = &unk_24D501F68;
  v32[4] = *(_QWORD *)(a1 + 32);
  v33 = v24;
  v29 = v24;
  objc_msgSend(v26, "actionWithTitle:style:handler:", v28, 1, v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addAction:", v30);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v18, 1, 0);

}

void __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_277(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    v10 = "-[PSUICellularController tableView:trailingSwipeActionsConfigurationForRowAtIndexPath:]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "%s confirm remove plan: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_278;
  v7[3] = &unk_24D501F18;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v4, "didDeletePlanItem:completion:", v5, v7);

}

void __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_278(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Failed to delete plan item: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  if (v5)
    v7 = 0;
  else
    v7 = a2;
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7);

}

uint64_t __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_282(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PSUICellularController tableView:trailingSwipeActionsConfigurationForRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "%s cancel remove plan", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)shouldShowFaceTimeSetup
{
  void *v2;
  void *v3;
  int v4;

  if (MGGetBoolAnswer())
  {
    +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isCellularDataEnabled"))
    {
      objc_msgSend(MEMORY[0x24BE30340], "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "faceTimeNonWiFiEntitled") ^ 1;

    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setupCellularFaceTime:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BE18E48], "controllerForServiceType:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDataSubscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
  v7 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](self->_coreTelephonyClient, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v5, CFSTR("CarrierName"), v6, 0);
  v8 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](self->_coreTelephonyClient, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v5, CFSTR("TetheringPhoneNumber"), v6, 0);
  v9 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:key:bundleType:error:](self->_coreTelephonyClient, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v5, CFSTR("TetheringURL"), v6, 0);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v11, "showSetupFaceTimeOverCellularAlertForServiceProviderName:serviceProviderPhoneNumber:serviceProviderURL:completion:", v7, v8, v10, 0);

}

- (void)newCarrierNotification
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[PSUICellularController newCarrierNotification]";
    v6 = 2112;
    v7 = CFSTR("PSNewCarrierNotification");
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", (uint8_t *)&v4, 0x16u);
  }

  -[PSUICellularController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)cellularDataSettingChanged
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[PSUICellularController cellularDataSettingChanged]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification", (uint8_t *)&v5, 0xCu);
  }

  -[PSUICellularController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", CFSTR("MOBILE_DATA_SETTINGS"), 1);
  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularController updatePaneWithCellularDataState:](self, "updatePaneWithCellularDataState:", objc_msgSend(v4, "isCellularDataEnabled"));

  -[PSUICellularController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  NSObject *v5;
  _BOOL4 v6;
  id WeakRetained;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[PSUICellularController simStatusDidChange:status:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[PSUITopAppUsageGroup clearStoredSpecifiers](self->_topAppUsageGroup, "clearStoredSpecifiers");
  v6 = -[PSUICellularController isCellularDisabled](self, "isCellularDisabled");
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x24BE757A0]));
    v8 = (id)objc_msgSend(WeakRetained, "popToRootViewControllerAnimated:", 1);

  }
  else if (self->_disabled)
  {
    -[PSUICellularController reloadSpecifiers](self, "reloadSpecifiers");
  }
  self->_disabled = v6;
  -[PSUITopAppUsageGroup specifiers](self->_topAppUsageGroup, "specifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    v14 = !v6;
    v15 = *MEMORY[0x24BE75A18];
    v16 = *MEMORY[0x24BE75D18];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v9, "containsObject:", v18, (_QWORD)v21) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setProperty:forKey:", v19, v15);

          objc_msgSend(v18, "propertyForKey:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setCellEnabled:", v14);
          objc_msgSend(v20, "setNeedsDisplay");

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

- (void)airplaneModeChanged
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315138;
    v6 = "-[PSUICellularController airplaneModeChanged]";
    _os_log_error_impl(&dword_2161C6000, v3, OS_LOG_TYPE_ERROR, "%s Airplane mode changed", (uint8_t *)&v5, 0xCu);
  }

  -[PSUICellularController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", CFSTR("MOBILE_DATA_SETTINGS"), 1);
  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularController updatePaneWithCellularDataState:](self, "updatePaneWithCellularDataState:", objc_msgSend(v4, "isCellularDataEnabled"));

  -[PSUICellularController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)cellularPlanChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[PSUICellularController cellularPlanChanged:]";
    v8 = 2112;
    v9 = CFSTR("PSUICellularPlanChanged");
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s received notification %@", buf, 0x16u);
  }

  -[PSUITopAppUsageGroup clearStoredSpecifiers](self->_topAppUsageGroup, "clearStoredSpecifiers");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__PSUICellularController_cellularPlanChanged___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __46__PSUICellularController_cellularPlanChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)wirelessDataUsageChangedNotification
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *MEMORY[0x24BE856D8];
    v5 = 136315394;
    v6 = "-[PSUICellularController wirelessDataUsageChangedNotification]";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", (uint8_t *)&v5, 0x16u);
  }

  -[PSUITopAppUsageGroup clearStoredSpecifiers](self->_topAppUsageGroup, "clearStoredSpecifiers");
  -[PSUICellularController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)wirelessDataUsageCacheRefreshed
{
  NSObject *v3;
  uint64_t v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *MEMORY[0x24BE856D0];
    *(_DWORD *)buf = 136315394;
    v7 = "-[PSUICellularController wirelessDataUsageCacheRefreshed]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", buf, 0x16u);
  }

  -[PSUITopAppUsageGroup clearStoredSpecifiers](self->_topAppUsageGroup, "clearStoredSpecifiers");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__PSUICellularController_wirelessDataUsageCacheRefreshed__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __57__PSUICellularController_wirelessDataUsageCacheRefreshed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)carrierItemsChanged
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *MEMORY[0x24BE158A8];
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "received notification %@", buf, 0xCu);
  }

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "planItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

  }
  else
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAnyLocalFlowTypeSupported");

    if (v8)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __45__PSUICellularController_carrierItemsChanged__block_invoke;
      block[3] = &unk_24D501660;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

uint64_t __45__PSUICellularController_carrierItemsChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)perAppNetworkDataAccessPolicyChanged
{
  NSObject *v3;
  uint64_t v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *MEMORY[0x24BE856C0];
    *(_DWORD *)buf = 136315394;
    v7 = "-[PSUICellularController perAppNetworkDataAccessPolicyChanged]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__PSUICellularController_perAppNetworkDataAccessPolicyChanged__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __62__PSUICellularController_perAppNetworkDataAccessPolicyChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)selectSpecifier:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PSUICellularController;
  -[PSUICellularController selectSpecifier:](&v7, sel_selectSpecifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setParentSpecifier:", v4);

  return v5;
}

- (BOOL)_shouldShowCarrierItemGroup
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_isChinaRegionCellularDevice");

  if (!v4)
    return 1;
  -[PSUICellularController carrierItemGroup](self, "carrierItemGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    return 1;
  -[PSUICellularController getLogger](self, "getLogger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[PSUICellularController _shouldShowCarrierItemGroup]";
    _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "%s No carrier items available for ChinaRegionCellularDevice", (uint8_t *)&v10, 0xCu);
  }

  return 0;
}

- (void)launchTravelEducationFlow:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  TSSIMSetupFlow *v8;
  TSSIMSetupFlow *flow;
  TSSIMSetupFlow *v10;
  _QWORD v11[5];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE82B68];
  v12[0] = *MEMORY[0x24BE82B48];
  v12[1] = v4;
  v13[0] = &unk_24D51C410;
  v13[1] = a3;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v7);
  v8 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
  flow = self->_flow;
  self->_flow = v8;

  -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
  v10 = self->_flow;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__PSUICellularController_launchTravelEducationFlow___block_invoke;
  v11[3] = &unk_24D501FB8;
  v11[4] = self;
  -[TSSIMSetupFlow firstViewController:](v10, "firstViewController:", v11);

}

void __52__PSUICellularController_launchTravelEducationFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__PSUICellularController_launchTravelEducationFlow___block_invoke_2;
  v6[3] = &unk_24D501638;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __52__PSUICellularController_launchTravelEducationFlow___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "setModalPresentationStyle:", 2);
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v2, 1, 0);

  }
}

- (void)launchAddeSIMFlow
{
  void *v3;
  void *v4;
  TSSIMSetupFlow *v5;
  TSSIMSetupFlow *flow;
  TSSIMSetupFlow *v7;
  _QWORD v8[5];
  id location;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = *MEMORY[0x24BE82B48];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v4);
  v5 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
  flow = self->_flow;
  self->_flow = v5;

  -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
  location = 0;
  objc_initWeak(&location, self);
  v7 = self->_flow;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__PSUICellularController_launchAddeSIMFlow__block_invoke;
  v8[3] = &unk_24D501FB8;
  v8[4] = self;
  -[TSSIMSetupFlow firstViewController:](v7, "firstViewController:", v8);
  objc_destroyWeak(&location);

}

void __43__PSUICellularController_launchAddeSIMFlow__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x24BEBD7A0];
    v4 = a2;
    v5 = (id)objc_msgSend([v3 alloc], "initWithRootViewController:", v4);

    objc_msgSend(v5, "setModalPresentationStyle:", 2);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__PSUICellularController_simSetupFlowCompleted___block_invoke;
  v3[3] = &unk_24D5017E8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __48__PSUICellularController_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[194];
    WeakRetained[194] = 0;
    v4 = WeakRetained;

    objc_msgSend(v4, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = v4;
  }

}

- (void)didResetStatistics
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  -[PSUICellularController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;

  -[PSUICellularController table](self, "table");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOffset:animated:", 0, 0.0, -v6);

}

- (void)didModifyStatisticsSetting
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_306);
}

void __52__PSUICellularController_didModifyStatisticsSetting__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x24BE856D8], 0);

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularController"));
}

- (PSUICellularDataPlanListGroup)cellularDataPlanListGroup
{
  return self->_cellularDataPlanListGroup;
}

- (void)setCellularDataPlanListGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cellularDataPlanListGroup, a3);
}

- (PSUICellularDataPlanDetailGroup)cellularDataPlanDetailGroup
{
  return self->_cellularDataPlanDetailGroup;
}

- (void)setCellularDataPlanDetailGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cellularDataPlanDetailGroup, a3);
}

- (PSUICellularPlanListGroup)cellularPlanListGroup
{
  return self->_cellularPlanListGroup;
}

- (void)setCellularPlanListGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cellularPlanListGroup, a3);
}

- (PSUICellularPlanListGroup)privateNetworkPlanListGroup
{
  return self->_privateNetworkPlanListGroup;
}

- (void)setPrivateNetworkPlanListGroup:(id)a3
{
  objc_storeStrong((id *)&self->_privateNetworkPlanListGroup, a3);
}

- (PSUICarrierItemGroup)carrierItemGroup
{
  return self->_carrierItemGroup;
}

- (void)setCarrierItemGroup:(id)a3
{
  objc_storeStrong((id *)&self->_carrierItemGroup, a3);
}

- (PSUIAddOnPlanGroup)addOnPlanGroup
{
  return self->_addOnPlanGroup;
}

- (void)setAddOnPlanGroup:(id)a3
{
  objc_storeStrong((id *)&self->_addOnPlanGroup, a3);
}

- (PSUIQRCodeGroup)QRCodeGroup
{
  return self->_QRCodeGroup;
}

- (void)setQRCodeGroup:(id)a3
{
  objc_storeStrong((id *)&self->_QRCodeGroup, a3);
}

- (PSUIPendingInstallPlanGroup)pendingInstallPlanGroup
{
  return self->_pendingInstallPlanGroup;
}

- (void)setPendingInstallPlanGroup:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInstallPlanGroup, a3);
}

- (PSUIOtherOptionsGroup)otherOptionsGroup
{
  return self->_otherOptionsGroup;
}

- (void)setOtherOptionsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_otherOptionsGroup, a3);
}

- (PSUISubscriptionContextMenusGroup)subscriptionContextMenus
{
  return self->_subscriptionContextMenus;
}

- (void)setSubscriptionContextMenus:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionContextMenus, a3);
}

- (PSUITopAppUsageGroup)topAppUsageGroup
{
  return self->_topAppUsageGroup;
}

- (void)setTopAppUsageGroup:(id)a3
{
  objc_storeStrong((id *)&self->_topAppUsageGroup, a3);
}

- (PSUIMiscOptionsGroup)miscOptionsGroup
{
  return self->_miscOptionsGroup;
}

- (void)setMiscOptionsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_miscOptionsGroup, a3);
}

- (PSUIPlanPendingTransferListGroup)planPendingTransferGroup
{
  return self->_planPendingTransferGroup;
}

- (void)setPlanPendingTransferGroup:(id)a3
{
  objc_storeStrong((id *)&self->_planPendingTransferGroup, a3);
}

- (PSUIDeferredDeepLink)deferredDeepLink
{
  return self->_deferredDeepLink;
}

- (void)setDeferredDeepLink:(id)a3
{
  objc_storeStrong((id *)&self->_deferredDeepLink, a3);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (TSSIMSetupFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
  objc_storeStrong((id *)&self->_flow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_deferredDeepLink, 0);
  objc_storeStrong((id *)&self->_planPendingTransferGroup, 0);
  objc_storeStrong((id *)&self->_miscOptionsGroup, 0);
  objc_storeStrong((id *)&self->_topAppUsageGroup, 0);
  objc_storeStrong((id *)&self->_subscriptionContextMenus, 0);
  objc_storeStrong((id *)&self->_otherOptionsGroup, 0);
  objc_storeStrong((id *)&self->_pendingInstallPlanGroup, 0);
  objc_storeStrong((id *)&self->_QRCodeGroup, 0);
  objc_storeStrong((id *)&self->_addOnPlanGroup, 0);
  objc_storeStrong((id *)&self->_carrierItemGroup, 0);
  objc_storeStrong((id *)&self->_privateNetworkPlanListGroup, 0);
  objc_storeStrong((id *)&self->_cellularPlanListGroup, 0);
  objc_storeStrong((id *)&self->_cellularDataPlanDetailGroup, 0);
  objc_storeStrong((id *)&self->_cellularDataPlanListGroup, 0);
  objc_storeStrong((id *)&self->_crossPlatformSIMTransferSpecifier, 0);
  objc_storeStrong((id *)&self->_addCellularPlanSpecifier, 0);
  objc_storeStrong((id *)&self->_personalHotspotBundleController, 0);
  objc_storeStrong((id *)&self->_personalHotspotSpecifier, 0);
  objc_storeStrong((id *)&self->_facetimeSetupGroup, 0);
  objc_storeStrong((id *)&self->_facetimeSetupButton, 0);
}

@end
