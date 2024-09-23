@implementation STDevicesMenu

+ (void)updateWithCoordinator:(id)a3 viewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v5 = a4;
  objc_msgSend(v19, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "me");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "usageDetailsCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "devices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(v19, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isCloudSyncEnabled");

  if (v10 >= 2 && (objc_msgSend(v7, "isRemoteUser") | v12) == 1)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DevicesButtonTitle"), &stru_24DB8A1D0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x24BEBD410]);
    +[STUsageDetailListController _getDevicesDropDownMenuWithCoordinator:viewController:](STUsageDetailListController, "_getDevicesDropDownMenuWithCoordinator:viewController:", v19, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithTitle:menu:", v14, v16);
    objc_msgSend(v5, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRightBarButtonItem:", v17);

  }
  else
  {
    objc_msgSend(v5, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightBarButtonItem:", 0);
  }

}

@end
