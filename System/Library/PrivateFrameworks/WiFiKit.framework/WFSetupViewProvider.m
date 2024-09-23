@implementation WFSetupViewProvider

- (id)credentialsViewControllerWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x24BEC2988];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = WFCurrentDeviceCapability();
  objc_msgSend(MEMORY[0x24BEC2918], "setupAppearanceProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithCredentialsProviderContext:deviceCapability:appearanceProxy:", v5, v7, v8);

  -[WFSettingsViewProvider credentialsViewControllerMap](self, "credentialsViewControllerMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, v5);

  return v9;
}

- (id)networkDetailsViewControllerWithContext:(id)a3
{
  id v4;
  WFSettingsController *v5;
  void *v6;
  WFSettingsController *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = [WFSettingsController alloc];
  objc_msgSend(MEMORY[0x24BEC2918], "setupAppearanceProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFSettingsController initWithDetailsContext:appearanceProxy:](v5, "initWithDetailsContext:appearanceProxy:", v4, v6);

  -[WFSettingsViewProvider setSettingsController:](self, "setSettingsController:", v7);
  -[WFSettingsViewProvider settingsController](self, "settingsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settingsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  objc_msgSend(MEMORY[0x24BEC2918], "setupAppearanceProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithOtherNetworkProviderContext:deviceCapability:appearanceProxy:", v5, v7, v8);

  objc_msgSend(v9, "setDelegate:", v5);
  return v9;
}

@end
