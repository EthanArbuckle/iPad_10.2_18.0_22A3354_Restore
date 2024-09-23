@implementation PKSavingsAccountViewController

- (PKSavingsAccountViewController)initWithConfiguration:(id)a3
{
  id v4;
  PKSavingsAccountViewController *v5;
  _PKAccountSavingsViewController *v6;
  _PKAccountSavingsViewController *viewController;
  void *v8;
  void *v9;
  void *v10;
  PKDashboardMoreMenuFactory *v11;
  PKDashboardMoreMenuFactory *moreMenuFactory;
  PKDashboardMoreMenuFactory *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKSavingsAccountViewController;
  v5 = -[PKSavingsAccountViewController init](&v20, sel_init);
  if (v5)
  {
    v6 = -[_PKAccountSavingsViewController initWithConfiguration:]([_PKAccountSavingsViewController alloc], "initWithConfiguration:", v4);
    viewController = v5->_viewController;
    v5->_viewController = v6;

    -[PKSavingsAccountViewController addChildViewController:](v5, "addChildViewController:", v5->_viewController);
    -[PKSavingsAccountViewController navigationItem](v5, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v9);

    objc_msgSend(v8, "setLargeTitleDisplayMode:", 1);
    objc_msgSend(v8, "setBackButtonDisplayMode:", 2);
    PKUIInfoButtonImageWithDefaultConfiguration();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(PKDashboardMoreMenuFactory);
    moreMenuFactory = v5->_moreMenuFactory;
    v5->_moreMenuFactory = v11;

    v13 = v5->_moreMenuFactory;
    objc_msgSend(v4, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardMoreMenuFactory setAccount:](v13, "setAccount:", v14);

    v15 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[PKDashboardMoreMenuFactory moreMenu](v5->_moreMenuFactory, "moreMenu");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithImage:menu:", v10, v16);

    objc_msgSend(v17, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D70]);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTintColor:", v18);

    objc_msgSend(v8, "setRightBarButtonItem:", v17);
  }

  return v5;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSavingsAccountViewController;
  -[PKSavingsAccountViewController loadView](&v5, sel_loadView);
  -[_PKAccountSavingsViewController didMoveToParentViewController:](self->_viewController, "didMoveToParentViewController:", self);
  -[_PKAccountSavingsViewController view](self->_viewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSavingsAccountViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKSavingsAccountViewController;
  -[PKSavingsAccountViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[PKSavingsAccountViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_PKAccountSavingsViewController view](self->_viewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSavingsAccountViewController;
  -[PKSavingsAccountViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[PKSavingsAccountViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMoreMenuFactory setNavigationController:](self->_moreMenuFactory, "setNavigationController:", v4);
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrefersLargeTitles:", 1);

}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreMenuFactory, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
