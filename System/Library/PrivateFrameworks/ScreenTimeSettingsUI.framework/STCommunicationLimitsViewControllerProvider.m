@implementation STCommunicationLimitsViewControllerProvider

+ (id)communicationLimitsViewControllerForDSID:(id)a3
{
  id v3;
  STRootViewModelCoordinator *v4;
  STCommunicationLimitsListController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v3 = a3;
  v4 = -[STRootViewModelCoordinator initWithUserDSID:deviceIdentifier:usageReportType:usageContext:]([STRootViewModelCoordinator alloc], "initWithUserDSID:deviceIdentifier:usageReportType:usageContext:", v3, 0, 0, 0);

  v5 = -[STCommunicationLimitsListController initWithRootViewModelCoordinator:]([STCommunicationLimitsListController alloc], "initWithRootViewModelCoordinator:", v4);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CommunicationLimitsSpecifierName"), &stru_24DB8A1D0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCommunicationLimitsListController setTitle:](v5, "setTitle:", v7);

  -[STRootViewModelCoordinator viewModel](v4, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "me");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isRemoteUser");

  if (v10)
    objc_msgSend(MEMORY[0x24BDBAC78], "requestAccountSyncWithOptions:", 1);

  return v5;
}

@end
