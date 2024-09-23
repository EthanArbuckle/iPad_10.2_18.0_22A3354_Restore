@implementation WFSettingsViewProvider

- (WFSettingsViewProvider)init
{
  WFSettingsViewProvider *v2;
  uint64_t v3;
  NSMapTable *credentialsViewControllerMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSettingsViewProvider;
  v2 = -[WFSettingsViewProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 0);
    credentialsViewControllerMap = v2->_credentialsViewControllerMap;
    v2->_credentialsViewControllerMap = (NSMapTable *)v3;

  }
  return v2;
}

- (id)credentialsViewControllerWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BEC2988];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = WFCurrentDeviceCapability();
  objc_msgSend(MEMORY[0x24BEC2918], "defaultAppearanceProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithCredentialsProviderContext:deviceCapability:appearanceProxy:", v5, v7, v8);

  -[NSMapTable setObject:forKey:](self->_credentialsViewControllerMap, "setObject:forKey:", v9, v5);
  return v9;
}

- (id)certificateViewControllerWithContext:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BEC29A0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCertificateProviderContext:", v4);

  return v5;
}

- (id)networkDetailsViewControllerWithContext:(id)a3
{
  id v4;
  WFSettingsController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[WFSettingsController initWithDetailsContext:]([WFSettingsController alloc], "initWithDetailsContext:", v4);

  -[WFSettingsViewProvider setSettingsController:](self, "setSettingsController:", v5);
  -[WFSettingsViewProvider settingsController](self, "settingsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settingsViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)networkErrorViewControllerWithContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEC2950], "errorAlertControllerWithContext:", a3);
}

- (id)otherNetworkViewControllerWithContext:(id)a3 appearanceProxy:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BEC2988];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = WFCurrentDeviceCapability();
  objc_msgSend(MEMORY[0x24BEC2918], "defaultAppearanceProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithOtherNetworkProviderContext:deviceCapability:appearanceProxy:", v5, v7, v8);

  objc_msgSend(v9, "setDelegate:", v5);
  return v9;
}

- (void)didDismissNetworkViewController:(id)a3 forContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFSettingsViewProvider credentialsViewControllerMap](self, "credentialsViewControllerMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v5);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFSettingsViewProvider settingsController](self, "settingsController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "settingsViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "detailViewControllerVisible");

      if (v9)
      {
        WFLogForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
        {
          v16 = 136315138;
          v17 = "-[WFSettingsViewProvider didDismissNetworkViewController:forContext:]";
          _os_log_impl(&dword_219FC8000, v10, v11, "%s: settings view controller has detail view controller visible, popping navigation controller", (uint8_t *)&v16, 0xCu);
        }

        -[WFSettingsViewProvider settingsController](self, "settingsController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "settingsViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "navigationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (id)objc_msgSend(v14, "popViewControllerAnimated:", 1);

      }
      -[WFSettingsViewProvider setSettingsController:](self, "setSettingsController:", 0);
    }
  }

}

- (NSMapTable)credentialsViewControllerMap
{
  return self->_credentialsViewControllerMap;
}

- (void)setCredentialsViewControllerMap:(id)a3
{
  objc_storeStrong((id *)&self->_credentialsViewControllerMap, a3);
}

- (WFSettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_credentialsViewControllerMap, 0);
}

@end
