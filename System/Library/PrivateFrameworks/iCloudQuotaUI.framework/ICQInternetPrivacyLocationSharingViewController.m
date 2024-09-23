@implementation ICQInternetPrivacyLocationSharingViewController

- (ICQInternetPrivacyLocationSharingViewController)init
{
  ICQInternetPrivacyLocationSharingViewController *v2;
  ICQInternetPrivacyLocationSharingSpecifierProvider *v3;
  ICQInternetPrivacyLocationSharingSpecifierProvider *specifierProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQInternetPrivacyLocationSharingViewController;
  v2 = -[ICQInternetPrivacyLocationSharingViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ICQInternetPrivacyLocationSharingSpecifierProvider);
    specifierProvider = v2->_specifierProvider;
    v2->_specifierProvider = v3;

    -[ICQInternetPrivacyLocationSharingSpecifierProvider setDelegate:](v2->_specifierProvider, "setDelegate:", v2);
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQInternetPrivacyLocationSharingViewController;
  -[ICQInternetPrivacyLocationSharingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[ICQInternetPrivacyLocationSharingViewController _setupNavigationBar](self, "_setupNavigationBar");
}

- (void)_setupNavigationBar
{
  void *v3;
  id v4;

  -[ICQInternetPrivacyLocationSharingViewController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyViewModel IPAddressLocationSettingsTitle](self->_viewModel, "IPAddressLocationSettingsTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

}

- (id)specifiers
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacyLocationSharingViewController is loading specifiers.", (uint8_t *)&v12, 2u);
    }

    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ICQInternetPrivacyLocationSharingViewController specifierProvider](self, "specifierProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "specifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

  }
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v3);
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacyLocationSharingViewController specifiers: returning %@", (uint8_t *)&v12, 0xCu);
  }

  return *(id *)((char *)&self->super.super.super.super.super.isa + v3);
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v8, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[ICQInternetPrivacyLocationSharingViewController reloadSpecifiers](self, "reloadSpecifiers");

}

- (ICQInternetPrivacyViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (ICQInternetPrivacyLocationSharingSpecifierProvider)specifierProvider
{
  return self->_specifierProvider;
}

- (void)setSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_specifierProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
