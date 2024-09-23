@implementation PKPaymentCardUnsupportedViewController

- (PKPaymentCardUnsupportedViewController)initWithUnsupportedProduct:(id)a3 context:(int64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  PKPaymentCardUnsupportedViewController *v11;
  PKPaymentCardUnsupportedViewController *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentCardUnsupportedViewController;
  v11 = -[PKPaymentSetupTableViewController initWithContext:](&v14, sel_initWithContext_, a4);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_product, a3);
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentCardUnsupportedViewController;
  -[PKPaymentSetupTableViewController dealloc](&v2, sel_dealloc);
}

- (unint64_t)edgesForExtendedLayout
{
  return 15;
}

- (void)viewDidLoad
{
  void *v3;
  PKTableHeaderView *v4;
  PKTableHeaderView *v5;
  PKTableHeaderView *headerView;
  void *v7;
  PKLinkedAppView *v8;
  PKLinkedAppView *appViewCell;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPaymentCardUnsupportedViewController;
  -[PKPaymentCardUnsupportedViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSeparatorStyle:", 0);

  v4 = [PKTableHeaderView alloc];
  v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerView = self->_headerView;
  self->_headerView = v5;

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTableHeaderView:", self->_headerView);

  v8 = -[PKLinkedAppView initWithStoreIDs:systemAppBundleIdentifiers:appLaunchURL:reuseIdentifier:]([PKLinkedAppView alloc], "initWithStoreIDs:systemAppBundleIdentifiers:appLaunchURL:reuseIdentifier:", 0, 0, 0, 0);
  appViewCell = self->_appViewCell;
  self->_appViewCell = v8;

  -[PKLinkedAppView linkedAppView](self->_appViewCell, "linkedAppView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[PKPaymentCardUnsupportedViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedString(CFSTR("DONE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTitle:style:target:action:", v13, 2, self, sel__done_);

  objc_msgSend(v11, "setRightBarButtonItem:", v14);
  -[PKPaymentCardUnsupportedViewController _updateViewsWithProduct:](self, "_updateViewsWithProduct:", self->_product);

}

- (void)_updateViewsWithProduct:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  CGRect v23;

  v22 = a3;
  -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("CANNOT_ADD_CARD_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  objc_msgSend(v22, "associatedStoreIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v22, "displayName");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    objc_msgSend(v22, "partnerName");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      PKLocalizedPaymentString(CFSTR("CANNOT_ADD_CARD_MESSAGE_APP_AVAILABLE"), CFSTR("%@%@"), v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v22, "displayName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("CANNOT_ADD_CARD_MESSAGE_APP_AVAILABLE"), CFSTR("%@%@"), v9, v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("CANNOT_ADD_CARD_MESSAGE_NO_APP_AVAILABLE"), CFSTR("%@"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v12);

  -[PKTableHeaderView sizeToFit](self->_headerView, "sizeToFit");
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableHeaderView bounds](self->_headerView, "bounds");
  objc_msgSend(v15, "_tableHeaderHeightDidChangeToHeight:", CGRectGetHeight(v23));

  -[PKLinkedAppView linkedAppView](self->_appViewCell, "linkedAppView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "associatedStoreIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStoreIDs:", v17);

  -[PKLinkedAppView linkedAppView](self->_appViewCell, "linkedAppView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appLaunchURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAppLaunchURL:", v19);

  -[PKLinkedAppView linkedAppView](self->_appViewCell, "linkedAppView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reloadApplicationStateIfNecessary");

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reloadData");

}

- (void)setProduct:(id)a3
{
  PKPaymentSetupProduct *v5;
  PKPaymentSetupProduct *v6;

  v5 = (PKPaymentSetupProduct *)a3;
  if (self->_product != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_product, a3);
    -[PKPaymentCardUnsupportedViewController _updateViewsWithProduct:](self, "_updateViewsWithProduct:", self->_product);
    v5 = v6;
  }

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PKPaymentSetupProduct associatedStoreIdentifiers](self->_product, "associatedStoreIdentifiers", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return self->_appViewCell;
}

- (void)_done:(id)a3
{
  PKPaymentSetupViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "viewControllerDidTerminateSetupFlow:", self);

    }
  }
}

- (void)appViewContentSizeChanged:(id)a3
{
  void *v4;
  id v5;

  -[PKPaymentSetupTableViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginUpdates");

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endUpdates");

}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (PKPaymentSetupViewControllerDelegate)delegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_appViewCell, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
