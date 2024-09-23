@implementation PKAccountInvitationAccessLevelViewController

- (PKAccountInvitationAccessLevelViewController)initWithController:(id)a3
{
  id v5;
  PKAccountInvitationAccessLevelViewController *v6;
  PKAccountInvitationAccessLevelViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountInvitationAccessLevelViewController;
  v6 = -[PKPaymentSetupTableViewController initWithContext:](&v9, sel_initWithContext_, objc_msgSend(v5, "context"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_controller, a3);

  return v7;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  PKAccountInvitationController *controller;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  controller = self->_controller;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PKAccountInvitationAccessLevelViewController_preflightWithCompletion___block_invoke;
  v7[3] = &unk_1E3E63110;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[PKAccountInvitationController accessLevelOptionsWithCompletion:](controller, "accessLevelOptionsWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __72__PKAccountInvitationAccessLevelViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = objc_msgSend(v7, "copy");
    v5 = (void *)WeakRetained[137];
    WeakRetained[137] = v4;

    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
  }

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIButton *v18;
  UIButton *footerView;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKAccountInvitationAccessLevelViewController;
  -[PKAccountInvitationAccessLevelViewController viewDidLoad](&v23, sel_viewDidLoad);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AccessLevelCellReuseIdentifier"));
  v4 = [PKTableHeaderView alloc];
  v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerView = self->_headerView;
  self->_headerView = v5;

  -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("SHARING_TYPE_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountInvitationController familyMember](self->_controller, "familyMember");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("SHARING_TYPE_SUBTITLE"), CFSTR("%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v12);

  -[PKTableHeaderView setTopPadding:](self->_headerView, "setTopPadding:", 30.0);
  -[PKTableHeaderView setBottomPadding:](self->_headerView, "setBottomPadding:", 20.0);
  objc_msgSend(v3, "setTableHeaderView:", self->_headerView);
  v13 = (void *)MEMORY[0x1E0DC3520];
  PKLocalizedMadisonString(CFSTR("ABOUT_SHARING_TYPES_BUTTON"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pkui_plainConfigurationWithTitle:font:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x1E0DC3428];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __59__PKAccountInvitationAccessLevelViewController_viewDidLoad__block_invoke;
  v20[3] = &unk_1E3E62BD0;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v16, "actionWithHandler:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v15, v17);
  v18 = (UIButton *)objc_claimAutoreleasedReturnValue();
  footerView = self->_footerView;
  self->_footerView = v18;

  -[UIButton setAccessibilityIdentifier:](self->_footerView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C18]);
  objc_msgSend(v3, "setTableFooterView:", self->_footerView);
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D677F8]);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __59__PKAccountInvitationAccessLevelViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_handleFooterButtonTapped:", v4);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double Width;
  double v5;
  double v6;
  double v7;
  double *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)PKAccountInvitationAccessLevelViewController;
  -[PKPaymentSetupTableViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  -[PKAccountInvitationAccessLevelViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v16);

  -[PKTableHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", Width, 1.79769313e308);
  v7 = v5;
  v8 = (double *)MEMORY[0x1E0C9D538];
  if (self->_previousHeaderHeight != v6)
  {
    v9 = v6;
    self->_previousHeaderHeight = v6;
    -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", *v8, v8[1], v5, v6);
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_tableHeaderHeightDidChangeToHeight:", v9);

  }
  -[UIButton sizeThatFits:](self->_footerView, "sizeThatFits:", Width, 1.79769313e308, v7);
  if (self->_previousFooterHeight != v12)
  {
    v13 = v12;
    self->_previousFooterHeight = v12;
    -[UIButton setFrame:](self->_footerView, "setFrame:", *v8, v8[1], v11, v12);
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_tableFooterHeightDidChangeToHeight:", v13);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)PKAccountInvitationAccessLevelViewController;
  -[PKPaymentSetupTableViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[PKAccountInvitationController applyController](self->_controller, "applyController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D68620];
  v8 = *MEMORY[0x1E0D68AA0];
  v9[0] = *MEMORY[0x1E0D68C50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", 0, v5, v6);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)PKAccountInvitationAccessLevelViewController;
  -[PKAccountInvitationAccessLevelViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[PKAccountInvitationController applyController](self->_controller, "applyController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D68620];
  v8 = *MEMORY[0x1E0D68AA0];
  v9[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", 0, v5, v6);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_accessLevelOptions, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 5.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return objc_alloc_init(MEMORY[0x1E0DC3F10]);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSArray *accessLevelOptions;
  id v7;
  id v8;
  void *v9;
  void *v10;
  PKAccountInvitationAccessLevelContentConfiguration *v11;
  void *v12;
  void *v13;

  accessLevelOptions = self->_accessLevelOptions;
  v7 = a4;
  v8 = a3;
  -[NSArray objectAtIndexedSubscript:](accessLevelOptions, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AccessLevelCellReuseIdentifier"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PKAccountInvitationAccessLevelContentConfiguration initWithAccessLevelOption:]([PKAccountInvitationAccessLevelContentConfiguration alloc], "initWithAccessLevelOption:", v9);
  objc_msgSend(v10, "setContentConfiguration:", v11);
  objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(v10, "setBackgroundConfiguration:", v12);
  -[PKAccountInvitationAccessLevelViewController _updateCell:showSpinner:](self, "_updateCell:showSpinner:", v10, self->_loadingIndexPath != 0);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSIndexPath *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  NSIndexPath *loadingIndexPath;
  NSIndexPath *v16;
  PKAccountInvitationController *controller;
  _QWORD v18[5];
  objc_super v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v6 = (NSIndexPath *)a4;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountInvitationAccessLevelViewController;
  -[PKPaymentSetupTableViewController tableView:didSelectRowAtIndexPath:](&v19, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  -[NSArray objectAtIndexedSubscript:](self->_accessLevelOptions, "objectAtIndexedSubscript:", -[NSIndexPath section](v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountInvitationController setAccessLevel:](self->_controller, "setAccessLevel:", objc_msgSend(v7, "accessLevel"));
  v8 = *MEMORY[0x1E0D68B18];
  v9 = *MEMORY[0x1E0D68858];
  v20[0] = *MEMORY[0x1E0D68AA0];
  v20[1] = v9;
  v10 = *MEMORY[0x1E0D68698];
  v21[0] = v8;
  v21[1] = v10;
  v20[2] = *MEMORY[0x1E0D68B90];
  v11 = objc_msgSend(v7, "accessLevel");
  v12 = (_QWORD *)MEMORY[0x1E0D68AB0];
  if (v11 != 1)
    v12 = (_QWORD *)MEMORY[0x1E0D68AC0];
  v21[2] = *v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountInvitationController applyController](self->_controller, "applyController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", 0, *MEMORY[0x1E0D68620], v13);

  loadingIndexPath = self->_loadingIndexPath;
  self->_loadingIndexPath = v6;
  v16 = v6;

  -[PKAccountInvitationAccessLevelViewController _showSpinner:atIndexPath:](self, "_showSpinner:atIndexPath:", 1, v16);
  controller = self->_controller;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__PKAccountInvitationAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v18[3] = &unk_1E3E62260;
  v18[4] = self;
  -[PKAccountInvitationController nextViewControllerWithCompletion:](controller, "nextViewControllerWithCompletion:", v18);

}

void __82__PKAccountInvitationAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v7, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __82__PKAccountInvitationAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v25[3] = &unk_1E3E62288;
    v25[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v25);
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v7, "_showSpinner:atIndexPath:", 0, v7[142]);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 1136);
  *(_QWORD *)(v9 + 1136) = 0;

  if (v6)
  {
    v6 = v6;
    objc_msgSend(v6, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0D69DC8];
    v13 = PKEqualObjects();

    v8 = v6;
    if (v13)
    {
      objc_msgSend(v6, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (PKEqualObjects())
    {
      v16 = objc_msgSend(v8, "code");

      if (v16 == 60002)
      {
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v26[0] = *MEMORY[0x1E0CB2D50];
        PKLocalizedMadisonString(CFSTR("APPLY_UNDERAGE_USER_ERROR_TITLE"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v17;
        v26[1] = *MEMORY[0x1E0CB2D80];
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "familyMember");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedMadisonString(CFSTR("APPLY_UNDERAGE_USER_ERROR_DESCRIPTION"), CFSTR("%@"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26[2] = *MEMORY[0x1E0CB3388];
        v27[1] = v20;
        v27[2] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", v12, 60002, v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v22;
      }
    }
    else
    {

    }
    v23 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v23, 1, 0);

    goto LABEL_11;
  }
LABEL_12:

}

void __82__PKAccountInvitationAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_showSpinner:atIndexPath:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1136);
  *(_QWORD *)(v2 + 1136) = 0;

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return self->_loadingIndexPath == 0;
}

- (void)_handleFooterButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  PKNavigationController *v6;
  void *v7;
  PKPaymentMoreInformationViewController *v8;

  v8 = -[PKPaymentMoreInformationViewController initWithContext:]([PKPaymentMoreInformationViewController alloc], "initWithContext:", -[PKPaymentSetupTableViewController context](self, "context"));
  PKLocalizedMadisonString(CFSTR("ABOUT_ACCESS_LEVEL_LEGAL_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMoreInformationViewController setDetailTitle:](v8, "setDetailTitle:", v4);

  PKLocalizedMadisonString(CFSTR("ABOUT_ACCESS_LEVEL_LEGAL_BODY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMoreInformationViewController setDetailBody:](v8, "setDetailBody:", v5);

  v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
  -[PKAccountInvitationAccessLevelViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)_showSpinner:(BOOL)a3 atIndexPath:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v6 = a4;
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    -[PKAccountInvitationAccessLevelViewController _updateCell:showSpinner:](self, "_updateCell:showSpinner:", v9, v4);
    v8 = v9;
  }

}

- (void)_updateCell:(id)a3 showSpinner:(BOOL)a4
{
  objc_class *v4;
  id v5;
  id v6;

  if (a4)
  {
    v4 = (objc_class *)MEMORY[0x1E0DC3438];
    v5 = a3;
    v6 = (id)objc_msgSend([v4 alloc], "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v6, "startAnimating");
    objc_msgSend(v5, "setAccessoryView:", v6);
    objc_msgSend(v5, "setAccessoryType:", 0);

  }
  else
  {
    v6 = a3;
    objc_msgSend(v6, "setAccessoryType:", 1);
    objc_msgSend(v6, "setAccessoryView:", 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndexPath, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_accessLevelOptions, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
