@implementation PKPaymentSetupAppRequiredViewController

- (PKPaymentSetupAppRequiredViewController)initWithSetupContext:(int64_t)a3 setupDelegate:(id)a4 product:(id)a5 linkedApplication:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPaymentSetupAppRequiredViewController *v13;
  PKPaymentSetupAppRequiredViewController *v14;
  objc_super v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentSetupAppRequiredViewController;
  v13 = -[PKPaymentSetupTableViewController initWithContext:](&v16, sel_initWithContext_, a3);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_product, a5);
    objc_storeStrong((id *)&v14->_linkedApplication, a6);
    objc_storeWeak((id *)&v14->_setupDelegate, v10);
    v14->_isBridge = PKPaymentSetupContextIsBridge();
    v14->_isBuddy = PKPaymentSetupContextIsSetupAssistant();
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  PKTableHeaderView *v4;
  PKTableHeaderView *v5;
  PKTableHeaderView *headerView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKPaymentSetupAppRequiredViewController;
  -[PKPaymentSetupAppRequiredViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKLinkedAppCellReuseIdentifier"));

  v4 = [PKTableHeaderView alloc];
  v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerView = self->_headerView;
  self->_headerView = v5;

  -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("BANK_APP_REQUIRED_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupAppRequiredViewController _subtitle](self, "_subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  -[PKTableHeaderView sizeToFit](self->_headerView, "sizeToFit");
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTableHeaderView:", self->_headerView);

  -[PKPaymentSetupTableViewController context](self, "context");
  LODWORD(v10) = PKPaymentSetupContextIsSetupAssistant();
  v12 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v13 = v12;
  if ((_DWORD)v10)
  {
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v14, 0, self, sel__doneButtonTapped_);

  }
  else
  {
    v15 = (void *)objc_msgSend(v12, "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonTapped_);
  }
  -[PKPaymentSetupAppRequiredViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRightBarButtonItem:", v15);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupAppRequiredViewController;
  -[PKPaymentSetupTableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupAppRequiredViewController;
  -[PKPaymentSetupAppRequiredViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[PKTableHeaderView sizeToFit](self->_headerView, "sizeToFit");
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableHeaderView bounds](self->_headerView, "bounds");
  objc_msgSend(v3, "_tableHeaderHeightDidChangeToHeight:", CGRectGetHeight(v5));

}

- (id)_subtitle
{
  _BOOL4 v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[PKLinkedApplication isInstalled](self->_linkedApplication, "isInstalled");
  -[PKPaymentSetupProduct displayName](self->_product, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = CFSTR("BANK_APP_REQUIRED_INSTALLED_SUBTITLE");
  else
    v5 = CFSTR("BANK_APP_REQUIRED_UNINSTALLED_SUBTITLE");
  PKLocalizedPaymentString(&v5->isa, CFSTR("%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (self->_isBuddy)
  {
    objc_msgSend(v7, "appendString:", CFSTR("\n\n"));
    -[PKPaymentSetupProduct displayName](self->_product, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("BANK_APP_REQUIRED_BUDDY_SUBTITLE"), CFSTR("%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v9);

  }
  v10 = (void *)objc_msgSend(v7, "copy");

  return v10;
}

- (void)_doneButtonTapped:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKPaymentSetupAppRequiredViewController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return !self->_isBuddy;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  PKLinkedAppView *v5;
  void *v6;

  v5 = -[PKLinkedAppView initWithLinkedApplication:reuseIdentifier:]([PKLinkedAppView alloc], "initWithLinkedApplication:reuseIdentifier:", self->_linkedApplication, CFSTR("PKLinkedAppCellReuseIdentifier"));
  -[PKLinkedAppView linkedAppView](v5, "linkedAppView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupAppRequiredViewController;
  -[PKPaymentSetupTableViewController tableView:didSelectRowAtIndexPath:](&v5, sel_tableView_didSelectRowAtIndexPath_, a3, a4);
  -[PKProvisioningAnalyticsSessionUIReporter reportOtherButtonPressed:](self->_reporter, "reportOtherButtonPressed:", CFSTR("appLink"));
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupAppRequiredViewController;
  -[PKPaymentSetupTableViewController tableView:willDisplayCell:forRowAtIndexPath:](&v15, sel_tableView_willDisplayCell_forRowAtIndexPath_, a3, v8, v9);
  if (!objc_msgSend(v9, "section") && !objc_msgSend(v9, "row") && self->_isBridge)
  {
    v10 = v8;
    PKBridgeTextColor();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMainLabelColor:", v11);

    PKBridgeAltTextColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSubTextLabelColor:", v12);

    PKBridgeBackgroundColor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setButtonBackgroundColor:", v13);

    BPSBridgeTintColor();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setButtonTintColor:", v14);

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

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end
