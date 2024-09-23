@implementation PSUIVoLTESwitchSpecifier

- (PSUIVoLTESwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4 callCache:(id)a5 capabilitiesCache:(id)a6 carrierBundleCache:(id)a7 simStatusCache:(id)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  PSUIVoLTESwitchSpecifier *v18;
  uint64_t v19;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  void *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v26 = a5;
  v25 = a6;
  v24 = a7;
  v23 = a8;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("VoLTE"), &stru_24D5028C8, CFSTR("VOLTE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)PSUIVoLTESwitchSpecifier;
  v18 = -[PSUIVoLTESwitchSpecifier initWithName:target:set:get:detail:cell:edit:](&v27, sel_initWithName_target_set_get_detail_cell_edit_, v17, self, sel_setVoLTEEnabled_specifier_, sel_getVoLTEEnabled, 0, 6, 0);

  if (v18)
  {
    objc_storeWeak((id *)&v18->_listController, v14);
    objc_storeStrong((id *)&v18->_parentSpecifier, a4);
    objc_msgSend(v15, "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v19 = objc_claimAutoreleasedReturnValue();
    subscriptionContext = v18->_subscriptionContext;
    v18->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v19;

    objc_storeStrong((id *)&v18->_callCache, a5);
    objc_storeStrong((id *)&v18->_capabilitiesCache, a6);
    objc_storeStrong((id *)&v18->_carrierBundleCache, a7);
    objc_storeStrong((id *)&v18->_simStatusCache, a8);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSUIVoLTESwitchSpecifier shouldEnableVoLTESwitchCell](v18, "shouldEnableVoLTESwitchCell"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIVoLTESwitchSpecifier setProperty:forKey:](v18, "setProperty:forKey:", v21, *MEMORY[0x24BE75A18]);

  return v18;
}

- (PSUIVoLTESwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PSUIVoLTESwitchSpecifier *v12;

  v6 = a4;
  v7 = a3;
  +[PSUICoreTelephonyCallCache sharedInstance](PSUICoreTelephonyCallCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICoreTelephonyCapabilitiesCache sharedInstance](PSUICoreTelephonyCapabilitiesCache, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PSUIVoLTESwitchSpecifier initWithHostController:parentSpecifier:callCache:capabilitiesCache:carrierBundleCache:simStatusCache:](self, "initWithHostController:parentSpecifier:callCache:capabilitiesCache:carrierBundleCache:simStatusCache:", v7, v6, v8, v9, v10, v11);

  return v12;
}

- (BOOL)shouldEnableVoLTESwitchCell
{
  _BOOL4 v3;

  if (!-[PSUICoreTelephonyCallCache isAnyTelephonyCallActive](self->_callCache, "isAnyTelephonyCallActive")
    || (v3 = -[PSUICoreTelephonyCallCache isActiveCallVoLTE](self->_callCache, "isActiveCallVoLTE")))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)getVoLTEEnabled
{
  _BOOL8 v3;
  NSObject *v4;
  const char *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = -[PSUICoreTelephonyCapabilitiesCache capabilityEnabledVoLTE:](self->_capabilitiesCache, "capabilityEnabledVoLTE:", self->_subscriptionContext);
  -[PSUIVoLTESwitchSpecifier getLogger](self, "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "OFF";
    if (v3)
      v5 = "ON";
    v7 = 136315138;
    v8 = v5;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "VoLTE state is: %s", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setVoLTEEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "BOOLValue");
  -[PSUIVoLTESwitchSpecifier getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("disable");
    if ((_DWORD)v5)
      v7 = CFSTR("enable");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "attempting to %@ VoLTE", (uint8_t *)&v8, 0xCu);
  }

  if (!-[PSUIVoLTESwitchSpecifier showWarningsIfNeededForEnableState:](self, "showWarningsIfNeededForEnableState:", v5))
    -[PSUIVoLTESwitchSpecifier setVoLTEEnabled:](self, "setVoLTEEnabled:", v5);
}

- (BOOL)showWarningsIfNeededForEnableState:(BOOL)a3
{
  if (a3)
    return -[PSUIVoLTESwitchSpecifier showEnableVoLTEWarningsIfNeeded](self, "showEnableVoLTEWarningsIfNeeded");
  else
    return -[PSUIVoLTESwitchSpecifier showDisableVoLTEWarningsIfNeeded](self, "showDisableVoLTEWarningsIfNeeded");
}

- (BOOL)showEnableVoLTEWarningsIfNeeded
{
  _BOOL4 v3;

  v3 = -[PSUIVoLTESwitchSpecifier shouldShowCallCarrierAlert](self, "shouldShowCallCarrierAlert");
  if (v3)
    -[PSUIVoLTESwitchSpecifier showCallCarrierAlert](self, "showCallCarrierAlert");
  return v3;
}

- (BOOL)showDisableVoLTEWarningsIfNeeded
{
  _BOOL4 v3;

  v3 = -[PSUIVoLTESwitchSpecifier shouldShowCallWillEndWarning](self, "shouldShowCallWillEndWarning");
  if (v3)
    -[PSUIVoLTESwitchSpecifier showPhoneCallWillEndWarning](self, "showPhoneCallWillEndWarning");
  return v3;
}

- (BOOL)shouldShowCallCarrierAlert
{
  return -[PSUICoreTelephonyCapabilitiesCache cannotChangeVoLTESettingCallCarrier:](self->_capabilitiesCache, "cannotChangeVoLTESettingCallCarrier:", self->_subscriptionContext);
}

- (BOOL)shouldShowVoLTEUnsupportedWarning
{
  return -[PSUICoreTelephonyCarrierBundleCache showVolteWarningUnsupportedCarrier:](self->_carrierBundleCache, "showVolteWarningUnsupportedCarrier:", self->_subscriptionContext);
}

- (BOOL)shouldShowCallWillEndWarning
{
  int v3;

  v3 = -[PSUICoreTelephonyCallCache isActiveCallVoLTE](self->_callCache, "isActiveCallVoLTE");
  if (v3)
    LOBYTE(v3) = -[PSSimStatusCache isSlotActiveDataSlot:](self->_simStatusCache, "isSlotActiveDataSlot:", -[CTXPCServiceSubscriptionContext slotID](self->_subscriptionContext, "slotID"));
  return v3;
}

- (void)showPhoneCallWillEndWarning
{
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  -[PSUIVoLTESwitchSpecifier getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "User tried to disable VoLTE during a call, showing warning", v5, 2u);
  }

  -[PSUIVoLTESwitchSpecifier setUpPhoneCallWillEndWarningSpecifier](self, "setUpPhoneCallWillEndWarningSpecifier");
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "showConfirmationViewForSpecifier:", self->_phoneCallWillEndWarning);

}

- (void)setUpPhoneCallWillEndWarningSpecifier
{
  PSConfirmationSpecifier *v3;
  PSConfirmationSpecifier *phoneCallWillEndWarning;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PSConfirmationSpecifier *v13;
  void *v14;
  id v15;

  if (!self->_phoneCallWillEndWarning)
  {
    objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24D5028C8, self, 0, 0, 0, -1, 0);
    v3 = (PSConfirmationSpecifier *)objc_claimAutoreleasedReturnValue();
    phoneCallWillEndWarning = self->_phoneCallWillEndWarning;
    self->_phoneCallWillEndWarning = v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ON_CALL_CANCEL"), &stru_24D5028C8, CFSTR("VOLTE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v6, *MEMORY[0x24BE75970]);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ON_CALL_OK_DISABLE"), &stru_24D5028C8, CFSTR("VOLTE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v8, *MEMORY[0x24BE75980]);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RAT_ON_CALL_WARNING_DISABLE_VOLTE"), &stru_24D5028C8, CFSTR("VOLTE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v10, *MEMORY[0x24BE75988]);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DISABLE_VOLTE"), &stru_24D5028C8, CFSTR("VOLTE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v12, *MEMORY[0x24BE75990]);

    -[PSConfirmationSpecifier setupWithDictionary:](self->_phoneCallWillEndWarning, "setupWithDictionary:", v15);
    v13 = self->_phoneCallWillEndWarning;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSConfirmationSpecifier setProperty:forKey:](v13, "setProperty:forKey:", v14, *MEMORY[0x24BE75978]);

    -[PSConfirmationSpecifier setConfirmationAction:](self->_phoneCallWillEndWarning, "setConfirmationAction:", sel_setVoLTEOff);
    -[PSConfirmationSpecifier setConfirmationCancelAction:](self->_phoneCallWillEndWarning, "setConfirmationCancelAction:", sel_reloadSelfInListController);

  }
}

- (void)setVoLTEEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUIVoLTESwitchSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "OFF";
    if (v3)
      v6 = "ON";
    *(_DWORD *)buf = 136315138;
    v9 = v6;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Setting VoLTE state : %s", buf, 0xCu);
  }

  -[PSUICoreTelephonyCapabilitiesCache setCapabilityVoLTE:enabled:](self->_capabilitiesCache, "setCapabilityVoLTE:enabled:", self->_subscriptionContext, v3);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__PSUIVoLTESwitchSpecifier_setVoLTEEnabled___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __44__PSUIVoLTESwitchSpecifier_setVoLTEEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (void)setVoLTEOff
{
  -[PSUIVoLTESwitchSpecifier setVoLTEEnabled:](self, "setVoLTEEnabled:", 0);
  -[PSUIVoLTESwitchSpecifier reloadSelfInListController](self, "reloadSelfInListController");
}

- (void)reloadSelfInListController
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__PSUIVoLTESwitchSpecifier_reloadSelfInListController__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __54__PSUIVoLTESwitchSpecifier_reloadSelfInListController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));

}

- (void)showCallCarrierAlert
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  -[PSUIVoLTESwitchSpecifier createCallCarrierAlertForContext:](self, "createCallCarrierAlertForContext:", self->_subscriptionContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v3, 1, 0);

}

- (id)createCallCarrierAlertForContext:(id)a3
{
  PSSpecifier *parentSpecifier;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  PSUIVoLTESwitchSpecifier *v43;

  parentSpecifier = self->_parentSpecifier;
  v5 = a3;
  -[PSSpecifier propertyForKey:](parentSpecifier, "propertyForKey:", 0x24D504988);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SETUP_VOICE_ALERT_TITLE_LTE_AS_4G"), &stru_24D5028C8, CFSTR("VOLTE"));
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("SETUP_VOICE_ALERT_BODY_FORMAT_LTE_AS_4G");
  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SETUP_VOICE_ALERT_TITLE_LTE"), &stru_24D5028C8, CFSTR("VOLTE"));
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("SETUP_VOICE_ALERT_BODY_FORMAT_LTE");
  }
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24D5028C8, CFSTR("VOLTE"));
  v14 = objc_claimAutoreleasedReturnValue();

  -[PSUICoreTelephonyCarrierBundleCache carrierName:](self->_carrierBundleCache, "carrierName:", v5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v14, v34);
  v15 = objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyCarrierBundleCache volteCustomerCarePhoneNumber:](self->_carrierBundleCache, "volteCustomerCarePhoneNumber:", v5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyCarrierBundleCache volteCustomerCareWebsite:](self->_carrierBundleCache, "volteCustomerCareWebsite:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)v14;
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v36 = (void *)v10;
  v33 = (void *)v15;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v10, v15, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  if (v37)
  {
    v20 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SETUP_VOICE_OPTION_CALL"), &stru_24D5028C8, CFSTR("VOLTE"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v19;
    v41[1] = 3221225472;
    v41[2] = __61__PSUIVoLTESwitchSpecifier_createCallCarrierAlertForContext___block_invoke;
    v41[3] = &unk_24D501B58;
    v42 = v37;
    v43 = self;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 0, v41);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v23);

  }
  if (v17)
  {
    v24 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SETUP_VOICE_OPTION_WEBSITE"), &stru_24D5028C8, CFSTR("VOLTE"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v19;
    v39[1] = 3221225472;
    v39[2] = __61__PSUIVoLTESwitchSpecifier_createCallCarrierAlertForContext___block_invoke_53;
    v39[3] = &unk_24D5017B8;
    v40 = v17;
    objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 0, v39);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v27);

  }
  v28 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("SETUP_VOICE_CANCEL"), &stru_24D5028C8, CFSTR("VOLTE"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v19;
  v38[1] = 3221225472;
  v38[2] = __61__PSUIVoLTESwitchSpecifier_createCallCarrierAlertForContext___block_invoke_2;
  v38[3] = &unk_24D5017B8;
  v38[4] = self;
  objc_msgSend(v28, "actionWithTitle:style:handler:", v30, 1, v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v31);

  return v18;
}

void __61__PSUIVoLTESwitchSpecifier_createCallCarrierAlertForContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 buf;
  void *v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v4 = (void *)_MergedGlobals_1_6;
  v24 = _MergedGlobals_1_6;
  if (!_MergedGlobals_1_6)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v26 = __getTUCallCapabilitiesClass_block_invoke;
    v27 = &unk_24D5018D0;
    v28 = &v21;
    __getTUCallCapabilitiesClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v22[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v21, 8);
  if (objc_msgSend(v5, "supportsTelephonyCalls", v21))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v6 = (void *)qword_253E97170;
    v24 = qword_253E97170;
    if (!qword_253E97170)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v26 = __getTUHandleClass_block_invoke;
      v27 = &unk_24D5018D0;
      v28 = &v21;
      __getTUHandleClass_block_invoke((uint64_t)&buf);
      v6 = (void *)v22[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v21, 8);
    v8 = [v7 alloc];
    v9 = (void *)objc_msgSend(v8, "initWithType:value:", 2, *(_QWORD *)(a1 + 32), v21);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v10 = (void *)qword_253E97178;
    v24 = qword_253E97178;
    if (!qword_253E97178)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v26 = __getTUCallProviderManagerClass_block_invoke;
      v27 = &unk_24D5018D0;
      v28 = &v21;
      __getTUCallProviderManagerClass_block_invoke((uint64_t)&buf);
      v10 = (void *)v22[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v21, 8);
    v12 = objc_alloc_init(v11);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v13 = (void *)qword_253E97180;
    v24 = qword_253E97180;
    if (!qword_253E97180)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v26 = __getTUDialRequestClass_block_invoke;
      v27 = &unk_24D5018D0;
      v28 = &v21;
      __getTUDialRequestClass_block_invoke((uint64_t)&buf);
      v13 = (void *)v22[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v21, 8);
    v15 = [v14 alloc];
    objc_msgSend(v12, "defaultProvider", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithProvider:", v16);

    objc_msgSend(v17, "setHandle:", v9);
    objc_msgSend(v17, "setShowUIPrompt:", 1);
    if (objc_msgSend(v17, "isValid"))
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject openURL:options:completionHandler:](v18, "openURL:options:completionHandler:", v19, MEMORY[0x24BDBD1B8], 0);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "getLogger");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v17, "URL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_2161C6000, v18, OS_LOG_TYPE_DEFAULT, "Invalid dial url: %@", (uint8_t *)&buf, 0xCu);

      }
    }

  }
}

void __61__PSUIVoLTESwitchSpecifier_createCallCarrierAlertForContext___block_invoke_53(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:options:completionHandler:", *(_QWORD *)(a1 + 32), MEMORY[0x24BDBD1B8], 0);

}

uint64_t __61__PSUIVoLTESwitchSpecifier_createCallCarrierAlertForContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSelfInListController");
}

- (void)addSpinnerIfNeededToCell:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[PSUIVoLTESwitchSpecifier isVoLTEProvisioning](self, "isVoLTEProvisioning"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v4, "startAnimating");
    objc_msgSend(v5, "setAccessoryView:", v4);

  }
}

- (BOOL)isVoLTEProvisioning
{
  return -[PSUICoreTelephonyCapabilitiesCache isVoLTEStillProvisioningForContext:](self->_capabilitiesCache, "isVoLTEStillProvisioningForContext:", self->_subscriptionContext);
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
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("VOLTE_SWITCH_EXPLANATION"), &stru_24D5028C8, CFSTR("VOLTE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PSUIVoLTESwitchSpecifier shouldShowVoLTEUnsupportedWarning](self, "shouldShowVoLTEUnsupportedWarning"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("VOLTE_UNSUPPORTED_WARNING"), &stru_24D5028C8, CFSTR("VOLTE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (id)getLogger
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BE85668];
  objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", self->_subscriptionContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggerWithCategory:instance:", CFSTR("VoLTESwitchSpecifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_carrierBundleCache, 0);
  objc_storeStrong((id *)&self->_capabilitiesCache, 0);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_storeStrong((id *)&self->_phoneCallWillEndWarning, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end
