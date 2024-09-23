@implementation TUIDevicesWithIssuesViewController

- (TUIDevicesWithIssuesViewController)initWithAccountManager:(id)a3 devicesWithIssuesIdentifiers:(id)a4
{
  id v7;
  id v8;
  TUIDevicesWithIssuesViewController *v9;
  TUIDevicesWithIssuesViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIDevicesWithIssuesViewController;
  v9 = -[TUIDevicesWithIssuesViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_devicesWithIssuesIdentifiers, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *tableViewHeightConstraint;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)TUIDevicesWithIssuesViewController;
  -[TUIDevicesWithIssuesViewController viewDidLoad](&v30, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIDevicesWithIssuesViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (int)*MEMORY[0x24BE75700];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "setClipsToBounds:", 1);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", 10.0);

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "setScrollEnabled:", 0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "_setTopPadding:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "_setBottomPadding:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "setSectionHeaderHeight:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "setSectionFooterHeight:", 0.0);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "setBackgroundColor:", v7);

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIDevicesWithIssuesViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v26;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIDevicesWithIssuesViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v21;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIDevicesWithIssuesViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v10;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIDevicesWithIssuesViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v15);

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "contentSize");
  objc_msgSend(v16, "constraintEqualToConstant:", v17);
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  tableViewHeightConstraint = self->_tableViewHeightConstraint;
  self->_tableViewHeightConstraint = v18;

  -[NSLayoutConstraint setActive:](self->_tableViewHeightConstraint, "setActive:", 1);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  TUIDevicesWithIssuesSpecifierProvider *deviceSpecifierProvider;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  id v16;

  v16 = a4;
  deviceSpecifierProvider = self->_deviceSpecifierProvider;
  v8 = a5;
  if (-[TUIDevicesWithIssuesSpecifierProvider devicesWithIssuesCount](deviceSpecifierProvider, "devicesWithIssuesCount"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v9);

  v10 = objc_msgSend(v8, "row");
  v11 = (int)*MEMORY[0x24BE75700];
  v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
  v13 = objc_msgSend(v8, "section");

  if (v10 == objc_msgSend(v12, "numberOfRowsInSection:", v13) - 1)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v11), "bounds");
    objc_msgSend(v16, "setSeparatorInset:", 0.0, 0.0, 0.0, v14);
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v11), "layoutIfNeeded");
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v11), "contentSize");
  -[NSLayoutConstraint setConstant:](self->_tableViewHeightConstraint, "setConstant:", v15);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  TUIDevicesWithIssuesSpecifierProvider *v6;
  TUIDevicesWithIssuesSpecifierProvider *deviceSpecifierProvider;
  void *v8;
  objc_class *v9;
  void *v10;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TUIDevicesWithIssuesSpecifierProvider initWithAccountManager:devicesWithIssuesIdentifiers:]([TUIDevicesWithIssuesSpecifierProvider alloc], "initWithAccountManager:devicesWithIssuesIdentifiers:", self->_accountManager, self->_devicesWithIssuesIdentifiers);
    deviceSpecifierProvider = self->_deviceSpecifierProvider;
    self->_deviceSpecifierProvider = v6;

    -[TUIDevicesWithIssuesSpecifierProvider setDelegate:](self->_deviceSpecifierProvider, "setDelegate:", self);
    -[TUIDevicesWithIssuesSpecifierProvider specifiers](self->_deviceSpecifierProvider, "specifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v8);

    v9 = (objc_class *)objc_msgSend(v5, "copy");
    v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v9;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    -[TUIDevicesWithIssuesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  else
    -[TUIDevicesWithIssuesViewController showViewController:sender:](self, "showViewController:sender:", v6, v7);

}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16, &__block_literal_global_16);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:willBeginLoadingSpecifier not implemented", v8, 2u);
  }

}

void __82__TUIDevicesWithIssuesViewController_specifierProvider_willBeginLoadingSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16 = (uint64_t)v0;

}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16, &__block_literal_global_30_2);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:didFinishLoadingSpecifier not implemented", v8, 2u);
  }

}

void __82__TUIDevicesWithIssuesViewController_specifierProvider_didFinishLoadingSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16 = (uint64_t)v0;

}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v5 = a5;
  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16, &__block_literal_global_31_1);
  v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_DEBUG, "Reloading specifiers for provider %@", (uint8_t *)&v12, 0xCu);
  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v8, "specifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIDevicesWithIssuesViewController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v9, v11, v5);

  }
  else
  {
    -[TUIDevicesWithIssuesViewController reloadSpecifiers](self, "reloadSpecifiers");
  }

}

void __89__TUIDevicesWithIssuesViewController_reloadSpecifiersForProvider_oldSpecifiers_animated___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16 = (uint64_t)v0;

}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16, &__block_literal_global_32_2);
  v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_DEBUG, "validateDataclassAccessForProvider:specifier:completion not implemented", v11, 2u);
  }

}

void __94__TUIDevicesWithIssuesViewController_validateDataclassAccessForProvider_specifier_completion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16 = (uint64_t)v0;

}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (NSMutableArray)devicesWithIssuesIdentifiers
{
  return self->_devicesWithIssuesIdentifiers;
}

- (void)setDevicesWithIssuesIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_devicesWithIssuesIdentifiers, a3);
}

- (TUIDevicesWithIssuesSpecifierProvider)deviceSpecifierProvider
{
  return self->_deviceSpecifierProvider;
}

- (void)setDeviceSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSpecifierProvider, a3);
}

- (NSLayoutConstraint)tableViewHeightConstraint
{
  return self->_tableViewHeightConstraint;
}

- (void)setTableViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_deviceSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_devicesWithIssuesIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end
