@implementation PSUICellularDataOptionsController

- (PSUICellularDataOptionsController)init
{
  PSUICellularDataOptionsController *v2;
  uint64_t v3;
  PSSimStatusCache *simStatusCache;
  uint64_t v5;
  PSUICellularPlanManagerCache *planManagerCache;
  uint64_t v7;
  PSUICoreTelephonyDataCache *dataCache;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PSUICellularDataOptionsController;
  v2 = -[PSUICellularDataOptionsController init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    simStatusCache = v2->_simStatusCache;
    v2->_simStatusCache = (PSSimStatusCache *)v3;

    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    planManagerCache = v2->_planManagerCache;
    v2->_planManagerCache = (PSUICellularPlanManagerCache *)v5;

    +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    dataCache = v2->_dataCache;
    v2->_dataCache = (PSUICoreTelephonyDataCache *)v7;

    objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("cellular_data_options_controller"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_serverConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_airplaneModeChanged, 0x24D508008, 0);

  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSUICellularDataOptionsController;
  -[PSUICellularDataOptionsController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PSUICellularDataOptionsController emitNavigationEvent](self, "emitNavigationEvent");
}

- (void)emitNavigationEvent
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Cellular/CELLULAR_DATA_OPTIONS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithKey:table:locale:bundleURL:", CFSTR("Cellular Data Options"), 0, v5, v7);

  v9 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithKey:table:locale:bundleURL:", CFSTR("Cellular"), 0, v10, v12);

  v15[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularDataOptionsController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.cellular-settings"), v8, v14, v3);

}

- (PSUICellularDataOptionsController)initWithParentSpecifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PSUICellularDataOptionsController *v9;

  v4 = (void *)MEMORY[0x24BE856A8];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PSUICellularDataOptionsController initWithParentSpecifier:simStatusCache:planManagerCache:dataCache:](self, "initWithParentSpecifier:simStatusCache:planManagerCache:dataCache:", v5, v6, v7, v8);

  return v9;
}

- (PSUICellularDataOptionsController)initWithParentSpecifier:(id)a3 simStatusCache:(id)a4 planManagerCache:(id)a5 dataCache:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PSUICellularDataOptionsController *v15;
  PSUICellularDataOptionsController *v16;
  void *v17;
  uint64_t v18;
  CTServiceDescriptor *serviceDescriptor;
  void *v20;
  void *v21;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PSUICellularDataOptionsController;
  v15 = -[PSUICellularDataOptionsController init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_parentSpecifier, a3);
    objc_msgSend(v11, "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    serviceDescriptor = v16->_serviceDescriptor;
    v16->_serviceDescriptor = (CTServiceDescriptor *)v18;

    objc_storeStrong((id *)&v16->_simStatusCache, a4);
    objc_storeStrong((id *)&v16->_planManagerCache, a5);
    objc_storeStrong((id *)&v16->_dataCache, a6);
    objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("cellular_data_options_controller"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_serverConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v16, sel_airplaneModeChanged, 0x24D508008, 0);

  }
  return v16;
}

- (void)dealloc
{
  __CTServerConnection *serverConnection;
  void *v4;
  objc_super v5;

  serverConnection = self->_serverConnection;
  if (serverConnection)
    CFRelease(serverConnection);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PSUICellularDataOptionsController;
  -[PSUICellularDataOptionsController dealloc](&v5, sel_dealloc);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  PSUIVoiceAndDataSpecifier *v16;
  void *v17;
  PSUIDataModeSubgroup *v18;
  uint64_t v19;
  PSUICoreTelephonyDataCache *dataCache;
  id v21;
  void *v22;
  void *v23;
  PSUIDataModeSubgroup *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  uint8_t buf[16];

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DATA_RATE_GROUP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v5;
  objc_msgSend(v5, "addObject:", v6);
  v7 = v6;
  -[PSSimStatusCache subscriptionsInUse](self->_simStatusCache, "subscriptionsInUse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PSSimStatusCache subscriptionContexts](self->_simStatusCache, "subscriptionContexts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = (int)*MEMORY[0x24BE757A8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v11), "setProperty:forKey:", v9, *MEMORY[0x24BE75CE8]);
  -[PSSimStatusCache subscriptionContexts](self->_simStatusCache, "subscriptionContexts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "count") <= 1)
  {

LABEL_9:
    if (!-[PSUICoreTelephonyDataCache isAirplaneModeEnabled](self->_dataCache, "isAirplaneModeEnabled"))
    {
      -[PSUICellularDataOptionsController getLogger](self, "getLogger");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEBUG, "Adding enable LTE/3G/etc group", buf, 2u);
      }

      v16 = -[PSUIVoiceAndDataSpecifier initWithHostController:subscriptionContext:groupSpecifierToUpdateFooterFor:]([PSUIVoiceAndDataSpecifier alloc], "initWithHostController:subscriptionContext:groupSpecifierToUpdateFooterFor:", self, v9, 0);
      if (v16)
        objc_msgSend(v29, "ps_insertObject:afterObject:", v16, v7);

    }
    goto LABEL_15;
  }
  -[PSUICellularPlanManagerCache planItems](self->_planManagerCache, "planItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14 < 2)
    goto LABEL_9;
LABEL_15:
  if (-[PSUICoreTelephonyDataCache isCellularDataEnabled](self->_dataCache, "isCellularDataEnabled", v8)
    || PSIsVoiceRoamingOptionAvailable())
  {
    -[PSUICellularDataOptionsController roamingSpecifiers](self, "roamingSpecifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
      objc_msgSend(v29, "ps_insertObjectsFromArray:afterObject:", v17, v7);

  }
  v18 = [PSUIDataModeSubgroup alloc];
  v19 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v11);
  dataCache = self->_dataCache;
  v21 = objc_alloc(MEMORY[0x24BDC2810]);
  objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("data_options_controller"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithQueue:", v22);
  v24 = -[PSUIDataModeSubgroup initWithHostController:parentSpecifier:dataCache:context:ctClient:](v18, "initWithHostController:parentSpecifier:dataCache:context:ctClient:", self, v19, dataCache, v9, v23);

  -[PSUIDataModeSubgroup specifiers](v24, "specifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObjectsFromArray:", v25);

  objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v29, CFSTR("[PSUICellularDataOptionsController specifiers] end"));
  v26 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v29;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v4;
}

- (id)roamingSpecifiers
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PSUICoreTelephonyDataCache isCellularDataEnabled](self->_dataCache, "isCellularDataEnabled")
    || PSIsVoiceRoamingOptionAvailable())
  {
    if (PSIsVoiceRoamingOptionAvailable())
    {
      -[PSUICellularDataOptionsController getLogger](self, "getLogger");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEBUG, "Adding voice roaming specifiers", buf, 2u);
      }

      PSRoamingSubMenuSpecifiers(self);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v9 = (void *)v5;
      objc_msgSend(v3, "addObjectsFromArray:", v5);

      return v3;
    }
    if (PSIsDataRoamingOptionAvailable())
    {
      -[PSUICellularDataOptionsController getLogger](self, "getLogger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_debug_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEBUG, "Adding data roaming specifiers", v12, 2u);
      }

      PSDataRoamingSpecifiers(self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v7);

    }
    if (PSIsCDMARoamingOptionAvailable())
    {
      -[PSUICellularDataOptionsController getLogger](self, "getLogger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v11 = 0;
        _os_log_debug_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEBUG, "Adding CDMA roaming specifiers", v11, 2u);
      }

      PSCDMARoamingSpecifiers(self);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  return v3;
}

- (id)roamingSettingsDescription:(id)a3
{
  _BOOL4 v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = -[PSUICoreTelephonyDataCache isCellularDataEnabled](self->_dataCache, "isCellularDataEnabled", a3);
  v4 = PSIsVoiceRoamingEnabled();
  if (v3 && (v4 & PSIsDataRoamingEnabled()) == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("VOICE_AND_DATA_ROAMING");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      v7 = CFSTR("VOICE_ONLY_ROAMING");
    else
      v7 = CFSTR("NONE_ROAMING");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getDataRoamingStatus:(id)a3
{
  NSObject *v3;
  int v4;
  const __CFString *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularDataOptionsController getLogger](self, "getLogger", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = PSIsDataRoamingEnabled();
    v5 = CFSTR("disabled");
    if (v4)
      v5 = CFSTR("enabled");
    v7 = 136315394;
    v8 = "-[PSUICellularDataOptionsController getDataRoamingStatus:]";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s roaming is %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", PSIsDataRoamingEnabled());
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getDataRoamingStatusForService:(id)a3
{
  NSObject *v4;
  CTServiceDescriptor *serviceDescriptor;
  int v6;
  const __CFString *v7;
  int v9;
  const char *v10;
  __int16 v11;
  CTServiceDescriptor *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularDataOptionsController getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    serviceDescriptor = self->_serviceDescriptor;
    v6 = PSIsDataRoamingEnabledForService(serviceDescriptor);
    v7 = CFSTR("disabled");
    v10 = "-[PSUICellularDataOptionsController getDataRoamingStatusForService:]";
    v9 = 136315650;
    v11 = 2112;
    v12 = serviceDescriptor;
    if (v6)
      v7 = CFSTR("enabled");
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s For service %@, roaming is %@", (uint8_t *)&v9, 0x20u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", PSIsDataRoamingEnabledForService(self->_serviceDescriptor));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDataRoamingEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  int v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(a3, "BOOLValue");
  -[PSUICellularDataOptionsController getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("disabled");
    if ((_DWORD)v7)
      v9 = CFSTR("enabled");
    v19 = 136315394;
    v20 = "-[PSUICellularDataOptionsController setDataRoamingEnabled:specifier:]";
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s setting roaming = %@", (uint8_t *)&v19, 0x16u);
  }

  PSSetDataRoamingEnabled(v7);
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUICellularDataOptionsController beginUpdates](self, "beginUpdates");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sf_isiPad");
  if ((_DWORD)v7)
  {
    if ((v12 & 1) == 0)
    {
LABEL_13:

      goto LABEL_14;
    }
    -[PSUICellularDataOptionsController specifierForID:](self, "specifierForID:", CFSTR("CDMA_ROAMING"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

      goto LABEL_13;
    }
    v17 = PSIsCDMARoamingOptionAvailable();

    if (v17)
    {
      PSCDMARoamingSpecifiers(self);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUICellularDataOptionsController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v18, v10, 1);

    }
  }
  else
  {
    if ((v12 & 1) == 0)
      goto LABEL_13;
    -[PSUICellularDataOptionsController specifierForID:](self, "specifierForID:", CFSTR("CDMA_ROAMING"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_13;
    v15 = (void *)v14;
    v16 = PSIsCDMARoamingOptionAvailable();

    if ((v16 & 1) == 0)
      -[PSUICellularDataOptionsController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("CDMA_ROAMING_GROUP"), 1);
  }
LABEL_14:
  -[PSUICellularDataOptionsController endUpdates](self, "endUpdates");
  -[PSUICellularDataOptionsController roamingOptionsDidChange](self, "roamingOptionsDidChange");

}

- (void)setDataRoamingEnabledForService:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  CTServiceDescriptor *serviceDescriptor;
  const __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  CTServiceDescriptor *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "BOOLValue");
  -[PSUICellularDataOptionsController getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    serviceDescriptor = self->_serviceDescriptor;
    v8 = CFSTR("disabled");
    v10 = "-[PSUICellularDataOptionsController setDataRoamingEnabledForService:specifier:]";
    v9 = 136315650;
    if ((_DWORD)v5)
      v8 = CFSTR("enabled");
    v11 = 2112;
    v12 = serviceDescriptor;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s For service %@, setting roaming = %@", (uint8_t *)&v9, 0x20u);
  }

  PSSetDataRoamingEnabledForService(self->_serviceDescriptor, v5);
  -[PSUICellularDataOptionsController roamingOptionsDidChange](self, "roamingOptionsDidChange");
}

- (void)setCDMARoamingEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PSUICellularDataOptionsController getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "BOOLValue");
    v8 = CFSTR("disabled");
    if (v7)
      v8 = CFSTR("enabled");
    v9 = 136315394;
    v10 = "-[PSUICellularDataOptionsController setCDMARoamingEnabled:specifier:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s setting CDMA roaming = %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v5, "BOOLValue");
  PSSetCDMARoamingEnabled();
  -[PSUICellularDataOptionsController roamingOptionsDidChange](self, "roamingOptionsDidChange");

}

- (id)getCDMARoamingStatus:(id)a3
{
  void *v4;
  unint64_t CDMAInternationalRoaming;
  unint64_t v6;
  int v7;
  NSObject *v8;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache selectedPlanItem](self->_planManagerCache, "selectedPlanItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isBackedByCellularPlan");

  CDMAInternationalRoaming = _CTServerConnectionGetCDMAInternationalRoaming();
  v6 = HIDWORD(CDMAInternationalRoaming);
  if (HIDWORD(CDMAInternationalRoaming))
  {
    v7 = CDMAInternationalRoaming;
    -[PSUICellularDataOptionsController getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v11 = v7;
      v12 = 1024;
      v13 = v6;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "Failed to get CDMAInternationalRoaming setting with error %i:%i", buf, 0xEu);
    }

    return MEMORY[0x24BDBD1C0];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)roamingOptionsDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE75790]));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]));

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularDataOptionsController"));
}

- (PSSimStatusCache)simStatusCache
{
  return self->_simStatusCache;
}

- (void)setSimStatusCache:(id)a3
{
  objc_storeStrong((id *)&self->_simStatusCache, a3);
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
  objc_storeStrong((id *)&self->_planManagerCache, a3);
}

- (PSUICoreTelephonyDataCache)dataCache
{
  return self->_dataCache;
}

- (void)setDataCache:(id)a3
{
  objc_storeStrong((id *)&self->_dataCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
}

@end
