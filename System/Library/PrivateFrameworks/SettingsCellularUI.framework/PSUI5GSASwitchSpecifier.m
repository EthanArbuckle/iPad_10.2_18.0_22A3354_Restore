@implementation PSUI5GSASwitchSpecifier

- (PSUI5GSASwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4 carrierBundleCache:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PSUI5GSASwitchSpecifier *v13;
  uint64_t v14;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *instance;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("5G_SA"), &stru_24D5028C8, CFSTR("Aries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)PSUI5GSASwitchSpecifier;
  v13 = -[PSUI5GSASwitchSpecifier initWithName:target:set:get:detail:cell:edit:](&v21, sel_initWithName_target_set_get_detail_cell_edit_, v12, self, sel_set5GSASwitch_specifier_, sel_is5GSAEnabled, 0, 6, 0);

  if (v13)
  {
    objc_storeWeak((id *)&v13->_listController, v8);
    objc_storeStrong((id *)&v13->_carrierBundleCache, a5);
    objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v14 = objc_claimAutoreleasedReturnValue();
    subscriptionContext = v13->_subscriptionContext;
    v13->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v14;

    objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v13->_subscriptionContext);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "instance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = objc_claimAutoreleasedReturnValue();
    instance = v13->_instance;
    v13->_instance = (NSString *)v18;

    -[PSUI5GSASwitchSpecifier checkNRStatusAndDisableIfNeeded](v13, "checkNRStatusAndDisableIfNeeded");
  }

  return v13;
}

- (id)is5GSAEnabled
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  +[PSUI5GStandaloneCache sharedInstance](PSUI5GStandaloneCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "is5GSAEnabledForContext:", self->_subscriptionContext));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)set5GSASwitch:(id)a3 specifier:(id)a4
{
  -[PSUI5GSASwitchSpecifier set5GSAEnabled:](self, "set5GSAEnabled:", objc_msgSend(a3, "BOOLValue"));
}

- (void)set5GSAEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  CTXPCServiceSubscriptionContext *v6;
  NSObject *v7;
  NSObject *v8;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  const __CFString *v10;
  CTXPCServiceSubscriptionContext *v11;
  int v12;
  void *v13;
  __int16 v14;
  CTXPCServiceSubscriptionContext *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  +[PSUI5GStandaloneCache sharedInstance](PSUI5GStandaloneCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set5GSAEnabled:forContext:", v3, self->_subscriptionContext);
  v6 = (CTXPCServiceSubscriptionContext *)objc_claimAutoreleasedReturnValue();

  -[PSUI5GSASwitchSpecifier getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      subscriptionContext = self->_subscriptionContext;
      v12 = 138412546;
      v13 = subscriptionContext;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "Failed to activate 5G SA for service: %@, error: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("Disabled");
    v11 = self->_subscriptionContext;
    if (v3)
      v10 = CFSTR("Enabled");
    v12 = 138412546;
    v13 = (void *)v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Successfully set 5G SA state to: %@ for service: %@", (uint8_t *)&v12, 0x16u);
  }

  -[PSUI5GSASwitchSpecifier refreshSpecifiersInHostController](self, "refreshSpecifiersInHostController");
}

- (id)groupFooterText
{
  void *v3;
  int v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  id v20;

  +[PSUI5GStandaloneCache sharedInstance](PSUI5GStandaloneCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "is5GSASwitchUserInteractableForContext:", self->_subscriptionContext);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("5G_STANDALONE_EXPLANATION"), &stru_24D5028C8, CFSTR("Aries"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[PSUI5GSASwitchSpecifier shouldAddDefaultOffCarrierFooterText](self, "shouldAddDefaultOffCarrierFooterText"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("5G_STANDALONE_DEFAULT_OFF_CARRIER_EXPLANATION"), &stru_24D5028C8, CFSTR("Aries"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (__CFString *)v9;
    }
    if (!-[PSUI5GSASwitchSpecifier shouldAddCoverageExtensionFooterText](self, "shouldAddCoverageExtensionFooterText"))
      goto LABEL_17;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("5G_STANDALONE_COVERAGE_EXTENSION_EXPLANATION"), &stru_24D5028C8, CFSTR("Aries"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v11;
    goto LABEL_16;
  }
  +[PSUI5GStandaloneCache sharedInstance](PSUI5GStandaloneCache, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "getSADisableStatusReasonMaskForContext:", self->_subscriptionContext);

  if ((*(_QWORD *)&v14 & 0x40008) == 0)
  {
    if ((v14 & 0x10000) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("5G_STANDALONE_DISABLED_LPM"), &stru_24D5028C8, CFSTR("Aries"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if ((v14 & 2) == 0)
      {
LABEL_17:
        v17 = v6;
        v16 = v17;
        goto LABEL_18;
      }
    }
    else
    {
      v6 = &stru_24D5028C8;
      if ((v14 & 2) == 0)
        goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("5G_STANDALONE_DISABLED_MSIM"), &stru_24D5028C8, CFSTR("Aries"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString length](v6, "length"))
    {
      -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("\n\n%@"), v10);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = v10;
      v10 = v20;
    }
    v12 = (uint64_t)v20;
LABEL_16:

    v6 = (__CFString *)v12;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = &stru_24D5028C8;
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("5G_STANDALONE_DISABLED"), &stru_24D5028C8, CFSTR("Aries"));
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v17;
}

- (BOOL)shouldAddDefaultOffCarrierFooterText
{
  return !-[PSUICoreTelephonyCarrierBundleCache is5GSAEnabledByDefault:](self->_carrierBundleCache, "is5GSAEnabledByDefault:", self->_subscriptionContext);
}

- (BOOL)shouldAddCoverageExtensionFooterText
{
  return -[PSUICoreTelephonyCarrierBundleCache show5GSACoverageExtension:](self->_carrierBundleCache, "show5GSACoverageExtension:", self->_subscriptionContext);
}

- (void)checkNRStatusAndDisableIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  +[PSUI5GStandaloneCache sharedInstance](PSUI5GStandaloneCache, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "is5GSASwitchUserInteractableForContext:", self->_subscriptionContext));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUI5GSASwitchSpecifier setProperty:forKey:](self, "setProperty:forKey:", v4, *MEMORY[0x24BE75A18]);

}

- (void)refreshSpecifiersInHostController
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__PSUI5GSASwitchSpecifier_refreshSpecifiersInHostController__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __60__PSUI5GSASwitchSpecifier_refreshSpecifiersInHostController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:instance:", CFSTR("SASwitch"), self->_instance);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_nrStatus, 0);
  objc_storeStrong((id *)&self->_carrierBundleCache, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end
