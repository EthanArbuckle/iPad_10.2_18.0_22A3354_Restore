@implementation PSUIMyAccountSpecifier

- (PSUIMyAccountSpecifier)initWithContext:(id)a3 cbCache:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  PSUIMyAccountSpecifier *v12;
  char **v13;
  PSUIMyAccountSpecifier *v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "carrierServicesWebViewAccountUrl:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "carrierServicesAccountUrl:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(v9, "length") || v10 && objc_msgSend(v10, "length"))
  {
    objc_msgSend(v8, "carrierServicesMyAccountUrlTitle:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PSUIMyAccountSpecifier initWithName:target:set:get:detail:cell:edit:](self, "initWithName:target:set:get:detail:cell:edit:", v11, self, 0, 0, 0, 13, 0);

    if (v12)
    {
      -[PSUIMyAccountSpecifier setIdentifier:](v12, "setIdentifier:", CFSTR("MY_ACCOUNT"));
      objc_storeStrong((id *)&v12->_context, a3);
      if (v9 && objc_msgSend(v9, "length"))
      {
        -[PSUIMyAccountSpecifier setProperty:forKey:](v12, "setProperty:forKey:", v9, CFSTR("MY_ACCOUNT_URL"));
        v13 = &selRef_launchMyAccountInWebView_;
      }
      else
      {
        -[PSUIMyAccountSpecifier setProperty:forKey:](v12, "setProperty:forKey:", v10, CFSTR("MY_ACCOUNT_URL"));
        v13 = &selRef_launchMyAccountInSafari_;
      }
      -[PSUIMyAccountSpecifier setButtonAction:](v12, "setButtonAction:", *v13);
    }
    self = v12;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)launchMyAccountInWebView:(id)a3
{
  void *v4;
  NSObject *v5;
  PSUICarrierSpaceMyAccountWebViewController *v6;
  PSUICarrierSpaceMyAccountWebViewController *myAccountWebViewController;
  UINavigationController *v8;
  UINavigationController *navCon;
  id WeakRetained;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "propertyForKey:", CFSTR("MY_ACCOUNT_URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIMyAccountSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Launch my account in web view pressed: %@", (uint8_t *)&v12, 0xCu);
  }

  v6 = -[PSUICarrierSpaceMyAccountWebViewController initWithURLString:]([PSUICarrierSpaceMyAccountWebViewController alloc], "initWithURLString:", v4);
  myAccountWebViewController = self->_myAccountWebViewController;
  self->_myAccountWebViewController = v6;

  v8 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", self->_myAccountWebViewController);
  navCon = self->_navCon;
  self->_navCon = v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)&self->_hostController);
    objc_msgSend(v11, "presentViewController:animated:completion:", self->_navCon, 1, 0);

  }
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

  -[PSUIMyAccountSpecifier getLogger](self, "getLogger");
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

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("MyAccountSpecifier"));
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (PSUICarrierSpaceMyAccountWebViewController)myAccountWebViewController
{
  return self->_myAccountWebViewController;
}

- (void)setMyAccountWebViewController:(id)a3
{
  objc_storeStrong((id *)&self->_myAccountWebViewController, a3);
}

- (UINavigationController)navCon
{
  return self->_navCon;
}

- (void)setNavCon:(id)a3
{
  objc_storeStrong((id *)&self->_navCon, a3);
}

- (Logger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_navCon, 0);
  objc_storeStrong((id *)&self->_myAccountWebViewController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end
