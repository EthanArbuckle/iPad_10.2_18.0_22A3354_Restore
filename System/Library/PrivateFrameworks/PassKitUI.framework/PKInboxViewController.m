@implementation PKInboxViewController

- (PKInboxViewController)initWithInboxDataSource:(id)a3 contactAvatarManager:(id)a4 context:(int64_t)a5
{
  id v9;
  id v10;
  PKInboxViewController *v11;
  PKInboxViewController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIActivityIndicatorView *activityIndicator;
  void *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKInboxViewController;
  v11 = -[PKInboxViewController initWithStyle:](&v19, sel_initWithStyle_, 1);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSource, a3);
    objc_storeStrong((id *)&v12->_avatarManager, a4);
    v12->_context = a5;
    -[PKInboxViewController navigationItem](v12, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v13, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, v12, sel__doneButtonTapped_);
    objc_msgSend(v14, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
    objc_msgSend(v13, "setLeftBarButtonItem:", v14);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v12->_activityIndicator;
    v12->_activityIndicator = (UIActivityIndicatorView *)v15;

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v12->_activityIndicator);
    objc_msgSend(v13, "setRightBarButtonItem:", v17);

  }
  return v12;
}

- (void)presentInboxMessageWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[PKInboxDataSource inboxMessageWithIdentifier:](self->_dataSource, "inboxMessageWithIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      -[PKInboxViewController _presentInboxMessage:](self, "_presentInboxMessage:", v4);
      v4 = v5;
    }

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
  PKTableViewDiffableDataSource *v9;
  PKTableViewDiffableDataSource *v10;
  PKTableViewDiffableDataSource *diffableDataSource;
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKInboxViewController;
  -[PKInboxViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[PKInboxViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("InboxMessageCellReuseIdentifier"));
  v4 = [PKTableHeaderView alloc];
  v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerView = self->_headerView;
  self->_headerView = v5;

  -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("PENDING_INVITATIONS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  objc_msgSend(v3, "setTableHeaderView:", self->_headerView);
  v9 = [PKTableViewDiffableDataSource alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__PKInboxViewController_viewDidLoad__block_invoke;
  v12[3] = &unk_1E3E6AA48;
  v12[4] = self;
  v10 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](v9, "initWithTableView:cellProvider:", v3, v12);
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v10;

  -[PKTableViewDiffableDataSource setSectionHeaderProvider:](self->_diffableDataSource, "setSectionHeaderProvider:", &__block_literal_global_79);
  -[PKTableViewDiffableDataSource setSectionFooterProvider:](self->_diffableDataSource, "setSectionFooterProvider:", &__block_literal_global_25);
  -[PKInboxViewController _updateDiffableDataSourceAnimated:](self, "_updateDiffableDataSourceAnimated:", 0);

}

id __36__PKInboxViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v7 = a4;
  objc_msgSend(a2, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("InboxMessageCellReuseIdentifier"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_configurationForInboxMessage:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentConfiguration:", v9);
  LODWORD(a1) = objc_msgSend(v7, "isExpired");

  if ((_DWORD)a1)
    v10 = 4;
  else
    v10 = 1;
  objc_msgSend(v8, "setAccessoryType:", v10);
  objc_msgSend(v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CB8]);

  return v8;
}

uint64_t __36__PKInboxViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "title");
}

uint64_t __36__PKInboxViewController_viewDidLoad__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "footer");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  PKTableHeaderView *headerView;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;
  CGRect v13;

  v12.receiver = self;
  v12.super_class = (Class)PKInboxViewController;
  -[PKInboxViewController viewWillLayoutSubviews](&v12, sel_viewWillLayoutSubviews);
  -[PKInboxViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInboxViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

  headerView = self->_headerView;
  -[PKInboxViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[PKTableHeaderView sizeThatFits:](headerView, "sizeThatFits:", CGRectGetWidth(v13), 1.79769313e308);
  v8 = v7;
  v10 = v9;

  if (self->_previousHeaderHeight != v10)
  {
    self->_previousHeaderHeight = v10;
    -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v8, v10);
    -[PKInboxViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_tableHeaderHeightDidChangeToHeight:", v10);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  PKTableViewDiffableDataSource *diffableDataSource;
  id v7;
  id v8;
  id v9;

  diffableDataSource = self->_diffableDataSource;
  v7 = a4;
  v8 = a3;
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](diffableDataSource, "itemIdentifierForIndexPath:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PKInboxViewController _presentInboxMessage:](self, "_presentInboxMessage:", v9);
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return !self->_disableSelection;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  -[PKInboxViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
  -[PKInboxViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_presentInboxMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = v4;
    if (objc_msgSend(v4, "isExpired"))
    {
      -[PKInboxViewController _presentExpiredAlertForInboxMessage:](self, "_presentExpiredAlertForInboxMessage:", v8);
LABEL_6:
      v5 = v8;
      goto LABEL_7;
    }
    v6 = objc_msgSend(v8, "type");
    v5 = v8;
    if (!v6)
    {
      objc_msgSend(v8, "accountUserInvitation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKInboxViewController _presentAccountUserInvitation:](self, "_presentAccountUserInvitation:", v7);

      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)_presentExpiredAlertForInboxMessage:(id)a3
{
  id v4;
  void *v5;
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
  void *v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    v18 = v4;
    if (objc_msgSend(v4, "type"))
    {
      v5 = 0;
      v6 = 0;
    }
    else
    {
      objc_msgSend(v18, "accountUserInvitation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "invitationDetails");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0D66C60];
      objc_msgSend(v18, "familyMember");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "originatorNameComponents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contactForFamilyMember:nameComponents:imageData:", v10, v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedMadisonString(CFSTR("EXPIRED_INVITATION_ALERT_TITLE"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pkFullName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMadisonString(CFSTR("EXPIRED_INVITATION_ALERT_BODY"), CFSTR("%@"), v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 && v6)
      {
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedMadisonString(CFSTR("EXPIRED_INVITATION_BUTTON"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAction:", v17);

        -[PKInboxViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
      }
    }

    v4 = v18;
  }

}

- (void)_doneButtonTapped:(id)a3
{
  -[PKInboxViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_configurationForInboxMessage:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "type"))
  {
    v4 = 0;
  }
  else
  {
    +[PKInboxMessageContentConfiguration configurationWithInboxMessage:](PKInboxMessageContentConfiguration, "configurationWithInboxMessage:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_updateDiffableDataSourceAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  PKTableViewDiffableDataSourceSection *v7;
  void *v8;
  void *v9;
  PKTableViewDiffableDataSourceSection *v10;
  void *v11;
  void *v12;
  PKTableViewDiffableDataSourceSection *v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[PKInboxDataSource activeInboxMessages](self->_dataSource, "activeInboxMessages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("ActiveInboxMessageSectionIdentifier"));
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendSectionsWithIdentifiers:", v8);

    objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v6, v7);
  }
  -[PKInboxDataSource expiredInboxMessages](self->_dataSource, "expiredInboxMessages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v10 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("ExpiredInboxMessageSectionIdentifier"));
    PKLocalizedMadisonString(CFSTR("EXPIRED_INVITATIONS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTableViewDiffableDataSourceSection setTitle:](v10, "setTitle:", v11);

    v13 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendSectionsWithIdentifiers:", v12);

    objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v9, v10);
  }
  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v5, v3);

}

- (void)_updateImage:(id)a3 onCellAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PKInboxViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "contentConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v10);
    objc_msgSend(v8, "setContentConfiguration:", v9);

  }
}

- (void)_showSpinner:(BOOL)a3
{
  UIActivityIndicatorView *activityIndicator;

  self->_disableSelection = a3;
  activityIndicator = self->_activityIndicator;
  if (a3)
    -[UIActivityIndicatorView startAnimating](activityIndicator, "startAnimating");
  else
    -[UIActivityIndicatorView stopAnimating](activityIndicator, "stopAnimating");
}

- (void)_presentAccountUserInvitation:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD aBlock[4];
  id v13;
  PKInboxViewController *v14;

  v4 = a3;
  -[PKInboxViewController _showSpinner:](self, "_showSpinner:", 1);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke;
  aBlock[3] = &unk_1E3E61388;
  v6 = v4;
  v13 = v6;
  v14 = self;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_6;
  v9[3] = &unk_1E3E689B8;
  v10 = v6;
  v11 = _Block_copy(aBlock);
  v9[4] = self;
  v7 = v6;
  v8 = v11;
  -[PKInboxViewController _checkManateeCapabilityForFeatureApplication:completion:](self, "_checkManateeCapabilityForFeatureApplication:completion:", v7, v9);

}

void __55__PKInboxViewController__presentAccountUserInvitation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "feature");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_2;
  v6[3] = &unk_1E3E69B20;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "defaultAccountForFeature:completion:", v3, v6);

}

void __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_3;
  block[3] = &unk_1E3E61400;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKApplyControllerConfiguration *v8;
  PKApplyController *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v2 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithWebService:", v3);

  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "feature");
  PKFeatureIdentifierToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowedFeatureIdentifiers:", v7);

  v8 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:]([PKApplyControllerConfiguration alloc], "initWithSetupDelegate:context:provisioningController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1024), v4);
  -[PKApplyControllerConfiguration setFeatureApplication:](v8, "setFeatureApplication:", *(_QWORD *)(a1 + 32));
  v9 = -[PKApplyController initWithApplyConfiguration:]([PKApplyController alloc], "initWithApplyConfiguration:", v8);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(v10 + 1072);
  *(_QWORD *)(v10 + 1072) = v9;

  v12 = *(void **)(*(_QWORD *)(a1 + 40) + 1072);
  objc_msgSend(MEMORY[0x1E0D66820], "analyticsAccountTypeForAccount:", *(_QWORD *)(a1 + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAnalyticsExistingAccountType:", v13);

  objc_initWeak(&location, *(id *)(a1 + 40));
  v14 = *(void **)(*(_QWORD *)(a1 + 40) + 1072);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_4;
  v15[3] = &unk_1E3E62598;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v14, "nextViewControllerWithCompletion:", v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_5;
      v11[3] = &unk_1E3E62288;
      v11[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v11);

    }
    else
    {
      if (v6)
      {
        v10 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
        objc_msgSend(v8, "presentViewController:animated:completion:", v10, 1, 0);

      }
      objc_msgSend(v8, "_showSpinner:", 0);
    }
  }

}

uint64_t __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
}

void __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_6(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_7;
    v6[3] = &unk_1E3E66918;
    v5 = *(id *)(a1 + 48);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    objc_msgSend(v3, "_presentManateeUpgradeForFeatureApplication:completion:", v4, v6);

  }
}

void __55__PKInboxViewController__presentAccountUserInvitation___block_invoke_7(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  if (a2)
  {
    v12 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_5:
    v5 = v12;
    goto LABEL_6;
  }
  if (v5)
  {
    v12 = v5;
    PKTitleForDisplayableError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE46BC](v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("HSA_OK_BUTTON_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v11);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_checkManateeCapabilityForFeatureApplication:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKSecurityCapabilitiesController *v8;
  uint64_t v9;
  PKSecurityCapabilitiesController *v10;
  PKSecurityCapabilitiesController *securityCapabilitiesController;
  PKSecurityCapabilitiesController *v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    v8 = [PKSecurityCapabilitiesController alloc];
    v9 = objc_msgSend(v7, "feature");

    v10 = -[PKSecurityCapabilitiesController initWithRequirements:feature:context:](v8, "initWithRequirements:feature:context:", 8, v9, self->_context);
    securityCapabilitiesController = self->_securityCapabilitiesController;
    self->_securityCapabilitiesController = v10;

    v12 = self->_securityCapabilitiesController;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__PKInboxViewController__checkManateeCapabilityForFeatureApplication_completion___block_invoke;
    v13[3] = &unk_1E3E6AAD0;
    v14 = v6;
    -[PKSecurityCapabilitiesController isEnabledForSecuirtyRequirementsWithCompletion:](v12, "isEnabledForSecuirtyRequirementsWithCompletion:", v13);

  }
}

void __81__PKInboxViewController__checkManateeCapabilityForFeatureApplication_completion___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__PKInboxViewController__checkManateeCapabilityForFeatureApplication_completion___block_invoke_2;
  v3[3] = &unk_1E3E61A58;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __81__PKInboxViewController__checkManateeCapabilityForFeatureApplication_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_presentManateeUpgradeForFeatureApplication:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKSecurityCapabilitiesController *v8;
  PKSecurityCapabilitiesController *securityCapabilitiesController;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  PKSecurityCapabilitiesController *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v7)
  {
    v8 = -[PKSecurityCapabilitiesController initWithRequirements:feature:context:]([PKSecurityCapabilitiesController alloc], "initWithRequirements:feature:context:", 8, objc_msgSend(v6, "feature"), self->_context);
    securityCapabilitiesController = self->_securityCapabilitiesController;
    self->_securityCapabilitiesController = v8;

    -[PKInboxViewController navigationController](self, "navigationController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (PKPaymentSetupContextIsBridge())
    {
      objc_msgSend(v10, "viewControllers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Presenting hsa2 flow for account user invitation", buf, 2u);
    }

    v14 = self->_securityCapabilitiesController;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke;
    v15[3] = &unk_1E3E6AB20;
    v15[4] = self;
    v16 = v6;
    v17 = v7;
    -[PKSecurityCapabilitiesController presentSecurityRepairFlowWithPresentingViewController:completion:](v14, "presentSecurityRepairFlowWithPresentingViewController:completion:", v11, v15);

  }
}

void __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke_2;
  block[3] = &unk_1E3E6AAF8;
  v14 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 48);
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void (*v8)(void);
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    PKSecurityCapabilitiesErrorToString(*(_QWORD *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking account user invitation security capabilities with upgrade error %@, error %@", buf, 0x16u);

  }
  v5 = *(_QWORD *)(a1 + 64);
  if (v5 == 3)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_10:
    v8();
    return;
  }
  if (v5)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "User successfully completed. Ensuring that they indeed supportsDeviceToDeviceEncryption", buf, 2u);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke_61;
  v9[3] = &unk_1E3E614F0;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v6, "_checkManateeCapabilityForFeatureApplication:completion:", v7, v9);

}

void __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke_61(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke_2_62;
  v3[3] = &unk_1E3E61A58;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __80__PKInboxViewController__presentManateeUpgradeForFeatureApplication_completion___block_invoke_2_62(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_securityCapabilitiesController, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
