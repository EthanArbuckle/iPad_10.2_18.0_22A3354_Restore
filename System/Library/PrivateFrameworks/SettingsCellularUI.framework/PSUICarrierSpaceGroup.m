@implementation PSUICarrierSpaceGroup

- (PSUICarrierSpaceGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5 ctClient:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PSUICarrierSpaceGroup *v14;
  PSUICarrierSpaceGroup *v15;
  id v16;
  uint64_t v17;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *instance;
  void *v23;
  void *v24;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PSUICarrierSpaceGroup;
  v14 = -[PSUICarrierSpaceGroup init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_listController, v10);
    objc_storeWeak((id *)&v15->_groupSpecifier, v11);
    v16 = objc_storeWeak((id *)&v15->_parentSpecifier, v12);
    objc_msgSend(v12, "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v17 = objc_claimAutoreleasedReturnValue();
    subscriptionContext = v15->_subscriptionContext;
    v15->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v17;

    objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v15->_subscriptionContext);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "instance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringValue");
    v21 = objc_claimAutoreleasedReturnValue();
    instance = v15->_instance;
    v15->_instance = (NSString *)v21;

    objc_storeStrong((id *)&v15->_ctClient, a6);
    -[CoreTelephonyClient setDelegate:](v15->_ctClient, "setDelegate:", v15);
    -[PSUICarrierSpaceGroup setIsSubscriptionDataPreferred](v15, "setIsSubscriptionDataPreferred");
    -[PSUICarrierSpaceGroup prepareSpecifiers](v15, "prepareSpecifiers");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v15, sel_carrierSpaceChanged, 0x24D506868, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v15, sel_newCarrierNotification, CFSTR("PSNewCarrierNotification"), 0);

  }
  return v15;
}

- (void)refreshSpecifiers
{
  _QWORD block[5];

  -[PSUICarrierSpaceGroup prepareSpecifiers](self, "prepareSpecifiers");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__PSUICarrierSpaceGroup_refreshSpecifiers__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __42__PSUICarrierSpaceGroup_refreshSpecifiers__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "listController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSpecifiers");

}

- (void)prepareSpecifiers
{
  NSDictionary *v3;
  NSDictionary *specifersByID;
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  void *v14;
  id v15;

  v3 = (NSDictionary *)objc_opt_new();
  specifersByID = self->_specifersByID;
  self->_specifersByID = v3;

  -[PSUICarrierSpaceGroup cellularPlansSpecifier](self, "cellularPlansSpecifier");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v5 = self->_specifersByID;
    objc_msgSend(v15, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setValue:forKey:](v5, "setValue:forKey:", v15, v6);

  }
  -[PSUICarrierSpaceGroup usageSpecifier](self, "usageSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = self->_specifersByID;
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setValue:forKey:](v9, "setValue:forKey:", v8, v10);

  }
  -[PSUICarrierSpaceGroup carrierServicesSpecifier](self, "carrierServicesSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = self->_specifersByID;
    objc_msgSend(v11, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setValue:forKey:](v13, "setValue:forKey:", v12, v14);

  }
}

- (id)carrierServicesSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PSUIMyAccountSpecifier *v18;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  void *v20;
  PSUIMyAccountSpecifier *v21;
  NSObject *v22;
  id WeakRetained;
  void *v24;
  void *v25;
  PSUIMyAccountSpecifier *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  PSUIMyAccountSpecifier *v32;
  uint8_t v33[16];
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t buf[16];

  if (self->_isSubscriptionDataPreferred)
  {
    -[PSUICarrierSpaceGroup capabilities](self, "capabilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "supportsApplications"))
    {
      +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appsInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appsList");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count") != 0;

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
  +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "carrierServices:", self->_subscriptionContext);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
    v11 = 0;
  else
    v11 = !v7;
  if (v11)
  {
    v18 = [PSUIMyAccountSpecifier alloc];
    subscriptionContext = self->_subscriptionContext;
    +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PSUIMyAccountSpecifier initWithContext:cbCache:](v18, "initWithContext:cbCache:", subscriptionContext, v20);

    if (v21)
    {
      -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_2161C6000, v22, OS_LOG_TYPE_DEFAULT, "My account specifier found. Returning My Account Specifier for Carrier Services.", v35, 2u);
      }

      WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      -[PSUIMyAccountSpecifier setHostController:](v21, "setHostController:", WeakRetained);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CARRIER_SERVICES"), &stru_24D5028C8, CFSTR("CarrierSpace"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIMyAccountSpecifier setName:](v21, "setName:", v25);

      -[PSUIMyAccountSpecifier setIdentifier:](v21, "setIdentifier:", CFSTR("PSCarrierSpaceCarrierServicesSpecifierKey"));
      v26 = v21;
    }
    else
    {
      +[PSUICarrierServicesSpecifierCache sharedInstance](PSUICarrierServicesSpecifierCache, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "mmsInfoSpecifierWithTarget:context:", self, self->_subscriptionContext);
      v26 = (PSUIMyAccountSpecifier *)objc_claimAutoreleasedReturnValue();

      -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v29)
        {
          *(_WORD *)v34 = 0;
          _os_log_impl(&dword_2161C6000, v28, OS_LOG_TYPE_DEFAULT, "MMS Info Specifier found. Returning MMS Info specifier for Carrier Services.", v34, 2u);
        }

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("CARRIER_SERVICES"), &stru_24D5028C8, CFSTR("CarrierSpace"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSUIMyAccountSpecifier setName:](v26, "setName:", v31);

        -[PSUIMyAccountSpecifier setIdentifier:](v26, "setIdentifier:", CFSTR("PSCarrierSpaceCarrierServicesSpecifierKey"));
        v32 = v26;
      }
      else
      {
        if (v29)
        {
          *(_WORD *)v33 = 0;
          _os_log_impl(&dword_2161C6000, v28, OS_LOG_TYPE_DEFAULT, "No specifier found for Carrier Services.", v33, 2u);
        }

      }
    }

    return v26;
  }
  else
  {
    -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "Carrier services or apps available. Returning PSLinkListCell specifier for Carrier Services.", buf, 2u);
    }

    v13 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CARRIER_SERVICES"), &stru_24D5028C8, CFSTR("CarrierSpace"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setIdentifier:", CFSTR("PSCarrierSpaceCarrierServicesSpecifierKey"));
    objc_msgSend(v16, "setProperty:forKey:", self->_subscriptionContext, *MEMORY[0x24BE75CE8]);
    return v16;
  }
}

- (id)cellularPlansSpecifier
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  if (self->_isSubscriptionDataPreferred)
  {
    +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "capabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICarrierSpaceGroup setCapabilities:](self, "setCapabilities:", v4);

    v5 = objc_msgSend(v3, "hasUserConsent");
    -[PSUICarrierSpaceGroup capabilities](self, "capabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "supportsPlans"))
    {
      if ((v5 & 1) != 0)
      {
        objc_msgSend(v3, "plansInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "planGroupsList");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (!v9)
          goto LABEL_8;
      }
      else
      {

      }
      v11 = objc_msgSend(v3, "planChangeIsRestricted");
      -[PSUICarrierSpaceGroup descriptionForPlans:](self, "descriptionForPlans:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (!v11 || (v10 = 0, v13))
      {
        if (v11)
          v14 = 4;
        else
          v14 = 2;
        if (((v11 | v5 ^ 1) & 1) != 0)
        {
          v15 = 0;
        }
        else
        {
          v15 = objc_opt_class();
          v14 = 2;
        }
        v16 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PLANS"), &stru_24D5028C8, CFSTR("CarrierSpace"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, 0, sel_descriptionForPlans_, v15, v14, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v5 & 1) == 0)
        {
          objc_msgSend(v10, "setButtonAction:", sel_showConsentFlow_);
          objc_msgSend(v10, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
        }
        objc_msgSend(v10, "setIdentifier:", CFSTR("PSCarrierSpaceCellularPlansSpeciferKey"));
      }
      goto LABEL_21;
    }

LABEL_8:
    v10 = 0;
LABEL_21:

    return v10;
  }
  v10 = 0;
  return v10;
}

- (id)usageSpecifier
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (self->_isSubscriptionDataPreferred)
  {
    +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "capabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICarrierSpaceGroup setCapabilities:](self, "setCapabilities:", v4);

    v5 = objc_msgSend(v3, "hasUserConsent");
    -[PSUICarrierSpaceGroup capabilities](self, "capabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "supportsUsage"))
    {
      if ((v5 & 1) == 0)
      {

        v10 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v3, "usageInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountMetrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        v10 = objc_opt_class();
LABEL_10:
        v12 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("USAGE"), &stru_24D5028C8, CFSTR("CarrierSpace"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, sel_descriptionForUsage_, v10, 2, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v5 & 1) == 0)
        {
          objc_msgSend(v11, "setButtonAction:", sel_showConsentFlow_);
          objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
        }
        objc_msgSend(v11, "setIdentifier:", CFSTR("PSCarrierSpaceUsageSpecifierKey"));
        goto LABEL_13;
      }
    }
    else
    {

    }
    v11 = 0;
LABEL_13:

    return v11;
  }
  v11 = 0;
  return v11;
}

- (void)setIsSubscriptionDataPreferred
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  __int16 v12;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDataSubscriptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_subscriptionContext)
  {
    -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "Subscription is not set", buf, 2u);
    }
    goto LABEL_11;
  }
  if (v4)
  {
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTXPCServiceSubscriptionContext uuid](self->_subscriptionContext, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7)
    {
      self->_isSubscriptionDataPreferred = 1;
      -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 0;
        v9 = "Subscription is data preferred";
        v10 = (uint8_t *)&v12;
LABEL_10:
        _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }
    else
    {
      -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 0;
        v9 = "Subscription is not data preferred";
        v10 = (uint8_t *)&v11;
        goto LABEL_10;
      }
    }
LABEL_11:

  }
}

- (void)newCarrierNotification
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PSUICarrierSpaceGroup newCarrierNotification]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s reloading specifiers", (uint8_t *)&v4, 0xCu);
  }

  -[PSUICarrierSpaceGroup refreshSpecifiers](self, "refreshSpecifiers");
}

- (id)descriptionForPlans:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasUserConsent");

  if (v4)
  {
    +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscribedPlanOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscribedDomesticPlanOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count"))
    {
      v9 = &stru_24D5028C8;
LABEL_12:

      return v9;
    }
    if (objc_msgSend(v6, "count") == 1)
    {
      v8 = v6;
    }
    else
    {
      if (objc_msgSend(v7, "count") != 1)
      {
        v11 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("%@_PLANS"), &stru_24D5028C8, CFSTR("CarrierSpace"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x24BDD16F0];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringFromNumber:numberStyle:", v14, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", v12, v15);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      v8 = v7;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "planLabel");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  v9 = &stru_24D5028C8;
  return v9;
}

- (id)descriptionForUsage:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasUserConsent");

  if (v4)
  {
    +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "planMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "descriptionForPlanMetrics:", v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = &stru_24D5028C8;
    }

  }
  else
  {
    v8 = &stru_24D5028C8;
  }
  return v8;
}

- (void)carrierSpaceChanged
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PSUICarrierSpaceGroup carrierSpaceChanged]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s reloading specifiers", (uint8_t *)&v4, 0xCu);
  }

  -[PSUICarrierSpaceGroup refreshSpecifiers](self, "refreshSpecifiers");
}

- (void)showConsentFlow:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  PSUICarrierSpaceOptInSplashScreen *v9;
  id WeakRetained;
  PSUICarrierSpaceOptInSplashScreen *v11;
  PSUICarrierSpaceOptInSplashScreen *optInSplashScreen;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;
  uint8_t buf[8];

  v4 = a3;
  -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Showing carrier space consent flow", buf, 2u);
  }

  +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userConsentFlowInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "webURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = [PSUICarrierSpaceOptInSplashScreen alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    v11 = -[PSUICarrierSpaceOptInSplashScreen initWithParent:](v9, "initWithParent:", WeakRetained);
    optInSplashScreen = self->_optInSplashScreen;
    self->_optInSplashScreen = v11;

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    location = 0;
    objc_initWeak(&location, self->_optInSplashScreen);
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __41__PSUICarrierSpaceGroup_showConsentFlow___block_invoke;
    v18 = &unk_24D501D30;
    objc_copyWeak(&v20, (id *)buf);
    objc_copyWeak(&v21, &location);
    v19 = v7;
    -[PSUICarrierSpaceOptInSplashScreen setContinueButtonAction:](self->_optInSplashScreen, "setContinueButtonAction:", &v15);
    v13 = objc_loadWeakRetained((id *)&self->_listController);
    objc_msgSend(v13, "navigationController", v15, v16, v17, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pushViewController:animated:", self->_optInSplashScreen, 1);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

}

void __41__PSUICarrierSpaceGroup_showConsentFlow___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "showTermsAndConditions:consentFlowInfo:", v2, *(_QWORD *)(a1 + 32));

}

- (void)showTermsAndConditions:(id)a3 consentFlowInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  RemoteUIController *v14;
  RemoteUIController *remoteUIController;
  RemoteUIController *v16;
  void *v17;
  void *v18;
  void *v19;
  RemoteUIController *v20;
  uint64_t v21;
  void *v22;
  RemoteUIController *v23;
  uint64_t v24;
  RemoteUIController *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  _QWORD v30[5];
  NSObject *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[8];
  uint64_t v37;
  Class (*v38)(uint64_t);
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  v6 = a3;
  v7 = a4;
  -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Showing carrier terms and conditions", buf, 2u);
  }

  objc_msgSend(v7, "webURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v42 = &v41;
    v43 = 0x2050000000;
    v11 = (void *)_MergedGlobals_63;
    v44 = _MergedGlobals_63;
    v12 = MEMORY[0x24BDAC760];
    if (!_MergedGlobals_63)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v37 = 3221225472;
      v38 = __getRemoteUIControllerClass_block_invoke;
      v39 = &unk_24D5018D0;
      v40 = &v41;
      __getRemoteUIControllerClass_block_invoke((uint64_t)buf);
      v11 = (void *)v42[3];
    }
    v13 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v41, 8);
    v14 = (RemoteUIController *)objc_alloc_init(v13);
    remoteUIController = self->_remoteUIController;
    self->_remoteUIController = v14;

    -[RemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", self);
    v29 = v6;
    -[RemoteUIController setHostViewController:](self->_remoteUIController, "setHostViewController:", v6);
    v16 = self->_remoteUIController;
    +[PSUICarrierSpaceManager getNSURLSessionConfiguration](PSUICarrierSpaceManager, "getNSURLSessionConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUIController setSessionConfiguration:](v16, "setSessionConfiguration:", v17);

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v18, "sf_isInternalInstall");

    if ((_DWORD)v17)
    {
      -[RemoteUIController loader](self->_remoteUIController, "loader");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAllowNonSecureHTTP:", 1);

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v20 = self->_remoteUIController;
    v34[0] = v12;
    v34[1] = 3221225472;
    v34[2] = __64__PSUICarrierSpaceGroup_showTermsAndConditions_consentFlowInfo___block_invoke;
    v34[3] = &unk_24D501D58;
    v34[4] = self;
    objc_copyWeak(&v35, (id *)buf);
    -[RemoteUIController setHandlerForElementName:handler:](v20, "setHandlerForElementName:handler:", CFSTR("agree"), v34);
    v21 = v12;
    v22 = (void *)v10;
    v23 = self->_remoteUIController;
    v24 = v21;
    v32[0] = v21;
    v32[1] = 3221225472;
    v32[2] = __64__PSUICarrierSpaceGroup_showTermsAndConditions_consentFlowInfo___block_invoke_54;
    v32[3] = &unk_24D501D58;
    v32[4] = self;
    objc_copyWeak(&v33, (id *)buf);
    -[RemoteUIController setHandlerForElementName:handler:](v23, "setHandlerForElementName:handler:", CFSTR("disagree"), v32);
    v25 = self->_remoteUIController;
    objc_msgSend(v7, "postData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dataUsingEncoding:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v24;
    v30[1] = 3221225472;
    v30[2] = __64__PSUICarrierSpaceGroup_showTermsAndConditions_consentFlowInfo___block_invoke_55;
    v30[3] = &unk_24D501D80;
    v30[4] = self;
    v28 = v22;
    v31 = v28;
    -[RemoteUIController loadURL:postBody:completion:](v25, "loadURL:postBody:completion:", v28, v27, v30);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
    v6 = v29;
  }
  else
  {
    -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v28, OS_LOG_TYPE_DEFAULT, "No carrier space consent url", buf, 2u);
    }
  }

}

void __64__PSUICarrierSpaceGroup_showTermsAndConditions_consentFlowInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "Agree pressed for carrier terms and conditions", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "agreePressed");

  +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserConsent:", 1);

}

void __64__PSUICarrierSpaceGroup_showTermsAndConditions_consentFlowInfo___block_invoke_54(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "Disagree pressed for carrier terms and conditions", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "disagreeOrCancelPressed");

  +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserConsent:", 0);

}

void __64__PSUICarrierSpaceGroup_showTermsAndConditions_consentFlowInfo___block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Could not load consent url: %@, success: %@, error: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)openURLWithSpecifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a3, "propertyForKey:", CFSTR("url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x24BEBDF78], "openURL:options:completionHandler:", v5, MEMORY[0x24BDBD1B8], 0);
}

- (void)agreePressed
{
  NSObject *v3;
  PSListController **p_listController;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint8_t v10[16];

  -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Agree pressed", v10, 2u);
  }

  p_listController = &self->_listController;
  WeakRetained = objc_loadWeakRetained((id *)p_listController);
  objc_msgSend(WeakRetained, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  v7 = objc_loadWeakRetained((id *)p_listController);
  objc_msgSend(v7, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 0);

}

- (void)disagreeOrCancelPressed
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  uint8_t v6[16];

  -[PSUICarrierSpaceGroup getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Disagree or cancel pressed", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x24BEBD410];
  v6 = a4;
  v9 = (id)objc_msgSend([v5 alloc], "initWithBarButtonSystemItem:target:action:", 1, self, sel_disagreeOrCancelPressed);
  objc_msgSend(v6, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:animated:", v9, 0);

}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  _BOOL8 v4;
  id v5;

  v4 = objc_msgSend(a4, "statusCode", a3) == 200;
  +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userConsentAcknowledged:", v4);

}

- (id)specifierForID:(id)a3
{
  return -[NSDictionary valueForKey:](self->_specifersByID, "valueForKey:", a3);
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:instance:", CFSTR("CSGroup"), self->_instance);
}

- (RemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (void)setRemoteUIController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIController, a3);
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (PSSpecifier)groupSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_groupSpecifier);
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_groupSpecifier, a3);
}

- (PSSpecifier)parentSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_parentSpecifier);
}

- (void)setParentSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_parentSpecifier, a3);
}

- (CTCarrierSpaceCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (PSUICarrierSpaceOptInSplashScreen)optInSplashScreen
{
  return self->_optInSplashScreen;
}

- (void)setOptInSplashScreen:(id)a3
{
  objc_storeStrong((id *)&self->_optInSplashScreen, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optInSplashScreen, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_specifersByID, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end
