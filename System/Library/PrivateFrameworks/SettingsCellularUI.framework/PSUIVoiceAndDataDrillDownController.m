@implementation PSUIVoiceAndDataDrillDownController

- (PSUIVoiceAndDataDrillDownController)initWithCTClient:(id)a3 switchFactory:(id)a4 carrierBundleCache:(id)a5 standaloneCache:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PSUIVoiceAndDataDrillDownController *v15;
  PSUIVoiceAndDataDrillDownController *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PSUIVoiceAndDataDrillDownController;
  v15 = -[PSUIVoiceAndDataDrillDownController init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_ctClient, a3);
    -[CoreTelephonyClient setDelegate:](v16->_ctClient, "setDelegate:", v16);
    objc_storeStrong((id *)&v16->_switchFactory, a4);
    objc_storeStrong((id *)&v16->_cbCache, a5);
    objc_storeStrong((id *)&v16->_saCache, a6);
    -[PSUIVoiceAndDataDrillDownController startObservingNotifications](v16, "startObservingNotifications");
  }

  return v16;
}

- (PSUIVoiceAndDataDrillDownController)init
{
  PSUIVoiceAndDataDrillDownController *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CoreTelephonyClient *ctClient;
  PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory *v7;
  PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory *switchFactory;
  uint64_t v9;
  PSUICoreTelephonyCarrierBundleCache *cbCache;
  uint64_t v11;
  PSUI5GStandaloneCache *saCache;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PSUIVoiceAndDataDrillDownController;
  v2 = -[PSUIVoiceAndDataDrillDownController init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDC2810]);
    objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("voice_and_data_controller"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithQueue:", v4);
    ctClient = v2->_ctClient;
    v2->_ctClient = (CoreTelephonyClient *)v5;

    -[CoreTelephonyClient setDelegate:](v2->_ctClient, "setDelegate:", v2);
    v7 = objc_alloc_init(PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory);
    switchFactory = v2->_switchFactory;
    v2->_switchFactory = v7;

    +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    cbCache = v2->_cbCache;
    v2->_cbCache = (PSUICoreTelephonyCarrierBundleCache *)v9;

    +[PSUI5GStandaloneCache sharedInstance](PSUI5GStandaloneCache, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    saCache = v2->_saCache;
    v2->_saCache = (PSUI5GStandaloneCache *)v11;

    -[PSUIVoiceAndDataDrillDownController startObservingNotifications](v2, "startObservingNotifications");
  }
  return v2;
}

- (void)startObservingNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleMaxDataRateChanged, CFSTR("PSMaxDataRateChangedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_airplaneModeChanged, 0x24D508008, 0);

}

- (void)setSpecifier:(id)a3
{
  uint64_t v4;
  CTXPCServiceSubscriptionContext *v5;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  CTServiceDescriptor *v7;
  CTServiceDescriptor *serviceDescriptor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSUIVoiceAndDataDrillDownController;
  -[PSUIVoiceAndDataDrillDownController setSpecifier:](&v9, sel_setSpecifier_, a3);
  v4 = (int)*MEMORY[0x24BE757A8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v4), "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v5 = (CTXPCServiceSubscriptionContext *)objc_claimAutoreleasedReturnValue();
  subscriptionContext = self->_subscriptionContext;
  self->_subscriptionContext = v5;

  objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", self->_subscriptionContext);
  v7 = (CTServiceDescriptor *)objc_claimAutoreleasedReturnValue();
  serviceDescriptor = self->_serviceDescriptor;
  self->_serviceDescriptor = v7;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v4), "setProperty:forKey:", self, CFSTR("DrillDownControllerKey"));
}

- (id)specifiers
{
  uint64_t v2;
  void *v3;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;

  v2 = (int)*MEMORY[0x24BE756E0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2);
  if (v3)
    return v3;
  -[PSUIVoiceAndDataDrillDownController updateCurrentRATModeFromSpecifier:](self, "updateCurrentRATModeFromSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]));
  v6 = (void *)MEMORY[0x24BDBCEB8];
  v14.receiver = self;
  v14.super_class = (Class)PSUIVoiceAndDataDrillDownController;
  -[PSListItemsController specifiers](&v14, sel_specifiers);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (objc_class *)objc_claimAutoreleasedReturnValue();

  -[PSUIVoiceAndDataDrillDownController prepareSpecifiers:](self, "prepareSpecifiers:", v8);
  v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2) = v8;
  v10 = v8;

  -[PSUIVoiceAndDataDrillDownController configureSpecifiers](self, "configureSpecifiers");
  v11 = (void *)MEMORY[0x24BE856B8];
  v12 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v2), "mutableCopy");
  objc_msgSend(v11, "logSpecifiers:origin:", v12, CFSTR("[PSUIVoiceAndDataDrillDownController specifiers] end"));

  v13 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v2);
  return v13;
}

- (void)reloadSpecifier:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PSUIVoiceAndDataDrillDownController;
  -[PSUIVoiceAndDataDrillDownController reloadSpecifier:](&v8, sel_reloadSpecifier_, v4);
  objc_msgSend(v4, "identifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5 == CFSTR("SASwitchSpecifierKey"))
  {
    -[PSUIVoiceAndDataDrillDownController specifierForID:](self, "specifierForID:", CFSTR("SASwitchGroupSpecifierKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "groupFooterText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75A68]);

      -[PSUIVoiceAndDataDrillDownController reloadSpecifier:](self, "reloadSpecifier:", v6);
    }

  }
}

- (void)prepareSpecifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSUIVoiceAndDataDrillDownController setUpRATModeSpecifierIdentifiers:](self, "setUpRATModeSpecifierIdentifiers:", v4);
  -[PSUIVoiceAndDataDrillDownController getSwitchSpecifiers](self, "getSwitchSpecifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

}

- (void)setUpRATModeSpecifierIdentifiers:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "cellType", (_QWORD)v12))
          {
            -[PSUIVoiceAndDataDrillDownController identifierForRATMode:](self, "identifierForRATMode:", -[PSUIVoiceAndDataDrillDownController RATModeForSpecifier:](self, "RATModeForSpecifier:", v10));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setIdentifier:", v11);

          }
          else
          {
            objc_msgSend(v10, "setIdentifier:", CFSTR("RATGroupSpecifierKey"));
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)configureSpecifiers
{
  -[PSUIVoiceAndDataDrillDownController configure5GRATModeSpecifiersEnabledState](self, "configure5GRATModeSpecifiersEnabledState");
  -[PSUIVoiceAndDataDrillDownController setRATGroupFooterText](self, "setRATGroupFooterText");
}

- (void)setRATGroupFooterText
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  int v21;
  unint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  id v26;

  -[PSUIVoiceAndDataDrillDownController specifierForID:](self, "specifierForID:", CFSTR("RATGroupSpecifierKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v26 = v3;
    v4 = (int)*MEMORY[0x24BE757A8];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v4), "propertyForKey:", 0x24D504988);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    v7 = -[PSUIVoiceAndDataDrillDownController shouldShowFooterTextWithVoiceExplanation](self, "shouldShowFooterTextWithVoiceExplanation");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("RAT_TEXT_LTE_AS_4G");
    if (v7)
      v10 = CFSTR("RAT_TEXT_LTE_AS_4G_AND_VOICE");
    v11 = CFSTR("RAT_TEXT_LTE_AND_VOICE");
    if (!v7)
      v11 = CFSTR("RAT_TEXT_LTE");
    if (v6)
      v12 = v10;
    else
      v12 = v11;
    objc_msgSend(v8, "localizedStringForKey:value:table:", v12, &stru_24D5028C8, CFSTR("Cellular"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v4), "propertyForKey:", CFSTR("Supports5G"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if (!v15)
      goto LABEL_23;
    if (-[PSUIVoiceAndDataDrillDownController shouldEnable5GRATModeSpecifiers](self, "shouldEnable5GRATModeSpecifiers"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("RAT_DRILLDOWN_SELECTION_EXPLANATION"), &stru_24D5028C8, CFSTR("Aries"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[PSUIVoiceAndDataDrillDownController shouldShow5GSABatteryLifeReliabilityWarning](self, "shouldShow5GSABatteryLifeReliabilityWarning"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v20 = CFSTR("5G_SA_BATTERY_LIFE_RELIABILITY_WARNING_FOOTER");
      }
      else
      {
        if (!-[PSUIVoiceAndDataDrillDownController shouldShow5GReliabilityWarning](self, "shouldShow5GReliabilityWarning"))
        {
          v13 = v17;
          goto LABEL_23;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v20 = CFSTR("5G_RELIABILITY_WARNING_FOOTER");
      }
      objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_24D5028C8, CFSTR("Aries"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingString:", v13);
      v25 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = -[PSUI5GStandaloneCache getNSADisableStatusReasonMaskForContext:](self->_saCache, "getNSADisableStatusReasonMaskForContext:", self->_subscriptionContext);
      if ((v21 & 2) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v23;
        v24 = CFSTR("RAT_DRILLDOWN_SELECTION_EXPLANATION_DUAL_SIM_OUTSIDE_CHINA");
      }
      else
      {
        if ((v21 & 0x80000000) == 0)
        {
LABEL_23:
          objc_msgSend(v26, "setProperty:forKey:", v13, *MEMORY[0x24BE75A68]);

          v3 = v26;
          goto LABEL_24;
        }
        v22 = -[PSUI5GStandaloneCache getSADisableStatusReasonMaskForContext:](self->_saCache, "getSADisableStatusReasonMaskForContext:", self->_subscriptionContext);
        if ((v22 & 0x40008) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v23;
          v24 = CFSTR("5G_RAT_MODE_DISABLED");
        }
        else if ((v22 & 0x10000) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v23;
          v24 = CFSTR("5G_RAT_MODE_DISABLED_LPM");
        }
        else
        {
          if ((v22 & 2) == 0)
            goto LABEL_23;
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v23;
          v24 = CFSTR("5G_RAT_MODE_DISABLED_MSIM");
        }
      }
      objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_24D5028C8, CFSTR("Aries"));
      v25 = objc_claimAutoreleasedReturnValue();
    }

    v13 = (void *)v25;
    goto LABEL_23;
  }
LABEL_24:

}

- (BOOL)shouldEnable5GRATModeSpecifiers
{
  return -[PSUI5GStandaloneCache are5GRATModesUserInteractableForContext:](self->_saCache, "are5GRATModesUserInteractableForContext:", self->_subscriptionContext);
}

- (void)configure5GRATModeSpecifiersEnabledState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PSUIVoiceAndDataDrillDownController identifierForRATMode:](self, "identifierForRATMode:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIVoiceAndDataDrillDownController specifierForID:](self, "specifierForID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIVoiceAndDataDrillDownController set5GRATModeSpecifierEnabledState:](self, "set5GRATModeSpecifierEnabledState:", v4);

  -[PSUIVoiceAndDataDrillDownController identifierForRATMode:](self, "identifierForRATMode:", 5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PSUIVoiceAndDataDrillDownController specifierForID:](self, "specifierForID:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIVoiceAndDataDrillDownController set5GRATModeSpecifierEnabledState:](self, "set5GRATModeSpecifierEnabledState:", v5);

}

- (void)set5GRATModeSpecifierEnabledState:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = a3;
    objc_msgSend(v4, "numberWithBool:", -[PSUIVoiceAndDataDrillDownController shouldEnable5GRATModeSpecifiers](self, "shouldEnable5GRATModeSpecifiers"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v6, *MEMORY[0x24BE75A18]);

  }
}

- (void)updateCurrentRATModeFromSpecifier:(id)a3
{
  id v4;

  objc_msgSend(a3, "performGetter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  self->_currentRATMode = objc_msgSend(v4, "unsignedIntValue");

}

- (id)getSwitchSpecifiers
{
  void *v3;
  _BOOL4 v4;
  int *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = -[PSUIVoiceAndDataDrillDownController shouldShowVoLTESwitch](self, "shouldShowVoLTESwitch");
  v5 = (int *)MEMORY[0x24BE757A8];
  if (v4)
  {
    -[PSUIVoiceAndDataDrillDownController getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v19 = 136315138;
      v20 = "-[PSUIVoiceAndDataDrillDownController getSwitchSpecifiers]";
      _os_log_debug_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEBUG, "%s showing VoLTE switch", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("VoLTESwitchGroupSpecifierKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);
    -[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory createVoLTESwitchSpecifierWithHostController:parentSpecifier:](self->_switchFactory, "createVoLTESwitchSpecifierWithHostController:parentSpecifier:", self, *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", CFSTR("VoLTESwitchSpecifierKey"));
    objc_msgSend(v3, "addObject:", v8);
    objc_msgSend(v8, "groupFooterText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x24BE75A68]);

  }
  if (-[PSUIVoiceAndDataDrillDownController shouldShow5GSASwitch](self, "shouldShow5GSASwitch"))
  {
    -[PSUIVoiceAndDataDrillDownController getLogger](self, "getLogger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v19 = 136315138;
      v20 = "-[PSUIVoiceAndDataDrillDownController getSwitchSpecifiers]";
      _os_log_debug_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEBUG, "%s showing 5G SA switch", (uint8_t *)&v19, 0xCu);
    }

    -[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory create5GSASwitchSpecifierWithHostController:parentSpecifier:](self->_switchFactory, "create5GSASwitchSpecifierWithHostController:parentSpecifier:", self, *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v5));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIdentifier:", CFSTR("SASwitchSpecifierKey"));
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SASwitchGroupSpecifierKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);
    objc_msgSend(v3, "addObject:", v11);
    objc_msgSend(v11, "groupFooterText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v12, "setProperty:forKey:", v13, *MEMORY[0x24BE75A68]);

  }
  if (-[PSUIVoiceAndDataDrillDownController shouldShowVoNRSwitch](self, "shouldShowVoNRSwitch"))
  {
    -[PSUIVoiceAndDataDrillDownController getLogger](self, "getLogger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v19 = 136315138;
      v20 = "-[PSUIVoiceAndDataDrillDownController getSwitchSpecifiers]";
      _os_log_debug_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEBUG, "%s showing VoNR switch", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("VoNRSwitchGroupSpecifierKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);
    -[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory createVoNRSwitchSpecifierWithHostController:parentSpecifier:](self->_switchFactory, "createVoNRSwitchSpecifierWithHostController:parentSpecifier:", self, *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v5));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIdentifier:", CFSTR("VoNRSwitchSpecifierKey"));
    objc_msgSend(v3, "addObject:", v16);
    objc_msgSend(v16, "groupFooterText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v15, "setProperty:forKey:", v17, *MEMORY[0x24BE75A68]);

  }
  return v3;
}

- (BOOL)shouldShow5GSABatteryLifeReliabilityWarning
{
  if (-[PSUIVoiceAndDataDrillDownController shouldShow5GSASwitch](self, "shouldShow5GSASwitch")
    || self->_currentRATMode < 4u)
  {
    return 0;
  }
  else
  {
    return !-[PSUICoreTelephonyCarrierBundleCache is5GSAEnabledByDefault:](self->_cbCache, "is5GSAEnabledByDefault:", self->_subscriptionContext);
  }
}

- (BOOL)shouldShow5GReliabilityWarning
{
  return -[PSUICoreTelephonyCarrierBundleCache show5GWarningUnsupportedCarrier:](self->_cbCache, "show5GWarningUnsupportedCarrier:", self->_subscriptionContext);
}

- (BOOL)shouldShowVoLTESwitch
{
  return +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShowVoLTESwitchForSubscriptionContext:RATMode:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "shouldShowVoLTESwitchForSubscriptionContext:RATMode:", self->_subscriptionContext, self->_currentRATMode);
}

- (BOOL)shouldShowVoNRSwitch
{
  return +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShowVoNRSwitchForSubscriptionContext:RATMode:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "shouldShowVoNRSwitchForSubscriptionContext:RATMode:", self->_subscriptionContext, self->_currentRATMode);
}

- (BOOL)shouldShowFooterTextWithVoiceExplanation
{
  return +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory isVoLTESwitchTurnedOnByDefaultAndHidden:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "isVoLTESwitchTurnedOnByDefaultAndHidden:", self->_subscriptionContext);
}

- (BOOL)shouldShow5GSASwitch
{
  return +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShow5GSASwitchForSubscriptionContext:RATMode:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "shouldShow5GSASwitchForSubscriptionContext:RATMode:", self->_subscriptionContext, self->_currentRATMode);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v7;
  __CFString *v8;
  id v9;

  v9 = a4;
  -[PSUIVoiceAndDataDrillDownController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8 == CFSTR("VoLTESwitchSpecifierKey"))
    objc_msgSend(v7, "addSpinnerIfNeededToCell:", v9);

}

- (int)RATModeForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a3, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  return v5;
}

- (id)identifierForRATMode:(int)a3
{
  if (a3 > 5)
    return CFSTR("NO_KNOWN_RAT_MODE");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)listItemSelected:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = -[PSUIVoiceAndDataDrillDownController indexForIndexPath:](self, "indexForIndexPath:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PSUIVoiceAndDataDrillDownController specifierAtIndex:](self, "specifierAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isRATModeSpecifier"))
    {
      v7.receiver = self;
      v7.super_class = (Class)PSUIVoiceAndDataDrillDownController;
      -[PSListItemsController listItemSelected:](&v7, sel_listItemSelected_, v4);
    }

  }
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__PSUIVoiceAndDataDrillDownController_context_capabilitiesChanged___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __67__PSUIVoiceAndDataDrillDownController_context_capabilitiesChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)handleMaxDataRateChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__PSUIVoiceAndDataDrillDownController_handleMaxDataRateChanged__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __63__PSUIVoiceAndDataDrillDownController_handleMaxDataRateChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)airplaneModeChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__PSUIVoiceAndDataDrillDownController_airplaneModeChanged__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __58__PSUIVoiceAndDataDrillDownController_airplaneModeChanged__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

- (void)nrDisableStatusChanged:(id)a3 status:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__PSUIVoiceAndDataDrillDownController_nrDisableStatusChanged_status___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __69__PSUIVoiceAndDataDrillDownController_nrDisableStatusChanged_status___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("VoiceAndDataDrilldown"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_saCache, 0);
  objc_storeStrong((id *)&self->_cbCache, 0);
  objc_storeStrong((id *)&self->_switchFactory, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end
