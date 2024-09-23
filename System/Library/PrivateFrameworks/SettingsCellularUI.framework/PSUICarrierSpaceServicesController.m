@implementation PSUICarrierSpaceServicesController

- (void)simStatusChanged
{
  NSObject *v3;
  void *v4;
  int v5;
  id WeakRetained;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceServicesController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[PSUICarrierSpaceServicesController simStatusChanged]";
    v10 = 2112;
    v11 = CFSTR("PSCarrierSpaceSIMStatusChanged");
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSIMMissing");

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x24BE757A0]));
    v7 = (id)objc_msgSend(WeakRetained, "popViewControllerAnimated:", 1);

  }
}

- (void)carrierSpaceChanged
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceServicesController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[PSUICarrierSpaceServicesController carrierSpaceChanged]";
    v6 = 2112;
    v7 = CFSTR("PSUICarrierSpaceChanged");
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification: %@", (uint8_t *)&v4, 0x16u);
  }

  -[PSUICarrierSpaceServicesController reloadSpecifiers](self, "reloadSpecifiers");
}

- (PSUICarrierSpaceServicesController)initWithNibName:(id)a3 bundle:(id)a4
{
  PSUICarrierSpaceServicesController *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSUICarrierSpaceServicesController;
  v4 = -[PSUICarrierSpaceServicesController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_simStatusChanged, 0x24D506888, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_carrierSpaceChanged, 0x24D506868, 0);

  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  __CFString *v6;
  void (*v7)(__CFString *, _QWORD);
  objc_super v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  __int128 buf;
  void *(*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceServicesController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PSUICarrierSpaceServicesController viewDidAppear:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)PSUICarrierSpaceServicesController;
  -[PSUICarrierSpaceServicesController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  v6 = CFSTR("com.apple.Preferences.CarrierSpaceServicesEvent");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v7 = (void (*)(__CFString *, _QWORD))_MergedGlobals_1_5;
  v12 = _MergedGlobals_1_5;
  if (!_MergedGlobals_1_5)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v14 = __getAnalyticsSendEventSymbolLoc_block_invoke_4;
    v15 = &unk_24D5018D0;
    v16 = &v9;
    __getAnalyticsSendEventSymbolLoc_block_invoke_4((uint64_t)&buf);
    v7 = (void (*)(__CFString *, _QWORD))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v7)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v7(v6, MEMORY[0x24BDBD1B8]);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[PSUICarrierSpaceServicesController getLogger](self, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[PSUICarrierSpaceServicesController specifiers]";
      _os_log_debug_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEBUG, "%s: loading carrier services specifiers", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CARRIER_APP_GROUP"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MORE_APPS_FROM_CARRIER_%@"), &stru_24D5028C8, CFSTR("CarrierSpaceServices"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeDataCarrierName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v12;
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, 0, 0, 13, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setButtonAction:", sel_moreAppsTapped_);
    objc_msgSend(v13, "setIdentifier:", CFSTR("MORE_APPS_FROM_CARRIER"));
    v43 = v13;
    v45 = (void *)v6;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v6, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICarrierServicesSpecifierCache sharedInstance](PSUICarrierServicesSpecifierCache, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "specifiers:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSUICarrierSpaceServicesController getLogger](self, "getLogger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 136315394;
      v47 = "-[PSUICarrierSpaceServicesController specifiers]";
      v48 = 2048;
      v49 = v19;
      _os_log_impl(&dword_2161C6000, v18, OS_LOG_TYPE_DEFAULT, "%s detected %lu service code specifiers", buf, 0x16u);
    }

    objc_msgSend(v14, "specifierForID:", CFSTR("MORE_APPS_FROM_CARRIER"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ps_insertObjectsFromArray:afterObject:", v17, v20);

    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activeDataSubscriptionContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v15, "slotID");
    v42 = v22;
    if (v23 != objc_msgSend(v22, "slotID"))
    {
      v31 = v17;
      objc_msgSend(v14, "specifierForID:", CFSTR("CARRIER_APP_GROUP"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObject:", v32);

      objc_msgSend(v14, "specifierForID:", CFSTR("MORE_APPS_FROM_CARRIER"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObject:", v25);
LABEL_21:

      v34 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("%@_CARRIER_SERVICES"), &stru_24D5028C8, CFSTR("CarrierSpaceServices"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "carrierName:", v15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", v36, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUICarrierSpaceServicesController setTitle:](self, "setTitle:", v39);

      objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v14, CFSTR("[PSUICarrierSpaceServicesController specifiers] end"));
      v40 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v14;

      v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      return v4;
    }
    objc_msgSend(v14, "specifierForID:", CFSTR("MY_ACCOUNT"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      objc_msgSend(v24, "setHostController:", self);
    -[PSUICarrierSpaceServicesController primaryAppSpecifier](self, "primaryAppSpecifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICarrierSpaceServicesController getLogger](self, "getLogger");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[PSUICarrierSpaceServicesController specifiers]";
        _os_log_impl(&dword_2161C6000, v27, OS_LOG_TYPE_DEFAULT, "%s carrier app provided: adding app install cell", buf, 0xCu);
      }

      objc_msgSend(v14, "specifierForID:", CFSTR("CARRIER_APP_GROUP"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ps_insertObject:afterObject:", v26, v29);

      if (-[PSUICarrierSpaceServicesController shouldShowMoreApps](self, "shouldShowMoreApps"))
        goto LABEL_20;
      -[PSUICarrierSpaceServicesController getLogger](self, "getLogger");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[PSUICarrierSpaceServicesController specifiers]";
        _os_log_impl(&dword_2161C6000, v30, OS_LOG_TYPE_DEFAULT, "%s carrier more apps URL not provided: hiding More Apps button", buf, 0xCu);
      }
    }
    else
    {
      if (v28)
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[PSUICarrierSpaceServicesController specifiers]";
        _os_log_impl(&dword_2161C6000, v27, OS_LOG_TYPE_DEFAULT, "%s carrier app not provided: hiding app install cell and More Apps button", buf, 0xCu);
      }

      objc_msgSend(v14, "specifierForID:", CFSTR("CARRIER_APP_GROUP"));
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObject:", v30);
    }

    objc_msgSend(v14, "specifierForID:", CFSTR("MORE_APPS_FROM_CARRIER"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", v33);

LABEL_20:
    v31 = v17;

    goto LABEL_21;
  }
  return v4;
}

- (id)primaryAppSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carrierAppInstallController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__PSUICarrierSpaceServicesController_primaryAppSpecifier__block_invoke;
  v7[3] = &unk_24D501E00;
  v7[4] = self;
  objc_msgSend(v4, "specifierWithDescriptionParameters:completion:", 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __57__PSUICarrierSpaceServicesController_primaryAppSpecifier__block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __57__PSUICarrierSpaceServicesController_primaryAppSpecifier__block_invoke_2;
  v2[3] = &unk_24D5025F0;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

uint64_t __57__PSUICarrierSpaceServicesController_primaryAppSpecifier__block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "reloadSpecifiers");
  return result;
}

- (void)launchMyAccountInWebView:(id)a3
{
  void *v4;
  NSObject *v5;
  PSUICarrierSpaceMyAccountWebViewController *v6;
  PSUICarrierSpaceMyAccountWebViewController *myAccountWebViewController;
  UINavigationController *v8;
  UINavigationController *navCon;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "propertyForKey:", CFSTR("MY_ACCOUNT_URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICarrierSpaceServicesController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Launch my account in web view pressed: %@", (uint8_t *)&v10, 0xCu);
  }

  v6 = -[PSUICarrierSpaceMyAccountWebViewController initWithURLString:]([PSUICarrierSpaceMyAccountWebViewController alloc], "initWithURLString:", v4);
  myAccountWebViewController = self->_myAccountWebViewController;
  self->_myAccountWebViewController = v6;

  v8 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", self->_myAccountWebViewController);
  navCon = self->_navCon;
  self->_navCon = v8;

  -[PSUICarrierSpaceServicesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_navCon, 1, 0);
}

- (void)launchMyAccountInSafari:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a3, "propertyForKey:", CFSTR("MY_ACCOUNT_URL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUICarrierSpaceServicesController getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Launch my account in safari pressed: %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)*MEMORY[0x24BEBDF78];
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "openURL:options:completionHandler:", v6, v9, 0);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSUICarrierSpaceServicesController;
  -[PSUICarrierSpaceServicesController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    objc_msgSend(v5, "carrierAppInstallController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInstallState:", objc_msgSend(v7, "installState"));

  }
  else if (objc_msgSend(v4, "tag"))
  {
    objc_msgSend(v4, "setSelectionStyle:", 1);
  }
  return v4;
}

- (BOOL)shouldShowMoreApps
{
  void *v2;
  void *v3;
  char v4;

  +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "carrierAppInstallController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "moreAppsAvailable");

  return v4;
}

- (void)moreAppsTapped:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "carrierAppInstallController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moreAppsButtonTapped:", v3);

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CarrierSpaceServicesController"));
}

- (NSArray)appsList
{
  return self->_appsList;
}

- (void)setAppsList:(id)a3
{
  objc_storeStrong((id *)&self->_appsList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsList, 0);
  objc_storeStrong((id *)&self->_myAccountWebViewController, 0);
  objc_storeStrong((id *)&self->_navCon, 0);
}

@end
