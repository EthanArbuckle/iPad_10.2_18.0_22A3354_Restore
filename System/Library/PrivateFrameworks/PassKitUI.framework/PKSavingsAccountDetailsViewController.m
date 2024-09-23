@implementation PKSavingsAccountDetailsViewController

- (PKSavingsAccountDetailsViewController)initWithConfiguration:(id)a3
{
  id v4;
  PKSavingsAccountDetailsViewController *v5;
  _PKAccountSavingsDetailsViewController *v6;
  uint64_t v7;
  _PKAccountSavingsDetailsViewController *viewController;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, int);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKSavingsAccountDetailsViewController;
  v5 = -[PKSavingsAccountDetailsViewController init](&v17, sel_init);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = [_PKAccountSavingsDetailsViewController alloc];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __63__PKSavingsAccountDetailsViewController_initWithConfiguration___block_invoke;
    v14 = &unk_1E3E61C58;
    objc_copyWeak(&v15, &location);
    v7 = -[_PKAccountSavingsDetailsViewController initWithConfiguration:setNavigationIconVisible:](v6, "initWithConfiguration:setNavigationIconVisible:", v4, &v11);
    viewController = v5->_viewController;
    v5->_viewController = (_PKAccountSavingsDetailsViewController *)v7;

    -[PKSavingsAccountDetailsViewController addChildViewController:](v5, "addChildViewController:", v5->_viewController, v11, v12, v13, v14);
    -[PKSavingsAccountDetailsViewController navigationItem](v5, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLargeTitleDisplayMode:", 2);
    objc_msgSend(v9, "setBackButtonDisplayMode:", 2);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __63__PKSavingsAccountDetailsViewController_initWithConfiguration___block_invoke(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[122];
    v7 = v4;
    if (a2)
      v6 = v4[123];
    else
      v6 = 0;
    objc_msgSend(v5, "setTitleView:animated:", v6, 1);
    v4 = v7;
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSavingsAccountDetailsViewController;
  -[PKSavingsAccountDetailsViewController loadView](&v5, sel_loadView);
  -[_PKAccountSavingsDetailsViewController didMoveToParentViewController:](self->_viewController, "didMoveToParentViewController:", self);
  -[_PKAccountSavingsDetailsViewController view](self->_viewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSavingsAccountDetailsViewController view](self, "view");
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
  v13.super_class = (Class)PKSavingsAccountDetailsViewController;
  -[PKSavingsAccountDetailsViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[PKSavingsAccountDetailsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_PKAccountSavingsDetailsViewController view](self->_viewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  PKAnimatedNavigationBarTitleView *v8;
  PKAnimatedNavigationBarTitleView *titleIconView;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  UIImageView *v15;
  UIImageView *titleIcon;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKSavingsAccountDetailsViewController;
  -[PKSavingsAccountDetailsViewController viewWillAppear:](&v18, sel_viewWillAppear_, a3);
  if (!self->_titleIconView)
  {
    -[PKSavingsAccountDetailsViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;

    v8 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v7, v7);
    titleIconView = self->_titleIconView;
    self->_titleIconView = v8;

    -[PKSavingsAccountDetailsViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pkui_setCenterAlignedTitleView:", self->_titleIconView);

    PKPassKitUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLForResource:withExtension:", CFSTR("SAVINGS_Icon"), CFSTR("pdf"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = PKUIScreenScale();
    PKUIImageFromPDF(v12, v7, v7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v14);
    titleIcon = self->_titleIcon;
    self->_titleIcon = v15;

    -[UIImageView layer](self->_titleIcon, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerRadius:", 6.0);
    objc_msgSend(v17, "setMasksToBounds:", 1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleIcon, 0);
  objc_storeStrong((id *)&self->_titleIconView, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
