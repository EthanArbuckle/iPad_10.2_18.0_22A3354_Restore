@implementation PKAccountDocumentsViewController

- (PKAccountDocumentsViewController)initWithConfiguration:(id)a3
{
  id v4;
  PKAccountDocumentsViewController *v5;
  _PKAccountDocumentsViewController *v6;
  _PKAccountDocumentsViewController *viewController;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountDocumentsViewController;
  v5 = -[PKAccountDocumentsViewController init](&v11, sel_init);
  if (v5)
  {
    v6 = -[_PKAccountDocumentsViewController initWithConfiguration:]([_PKAccountDocumentsViewController alloc], "initWithConfiguration:", v4);
    viewController = v5->_viewController;
    v5->_viewController = v6;

    -[PKAccountDocumentsViewController addChildViewController:](v5, "addChildViewController:", v5->_viewController);
    -[PKAccountDocumentsViewController navigationItem](v5, "navigationItem");
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
  v5.super_class = (Class)PKAccountDocumentsViewController;
  -[PKAccountDocumentsViewController loadView](&v5, sel_loadView);
  -[_PKAccountDocumentsViewController didMoveToParentViewController:](self->_viewController, "didMoveToParentViewController:", self);
  -[_PKAccountDocumentsViewController view](self->_viewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountDocumentsViewController view](self, "view");
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
  v13.super_class = (Class)PKAccountDocumentsViewController;
  -[PKAccountDocumentsViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[PKAccountDocumentsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_PKAccountDocumentsViewController view](self->_viewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
