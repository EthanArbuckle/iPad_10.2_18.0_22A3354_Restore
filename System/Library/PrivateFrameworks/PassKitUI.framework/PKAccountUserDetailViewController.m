@implementation PKAccountUserDetailViewController

- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 accountUser:(id)a6 familyMemberCollection:(id)a7 avatarManager:(id)a8 contactResolver:(id)a9 hideUserDetailHeader:(BOOL)a10
{
  id v16;
  id v17;
  PKAccountUserDetailViewController *v18;
  PKAccountUserDetailViewController *v19;
  void *v20;
  uint64_t v21;
  PKAppleAccountInformation *appleAccountInformation;
  PKAccountService *accountService;
  void *v24;
  uint64_t v26;
  _QWORD v27[4];
  PKAccountUserDetailViewController *v28;

  v16 = a5;
  v17 = a6;
  LOBYTE(v26) = a10;
  v18 = -[PKAccountUserDetailViewController initWithPaymentPass:style:account:familyMemberCollection:avatarManager:contactResolver:hideUserDetailHeader:](self, "initWithPaymentPass:style:account:familyMemberCollection:avatarManager:contactResolver:hideUserDetailHeader:", a3, a4, v16, a7, a8, a9, v26);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountUser, a6);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_appleAccountInformation");
    v21 = objc_claimAutoreleasedReturnValue();
    appleAccountInformation = v19->_appleAccountInformation;
    v19->_appleAccountInformation = (PKAppleAccountInformation *)v21;

    accountService = v19->_accountService;
    objc_msgSend(v16, "accountIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __157__PKAccountUserDetailViewController_initWithPaymentPass_style_account_accountUser_familyMemberCollection_avatarManager_contactResolver_hideUserDetailHeader___block_invoke;
    v27[3] = &unk_1E3E65238;
    v28 = v19;
    -[PKAccountService physicalCardsForAccountWithIdentifier:completion:](accountService, "physicalCardsForAccountWithIdentifier:completion:", v24, v27);

  }
  return v19;
}

void __157__PKAccountUserDetailViewController_initWithPaymentPass_style_account_accountUser_familyMemberCollection_avatarManager_contactResolver_hideUserDetailHeader___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __157__PKAccountUserDetailViewController_initWithPaymentPass_style_account_accountUser_familyMemberCollection_avatarManager_contactResolver_hideUserDetailHeader___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __157__PKAccountUserDetailViewController_initWithPaymentPass_style_account_accountUser_familyMemberCollection_avatarManager_contactResolver_hideUserDetailHeader___block_invoke_2(uint64_t a1)
{
  PKPhysicalCardController *v2;
  uint64_t v3;
  void *v4;
  PKPhysicalCardActionController *v5;
  uint64_t v6;
  void *v7;

  v2 = -[PKPhysicalCardController initWithAccountService:paymentPass:account:accountUser:physicalCards:]([PKPhysicalCardController alloc], "initWithAccountService:paymentPass:account:accountUser:physicalCards:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056), *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1144);
  *(_QWORD *)(v3 + 1144) = v2;

  v5 = -[PKPhysicalCardActionController initWithAccountService:account:accountUser:delegate:]([PKPhysicalCardActionController alloc], "initWithAccountService:account:accountUser:delegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1152);
  *(_QWORD *)(v6 + 1152) = v5;

  return objc_msgSend(*(id *)(a1 + 32), "_updateConfigurationAnimated:", 1);
}

- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 accountUser:(id)a6 familyMemberCollection:(id)a7 avatarManager:(id)a8 contactResolver:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[PKAccountUserDetailViewController initWithPaymentPass:style:account:accountUser:familyMemberCollection:avatarManager:contactResolver:hideUserDetailHeader:](self, "initWithPaymentPass:style:account:accountUser:familyMemberCollection:avatarManager:contactResolver:hideUserDetailHeader:", a3, a4, a5, a6, a7, a8, a9, v10);
}

- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 accountUserInvitation:(id)a6 familyMemberCollection:(id)a7 avatarManager:(id)a8 contactResolver:(id)a9 hideUserDetailHeader:(BOOL)a10
{
  id v17;
  PKAccountUserDetailViewController *v18;
  PKAccountUserDetailViewController *v19;
  uint64_t v21;

  v17 = a6;
  LOBYTE(v21) = a10;
  v18 = -[PKAccountUserDetailViewController initWithPaymentPass:style:account:familyMemberCollection:avatarManager:contactResolver:hideUserDetailHeader:](self, "initWithPaymentPass:style:account:familyMemberCollection:avatarManager:contactResolver:hideUserDetailHeader:", a3, a4, a5, a7, a8, a9, v21);
  v19 = v18;
  if (v18)
    objc_storeStrong((id *)&v18->_accountUserInvitation, a6);

  return v19;
}

- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 accountUserInvitation:(id)a6 familyMemberCollection:(id)a7 avatarManager:(id)a8 contactResolver:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[PKAccountUserDetailViewController initWithPaymentPass:style:account:accountUserInvitation:familyMemberCollection:avatarManager:contactResolver:hideUserDetailHeader:](self, "initWithPaymentPass:style:account:accountUserInvitation:familyMemberCollection:avatarManager:contactResolver:hideUserDetailHeader:", a3, a4, a5, a6, a7, a8, a9, v10);
}

- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 familyMemberCollection:(id)a6 avatarManager:(id)a7 contactResolver:(id)a8 hideUserDetailHeader:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  PKAccountUserDetailViewController *v19;
  PKAccountUserDetailViewController *v20;
  uint64_t v21;
  PKAccountService *accountService;
  uint64_t v23;
  PKPaymentService *paymentService;
  void *v25;
  void *v26;
  id v28;
  id v29;
  objc_super v30;

  v16 = a3;
  v17 = a5;
  v29 = a6;
  v28 = a7;
  v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)PKAccountUserDetailViewController;
  v19 = -[PKAccountUserDetailViewController initWithStyle:](&v30, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1));
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_paymentPass, a3);
    v20->_style = a4;
    objc_storeStrong((id *)&v20->_account, a5);
    objc_storeStrong((id *)&v20->_familyMemberCollection, a6);
    objc_storeStrong((id *)&v20->_avatarManager, a7);
    objc_storeStrong((id *)&v20->_contactResolver, a8);
    v20->_hideUserDetailHeader = a9;
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v21 = objc_claimAutoreleasedReturnValue();
    accountService = v20->_accountService;
    v20->_accountService = (PKAccountService *)v21;

    -[PKAccountService registerObserver:](v20->_accountService, "registerObserver:", v20);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", v20);
    paymentService = v20->_paymentService;
    v20->_paymentService = (PKPaymentService *)v23;

    -[PKAccountUserDetailViewController navigationItem](v20, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v25, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    if (v20->_hideUserDetailHeader)
    {
      PKLocalizedMadisonString(CFSTR("SHARING_SETTINGS_USER_DETAILS_TITLE"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTitle:", v26);

    }
  }

  return v20;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKAccountUserDetailViewController;
  -[PKAccountUserDetailViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  PKAccountUserDetailHeaderView *v4;
  PKAccountUserDetailHeaderView *v5;
  PKAccountUserDetailHeaderView *headerView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAccountUserDetailViewController;
  -[PKSettingsTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[PKAccountUserDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_hideUserDetailHeader)
  {
    v4 = [PKAccountUserDetailHeaderView alloc];
    v5 = -[PKAccountUserDetailHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    headerView = self->_headerView;
    self->_headerView = v5;

    objc_msgSend(v3, "setTableHeaderView:", self->_headerView);
  }
  -[PKAccountUserDetailViewController _loadPeerPaymentAccount](self, "_loadPeerPaymentAccount");
  -[PKAccountUserDetailViewController _updateContactInfoAndHeaderViewAnimated:](self, "_updateContactInfoAndHeaderViewAnimated:", 0);
  -[PKAccountUserDetailViewController _updateConfigurationAnimated:](self, "_updateConfigurationAnimated:", 0);
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67820]);

}

- (void)viewWillLayoutSubviews
{
  PKAccountUserDetailHeaderView *headerView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  CGRect v13;

  v12.receiver = self;
  v12.super_class = (Class)PKAccountUserDetailViewController;
  -[PKAccountUserDetailViewController viewWillLayoutSubviews](&v12, sel_viewWillLayoutSubviews);
  if (!self->_hideUserDetailHeader)
  {
    headerView = self->_headerView;
    -[PKAccountUserDetailViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    -[PKAccountUserDetailHeaderView sizeThatFits:](headerView, "sizeThatFits:", CGRectGetWidth(v13), 1.79769313e308);
    v6 = v5;
    v8 = v7;

    if (self->_previousHeaderHeight != v8)
    {
      self->_previousHeaderHeight = v8;
      -[PKAccountUserDetailHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v6, v8);
      -[PKAccountUserDetailViewController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_tableHeaderHeightDidChangeToHeight:", v8);

    }
  }
  -[PKAccountUserDetailViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountUserDetailViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v11);

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;

  v5 = a3;
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView:titleForHeaderInSection:", v5, a4);
  v7 = objc_claimAutoreleasedReturnValue();

  if (a4 | v7)
    v8 = *MEMORY[0x1E0DC53D8];
  else
    v8 = 20.0;

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView:titleForHeaderInSection:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (!a4 && !v7)
    v8 = objc_alloc_init(MEMORY[0x1E0DC3F10]);

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:titleForFooterInSection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    || -[PKSettingsTableViewController indexOfSectionWithIdentifier:](self, "indexOfSectionWithIdentifier:", CFSTR("rewardsBalance")) != a4)
  {
    v9 = 0;
  }
  else
  {
    -[PKAccountUserDetailViewController _footerViewForPeerPaymentAccountSetup](self, "_footerViewForPeerPaymentAccountSetup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)featureApplicationChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKAccountUserDetailViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__PKAccountUserDetailViewController_featureApplicationChanged___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __63__PKAccountUserDetailViewController_featureApplicationChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  char v6;
  char IsTerminal;
  int v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1080), "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v2;
  v4 = v3;
  if (v11 == v4)
  {

LABEL_10:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1080), "applicationState");
    IsTerminal = PKFeatureApplicationStateIsTerminal();
    objc_msgSend(*(id *)(a1 + 32), "applicationState");
    v8 = PKFeatureApplicationStateIsTerminal();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1080), *(id *)(a1 + 32));
    v9 = *(void **)(a1 + 40);
    if ((IsTerminal & 1) == 0 && v8)
    {
      objc_msgSend(v9, "navigationController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v11, "popViewControllerAnimated:", 1);
      goto LABEL_13;
    }
    objc_msgSend(v9, "_updateConfigurationAnimated:", 1);
    return;
  }
  if (v11)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
  {

LABEL_13:
    return;
  }
  v6 = objc_msgSend(v11, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
    goto LABEL_10;
}

- (void)featureApplicationRemoved:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKAccountUserDetailViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__PKAccountUserDetailViewController_featureApplicationRemoved___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __63__PKAccountUserDetailViewController_featureApplicationRemoved___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  char v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1080), "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v2;
  v4 = v3;
  if (v8 == v4)
  {

    goto LABEL_10;
  }
  if (v8)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
  {

LABEL_11:
    return;
  }
  v6 = objc_msgSend(v8, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
  {
LABEL_10:
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);
    goto LABEL_11;
  }
}

- (void)accountChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKAccountUserDetailViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PKAccountUserDetailViewController_accountChanged___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __52__PKAccountUserDetailViewController_accountChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  char v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  v4 = v3;
  if (v7 == v4)
  {

LABEL_10:
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "isContentEqualToAccount:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1048), *(id *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1144), "updateWithAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1048));
      objc_msgSend(*(id *)(a1 + 40), "_updateConfigurationAnimated:", 1);
    }
    return;
  }
  if (v7)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
  {

    return;
  }
  v6 = objc_msgSend(v7, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
    goto LABEL_10;
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKAccountUserDetailViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKAccountUserDetailViewController_physicalCardsChanged_forAccountIdentifier___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __79__PKAccountUserDetailViewController_physicalCardsChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  int v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

LABEL_10:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1144), "updateWithPhysicalCards:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_updateConfigurationAnimated:", 1);
    return;
  }
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v8 = v5;
  if (v6)
  {

    return;
  }
  v7 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v7)
    goto LABEL_10;
}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKAccountUserDetailViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKAccountUserDetailViewController_accountUsersChanged_forAccountIdentifier___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __78__PKAccountUserDetailViewController_accountUsersChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

LABEL_10:
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 1056);
    if (v9 && !*(_BYTE *)(v8 + 1176))
    {
      objc_msgSend(v9, "altDSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v11 = *(id *)(a1 + 48);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v26;
LABEL_14:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
          objc_msgSend(v16, "altDSID");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v18 = v10;
          v19 = v18;
          if (v17 == v18)
            break;
          if (v10 && v17)
          {
            v20 = objc_msgSend(v17, "isEqualToString:", v18);

            if ((v20 & 1) != 0)
              goto LABEL_27;
          }
          else
          {

          }
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
            if (v13)
              goto LABEL_14;
            goto LABEL_25;
          }
        }

LABEL_27:
        v21 = v16;

        if (!v21)
          goto LABEL_30;
        if ((PKEqualObjects() & 1) == 0)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1056), v16);
          objc_msgSend(*(id *)(a1 + 40), "_updateConfigurationAnimated:", 1);
        }
      }
      else
      {
LABEL_25:

LABEL_30:
        objc_msgSend(*(id *)(a1 + 40), "navigationController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id)objc_msgSend(v22, "popViewControllerAnimated:", 1);

        v21 = 0;
      }

    }
    return;
  }
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v24 = v5;
  if (v6)
  {

    return;
  }
  v7 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v7)
    goto LABEL_10;
}

- (void)physicalCardActionController:(id)a3 didChangeToState:(int64_t)a4 withError:(id)a5
{
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v7 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PKAccountUserDetailViewController_physicalCardActionController_didChangeToState_withError___block_invoke;
  block[3] = &unk_1E3E63480;
  v10 = v7;
  v11 = a4;
  block[4] = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __93__PKAccountUserDetailViewController_physicalCardActionController_didChangeToState_withError___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = result;
  switch(*(_QWORD *)(result + 48))
  {
    case 0:
    case 2:
      v2 = *(void **)(result + 32);
      v3 = 0;
      goto LABEL_4;
    case 1:
      v2 = *(void **)(result + 32);
      v3 = 1;
LABEL_4:
      result = objc_msgSend(v2, "_setPerformingAction:animated:", v3, 1);
      break;
    case 3:
      result = objc_msgSend(*(id *)(result + 32), "_setPerformingAction:animated:", 0, 1);
      if (*(_QWORD *)(v1 + 40))
        result = objc_msgSend(*(id *)(v1 + 32), "_presentDisplayableError:");
      break;
    default:
      return result;
  }
  return result;
}

- (id)presentationSceneIdentifierForPhysicalCardActionController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKAccountUserDetailViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateContactInfoAndHeaderViewAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  UIImage *v6;
  void *v7;
  PKContactAvatarManager *avatarManager;
  PKAccountUser *accountUser;
  PKFeatureApplication *accountUserInvitation;
  PKAccountUser *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CNContact *v16;
  CNContact *contact;
  int v18;
  PKContactResolver *contactResolver;
  PKAccountUser *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  -[PKFeatureApplication invitationDetails](self->_accountUserInvitation, "invitationDetails", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountUser altDSID](self->_accountUser, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "accountUserAltDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_18;
  }
  -[PKContactAvatarManager cachedAvatarForAltDSID:](self->_avatarManager, "cachedAvatarForAltDSID:", v5);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  -[PKFamilyMemberCollection familyMemberForAltDSID:](self->_familyMemberCollection, "familyMemberForAltDSID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_initWeak(&location, self);
    avatarManager = self->_avatarManager;
    accountUser = self->_accountUser;
    accountUserInvitation = self->_accountUserInvitation;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke;
    v23[3] = &unk_1E3E67C70;
    objc_copyWeak(&v25, &location);
    v24 = v7;
    -[PKContactAvatarManager avatarForFamilyMember:accountUser:invitation:completion:](avatarManager, "avatarForFamilyMember:accountUser:invitation:completion:", v24, accountUser, accountUserInvitation, v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  v11 = self->_accountUser;
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0D66C60];
    -[PKAccountUser nameComponents](v11, "nameComponents");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v14 = (void *)v13;
    if (v6)
    {
      UIImagePNGRepresentation(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v12, "contactForFamilyMember:nameComponents:imageData:", v7, v14, v15);
    v16 = (CNContact *)objc_claimAutoreleasedReturnValue();
    contact = self->_contact;
    self->_contact = v16;

    if (v6)
    goto LABEL_15;
  }
  if (v4)
  {
    v12 = (void *)MEMORY[0x1E0D66C60];
    objc_msgSend(v4, "accountUserNameComponents");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_15:
  if (!self->_hideUserDetailHeader)
  {
    -[PKAccountUserDetailHeaderView setContactForDisplay:](self->_headerView, "setContactForDisplay:", self->_contact);
    if (!self->_hideUserDetailHeader)
    {
      if (self->_accountUser)
      {
        v18 = -[PKContactResolver hasCachedResultForAccountUser:](self->_contactResolver, "hasCachedResultForAccountUser:");
        contactResolver = self->_contactResolver;
        v20 = self->_accountUser;
        if (v18)
        {
          -[PKContactResolver contactForAccountUser:](contactResolver, "contactForAccountUser:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKAccountUserDetailHeaderView setContactForActions:](self->_headerView, "setContactForActions:", v21);

        }
        else
        {
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke_3;
          v22[3] = &unk_1E3E69FC0;
          v22[4] = self;
          -[PKContactResolver contactForAccountUser:withCompletion:](contactResolver, "contactForAccountUser:withCompletion:", v20, v22);
        }
      }
    }
  }

LABEL_18:
}

void __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  UIImage *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x1E0D66C60];
    v5 = *(_QWORD *)(a1 + 32);
    v11 = WeakRetained;
    objc_msgSend(WeakRetained[132], "nameComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(UIImage **)(a1 + 40);
    if (v7)
    {
      UIImagePNGRepresentation(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v4, "contactForFamilyMember:nameComponents:imageData:", v5, v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v11[146];
    v11[146] = (id)v9;

    if (v7)
    v3 = v11;
    if (!*((_BYTE *)v11 + 1208))
    {
      objc_msgSend(v11[149], "setContactForDisplay:", v11[146]);
      v3 = v11;
    }
  }

}

void __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke_4;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setContactForActions:", *(_QWORD *)(a1 + 40));
}

- (void)_updateConfigurationAnimated:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v15 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (self->_accountUser)
  {
    -[PKAccountUserDetailViewController _currentConfigurationForAccountUser](self, "_currentConfigurationForAccountUser");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_6;
  }
  if (self->_accountUserInvitation)
  {
    -[PKAccountUserDetailViewController _currentConfigurationForAccountUserInvitation](self, "_currentConfigurationForAccountUserInvitation");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v5 = 0;
LABEL_6:
  objc_msgSend(v5, "sections");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(v5, "rowsForSection:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "setEnabled:", !self->_performingAction);
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }
  if (v5)
    -[PKSettingsTableViewController applyConfiguration:animated:](self, "applyConfiguration:animated:", v5, v15);

}

- (id)_currentConfigurationForAccountUserInvitation
{
  PKSettingsTableViewConfiguration *v3;
  PKTableViewDiffableDataSourceSection *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PKButtonTableViewSettingsRow *v9;
  void *v10;
  PKButtonTableViewSettingsRow *v11;
  uint64_t v12;
  PKButtonTableViewSettingsRow *v13;
  void *v14;
  uint64_t v15;
  PKTitleSubtitleTableViewSettingsRow *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[5];

  v3 = objc_alloc_init(PKSettingsTableViewConfiguration);
  v4 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("actions"));
  -[CNContact givenName](self->_contact, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKFeatureApplication applicationState](self->_accountUserInvitation, "applicationState");
  if (v6 == 8)
  {
    v12 = -[PKFeatureApplication applicationStateReason](self->_accountUserInvitation, "applicationStateReason");
    if (v12 == 11)
    {
      PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_PENDING_ACCEPTANCE_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_PENDING_ACCEPTANCE_BODY"), CFSTR("%@"), v5);
    }
    else
    {
      if (v12 != 10)
      {
LABEL_10:
        v7 = 0;
        v11 = 0;
        v8 = 0;
        goto LABEL_20;
      }
      PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_PENDING_MERGE_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_PENDING_MERGE_BODY"), CFSTR("%@"), v5);
    }
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v8 = (void *)v15;
    v11 = 0;
    if (v7)
      goto LABEL_17;
LABEL_20:
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    goto LABEL_21;
  }
  if (v6 == 6)
  {
    PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_OFFER_READY_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_JOINT_OFFER_READY_MESSAGE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [PKButtonTableViewSettingsRow alloc];
    PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_JOINT_OFFER_READY_BUTTON"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __82__PKAccountUserDetailViewController__currentConfigurationForAccountUserInvitation__block_invoke_2;
    v21[3] = &unk_1E3E6A900;
    v21[4] = self;
    v11 = -[PKButtonTableViewSettingsRow initWithIdentifier:title:tapHandler:](v13, "initWithIdentifier:title:tapHandler:", CFSTR("invitationOfferReady"), v14, v21);

    if (!v7)
      goto LABEL_20;
    goto LABEL_17;
  }
  if (v6 != 5)
    goto LABEL_10;
  if (-[PKFeatureApplication applicationStateReason](self->_accountUserInvitation, "applicationStateReason") != 9)
  {
    PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_PENDING_DECISION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_PENDING_DECISION_BODY"));
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_INVITATION_SENT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_INVITATION_SENT_BODY"), CFSTR("%@"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PKButtonTableViewSettingsRow alloc];
  PKLocalizedMadisonString(CFSTR("CANCEL_INVITATION"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__PKAccountUserDetailViewController__currentConfigurationForAccountUserInvitation__block_invoke;
  v22[3] = &unk_1E3E6A900;
  v22[4] = self;
  v11 = -[PKButtonTableViewSettingsRow initWithIdentifier:title:tapHandler:](v9, "initWithIdentifier:title:tapHandler:", CFSTR("invitationCancel"), v10, v22);

  -[PKButtonTableViewSettingsRow setStyle:](v11, "setStyle:", 1);
  if (!v7)
    goto LABEL_20;
LABEL_17:
  if (!v8)
    goto LABEL_20;
  v16 = -[PKTitleSubtitleTableViewSettingsRow initWithIdentifier:title:subtitle:]([PKTitleSubtitleTableViewSettingsRow alloc], "initWithIdentifier:title:subtitle:", CFSTR("stateExplanation"), v7, v8);
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = v17;
  if (v16)
  {
    objc_msgSend(v17, "addObject:", v16);

  }
LABEL_21:
  if (v11)
    objc_msgSend(v18, "addObject:", v11);
  if (objc_msgSend(v18, "count"))
  {
    v19 = (void *)objc_msgSend(v18, "copy");
    -[PKSettingsTableViewConfiguration appendSection:rows:](v3, "appendSection:rows:", v4, v19);

  }
  return v3;
}

uint64_t __82__PKAccountUserDetailViewController__currentConfigurationForAccountUserInvitation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentCancelInvitationAlert");
}

uint64_t __82__PKAccountUserDetailViewController__currentConfigurationForAccountUserInvitation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentAccountUserInvitation");
}

- (id)_currentConfigurationForAccountUser
{
  PKSettingsTableViewConfiguration *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;

  v3 = objc_alloc_init(PKSettingsTableViewConfiguration);
  v4 = -[PKAccount accessLevel](self->_account, "accessLevel");
  v5 = -[PKAccountUser accessLevel](self->_accountUser, "accessLevel");
  if (v4 == 1)
  {
    v6 = v5;
    if (v5 == 2)
    {
      -[PKAccountUserDetailViewController _appendTransactionLimitToConfiguration:](self, "_appendTransactionLimitToConfiguration:", v3);
      if (-[PKAccountUserDetailViewController _shouldShowRewardsBalance](self, "_shouldShowRewardsBalance"))
        -[PKAccountUserDetailViewController _appendRewardsBalanceToConfiguration:](self, "_appendRewardsBalanceToConfiguration:", v3);
      if ((-[PKAccountUser supportsMonthlySpendLimit](self->_accountUser, "supportsMonthlySpendLimit") & 1) == 0)
        -[PKAccountUserDetailViewController _appendShowAvailableCreditToConfiguration:](self, "_appendShowAvailableCreditToConfiguration:", v3);
    }
    -[PKAccountUserDetailViewController _appendNotificationsSectionToConfiguration:](self, "_appendNotificationsSectionToConfiguration:", v3);
    -[PKAccountUser notificationSettings](self->_accountUser, "notificationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "transactionNotificationsEnabled");

    if (v8)
      -[PKAccountUserDetailViewController _appendSpendNotificationsSectionToConfiguration:](self, "_appendSpendNotificationsSectionToConfiguration:", v3);
    if (v6 == 2)
    {
      if (-[PKAccountUserDetailViewController _hasPhysicalCardAction](self, "_hasPhysicalCardAction"))
        -[PKAccountUserDetailViewController _appendPhysicalCardSectionToConfiguration:](self, "_appendPhysicalCardSectionToConfiguration:", v3);
      -[PKAccountUserDetailViewController _appendActionsSectionToConfiguration:](self, "_appendActionsSectionToConfiguration:", v3);
    }
  }
  return v3;
}

- (BOOL)_hasPhysicalCardAction
{
  PKPhysicalCardController *physicalCardController;
  _BOOL4 v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v8;
  BOOL v9;

  physicalCardController = self->_physicalCardController;
  if (!physicalCardController)
    return 0;
  v4 = -[PKPhysicalCardController hasPrimaryPhysicalCard](physicalCardController, "hasPrimaryPhysicalCard");
  -[PKPhysicalCardController primaryPhysicalCard](self->_physicalCardController, "primaryPhysicalCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "state") & 0xFFFFFFFFFFFFFFFELL) == 2;
  v8 = v4 && v5 != 0 && v6;
  v9 = -[PKPhysicalCardController canRequestNewPhysicalCard](self->_physicalCardController, "canRequestNewPhysicalCard")
    || -[PKPhysicalCardController canReplacePhysicalCard](self->_physicalCardController, "canReplacePhysicalCard")
    || v8
    || -[PKPhysicalCardController canActivatePhysicalCard](self->_physicalCardController, "canActivatePhysicalCard");

  return v9;
}

- (BOOL)_shouldShowRewardsBalance
{
  PKAccountUser *accountUser;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  BOOL v8;
  int v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  if (!self->_peerPaymentAccount)
    goto LABEL_12;
  accountUser = self->_accountUser;
  if (!accountUser || !self->_familyMemberCollection)
    goto LABEL_12;
  v4 = -[PKAccountUser accessLevel](accountUser, "accessLevel");
  -[PKFamilyMemberCollection currentUser](self->_familyMemberCollection, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOrganizer");

  v7 = -[PKPeerPaymentAccount supportsFamilySharing](self->_peerPaymentAccount, "supportsFamilySharing");
  v8 = v4 != 2 || v6 == 0;
  if (!v8 && v7 != 0)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "passWithUniqueID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "paymentPass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[PKAccountUser altDSID](self->_accountUser, "altDSID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKFamilyMemberCollection familyMemberForAltDSID:](self->_familyMemberCollection, "familyMemberForAltDSID:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v17, "memberType") - 3) >= 0xFFFFFFFFFFFFFFFELL)
      {
        -[PKPeerPaymentAccount peerPaymentAccountWithAltDSID:](self->_peerPaymentAccount, "peerPaymentAccountWithAltDSID:", v16);
        v18 = objc_claimAutoreleasedReturnValue();
        -[PKPeerPaymentAccount accountInvitationWithAltDSID:](self->_peerPaymentAccount, "accountInvitationWithAltDSID:", v16);
        v19 = objc_claimAutoreleasedReturnValue();
        if (v18 | v19)
        {
          LOBYTE(v10) = 0;
        }
        else
        {
          -[PKAccount creditDetails](self->_account, "creditDetails");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "accountSummary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "accountUserActivityForAccountUserAltDSID:", v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "rewardsBalance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0CB3598], "zero");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v23, "isEqualToNumber:", v24) ^ 1;

          }
          else
          {
            LOBYTE(v10) = 0;
          }

        }
      }
      else
      {
        LOBYTE(v10) = 0;
      }

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
LABEL_12:
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (void)_loadPeerPaymentAccount
{
  void *v3;
  _QWORD v4[5];

  if (!self->_peerPaymentAccount)
  {
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__PKAccountUserDetailViewController__loadPeerPaymentAccount__block_invoke;
    v4[3] = &unk_1E3E654F8;
    v4[4] = self;
    objc_msgSend(v3, "accountWithCompletion:", v4);

  }
}

void __60__PKAccountUserDetailViewController__loadPeerPaymentAccount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PKAccountUserDetailViewController__loadPeerPaymentAccount__block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

id *__60__PKAccountUserDetailViewController__loadPeerPaymentAccount__block_invoke_2(uint64_t a1)
{
  id v2;
  id *result;

  v2 = *(id *)(a1 + 40);
  result = (id *)(*(_QWORD *)(a1 + 32) + 1112);
  if (*result != v2)
  {
    objc_storeStrong(result, v2);
    return (id *)objc_msgSend(*(id *)(a1 + 32), "_updateConfigurationAnimated:", 1);
  }
  return result;
}

- (void)_appendTransactionLimitToConfiguration:(id)a3
{
  id v4;
  PKTableViewDiffableDataSourceSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  PKCurrencyAmountSelectorOptionProvider *v10;
  void *v11;
  PKSelectionTableViewSettingsRow *v12;
  void *v13;
  void *v14;
  id v15;
  PKCurrencyAmountSelectorOptionProvider *v16;
  PKSelectionTableViewSettingsRow *v17;
  void *v18;
  PKCurrencyAmountSelectorOptionProvider *v19;
  void *v20;
  PKSelectionTableViewSettingsRow *v21;
  void *v22;
  void *v23;
  id v24;
  PKCurrencyAmountSelectorOptionProvider *v25;
  PKSelectionTableViewSettingsRow *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  PKCurrencyAmountSelectorOptionProvider *v31;
  PKAccountUserDetailViewController *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  PKCurrencyAmountSelectorOptionProvider *v36;
  PKAccountUserDetailViewController *v37;
  id v38;
  id location[2];

  v4 = a3;
  v5 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("transactionLimit"));
  -[PKAccountUserDetailViewController _footerForTransactionLimitSection](self, "_footerForTransactionLimitSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableViewDiffableDataSourceSection setFooter:](v5, "setFooter:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currencyCode");
  v9 = objc_claimAutoreleasedReturnValue();

  if (-[PKAccountUser supportsMonthlySpendLimit](self->_accountUser, "supportsMonthlySpendLimit"))
  {
    v28 = v9;
    v10 = -[PKCurrencyAmountSelectorOptionProvider initWithType:accountUser:currencyCode:]([PKCurrencyAmountSelectorOptionProvider alloc], "initWithType:accountUser:currencyCode:", 0, self->_accountUser, v9);
    PKLocalizedMadisonString(CFSTR("MONTHLY_SPEND_LIMIT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    v12 = [PKSelectionTableViewSettingsRow alloc];
    -[PKCurrencyAmountSelectorOptionProvider selectedOption](v10, "selectedOption");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke;
    v34[3] = &unk_1E3E75B78;
    v15 = v11;
    v35 = v15;
    v16 = v10;
    v36 = v16;
    v37 = self;
    objc_copyWeak(&v38, location);
    v17 = -[PKSelectionTableViewSettingsRow initWithIdentifier:title:value:tapHandler:](v12, "initWithIdentifier:title:value:tapHandler:", CFSTR("monthlySpendLimit"), v15, v14, v34);

    objc_msgSend(v7, "addObject:", v17);
    objc_destroyWeak(&v38);

    objc_destroyWeak(location);
    v9 = v28;
  }
  v18 = (void *)v9;
  v19 = -[PKCurrencyAmountSelectorOptionProvider initWithType:accountUser:currencyCode:]([PKCurrencyAmountSelectorOptionProvider alloc], "initWithType:accountUser:currencyCode:", 0, self->_accountUser, v9);
  PKLocalizedMadisonString(CFSTR("TRANSACTION_LIMIT"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v21 = [PKSelectionTableViewSettingsRow alloc];
  -[PKCurrencyAmountSelectorOptionProvider selectedOption](v19, "selectedOption");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "displayValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke_3;
  v29[3] = &unk_1E3E75B78;
  v24 = v20;
  v30 = v24;
  v25 = v19;
  v31 = v25;
  v32 = self;
  objc_copyWeak(&v33, location);
  v26 = -[PKSelectionTableViewSettingsRow initWithIdentifier:title:value:tapHandler:](v21, "initWithIdentifier:title:value:tapHandler:", CFSTR("transactionLimitSwitch"), v24, v23, v29);

  objc_msgSend(v7, "addObject:", v26);
  v27 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "appendSection:rows:", v5, v27);

  objc_destroyWeak(&v33);
  objc_destroyWeak(location);

}

void __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKSpendNotificationLimitViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = -[PKSpendNotificationLimitViewController initWithTitle:footerText:provider:]([PKSpendNotificationLimitViewController alloc], "initWithTitle:footerText:provider:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1048), "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creditLimit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  -[PKSpendNotificationLimitViewController setMaximumInput:](v4, "setMaximumInput:", v8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke_2;
  v10[3] = &unk_1E3E75B50;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  -[PKSpendNotificationLimitViewController setChangeHandler:](v4, "setChangeHandler:", v10);
  objc_msgSend(*(id *)(a1 + 48), "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v4, 1);

  objc_destroyWeak(&v11);
}

void __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "currencyAmount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "amount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_updateMonthlySpendLimit:", v5);
  }

}

void __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  PKSpendNotificationLimitViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = -[PKSpendNotificationLimitViewController initWithTitle:footerText:provider:]([PKSpendNotificationLimitViewController alloc], "initWithTitle:footerText:provider:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1048), "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creditLimit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  -[PKSpendNotificationLimitViewController setMaximumInput:](v4, "setMaximumInput:", v8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke_4;
  v10[3] = &unk_1E3E75B50;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  -[PKSpendNotificationLimitViewController setChangeHandler:](v4, "setChangeHandler:", v10);
  objc_msgSend(*(id *)(a1 + 48), "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v4, 1);

  objc_destroyWeak(&v11);
}

void __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "currencyAmount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "amount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_updateTransactionLimit:", v5);
  }

}

- (id)_footerForTransactionLimitSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  int v15;
  BOOL v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;

  -[PKAccountUser preferences](self->_accountUser, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "transactionSpendLimitAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "transactionSpendLimitEnabled");
  if (v6)
    v8 = v5 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (v7)
    v10 = v9;
  else
    v10 = 0;
  objc_msgSend(v3, "monthlySpendLimitAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKAccountUser supportsMonthlySpendLimit](self->_accountUser, "supportsMonthlySpendLimit");
  v13 = objc_msgSend(v3, "monthlySpendLimitEnabled");
  if (v11)
    v14 = v5 == 0;
  else
    v14 = 1;
  v15 = !v14;
  if (v13)
    v16 = v12 == 0;
  else
    v16 = 1;
  if (v16)
    v17 = 0;
  else
    v17 = v15;
  -[CNContact givenName](self->_contact, "givenName");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if ((v17 & v10) == 1)
  {
    PKCurrencyAmountMake();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "formattedStringValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "formattedStringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("TRANSACTION_LIMIT_FOOTER_TRANSACTION_AND_MONTHLY_LIMIT"), CFSTR("%1$@%2$@%3$@"), v19, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_32:
    goto LABEL_33;
  }
  if (v17)
  {
    PKCurrencyAmountMake();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "formattedStringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("TRANSACTION_LIMIT_FOOTER_MONTHLY_LIMIT"), CFSTR("%1$@%2$@"), v19, v21);
LABEL_31:
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  if (v10)
  {
    PKCurrencyAmountMake();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "formattedStringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v25 = CFSTR("TRANSACTION_LIMIT_FOOTER_TRANSACTION_LIMIT_VIEW_BALANCE");
    else
      v25 = CFSTR("TRANSACTION_LIMIT_FOOTER_TRANSACTION_LIMIT");
    PKLocalizedMadisonString(&v25->isa, CFSTR("%1$@%2$@"), v19, v21);
    goto LABEL_31;
  }
  if (v12)
    PKLocalizedMadisonString(CFSTR("TRANSACTION_LIMIT_FOOTER_NO_LIMIT_VIEW_BALANCE"), CFSTR("%@"), v18);
  else
    PKLocalizedMadisonString(CFSTR("TRANSACTION_LIMIT_FOOTER_NO_LIMIT"), CFSTR("%@"), v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v24;
}

- (void)_appendRewardsBalanceToConfiguration:(id)a3
{
  id v4;
  PKTableViewDiffableDataSourceSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  PKKeyValueTableViewSettingsRow *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("rewardsBalance"));
  PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_ASSOCIATED_ACCOUNT_REWARDS_BALANCE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currencyCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountUser altDSID](self->_accountUser, "altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountUserActivityForAccountUserAltDSID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rewardsBalance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v8 == 0;
  else
    v13 = 1;
  if (v13)
  {
    v15 = 0;
  }
  else
  {
    PKCurrencyAmountMake();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "formattedStringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = -[PKKeyValueTableViewSettingsRow initWithIdentifier:title:value:]([PKKeyValueTableViewSettingsRow alloc], "initWithIdentifier:title:value:", CFSTR("rewardsBalance"), v6, v15);
  v18[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendSection:rows:", v5, v17);

}

- (void)_appendShowAvailableCreditToConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKTableViewDiffableDataSourceSection *v7;
  void *v8;
  uint64_t v9;
  PKMutableAccountUserPreferences *pendingAccountUserPreferences;
  PKSwitchTableViewSettingsRow *v11;
  void *v12;
  PKSwitchTableViewSettingsRow *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNContact givenName](self->_contact, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("SHOW_AVAILABLE_CREDIT_FOOTER"), CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("showAvailableCredit"));
  -[PKTableViewDiffableDataSourceSection setFooter:](v7, "setFooter:", v6);
  -[PKAccountUser preferences](self->_accountUser, "preferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "showAvailableCredit");

  pendingAccountUserPreferences = self->_pendingAccountUserPreferences;
  if (pendingAccountUserPreferences)
    v9 = -[PKMutableAccountUserPreferences showAvailableCredit](pendingAccountUserPreferences, "showAvailableCredit");
  objc_initWeak(&location, self);
  v11 = [PKSwitchTableViewSettingsRow alloc];
  PKLocalizedMadisonString(CFSTR("SHOW_AVAILABLE_CREDIT_SWITCH_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__PKAccountUserDetailViewController__appendShowAvailableCreditToConfiguration___block_invoke;
  v15[3] = &unk_1E3E75BA0;
  objc_copyWeak(&v16, &location);
  v13 = -[PKSwitchTableViewSettingsRow initWithIdentifier:title:value:changeHandler:](v11, "initWithIdentifier:title:value:changeHandler:", CFSTR("showAvailableCreditSwitch"), v12, v9, v15);

  v18[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendSection:rows:", v7, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __79__PKAccountUserDetailViewController__appendShowAvailableCreditToConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updateShowAvailableCredit:", objc_msgSend(v4, "BOOLValue"));

}

- (void)_appendNotificationsSectionToConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKTableViewDiffableDataSourceSection *v7;
  void *v8;
  PKMutableAccountUserNotificationSettings *pendingAccountUserNotificationSettings;
  PKMutableAccountUserNotificationSettings *v10;
  PKSwitchTableViewSettingsRow *v11;
  void *v12;
  uint64_t v13;
  PKSwitchTableViewSettingsRow *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNContact givenName](self->_contact, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("NOTIFICATIONS_FOOTER"), CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("notifications"));
  -[PKTableViewDiffableDataSourceSection setFooter:](v7, "setFooter:", v6);
  -[PKAccountUser notificationSettings](self->_accountUser, "notificationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pendingAccountUserNotificationSettings = self->_pendingAccountUserNotificationSettings;
  if (pendingAccountUserNotificationSettings)
  {
    v10 = pendingAccountUserNotificationSettings;

    v8 = v10;
  }
  objc_initWeak(&location, self);
  v11 = [PKSwitchTableViewSettingsRow alloc];
  PKLocalizedMadisonString(CFSTR("NOTIFICATIONS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "transactionNotificationsEnabled");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__PKAccountUserDetailViewController__appendNotificationsSectionToConfiguration___block_invoke;
  v16[3] = &unk_1E3E75BA0;
  objc_copyWeak(&v17, &location);
  v14 = -[PKSwitchTableViewSettingsRow initWithIdentifier:title:value:changeHandler:](v11, "initWithIdentifier:title:value:changeHandler:", CFSTR("notificationsSwitch"), v12, v13, v16);

  v19[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendSection:rows:", v7, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __80__PKAccountUserDetailViewController__appendNotificationsSectionToConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updateTransactionNotificationsEnabled:", objc_msgSend(v4, "BOOLValue"));

}

- (void)_appendSpendNotificationsSectionToConfiguration:(id)a3
{
  void *v4;
  void *v5;
  PKCurrencyAmountSelectorOptionProvider *v6;
  void *v7;
  PKSelectionTableViewSettingsRow *v8;
  void *v9;
  void *v10;
  id v11;
  PKSelectionTableViewSettingsRow *v12;
  PKCurrencyAmountSelectorOptionProvider *v13;
  void *v14;
  void *v15;
  void *v16;
  PKSelectionTableViewSettingsRow *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  PKCurrencyAmountSelectorOptionProvider *v22;
  PKSelectionTableViewSettingsRow *v23;
  void *v24;
  PKCurrencyAmountSelectorOptionProvider *v25;
  id v26;
  PKTableViewDiffableDataSourceSection *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  PKCurrencyAmountSelectorOptionProvider *v32;
  PKAccountUserDetailViewController *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  PKCurrencyAmountSelectorOptionProvider *v37;
  PKAccountUserDetailViewController *v38;
  id v39;
  id location;
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v27 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("spendNotifications"));
  PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_SPEND_NOTIFICATIONS_HEADER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableViewDiffableDataSourceSection setTitle:](v27, "setTitle:", v4);

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currencyCode");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v6 = -[PKCurrencyAmountSelectorOptionProvider initWithType:accountUser:currencyCode:]([PKCurrencyAmountSelectorOptionProvider alloc], "initWithType:accountUser:currencyCode:", 2, self->_accountUser, v28);
  PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_SPEND_NOTIFICATIONS_TRANSACTIONS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [PKSelectionTableViewSettingsRow alloc];
  -[PKCurrencyAmountSelectorOptionProvider selectedOption](v6, "selectedOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke;
  v35[3] = &unk_1E3E75B78;
  v11 = v7;
  v36 = v11;
  v25 = v6;
  v37 = v25;
  v38 = self;
  objc_copyWeak(&v39, &location);
  v12 = -[PKSelectionTableViewSettingsRow initWithIdentifier:title:value:tapHandler:](v8, "initWithIdentifier:title:value:tapHandler:", CFSTR("transactionThreshold"), v11, v10, v35);

  v13 = -[PKCurrencyAmountSelectorOptionProvider initWithType:accountUser:currencyCode:]([PKCurrencyAmountSelectorOptionProvider alloc], "initWithType:accountUser:currencyCode:", 1, self->_accountUser, v28);
  PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_SPEND_NOTIFICATIONS_TOTAL_SPENDING"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact givenName](self->_contact, "givenName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_SPEND_NOTIFICATIONS_TOTAL_SPENDING_FOOTER"), CFSTR("%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [PKSelectionTableViewSettingsRow alloc];
  -[PKCurrencyAmountSelectorOptionProvider selectedOption](v13, "selectedOption");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke_3;
  v29[3] = &unk_1E3E75BC8;
  v20 = v14;
  v30 = v20;
  v21 = v16;
  v31 = v21;
  v22 = v13;
  v32 = v22;
  v33 = self;
  objc_copyWeak(&v34, &location);
  v23 = -[PKSelectionTableViewSettingsRow initWithIdentifier:title:value:tapHandler:](v17, "initWithIdentifier:title:value:tapHandler:", CFSTR("monthlySpendThreshold"), v20, v19, v29);

  v41[0] = v12;
  v41[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "appendSection:rows:", v27, v24);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&location);
}

void __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKSpendNotificationLimitViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = -[PKSpendNotificationLimitViewController initWithTitle:footerText:provider:]([PKSpendNotificationLimitViewController alloc], "initWithTitle:footerText:provider:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1048), "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creditLimit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  -[PKSpendNotificationLimitViewController setMaximumInput:](v4, "setMaximumInput:", v8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke_2;
  v10[3] = &unk_1E3E75B50;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  -[PKSpendNotificationLimitViewController setChangeHandler:](v4, "setChangeHandler:", v10);
  objc_msgSend(*(id *)(a1 + 48), "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v4, 1);

  objc_destroyWeak(&v11);
}

void __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "currencyAmount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "amount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_updateTransactionNotificationThreshold:", v5);
  }

}

void __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  PKSpendNotificationLimitViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = -[PKSpendNotificationLimitViewController initWithTitle:footerText:provider:]([PKSpendNotificationLimitViewController alloc], "initWithTitle:footerText:provider:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1048), "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creditLimit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  -[PKSpendNotificationLimitViewController setMaximumInput:](v4, "setMaximumInput:", v8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke_4;
  v10[3] = &unk_1E3E75B50;
  objc_copyWeak(&v11, (id *)(a1 + 64));
  -[PKSpendNotificationLimitViewController setChangeHandler:](v4, "setChangeHandler:", v10);
  objc_msgSend(*(id *)(a1 + 56), "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v4, 1);

  objc_destroyWeak(&v11);
}

void __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "currencyAmount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "amount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_updateMonthlySpendNotificationThreshold:", v5);
  }

}

- (void)_appendPhysicalCardSectionToConfiguration:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  PKTableViewDiffableDataSourceSection *v11;
  void *v12;
  id v13;
  void *v14;
  PKButtonTableViewSettingsRow *v15;
  PKButtonTableViewSettingsRow *v16;
  PKButtonTableViewSettingsRow *v17;
  void *v18;
  PKButtonTableViewSettingsRow *v19;
  PKButtonTableViewSettingsRow *v20;
  void *v21;
  PKButtonTableViewSettingsRow *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PKButtonTableViewSettingsRow *v27;
  void *v28;
  id v29;
  PKButtonTableViewSettingsRow *v30;
  PKButtonTableViewSettingsRow *v31;
  void *v32;
  PKButtonTableViewSettingsRow *v33;
  id v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  PKAccountUserDetailViewController *v48;
  id v49;
  id location[2];

  v4 = a3;
  -[PKAccount feature](self->_account, "feature");
  v5 = -[PKPhysicalCardController canRequestNewPhysicalCard](self->_physicalCardController, "canRequestNewPhysicalCard");
  v6 = -[PKPhysicalCardController canReplacePhysicalCard](self->_physicalCardController, "canReplacePhysicalCard");
  v7 = -[PKPhysicalCardController hasPrimaryPhysicalCard](self->_physicalCardController, "hasPrimaryPhysicalCard");
  v8 = -[PKPhysicalCardController canActivatePhysicalCard](self->_physicalCardController, "canActivatePhysicalCard");
  v36 = v5;
  if (v5)
  {
    -[CNContact givenName](self->_contact, "givenName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_PHYSICAL_CARD_REQUEST_FOOTER"), CFSTR("%@"), v9);
    v10 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v11 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("physicalCard"));
  PKLocalizedFeatureString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableViewDiffableDataSourceSection setTitle:](v11, "setTitle:", v12);

  v35 = (void *)v10;
  -[PKTableViewDiffableDataSourceSection setFooter:](v11, "setFooter:", v10);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPhysicalCardController primaryPhysicalCard](self->_physicalCardController, "primaryPhysicalCard");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  if (v7 && (objc_msgSend(v37, "state") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v34 = v4;
    PKLocalizedFeatureString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [PKButtonTableViewSettingsRow alloc];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke;
    v46[3] = &unk_1E3E75BF0;
    objc_copyWeak(&v49, location);
    v47 = v37;
    v48 = self;
    v16 = -[PKButtonTableViewSettingsRow initWithIdentifier:title:tapHandler:](v15, "initWithIdentifier:title:tapHandler:", CFSTR("lockUnlockPhysicalCard"), v14, v46);
    objc_msgSend(v13, "addObject:", v16);

    objc_destroyWeak(&v49);
    v4 = v34;
  }
  if (v8)
  {
    v17 = [PKButtonTableViewSettingsRow alloc];
    PKLocalizedFeatureString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_4;
    v44[3] = &unk_1E3E6A928;
    objc_copyWeak(&v45, location);
    v19 = -[PKButtonTableViewSettingsRow initWithIdentifier:title:tapHandler:](v17, "initWithIdentifier:title:tapHandler:", CFSTR("activatePhysicalCard"), v18, v44);

    objc_msgSend(v13, "addObject:", v19);
    objc_destroyWeak(&v45);
  }
  if (v6)
  {
    v20 = [PKButtonTableViewSettingsRow alloc];
    PKLocalizedFeatureString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_5;
    v42[3] = &unk_1E3E6A928;
    objc_copyWeak(&v43, location);
    v22 = -[PKButtonTableViewSettingsRow initWithIdentifier:title:tapHandler:](v20, "initWithIdentifier:title:tapHandler:", CFSTR("replacePhysicalCard"), v21, v42);

    objc_msgSend(v13, "addObject:", v22);
    objc_destroyWeak(&v43);
  }
  -[PKPhysicalCardController unactivatedPhysicalCard](self->_physicalCardController, "unactivatedPhysicalCard");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "latestShippingActivity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "shipmentTrackingURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {

    }
    else
    {
      objc_msgSend(v24, "shipmentTrackingURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
        goto LABEL_16;
    }
    v27 = [PKButtonTableViewSettingsRow alloc];
    PKLocalizedFeatureString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_6;
    v40[3] = &unk_1E3E6A900;
    v29 = v26;
    v41 = v29;
    v30 = -[PKButtonTableViewSettingsRow initWithIdentifier:title:tapHandler:](v27, "initWithIdentifier:title:tapHandler:", CFSTR("trackPhysicalCard"), v28, v40);

    objc_msgSend(v13, "addObject:", v30);
  }
LABEL_16:
  if (v36)
  {
    v31 = [PKButtonTableViewSettingsRow alloc];
    PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_PHYSICAL_CARD_REQUEST_BUTTON"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_7;
    v38[3] = &unk_1E3E6A928;
    objc_copyWeak(&v39, location);
    v33 = -[PKButtonTableViewSettingsRow initWithIdentifier:title:tapHandler:](v31, "initWithIdentifier:title:tapHandler:", CFSTR("requestPhysicalCard"), v32, v38);

    objc_msgSend(v13, "addObject:", v33);
    objc_destroyWeak(&v39);
  }
  objc_msgSend(v4, "appendSection:rows:", v11, v13);

  objc_destroyWeak(location);
}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[5];
  id v13;
  char v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained[143], "primaryPhysicalCardEnabled");
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_2;
    aBlock[3] = &unk_1E3E64908;
    v14 = v4;
    aBlock[4] = v3;
    v13 = *(id *)(a1 + 32);
    v6 = _Block_copy(aBlock);
    v7 = v6;
    if (v4)
    {
      (*((void (**)(void *))v6 + 2))(v6);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "feature");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1120), "appleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_3;
      v10[3] = &unk_1E3E66918;
      v10[4] = v3;
      v11 = v7;
      objc_msgSend(v3, "_presentPasswordAuthorizationWithReason:completion:", v8, v10, v9);

    }
  }

}

uint64_t __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_2(uint64_t a1)
{
  int v1;
  uint64_t v2;
  void *v3;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1152);
  if (v1)
    return objc_msgSend(v3, "disablePhysicalCard:", v2);
  else
    return objc_msgSend(v3, "enablePhysicalCard:", v2);
}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  if (a2)
  {
    v7 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_5:
    v5 = v7;
    goto LABEL_6;
  }
  if (v5)
  {
    v7 = v5;
    v6 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

    goto LABEL_5;
  }
LABEL_6:

}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_4(uint64_t a1)
{
  PKPhysicalCardManualActivationViewController *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  PKPhysicalCardManualActivationViewController *v7;
  PKNavigationController *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [PKPhysicalCardManualActivationViewController alloc];
    v2 = *((_QWORD *)WeakRetained + 141);
    v3 = *((_QWORD *)WeakRetained + 131);
    v4 = *((_QWORD *)WeakRetained + 132);
    v5 = *((_QWORD *)WeakRetained + 129);
    objc_msgSend(*((id *)WeakRetained + 143), "unactivatedPhysicalCard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPhysicalCardManualActivationViewController initWithAccountService:account:accountUser:paymentPass:physicalCard:activationCode:](v1, "initWithAccountService:account:accountUser:paymentPass:physicalCard:activationCode:", v2, v3, v4, v5, v6, 0);

    v8 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v7);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_5(uint64_t a1)
{
  PKReplacePhysicalCardReasonViewController *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  PKReplacePhysicalCardReasonViewController *v5;
  PKNavigationController *v6;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [PKReplacePhysicalCardReasonViewController alloc];
    v2 = WeakRetained[130];
    v3 = 3;
    if (v2 != 1)
      v3 = 0;
    if (v2 == 2)
      v4 = 4;
    else
      v4 = v3;
    v5 = -[PKReplacePhysicalCardReasonViewController initWithPhysicalCardController:context:](v1, "initWithPhysicalCardController:context:", WeakRetained[143], v4);
    v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:configuration:completionHandler:", *(_QWORD *)(a1 + 32), 0, 0);

}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_7(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_setPerformingAction:animated:", 1, 1);
    v3 = (void *)v2[143];
    v4 = v2[130];
    v5 = 3;
    if (v4 != 1)
      v5 = 0;
    if (v4 == 2)
      v6 = 4;
    else
      v6 = v5;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_8;
    v7[3] = &unk_1E3E73350;
    v7[4] = v2;
    objc_msgSend(v3, "orderFlowViewControllerForReason:content:completion:", 0, v6, v7);
  }

}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKNavigationController *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_setPerformingAction:animated:", 0, 1);
  if (v7)
  {
    v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v7);
    -[PKNavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 2);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentDisplayableError:", v5);
  }

}

- (void)_appendActionsSectionToConfiguration:(id)a3
{
  id v4;
  PKTableViewDiffableDataSourceSection *v5;
  void *v6;
  int v7;
  __CFString *v8;
  NSString *v9;
  PKButtonTableViewSettingsRow *v10;
  void *v11;
  uint64_t v12;
  PKButtonTableViewSettingsRow *v13;
  PKButtonTableViewSettingsRow *v14;
  void *v15;
  PKButtonTableViewSettingsRow *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  char v22;
  id location;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("actions"));
  -[PKAccountUser preferences](self->_accountUser, "preferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "spendingEnabled");

  v8 = CFSTR("UNLOCK_USER_BUTTON");
  if (v7)
    v8 = CFSTR("LOCK_USER_BUTTON");
  v9 = v8;
  objc_initWeak(&location, self);
  v10 = [PKButtonTableViewSettingsRow alloc];
  PKLocalizedMadisonString(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke;
  v20[3] = &unk_1E3E75C18;
  objc_copyWeak(&v21, &location);
  v22 = v7;
  v13 = -[PKButtonTableViewSettingsRow initWithIdentifier:title:tapHandler:](v10, "initWithIdentifier:title:tapHandler:", CFSTR("lockUnlockAccountUser"), v11, v20);

  v14 = [PKButtonTableViewSettingsRow alloc];
  PKLocalizedMadisonString(CFSTR("STOP_SHARING"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke_4;
  v18[3] = &unk_1E3E6A928;
  objc_copyWeak(&v19, &location);
  v16 = -[PKButtonTableViewSettingsRow initWithIdentifier:title:tapHandler:](v14, "initWithIdentifier:title:tapHandler:", CFSTR("stopSharingAccountUser"), v15, v18);

  -[PKButtonTableViewSettingsRow setStyle:](v16, "setStyle:", 1);
  v24[0] = v13;
  v24[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendSection:rows:", v5, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[5];
  char v13;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke_2;
    aBlock[3] = &unk_1E3E64C10;
    aBlock[4] = WeakRetained;
    v13 = *(_BYTE *)(a1 + 40);
    v5 = _Block_copy(aBlock);
    v6 = v5;
    if (*(_BYTE *)(a1 + 40))
    {
      (*((void (**)(void *))v5 + 2))(v5);
    }
    else
    {
      objc_msgSend(v3[146], "givenName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 40))
        v8 = CFSTR("LOCK_ACCOUNT_USER_PASSWORD_PROMPT_REASON");
      else
        v8 = CFSTR("UNLOCK_ACCOUNT_USER_PASSWORD_PROMPT_REASON");
      PKLocalizedMadisonString(&v8->isa, CFSTR("%@"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v4;
      v10[1] = 3221225472;
      v10[2] = __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke_3;
      v10[3] = &unk_1E3E66918;
      v10[4] = v3;
      v11 = v6;
      objc_msgSend(v3, "_presentPasswordAuthorizationWithReason:completion:", v9, v10);

    }
  }

}

uint64_t __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSpendingEnabled:", *(_BYTE *)(a1 + 40) == 0);
}

void __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  if (a2)
  {
    v7 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_5:
    v5 = v7;
    goto LABEL_6;
  }
  if (v5)
  {
    v7 = v5;
    v6 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

    goto LABEL_5;
  }
LABEL_6:

}

void __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentStopSharingAlert");
    WeakRetained = v2;
  }

}

- (void)_presentCancelInvitationAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  -[CNContact givenName](self->_contact, "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("CANCEL_INVITATION_ALERT_TITLE"), CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("CANCEL_INVITATION_ALERT_MESSAGE"), CFSTR("%@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("CANCEL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedMadisonString(CFSTR("CANCEL_INVITATION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__PKAccountUserDetailViewController__presentCancelInvitationAlert__block_invoke;
  v13[3] = &unk_1E3E61D68;
  v13[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v12);

  -[PKAccountUserDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

void __66__PKAccountUserDetailViewController__presentCancelInvitationAlert__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v2 = objc_alloc_init(MEMORY[0x1E0D66B28]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "applicationBaseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBaseURL:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setApplicationIdentifier:", v4);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1136);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PKAccountUserDetailViewController__presentCancelInvitationAlert__block_invoke_2;
  v7[3] = &unk_1E3E646D0;
  v7[4] = v5;
  objc_msgSend(v6, "submitDeleteRequest:completion:", v2, v7);

}

void __66__PKAccountUserDetailViewController__presentCancelInvitationAlert__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKAccountUserDetailViewController__presentCancelInvitationAlert__block_invoke_3;
  v6[3] = &unk_1E3E61388;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__PKAccountUserDetailViewController__presentCancelInvitationAlert__block_invoke_3(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "_presentDisplayableError:");
  return result;
}

- (void)_presentStopSharingAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  -[CNContact givenName](self->_contact, "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("STOP_SHARING_ALERT_TITLE"), CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("STOP_SHARING_ALERT_MESSAGE"), CFSTR("%@%@"), v3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("CANCEL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedMadisonString(CFSTR("STOP_SHARING"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__PKAccountUserDetailViewController__presentStopSharingAlert__block_invoke;
  v13[3] = &unk_1E3E61D68;
  v13[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v12);

  -[PKAccountUserDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

void __61__PKAccountUserDetailViewController__presentStopSharingAlert__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1128);
  objc_msgSend(*(id *)(v2 + 1056), "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PKAccountUserDetailViewController__presentStopSharingAlert__block_invoke_2;
  v6[3] = &unk_1E3E646D0;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "deleteAccountUserWithAltDSID:forAccountWithIdentifier:completion:", v4, v5, v6);

}

void __61__PKAccountUserDetailViewController__presentStopSharingAlert__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PKAccountUserDetailViewController__presentStopSharingAlert__block_invoke_3;
  v6[3] = &unk_1E3E61388;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __61__PKAccountUserDetailViewController__presentStopSharingAlert__block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_presentDisplayableError:");
  }
  else
  {
    objc_msgSend(v1, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  }
}

- (void)_presentAccountUserInvitation
{
  id v3;
  void *v4;
  void *v5;
  PKApplyControllerConfiguration *v6;
  int64_t style;
  uint64_t v8;
  uint64_t v9;
  PKApplyControllerConfiguration *v10;
  PKApplyController *v11;
  PKApplyController *applyController;
  PKApplyController *v13;
  void *v14;
  PKApplyController *v15;
  _QWORD v16[5];

  if (self->_accountUserInvitation && !self->_performingAction)
  {
    -[PKAccountUserDetailViewController _setPerformingAction:animated:](self, "_setPerformingAction:animated:", 1, 1);
    v3 = objc_alloc(MEMORY[0x1E0D67230]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithWebService:", v4);

    v6 = [PKApplyControllerConfiguration alloc];
    style = self->_style;
    v8 = 3;
    if (style != 1)
      v8 = 0;
    if (style == 2)
      v9 = 4;
    else
      v9 = v8;
    v10 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:](v6, "initWithSetupDelegate:context:provisioningController:", 0, v9, v5);
    -[PKApplyControllerConfiguration setFeatureApplication:](v10, "setFeatureApplication:", self->_accountUserInvitation);
    v11 = -[PKApplyController initWithApplyConfiguration:]([PKApplyController alloc], "initWithApplyConfiguration:", v10);
    applyController = self->_applyController;
    self->_applyController = v11;

    v13 = self->_applyController;
    objc_msgSend(MEMORY[0x1E0D66820], "analyticsAccountTypeForAccount:", self->_account);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyController setAnalyticsExistingAccountType:](v13, "setAnalyticsExistingAccountType:", v14);

    v15 = self->_applyController;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __66__PKAccountUserDetailViewController__presentAccountUserInvitation__block_invoke;
    v16[3] = &unk_1E3E62260;
    v16[4] = self;
    -[PKApplyController nextViewControllerWithCompletion:](v15, "nextViewControllerWithCompletion:", v16);

  }
}

void __66__PKAccountUserDetailViewController__presentAccountUserInvitation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKNavigationController *v6;
  PKNavigationController *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8)
  {
    v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
LABEL_5:
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

    goto LABEL_6;
  }
  if (v5)
  {
    v6 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "_setPerformingAction:animated:", 0, 1);

}

- (void)_updateTransactionLimit:(id)a3
{
  _BOOL8 v4;
  PKAccountUser *accountUser;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3 != 0;
  accountUser = self->_accountUser;
  v6 = a3;
  -[PKAccountUser preferences](accountUser, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v9, "setTransactionSpendLimitEnabled:", v4);
  objc_msgSend(v9, "setTransactionSpendLimitAmount:", v6);

  v8 = (void *)objc_msgSend(v9, "copy");
  -[PKAccountUserDetailViewController _updatePreferences:](self, "_updatePreferences:", v8);

}

- (void)_updateMonthlySpendLimit:(id)a3
{
  _BOOL8 v4;
  PKAccountUser *accountUser;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3 != 0;
  accountUser = self->_accountUser;
  v6 = a3;
  -[PKAccountUser preferences](accountUser, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v9, "setMonthlySpendLimitEnabled:", v4);
  objc_msgSend(v9, "setMonthlySpendLimitAmount:", v6);

  v8 = (void *)objc_msgSend(v9, "copy");
  -[PKAccountUserDetailViewController _updatePreferences:](self, "_updatePreferences:", v8);

}

- (void)_updateShowAvailableCredit:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[PKAccountUser preferences](self->_accountUser, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setShowAvailableCredit:", v3);
  v6 = (void *)objc_msgSend(v7, "copy");
  -[PKAccountUserDetailViewController _updatePreferences:](self, "_updatePreferences:", v6);

}

- (void)_updateSpendingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[PKAccountUser preferences](self->_accountUser, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setSpendingEnabled:", v3);
  v6 = (void *)objc_msgSend(v7, "copy");
  -[PKAccountUserDetailViewController _updatePreferences:](self, "_updatePreferences:", v6);

}

- (void)_updateMonthlySpendNotificationThreshold:(id)a3
{
  PKAccountUser *accountUser;
  id v5;
  void *v6;
  void *v7;
  id v8;

  accountUser = self->_accountUser;
  v5 = a3;
  -[PKAccountUser notificationSettings](accountUser, "notificationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v8, "setMonthlySpendNotificationThreshold:", v5);
  v7 = (void *)objc_msgSend(v8, "copy");
  -[PKAccountUserDetailViewController _updateNotificationSettings:](self, "_updateNotificationSettings:", v7);

}

- (void)_updatePreferences:(id)a3
{
  id v4;
  PKMutableAccountUserPreferences *v5;
  PKMutableAccountUserPreferences *pendingAccountUserPreferences;
  PKAccountService *accountService;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = (PKMutableAccountUserPreferences *)objc_msgSend(v4, "copy");
  pendingAccountUserPreferences = self->_pendingAccountUserPreferences;
  self->_pendingAccountUserPreferences = v5;

  -[PKAccountUserDetailViewController _setPerformingAction:animated:](self, "_setPerformingAction:animated:", 1, 1);
  accountService = self->_accountService;
  v8 = (void *)objc_msgSend(v4, "copy");

  -[PKAccountUser altDSID](self->_accountUser, "altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PKAccountUserDetailViewController__updatePreferences___block_invoke;
  v11[3] = &unk_1E3E75C40;
  v11[4] = self;
  -[PKAccountService updateAccountUserPreferences:forAccountUserWithAltDSID:forAccountWithIdentifier:completion:](accountService, "updateAccountUserPreferences:forAccountUserWithAltDSID:forAccountWithIdentifier:completion:", v8, v9, v10, v11);

}

void __56__PKAccountUserDetailViewController__updatePreferences___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKAccountUserDetailViewController__updatePreferences___block_invoke_2;
  block[3] = &unk_1E3E61400;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __56__PKAccountUserDetailViewController__updatePreferences___block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v2 = *(id **)(a1 + 40);
  if (v3)
  {
    objc_storeStrong(v2 + 132, v3);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 1064);
    *(_QWORD *)(v4 + 1064) = 0;

    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 1072);
    *(_QWORD *)(v6 + 1072) = 0;

  }
  else
  {
    objc_msgSend(v2, "_presentDisplayableError:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 40), "_setPerformingAction:animated:", 0, 1);
  return objc_msgSend(*(id *)(a1 + 40), "_updateConfigurationAnimated:", 1);
}

- (void)_updateTransactionNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[PKAccountUser notificationSettings](self->_accountUser, "notificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setTransactionNotificationsEnabled:", v3);
  v6 = (void *)objc_msgSend(v7, "copy");
  -[PKAccountUserDetailViewController _updateNotificationSettings:](self, "_updateNotificationSettings:", v6);

}

- (void)_updateTransactionNotificationThreshold:(id)a3
{
  PKAccountUser *accountUser;
  id v5;
  void *v6;
  void *v7;
  id v8;

  accountUser = self->_accountUser;
  v5 = a3;
  -[PKAccountUser notificationSettings](accountUser, "notificationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v8, "setTransactionNotificationThreshold:", v5);
  v7 = (void *)objc_msgSend(v8, "copy");
  -[PKAccountUserDetailViewController _updateNotificationSettings:](self, "_updateNotificationSettings:", v7);

}

- (void)_updateNotificationSettings:(id)a3
{
  id v4;
  PKMutableAccountUserNotificationSettings *v5;
  PKMutableAccountUserNotificationSettings *pendingAccountUserNotificationSettings;
  PKAccountService *accountService;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = (PKMutableAccountUserNotificationSettings *)objc_msgSend(v4, "copy");
  pendingAccountUserNotificationSettings = self->_pendingAccountUserNotificationSettings;
  self->_pendingAccountUserNotificationSettings = v5;

  -[PKAccountUserDetailViewController _setPerformingAction:animated:](self, "_setPerformingAction:animated:", 1, 1);
  accountService = self->_accountService;
  -[PKAccountUser altDSID](self->_accountUser, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PKAccountUserDetailViewController__updateNotificationSettings___block_invoke;
  v10[3] = &unk_1E3E75C40;
  v10[4] = self;
  -[PKAccountService updateAccountUserNotificationSettings:forAccountUserWithAltDSID:forAccountWithIdentifier:completion:](accountService, "updateAccountUserNotificationSettings:forAccountUserWithAltDSID:forAccountWithIdentifier:completion:", v4, v8, v9, v10);

}

void __65__PKAccountUserDetailViewController__updateNotificationSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKAccountUserDetailViewController__updateNotificationSettings___block_invoke_2;
  block[3] = &unk_1E3E61400;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __65__PKAccountUserDetailViewController__updateNotificationSettings___block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v2 = *(id **)(a1 + 40);
  if (v3)
  {
    objc_storeStrong(v2 + 132, v3);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 1064);
    *(_QWORD *)(v4 + 1064) = 0;

    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 1072);
    *(_QWORD *)(v6 + 1072) = 0;

  }
  else
  {
    objc_msgSend(v2, "_presentDisplayableError:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 40), "_setPerformingAction:animated:", 0, 1);
  return objc_msgSend(*(id *)(a1 + 40), "_updateConfigurationAnimated:", 1);
}

- (void)_setPerformingAction:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_performingAction ^ a3) & 1) == 0)
  {
    self->_performingAction = a3;
    -[PKAccountUserDetailViewController _updateConfigurationAnimated:](self, "_updateConfigurationAnimated:", a4);
  }
}

- (void)_presentDisplayableError:(id)a3
{
  id v4;

  v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
  -[PKAccountUserDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_presentPeerPaymentFamilySharingSetupForFamilyMember:(id)a3
{
  id v4;
  PKPeerPaymentAssociatedAccountsController *v5;
  PKFamilyMemberCollection *familyMemberCollection;
  PKContactAvatarManager *avatarManager;
  id v8;
  int64_t style;
  uint64_t v10;
  uint64_t v11;
  PKPeerPaymentAssociatedAccountsController *v12;
  PKPeerPaymentAssociatedAccountsController *associatedAccountsController;
  PKPeerPaymentAssociatedAccountsController *v14;
  void *v15;
  PKPeerPaymentAssociatedAccountPresentationContext *v16;

  if (a3)
  {
    v4 = a3;
    v5 = [PKPeerPaymentAssociatedAccountsController alloc];
    familyMemberCollection = self->_familyMemberCollection;
    avatarManager = self->_avatarManager;
    v8 = objc_alloc_init(MEMORY[0x1E0D66F18]);
    style = self->_style;
    v10 = 3;
    if (style != 1)
      v10 = 0;
    if (style == 2)
      v11 = 4;
    else
      v11 = v10;
    v12 = -[PKPeerPaymentAssociatedAccountsController initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:](v5, "initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:", familyMemberCollection, avatarManager, v8, v11);
    associatedAccountsController = self->_associatedAccountsController;
    self->_associatedAccountsController = v12;

    v16 = -[PKPeerPaymentAssociatedAccountPresentationContext initWithPKFamilyMember:setupType:]([PKPeerPaymentAssociatedAccountPresentationContext alloc], "initWithPKFamilyMember:setupType:", v4, 1);
    v14 = self->_associatedAccountsController;
    -[PKAccountUserDetailViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAssociatedAccountsController presentAssociatedAccountsFlowWithPresentationContext:fromNavigationController:](v14, "presentAssociatedAccountsFlowWithPresentationContext:fromNavigationController:", v16, v15);

  }
}

- (void)_presentPasswordAuthorizationWithReason:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  if (v6)
  {
    v7 = (objc_class *)MEMORY[0x1E0D002F8];
    v8 = a3;
    v9 = objc_alloc_init(v7);
    objc_msgSend(v9, "setPresentingViewController:", self);
    -[PKAppleAccountInformation appleID](self->_appleAccountInformation, "appleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUsername:", v10);

    -[PKAppleAccountInformation aaAlternateDSID](self->_appleAccountInformation, "aaAlternateDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAltDSID:", v11);

    objc_msgSend(v9, "setIsUsernameEditable:", 0);
    objc_msgSend(v9, "setShouldPromptForPasswordOnly:", 1);
    objc_msgSend(v9, "setAuthenticationType:", 2);
    objc_msgSend(v9, "setReason:", v8);

    v12 = objc_alloc_init(MEMORY[0x1E0D00130]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __88__PKAccountUserDetailViewController__presentPasswordAuthorizationWithReason_completion___block_invoke;
    v13[3] = &unk_1E3E618C8;
    v13[4] = self;
    v14 = v6;
    objc_msgSend(v12, "authenticateWithContext:completion:", v9, v13);

  }
}

void __88__PKAccountUserDetailViewController__presentPasswordAuthorizationWithReason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PKAccountUserDetailViewController__presentPasswordAuthorizationWithReason_completion___block_invoke_2;
  block[3] = &unk_1E3E61450;
  v8 = v4;
  v5 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __88__PKAccountUserDetailViewController__presentPasswordAuthorizationWithReason_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v15 = 138412290;
    v16 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Request for user authentication returned with error: %@", (uint8_t *)&v15, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_8;
  }
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CFFF10];
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CFFF10]))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "code");

    if (v7 == -7003)
    {
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_8:
      v8();
      return;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v6))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "code");

    if (v10 == -7005)
    {
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      return;
    }
  }
  else
  {

  }
  +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "feature"), 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)_footerViewForPeerPaymentAccountSetup
{
  PKFooterHyperlinkView *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[5];

  v3 = objc_alloc_init(PKFooterHyperlinkView);
  -[CNContact givenName](self->_contact, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFamilyMemberCollection currentUser](self->_familyMemberCollection, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOrganizer");

  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_ASSOCIATED_ACCOUNT_FOOTER_SETUP_NOW_LINK_TEXT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_ASSOCIATED_ACCOUNT_FOOTER"), CFSTR("%@%@"), v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = v7;
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PKAccountUserDetailViewController__footerViewForPeerPaymentAccountSetup__block_invoke_2;
    aBlock[3] = &unk_1E3E612E8;
    aBlock[4] = self;
    v10 = _Block_copy(aBlock);
  }
  else
  {
    PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_ASSOCIATED_ACCOUNT_FOOTER_NOT_ORGANIZER_LINK_TEXT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_ASSOCIATED_ACCOUNT_FOOTER_NOT_ORGANIZER"), CFSTR("%@%@"), v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = &__block_literal_global_240_1;
  }
  PKAttributedStringByAddingLinkToSubstring(v9, v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFooterHyperlinkView setAttributedText:](v3, "setAttributedText:", v11);

  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __74__PKAccountUserDetailViewController__footerViewForPeerPaymentAccountSetup__block_invoke_4;
  v14[3] = &unk_1E3E66590;
  v15 = v10;
  v12 = v10;
  -[PKFooterHyperlinkView setAction:](v3, "setAction:", v14);

  return v3;
}

void __74__PKAccountUserDetailViewController__footerViewForPeerPaymentAccountSetup__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1088);
  objc_msgSend(*(id *)(v2 + 1056), "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "familyMemberForAltDSID:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_presentPeerPaymentFamilySharingSetupForFamilyMember:", v5);
}

void __74__PKAccountUserDetailViewController__footerViewForPeerPaymentAccountSetup__block_invoke_3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/kb/HT211324"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openURL:configuration:completionHandler:", v0, 0, 0);

}

uint64_t __74__PKAccountUserDetailViewController__footerViewForPeerPaymentAccountSetup__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_associatedAccountsController, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_physicalCardActionController, 0);
  objc_storeStrong((id *)&self->_physicalCardController, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_appleAccountInformation, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_accountUserInvitation, 0);
  objc_storeStrong((id *)&self->_pendingAccountUserNotificationSettings, 0);
  objc_storeStrong((id *)&self->_pendingAccountUserPreferences, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end
