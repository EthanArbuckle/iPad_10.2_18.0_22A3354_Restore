@implementation STFamilyRootViewController

- (STFamilyRootViewController)init
{
  return -[STFamilyRootViewController initWithModalPresentation:](self, "initWithModalPresentation:", 0);
}

- (STFamilyRootViewController)initWithModalPresentation:(BOOL)a3
{
  _BOOL8 v3;
  STFamilyRootViewController *v4;
  uint64_t v5;
  STRootViewModelCoordinator *coordinator;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)STFamilyRootViewController;
  v4 = -[STListViewController init](&v13, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    coordinator = v4->_coordinator;
    v4->_coordinator = (STRootViewModelCoordinator *)v5;

    v4->_presentedAsModal = v3;
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ScreenTimeControllerTitle"), &stru_24DB8A1D0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STFamilyRootViewController setTitle:](v4, "setTitle:", v8);

    -[STFamilyRootViewController coordinator](v4, "coordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[STFamilyMemberGroupSpecifierProvider providerWithCoordinator:presentedAsModal:](STFamilyMemberGroupSpecifierProvider, "providerWithCoordinator:presentedAsModal:", v9, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STListViewController setSpecifierProviders:](v4, "setSpecifierProviders:", v11);

  }
  return v4;
}

- (BOOL)presentedAsModal
{
  return self->_presentedAsModal;
}

- (void)setPresentedAsModal:(BOOL)a3
{
  self->_presentedAsModal = a3;
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
