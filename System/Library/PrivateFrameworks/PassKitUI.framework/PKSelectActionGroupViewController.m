@implementation PKSelectActionGroupViewController

- (PKSelectActionGroupViewController)initWithPass:(id)a3 actionGroups:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKSelectActionGroupViewController *v15;
  PKSelectActionGroupViewController *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PKSelectActionGroupViewController;
  v15 = -[PKSelectActionGroupViewController init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pass, a3);
    objc_storeStrong((id *)&v16->_actionGroups, a4);
    objc_storeStrong((id *)&v16->_paymentDataProvider, a5);
    objc_storeStrong((id *)&v16->_webService, a6);
    -[PKSelectActionGroupViewController navigationItem](v16, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v18, "configureWithTransparentBackground");
    objc_msgSend(v17, "setStandardAppearance:", v18);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v19, 2, v16, sel__rightBarButtonPressed_);
    objc_msgSend(v17, "setRightBarButtonItem:", v20);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v16, sel__cancelButtonPressed_);
    objc_msgSend(v17, "setLeftBarButtonItem:", v21);

  }
  return v16;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PKPerformActionPassView *v5;
  PKPaymentPass *pass;
  PKPerformActionPassView *v7;
  PKPerformActionPassView *passView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKSelectActionGroupViewController;
  -[PKSelectActionGroupViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PKSelectActionGroupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = [PKPerformActionPassView alloc];
  pass = self->_pass;
  objc_msgSend(v3, "bounds");
  v7 = -[PKPerformActionPassView initWithPass:frame:](v5, "initWithPass:frame:", pass);
  passView = self->_passView;
  self->_passView = v7;

  objc_msgSend(v3, "addSubview:", self->_passView);
  -[PKSelectActionGroupViewController _reloadActionGroupView](self, "_reloadActionGroupView");

}

- (void)_reloadActionGroupView
{
  PKSelectActionGroupView *actionGroupView;
  void *v4;
  PKSelectActionGroupView *v5;
  PKSelectActionGroupView *v6;
  id v7;

  -[PKSelectActionGroupView setDelegate:](self->_actionGroupView, "setDelegate:", 0);
  actionGroupView = self->_actionGroupView;
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectActionGroupView setBackgroundColor:](actionGroupView, "setBackgroundColor:", v4);

  -[PKSelectActionGroupView removeFromSuperview](self->_actionGroupView, "removeFromSuperview");
  v5 = -[PKSelectActionGroupView initWithPass:actionGroups:]([PKSelectActionGroupView alloc], "initWithPass:actionGroups:", self->_pass, self->_actionGroups);
  v6 = self->_actionGroupView;
  self->_actionGroupView = v5;

  -[PKSelectActionGroupView setDelegate:](self->_actionGroupView, "setDelegate:", self);
  -[PKSelectActionGroupViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSubview:belowSubview:", self->_actionGroupView, self->_passView);

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
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double MaxY;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)PKSelectActionGroupViewController;
  -[PKSelectActionGroupViewController viewWillLayoutSubviews](&v23, sel_viewWillLayoutSubviews);
  -[PKSelectActionGroupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v13 = v5 + v12;
  v15 = v7 + v14;
  v17 = v9 - (v12 + v16);
  v19 = v11 - (v14 + v18);
  -[PKPerformActionPassView sizeThatFits:](self->_passView, "sizeThatFits:", v17, v19);
  -[PKPerformActionPassView setFrame:](self->_passView, "setFrame:", 0.0, v15, v20, v21);
  -[PKPerformActionPassView frame](self->_passView, "frame");
  MaxY = CGRectGetMaxY(v24);
  v25.origin.x = v13;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  -[PKSelectActionGroupView setFrame:](self->_actionGroupView, "setFrame:", 0.0, MaxY, v17, CGRectGetMaxY(v25) - MaxY);

}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)_rightBarButtonPressed:(id)a3
{
  void *v4;
  PKRemoteActionGroupViewController *v5;

  v5 = -[PKRemoteActionGroupViewController initWithPass:actionGroup:paymentDataProvider:webService:]([PKRemoteActionGroupViewController alloc], "initWithPass:actionGroup:paymentDataProvider:webService:", self->_pass, self->_selectedActionGroup, self->_paymentDataProvider, self->_webService);
  -[PKRemoteActionGroupViewController setDelegate:](v5, "setDelegate:", self);
  -[PKSelectActionGroupViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (void)_cancelButtonPressed:(id)a3
{
  id v4;

  -[PKSelectActionGroupViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectActionGroupViewControllerDidCancel:", self);

}

- (void)setRightBarButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[PKSelectActionGroupViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)selectActionGroupViewDidSelectActionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_selectedActionGroup, a3);
}

- (void)remoteGroupActionsViewControllerDidCancel:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (void)remoteGroupActionsViewControllerDidPerformFetchActionGroup:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (void)remoteGroupActionsViewControllerDidPerformPayment:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (PKSelectActionGroupViewControllerDelegate)delegate
{
  return (PKSelectActionGroupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_selectedActionGroup, 0);
  objc_storeStrong((id *)&self->_actionGroupView, 0);
  objc_storeStrong((id *)&self->_actionGroups, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_passView, 0);
}

@end
