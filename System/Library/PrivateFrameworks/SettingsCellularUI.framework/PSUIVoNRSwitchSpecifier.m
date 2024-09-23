@implementation PSUIVoNRSwitchSpecifier

- (PSUIVoNRSwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4 callCache:(id)a5 capabilitiesCache:(id)a6 carrierBundleCache:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  PSUIVoNRSwitchSpecifier *v17;
  uint64_t v18;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *instance;
  void *v24;
  id v26;
  id obj;
  objc_super v28;

  obj = a3;
  v26 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("VoNR"), &stru_24D5028C8, CFSTR("VONR-D63"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)PSUIVoNRSwitchSpecifier;
  v17 = -[PSUIVoNRSwitchSpecifier initWithName:target:set:get:detail:cell:edit:](&v28, sel_initWithName_target_set_get_detail_cell_edit_, v16, self, sel_setVoNREnabled_specifier_, sel_getVoNREnabled, 0, 6, 0);

  if (v17)
  {
    objc_storeWeak((id *)&v17->_listController, obj);
    objc_storeStrong((id *)&v17->_parentSpecifier, a4);
    objc_msgSend(v26, "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v18 = objc_claimAutoreleasedReturnValue();
    subscriptionContext = v17->_subscriptionContext;
    v17->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v18;

    objc_storeStrong((id *)&v17->_callCache, a5);
    objc_storeStrong((id *)&v17->_capabilitiesCache, a6);
    objc_storeStrong((id *)&v17->_carrierBundleCache, a7);
    objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v17->_subscriptionContext);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "instance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringValue");
    v22 = objc_claimAutoreleasedReturnValue();
    instance = v17->_instance;
    v17->_instance = (NSString *)v22;

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSUIVoNRSwitchSpecifier shouldEnableVoNRSwitchCell](v17, "shouldEnableVoNRSwitchCell"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIVoNRSwitchSpecifier setProperty:forKey:](v17, "setProperty:forKey:", v24, *MEMORY[0x24BE75A18]);

  -[PSUIVoNRSwitchSpecifier setProperty:forKey:](v17, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  return v17;
}

- (PSUIVoNRSwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PSUIVoNRSwitchSpecifier *v11;

  v6 = a4;
  v7 = a3;
  +[PSUICoreTelephonyCallCache sharedInstance](PSUICoreTelephonyCallCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PSUIVoNRSwitchSpecifier initWithHostController:parentSpecifier:callCache:capabilitiesCache:carrierBundleCache:](self, "initWithHostController:parentSpecifier:callCache:capabilitiesCache:carrierBundleCache:", v7, v6, v8, v9, v10);

  return v11;
}

- (BOOL)shouldEnableVoNRSwitchCell
{
  _BOOL4 v3;

  if (!-[PSUICoreTelephonyCallCache isAnyTelephonyCallActive](self->_callCache, "isAnyTelephonyCallActive")
    || (v3 = -[PSUICoreTelephonyCallCache isActiveCallVoNR](self->_callCache, "isActiveCallVoNR")))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)getVoNREnabled
{
  _BOOL8 v3;
  NSObject *v4;
  const char *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = -[PSUICoreTelephonyCapabilitiesCache capabilityEnabledVoNR:](self->_capabilitiesCache, "capabilityEnabledVoNR:", self->_subscriptionContext);
  -[PSUIVoNRSwitchSpecifier getLogger](self, "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "OFF";
    if (v3)
      v5 = "ON";
    v7 = 136315138;
    v8 = v5;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "VoNR state is : %s", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setVoNREnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "BOOLValue");
  -[PSUIVoNRSwitchSpecifier getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("disable");
    if ((_DWORD)v5)
      v7 = CFSTR("enable");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "attempting to %@ VoNR", (uint8_t *)&v8, 0xCu);
  }

  if ((v5 & 1) != 0
    || !-[PSUIVoNRSwitchSpecifier showDisableVoNRWarningsIfNeeded](self, "showDisableVoNRWarningsIfNeeded"))
  {
    -[PSUIVoNRSwitchSpecifier setVoNREnabled:](self, "setVoNREnabled:", v5);
  }
}

- (BOOL)showDisableVoNRWarningsIfNeeded
{
  _BOOL4 v3;

  v3 = -[PSUIVoNRSwitchSpecifier shouldShowCallWillEndWarning](self, "shouldShowCallWillEndWarning");
  if (v3)
    -[PSUIVoNRSwitchSpecifier showPhoneCallWillEndWarning](self, "showPhoneCallWillEndWarning");
  return v3;
}

- (BOOL)shouldShowCallWillEndWarning
{
  return -[PSUICoreTelephonyCallCache isActiveCallVoNR](self->_callCache, "isActiveCallVoNR");
}

- (void)showPhoneCallWillEndWarning
{
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  -[PSUIVoNRSwitchSpecifier getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "User tried to disable VoNR during a call, showing warning", v5, 2u);
  }

  -[PSUIVoNRSwitchSpecifier setUpPhoneCallWillEndWarningSpecifier](self, "setUpPhoneCallWillEndWarningSpecifier");
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "showConfirmationViewForSpecifier:", self->_phoneCallWillEndWarning);

}

- (void)setUpPhoneCallWillEndWarningSpecifier
{
  NSObject *v3;
  PSConfirmationSpecifier *v4;
  PSConfirmationSpecifier *phoneCallWillEndWarning;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PSConfirmationSpecifier *v14;
  void *v15;
  id v16;
  uint8_t buf[16];

  if (self->_phoneCallWillEndWarning)
  {
    -[PSUIVoNRSwitchSpecifier getLogger](self, "getLogger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEBUG, "Call will end warning has already been set up", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24D5028C8, self, 0, 0, 0, -1, 0);
    v4 = (PSConfirmationSpecifier *)objc_claimAutoreleasedReturnValue();
    phoneCallWillEndWarning = self->_phoneCallWillEndWarning;
    self->_phoneCallWillEndWarning = v4;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ON_CALL_CANCEL"), &stru_24D5028C8, CFSTR("VONR-D63"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v7, *MEMORY[0x24BE75970]);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ON_CALL_OK_DISABLE"), &stru_24D5028C8, CFSTR("VONR-D63"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v9, *MEMORY[0x24BE75980]);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("RAT_ON_CALL_WARNING_DISABLE_VONR"), &stru_24D5028C8, CFSTR("VONR-D63"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v11, *MEMORY[0x24BE75988]);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DISABLE_VONR"), &stru_24D5028C8, CFSTR("VONR-D63"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v13, *MEMORY[0x24BE75990]);

    -[PSConfirmationSpecifier setupWithDictionary:](self->_phoneCallWillEndWarning, "setupWithDictionary:", v16);
    v14 = self->_phoneCallWillEndWarning;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSConfirmationSpecifier setProperty:forKey:](v14, "setProperty:forKey:", v15, *MEMORY[0x24BE75978]);

    -[PSConfirmationSpecifier setConfirmationAction:](self->_phoneCallWillEndWarning, "setConfirmationAction:", sel_setVoNROff);
    -[PSConfirmationSpecifier setConfirmationCancelAction:](self->_phoneCallWillEndWarning, "setConfirmationCancelAction:", sel_reloadSelfInListController);

  }
}

- (void)setVoNREnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  -[PSUIVoNRSwitchSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "OFF";
    if (v3)
      v6 = "ON";
    v7 = 136315138;
    v8 = v6;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Setting VoNR state : %s", (uint8_t *)&v7, 0xCu);
  }

  -[PSUICoreTelephonyCapabilitiesCache setCapabilityVoNR:enabled:](self->_capabilitiesCache, "setCapabilityVoNR:enabled:", self->_subscriptionContext, v3);
  -[PSUIVoNRSwitchSpecifier reloadSelfInListController](self, "reloadSelfInListController");
}

- (void)setVoNROff
{
  -[PSUIVoNRSwitchSpecifier setVoNREnabled:](self, "setVoNREnabled:", 0);
  -[PSUIVoNRSwitchSpecifier reloadSelfInListController](self, "reloadSelfInListController");
}

- (void)reloadSelfInListController
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__PSUIVoNRSwitchSpecifier_reloadSelfInListController__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __53__PSUIVoNRSwitchSpecifier_reloadSelfInListController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));

}

- (id)groupFooterText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("VONR_SWITCH_EXPLANATION"), &stru_24D5028C8, CFSTR("VONR-D63"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PSUIVoNRSwitchSpecifier shouldAddVoNRUnoptimizedWarning](self, "shouldAddVoNRUnoptimizedWarning"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("VONR_SWITCH_UNSUPPORTED_WARNING"), &stru_24D5028C8, CFSTR("VONR-D63"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (BOOL)shouldAddVoNRUnoptimizedWarning
{
  return -[PSUICoreTelephonyCarrierBundleCache showVoNRWarningUnsupportedCarrier:](self->_carrierBundleCache, "showVoNRWarningUnsupportedCarrier:", self->_subscriptionContext);
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:instance:", CFSTR("VoNRSwitchSpecifier"), self->_instance);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
  objc_storeStrong((id *)&self->_carrierBundleCache, 0);
  objc_storeStrong((id *)&self->_capabilitiesCache, 0);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_storeStrong((id *)&self->_phoneCallWillEndWarning, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end
