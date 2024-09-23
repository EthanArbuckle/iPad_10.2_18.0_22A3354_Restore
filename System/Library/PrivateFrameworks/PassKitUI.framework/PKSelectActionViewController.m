@implementation PKSelectActionViewController

- (PKSelectActionViewController)initWithPass:(id)a3 actions:(id)a4 actionType:(unint64_t)a5 paymentDataProvider:(id)a6 webService:(id)a7 balanceDictionary:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKSelectActionViewController *v18;
  PKSelectActionViewController *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  objc_super v29;

  v15 = a3;
  v28 = a4;
  v16 = a6;
  v27 = a7;
  v17 = a8;
  if (a5)
  {
    v29.receiver = self;
    v29.super_class = (Class)PKSelectActionViewController;
    v18 = -[PKSelectActionViewController init](&v29, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_pass, a3);
      objc_storeStrong((id *)&v19->_actions, a4);
      v19->_actionType = a5;
      objc_storeStrong((id *)&v19->_paymentDataProvider, a6);
      objc_storeStrong((id *)&v19->_webService, a7);
      objc_storeStrong((id *)&v19->_balances, a8);
      -[PKSelectActionViewController navigationItem](v19, "navigationItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
      objc_msgSend(v21, "configureWithTransparentBackground");
      PKProvisioningSecondaryBackgroundColor();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setBackgroundColor:", v22);

      objc_msgSend(v20, "setStandardAppearance:", v21);
      PKLocalizedPaymentString(CFSTR("NEXT"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v23, 2, v19, sel__rightBarButtonPressed_);
      objc_msgSend(v20, "setRightBarButtonItem:", v24);
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v19, sel__cancelButtonPressed_);
      objc_msgSend(v20, "setLeftBarButtonItem:", v25);

    }
  }
  else
  {

    v19 = 0;
  }

  return v19;
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
  v9.super_class = (Class)PKSelectActionViewController;
  -[PKSelectActionViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PKSelectActionViewController view](self, "view");
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
  -[PKSelectActionViewController _reloadActionView](self, "_reloadActionView");

}

- (void)_reloadActionView
{
  PKSelectActionView *v3;
  PKSelectActionView *actionView;
  id v5;

  -[PKSelectActionView setDelegate:](self->_actionView, "setDelegate:", 0);
  -[PKSelectActionView removeFromSuperview](self->_actionView, "removeFromSuperview");
  v3 = -[PKSelectActionView initWithPass:actions:actionType:balanceDictionary:]([PKSelectActionView alloc], "initWithPass:actions:actionType:balanceDictionary:", self->_pass, self->_actions, self->_actionType, self->_balances);
  actionView = self->_actionView;
  self->_actionView = v3;

  -[PKSelectActionView setDelegate:](self->_actionView, "setDelegate:", self);
  -[PKSelectActionViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSubview:belowSubview:", self->_actionView, self->_passView);

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
  v23.super_class = (Class)PKSelectActionViewController;
  -[PKSelectActionViewController viewWillLayoutSubviews](&v23, sel_viewWillLayoutSubviews);
  -[PKSelectActionViewController view](self, "view");
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
  -[PKSelectActionView setFrame:](self->_actionView, "setFrame:", 0.0, MaxY, v17, CGRectGetMaxY(v25) - MaxY);

}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)_rightBarButtonPressed:(id)a3
{
  char v4;
  id v5;
  PKPerformActionViewController *v6;
  PKNavigationController *v7;
  id v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = -[PKPaymentPass canPerformAction:unableReason:displayableError:](self->_pass, "canPerformAction:unableReason:displayableError:", self->_selectedAction, &v9, &v8);
  v5 = v8;
  if ((v4 & 1) != 0 || v9 == 2)
  {
    v6 = -[PKPerformActionViewController initWithPass:action:paymentDataProvider:]([PKPerformActionViewController alloc], "initWithPass:action:paymentDataProvider:", self->_pass, self->_selectedAction, self->_paymentDataProvider);
    -[PKPerformActionViewController setDelegate:](v6, "setDelegate:", self);
    -[PKPerformActionViewController setWebService:](v6, "setWebService:", self->_webService);
    v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v6);
    -[PKNavigationController setSupportedInterfaceOrientations:](v7, "setSupportedInterfaceOrientations:", 2);
    -[PKSelectActionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

  }
  else
  {
    +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", v9, self->_selectedAction, v5, 0);
    v6 = (PKPerformActionViewController *)objc_claimAutoreleasedReturnValue();
    -[PKSelectActionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }

}

- (void)_cancelButtonPressed:(id)a3
{
  id v4;

  -[PKSelectActionViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectActionViewControllerDidCancel:", self);

}

- (void)setRightBarButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[PKSelectActionViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)selectActionViewDidSelectAction:(id)a3
{
  PKPaymentPassAction **p_selectedAction;
  id v6;
  void *v7;
  id v8;

  p_selectedAction = &self->_selectedAction;
  objc_storeStrong((id *)&self->_selectedAction, a3);
  v6 = a3;
  -[PKSelectActionViewController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassAction title](*p_selectedAction, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTitle:", v7);
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", 0);
  -[PKSelectActionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectActionViewControllerDidPerformAction:", self);

  objc_msgSend(v4, "presentingViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (PKSelectActionViewControllerDelegate)delegate
{
  return (PKSelectActionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_passView, 0);
}

@end
