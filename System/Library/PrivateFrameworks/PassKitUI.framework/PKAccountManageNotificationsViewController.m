@implementation PKAccountManageNotificationsViewController

- (PKAccountManageNotificationsViewController)initWithConfiguration:(id)a3
{
  id v4;
  PKAccountManageNotificationsViewController *v5;
  _PKAccountManageNotificationsViewController *v6;
  _PKAccountManageNotificationsViewController *viewController;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountManageNotificationsViewController;
  v5 = -[PKAccountManageNotificationsViewController init](&v11, sel_init);
  if (v5)
  {
    v6 = -[_PKAccountManageNotificationsViewController initWithConfiguration:]([_PKAccountManageNotificationsViewController alloc], "initWithConfiguration:", v4);
    viewController = v5->_viewController;
    v5->_viewController = v6;

    -[PKAccountManageNotificationsViewController addChildViewController:](v5, "addChildViewController:", v5->_viewController);
    -[PKAccountManageNotificationsViewController navigationItem](v5, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v9);

    objc_msgSend(v8, "setLargeTitleDisplayMode:", 2);
    objc_msgSend(v8, "setBackButtonDisplayMode:", 2);

  }
  return v5;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountManageNotificationsViewController;
  -[PKAccountManageNotificationsViewController loadView](&v5, sel_loadView);
  -[_PKAccountManageNotificationsViewController didMoveToParentViewController:](self->_viewController, "didMoveToParentViewController:", self);
  -[_PKAccountManageNotificationsViewController view](self->_viewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountManageNotificationsViewController view](self, "view");
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
  v13.super_class = (Class)PKAccountManageNotificationsViewController;
  -[PKAccountManageNotificationsViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[PKAccountManageNotificationsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_PKAccountManageNotificationsViewController view](self->_viewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
