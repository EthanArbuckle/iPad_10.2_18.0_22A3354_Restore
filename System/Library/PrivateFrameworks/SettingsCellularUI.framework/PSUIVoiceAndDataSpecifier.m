@implementation PSUIVoiceAndDataSpecifier

- (PSUIVoiceAndDataSpecifier)initWithHostController:(id)a3 subscriptionContext:(id)a4 groupSpecifierToUpdateFooterFor:(id)a5 serviceDescriptor:(id)a6 coreTelephonyClient:(id)a7 callCache:(id)a8 registrationCache:(id)a9 carrierBundleCache:(id)a10 simStatusCache:(id)a11 deviceWifiState:(id)a12
{
  PSUIVoiceAndDataSpecifier *v18;
  id *p_isa;
  void *v20;
  void *v21;
  void *v22;
  PSUIVoiceAndDataSpecifier *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  v30 = a7;
  v29 = a8;
  v28 = a9;
  v27 = a10;
  v26 = a11;
  v25 = a12;
  v35.receiver = self;
  v35.super_class = (Class)PSUIVoiceAndDataSpecifier;
  v18 = -[PSUIVoiceAndDataSpecifier initWithName:target:set:get:detail:cell:edit:](&v35, sel_initWithName_target_set_get_detail_cell_edit_, 0, self, sel_setRATMode_specifier_, sel_getRATMode, 0, 2, 0);
  p_isa = (id *)&v18->super.super.isa;
  if (v18)
  {
    -[PSUIVoiceAndDataSpecifier setProperty:forKey:](v18, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759E0]);
    objc_msgSend(p_isa, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75CB8]);
    objc_storeWeak(p_isa + 26, v34);
    objc_storeStrong(p_isa + 27, a5);
    objc_storeStrong(p_isa + 28, a4);
    objc_storeStrong(p_isa + 29, a6);
    objc_storeStrong(p_isa + 30, a7);
    objc_storeStrong(p_isa + 32, a8);
    objc_storeStrong(p_isa + 33, a9);
    objc_storeStrong(p_isa + 34, a10);
    objc_storeStrong(p_isa + 35, a11);
    objc_storeStrong(p_isa + 36, a12);
    objc_msgSend(p_isa, "startObservingNotifications");
    if (!objc_msgSend(p_isa, "configureContents"))
    {
      v23 = 0;
      goto LABEL_6;
    }
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(p_isa, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@.%li"), v21, objc_msgSend(v33, "slotID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(p_isa, "setIdentifier:", v22);
    objc_msgSend(p_isa, "setProperty:forKey:", v22, *MEMORY[0x24BE75AC0]);
    objc_msgSend(p_isa, "setDetailControllerClass:", objc_opt_class());

  }
  v23 = p_isa;
LABEL_6:

  return v23;
}

- (PSUIVoiceAndDataSpecifier)initWithHostController:(id)a3 subscriptionContext:(id)a4 groupSpecifierToUpdateFooterFor:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PSUIVoiceAndDataSpecifier *v18;
  void *v20;
  void *v22;

  v7 = (void *)MEMORY[0x24BDC27B0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "descriptorWithSubscriptionContext:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BDC2810]);
  objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("voice_and_data_specifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "initWithQueue:", v22);
  +[PSUICoreTelephonyCallCache sharedInstance](PSUICoreTelephonyCallCache, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICoreTelephonyRegistrationCache sharedInstance](PSUICoreTelephonyRegistrationCache, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUIDeviceWiFiState sharedInstance](PSUIDeviceWiFiState, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PSUIVoiceAndDataSpecifier initWithHostController:subscriptionContext:groupSpecifierToUpdateFooterFor:serviceDescriptor:coreTelephonyClient:callCache:registrationCache:carrierBundleCache:simStatusCache:deviceWifiState:](self, "initWithHostController:subscriptionContext:groupSpecifierToUpdateFooterFor:serviceDescriptor:coreTelephonyClient:callCache:registrationCache:carrierBundleCache:simStatusCache:deviceWifiState:", v10, v9, v8, v20, v12, v13, v14, v15, v16, v17);

  return v18;
}

- (BOOL)configureContents
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  void *v10;
  _BOOL4 v11;
  BOOL v12;
  uint8_t v14[16];

  -[PSUIVoiceAndDataSpecifier setUpInternalState](self, "setUpInternalState");
  if (-[NSArray count](self->_supportedDataRates, "count"))
  {
    -[PSUIVoiceAndDataSpecifier setUpRATSpecifers](self, "setUpRATSpecifers");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("VOICE_AND_DATA"), &stru_24D5028C8, CFSTR("Cellular"));
    v4 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sf_isiPad");

    if (!v6)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DATA_DRILLDOWN"), &stru_24D5028C8, CFSTR("Cellular"));
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = v8;
  }
  else
  {
    subscriptionContext = self->_subscriptionContext;
    -[PSUIVoiceAndDataSpecifier getRATMode](self, "getRATMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShowAnyVoiceAndDataSwitchSpecifierForContext:RATMode:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "shouldShowAnyVoiceAndDataSwitchSpecifierForContext:RATMode:", subscriptionContext, objc_msgSend(v10, "intValue"));

    if (!v11)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("VOICE_OPTIONS"), &stru_24D5028C8, CFSTR("Cellular"));
    v4 = objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  if (v4)
  {
    -[PSUIVoiceAndDataSpecifier setName:](self, "setName:", v4);
    v12 = 1;
    goto LABEL_12;
  }
LABEL_9:
  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "No supported data rates and no voice or data switches need to be shown.", v14, 2u);
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (void)startObservingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleMaxDataRateChanged, CFSTR("PSMaxDataRateChangedNotification"), 0);

}

- (void)setUpInternalState
{
  NSObject *v3;
  const char *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  NSArray *v9;
  NSArray *supportedDataRates;
  NSObject *v11;
  NSArray *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  self->_3GOverrideTo4G = 0;
  self->_LTEOverrideTo4G = 0;
  self->_LTEOverrideTo4G = -[PSUICoreTelephonyCarrierBundleCache shouldOverrideLTEto4G:](self->_carrierBundleCache, "shouldOverrideLTEto4G:", self->_subscriptionContext);
  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_LTEOverrideTo4G)
      v4 = "yes";
    else
      v4 = "no";
    v14 = 136315138;
    v15 = (void *)v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "LTE override to 4G: %s", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_LTEOverrideTo4G);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIVoiceAndDataSpecifier setProperty:forKey:](self, "setProperty:forKey:", v5, CFSTR("PSLTEOverrideTo4GKey"));

  self->_3GOverrideTo4G = -[PSUICoreTelephonyCarrierBundleCache shouldOverride3Gto4G:](self->_carrierBundleCache, "shouldOverride3Gto4G:", self->_subscriptionContext);
  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_3GOverrideTo4G)
      v7 = "yes";
    else
      v7 = "no";
    v14 = 136315138;
    v15 = (void *)v7;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "3G override to 4G: %s", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_3GOverrideTo4G);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIVoiceAndDataSpecifier setProperty:forKey:](self, "setProperty:forKey:", v8, CFSTR("PS3GOverrideTo4GKey"));

  -[PSUIVoiceAndDataSpecifier setProperty:forKey:](self, "setProperty:forKey:", self->_subscriptionContext, *MEMORY[0x24BE75CE8]);
  -[PSUICoreTelephonyRegistrationCache supportedDataRates:](self->_regCache, "supportedDataRates:", self->_subscriptionContext);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  supportedDataRates = self->_supportedDataRates;
  self->_supportedDataRates = v9;

  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_supportedDataRates;
    v14 = 138412290;
    v15 = v12;
    _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEFAULT, "supported cellular data rates: %@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NSArray containsObject:](self->_supportedDataRates, "containsObject:", &unk_24D51C368));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIVoiceAndDataSpecifier setProperty:forKey:](self, "setProperty:forKey:", v13, 0x24D505268);

}

- (void)setUpRATSpecifers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIVoiceAndDataSpecifier populateSpecifiers:values:](self, "populateSpecifiers:values:", v3, v5);
  objc_msgSend(v4, "addObjectsFromArray:", v3);
  v6 = objc_msgSend(v3, "count");
  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = 138543362;
      v10 = v3;
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Adding RAT Modes : %{public}@", (uint8_t *)&v9, 0xCu);
    }

    -[PSUIVoiceAndDataSpecifier setValues:titles:shortTitles:](self, "setValues:titles:shortTitles:", v5, v3, v4);
  }
  else
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "No RAT mode specifiers added.", (uint8_t *)&v9, 2u);
    }

  }
}

- (void)populateSpecifiers:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSArray reverseObjectEnumerator](self->_supportedDataRates, "reverseObjectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[PSUIVoiceAndDataSpecifier getRATModesFromDataRate:](self, "getRATModesFromDataRate:", objc_msgSend(v13, "unsignedIntValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v14);

        -[PSUIVoiceAndDataSpecifier getLocalizedStringsFromDataRate:](self, "getLocalizedStringsFromDataRate:", objc_msgSend(v13, "unsignedIntValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (id)getRATMode
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  uint8_t v9[16];
  uint8_t buf[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t v14[16];

  switch(-[PSUICoreTelephonyRegistrationCache maxDataRate:](self->_regCache, "maxDataRate:", self->_subscriptionContext))
  {
    case 1:
      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "RAT mode is 2G", buf, 2u);
      }
      v4 = &unk_24D51C3E0;
      break;
    case 2:
      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "RAT mode is 3G", v11, 2u);
      }
      v4 = &unk_24D51C3C8;
      break;
    case 3:
      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "RAT mode is LTE", v12, 2u);
      }
      v4 = &unk_24D51C3B0;
      break;
    case 4:
      -[PSUIVoiceAndDataSpecifier getSmartDataModeState](self, "getSmartDataModeState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "BOOLValue");

      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v3 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v7)
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "RAT mode is 5G Auto", v14, 2u);
        }
        v4 = &unk_24D51C380;
      }
      else
      {
        if (v7)
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "RAT mode is 5G", v13, 2u);
        }
        v4 = &unk_24D51C398;
      }
      break;
    default:
      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "RAT mode is unknown", v9, 2u);
      }
      v4 = 0;
      break;
  }

  return v4;
}

- (void)setRATMode:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PSUIVoiceAndDataSpecifier propertyForKey:](self, "propertyForKey:", 0x24D5052A8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_drillDownController, v6);

  v7 = objc_msgSend(v5, "intValue");
  -[PSUIVoiceAndDataSpecifier getRATMode](self, "getRATMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = v7;
    v12 = 1024;
    v13 = v9;
    _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to set RAT mode to %u from current RAT mode of %u", (uint8_t *)v11, 0xEu);
  }

  if ((_DWORD)v7 != (_DWORD)v9)
  {
    if (-[PSUIVoiceAndDataSpecifier shouldShowCallEndWarningForTargetRATMode:currentRATMode:](self, "shouldShowCallEndWarningForTargetRATMode:currentRATMode:", v7, v9))
    {
      -[PSUIVoiceAndDataSpecifier showCallMayEndWarningForTargetRATMode:currentRATMode:](self, "showCallMayEndWarningForTargetRATMode:currentRATMode:", v7, v9);
    }
    else
    {
      -[PSUIVoiceAndDataSpecifier setMaxDataRateForRATMode:](self, "setMaxDataRateForRATMode:", v7);
    }
  }
}

- (void)setMaxDataRateForRATMode:(int)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void (*v8)(uint64_t);
  uint64_t *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[PSUIVoiceAndDataSpecifier setSmartDataModeState:](self, "setSmartDataModeState:");
  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = a3;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "setting RAT Mode to : %d", buf, 8u);
  }

  switch(a3)
  {
    case 0:
    case 6:
      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2161C6000, v6, OS_LOG_TYPE_ERROR, "set RAT mode = Unknown", buf, 2u);
      }

      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[PSUIVoiceAndDataSpecifier values](self, "values");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSUIVoiceAndDataSpecifier titleDictionary](self, "titleDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = (uint64_t)v14;
        v20 = 2114;
        v21 = v15;
        _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "Values were: %{public}@, titles were: %{public}@", buf, 0x16u);

      }
      v17 = MEMORY[0x24BDAC760];
      v8 = __54__PSUIVoiceAndDataSpecifier_setMaxDataRateForRATMode___block_invoke;
      v9 = &v17;
      goto LABEL_28;
    case 1:
      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "set RAT mode = 2G", buf, 2u);
      }
      v11 = 1;
      goto LABEL_24;
    case 2:
      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v11 = 2;
        _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "set RAT mode = 3G", buf, 2u);
      }
      else
      {
        v11 = 2;
      }
      goto LABEL_24;
    case 3:
      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "set RAT mode = 4G", buf, 2u);
      }
      v11 = 3;
      goto LABEL_24;
    case 4:
      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v12 = "set RAT mode = 5G";
      break;
    case 5:
      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v12 = "set RAT mode = 5G Auto";
      break;
    default:
      goto LABEL_27;
  }
  _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
LABEL_22:
  v11 = 4;
LABEL_24:

  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = v11;
    _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "Setting Max Data Rate to: %li", buf, 0xCu);
  }

  -[PSUICoreTelephonyRegistrationCache setMaxDataRate:dataRate:](self->_regCache, "setMaxDataRate:dataRate:", self->_subscriptionContext, v11);
LABEL_27:
  v16 = MEMORY[0x24BDAC760];
  v8 = __54__PSUIVoiceAndDataSpecifier_setMaxDataRateForRATMode___block_invoke_48;
  v9 = &v16;
LABEL_28:
  v9[1] = 3221225472;
  v9[2] = (uint64_t)v8;
  v9[3] = (uint64_t)&unk_24D501660;
  v9[4] = (uint64_t)self;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);
}

void __54__PSUIVoiceAndDataSpecifier_setMaxDataRateForRATMode___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

void __54__PSUIVoiceAndDataSpecifier_setMaxDataRateForRATMode___block_invoke_48(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (BOOL)shouldShowCallEndWarningForTargetRATMode:(int)a3 currentRATMode:(int)a4
{
  BOOL v7;
  BOOL v8;

  if (-[PSUICoreTelephonyCallCache isAnyCallActive](self->_callCache, "isAnyCallActive"))
    v7 = a3 > a4;
  else
    v7 = 1;
  v8 = v7 || a4 > 3;
  if (!v8
    && (-[PSUICoreTelephonyCallCache isAnyVOIPCallActive](self->_callCache, "isAnyVOIPCallActive")
     || -[PSUICoreTelephonyCallCache isActiveCallVoLTE](self->_callCache, "isActiveCallVoLTE")))
  {
    return -[PSSimStatusCache isSlotActiveDataSlot:](self->_simStatusCache, "isSlotActiveDataSlot:", -[CTXPCServiceSubscriptionContext slotID](self->_subscriptionContext, "slotID"));
  }
  else
  {
    return 0;
  }
}

- (void)showCallMayEndWarningForTargetRATMode:(int)a3 currentRATMode:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x24BDAC8D0];
  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "showing call may end warning.", (uint8_t *)v11, 2u);
  }

  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = v5;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "targetRATMode: %d is lower than currentRATMode: %d", (uint8_t *)v11, 0xEu);
  }

  -[PSUIVoiceAndDataSpecifier createCallMayEndConfirmationSpecifierForTargetRATMode:currentRATMode:](self, "createCallMayEndConfirmationSpecifierForTargetRATMode:currentRATMode:", v5, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_drillDownController);
  objc_msgSend(WeakRetained, "showConfirmationViewForSpecifier:", v9);

}

- (id)createCallMayEndConfirmationSpecifierForTargetRATMode:(int)a3 currentRATMode:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _BOOL4 v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = *(_QWORD *)&a3;
  -[PSUIVoiceAndDataSpecifier localizedRATModeStringForPrefix:targetMode:](self, "localizedRATModeStringForPrefix:targetMode:", CFSTR("DISABLE_RAT"), *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ON_CALL_OK_DISABLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PSUICoreTelephonyCallCache isAnyVOIPCallActive](self->_callCache, "isAnyVOIPCallActive"))
  {
    if (-[PSUIDeviceWiFiState isConnectedOverWiFi](self->_deviceWifiState, "isConnectedOverWiFi"))
      v9 = CFSTR("RAT_ON_FACETIME_WIFI_WARNING_DISABLE");
    else
      v9 = CFSTR("RAT_ON_FACETIME_WARNING_DISABLE");
    goto LABEL_8;
  }
  v10 = -[PSUICoreTelephonyCallCache isActiveCallVoLTE](self->_callCache, "isActiveCallVoLTE");
  v11 = &stru_24D5028C8;
  if (v4 <= 3 && v10)
  {
    v9 = CFSTR("RAT_ON_CALL_WARNING_DISABLE");
LABEL_8:
    -[PSUIVoiceAndDataSpecifier localizedRATModeStringForPrefix:targetMode:](self, "localizedRATModeStringForPrefix:targetMode:", v9, v4);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24D5028C8, self, 0, 0, 0, -1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ON_CALL_CANCEL"), &stru_24D5028C8, CFSTR("Cellular"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v15, *MEMORY[0x24BE75970]);

  objc_msgSend(v13, "setObject:forKey:", v8, *MEMORY[0x24BE75980]);
  objc_msgSend(v13, "setObject:forKey:", v11, *MEMORY[0x24BE75988]);
  objc_msgSend(v13, "setObject:forKey:", v6, *MEMORY[0x24BE75990]);
  objc_msgSend(v12, "setupWithDictionary:", v13);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v16, CFSTR("newValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v17, *MEMORY[0x24BE75978]);

  objc_msgSend(v12, "setConfirmationAction:", sel_acceptedRATSelectionDuringCall_);
  objc_msgSend(v12, "setConfirmationCancelAction:", sel_canceledRATSelectionDuringCall);

  return v12;
}

- (void)acceptedRATSelectionDuringCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[16];

  v4 = a3;
  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Accepted RAT Selection During Call", v8, 2u);
  }

  objc_msgSend(v4, "propertyForKey:", CFSTR("newValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "intValue");
  -[PSUIVoiceAndDataSpecifier setMaxDataRateForRATMode:](self, "setMaxDataRateForRATMode:", v7);
}

- (void)canceledRATSelectionDuringCall
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Canceled RAT selection during call", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__PSUIVoiceAndDataSpecifier_canceledRATSelectionDuringCall__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __59__PSUIVoiceAndDataSpecifier_canceledRATSelectionDuringCall__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (id)localizedRATModeStringForPrefix:(id)a3 targetMode:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[PSUIVoiceAndDataSpecifier getRATMode](self, "getRATMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PSUIVoiceAndDataSpecifier warningRATModeForTargetMode:currentMode:](self, "warningRATModeForTargetMode:currentMode:", v4, objc_msgSend(v7, "intValue"));

  v9 = (void *)MEMORY[0x24BDD17C8];
  -[PSUIVoiceAndDataSpecifier suffixStringFromRATMode:](self, "suffixStringFromRATMode:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%@"), v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUIVoiceAndDataSpecifier localizedWarningStringForKey:andRATMode:](self, "localizedWarningStringForKey:andRATMode:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int)warningRATModeForTargetMode:(int)a3 currentMode:(int)a4
{
  if (a3 <= a4)
    return a4;
  else
    return a3;
}

- (id)localizedWarningStringForKey:(id)a3 andRATMode:(int)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 >= 4)
    v9 = CFSTR("Aries");
  else
    v9 = CFSTR("Cellular");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_24D5028C8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)suffixStringFromRATMode:(int)a3
{
  id result;
  _BOOL4 _3GOverrideTo4G;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;

  switch(a3)
  {
    case 1:
      result = CFSTR("2G");
      break;
    case 2:
      _3GOverrideTo4G = self->_3GOverrideTo4G;
      v5 = CFSTR("3G_AS_4G");
      v6 = CFSTR("3G");
      goto LABEL_6;
    case 3:
      _3GOverrideTo4G = self->_LTEOverrideTo4G;
      v5 = CFSTR("LTE_AS_4G");
      v6 = CFSTR("LTE");
LABEL_6:
      if (_3GOverrideTo4G)
        v7 = (__CFString *)v5;
      else
        v7 = (__CFString *)v6;
      result = v7;
      break;
    case 4:
      result = CFSTR("5G");
      break;
    case 5:
      result = CFSTR("5G_AUTO");
      break;
    default:
      result = &stru_24D5028C8;
      break;
  }
  return result;
}

- (id)getSmartDataModeState
{
  CoreTelephonyClient *ctClient;
  CTServiceDescriptor *serviceDescriptor;
  uint64_t v5;
  CTServiceDescriptor *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  CTServiceDescriptor *v11;
  CTServiceDescriptor *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  CTServiceDescriptor *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  ctClient = self->_ctClient;
  serviceDescriptor = self->_serviceDescriptor;
  v14 = 0;
  v5 = -[CoreTelephonyClient smartDataMode:error:](ctClient, "smartDataMode:error:", serviceDescriptor, &v14);
  v6 = (CTServiceDescriptor *)v14;
  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = self->_serviceDescriptor;
      *(_DWORD *)buf = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "Failed to get smart data mode state service: %@, error: %@", buf, 0x16u);
    }

    v9 = (void *)MEMORY[0x24BDBD1C0];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("OFF");
      v11 = self->_serviceDescriptor;
      if ((_DWORD)v5)
        v10 = CFSTR("ON");
      *(_DWORD *)buf = 138412546;
      v16 = (void *)v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Successfully retrieved smart data mode: %@  state for service: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)setSmartDataModeState:(int)a3
{
  NSObject *v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  CTServiceDescriptor *serviceDescriptor;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "OFF";
    if (a3 == 5)
      v6 = "ON";
    v10 = 136315138;
    v11 = (void *)v6;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Setting smart data mode state to %s", (uint8_t *)&v10, 0xCu);
  }

  -[CoreTelephonyClient setSmartDataMode:enable:](self->_ctClient, "setSmartDataMode:enable:", self->_serviceDescriptor, a3 == 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      serviceDescriptor = self->_serviceDescriptor;
      v10 = 138412546;
      v11 = serviceDescriptor;
      v12 = 2112;
      v13 = v7;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "Failed to activate smart data mode for service: %@, error: %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)handleMaxDataRateChanged
{
  _QWORD block[5];

  -[PSUIVoiceAndDataSpecifier configureContents](self, "configureContents");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__PSUIVoiceAndDataSpecifier_handleMaxDataRateChanged__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __53__PSUIVoiceAndDataSpecifier_handleMaxDataRateChanged__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 208));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));

}

- (id)getLocalizedStringsFromDataRate:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  -[PSUIVoiceAndDataSpecifier getRATModesFromDataRate:](self, "getRATModesFromDataRate:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[PSUIVoiceAndDataSpecifier getLocalizedStringFromRATMode:](self, "getLocalizedStringFromRATMode:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "unsignedIntValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)getRATModesFromDataRate:(int64_t)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if ((unint64_t)(a3 - 1) < 4)
    return *(&off_24D501B80 + a3 - 1);
  -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_2161C6000, v4, OS_LOG_TYPE_ERROR, "Invalid CTDataRate used", v5, 2u);
  }

  return (id)MEMORY[0x24BDBD1A8];
}

- (id)getLocalizedStringFromRATMode:(int)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  uint8_t v21[16];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_LTEOverrideTo4G)
    v7 = CFSTR("4G");
  else
    v7 = CFSTR("LTE");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (self->_3GOverrideTo4G)
    v11 = CFSTR("4G");
  else
    v11 = CFSTR("3G");
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24D5028C8, CFSTR("Cellular"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("2G");
      v16 = CFSTR("Cellular");
      goto LABEL_18;
    case 2:
      v19 = v12;
      goto LABEL_14;
    case 3:
      v19 = v8;
LABEL_14:
      v18 = v19;
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("5G_ON");
      goto LABEL_17;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("5G_AUTO");
LABEL_17:
      v16 = CFSTR("Aries");
LABEL_18:
      objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_24D5028C8, v16);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      -[PSUIVoiceAndDataSpecifier getLogger](self, "getLogger");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_error_impl(&dword_2161C6000, v17, OS_LOG_TYPE_ERROR, "Invalid PSRATMode used", v21, 2u);
      }

      v18 = &stru_24D5028C8;
      break;
  }

  return v18;
}

- (id)getLogger
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE85668];
  -[CTServiceDescriptor instance](self->_serviceDescriptor, "instance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggerWithCategory:instance:", CFSTR("VnD"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedDataRates, 0);
  objc_storeStrong((id *)&self->_deviceWifiState, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_carrierBundleCache, 0);
  objc_storeStrong((id *)&self->_regCache, 0);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_destroyWeak((id *)&self->_drillDownController);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_mobileDataGroup, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end
