@implementation PKPaymentPassDetailViewController

- (BOOL)shouldShowAccountUsersSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v8;
  void *v9;
  uint64_t v10;
  char v11;

  -[PKPaymentPassDetailViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "creditDetails"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    -[PKPaymentPassDetailViewController transactionSourceCollection](self, "transactionSourceCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[PKCreditAccountController shouldDisplayTransactionsForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayTransactionsForTransactionSourceCollection:withAccount:", v6, v4);

    v8 = !v7;
  }
  else
  {
    v8 = 1;
  }
  -[PKPaymentPassDetailViewController sortedFamilyMemberRowModels](self, "sortedFamilyMemberRowModels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = v8 ^ 1;
  if ((v8 & 1) == 0 && !v10)
    v11 = -[PKPaymentPassDetailViewController _showsAddAccountUserButton](self, "_showsAddAccountUserButton");

  return v11;
}

- (BOOL)canSelectAccountUserRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  int v9;

  v4 = a3;
  -[PKPaymentPassDetailViewController sortedFamilyMemberRowModels](self, "sortedFamilyMemberRowModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = objc_msgSend(v4, "row");
  if (v7 >= v6)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    -[PKPaymentPassDetailViewController account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "state");
    v9 = PKAccountStateIsTerminal() ^ 1;

  }
  return v9;
}

- (unint64_t)numberOfAccountUserRowsInTableView:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[PKPaymentPassDetailViewController sortedFamilyMemberRowModels](self, "sortedFamilyMemberRowModels", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v5 + -[PKPaymentPassDetailViewController _showsAddAccountUserButton](self, "_showsAddAccountUserButton");

  return v6;
}

- (id)accountUserTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentPassDetailViewController sortedFamilyMemberRowModels](self, "sortedFamilyMemberRowModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (objc_msgSend(v6, "row") >= v9)
    -[PKPaymentPassDetailViewController _addAccounUserTableViewCellForTableView:atIndexPath:](self, "_addAccounUserTableViewCellForTableView:atIndexPath:", v7, v6);
  else
    -[PKPaymentPassDetailViewController _accountUserTableViewCellForTableView:atIndexPath:](self, "_accountUserTableViewCellForTableView:atIndexPath:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67820]);
  return v10;
}

- (void)didSelectAccountUserCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKAccountUserDetailViewController *v18;
  void *v19;
  PKAccountUserDetailViewController *v20;
  id v21;

  v5 = a4;
  -[PKPaymentPassDetailViewController sortedFamilyMemberRowModels](self, "sortedFamilyMemberRowModels");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v21, "count");
  v7 = objc_msgSend(v5, "row");

  if (v7 >= v6)
  {
    -[PKPaymentPassDetailViewController presentAddAccountUser](self, "presentAddAccountUser");
  }
  else
  {
    objc_msgSend(v21, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invitation");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      -[PKPaymentPassDetailViewController presentAccountUserDetailsForRowModel:](self, "presentAccountUserDetailsForRowModel:", v8);
    }
    else if (v10)
    {
      v20 = [PKAccountUserDetailViewController alloc];
      -[PKPaymentPassDetailViewController pass](self, "pass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PKPaymentPassDetailViewController detailViewStyle](self, "detailViewStyle");
      -[PKPaymentPassDetailViewController account](self, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController familyCollection](self, "familyCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController contactAvatarManager](self, "contactAvatarManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController contactResolver](self, "contactResolver");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PKAccountUserDetailViewController initWithPaymentPass:style:account:accountUserInvitation:familyMemberCollection:avatarManager:contactResolver:](v20, "initWithPaymentPass:style:account:accountUserInvitation:familyMemberCollection:avatarManager:contactResolver:", v12, v13, v14, v11, v15, v16, v17);

      -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pushViewController:animated:", v18, 1);

    }
  }

}

- (BOOL)shouldShowAccountUserStopSharingSection
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PKPaymentPassDetailViewController accountUserCollection](self, "accountUserCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAccountUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "accessLevel") == 2;
  else
    v4 = 0;

  return v4;
}

- (id)accountUserStopSharingTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[PKPaymentPassDetailViewController _removeCardTextColor](self, "_removeCardTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("STOP_USING_SHARED_CARD_BUTTON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  -[PKPaymentPassDetailViewController _showSpinner:inCell:overrideTextColor:](self, "_showSpinner:inCell:overrideTextColor:", -[PKPaymentPassDetailViewController isRemovingAccountUser](self, "isRemovingAccountUser"), v7, v6);
  objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67990]);

  return v7;
}

- (void)loadAccountUsersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PKPaymentPassDetailViewController account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __83__PKPaymentPassDetailViewController_PKAccountUser__loadAccountUsersWithCompletion___block_invoke;
    v7[3] = &unk_1E3E616F8;
    v7[4] = self;
    v8 = v4;
    -[PKPaymentPassDetailViewController _accountUsersForAccountIdentifier:completion:](self, "_accountUsersForAccountIdentifier:completion:", v6, v7);

  }
}

uint64_t __83__PKPaymentPassDetailViewController_PKAccountUser__loadAccountUsersWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAccountUserCollection:", a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)loadPendingAccountUserInvitationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PKPaymentPassDetailViewController account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __100__PKPaymentPassDetailViewController_PKAccountUser__loadPendingAccountUserInvitationsWithCompletion___block_invoke;
    v7[3] = &unk_1E3E61878;
    v7[4] = self;
    v8 = v4;
    -[PKPaymentPassDetailViewController _pendingInvitationsForAccountIdentifier:completion:](self, "_pendingInvitationsForAccountIdentifier:completion:", v6, v7);

  }
}

uint64_t __100__PKPaymentPassDetailViewController_PKAccountUser__loadPendingAccountUserInvitationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAccountUserInvitations:", a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentAccountUserDetailsForRowModel:(id)a3
{
  id v4;
  PKAccountUserDetailViewController *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKAccountUserDetailViewController *v14;

  v4 = a3;
  v5 = [PKAccountUserDetailViewController alloc];
  -[PKPaymentPassDetailViewController pass](self, "pass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKPaymentPassDetailViewController detailViewStyle](self, "detailViewStyle");
  -[PKPaymentPassDetailViewController account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPassDetailViewController familyCollection](self, "familyCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController contactAvatarManager](self, "contactAvatarManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController contactResolver](self, "contactResolver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKAccountUserDetailViewController initWithPaymentPass:style:account:accountUser:familyMemberCollection:avatarManager:contactResolver:](v5, "initWithPaymentPass:style:account:accountUser:familyMemberCollection:avatarManager:contactResolver:", v6, v7, v8, v9, v10, v11, v12);

  -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushViewController:animated:", v14, 1);

}

- (void)presentAccountUserInvitationForRowModel:(id)a3
{
  id v4;

  objc_msgSend(a3, "invitation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _presentInvitation:completion:](self, "_presentInvitation:completion:", v4, 0);

}

- (BOOL)shouldShowVerifySSNSection
{
  void *v2;
  void *v3;

  -[PKPaymentPassDetailViewController accountUserCollection](self, "accountUserCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAccountUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "identityStatus") == 2;
  return (char)v2;
}

- (id)verifySSNTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  PKLocalizedMadisonString(CFSTR("BUILD_CREDIT_HISTORY_BUTTON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67990]);
  return v7;
}

- (void)didSelectVerifySSNCellInTableView:(id)a3 atIndexPath:(id)a4
{
  PKAccountVerifySSNPageViewController *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  PKNavigationController *v10;
  PKAccountVerifySSNPageViewController *v11;

  v5 = [PKAccountVerifySSNPageViewController alloc];
  -[PKPaymentPassDetailViewController account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKPaymentPassDetailViewController detailViewStyle](self, "detailViewStyle");
  v8 = 3;
  if (v7 != 1)
    v8 = 0;
  if (v7 == 2)
    v9 = 4;
  else
    v9 = v8;
  v11 = -[PKAccountVerifySSNPageViewController initWithAccount:context:](v5, "initWithAccount:context:", v6, v9);

  v10 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v11);
  -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)_presentInvitation:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  PKApplyControllerConfiguration *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  PKApplyControllerConfiguration *v16;
  PKApplyController *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0D67230];
  v8 = a3;
  v9 = [v7 alloc];
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithWebService:", v10);

  v12 = [PKApplyControllerConfiguration alloc];
  v13 = -[PKPaymentPassDetailViewController detailViewStyle](self, "detailViewStyle");
  v14 = 3;
  if (v13 != 1)
    v14 = 0;
  if (v13 == 2)
    v15 = 4;
  else
    v15 = v14;
  v16 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:](v12, "initWithSetupDelegate:context:provisioningController:", 0, v15, v11);
  -[PKApplyControllerConfiguration setFeatureApplication:](v16, "setFeatureApplication:", v8);

  v17 = -[PKApplyController initWithApplyConfiguration:]([PKApplyController alloc], "initWithApplyConfiguration:", v16);
  v18 = (void *)MEMORY[0x1E0D66820];
  -[PKPaymentPassDetailViewController account](self, "account");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "analyticsAccountTypeForAccount:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyController setAnalyticsExistingAccountType:](v17, "setAnalyticsExistingAccountType:", v20);

  -[PKPaymentPassDetailViewController setApplyController:](self, "setApplyController:", v17);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__PKPaymentPassDetailViewController_PKAccountUser___presentInvitation_completion___block_invoke;
  v22[3] = &unk_1E3E61720;
  v22[4] = self;
  v23 = v6;
  v21 = v6;
  -[PKApplyController nextViewControllerWithCompletion:](v17, "nextViewControllerWithCompletion:", v22);

}

void __82__PKPaymentPassDetailViewController_PKAccountUser___presentInvitation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKNavigationController *v6;
  PKNavigationController *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v9);
  }
  else
  {
    if (!v5)
      goto LABEL_6;
    v6 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
  }
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

LABEL_6:
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

- (id)_removeCardTextColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PKPaymentPassDetailViewController warningTextColor](self, "warningTextColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)_presentStopSharingAlertForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (!-[PKPaymentPassDetailViewController isRemovingAccountUser](self, "isRemovingAccountUser"))
  {
    PKLocalizedMadisonString(CFSTR("STOP_USING_SHARED_CARD_ALERT_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("STOP_USING_SHARED_CARD_ALERT_MESSAGE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedMadisonString(CFSTR("STOP_USING_SHARED_CARD_ALERT_BUTTON"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __99__PKPaymentPassDetailViewController_PKAccountUser___presentStopSharingAlertForTableView_indexPath___block_invoke;
    v17[3] = &unk_1E3E61798;
    v17[4] = self;
    v18 = v6;
    v19 = v7;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 2, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v13);

    v14 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedMadisonString(CFSTR("STOP_USING_SHARED_CARD_ALERT_CANCEL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v16);

    -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  }

}

void __99__PKPaymentPassDetailViewController_PKAccountUser___presentStopSharingAlertForTableView_indexPath___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a2;
  objc_msgSend(a1[4], "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setRemovingAccountUser:", 1);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  objc_msgSend(a1[5], "cellForRowAtIndexPath:", a1[6]);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "_removeCardTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "_showSpinner:inCell:overrideTextColor:", 1, v21[5], v5);
  objc_msgSend(a1[4], "accountService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "accountUserCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentAccountUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__PKPaymentPassDetailViewController_PKAccountUser___presentStopSharingAlertForTableView_indexPath___block_invoke_37;
  v14[3] = &unk_1E3E61770;
  v11 = a1[5];
  v14[4] = a1[4];
  v19 = &v20;
  v15 = v11;
  v16 = a1[6];
  v12 = v5;
  v17 = v12;
  v13 = v4;
  v18 = v13;
  objc_msgSend(v6, "deleteAccountUserWithAltDSID:forAccountWithIdentifier:completion:", v9, v10, v14);

  _Block_object_dispose(&v20, 8);
}

void __99__PKPaymentPassDetailViewController_PKAccountUser___presentStopSharingAlertForTableView_indexPath___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __99__PKPaymentPassDetailViewController_PKAccountUser___presentStopSharingAlertForTableView_indexPath___block_invoke_2;
  block[3] = &unk_1E3E61748;
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v4;
  block[1] = 3221225472;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = v3;
  v12 = *(id *)(a1 + 64);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __99__PKPaymentPassDetailViewController_PKAccountUser___presentStopSharingAlertForTableView_indexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setRemovingAccountUser:", 0);
  objc_msgSend(*(id *)(a1 + 40), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_showSpinner:inCell:overrideTextColor:", 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 56));
  v5 = *(_QWORD *)(a1 + 64);
  if (v5)
  {
    +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v5, objc_msgSend(*(id *)(a1 + 72), "feature"), 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v6 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "pass");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "deleteOverrider");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "passLibraryDataProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPassDeleteHelper deletePaymentPass:withDeleteHander:passLibraryDataProvider:presentingViewController:](PKPassDeleteHelper, "deletePaymentPass:withDeleteHander:passLibraryDataProvider:presentingViewController:", v8, v6, v7, *(_QWORD *)(a1 + 32));

  }
}

- (void)presentAddAccountUser
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[PKPaymentPassDetailViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController accountUserCollection](self, "accountUserCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController familyCollection](self, "familyCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPaymentPassDetailViewController detailViewStyle](self, "detailViewStyle");
  v7 = 3;
  if (v6 != 1)
    v7 = 0;
  if (v6 == 2)
    v8 = 4;
  else
    v8 = v7;
  +[PKAccountInvitationController presentCreateAccountUserInvitationWithViewController:account:accountUserCollection:familyMemberCollection:context:completion:](PKAccountInvitationController, "presentCreateAccountUserInvitationWithViewController:account:accountUserCollection:familyMemberCollection:context:completion:", self, v3, v4, v5, v8, 0);

  -[PKPaymentPassDetailViewController _reportAddAccountUser](self, "_reportAddAccountUser");
}

- (void)_accountUsersForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0D668E8];
  v7 = a3;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__PKPaymentPassDetailViewController_PKAccountUser___accountUsersForAccountIdentifier_completion___block_invoke;
  v10[3] = &unk_1E3E617C0;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "accountUsersForAccountWithIdentifier:completion:", v7, v10);

}

void __97__PKPaymentPassDetailViewController_PKAccountUser___accountUsersForAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0D66940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithAccountUsers:", v4);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__PKPaymentPassDetailViewController_PKAccountUser___accountUsersForAccountIdentifier_completion___block_invoke_2;
  v8[3] = &unk_1E3E618A0;
  v6 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __97__PKPaymentPassDetailViewController_PKAccountUser___accountUsersForAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_pendingInvitationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[PKPaymentPassDetailViewController paymentServiceDataProvider](self, "paymentServiceDataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __103__PKPaymentPassDetailViewController_PKAccountUser___pendingInvitationsForAccountIdentifier_completion___block_invoke;
  v10[3] = &unk_1E3E61828;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "featureApplicationsForAccountIdentifier:completion:", v7, v10);

}

void __103__PKPaymentPassDetailViewController_PKAccountUser___pendingInvitationsForAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __103__PKPaymentPassDetailViewController_PKAccountUser___pendingInvitationsForAccountIdentifier_completion___block_invoke_2;
  v5[3] = &unk_1E3E61850;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __103__PKPaymentPassDetailViewController_PKAccountUser___pendingInvitationsForAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pk_objectsPassingTest:", &__block_literal_global_0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __103__PKPaymentPassDetailViewController_PKAccountUser___pendingInvitationsForAccountIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t IsPendingInvitation;

  v2 = a2;
  if (objc_msgSend(v2, "applicationType") == 2)
  {
    objc_msgSend(v2, "applicationState");
    IsPendingInvitation = PKFeatureApplicationStateIsPendingInvitation();
  }
  else
  {
    IsPendingInvitation = 0;
  }

  return IsPendingInvitation;
}

- (id)_accountUserTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  PKFamilyMemberTableViewCell *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("AccountUserCellReuseIdentifier"));
  v7 = (PKFamilyMemberTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[PKFamilyMemberTableViewCell initWithStyle:reuseIdentifier:]([PKFamilyMemberTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("AccountUserCellReuseIdentifier"));
  -[PKPaymentPassDetailViewController sortedFamilyMemberRowModels](self, "sortedFamilyMemberRowModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKFamilyMemberTableViewCell setRowModel:](v7, "setRowModel:", v9);
  v10 = -[PKPaymentPassDetailViewController canSelectAccountUserRowAtIndexPath:](self, "canSelectAccountUserRowAtIndexPath:", v6);

  if (!v10)
    -[PKFamilyMemberTableViewCell setAccessoryType:](v7, "setAccessoryType:", 0);

  return v7;
}

- (id)_addAccounUserTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("AddAccountUserCellReuseIdentifier"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("AddAccountUserCellReuseIdentifier"));
  objc_msgSend(v4, "defaultContentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("SHARE_MY_CARD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v7);

  objc_msgSend(v5, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v9);

  objc_msgSend(v4, "setContentConfiguration:", v5);
  objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67868]);

  return v4;
}

- (BOOL)_showsAddAccountUserButton
{
  void *v2;
  BOOL v3;

  -[PKPaymentPassDetailViewController account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PKAccountInvitationController canInviteAccountUserWithAccount:](PKAccountInvitationController, "canInviteAccountUserWithAccount:", v2);

  return v3;
}

- (void)_reportAddAccountUser
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPaymentPassDetailViewController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKPaymentPassDetailViewController account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "analyticsEventAccountType");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (id)*MEMORY[0x1E0D68AB8];
  }

  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x1E0D68AA8]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D694F8], *MEMORY[0x1E0D69438]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D68C08], *MEMORY[0x1E0D68AA0]);
  v30 = v3;
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D68FC0], *MEMORY[0x1E0D68F50]);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[PKPaymentPassDetailViewController accountUserCollection](self, "accountUserCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountUsers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  v29 = v6;
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v31 = 0;
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isCurrentUser") & 1) == 0)
        {
          -[PKPaymentPassDetailViewController familyCollection](self, "familyCollection");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "altDSID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "familyMemberForAltDSID:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = objc_msgSend(v18, "memberType");
          switch(v19)
          {
            case 2:
              ++v31;
              break;
            case 1:
              ++v12;
              break;
            case 0:
              ++v11;
              break;
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v31 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v21, *MEMORY[0x1E0D686A8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v23, *MEMORY[0x1E0D686B8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v25, *MEMORY[0x1E0D686B0]);

  v26 = (void *)MEMORY[0x1E0D66A58];
  v27 = *MEMORY[0x1E0D698C0];
  v28 = (void *)objc_msgSend(v30, "copy");
  objc_msgSend(v26, "subject:sendEvent:", v27, v28);

}

- (BOOL)_shouldDisplayPayLaterItems
{
  void *v2;
  char v3;

  -[PKPaymentPassDetailViewController account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKCanShowPayLaterPassItemsForAccount();

  return v3;
}

- (BOOL)shouldShowPersonalInformationSection
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[PKPaymentPassDetailViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payLaterDetails");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    if (-[PKPaymentPassDetailViewController _shouldDisplayPayLaterItems](self, "_shouldDisplayPayLaterItems"))
    {
      objc_msgSend(v5, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "hasUserInfo");

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)shouldShowFinancingPlanListSection
{
  BOOL v3;
  _BOOL4 v4;

  v3 = -[PKPaymentPassDetailViewController activeFinancingPlansCount](self, "activeFinancingPlansCount") > 0
    || -[PKPaymentPassDetailViewController completedFinancingPlansCount](self, "completedFinancingPlansCount") > 0;
  v4 = -[PKPaymentPassDetailViewController _shouldDisplayPayLaterItems](self, "_shouldDisplayPayLaterItems");
  if (v4)
    LOBYTE(v4) = -[PKPaymentPassDetailViewController _canFetchFinancingPlans](self, "_canFetchFinancingPlans") && v3;
  return v4;
}

- (BOOL)shouldShowEligibleSpendSection
{
  void *v3;
  void *v4;
  int v5;

  -[PKPaymentPassDetailViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentPassDetailViewController _shouldDisplayPayLaterItems](self, "_shouldDisplayPayLaterItems")
    && -[PKPaymentPassDetailViewController _canFetchFinancingPlans](self, "_canFetchFinancingPlans"))
  {
    objc_msgSend(v3, "payLaterDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isPayLaterSupportedInCurrentRegion") && objc_msgSend(v3, "state") != 2)
      v5 = objc_msgSend(v3, "hidePayLaterSetupInWallet") ^ 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)footerTextForPersonalInformationSection
{
  return (id)PKLocalizedCocoonString(CFSTR("PERSONAL_INFORMATION_FOOTER"));
}

- (id)personalInformationTableVewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  -[PKPaymentPassDetailViewController primaryTextColor](self, "primaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v8, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("PERSONAL_INFORMATION_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  objc_msgSend(v7, "setAccessoryType:", 1);
  return v7;
}

- (id)financingPlanListTableVewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  -[PKPaymentPassDetailViewController primaryTextColor](self, "primaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PKPaymentPassDetailViewController _value1CellWithTextColor:forTableView:](self, "_value1CellWithTextColor:forTableView:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _value1CellWithTextColor:forTableView:](self, "_value1CellWithTextColor:forTableView:", v8, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = -[PKPaymentPassDetailViewController activeFinancingPlansCount](self, "activeFinancingPlansCount");
  if (v9)
  {
    v10 = v9;
    -[PKPaymentPassDetailViewController numberFormatter](self, "numberFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromNumber:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("NUMBER_ACTIVE_INSTALLMENTS"), CFSTR("%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v7, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("ALL_PURCHASES"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v16);

  objc_msgSend(v7, "detailTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v14);

  objc_msgSend(v7, "setAccessoryType:", 1);
  return v7;
}

- (id)payLaterEligibleSpendTableVewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
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

  v5 = a3;
  if (-[PKPaymentPassDetailViewController _hasEligibleSpend](self, "_hasEligibleSpend"))
  {
    -[PKPaymentPassDetailViewController primaryTextColor](self, "primaryTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PKPaymentPassDetailViewController _value1CellWithTextColor:forTableView:](self, "_value1CellWithTextColor:forTableView:", v6, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _value1CellWithTextColor:forTableView:](self, "_value1CellWithTextColor:forTableView:", v9, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[PKPaymentPassDetailViewController account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "payLaterDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "maximumEligibleSpendAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("AVAILABLE_TO_SPEND"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v13);

    objc_msgSend(v7, "detailTextLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formattedStringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v15);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v16);

    objc_msgSend(v7, "setAccessoryType:", 1);
  }
  else
  {
    PKLocalizedCocoonString(CFSTR("NEW_PURCHASE_BUTTON"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v8, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)didSelectPersonalInformationCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKPaymentPassDetailViewController groupsController](self, "groupsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAuthenticating:", 1);

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __103__PKPaymentPassDetailViewController_PayLater__didSelectPersonalInformationCellInTableView_atIndexPath___block_invoke;
  v9[3] = &unk_1E3E61C58;
  objc_copyWeak(&v10, &location);
  -[PKPaymentPassDetailViewController presentAuthRequestForPolicy:completion:](self, "presentAuthRequestForPolicy:completion:", 1, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __103__PKPaymentPassDetailViewController_PayLater__didSelectPersonalInformationCellInTableView_atIndexPath___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  PKPayLaterUserInfoViewController *v12;
  void *v13;
  PKPayLaterUserInfoViewController *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "groupsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAuthenticating:", 0);

    v6 = (void *)MEMORY[0x1E0D66A58];
    v7 = *MEMORY[0x1E0D68F50];
    v16[0] = *MEMORY[0x1E0D68858];
    v16[1] = v7;
    v8 = *MEMORY[0x1E0D68FC0];
    v17[0] = *MEMORY[0x1E0D68830];
    v17[1] = v8;
    v16[2] = *MEMORY[0x1E0D68AA0];
    v9 = (_QWORD *)MEMORY[0x1E0D68AF8];
    if (!a2)
      v9 = (_QWORD *)MEMORY[0x1E0D68AE0];
    v17[2] = *v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportDashboardEventIfNecessary:forPass:", v10, v11);

    if (a2)
    {
      v12 = [PKPayLaterUserInfoViewController alloc];
      objc_msgSend(v4, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PKPayLaterUserInfoViewController initWithPayLaterAccount:](v12, "initWithPayLaterAccount:", v13);

      objc_msgSend(v4, "navigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pushViewController:animated:", v14, 1);

    }
  }

}

- (void)didSelectFinancingPlanListCellInTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D66A58];
  v6 = *MEMORY[0x1E0D68F50];
  v16[0] = *MEMORY[0x1E0D68858];
  v16[1] = v6;
  v7 = *MEMORY[0x1E0D68FC0];
  v17[0] = *MEMORY[0x1E0D68810];
  v17[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController pass](self, "pass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportDashboardEventIfNecessary:forPass:", v8, v9);

  v10 = objc_alloc(MEMORY[0x1E0D668F8]);
  -[PKPaymentPassDetailViewController account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithAccountIdentifier:queryItems:", v12, 16);

  -[PKPaymentPassDetailViewController accountService](self, "accountService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __101__PKPaymentPassDetailViewController_PayLater__didSelectFinancingPlanListCellInTableView_atIndexPath___block_invoke;
  v15[3] = &unk_1E3E65BF8;
  v15[4] = self;
  objc_msgSend(v14, "financingPlansWithQuery:completion:", v13, v15);

}

void __101__PKPaymentPassDetailViewController_PayLater__didSelectFinancingPlanListCellInTableView_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __101__PKPaymentPassDetailViewController_PayLater__didSelectFinancingPlanListCellInTableView_atIndexPath___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __101__PKPaymentPassDetailViewController_PayLater__didSelectFinancingPlanListCellInTableView_atIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "paymentIntentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "activeFinancingPlans");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPayLaterFinancingPlanListViewController activePlansAndCompletedPlansCountListViewControllerWithPayLaterAccount:paymentIntentController:financingPlans:completedFinancingPlansCount:](PKPayLaterFinancingPlanListViewController, "activePlansAndCompletedPlansCountListViewControllerWithPayLaterAccount:paymentIntentController:financingPlans:completedFinancingPlansCount:", v2, v3, v4, objc_msgSend(*(id *)(a1 + 32), "completedFinancingPlansCount"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)didSelectPayLaterEligibleSpendCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  PKPayLaterEligibleSpendViewController *v8;
  void *v9;
  PKPayLaterEligibleSpendViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  PKPayLaterEligibleSpendViewController *v32;
  id v33;
  id v34;
  id location;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PKPaymentPassDetailViewController _hasEligibleSpend](self, "_hasEligibleSpend"))
  {
    v8 = [PKPayLaterEligibleSpendViewController alloc];
    -[PKPaymentPassDetailViewController account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKPayLaterEligibleSpendViewController initWithPayLaterAccount:](v8, "initWithPayLaterAccount:", v9);

    -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushViewController:animated:", v10, 1);

    v12 = (void *)MEMORY[0x1E0D66A58];
    v13 = *MEMORY[0x1E0D68F50];
    v38[0] = *MEMORY[0x1E0D68858];
    v38[1] = v13;
    v14 = *MEMORY[0x1E0D68FC0];
    v39[0] = *MEMORY[0x1E0D68818];
    v39[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController pass](self, "pass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportDashboardEventIfNecessary:forPass:", v15, v16);

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0D66A58];
    v18 = *MEMORY[0x1E0D68F50];
    v36[0] = *MEMORY[0x1E0D68858];
    v36[1] = v18;
    v19 = *MEMORY[0x1E0D68FC0];
    v37[0] = *MEMORY[0x1E0D68868];
    v37[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController pass](self, "pass");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reportDashboardEventIfNecessary:forPass:", v20, v21);

    -[PKPaymentPassDetailViewController tableView](self, "tableView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cellForRowAtIndexPath:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentPassDetailViewController linkTextColor](self, "linkTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v26;

    -[PKPaymentPassDetailViewController _showSpinner:inCell:overrideTextColor:](self, "_showSpinner:inCell:overrideTextColor:", 1, v23, v27);
    -[PKPaymentPassDetailViewController account](self, "account");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPayLaterSetupFlowController defaultPayLaterSetupFlowControllerForAccount:controllerContext:referrerIdentifier:](PKPayLaterSetupFlowController, "defaultPayLaterSetupFlowControllerForAccount:controllerContext:referrerIdentifier:", v28, 3, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController setPayLaterSetupFlowController:](self, "setPayLaterSetupFlowController:", v29);

    objc_initWeak(&location, self);
    -[PKPaymentPassDetailViewController payLaterSetupFlowController](self, "payLaterSetupFlowController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __105__PKPaymentPassDetailViewController_PayLater__didSelectPayLaterEligibleSpendCellInTableView_atIndexPath___block_invoke;
    v31[3] = &unk_1E3E65C48;
    objc_copyWeak(&v34, &location);
    v31[4] = self;
    v10 = v23;
    v32 = v10;
    v15 = v27;
    v33 = v15;
    objc_msgSend(v30, "fetchPayLaterDynamicContentWithCompletion:", v31);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

}

void __105__PKPaymentPassDetailViewController_PayLater__didSelectPayLaterEligibleSpendCellInTableView_atIndexPath___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__PKPaymentPassDetailViewController_PayLater__didSelectPayLaterEligibleSpendCellInTableView_atIndexPath___block_invoke_2;
  v9[3] = &unk_1E3E65C20;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v7 = *(id *)(a1 + 48);
  v14 = a2;
  v11 = v7;
  v12 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __105__PKPaymentPassDetailViewController_PayLater__didSelectPayLaterEligibleSpendCellInTableView_atIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id v16;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __105__PKPaymentPassDetailViewController_PayLater__didSelectPayLaterEligibleSpendCellInTableView_atIndexPath___block_invoke_3;
    v13 = &unk_1E3E61EE8;
    objc_copyWeak(&v16, &location);
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v3 = (void (**)(_QWORD))_Block_copy(&v10);
    if (!*(_BYTE *)(a1 + 72) || *(_QWORD *)(a1 + 56))
    {
      PKDisplayableErrorForCommonType();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKAccountDisplayableError();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      if (v8)
      {
        v6 = v8;
        objc_msgSend(WeakRetained, "navigationController", v10, v11, v12, v13, v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "presentViewController:animated:completion:", v6, 1, v3);

      }
      else
      {
        v3[2](v3);
        v6 = 0;
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "payLaterSetupFlowController", v10, v11, v12, v13, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, v3);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __105__PKPaymentPassDetailViewController_PayLater__didSelectPayLaterEligibleSpendCellInTableView_atIndexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_showSpinner:inCell:overrideTextColor:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)handleOpenBusinessChatForPayLater
{
  PKPayLaterBusinessChatTopicComposer *v3;
  void *v4;
  void *v5;
  PKPayLaterBusinessChatTopicComposer *v6;
  void *v7;
  _QWORD v8[5];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  v3 = [PKPayLaterBusinessChatTopicComposer alloc];
  -[PKPaymentPassDetailViewController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController pass](self, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPayLaterBusinessChatTopicComposer initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:](v3, "initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:", v4, v5, 0, 0, 0);
  -[PKPaymentPassDetailViewController setPayLaterTopicsComposer:](self, "setPayLaterTopicsComposer:", v6);

  -[PKPaymentPassDetailViewController payLaterTopicsComposer](self, "payLaterTopicsComposer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke;
  v8[3] = &unk_1E3E65C98;
  objc_copyWeak(v9, &location);
  v8[4] = self;
  v9[1] = (id)1;
  objc_msgSend(v7, "releventTopicsForContext:completion:", 1, v8);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9[2];

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke_2;
  v6[3] = &unk_1E3E65C70;
  objc_copyWeak(v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9[1] = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(v9);
}

void __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  PKPayLaterBusinessChatTopicsViewController *v3;
  void *v4;
  void *v5;
  PKPayLaterBusinessChatTopicsViewController *v6;
  PKNavigationController *v7;
  PKBusinessChatPayLaterContext *v8;
  void *v9;
  void *v10;
  void *v11;
  PKBusinessChatPayLaterContext *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v3 = [PKPayLaterBusinessChatTopicsViewController alloc];
      objc_msgSend(WeakRetained, "account");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "pass");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PKPayLaterBusinessChatTopicsViewController initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topics:businessChatContext:](v3, "initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topics:businessChatContext:", v4, v5, 0, 0, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

      v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v6);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else
    {
      objc_initWeak(&location, *(id *)(a1 + 40));
      v8 = [PKBusinessChatPayLaterContext alloc];
      objc_msgSend(WeakRetained, "account");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "pass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D66FD8], "genericBusinessChatTopicForContext:", *(_QWORD *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PKBusinessChatPayLaterContext initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:](v8, "initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:", v9, v10, v11, 0, 0, 0, 0);

      objc_msgSend(WeakRetained, "businessChatController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke_3;
      v14[3] = &unk_1E3E61DB8;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v13, "openBusinessChatWithContext:completion:", v12, v14);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }

}

void __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke_4;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __80__PKPaymentPassDetailViewController_PayLater__handleOpenBusinessChatForPayLater__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v5 = WeakRetained;
    PKAccountDisplayableError();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    if (v4)
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

    WeakRetained = v5;
  }

}

- (void)fetchFinancingPlansIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id location;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  if (-[PKPaymentPassDetailViewController _canFetchFinancingPlans](self, "_canFetchFinancingPlans"))
  {
    -[PKPaymentPassDetailViewController account](self, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PKPaymentPassDetailViewController financingPlansFetcher](self, "financingPlansFetcher");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        v5 = objc_alloc(MEMORY[0x1E0D67020]);
        -[PKPaymentPassDetailViewController account](self, "account");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v5, "initWithPayLaterAccount:", v6);
        -[PKPaymentPassDetailViewController setFinancingPlansFetcher:](self, "setFinancingPlansFetcher:", v7);

      }
      -[PKPaymentPassDetailViewController paymentIntentController](self, "paymentIntentController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v9 = objc_alloc(MEMORY[0x1E0D67048]);
        -[PKPaymentPassDetailViewController account](self, "account");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentPassDetailViewController webService](self, "webService");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentPassDetailViewController peerPaymentWebService](self, "peerPaymentWebService");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentPassDetailViewController accountService](self, "accountService");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc_init(MEMORY[0x1E0D672B0]);
        objc_msgSend(v15, "defaultPaymentPassUniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v9, "initWithPayLaterAccount:paymentWebService:passLibrary:peerPaymentWebService:accountService:defaultPassUniqueIdentifier:", v10, v11, v12, v13, v14, v16);

        -[PKPaymentPassDetailViewController setPaymentIntentController:](self, "setPaymentIntentController:", v17);
      }
      -[PKPaymentPassDetailViewController account](self, "account");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "accountIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D668F8]), "initWithAccountIdentifier:queryItems:", v19, 64);
      objc_msgSend(MEMORY[0x1E0D67010], "activeFinancingPlanStates");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCountFinancingPlanStates:", v21);

      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D668F8]), "initWithAccountIdentifier:queryItems:", v19, 64);
      objc_msgSend(MEMORY[0x1E0D67010], "completedFinancingPlanStates");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCountFinancingPlanStates:", v23);

      -[PKPaymentPassDetailViewController financingPlansFetcher](self, "financingPlansFetcher");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v20;
      v33[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __77__PKPaymentPassDetailViewController_PayLater__fetchFinancingPlansIfNecessary__block_invoke;
      v28[3] = &unk_1E3E65CE8;
      objc_copyWeak(&v31, &location);
      v26 = v20;
      v29 = v26;
      v27 = v22;
      v30 = v27;
      objc_msgSend(v24, "financingPlansWithQueries:completion:", v25, v28);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);

    }
  }
}

void __77__PKPaymentPassDetailViewController_PayLater__fetchFinancingPlansIfNecessary__block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__PKPaymentPassDetailViewController_PayLater__fetchFinancingPlansIfNecessary__block_invoke_2;
  v5[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __77__PKPaymentPassDetailViewController_PayLater__fetchFinancingPlansIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "queryIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "queryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v5, "financingPlanCount");
    v10 = objc_msgSend(v8, "financingPlanCount");
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218240;
      v13 = v9;
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Received %ld active financing plans and %ld completed financing plans.", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(WeakRetained, "setActiveFinancingPlansCount:", v9);
    objc_msgSend(WeakRetained, "setCompletedFinancingPlansCount:", v10);
    objc_msgSend(WeakRetained, "reloadPassDetailSections:", &unk_1E3FAE698);

  }
}

- (void)presentPayLaterAccountErrorsIfNecessary
{
  _QWORD v3[4];
  id v4;
  id location;

  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __86__PKPaymentPassDetailViewController_PayLater__presentPayLaterAccountErrorsIfNecessary__block_invoke;
    v3[3] = &unk_1E3E61310;
    objc_copyWeak(&v4, &location);
    -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __86__PKPaymentPassDetailViewController_PayLater__presentPayLaterAccountErrorsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "account");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PKPayLaterHandleFrontOfPassAlertsWithAccount(v2, v3);

    WeakRetained = v3;
  }

}

- (void)presentFinancingPlan:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__PKPaymentPassDetailViewController_PayLater__presentFinancingPlan___block_invoke;
    v5[3] = &unk_1E3E61EE8;
    objc_copyWeak(&v7, &location);
    v5[4] = self;
    v6 = v4;
    -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __68__PKPaymentPassDetailViewController_PayLater__presentFinancingPlan___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  PKPayLaterFinancingPlanViewController *v7;
  id v8;
  void *v9;
  void *v10;
  PKPayLaterFinancingPlanViewController *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PKCanShowPayLaterPassItemsForAccount();

    if ((v4 & 1) != 0)
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1[5], "planIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Pass details presenting financing plan %@", buf, 0xCu);

      }
      v7 = [PKPayLaterFinancingPlanViewController alloc];
      v8 = a1[5];
      objc_msgSend(WeakRetained, "account");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "paymentIntentController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PKPayLaterFinancingPlanViewController initWithFinancingPlan:payLaterAccount:paymentIntentController:merchantIcon:iconGenerator:](v7, "initWithFinancingPlan:payLaterAccount:paymentIntentController:merchantIcon:iconGenerator:", v8, v9, v10, 0, 0);

      objc_initWeak((id *)buf, a1[4]);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __68__PKPaymentPassDetailViewController_PayLater__presentFinancingPlan___block_invoke_58;
      v14[3] = &unk_1E3E62FA0;
      objc_copyWeak(&v16, (id *)buf);
      v12 = v11;
      v15 = v12;
      -[NSObject preflightWithCompletion:](v12, "preflightWithCompletion:", v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1[5], "planIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "PKPaymentPassDetailViewController: Cannot present loan details for %@ because of the account state.", buf, 0xCu);

      }
    }

  }
}

void __68__PKPaymentPassDetailViewController_PayLater__presentFinancingPlan___block_invoke_58(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

    WeakRetained = v4;
  }

}

- (BOOL)_canFetchFinancingPlans
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[PKPaymentPassDetailViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0;
  -[PKPaymentPassDetailViewController account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payLaterDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PKPaymentPassDetailViewController account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_hasEligibleSpend
{
  void *v2;
  void *v3;
  char v4;

  -[PKPaymentPassDetailViewController account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payLaterDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasEligibleSpend");

  return v4;
}

- (BOOL)shouldShowIdentityDocumentSection
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PKPaymentPassDetailViewController pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isIdentityPass")
    && -[PKPaymentPassDetailViewController detailViewStyle](self, "detailViewStyle") != 2)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v3, "deviceContactlessPaymentApplications", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v6 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v8, "paymentType");
          if (PKPaymentMethodTypeIsIdentityDocument())
          {
            if (objc_msgSend(v8, "state") == 1)
            {
              objc_msgSend(v8, "subcredentials");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = objc_msgSend(v9, "count");

              if (v10)
              {
                LOBYTE(v4) = 1;
                goto LABEL_16;
              }
            }
          }
        }
        v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (unint64_t)numberOfIdentityDocumentRowsInTableView:(id)a3
{
  return -[PKPaymentPassDetailViewController shouldShowIdentityDocumentSection](self, "shouldShowIdentityDocumentSection", a3);
}

- (id)identityDocumentTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  _BOOL8 v13;

  v5 = a3;
  -[PKPaymentPassDetailViewController primaryTextColor](self, "primaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v8, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PKPaymentPassDetailViewController pass](self, "pass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "identityType");

  if (v10 > 3)
  {
    v11 = 0;
  }
  else
  {
    PKLocalizedIdentityString(&off_1E3E686C8[v10]->isa);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  v13 = -[PKPaymentPassDetailViewController loadingIdentityDetails](self, "loadingIdentityDetails");
  -[PKPaymentPassDetailViewController _showSpinner:inCell:overrideTextColor:](self, "_showSpinner:inCell:overrideTextColor:", v13, v7, 0);
  if (!v13)
    objc_msgSend(v7, "setAccessoryType:", 1);

  return v7;
}

- (id)identityDocumentSectionFooter
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[PKPaymentPassDetailViewController pass](self, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "identityType");

  if (v3 > 3)
  {
    v4 = 0;
  }
  else
  {
    PKLocalizedIdentityString(&off_1E3E686E8[v3]->isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)didSelectIdentityDocumentCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKIdentityDocumentDetailsViewController *v9;
  void *v10;
  void *v11;
  PKIdentityDocumentDetailsViewController *v12;
  PKIdentityDocumentDetailsViewController *v13;
  _QWORD v14[5];
  PKIdentityDocumentDetailsViewController *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (!-[PKPaymentPassDetailViewController loadingIdentityDetails](self, "loadingIdentityDetails"))
  {
    -[PKPaymentPassDetailViewController setLoadingIdentityDetails:](self, "setLoadingIdentityDetails:", 1);
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _showSpinner:inCell:overrideTextColor:](self, "_showSpinner:inCell:overrideTextColor:", 1, v8, 0);
    v9 = [PKIdentityDocumentDetailsViewController alloc];
    -[PKPaymentPassDetailViewController pass](self, "pass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController paymentServiceDataProvider](self, "paymentServiceDataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKIdentityDocumentDetailsViewController initWithPass:dataProvider:detailViewStyle:](v9, "initWithPass:dataProvider:detailViewStyle:", v10, v11, -[PKPaymentPassDetailViewController detailViewStyle](self, "detailViewStyle"));

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __100__PKPaymentPassDetailViewController_Identity__didSelectIdentityDocumentCellInTableView_atIndexPath___block_invoke;
    v14[3] = &unk_1E3E686A8;
    v14[4] = self;
    v15 = v12;
    v16 = v6;
    v17 = v7;
    v13 = v12;
    -[PKIdentityDocumentDetailsViewController preflightWithCompletion:](v13, "preflightWithCompletion:", v14);

  }
}

void __100__PKPaymentPassDetailViewController_Identity__didSelectIdentityDocumentCellInTableView_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentPassDetailViewController_Identity__didSelectIdentityDocumentCellInTableView_atIndexPath___block_invoke_2;
  block[3] = &unk_1E3E62398;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__PKPaymentPassDetailViewController_Identity__didSelectIdentityDocumentCellInTableView_atIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  BOOL v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", *(_QWORD *)(a1 + 48), 1);
    goto LABEL_24;
  }
  objc_msgSend(v2, "domain");
  v3 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("PKIdentityDocumentDetailsErrorDomain");
  if (v3 == v4)
  {

  }
  else
  {
    v5 = v4;
    if (v3)
      v6 = v4 == 0;
    else
      v6 = 1;
    if (v6)
    {

      goto LABEL_19;
    }
    v8 = -[__CFString isEqualToString:](v3, "isEqualToString:", v4);

    if (!v8)
      goto LABEL_19;
  }
  v9 = objc_msgSend(*(id *)(a1 + 32), "code");
  if (v9 == 2)
  {
    v12 = 0;
    goto LABEL_20;
  }
  if (v9 != 1)
    goto LABEL_19;
  if (PKPearlIsAvailable())
  {
    PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_FACEID_ERROR_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("DRIVER_LICENSE_FACEID_ERROR_MESSAGE");
  }
  else
  {
    PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_TOUCHID_ERROR_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("DRIVER_LICENSE_TOUCHID_ERROR_MESSAGE");
  }
  PKLocalizedIdentityString(&v11->isa);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustom();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_19:
    v12 = 1;
LABEL_20:
    PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_GENERIC_ERROR_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedIdentityString(CFSTR("DRIVER_LICENSE_GENERIC_ERROR_MESSAGE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_24;
  }
  v16 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentViewController:animated:completion:", v16, 1, 0);

  }
LABEL_24:

  objc_msgSend(*(id *)(a1 + 40), "setLoadingIdentityDetails:", 0);
  objc_msgSend(*(id *)(a1 + 56), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 64));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = v18;
    objc_msgSend(*(id *)(a1 + 40), "_showSpinner:inCell:overrideTextColor:", 0, v18, 0);
    v18 = v19;
  }

}

- (BOOL)shouldShowReplaceBiometricSection
{
  void *v3;
  PKIdentityReplaceFingerprintHelper *v4;
  void *v5;
  void *v6;
  PKIdentityReplaceFingerprintHelper *v7;
  void *v8;
  char v9;
  _QWORD v11[5];
  id v12;
  id location;

  -[PKPaymentPassDetailViewController fingeprintHelper](self, "fingeprintHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [PKIdentityReplaceFingerprintHelper alloc];
    -[PKPaymentPassDetailViewController pass](self, "pass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "secureElementPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKIdentityReplaceFingerprintHelper initWithPass:isRemote:](v4, "initWithPass:isRemote:", v6, -[PKPaymentPassDetailViewController detailViewStyle](self, "detailViewStyle") == 2);
    -[PKPaymentPassDetailViewController setFingeprintHelper:](self, "setFingeprintHelper:", v7);

  }
  -[PKPaymentPassDetailViewController fingeprintHelper](self, "fingeprintHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasCachedEligibility"))
  {
    v9 = objc_msgSend(v8, "isEligibile");
  }
  else
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__PKPaymentPassDetailViewController_Identity__shouldShowReplaceBiometricSection__block_invoke;
    v11[3] = &unk_1E3E62FA0;
    objc_copyWeak(&v12, &location);
    v11[4] = self;
    objc_msgSend(v8, "isEligibleWithCompletion:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    v9 = 0;
  }

  return v9;
}

void __80__PKPaymentPassDetailViewController_Identity__shouldShowReplaceBiometricSection__block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __80__PKPaymentPassDetailViewController_Identity__shouldShowReplaceBiometricSection__block_invoke_2;
  v2[3] = &unk_1E3E61B68;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
}

void __80__PKPaymentPassDetailViewController_Identity__shouldShowReplaceBiometricSection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "reloadPassDetailSections:", &unk_1E3FAE6E0);
    WeakRetained = v3;
  }

}

- (unint64_t)numberOfReplaceBiometricRowsInTableView:(id)a3
{
  return 1;
}

- (id)replaceBiometricTableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  PKLocalizedIdentityString(CFSTR("REPLACE_ID_FINGERPRINT_ACTION"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)didSelectReplaceBiometricCellInTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  _QWORD v6[5];

  -[PKPaymentPassDetailViewController fingeprintHelper](self, "fingeprintHelper", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __100__PKPaymentPassDetailViewController_Identity__didSelectReplaceBiometricCellInTableView_atIndexPath___block_invoke;
  v6[3] = &unk_1E3E63BA0;
  v6[4] = self;
  objc_msgSend(v5, "viewControllerWithCompletion:", v6);

}

void __100__PKPaymentPassDetailViewController_Identity__didSelectReplaceBiometricCellInTableView_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    objc_msgSend(v2, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, 0);

  }
}

- (id)footerForReplaceBiometricIdentityInTableView:(id)a3
{
  return (id)PKLocalizedIdentityString(CFSTR("REPLACE_ID_FINGERPRINT_FOOTER"));
}

- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 style:(int64_t)a7 dataProvider:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  PKPaymentPassDetailViewController *v21;

  v14 = (void *)MEMORY[0x1E0D67480];
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v14, "sharedService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PKPaymentPassDetailViewController initWithPass:group:groupsController:webService:peerPaymentWebService:style:passLibraryDataProvider:paymentServiceDataProvider:](self, "initWithPass:group:groupsController:webService:peerPaymentWebService:style:passLibraryDataProvider:paymentServiceDataProvider:", v19, v18, v17, v16, v20, a7, v15, 0);

  return v21;
}

- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 peerPaymentWebService:(id)a7 style:(int64_t)a8 passLibraryDataProvider:(id)a9 paymentServiceDataProvider:(id)a10
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  PKPaymentPassDetailViewController *v26;

  v17 = (void *)MEMORY[0x1E0D668E8];
  v18 = a10;
  v19 = a9;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  objc_msgSend(v17, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PKPaymentPassDetailViewController initWithPass:group:groupsController:webService:peerPaymentWebService:accountService:style:passLibraryDataProvider:paymentServiceDataProvider:rendererState:context:familyCollection:contactAvatarManager:account:](self, "initWithPass:group:groupsController:webService:peerPaymentWebService:accountService:style:passLibraryDataProvider:paymentServiceDataProvider:rendererState:context:familyCollection:contactAvatarManager:account:", v24, v23, v22, v21, v20, v25, a8, v19, v18, 0, 0, 0, 0, 0);

  return v26;
}

- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 peerPaymentWebService:(id)a7 accountService:(id)a8 style:(int64_t)a9 passLibraryDataProvider:(id)a10 paymentServiceDataProvider:(id)a11
{
  return -[PKPaymentPassDetailViewController initWithPass:group:groupsController:webService:peerPaymentWebService:accountService:style:passLibraryDataProvider:paymentServiceDataProvider:rendererState:context:familyCollection:contactAvatarManager:account:](self, "initWithPass:group:groupsController:webService:peerPaymentWebService:accountService:style:passLibraryDataProvider:paymentServiceDataProvider:rendererState:context:familyCollection:contactAvatarManager:account:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, 0, 0, 0, 0);
}

- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 peerPaymentWebService:(id)a7 style:(int64_t)a8 passLibraryDataProvider:(id)a9 paymentServiceDataProvider:(id)a10 rendererState:(id)a11 context:(id)a12
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  PKPaymentPassDetailViewController *v27;

  v17 = (void *)MEMORY[0x1E0D668E8];
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  objc_msgSend(v17, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PKPaymentPassDetailViewController initWithPass:group:groupsController:webService:peerPaymentWebService:accountService:style:passLibraryDataProvider:paymentServiceDataProvider:rendererState:context:familyCollection:contactAvatarManager:account:](self, "initWithPass:group:groupsController:webService:peerPaymentWebService:accountService:style:passLibraryDataProvider:paymentServiceDataProvider:rendererState:context:familyCollection:contactAvatarManager:account:", v25, v24, v23, v22, v21, v26, a8, v20, v19, v18, 0, 0, 0, 0);

  return v27;
}

- (PKPaymentPassDetailViewController)initWithPass:(id)a3 group:(id)a4 groupsController:(id)a5 webService:(id)a6 peerPaymentWebService:(id)a7 accountService:(id)a8 style:(int64_t)a9 passLibraryDataProvider:(id)a10 paymentServiceDataProvider:(id)a11 rendererState:(id)a12 context:(id)a13 familyCollection:(id)a14 contactAvatarManager:(id)a15 account:(id)a16
{
  id v20;
  id v21;
  id *p_webService;
  id *p_paymentServiceDataProvider;
  uint64_t v24;
  PKExpressPassController *expressPassController;
  PKPassHeaderView *v26;
  PKPassHeaderView *passHeaderView;
  PKBusinessChatController *v28;
  PKBusinessChatController *businessChatController;
  void *v30;
  id *p_groupsController;
  PKGroup *v32;
  PKGroupsController *v33;
  PKGroupsController *groupsController;
  PKGroupsController *v35;
  id v36;
  void *v37;
  uint64_t v38;
  PKGroup *group;
  uint64_t v40;
  PKTransactionSourceCollection *transactionSourceCollection;
  uint64_t v42;
  PKTransitBalanceModel *transitBalanceModel;
  PKLinkedApplication *v44;
  PKLinkedApplication *linkedApplication;
  NSMutableDictionary *v46;
  NSMutableDictionary *contextualActionHandlers;
  NSMutableArray *v48;
  NSMutableArray *executionBlocksContentIsLoaded;
  NSNumberFormatter *v50;
  NSNumberFormatter *numberFormatter;
  NSArray *transactions;
  uint64_t v53;
  PKDashboardTransactionFetcher *transactionFetcher;
  int64_t detailViewStyle;
  PKPaymentPassDetailViewController *v56;
  void *v57;
  BOOL v58;
  void *v59;
  void *v60;
  uint64_t v61;
  PKContactFormatValidator *contactFormatValidator;
  id v63;
  void *v64;
  _BOOL4 v65;
  id *p_peerPaymentWebService;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  PKPeerPaymentAccount **p_peerPaymentAccount;
  void *v72;
  char v73;
  void *v74;
  uint64_t v75;
  PKPeerPaymentPreferences *peerPaymentPreferences;
  PKPeerPaymentAccountResolutionController *v77;
  int64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  PKPeerPaymentAccountResolutionController *peerPaymentAccountResolutionController;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  _BOOL4 v90;
  id *p_accountService;
  id v92;
  void *v93;
  _BOOL4 v94;
  void *v95;
  PKPaymentPassDetailViewController *v96;
  id v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  uint64_t v103;
  CNContact *billingContact;
  void *v105;
  void *v106;
  void *v107;
  PKPaymentTransactionCellController *v108;
  PKPaymentTransactionCellController *transactionCellController;
  PKPaymentTransactionDetailsFactory *v110;
  PKPaymentTransactionDetailsFactory *transactionDetailsFactory;
  uint64_t v112;
  uint64_t v113;
  PKPaymentVerificationController *v114;
  id v115;
  void *v116;
  uint64_t v117;
  PKPaymentVerificationController *verificationController;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  PKPaymentPassDetailViewController *v127;
  void *v128;
  dispatch_group_t v129;
  NSArray *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t i;
  void *v134;
  id v135;
  id v136;
  NSObject *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v142;
  id *p_account;
  void *v144;
  id v145;
  void *v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id obj;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  char v161;
  NSArray *v162;
  id *p_pass;
  uint64_t v164;
  uint64_t v166;
  PKPaymentPassDetailViewController *v168;
  PKPaymentPassDetailViewController *val;
  _QWORD v171[4];
  NSObject *v172;
  id v173;
  _QWORD v174[4];
  NSObject *v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _QWORD v188[4];
  id v189;
  id v190;
  _QWORD aBlock[4];
  PKPaymentPassDetailViewController *v192;
  id v193;
  id v194;
  id v195;
  id location;
  _QWORD v197[4];
  PKPaymentPassDetailViewController *v198;
  _QWORD v199[4];
  id v200;
  PKPaymentPassDetailViewController *v201;
  _QWORD v202[4];
  PKPaymentPassDetailViewController *v203;
  objc_super v204;
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  uint64_t v208;

  v208 = *MEMORY[0x1E0C80C00];
  v160 = a3;
  v20 = a4;
  v21 = a5;
  v156 = v20;
  v157 = a5;
  v147 = a6;
  v159 = a7;
  v154 = a8;
  v148 = a10;
  v149 = a11;
  v158 = a12;
  v150 = a13;
  v151 = a14;
  v152 = a15;
  v153 = a16;
  v204.receiver = self;
  v204.super_class = (Class)PKPaymentPassDetailViewController;
  v168 = -[PKDynamicTableViewController init](&v204, sel_init);
  if (!v168)
    goto LABEL_95;
  v168->_expressPassesInformationToken = -1;
  objc_msgSend(v160, "uniqueID");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  p_pass = (id *)&v168->_pass;
  objc_storeStrong((id *)&v168->_pass, a3);
  -[PKPaymentPassDetailViewController _applyStaticPassPropertiesForPass](v168, "_applyStaticPassPropertiesForPass");
  p_account = (id *)&v168->_account;
  objc_storeStrong((id *)&v168->_account, a16);
  v168->_detailViewStyle = a9;
  objc_storeStrong((id *)&v168->_familyCollection, a14);
  objc_storeStrong((id *)&v168->_contactAvatarManager, a15);
  p_webService = (id *)&v168->_webService;
  objc_storeStrong((id *)&v168->_webService, a6);
  objc_storeStrong((id *)&v168->_passLibraryDataProvider, a10);
  p_paymentServiceDataProvider = (id *)&v168->_paymentServiceDataProvider;
  objc_storeStrong((id *)&v168->_paymentServiceDataProvider, a11);
  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66D50]), "initWithPaymentDataProvider:passLibraryDataProvider:isForWatch:", v168->_paymentServiceDataProvider, v168->_passLibraryDataProvider, a9 == 2);
  expressPassController = v168->_expressPassController;
  v168->_expressPassController = (PKExpressPassController *)v24;

  -[PKExpressPassController setPresentingViewController:](v168->_expressPassController, "setPresentingViewController:", v168);
  v26 = -[PKPassHeaderView initWithPass:rendererState:]([PKPassHeaderView alloc], "initWithPass:rendererState:", v168->_pass, v158);
  passHeaderView = v168->_passHeaderView;
  v168->_passHeaderView = v26;

  -[PKPassHeaderView setDelegate:](v168->_passHeaderView, "setDelegate:", v168);
  -[PKPassHeaderView setPassLibraryOverride:](v168->_passHeaderView, "setPassLibraryOverride:", v168->_passLibraryDataProvider);
  -[PKPassHeaderView setSmall:](v168->_passHeaderView, "setSmall:", v168->_detailViewStyle == 0);
  -[PKPaymentPassDetailViewController _buildSections](v168, "_buildSections");
  -[PKPaymentPassDetailViewController _decorateSections](v168, "_decorateSections");
  v28 = objc_alloc_init(PKBusinessChatController);
  businessChatController = v168->_businessChatController;
  v168->_businessChatController = v28;

  objc_msgSend(MEMORY[0x1E0D67768], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v202[0] = MEMORY[0x1E0C809B0];
  v202[1] = 3221225472;
  v202[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke;
  v202[3] = &unk_1E3E79360;
  val = v168;
  v203 = val;
  objc_msgSend(v30, "authorizationStatusWithCompletion:", v202);

  if (v157)
  {
    p_groupsController = (id *)&val->_groupsController;
    objc_storeStrong((id *)&val->_groupsController, v21);
    if (v156)
    {
      v32 = (PKGroup *)v156;
    }
    else
    {
      v36 = *p_groupsController;
      objc_msgSend(*p_pass, "uniqueID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "groupIndexForPassUniqueID:", v37);

      objc_msgSend(*p_groupsController, "groupAtIndex:", v38);
      v32 = (PKGroup *)objc_claimAutoreleasedReturnValue();
    }
    group = val->_group;
    val->_group = v32;

    -[PKGroup addGroupObserver:](val->_group, "addGroupObserver:");
  }
  else
  {
    v33 = (PKGroupsController *)objc_alloc_init(MEMORY[0x1E0D66DB8]);
    groupsController = val->_groupsController;
    val->_groupsController = v33;

    v35 = val->_groupsController;
    v199[0] = MEMORY[0x1E0C809B0];
    v199[1] = 3221225472;
    v199[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_3;
    v199[3] = &unk_1E3E61388;
    v200 = v156;
    v201 = val;
    -[PKGroupsController loadGroupsWithCompletion:](v35, "loadGroupsWithCompletion:", v199);

  }
  v146 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", *p_pass);
  v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67738]), "initWithTransactionSource:", v146);
  transactionSourceCollection = val->_transactionSourceCollection;
  val->_transactionSourceCollection = (PKTransactionSourceCollection *)v40;

  if ((objc_msgSend(*p_pass, "isStoredValuePass") & 1) != 0 || objc_msgSend(*p_pass, "isAccessPass"))
  {
    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", *p_pass);
    transitBalanceModel = val->_transitBalanceModel;
    val->_transitBalanceModel = (PKTransitBalanceModel *)v42;

  }
  objc_storeStrong((id *)&val->_rendererState, a12);
  v44 = -[PKLinkedApplication initWithPass:]([PKLinkedApplication alloc], "initWithPass:", *p_pass);
  linkedApplication = val->_linkedApplication;
  val->_linkedApplication = v44;

  -[PKLinkedApplication addObserver:](val->_linkedApplication, "addObserver:", val);
  -[PKLinkedApplication reloadApplicationStateIfNecessary](val->_linkedApplication, "reloadApplicationStateIfNecessary");
  v46 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  contextualActionHandlers = val->_contextualActionHandlers;
  val->_contextualActionHandlers = v46;

  v48 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  executionBlocksContentIsLoaded = val->_executionBlocksContentIsLoaded;
  val->_executionBlocksContentIsLoaded = v48;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*p_paymentServiceDataProvider, "addDelegate:", val);
  v50 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
  numberFormatter = val->_numberFormatter;
  val->_numberFormatter = v50;

  -[NSNumberFormatter setNumberStyle:](val->_numberFormatter, "setNumberStyle:", 1);
  transactions = val->_transactions;
  val->_transactions = (NSArray *)MEMORY[0x1E0C9AA60];

  v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C98]), "initWithTransactionSourceCollection:paymentDataProvider:", val->_transactionSourceCollection, *p_paymentServiceDataProvider);
  transactionFetcher = val->_transactionFetcher;
  val->_transactionFetcher = (PKDashboardTransactionFetcher *)v53;

  detailViewStyle = v168->_detailViewStyle;
  v56 = val;
  val->_hasTabBar = detailViewStyle != 0;
  if (detailViewStyle)
  {
    objc_msgSend(*p_pass, "associatedAccountServiceAccountIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v57, "length"))
      v58 = v168->_detailViewStyle == 2;
    else
      v58 = 0;
    val->_hasTabBar = !v58;

    v56 = val;
  }
  else
  {
    val->_hasTabBar = 0;
  }
  objc_storeStrong((id *)&v56->_context, a13);
  objc_msgSend(*p_webService, "context");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "configuration");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "contactFormatConfiguration");
  v145 = (id)objc_claimAutoreleasedReturnValue();

  v61 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C50]), "initWithConfiguration:", v145);
  contactFormatValidator = val->_contactFormatValidator;
  val->_contactFormatValidator = (PKContactFormatValidator *)v61;

  if (objc_msgSend(*p_pass, "hasAssociatedPeerPaymentAccount"))
  {
    v63 = v159;
    v64 = v159;
    if (!v159)
    {
      objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
    }
    v65 = v63 == 0;
    p_peerPaymentWebService = (id *)&val->_peerPaymentWebService;
    objc_storeStrong((id *)&val->_peerPaymentWebService, v64);
    if (v65)

    objc_msgSend(*p_peerPaymentWebService, "targetDevice");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "account");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "associatedPassUniqueID");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "isEqualToString:", v142);

    if (v70)
    {
      p_peerPaymentAccount = &val->_peerPaymentAccount;
      objc_storeStrong((id *)&val->_peerPaymentAccount, v68);
      objc_msgSend(*p_peerPaymentWebService, "targetDevice");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_opt_respondsToSelector();

      if ((v73 & 1) != 0)
      {
        objc_msgSend(*p_peerPaymentWebService, "targetDevice");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "preferences");
        v75 = objc_claimAutoreleasedReturnValue();
        peerPaymentPreferences = val->_peerPaymentPreferences;
        val->_peerPaymentPreferences = (PKPeerPaymentPreferences *)v75;

      }
      v77 = [PKPeerPaymentAccountResolutionController alloc];
      v78 = v168->_detailViewStyle;
      v79 = 3;
      if (v78 != 1)
        v79 = 0;
      if (v78 == 2)
        v80 = 4;
      else
        v80 = v79;
      v81 = -[PKPeerPaymentAccountResolutionController initWithAccount:webService:context:delegate:passLibraryDataProvider:](v77, "initWithAccount:webService:context:delegate:passLibraryDataProvider:", *p_peerPaymentAccount, *p_peerPaymentWebService, v80, val, v168->_passLibraryDataProvider);
      peerPaymentAccountResolutionController = val->_peerPaymentAccountResolutionController;
      val->_peerPaymentAccountResolutionController = (PKPeerPaymentAccountResolutionController *)v81;

      -[PKPeerPaymentAccountResolutionController setSetupDelegate:](val->_peerPaymentAccountResolutionController, "setSetupDelegate:", val);
      val->_peerPaymentAccountResolution = -[PKPeerPaymentAccountResolutionController currentPeerPaymentAccountResolution](val->_peerPaymentAccountResolutionController, "currentPeerPaymentAccountResolution");
      -[PKPassHeaderView setPeerPaymentAccount:](v168->_passHeaderView, "setPeerPaymentAccount:", *p_peerPaymentAccount);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_peerPaymentWebService, "targetDevice");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "addObserver:selector:name:object:", val, sel__handlePeerPaymentAccountDidChangeNotification_, *MEMORY[0x1E0D6B2B8], v84);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_peerPaymentWebService, "targetDevice");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addObserver:selector:name:object:", val, sel__handlePeerPaymentPreferencestDidChangeNotification_, *MEMORY[0x1E0D6B2C0], v86);

    v197[0] = MEMORY[0x1E0C809B0];
    v197[1] = 3221225472;
    v197[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_5;
    v197[3] = &unk_1E3E612E8;
    v198 = val;
    -[PKPaymentPassDetailViewController _loadFamilyCollectionIfNecessaryWithCompletion:](v198, "_loadFamilyCollectionIfNecessaryWithCompletion:", v197);

    goto LABEL_59;
  }
  objc_msgSend(*p_pass, "associatedAccountServiceAccountIdentifier");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v87)
  {
    objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "defaultBillingAddressForPaymentPass:", *p_pass);
    v103 = objc_claimAutoreleasedReturnValue();
    billingContact = val->_billingContact;
    val->_billingContact = (CNContact *)v103;

    val->_loadingBillingContact = 0;
    if (!-[PKPaymentPassDetailViewController _isBankConnectSupportedForPaymentPass:](val, "_isBankConnectSupportedForPaymentPass:", v160))-[PKPaymentPassDetailViewController contentIsLoaded](val, "contentIsLoaded");
    goto LABEL_59;
  }
  v88 = v154;
  v89 = v154;
  if (!v154)
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0;
  }
  v90 = v88 == 0;
  p_accountService = (id *)&val->_accountService;
  objc_storeStrong((id *)&val->_accountService, v89);
  if (v90)

  v92 = v159;
  v93 = v159;
  if (!v159)
  {
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0;
  }
  v94 = v92 == 0;
  objc_storeStrong((id *)&val->_peerPaymentWebService, v93);
  if (v94)

  objc_msgSend(*p_accountService, "registerObserver:", val);
  objc_msgSend(*p_pass, "associatedAccountServiceAccountIdentifier");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, val);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_6;
  aBlock[3] = &unk_1E3E793D8;
  objc_copyWeak(&v195, &location);
  v96 = val;
  v192 = v96;
  v193 = v154;
  v97 = v95;
  v194 = v97;
  v98 = _Block_copy(aBlock);
  if (!*p_account)
    goto LABEL_54;
  objc_msgSend(*p_account, "accountIdentifier");
  v99 = (id)objc_claimAutoreleasedReturnValue();
  v100 = v97;
  v101 = v100;
  if (v99 == v100)
  {

  }
  else
  {
    if (!v100 || !v99)
    {

      goto LABEL_54;
    }
    v161 = objc_msgSend(v99, "isEqualToString:", v100);

    if ((v161 & 1) == 0)
    {
LABEL_54:
      v188[0] = MEMORY[0x1E0C809B0];
      v188[1] = 3221225472;
      v188[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_15;
      v188[3] = &unk_1E3E6C248;
      objc_copyWeak(&v190, &location);
      v189 = v98;
      v105 = _Block_copy(v188);
      if ((objc_msgSend(*p_pass, "isAppleBalancePass") & 1) != 0 || PKPassbookIsCurrentlyDeletedByUser())
      {
        objc_msgSend(*p_webService, "targetDevice");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "accountWithIdentifier:completion:", v97, v105);

      }
      else
      {
        objc_msgSend(*p_accountService, "accountWithIdentifier:completion:", v97, v105);
      }

      objc_destroyWeak(&v190);
      goto LABEL_58;
    }
  }
  (*((void (**)(void *, id, _QWORD))v98 + 2))(v98, *p_account, 0);
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "addObserver:selector:name:object:", v96, sel__handleAccountServiceAccountDidChangeNotification_, *MEMORY[0x1E0D68290], 0);

  objc_destroyWeak(&v195);
  objc_destroyWeak(&location);

LABEL_59:
  val->_deepLinkingEnabled = +[PKPaymentNotificationAppURLHelper applicationExistsToHandleNotificationsForPaymentPass:](PKPaymentNotificationAppURLHelper, "applicationExistsToHandleNotificationsForPaymentPass:", v160);
  -[PKPaymentPassDetailViewController contactResolver](val, "contactResolver");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v108 = -[PKPaymentTransactionCellController initWithContactResolver:]([PKPaymentTransactionCellController alloc], "initWithContactResolver:", obj);
  transactionCellController = val->_transactionCellController;
  val->_transactionCellController = v108;

  v110 = -[PKPaymentTransactionDetailsFactory initWithContactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:]([PKPaymentTransactionDetailsFactory alloc], "initWithContactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:", obj, val->_peerPaymentWebService, *p_paymentServiceDataProvider, v168->_detailViewStyle);
  transactionDetailsFactory = val->_transactionDetailsFactory;
  val->_transactionDetailsFactory = v110;

  v112 = 3;
  if (a9 != 1)
    v112 = 0;
  if (a9 == 2)
    v113 = 4;
  else
    v113 = v112;
  v114 = [PKPaymentVerificationController alloc];
  v115 = *p_pass;
  -[PKPassHeaderView passView](v168->_passHeaderView, "passView");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = -[PKPaymentVerificationController initWithPaymentPass:passView:webService:context:delegate:setupDelegate:verificationContext:](v114, "initWithPaymentPass:passView:webService:context:delegate:setupDelegate:verificationContext:", v115, v116, *p_webService, v113, val, 0, 1);
  verificationController = val->_verificationController;
  val->_verificationController = (PKPaymentVerificationController *)v117;

  v144 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", *p_webService);
  -[PKPaymentVerificationController setProvisioningController:](val->_verificationController, "setProvisioningController:", v144);
  if (v168->_detailViewStyle)
    v119 = 0;
  else
    v119 = PKRunningInViewService();
  -[PKPaymentPassDetailViewController setShowDoneButton:](val, "setShowDoneButton:", v119);
  v186 = 0u;
  v187 = 0u;
  v184 = 0u;
  v185 = 0u;
  v162 = val->_devicePaymentApplications;
  v166 = -[NSArray countByEnumeratingWithState:objects:count:](v162, "countByEnumeratingWithState:objects:count:", &v184, v207, 16);
  if (v166)
  {
    v164 = *(_QWORD *)v185;
LABEL_69:
    v120 = 0;
    while (1)
    {
      if (*(_QWORD *)v185 != v164)
        objc_enumerationMutation(v162);
      v121 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * v120);
      v180 = 0u;
      v181 = 0u;
      v182 = 0u;
      v183 = 0u;
      objc_msgSend(v121, "automaticSelectionCriteria");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v180, v206, 16);
      if (v123)
      {
        v124 = *(_QWORD *)v181;
LABEL_74:
        v125 = 0;
        while (1)
        {
          if (*(_QWORD *)v181 != v124)
            objc_enumerationMutation(v122);
          objc_msgSend(*(id *)(*((_QWORD *)&v180 + 1) + 8 * v125), "type");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          val->_isAppleAccess = PKEqualObjects();

          if (val->_isAppleAccess)
            break;
          if (v123 == ++v125)
          {
            v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v180, v206, 16);
            if (v123)
              goto LABEL_74;
            break;
          }
        }
      }

      if (val->_isAppleAccess)
        break;
      if (++v120 == v166)
      {
        v166 = -[NSArray countByEnumeratingWithState:objects:count:](v162, "countByEnumeratingWithState:objects:count:", &v184, v207, 16);
        if (v166)
          goto LABEL_69;
        break;
      }
    }
  }

  v127 = val;
  val->_isCredentialedPass = objc_msgSend(*p_pass, "areCredentialsStoredInKML");
  val->_radioTechnologyType = 0;
  if (val->_isCredentialedPass)
  {
    objc_msgSend(*p_pass, "secureElementPass");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    val->_radioTechnologyType = objc_msgSend(v128, "supportedRadioTechnologies");

    v127 = val;
  }
  v129 = dispatch_group_create();
  objc_storeStrong((id *)&v127->_initialLoadGroup, v129);
  v179 = 0u;
  v177 = 0u;
  v178 = 0u;
  v176 = 0u;
  v130 = val->_sectionControllers;
  v131 = -[NSArray countByEnumeratingWithState:objects:count:](v130, "countByEnumeratingWithState:objects:count:", &v176, v205, 16);
  if (v131)
  {
    v132 = *(_QWORD *)v177;
    do
    {
      for (i = 0; i != v131; ++i)
      {
        if (*(_QWORD *)v177 != v132)
          objc_enumerationMutation(v130);
        v134 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v135 = v134;
          dispatch_group_enter(v129);
          v174[0] = MEMORY[0x1E0C809B0];
          v174[1] = 3221225472;
          v174[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_16;
          v174[3] = &unk_1E3E612E8;
          v175 = v129;
          objc_msgSend(v135, "preflight:", v174);

        }
      }
      v131 = -[NSArray countByEnumeratingWithState:objects:count:](v130, "countByEnumeratingWithState:objects:count:", &v176, v205, 16);
    }
    while (v131);
  }

  objc_initWeak(&location, val);
  dispatch_group_enter(v129);
  -[PKPaymentPassDetailViewController _updateHeaderActionView](val, "_updateHeaderActionView");
  -[PKPaymentPassDetailViewController _updateExpressPassInformation](val, "_updateExpressPassInformation");
  v136 = *p_pass;
  v171[0] = MEMORY[0x1E0C809B0];
  v171[1] = 3221225472;
  v171[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_17;
  v171[3] = &unk_1E3E612C0;
  v137 = v129;
  v172 = v137;
  objc_copyWeak(&v173, &location);
  -[PKPaymentPassDetailViewController _updatePassPropertiesForPass:completion:](val, "_updatePassPropertiesForPass:completion:", v136, v171);
  PKObservePassSettingsChanged();
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "addObserver:selector:name:object:", val, sel__passSettingsChanged_, *MEMORY[0x1E0D6A7C0], 0);
  -[PKPaymentPassDetailViewController navigationItem](val, "navigationItem");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "setBackButtonDisplayMode:", 2);
  objc_msgSend(*p_pass, "localizedDescription");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "setBackButtonTitle:", v140);

  objc_msgSend(v139, "pkui_setupScrollEdgeChromelessAppearance");
  objc_msgSend(v139, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

  objc_destroyWeak(&v173);
  objc_destroyWeak(&location);

LABEL_95:
  return v168;
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_2;
  v3[3] = &unk_1E3E62010;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1840) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "reloadSection:", 37);
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_3(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_4;
  v2[3] = &unk_1E3E61388;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v4 = v2;
    v5 = *(void **)(v3 + 1072);
    *(_QWORD *)(v3 + 1072) = v4;
  }
  else
  {
    v6 = *(void **)(v3 + 2136);
    objc_msgSend(*(id *)(v3 + 1064), "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "groupIndexForPassUniqueID:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 2136), "groupAtIndex:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v10 + 1072);
    *(_QWORD *)(v10 + 1072) = v9;
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1072), "addGroupObserver:");
  return objc_msgSend(*(id *)(a1 + 40), "reloadSection:", 41);
}

uint64_t __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_5(uint64_t a1)
{
  PKPeerPaymentAssociatedAccountsController *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v2 = [PKPeerPaymentAssociatedAccountsController alloc];
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[282];
  v5 = v3[270];
  v6 = v3[280];
  v7 = v3[268];
  v8 = 3;
  if (v7 != 1)
    v8 = 0;
  if (v7 == 2)
    v9 = 4;
  else
    v9 = v8;
  v10 = -[PKPeerPaymentAssociatedAccountsController initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:](v2, "initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:", v4, v5, v6, v9);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 1824);
  *(_QWORD *)(v11 + 1824) = v10;

  objc_msgSend(*(id *)(a1 + 32), "_updateFamilyRows");
  return objc_msgSend(*(id *)(a1 + 32), "contentIsLoaded");
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_6(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_7;
  block[3] = &unk_1E3E623E8;
  objc_copyWeak(&v10, a1 + 7);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_7(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  PKAppleBalanceAddMoneyUIManager *v5;
  id v6;
  void *v7;
  id v8;
  NSString *v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  _BOOL4 v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id *v46;
  id v47;
  id v48;

  v2 = (id *)(a1 + 64);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (!WeakRetained || !*(_QWORD *)(a1 + 32))
    goto LABEL_33;
  if (objc_msgSend(WeakRetained, "_accountFeature") == 4)
  {
    objc_msgSend(v4, "_updateBalanceIfNecessary");
    v5 = -[PKAppleBalanceAddMoneyUIManager initWithAccount:]([PKAppleBalanceAddMoneyUIManager alloc], "initWithAccount:", *(_QWORD *)(a1 + 32));
    v6 = v4[251];
    v4[251] = v5;

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("PASS_DETAILS_BALANCE_FOOTER"));
    if ((objc_msgSend(v4[277], "supportsInStorePayment") & 1) == 0)
      objc_msgSend(v7, "appendString:", CFSTR("_NO_IN_STORE_PAYMENT"));
    v8 = v4[235];
    v9 = (NSString *)objc_msgSend(v7, "copy");
    PKLocalizedLynxString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFooterText:", v10);

  }
  else if (objc_msgSend(v4, "_accountFeature") == 3)
  {
    objc_msgSend(v4, "fetchFinancingPlansIfNecessary");
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1800), "limitServerLoad"))
    v11 = 86400.0;
  else
    v11 = 300.0;
  if (PKPassbookIsCurrentlyDeletedByUser())
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "creditDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "lastUpdated");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v15);
      v17 = v16 > v11;

      v12 = v17;
    }
    else
    {
      v12 = 0;
    }

  }
  v18 = objc_msgSend(v4, "_accountFeature");
  v19 = MEMORY[0x1E0C809B0];
  if (v18 == 2)
  {
    v20 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
    v21 = v12;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v19;
    v45[0] = v19;
    v45[1] = 3221225472;
    v45[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_8;
    v45[3] = &unk_1E3E79388;
    v46 = v4;
    v47 = *(id *)(a1 + 40);
    v48 = *(id *)(a1 + 32);
    objc_msgSend(v20, "physicalCardsForAccountWithIdentifier:completion:", v22, v45);

    v12 = v21;
  }
  else
  {
    v23 = MEMORY[0x1E0C809B0];
    if (objc_msgSend(v4, "_accountFeature") == 3)
    {
      PKUIImageNamed(CFSTR("PayLater_MasterCard_Logo"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v38 = v12;
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", 0);
        v26 = *MEMORY[0x1E0C9D538];
        v27 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        objc_msgSend(v24, "size");
        v29 = v28;
        PKFloatRoundToPixel();
        objc_msgSend(v25, "setFrame:", v26, v27, 0.0, v29 + v30);
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v24);
        objc_msgSend(v25, "contentView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addSubview:", v31);

        objc_storeStrong(v4 + 187, v25);
        objc_storeStrong(v4 + 188, v31);
        if (objc_msgSend(v4, "isViewLoaded"))
        {
          objc_msgSend(v4, "tableView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setTableFooterView:", v4[187]);

        }
        v12 = v38;
      }
      goto LABEL_26;
    }
  }
  v24 = 0;
LABEL_26:
  *((_BYTE *)v4 + 1768) = 1;
  objc_msgSend(v4, "_reloadView");
  if (v12)
  {
    v34 = v4[272];
    v35 = *(_QWORD *)(a1 + 56);
    v43[0] = v23;
    v43[1] = 3221225472;
    v43[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_10;
    v43[3] = &unk_1E3E67670;
    objc_copyWeak(&v44, v2);
    objc_msgSend(v34, "updateAccountWithIdentifier:extended:completion:", v35, 0, v43);
    objc_destroyWeak(&v44);
  }
  if (objc_msgSend(v4, "_accountFeature") == 2)
  {
    objc_msgSend(v4, "_updateCashbackPeerPaymentResolutionSection");
    v41[0] = v23;
    v41[1] = 3221225472;
    v41[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_12;
    v41[3] = &unk_1E3E612E8;
    v42 = v4;
    objc_msgSend(v42, "_loadAdditionalAccountDataWithCompletion:", v41);

  }
  else if (objc_msgSend(v4, "_accountFeature") == 3)
  {
    objc_msgSend(v4, "contentIsLoaded");
  }
  v36 = v4[272];
  v37 = *(_QWORD *)(a1 + 56);
  v39[0] = v23;
  v39[1] = 3221225472;
  v39[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_13;
  v39[3] = &unk_1E3E793B0;
  objc_copyWeak(&v40, v2);
  objc_msgSend(v36, "userInfoForAccountIdentifier:forceFetch:completion:", v37, 0, v39);
  objc_msgSend(v4, "_updateAmpEligibility");
  objc_msgSend(v4[242], "setFeatureIdentifier:", objc_msgSend(*(id *)(a1 + 32), "feature"));
  objc_destroyWeak(&v40);

LABEL_33:
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_8(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_9;
  v5[3] = &unk_1E3E62460;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_9(uint64_t a1)
{
  PKPhysicalCardController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  PKPhysicalCardActionController *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = [PKPhysicalCardController alloc];
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPhysicalCardController initWithAccountService:paymentPass:account:accountUser:physicalCards:](v2, "initWithAccountService:paymentPass:account:accountUser:physicalCards:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1064), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1624);
  *(_QWORD *)(v5 + 1624) = v4;

  v7 = [PKPhysicalCardActionController alloc];
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPhysicalCardActionController initWithAccountService:account:accountUser:delegate:](v7, "initWithAccountService:account:accountUser:delegate:", v8, *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 1632);
  *(_QWORD *)(v10 + 1632) = v9;

  return objc_msgSend(*(id *)(a1 + 32), "reloadSection:", 21);
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_11;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_11(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 277, *(id *)(a1 + 32));
    objc_msgSend(v3, "_reloadView");
    WeakRetained = v3;
  }

}

uint64_t __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contentIsLoaded");
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_14;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_14(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "creditPrimaryUser");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)*((_QWORD *)WeakRetained + 220);
    *((_QWORD *)WeakRetained + 220) = v2;

    *((_BYTE *)WeakRetained + 1768) = 0;
    objc_msgSend(*((id *)WeakRetained + 219), "setShowSpinner:", 0);
    objc_msgSend(WeakRetained, "reloadSection:", 42);
  }

}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id *WeakRetained;
  id v8;

  v8 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (v8 && WeakRetained)
  {
    objc_storeStrong(WeakRetained + 277, a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_16(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __246__PKPaymentPassDetailViewController_initWithPass_group_groupsController_webService_peerPaymentWebService_accountService_style_passLibraryDataProvider_paymentServiceDataProvider_rendererState_context_familyCollection_contactAvatarManager_account___block_invoke_17(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[216];
    WeakRetained[216] = 0;
    v4 = WeakRetained;

    WeakRetained = v4;
  }

}

- (BOOL)_shouldShowBankConnect
{
  int v3;

  v3 = PKBankConnectEnabled();
  if (v3)
    LOBYTE(v3) = self->_detailViewStyle <= 1uLL
              && -[PKPaymentPass activationState](self->_pass, "activationState") == PKPaymentPassActivationStateActivated;
  return v3;
}

- (BOOL)_isBankConnectSupportedForPaymentPass:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[PKPaymentPassDetailViewController _shouldShowBankConnect](self, "_shouldShowBankConnect"))
    v5 = +[PKPassDetailBankConnectSectionController validForPaymentPass:](_TtC9PassKitUI40PKPassDetailBankConnectSectionController, "validForPaymentPass:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_isBankConnectLinked
{
  void *v3;
  BOOL v4;

  if (!-[PKPaymentPassDetailViewController _shouldShowBankConnect](self, "_shouldShowBankConnect"))
    return 0;
  -[PKPaymentPassDetailViewController bankConnectAccount](self, "bankConnectAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_buildSections
{
  void *v3;
  PKPaymentPassDetailWrapperSectionController *v4;
  PKPaymentPassDetailWrapperSectionController *paymentPassDetailSectionController;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  PKConfigurablePassDetailSectionsController *v10;
  PKConfigurablePassDetailSectionsController *configurableSectionController;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  BOOL v19;
  id v20;
  PKPaymentPassDetailBalanceSectionController *v21;
  PKPaymentPassDetailBalanceSectionController *balanceSectionController;
  void *v23;
  PKPaymentPassDetailAutoReloadActionSectionController *v24;
  PKPaymentPassDetailAutoReloadActionSectionController *autoReloadActionSectionController;
  void *v26;
  PKPaymentPassDetailPassActionSectionController *v27;
  PKPaymentPassDetailPassActionSectionController *passActionSectionController;
  void *v29;
  id v30;
  PKPaymentPass *pass;
  void *v32;
  PKPaymentWebService *webService;
  id v34;
  PKPaymentDataProvider *paymentServiceDataProvider;
  uint64_t v36;
  id v37;
  PKPaymentDataProvider *v38;
  void *v39;
  PKPassDetailSharesSectionController *v40;
  PKPassDetailSharesSectionController *sharesSectionController;
  void *v42;
  PKPassDetailScheduledPaymentsSectionController *v43;
  PKAccount *account;
  PKPaymentPass *v45;
  void *v46;
  PKPassDetailScheduledPaymentsSectionController *v47;
  PKPassDetailScheduledPaymentsSectionController *scheduledPaymentsSectionController;
  void *v49;
  _TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *v50;
  PKPaymentPass *v51;
  _TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *v52;
  id v53;
  _TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *accountCredentialsSectionController;
  NSObject *v55;
  _TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController *v56;
  void *v57;
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v58;
  PKPaymentPass *v59;
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *v60;
  id v61;
  _TtC9PassKitUI40PKPassDetailBankConnectSectionController *bankConnectSectionController;
  NSObject *v63;
  PKPeerPaymentAutoReloadSectionController *v64;
  int64_t detailViewStyle;
  uint64_t v66;
  uint64_t v67;
  PKPeerPaymentAutoReloadSectionController *v68;
  PKPeerPaymentAutoReloadSectionController *peerPaymentAutoReloadSectionController;
  void *v70;
  PKPeerPaymentRecurringPaymentPassDetailsSectionController *v71;
  int64_t v72;
  uint64_t v73;
  uint64_t v74;
  PKPeerPaymentRecurringPaymentPassDetailsSectionController *v75;
  PKPeerPaymentRecurringPaymentPassDetailsSectionController *peerPaymentRecurringPaymentSectionController;
  void *v77;
  PKPassDetailsPrecursorPassUpgradeSectionController *v78;
  PKPassDetailsPrecursorPassUpgradeSectionController *precursorSectionController;
  void *v80;
  PKPassDetailsIdentityBioBindingSectionController *v81;
  PKPassDetailsIdentityBioBindingSectionController *bioBindingSectionController;
  void *v83;
  PKPeerPaymentIdentityManagementSectionController *v84;
  PKPeerPaymentIdentityManagementSectionController *peerPaymentIdentityManagementSectionController;
  void *v86;
  PKAppleCardFeaturesAndBenefitsSectionController *v87;
  PKAppleCardFeaturesAndBenefitsSectionController *broadwayFeaturesAndBenefitsSectionController;
  PKAppleCardFeaturesAndBenefitsSectionController *v89;
  void *v90;
  NSArray *v91;
  NSArray *sectionControllers;
  NSArray *v93;
  NSArray *orderOfSectionIdentifiers;
  void *v95;
  void *v96;
  void *v97;
  void (**v98)(void *, void *, const __CFString *);
  id v99;
  _QWORD v100[4];
  id v101;
  id v102;
  _QWORD v103[5];
  id v104;
  id v105;
  id location;
  _QWORD v107[5];
  id v108;
  uint64_t *v109;
  _QWORD v110[4];
  id v111;
  id v112;
  uint64_t *v113;
  _QWORD v114[5];
  _QWORD aBlock[5];
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  id v121;
  uint8_t buf[4];
  id v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v99 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v116 = 0;
  v117 = &v116;
  v118 = 0x3032000000;
  v119 = __Block_byref_object_copy__64;
  v120 = __Block_byref_object_dispose__64;
  v121 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPaymentPassDetailViewController__buildSections__block_invoke;
  aBlock[3] = &unk_1E3E79400;
  aBlock[4] = &v116;
  v3 = _Block_copy(aBlock);
  v114[0] = MEMORY[0x1E0C809B0];
  v114[1] = 3221225472;
  v114[2] = __51__PKPaymentPassDetailViewController__buildSections__block_invoke_2;
  v114[3] = &unk_1E3E79428;
  v114[4] = &v116;
  v98 = (void (**)(void *, void *, const __CFString *))_Block_copy(v114);
  v4 = -[PKPaymentPassDetailWrapperSectionController initWithViewController:]([PKPaymentPassDetailWrapperSectionController alloc], "initWithViewController:", self);
  paymentPassDetailSectionController = self->_paymentPassDetailSectionController;
  self->_paymentPassDetailSectionController = v4;

  -[PKPaymentPassDetailWrapperSectionController sectionIdentifiers](self->_paymentPassDetailSectionController, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mutableCopy");
  v8 = (void *)v117[5];
  v117[5] = v7;

  objc_msgSend(v99, "addObject:", self->_paymentPassDetailSectionController);
  -[PKPaymentPassDetailViewController _configurableSections](self, "_configurableSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = (void *)objc_msgSend(v9, "pk_createSetByApplyingBlock:", &__block_literal_global_227);
  v10 = -[PKConfigurablePassDetailSectionsController initWithPaymentPass:clientReservedIdentifiers:]([PKConfigurablePassDetailSectionsController alloc], "initWithPaymentPass:clientReservedIdentifiers:", self->_pass, v97);
  v95 = v9;
  configurableSectionController = self->_configurableSectionController;
  self->_configurableSectionController = v10;

  -[PKConfigurablePassDetailSectionsController setDelegate:](self->_configurableSectionController, "setDelegate:", self);
  -[PKConfigurablePassDetailSectionsController setUseBridgeStyle:](self->_configurableSectionController, "setUseBridgeStyle:", self->_detailViewStyle == 2);
  objc_msgSend(v99, "addObject:", self->_configurableSectionController);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKConfigurablePassDetailSectionsController sectionIdentifiers](self->_configurableSectionController, "sectionIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v13);

  v14 = (void *)objc_msgSend(v97, "pk_arrayCopy");
  objc_msgSend(v12, "addObjectsFromArray:", v14);

  -[PKPaymentPass passDetailSections](self->_pass, "passDetailSections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "count");
  do
  {
    if (!v16)
      break;
    v110[0] = MEMORY[0x1E0C809B0];
    v110[1] = 3221225472;
    v110[2] = __51__PKPaymentPassDetailViewController__buildSections__block_invoke_4;
    v110[3] = &unk_1E3E79490;
    v17 = v12;
    v111 = v17;
    v113 = &v116;
    v112 = v3;
    objc_msgSend(v15, "enumerateObjectsWithOptions:usingBlock:", 2, v110, v95);
    v18 = objc_msgSend(v17, "count");
    v19 = v16 == v18;

    v16 = v18;
  }
  while (!v19);
  v107[0] = MEMORY[0x1E0C809B0];
  v107[1] = 3221225472;
  v107[2] = __51__PKPaymentPassDetailViewController__buildSections__block_invoke_5;
  v107[3] = &unk_1E3E794B8;
  v107[4] = self;
  v109 = &v116;
  v20 = v3;
  v108 = v20;
  objc_msgSend(v12, "enumerateObjectsWithOptions:usingBlock:", 2, v107);

  if (+[PKPaymentPassDetailBalanceSectionController validForPaymentPass:](PKPaymentPassDetailBalanceSectionController, "validForPaymentPass:", self->_pass))
  {
    v21 = -[PKPaymentPassDetailBalanceSectionController initWithDelegate:]([PKPaymentPassDetailBalanceSectionController alloc], "initWithDelegate:", self);
    balanceSectionController = self->_balanceSectionController;
    self->_balanceSectionController = v21;

    objc_msgSend(v99, "addObject:", self->_balanceSectionController);
    -[PKPaymentPassDetailBalanceSectionController allSectionIdentifiers](self->_balanceSectionController, "allSectionIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2](v98, v23, CFSTR("LinkedApplication"));

  }
  if (+[PKPaymentPassDetailAutoReloadActionSectionController validForPaymentPass:](PKPaymentPassDetailAutoReloadActionSectionController, "validForPaymentPass:", self->_pass, v95))
  {
    v24 = -[PKPaymentPassDetailAutoReloadActionSectionController initWithPass:paymentDataProvider:viewStyle:delegate:]([PKPaymentPassDetailAutoReloadActionSectionController alloc], "initWithPass:paymentDataProvider:viewStyle:delegate:", self->_pass, self->_paymentServiceDataProvider, self->_detailViewStyle, self);
    autoReloadActionSectionController = self->_autoReloadActionSectionController;
    self->_autoReloadActionSectionController = v24;

    objc_msgSend(v99, "addObject:", self->_autoReloadActionSectionController);
    -[PKPaymentPassDetailAutoReloadActionSectionController setSetupDelegate:](self->_autoReloadActionSectionController, "setSetupDelegate:", self);
    -[PKPaymentPassDetailAutoReloadActionSectionController allSectionIdentifiers](self->_autoReloadActionSectionController, "allSectionIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2](v98, v26, CFSTR("BalancesAndCommutePlans"));

  }
  if (+[PKPaymentPassDetailPassActionSectionController validForPaymentPass:](PKPaymentPassDetailPassActionSectionController, "validForPaymentPass:", self->_pass))
  {
    v27 = -[PKPaymentPassDetailPassActionSectionController initWithPass:viewStyle:paymentDataProvider:webService:transitBalanceModel:delegate:]([PKPaymentPassDetailPassActionSectionController alloc], "initWithPass:viewStyle:paymentDataProvider:webService:transitBalanceModel:delegate:", self->_pass, self->_detailViewStyle, self->_paymentServiceDataProvider, self->_webService, self->_transitBalanceModel, self);
    passActionSectionController = self->_passActionSectionController;
    self->_passActionSectionController = v27;

    objc_msgSend(v99, "addObject:", self->_passActionSectionController);
    -[PKPaymentPassDetailPassActionSectionController allSectionIdentifiers](self->_passActionSectionController, "allSectionIdentifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2](v98, v29, CFSTR("BalancesAndCommutePlans"));

  }
  if (+[PKPassDetailSharesSectionController validForPaymentPass:](PKPassDetailSharesSectionController, "validForPaymentPass:", self->_pass))
  {
    v30 = objc_alloc(MEMORY[0x1E0D67688]);
    pass = self->_pass;
    -[PKPaymentPassDetailViewController contactResolver](self, "contactResolver");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    webService = self->_webService;
    v34 = v20;
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    v36 = MEMORY[0x1E0C80D38];
    v37 = MEMORY[0x1E0C80D38];
    v38 = paymentServiceDataProvider;
    v20 = v34;
    v39 = (void *)objc_msgSend(v30, "initWithPass:contactResolver:webService:paymentServiceProvider:queue:", pass, v32, webService, v38, v36);

    v40 = -[PKPassDetailSharesSectionController initWithSharesController:delegate:]([PKPassDetailSharesSectionController alloc], "initWithSharesController:delegate:", v39, self);
    sharesSectionController = self->_sharesSectionController;
    self->_sharesSectionController = v40;

    objc_msgSend(v99, "addObject:", self->_sharesSectionController);
    -[PKPassDetailSharesSectionController allSectionIdentifiers](self->_sharesSectionController, "allSectionIdentifiers");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2](v98, v42, CFSTR("TransactionsByYear"));

  }
  if (+[PKPassDetailScheduledPaymentsSectionController validForPaymentPass:](PKPassDetailScheduledPaymentsSectionController, "validForPaymentPass:", self->_pass))
  {
    v43 = [PKPassDetailScheduledPaymentsSectionController alloc];
    account = self->_account;
    v45 = self->_pass;
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[PKPassDetailScheduledPaymentsSectionController initWithAccount:pass:accountService:delegate:](v43, "initWithAccount:pass:accountService:delegate:", account, v45, v46, self);
    scheduledPaymentsSectionController = self->_scheduledPaymentsSectionController;
    self->_scheduledPaymentsSectionController = v47;

    objc_msgSend(v99, "addObject:", self->_scheduledPaymentsSectionController);
    -[PKPassDetailScheduledPaymentsSectionController allSectionIdentifiers](self->_scheduledPaymentsSectionController, "allSectionIdentifiers");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2](v98, v49, CFSTR("AccountUsers"));

  }
  if (-[PKPaymentPassDetailViewController _shouldShowBankConnect](self, "_shouldShowBankConnect")
    && +[PKPassDetailAccountCredentialsSectionController validForPaymentPass:](_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController, "validForPaymentPass:", self->_pass))
  {
    objc_initWeak(&location, self);
    v50 = [_TtC9PassKitUI47PKPassDetailAccountCredentialsSectionController alloc];
    v51 = self->_pass;
    v105 = 0;
    v52 = -[PKPassDetailAccountCredentialsSectionController initWithPass:delegate:throwsError:](v50, "initWithPass:delegate:throwsError:", v51, self, &v105);
    v53 = v105;
    accountCredentialsSectionController = self->_accountCredentialsSectionController;
    self->_accountCredentialsSectionController = v52;

    if (v53)
    {
      PKLogFacilityTypeGetObject();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v123 = v53;
        _os_log_impl(&dword_19D178000, v55, OS_LOG_TYPE_DEFAULT, "Failed to make PKPassDetailAccountCredentialsSectionController: %@.", buf, 0xCu);
      }

    }
    else
    {
      v56 = self->_accountCredentialsSectionController;
      v103[0] = MEMORY[0x1E0C809B0];
      v103[1] = 3221225472;
      v103[2] = __51__PKPaymentPassDetailViewController__buildSections__block_invoke_6;
      v103[3] = &unk_1E3E61B68;
      objc_copyWeak(&v104, &location);
      v103[4] = self;
      -[PKPassDetailAccountCredentialsSectionController fetchPaymentInformationWithCompletion:](v56, "fetchPaymentInformationWithCompletion:", v103);
      objc_msgSend(v99, "addObject:", self->_accountCredentialsSectionController);
      -[PKPassDetailAccountCredentialsSectionController allSectionIdentifiers](self->_accountCredentialsSectionController, "allSectionIdentifiers");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v98[2](v98, v57, CFSTR("LinkedApplication"));

      objc_destroyWeak(&v104);
    }

    objc_destroyWeak(&location);
  }
  if (-[PKPaymentPassDetailViewController _isBankConnectSupportedForPaymentPass:](self, "_isBankConnectSupportedForPaymentPass:", self->_pass))
  {
    v58 = [_TtC9PassKitUI40PKPassDetailBankConnectSectionController alloc];
    v59 = self->_pass;
    v102 = 0;
    v60 = -[PKPassDetailBankConnectSectionController initWithPass:delegate:throwsError:](v58, "initWithPass:delegate:throwsError:", v59, self, &v102);
    v61 = v102;
    bankConnectSectionController = self->_bankConnectSectionController;
    self->_bankConnectSectionController = v60;

    if (v61)
    {
      PKLogFacilityTypeGetObject();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v123 = v61;
        _os_log_impl(&dword_19D178000, v63, OS_LOG_TYPE_DEFAULT, "Failed to make PKPassDetailBankConnectSectionController: %@.", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v99, "addObject:", self->_bankConnectSectionController);
      -[PKPassDetailBankConnectSectionController allSectionIdentifiers](self->_bankConnectSectionController, "allSectionIdentifiers");
      v63 = objc_claimAutoreleasedReturnValue();
      v98[2](v98, v63, CFSTR("LinkedApplication"));
    }

  }
  if (+[PKPeerPaymentAutoReloadSectionController validForPaymentPass:](PKPeerPaymentAutoReloadSectionController, "validForPaymentPass:", self->_pass)&& self->_detailViewStyle != 2)
  {
    v64 = [PKPeerPaymentAutoReloadSectionController alloc];
    detailViewStyle = self->_detailViewStyle;
    v66 = 3;
    if (detailViewStyle != 1)
      v66 = 0;
    if (detailViewStyle == 2)
      v67 = 4;
    else
      v67 = v66;
    v68 = -[PKPeerPaymentAutoReloadSectionController initWithDelegate:pass:context:passLibraryDataProvider:](v64, "initWithDelegate:pass:context:passLibraryDataProvider:", self, self->_pass, v67, self->_passLibraryDataProvider);
    peerPaymentAutoReloadSectionController = self->_peerPaymentAutoReloadSectionController;
    self->_peerPaymentAutoReloadSectionController = v68;

    objc_msgSend(v99, "addObject:", self->_peerPaymentAutoReloadSectionController);
    -[PKPeerPaymentAutoReloadSectionController allSectionIdentifiers](self->_peerPaymentAutoReloadSectionController, "allSectionIdentifiers");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2](v98, v70, CFSTR("PeerPaymentMoneyActions"));

  }
  if (+[PKPeerPaymentRecurringPaymentPassDetailsSectionController validForPaymentPass:](PKPeerPaymentRecurringPaymentPassDetailsSectionController, "validForPaymentPass:", self->_pass)&& self->_detailViewStyle == 1)
  {
    v71 = [PKPeerPaymentRecurringPaymentPassDetailsSectionController alloc];
    v72 = self->_detailViewStyle;
    v73 = 3;
    if (v72 != 1)
      v73 = 0;
    if (v72 == 2)
      v74 = 4;
    else
      v74 = v73;
    v75 = -[PKPeerPaymentRecurringPaymentPassDetailsSectionController initWithDelegate:pass:context:passLibraryDataProvider:](v71, "initWithDelegate:pass:context:passLibraryDataProvider:", self, self->_pass, v74, self->_passLibraryDataProvider);
    peerPaymentRecurringPaymentSectionController = self->_peerPaymentRecurringPaymentSectionController;
    self->_peerPaymentRecurringPaymentSectionController = v75;

    objc_msgSend(v99, "addObject:", self->_peerPaymentRecurringPaymentSectionController);
    -[PKPeerPaymentRecurringPaymentPassDetailsSectionController allSectionIdentifiers](self->_peerPaymentRecurringPaymentSectionController, "allSectionIdentifiers");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2](v98, v77, CFSTR("PeerPaymentMoneyActions"));

  }
  if (+[PKPassDetailsPrecursorPassUpgradeSectionController validForPaymentPass:](PKPassDetailsPrecursorPassUpgradeSectionController, "validForPaymentPass:", self->_pass))
  {
    v78 = -[PKPassDetailsPrecursorPassUpgradeSectionController initWithPass:webService:delegate:]([PKPassDetailsPrecursorPassUpgradeSectionController alloc], "initWithPass:webService:delegate:", self->_pass, self->_webService, self);
    precursorSectionController = self->_precursorSectionController;
    self->_precursorSectionController = v78;

    objc_msgSend(v99, "addObject:", self->_precursorSectionController);
    -[PKPassDetailsPrecursorPassUpgradeSectionController allSectionIdentifiers](self->_precursorSectionController, "allSectionIdentifiers");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2](v98, v80, CFSTR("LinkedApplication"));

  }
  if (+[PKPassDetailsIdentityBioBindingSectionController validForPaymentPass:](PKPassDetailsIdentityBioBindingSectionController, "validForPaymentPass:", self->_pass))
  {
    v81 = -[PKPassDetailsIdentityBioBindingSectionController initWithPass:webService:delegate:]([PKPassDetailsIdentityBioBindingSectionController alloc], "initWithPass:webService:delegate:", self->_pass, self->_webService, self);
    bioBindingSectionController = self->_bioBindingSectionController;
    self->_bioBindingSectionController = v81;

    objc_msgSend(v99, "addObject:", self->_bioBindingSectionController);
    -[PKPassDetailsIdentityBioBindingSectionController allSectionIdentifiers](self->_bioBindingSectionController, "allSectionIdentifiers");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2](v98, v83, CFSTR("LinkedApplication"));

  }
  if (+[PKPeerPaymentIdentityManagementSectionController validForPaymentPass:](PKPeerPaymentIdentityManagementSectionController, "validForPaymentPass:", self->_pass))
  {
    v84 = -[PKPeerPaymentIdentityManagementSectionController initWithDelegate:]([PKPeerPaymentIdentityManagementSectionController alloc], "initWithDelegate:", self);
    peerPaymentIdentityManagementSectionController = self->_peerPaymentIdentityManagementSectionController;
    self->_peerPaymentIdentityManagementSectionController = v84;

    objc_msgSend(v99, "addObject:", self->_peerPaymentIdentityManagementSectionController);
    -[PKPeerPaymentIdentityManagementSectionController allSectionIdentifiers](self->_peerPaymentIdentityManagementSectionController, "allSectionIdentifiers");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2](v98, v86, CFSTR("PeerPaymentAutomaticallyAcceptPaymentsPreference"));

  }
  if (PKIsPhone()
    && PKBroadwayDiscoverability2024Enabled()
    && -[PKPaymentPass isAppleCardPass](self->_pass, "isAppleCardPass"))
  {
    v87 = objc_alloc_init(PKAppleCardFeaturesAndBenefitsSectionController);
    broadwayFeaturesAndBenefitsSectionController = self->_broadwayFeaturesAndBenefitsSectionController;
    self->_broadwayFeaturesAndBenefitsSectionController = v87;

    objc_initWeak((id *)buf, self);
    v89 = self->_broadwayFeaturesAndBenefitsSectionController;
    v100[0] = MEMORY[0x1E0C809B0];
    v100[1] = 3221225472;
    v100[2] = __51__PKPaymentPassDetailViewController__buildSections__block_invoke_261;
    v100[3] = &unk_1E3E794E0;
    objc_copyWeak(&v101, (id *)buf);
    -[PKAppleCardFeaturesAndBenefitsSectionController setSelectionHandler:](v89, "setSelectionHandler:", v100);
    objc_msgSend(v99, "addObject:", self->_broadwayFeaturesAndBenefitsSectionController);
    -[PKAppleCardFeaturesAndBenefitsSectionController allSectionIdentifiers](self->_broadwayFeaturesAndBenefitsSectionController, "allSectionIdentifiers");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2](v98, v90, CFSTR("BillingAddress"));

    objc_destroyWeak(&v101);
    objc_destroyWeak((id *)buf);
  }
  v91 = (NSArray *)objc_msgSend(v99, "copy");
  sectionControllers = self->_sectionControllers;
  self->_sectionControllers = v91;

  v93 = (NSArray *)objc_msgSend((id)v117[5], "copy");
  orderOfSectionIdentifiers = self->_orderOfSectionIdentifiers;
  self->_orderOfSectionIdentifiers = v93;

  _Block_object_dispose(&v116, 8);
}

void __51__PKPaymentPassDetailViewController__buildSections__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "indexOfObject:", a3);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "insertObject:atIndex:", v6, v5 + 1);

}

void __51__PKPaymentPassDetailViewController__buildSections__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "indexOfObject:", a3);
  if (objc_msgSend(v9, "count"))
  {
    v6 = 0;
    do
    {
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "insertObject:atIndex:", v8, v5 + 1 + v6);

      }
      ++v6;
    }
    while (v6 < objc_msgSend(v9, "count"));
  }

}

uint64_t __51__PKPaymentPassDetailViewController__buildSections__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __51__PKPaymentPassDetailViewController__buildSections__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
  {
    objc_msgSend(v6, "insertAfterSection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4 || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObject:", v3);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeObject:", v3);
      sectionIdentifierForInsertAfter(v4, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

void __51__PKPaymentPassDetailViewController__buildSections__block_invoke_5(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1[4] + 1920), "sectionForIdentifier:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "removeObject:", v6);
    objc_msgSend(v3, "insertAfterSection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sectionIdentifierForInsertAfter(v4, *(void **)(*(_QWORD *)(a1[6] + 8) + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(a1[5] + 16))();
  }

}

void __51__PKPaymentPassDetailViewController__buildSections__block_invoke_6(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1992), "sectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadSections:", v2);

}

void __51__PKPaymentPassDetailViewController__buildSections__block_invoke_261(uint64_t a1)
{
  void *v1;
  PKAppleCardFeaturesAndBenefitsViewController *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(PKAppleCardFeaturesAndBenefitsViewController);
  objc_msgSend(v1, "pushViewController:animated:", v2, 1);

}

- (void)_decorateSections
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t detailViewStyle;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_sectionControllers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          detailViewStyle = self->_detailViewStyle;
          v10 = v8;
          objc_msgSend(v10, "setDetailViewStyle:", detailViewStyle, (_QWORD)v11);
          objc_msgSend(v10, "setPrimaryTextColor:", self->_primaryTextColor);
          objc_msgSend(v10, "setDetailTextColor:", self->_detailTextColor);
          objc_msgSend(v10, "setLinkTextColor:", self->_linkTextColor);
          objc_msgSend(v10, "setWarningTextColor:", self->_warningTextColor);
          objc_msgSend(v10, "setHighlightColor:", self->_highlightColor);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (id)_configurableSections
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[PKPaymentPass passDetailSections](self->_pass, "passDetailSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_objectsPassingTest:", &__block_literal_global_265);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

BOOL __58__PKPaymentPassDetailViewController__configurableSections__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKPassDetailSectionTypeFromString(v3);

  if (v4 == 30)
  {
    objc_msgSend(v2, "insertAfterSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_configurableSectionForSectionType:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (a3 != 30)
    return 0;
  -[PKPaymentPass passDetailSections](self->_pass, "passDetailSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PKPaymentPassDetailViewController__configurableSectionForSectionType___block_invoke;
  v6[3] = &__block_descriptor_40_e29_B16__0__PKPassDetailSection_8l;
  v6[4] = 30;
  objc_msgSend(v3, "pk_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __72__PKPaymentPassDetailViewController__configurableSectionForSectionType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  _BOOL8 v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == PKPassDetailSectionTypeFromString(v3);

  return v4;
}

- (void)dealloc
{
  LAContext *authenticationContext;
  LAContext *v4;
  NSObject *refreshTimeout;
  OS_dispatch_source *v6;
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v8;
  void *v9;
  void *v10;
  int expressPassesInformationToken;
  id WeakRetained;
  void *v13;
  objc_super v14;

  authenticationContext = self->_authenticationContext;
  if (authenticationContext)
  {
    -[LAContext invalidate](authenticationContext, "invalidate");
    v4 = self->_authenticationContext;
    self->_authenticationContext = 0;

  }
  refreshTimeout = self->_refreshTimeout;
  if (refreshTimeout)
  {
    dispatch_source_cancel(refreshTimeout);
    v6 = self->_refreshTimeout;
    self->_refreshTimeout = 0;

  }
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v8 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
  PKUnregisterPassSettingsChangedObserver();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  expressPassesInformationToken = self->_expressPassesInformationToken;
  if (expressPassesInformationToken != -1)
    notify_cancel(expressPassesInformationToken);
  -[PKPaymentVerificationController setDelegate:](self->_verificationController, "setDelegate:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setDeletionStatusHandler:forPass:", 0, self->_pass);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentDataProvider removeDelegate:](self->_paymentServiceDataProvider, "removeDelegate:", self);
  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  -[PKGroup removeGroupObserver:](self->_group, "removeGroupObserver:", self);
  objc_msgSend(MEMORY[0x1E0D66800], "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unregisterObserver:", self);

  -[PKLinkedApplication removeObserver:](self->_linkedApplication, "removeObserver:", self);
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKPaymentPassDetailViewController dealloc](&v14, sel_dealloc);
}

- (void)executeAfterContentIsLoaded:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__PKPaymentPassDetailViewController_executeAfterContentIsLoaded___block_invoke;
    v6[3] = &unk_1E3E61850;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __65__PKPaymentPassDetailViewController_executeAfterContentIsLoaded___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 1784))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(void **)(v1 + 1792);
    v3 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v2, "addObject:", v3);

  }
}

- (void)contentIsLoaded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_allContentIsLoaded = 1;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)-[NSMutableArray copy](self->_executionBlocksContentIsLoaded, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_executionBlocksContentIsLoaded, "removeAllObjects");
}

- (void)setShowDoneButton:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PKPaymentPassDetailViewController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("DONE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, self, sel__done_);

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

}

- (void)viewWillMoveToWindow:(id)a3
{
  OS_dispatch_group *initialLoadGroup;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKPaymentPassDetailViewController viewWillMoveToWindow:](&v6, sel_viewWillMoveToWindow_);
  if (a3)
  {
    initialLoadGroup = self->_initialLoadGroup;
    if (initialLoadGroup)
    {
      self->_initialLoadGroup = 0;

      self->_initialLoadTimedout = 1;
    }
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  OS_dispatch_group *initialLoadGroup;
  NSObject *v6;
  OS_dispatch_group *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKPaymentPassDetailViewController willMoveToParentViewController:](&v14, sel_willMoveToParentViewController_, v4);
  if (v4)
  {
    initialLoadGroup = self->_initialLoadGroup;
    if (initialLoadGroup)
    {
      v6 = initialLoadGroup;
      v7 = self->_initialLoadGroup;
      self->_initialLoadGroup = 0;

      objc_msgSend(v4, "viewIfLoaded");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        self->_initialLoadTimedout = 1;
      }
      else
      {
        v10 = MEMORY[0x1E0C809B0];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __68__PKPaymentPassDetailViewController_willMoveToParentViewController___block_invoke;
        v13[3] = &unk_1E3E66CE8;
        v13[4] = self;
        objc_msgSend(v4, "_beginDelayingPresentation:cancellationHandler:", v13, 2.0);
        v11[0] = v10;
        v11[1] = 3221225472;
        v11[2] = __68__PKPaymentPassDetailViewController_willMoveToParentViewController___block_invoke_2;
        v11[3] = &unk_1E3E612E8;
        v12 = v4;
        dispatch_group_notify(v6, MEMORY[0x1E0C80D38], v11);

      }
    }
  }

}

uint64_t __68__PKPaymentPassDetailViewController_willMoveToParentViewController___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1736) = 1;
  return 1;
}

uint64_t __68__PKPaymentPassDetailViewController_willMoveToParentViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
}

- (void)_refreshStaleBalanceModelForPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isStoredValuePass") & 1) != 0 || (objc_msgSend(v6, "isAccessPass") & 1) != 0)
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__64;
    v38[4] = __Block_byref_object_dispose__64;
    v39 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__64;
    v36[4] = __Block_byref_object_dispose__64;
    v37 = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__64;
    v34[4] = __Block_byref_object_dispose__64;
    v35 = 0;
    objc_msgSend(v6, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "devicePrimaryPaymentApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v11 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke;
    v29[3] = &unk_1E3E6D618;
    v29[4] = self;
    v12 = v8;
    v30 = v12;
    v13 = v9;
    v31 = v13;
    v33 = v38;
    v32 = v6;
    objc_msgSend(v10, "addOperation:", v29);
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_4;
    v26[3] = &unk_1E3E63610;
    v26[4] = self;
    v14 = v12;
    v27 = v14;
    v28 = v36;
    objc_msgSend(v10, "addOperation:", v26);
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_7;
    v23[3] = &unk_1E3E63610;
    v23[4] = self;
    v15 = v14;
    v24 = v15;
    v25 = v34;
    objc_msgSend(v10, "addOperation:", v23);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_10;
    v18[3] = &unk_1E3E79590;
    v19 = v7;
    v20 = v36;
    v21 = v34;
    v22 = v38;
    v17 = (id)objc_msgSend(v10, "evaluateWithInput:completion:", v16, v18);

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v36, 8);

    _Block_object_dispose(v38, 8);
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
  }

}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 2168);
    v10 = *(void **)(a1 + 48);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_2;
    v11[3] = &unk_1E3E63638;
    v16 = *(_QWORD *)(a1 + 64);
    v12 = v10;
    v13 = *(id *)(a1 + 56);
    v15 = v7;
    v14 = v6;
    objc_msgSend(v9, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v8, v12, v11);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_3;
  v5[3] = &unk_1E3E79568;
  v11 = *(_QWORD *)(a1 + 64);
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "transitPassPropertiesWithPaymentApplication:pass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_4(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = a1[5];
    v9 = *(void **)(a1[4] + 2168);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_5;
    v10[3] = &unk_1E3E63660;
    v13 = a1[6];
    v12 = v7;
    v11 = v6;
    objc_msgSend(v9, "balancesForPaymentPassWithUniqueIdentifier:completion:", v8, v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_6;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_7(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = a1[5];
    v9 = *(void **)(a1[4] + 2168);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_8;
    v10[3] = &unk_1E3E63688;
    v13 = a1[6];
    v12 = v7;
    v11 = v6;
    objc_msgSend(v9, "plansForPaymentPassWithUniqueIdentifier:completion:", v8, v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_9;
  block[3] = &unk_1E3E6C700;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_9(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_10(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  __int128 v4;
  uint64_t v5;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_11;
  v2[3] = &unk_1E3E690D8;
  v3 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __81__PKPaymentPassDetailViewController__refreshStaleBalanceModelForPass_completion___block_invoke_11(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  return result;
}

- (void)loadView
{
  void *v3;
  UIRefreshControl *v4;
  UIRefreshControl *refreshControl;
  id v6;
  UITableViewHeaderFooterView *v7;
  UITableViewHeaderFooterView *headerView;
  NSUInteger v9;
  void *v10;
  void *v11;
  NSUInteger v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSUInteger v17;
  UISegmentedControl *v18;
  UISegmentedControl *tabBar;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKPaymentPassDetailViewController loadView](&v21, sel_loadView);
  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentPassDetailViewController shouldAllowRefresh](self, "shouldAllowRefresh"))
  {
    v4 = (UIRefreshControl *)objc_alloc_init(MEMORY[0x1E0DC3BA8]);
    refreshControl = self->_refreshControl;
    self->_refreshControl = v4;

    -[PKPaymentPassDetailViewController setRefreshControl:](self, "setRefreshControl:", self->_refreshControl);
    -[UIRefreshControl addTarget:action:forControlEvents:](self->_refreshControl, "addTarget:action:forControlEvents:", self, sel_refreshControlValueChanged_, 4096);
  }
  objc_msgSend(v3, "setEstimatedSectionHeaderHeight:", 0.0);
  PKFloatRoundToPixel();
  objc_msgSend(v3, "setEstimatedSectionFooterHeight:");
  if (self->_detailViewStyle == 2)
    objc_msgSend(v3, "setIndicatorStyle:", 2);
  v6 = objc_alloc(MEMORY[0x1E0DC3D78]);
  v7 = (UITableViewHeaderFooterView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerView = self->_headerView;
  self->_headerView = v7;

  if (self->_pass)
  {
    if (self->_primaryTextColor)
      -[PKPassHeaderView setPrimaryTextColor:](self->_passHeaderView, "setPrimaryTextColor:");
    if (self->_detailTextColor)
      -[PKPassHeaderView setSecondaryTextColor:](self->_passHeaderView, "setSecondaryTextColor:");
    -[UITableViewHeaderFooterView addSubview:](self->_headerView, "addSubview:", self->_passHeaderView);
    -[PKPaymentPassDetailViewController _updatePassSnapshot](self, "_updatePassSnapshot");
  }
  v9 = -[NSArray count](self->_tabBarSegments, "count");
  if (self->_hasTabBar)
  {
    if (v9 < 2)
      goto LABEL_22;
    PKPassDetailsLastSelectedSegment();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKSegmentStringToSegment(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_18;
    v12 = -[NSArray indexOfObject:](self->_tabBarSegments, "indexOfObject:", v11);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = v12;
      goto LABEL_20;
    }
    if (self->_hasTabBar)
    {
      -[NSArray objectAtIndex:](self->_tabBarSegments, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKSegmentToSegmentString(v15);
      v16 = objc_claimAutoreleasedReturnValue();

      PKSetPassDetailsLastSelectedSegment();
      v17 = 0;
      v10 = (void *)v16;
    }
    else
    {
LABEL_18:
      v17 = 0;
    }
LABEL_20:
    -[PKPaymentPassDetailViewController _createTabBarWithSelectedIndex:](self, "_createTabBarWithSelectedIndex:", v17);
    v18 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
    tabBar = self->_tabBar;
    self->_tabBar = v18;

    -[UITableViewHeaderFooterView addSubview:](self->_headerView, "addSubview:", self->_tabBar);
    goto LABEL_21;
  }
  v10 = self->_tabBar;
  self->_tabBar = 0;
LABEL_21:

LABEL_22:
  -[PKPaymentPassDetailViewController _updateHeaderHeightDeterminingLayout:](self, "_updateHeaderHeightDeterminingLayout:", 0);
  -[UITableViewHeaderFooterView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 0.0, self->_headerHeight + self->_tabBarHeight);
  objc_msgSend(v3, "setTableHeaderView:", self->_headerView);
  if (self->_footerView)
    objc_msgSend(v3, "setTableFooterView:");
  objc_msgSend(v3, "_setPinsTableHeaderView:", 1);
  if (self->_peerPaymentAccount && !self->_peerPaymentPreferences)
    -[PKPaymentPassDetailViewController _updatePeerPaymentPreferences](self, "_updatePeerPaymentPreferences");
  -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 0);
  -[PKPaymentPassDetailViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67DE8]);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  PKAnimatedNavigationBarTitleView *v7;
  PKAnimatedNavigationBarTitleView *titleIconView;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKPaymentPassDetailViewController viewWillAppear:](&v16, sel_viewWillAppear_, a3);
  -[PKPaymentPassDetailViewController _updateHeaderHeightDeterminingLayout:](self, "_updateHeaderHeightDeterminingLayout:", 1);
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __52__PKPaymentPassDetailViewController_viewWillAppear___block_invoke;
  v13 = &unk_1E3E61310;
  objc_copyWeak(&v14, &location);
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", &v10);
  -[PKPaymentPassDetailViewController _updateCashbackPeerPaymentResolutionSection](self, "_updateCashbackPeerPaymentResolutionSection", v10, v11, v12, v13);
  -[PKPaymentPassDetailViewController _fetchMerchantTokens](self, "_fetchMerchantTokens");
  if (!self->_titleIconView)
  {
    -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "frame");
    v7 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v6 + v6, v6);
    titleIconView = self->_titleIconView;
    self->_titleIconView = v7;

    -[PKAnimatedNavigationBarTitleView setAlpha:](self->_titleIconView, "setAlpha:", 0.0);
    -[PKPaymentPassDetailViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pkui_setCenterAlignedTitleView:", self->_titleIconView);

    self->_showingTitleIconView = 0;
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __52__PKPaymentPassDetailViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadTransactionSectionsAnimated:forceReload:", 0, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  __CFString *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int64_t detailViewStyle;
  _QWORD *v14;
  PKPaymentPass *v15;
  void *v16;
  unint64_t v17;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKPaymentPassDetailViewController viewDidAppear:](&v18, sel_viewDidAppear_, a3);
  -[PKPaymentPassDetailViewController _reloadTitle](self, "_reloadTitle");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("PKPDVCDidAppearNotification"), self, 0);

  v6 = *MEMORY[0x1E0D69910];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69910]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v6);
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  v9 = *MEMORY[0x1E0D68F50];
  v19[0] = *MEMORY[0x1E0D68AA0];
  v19[1] = v9;
  v10 = *MEMORY[0x1E0D68FC0];
  v20[0] = *MEMORY[0x1E0D68C50];
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithDictionary:", v11);

  if (-[PKPaymentPass isIdentityPass](self->_pass, "isIdentityPass"))
  {
    objc_msgSend(MEMORY[0x1E0D66A58], "updateIdentityEventToReportDashboardAnalytics:forPass:", v12, self->_pass);
    detailViewStyle = self->_detailViewStyle;
    if (detailViewStyle == 1)
    {
      v14 = (_QWORD *)MEMORY[0x1E0D68E88];
    }
    else
    {
      if (detailViewStyle != 2)
        goto LABEL_9;
      v14 = (_QWORD *)MEMORY[0x1E0D68E80];
    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", *v14, *MEMORY[0x1E0D693B0]);
  }
LABEL_9:
  v15 = self->_pass;
  if (-[PKPaymentPass passType](v15, "passType") == 1)
  {
    -[PKPaymentPass secureElementPass](v15, "secureElementPass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "cardType");
    if (v17 <= 4)
      v3 = (__CFString *)**((id **)&unk_1E3E79F18 + v17);

  }
  else
  {
    v3 = CFSTR("other");
  }

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D69028]);
  objc_msgSend(MEMORY[0x1E0D66A58], "reportDashboardEventIfNecessary:forPass:", v12, self->_pass);
  -[PKPaymentPassDetailViewController presentPayLaterAccountErrorsIfNecessary](self, "presentPayLaterAccountErrorsIfNecessary");

}

- (void)viewWillDisappear:(BOOL)a3
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKPaymentPassDetailViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[PKPaymentPassDetailViewController _cancelPendingTransactionTimer](self, "_cancelPendingTransactionTimer");
  -[PKPaymentPassDetailViewController _reloadTitle](self, "_reloadTitle");
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKPaymentPassDetailViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  v4 = (id)*MEMORY[0x1E0D68FC0];
  if (-[PKPaymentPass isIdentityPass](self->_pass, "isIdentityPass"))
  {
    v5 = (id)*MEMORY[0x1E0D69030];

    v4 = v5;
  }
  v6 = (void *)MEMORY[0x1E0D66A58];
  v7 = *MEMORY[0x1E0D68C58];
  v8 = *MEMORY[0x1E0D68F50];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v8;
  v12[0] = v7;
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportDashboardEventIfNecessary:forPass:", v9, self->_pass);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKPaymentPassDetailViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)viewDidLayoutSubviews
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _BOOL4 v33;
  double v34;
  _BOOL4 v35;
  double v36;
  _BOOL4 v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double *p_previousLayoutTableViewWidth;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  UISegmentedControl *tabBar;
  double left;
  CGFloat v53;
  double v54;
  float64x2_t v58;
  CGSize v59;
  UITableViewHeaderFooterView *footerView;
  void *v61;
  int v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGRect v78;
  CGRect remainder;
  CGRect slice;
  objc_super v81;
  CGRect v82;

  v81.receiver = self;
  v81.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKPaymentPassDetailViewController viewDidLayoutSubviews](&v81, sel_viewDidLayoutSubviews);
  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v76 = v5;
  v77 = v4;
  v7 = v6;
  objc_msgSend(v3, "safeAreaInsets");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "contentSize");
  v75 = v12;
  v14 = v13;
  -[PKPaymentPassDetailViewController _offscreenHeaderHeight](self, "_offscreenHeaderHeight");
  v16 = v15;
  objc_msgSend(v3, "contentInset");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = v7 - (v9 + v11);
  v25 = v14 <= v24;
  v26 = v14 - v24;
  _NF = !v25 && v26 < v16;
  v28 = v16 - v26;
  if (_NF)
    v29 = v28;
  else
    v29 = v17;
  objc_msgSend(v3, "contentInset");
  v33 = v32 == v21;
  if (v34 != v19)
    v33 = 0;
  if (v31 != v23)
    v33 = 0;
  v35 = v30 == v29 && v33;
  if (!v35)
    objc_msgSend(v3, "setContentInset:", v19, v21, v29, v23);
  v36 = v16 + v19;
  v37 = -[UIRefreshControl isRefreshing](self->_refreshControl, "isRefreshing");
  -[UIRefreshControl superview](self->_refreshControl, "superview");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0.0;
  if (v38)
  {
    v40 = -(v9 + v19);

    v41 = v77;
    if (v77 < v40)
      v39 = v40 - v77;
  }
  else
  {
    v41 = v77;
  }
  v42 = v36 + v39;
  memset(&slice, 0, sizeof(slice));
  objc_msgSend(v3, "layoutIfNeeded");
  objc_msgSend(v3, "_moveContentSubview:toBack:", self->_headerView, 0);
  if (self->_previousLayoutContentSize.width != v75 || self->_previousLayoutContentSize.height != v14)
  {
    self->_previousLayoutContentSize.width = v75;
    self->_previousLayoutContentSize.height = v14;
    p_previousLayoutTableViewWidth = &self->_previousLayoutTableViewWidth;
    v45 = v76;
    if (self->_previousLayoutTableViewWidth == v76)
      goto LABEL_28;
    goto LABEL_27;
  }
  p_previousLayoutTableViewWidth = &self->_previousLayoutTableViewWidth;
  v45 = v76;
  if (self->_previousLayoutTableViewWidth != v76)
  {
LABEL_27:
    -[PKPaymentPassDetailViewController _updateHeaderHeightDeterminingLayout:](self, "_updateHeaderHeightDeterminingLayout:", 0);
    *p_previousLayoutTableViewWidth = v45;
LABEL_28:
    -[PKPaymentPassDetailViewController _normalizeContentOffset](self, "_normalizeContentOffset");
    goto LABEL_29;
  }
  if (!v35 && !v37)
    goto LABEL_28;
LABEL_29:
  objc_msgSend(v3, "_rectForTableHeaderView");
  v47 = v46;
  v48 = v42 - (v9 + v19 + v39);
  v49 = self->_headerHeight + self->_tabBarHeight;
  v50 = v41 - v48;
  -[UITableViewHeaderFooterView setFrame:](self->_headerView, "setFrame:");
  if (v47 != v49)
    objc_msgSend(v3, "_tableHeaderHeightDidChangeToHeight:", v49);
  -[PKPassHeaderView updateShadow:](self->_passHeaderView, "updateShadow:", fmin(fmax(v50 / (v48 + -20.0 - v48), 0.0), 1.0));
  -[PKPassHeaderView setAlpha:](self->_passHeaderView, "setAlpha:", fmin(fmax((v41 - (v48 + 20.0)) / (v48 - (v48 + 20.0)), 0.0), 1.0));
  -[UITableViewHeaderFooterView bounds](self->_headerView, "bounds");
  remainder = v82;
  CGRectDivide(v82, &slice, &remainder, self->_headerHeight, CGRectMinYEdge);
  v78 = remainder;
  -[PKPassHeaderView setFrame:](self->_passHeaderView, "setFrame:", slice.origin.x + self->_headerContentInset.left, slice.origin.y + self->_headerContentInset.top, slice.size.width - (self->_headerContentInset.left + self->_headerContentInset.right), slice.size.height - (self->_headerContentInset.top + self->_headerContentInset.bottom));
  remainder = v78;
  tabBar = self->_tabBar;
  if (tabBar)
  {
    -[UISegmentedControl frame](tabBar, "frame");
    left = self->_headerContentInset.left;
    v53 = left + remainder.origin.x;
    v54 = left + self->_headerContentInset.right;
    remainder.origin.x = v53;
    remainder.origin.y = remainder.origin.y + 15.0;
    __asm { FMOV            V5.2D, #-30.0 }
    v58 = vaddq_f64((float64x2_t)remainder.size, _Q5);
    _Q5.f64[0] = v54;
    *(_QWORD *)&v59.width = *(_OWORD *)&vsubq_f64((float64x2_t)remainder.size, _Q5);
    v59.height = v58.f64[1];
    remainder.size = v59;
    -[UISegmentedControl setFrame:](self->_tabBar, "setFrame:");
    -[UISegmentedControl setAlpha:](self->_tabBar, "setAlpha:", fmin(fmax(v50 / (v48 + -15.0 - v48), 0.0), 1.0));
  }
  footerView = self->_footerView;
  if (footerView)
  {
    -[UITableViewHeaderFooterView contentView](footerView, "contentView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "_shouldReverseLayoutDirection");
    objc_msgSend(v61, "layoutMargins");
    v64 = v63;
    v66 = v65;
    objc_msgSend(v61, "bounds");
    v68 = v64 + v67;
    v70 = v69 + 0.0;
    v72 = v71 - (v64 + v66);
    -[UIImageView frame](self->_logoView, "frame");
    v74 = v68 + v72 - v73;
    if (!v62)
      v74 = v68;
    -[UIImageView setFrame:](self->_logoView, "setFrame:", v74, v70);

  }
}

- (id)contactIssuerHelper
{
  PKSecureElementPassContactIssuerHelper *contactIssuerHelper;
  PKSecureElementPassContactIssuerHelper *v4;
  PKSecureElementPassContactIssuerHelper *v5;
  PKSecureElementPassContactIssuerHelper *v6;
  _QWORD v8[4];
  id v9;
  id location;

  contactIssuerHelper = self->_contactIssuerHelper;
  if (!contactIssuerHelper)
  {
    v4 = objc_alloc_init(PKSecureElementPassContactIssuerHelper);
    v5 = self->_contactIssuerHelper;
    self->_contactIssuerHelper = v4;

    -[PKSecureElementPassContactIssuerHelper setDelegate:](self->_contactIssuerHelper, "setDelegate:", self);
    -[PKSecureElementPassContactIssuerHelper setPass:](self->_contactIssuerHelper, "setPass:", self->_pass);
    -[PKSecureElementPassContactIssuerHelper setFeatureIdentifier:](self->_contactIssuerHelper, "setFeatureIdentifier:", -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature"));
    objc_initWeak(&location, self);
    if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
    {
      v6 = self->_contactIssuerHelper;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __56__PKPaymentPassDetailViewController_contactIssuerHelper__block_invoke;
      v8[3] = &unk_1E3E61310;
      objc_copyWeak(&v9, &location);
      -[PKSecureElementPassContactIssuerHelper setOpenBusinessChatHandler:](v6, "setOpenBusinessChatHandler:", v8);
      objc_destroyWeak(&v9);
    }
    objc_destroyWeak(&location);
    contactIssuerHelper = self->_contactIssuerHelper;
  }
  return contactIssuerHelper;
}

void __56__PKPaymentPassDetailViewController_contactIssuerHelper__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "openBusinessChat");
    WeakRetained = v2;
  }

}

- (void)presentTransactionDetailsForTransaction:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (self->_peerPaymentAccount)
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68590], 0);
  -[PKPaymentPassDetailViewController _transactionDetailViewControllerForTransaction:](self, "_transactionDetailViewControllerForTransaction:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v6, v4);

}

- (id)_transactionDetailViewControllerForTransaction:(id)a3
{
  id v4;
  PKDashboardTransactionFetcher *transactionFetcher;
  void *v6;
  void *v7;
  PKTransactionHistoryViewController *v8;
  PKPaymentTransactionDetailsFactory *transactionDetailsFactory;
  PKTransactionSourceCollection *transactionSourceCollection;
  PKFamilyMemberCollection *familyCollection;
  PKAccount *account;
  PKAccountUserCollection *accountUserCollection;
  PKTransactionHistoryViewController *v14;

  v4 = a3;
  if (objc_msgSend(v4, "transactionType") == 9)
  {
    transactionFetcher = self->_transactionFetcher;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardTransactionFetcher cashbackGroupForTransactionWithIdentifier:cashbackTransactionSourceCollection:](transactionFetcher, "cashbackGroupForTransactionWithIdentifier:cashbackTransactionSourceCollection:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:]([PKTransactionHistoryViewController alloc], "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v7, self->_transactionSourceCollection, self->_familyCollection, self->_account, self->_accountUserCollection, self->_physicalCards, 0, 0, self->_detailViewStyle);
  }
  else
  {
    transactionDetailsFactory = self->_transactionDetailsFactory;
    transactionSourceCollection = self->_transactionSourceCollection;
    familyCollection = self->_familyCollection;
    account = self->_account;
    accountUserCollection = self->_accountUserCollection;
    -[PKPassDetailBankConnectSectionController connectedInstitution](self->_bankConnectSectionController, "connectedInstitution");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionDetailsFactory detailViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:](transactionDetailsFactory, "detailViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:", v4, transactionSourceCollection, familyCollection, account, accountUserCollection, v7, self->_physicalCards);
    v8 = (PKTransactionHistoryViewController *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v8;

  return v14;
}

- (void)presentDailyCashForDateComponents:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPaymentPassDetailViewController *v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PKPaymentPassDetailViewController_presentDailyCashForDateComponents___block_invoke;
  v6[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v7 = v5;
  v8 = self;
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __71__PKPaymentPassDetailViewController_presentDailyCashForDateComponents___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__PKPaymentPassDetailViewController_presentDailyCashForDateComponents___block_invoke_2;
    v6[3] = &unk_1E3E62E98;
    v6[4] = WeakRetained;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    v8 = v5;
    objc_msgSend(v3, "_reloadTransactionsWithCompletion:", v6);

  }
}

void __71__PKPaymentPassDetailViewController_presentDailyCashForDateComponents___block_invoke_2(uint64_t a1)
{
  PKTransactionHistoryViewController *v2;
  _QWORD *v3;
  PKTransactionHistoryViewController *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1256), "cashbackGroupForDateComponents:cashbackTransactionSourceCollection:", *(_QWORD *)(a1 + 40), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v2 = [PKTransactionHistoryViewController alloc];
    v3 = *(_QWORD **)(a1 + 32);
    v4 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:](v2, "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v6, v3[275], v3[282], v3[277], v3[264], v3[281], 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 2144));
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v4, 1);

  }
}

- (void)_updatePassSnapshot
{
  void *v3;
  void *v4;
  PKPassView *v5;
  double v6;
  CGFloat v7;
  void *v8;
  UIView *passSnapshotView;
  void *v10;
  UIView *v11;
  UIView *v12;
  CATransform3D v13;

  -[PKPassHeaderView passView](self->_passHeaderView, "passView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_rendererState)
  {
    v5 = -[PKPassView initWithPass:content:suppressedContent:rendererState:]([PKPassView alloc], "initWithPass:content:suppressedContent:rendererState:", self->_pass, 4, 1527, self->_rendererState);
    -[PKPassView setModallyPresented:](v5, "setModallyPresented:", 1);
    -[PKPassView setPaused:](v5, "setPaused:", 1);
    -[PKPassView sizeOfFrontFace](v5, "sizeOfFrontFace");
    v7 = 52.0 / v6;
    -[PKPassView layer](v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CATransform3DMakeScale(&v13, v7, v7, 1.0);
    objc_msgSend(v8, "setTransform:", &v13);

    passSnapshotView = self->_passSnapshotView;
    self->_passSnapshotView = &v5->super;

  }
  else
  {
    objc_msgSend(v3, "snapshotOfFrontFaceWithRequestedSize:", 52.0, 33.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v10);
    v12 = self->_passSnapshotView;
    self->_passSnapshotView = v11;

    -[UIView setAccessibilityIgnoresInvertColors:](self->_passSnapshotView, "setAccessibilityIgnoresInvertColors:", 1);
  }

}

- (void)_reloadPassAndView
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  -[PKPassHeaderView pass](self->_passHeaderView, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "passType"), v4 = v6, v5 == 1))
    -[PKPaymentPassDetailViewController _updatePassPropertiesForPass:](self, "_updatePassPropertiesForPass:", v6);
  else
    -[PKPaymentPassDetailViewController _reloadView](self, "_reloadView", v4);

}

- (void)_loadBankConnectTransactions
{
  id v3;
  void *v4;
  FKBankConnectTransactionsAndGroupsProvider *v5;
  FKBankConnectTransactionsAndGroupsProvider *bankConnectTransactionsAndGroupsProvider;

  v3 = objc_alloc(MEMORY[0x1E0CADD18]);
  -[PKPaymentPass primaryAccountIdentifier](self->_pass, "primaryAccountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (FKBankConnectTransactionsAndGroupsProvider *)objc_msgSend(v3, "initWithPrimaryAccountIdentifier:", v4);
  bankConnectTransactionsAndGroupsProvider = self->_bankConnectTransactionsAndGroupsProvider;
  self->_bankConnectTransactionsAndGroupsProvider = v5;

  -[FKBankConnectTransactionsAndGroupsProvider setDelegate:](self->_bankConnectTransactionsAndGroupsProvider, "setDelegate:", self);
  -[FKBankConnectTransactionsAndGroupsProvider performFetchAndStartObservingNotifications](self->_bankConnectTransactionsAndGroupsProvider, "performFetchAndStartObservingNotifications");
}

- (void)_reloadTitle
{
  void *v3;
  id v4;

  -[PKPaymentPassDetailViewController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_detailViewStyle)
    PKLocalizedPaymentString(CFSTR("CARD"));
  else
    -[PKPaymentPass localizedDescription](self->_pass, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

}

- (void)_reloadView
{
  _QWORD v3[5];

  if (-[PKPaymentPassDetailViewController shouldMapSection:](self, "shouldMapSection:", 39))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __48__PKPaymentPassDetailViewController__reloadView__block_invoke;
    v3[3] = &unk_1E3E62288;
    v3[4] = self;
    -[PKPaymentPassDetailViewController _reloadTransactionsWithCompletion:](self, "_reloadTransactionsWithCompletion:", v3);
  }
  else
  {
    -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 0);
  }
}

uint64_t __48__PKPaymentPassDetailViewController__reloadView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData:", 0);
}

- (void)_updateFamilyRows
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *sortedFamilyMemberRowModels;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  PKAccount *account;
  NSArray *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSArray *obj;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[6];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[6];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[PKFamilyMemberCollection familyMembers](self->_familyCollection, "familyMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_peerPaymentAccount && self->_familyCollection && objc_msgSend(v3, "count"))
  {
    +[PKPeerPaymentFamilyMemberRowModel sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:peerPaymentAccount:](PKPeerPaymentFamilyMemberRowModel, "sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:peerPaymentAccount:", v4, self->_peerPaymentAccount);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sortedFamilyMemberRowModels = self->_sortedFamilyMemberRowModels;
    self->_sortedFamilyMemberRowModels = v5;

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = self->_sortedFamilyMemberRowModels;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v7)
    {
      v8 = v7;
      v43 = v4;
      v9 = *(_QWORD *)v54;
      do
      {
        v10 = 0;
        v45 = v8;
        do
        {
          if (*(_QWORD *)v54 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v10);
          objc_msgSend(v11, "familyMember");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "account");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "altDSID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            v16 = v14;
          }
          else
          {
            objc_msgSend(v11, "invitation");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "altDSID");
            v16 = (id)objc_claimAutoreleasedReturnValue();

          }
          -[PKPaymentPassDetailViewController contactAvatarManager](self, "contactAvatarManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "cachedAvatarForAltDSID:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            -[PKPaymentPassDetailViewController contactAvatarManager](self, "contactAvatarManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "account");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "invitation");
            v22 = v9;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v52[0] = MEMORY[0x1E0C809B0];
            v52[1] = 3221225472;
            v52[2] = __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke;
            v52[3] = &unk_1E3E61428;
            v52[4] = v11;
            v52[5] = self;
            objc_msgSend(v20, "avatarForFamilyMember:peerPaymentAccount:invitation:completion:", v12, v21, v23, v52);

            v9 = v22;
            v8 = v45;

          }
          objc_msgSend(v11, "setImage:", v19);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v8);
LABEL_30:
      v4 = v43;
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  account = self->_account;
  if (account)
  {
    +[PKAccountUserFamilyMemberRowModel sortedAccountUserFamilyMemberRowModelsForFamilyMemberCollection:account:accountUserCollection:invitations:](PKAccountUserFamilyMemberRowModel, "sortedAccountUserFamilyMemberRowModelsForFamilyMemberCollection:account:accountUserCollection:invitations:", self->_familyCollection, account, self->_accountUserCollection, self->_accountUserInvitations);
    v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v26 = self->_sortedFamilyMemberRowModels;
    self->_sortedFamilyMemberRowModels = v25;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = self->_sortedFamilyMemberRowModels;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v27)
    {
      v28 = v27;
      v43 = v4;
      v46 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v49 != v46)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v30, "familyMember");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "accountUser");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "altDSID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33)
          {
            v35 = v33;
          }
          else
          {
            objc_msgSend(v30, "invitation");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "invitationDetails");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "accountUserAltDSID");
            v35 = (id)objc_claimAutoreleasedReturnValue();

          }
          -[PKPaymentPassDetailViewController contactAvatarManager](self, "contactAvatarManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "cachedAvatarForAltDSID:", v35);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v39)
          {
            -[PKPaymentPassDetailViewController contactAvatarManager](self, "contactAvatarManager");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "accountUser");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "invitation");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v47[0] = MEMORY[0x1E0C809B0];
            v47[1] = 3221225472;
            v47[2] = __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke_3;
            v47[3] = &unk_1E3E61428;
            v47[4] = v30;
            v47[5] = self;
            objc_msgSend(v40, "avatarForFamilyMember:accountUser:invitation:completion:", v31, v41, v42, v47);

          }
          objc_msgSend(v30, "setImage:", v39);

        }
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v28);
      goto LABEL_30;
    }
LABEL_31:

    -[PKPaymentPassDetailViewController reloadPassDetailSections:](self, "reloadPassDetailSections:", &unk_1E3FAE9E0);
  }

}

void __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke_2;
  block[3] = &unk_1E3E61400;
  v4 = *(_QWORD *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "reloadSection:", 36);
}

void __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke_4;
  block[3] = &unk_1E3E61400;
  v4 = *(_QWORD *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __54__PKPaymentPassDetailViewController__updateFamilyRows__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "reloadSection:", 12);
}

- (void)_loadFamilyCollectionIfNecessaryWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  PKPaymentDataProvider *paymentServiceDataProvider;
  _QWORD v6[5];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (self->_familyCollection || (objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__PKPaymentPassDetailViewController__loadFamilyCollectionIfNecessaryWithCompletion___block_invoke;
    v6[3] = &unk_1E3E61878;
    v6[4] = self;
    v7 = v4;
    -[PKPaymentDataProvider familyMembersWithCompletion:](paymentServiceDataProvider, "familyMembersWithCompletion:", v6);

  }
}

void __84__PKPaymentPassDetailViewController__loadFamilyCollectionIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PKPaymentPassDetailViewController__loadFamilyCollectionIfNecessaryWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E65388;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84__PKPaymentPassDetailViewController__loadFamilyCollectionIfNecessaryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 2256);
  *(_QWORD *)(v3 + 2256) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateFamilyRows");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_loadAdditionalAccountDataWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  PKPaymentPassDetailViewController *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PKStoreDemoModeEnabled();
  v8 = MEMORY[0x1E0C809B0];
  if ((v7 & 1) != 0 || (PKUIOnlyDemoModeEnabled() & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke;
    v22[3] = &unk_1E3E67120;
    v22[4] = self;
    objc_msgSend(v5, "addOperation:", v22);
    v9 = 0;
  }
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_3;
  v21[3] = &unk_1E3E67120;
  v21[4] = self;
  objc_msgSend(v5, "addOperation:", v21);
  if ((v9 & 1) == 0)
  {
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_5;
    v20[3] = &unk_1E3E67120;
    v20[4] = self;
    objc_msgSend(v5, "addOperation:", v20);
  }
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_7;
  v17[3] = &unk_1E3E65A40;
  v18 = v6;
  v19 = self;
  v10 = v6;
  objc_msgSend(v5, "addOperation:", v17);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_10;
  v16[3] = &unk_1E3E67120;
  v16[4] = self;
  objc_msgSend(v5, "addOperation:", v16);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_12;
  v14[3] = &unk_1E3E66078;
  v15 = v4;
  v12 = v4;
  v13 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v11, v14);

}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E61450;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  block[4] = v8;
  v9 = v6;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1872), "updateWithAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2216));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2216), "isSharedAccount") & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_4;
    v9[3] = &unk_1E3E61450;
    v9[4] = v8;
    v11 = v7;
    v10 = v6;
    objc_msgSend(v8, "loadAccountUsersWithCompletion:", v9);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

uint64_t __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reloadTransactionSourceCollectionIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_updateCashbackPeerPaymentResolutionSection");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_6;
  v11[3] = &unk_1E3E618A0;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "loadPendingAccountUserInvitationsWithCompletion:", v11);

}

uint64_t __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_8;
  v13[3] = &unk_1E3E66008;
  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v14 = v6;
  v15 = v7;
  v13[4] = v9;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "physicalCardsForAccountWithIdentifier:completion:", v10, v13);

}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_9;
  v5[3] = &unk_1E3E65E08;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 2248);
  *(_QWORD *)(v3 + 2248) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_11;
  v11[3] = &unk_1E3E61450;
  v12 = v6;
  v13 = v7;
  v11[4] = v8;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "_loadFamilyCollectionIfNecessaryWithCompletion:", v11);

}

uint64_t __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_11(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateFamilyRows");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_12(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_13;
  block[3] = &unk_1E3E61590;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __78__PKPaymentPassDetailViewController__loadAdditionalAccountDataWithCompletion___block_invoke_13(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_reloadTransactionSectionsAnimated:(BOOL)a3 forceReload:(BOOL)a4
{
  _QWORD v7[5];
  BOOL v8;
  BOOL v9;

  if ((a4 || -[PKPaymentPassDetailViewController shouldMapSection:](self, "shouldMapSection:", 39))
    && self->_hasTabBar)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__PKPaymentPassDetailViewController__reloadTransactionSectionsAnimated_forceReload___block_invoke;
    v7[3] = &unk_1E3E795B8;
    v8 = a4;
    v9 = a3;
    v7[4] = self;
    -[PKPaymentPassDetailViewController _reloadTransactionsWithCompletion:](self, "_reloadTransactionsWithCompletion:", v7);
  }
}

uint64_t __84__PKPaymentPassDetailViewController__reloadTransactionSectionsAnimated_forceReload___block_invoke(uint64_t result, int a2)
{
  BOOL v2;
  int v3;
  void *v4;

  if (*(_BYTE *)(result + 40))
    v2 = 0;
  else
    v2 = a2 == 0;
  if (!v2)
  {
    v3 = *(unsigned __int8 *)(result + 41);
    v4 = *(void **)(result + 32);
    if (v3)
      return objc_msgSend(v4, "reloadPassDetailSections:", &unk_1E3FAE9F8);
    else
      return objc_msgSend(v4, "reloadData:", 0);
  }
  return result;
}

- (void)_applyStaticPassPropertiesForPass
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSArray *v10;
  NSArray *contactlessPaymentApplications;
  NSArray *v12;
  NSArray *v13;
  void *v14;
  NSArray *v15;
  NSArray *devicePaymentApplications;
  NSArray *v17;
  NSArray *v18;
  PKPaymentDataProvider *paymentServiceDataProvider;
  void *v20;
  PKPaymentApplication *v21;
  PKPaymentApplication *defaultPaymentApplication;
  PKPaymentApplication *v23;
  PKPaymentApplication *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PKPaymentPass devicePaymentApplications](self->_pass, "devicePaymentApplications", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v9, "supportsContactlessPayment"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v6);
  }

  v10 = (NSArray *)objc_msgSend(v3, "copy");
  contactlessPaymentApplications = self->_contactlessPaymentApplications;
  self->_contactlessPaymentApplications = v10;

  -[PKPaymentPass sortedPaymentApplications:ascending:](self->_pass, "sortedPaymentApplications:ascending:", self->_contactlessPaymentApplications, 1);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v13 = self->_contactlessPaymentApplications;
  self->_contactlessPaymentApplications = v12;

  -[PKPaymentPass devicePaymentApplications](self->_pass, "devicePaymentApplications");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  devicePaymentApplications = self->_devicePaymentApplications;
  self->_devicePaymentApplications = v15;

  -[PKPaymentPass sortedPaymentApplications:ascending:](self->_pass, "sortedPaymentApplications:ascending:", self->_devicePaymentApplications, 1);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v18 = self->_devicePaymentApplications;
  self->_devicePaymentApplications = v17;

  paymentServiceDataProvider = self->_paymentServiceDataProvider;
  -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDataProvider defaultPaymentApplicationForPassUniqueIdentifier:](paymentServiceDataProvider, "defaultPaymentApplicationForPassUniqueIdentifier:", v20);
  v21 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
  defaultPaymentApplication = self->_defaultPaymentApplication;
  self->_defaultPaymentApplication = v21;

  if (!self->_defaultPaymentApplication)
  {
    -[PKPaymentPass devicePrimaryContactlessPaymentApplication](self->_pass, "devicePrimaryContactlessPaymentApplication");
    v23 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
    v24 = self->_defaultPaymentApplication;
    self->_defaultPaymentApplication = v23;

  }
  -[PKPaymentPass storeIdentifiers](self->_pass, "storeIdentifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass appLaunchURL](self->_pass, "appLaunchURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKLinkedApplication storeIDs](self->_linkedApplication, "storeIDs");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = PKEqualObjects();

  -[PKLinkedApplication defaultLaunchURL](self->_linkedApplication, "defaultLaunchURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = PKEqualObjects();

  if ((v28 & 1) == 0)
    -[PKLinkedApplication setStoreIDs:](self->_linkedApplication, "setStoreIDs:", v25);
  if ((v30 & 1) == 0)
    -[PKLinkedApplication setDefaultLaunchURL:](self->_linkedApplication, "setDefaultLaunchURL:", v26);
  -[PKPaymentPassDetailViewController _reloadTitle](self, "_reloadTitle");

}

- (void)_applyIvarsFromCollectedPropertiesViewModel:(id)a3
{
  id v4;
  PKPaymentPass *v5;
  PKPaymentPass *pass;
  PKTransitBalanceModel *v7;
  PKTransitBalanceModel *transitBalanceModel;
  NSDictionary *v9;
  NSDictionary *balances;
  NSDictionary *v11;
  NSDictionary *actionForBalanceIdentifier;
  PKPaymentBalanceReminder *v13;
  PKPaymentBalanceReminder *transitPropertiesBalanceReminder;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *reminderForBalanceIdentifier;
  PKTransitPassProperties *v18;
  PKTransitPassProperties *transitProperties;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  NSArray *v28;
  NSArray *commutePlanFields;
  NSArray *v30;
  NSArray *commutePlans;
  void *v32;
  const char *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD handler[4];
  id v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "pass");
  v5 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue();
  pass = self->_pass;
  self->_pass = v5;

  -[PKPaymentPassDetailViewController _applyStaticPassPropertiesForPass](self, "_applyStaticPassPropertiesForPass");
  objc_msgSend(v4, "transitBalanceModel");
  v7 = (PKTransitBalanceModel *)objc_claimAutoreleasedReturnValue();
  v35 = 1744;
  transitBalanceModel = self->_transitBalanceModel;
  self->_transitBalanceModel = v7;

  objc_msgSend(v4, "balances");
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  balances = self->_balances;
  self->_balances = v9;

  objc_msgSend(v4, "actionForBalanceIdentifier");
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  actionForBalanceIdentifier = self->_actionForBalanceIdentifier;
  self->_actionForBalanceIdentifier = v11;

  objc_msgSend(v4, "transitPropertiesBalanceReminder");
  v13 = (PKPaymentBalanceReminder *)objc_claimAutoreleasedReturnValue();
  transitPropertiesBalanceReminder = self->_transitPropertiesBalanceReminder;
  self->_transitPropertiesBalanceReminder = v13;

  objc_msgSend(v4, "reminderForBalanceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSMutableDictionary *)objc_msgSend(v15, "mutableCopy");
  reminderForBalanceIdentifier = self->_reminderForBalanceIdentifier;
  self->_reminderForBalanceIdentifier = v16;

  objc_msgSend(v4, "transitPassProperties");
  v18 = (PKTransitPassProperties *)objc_claimAutoreleasedReturnValue();
  transitProperties = self->_transitProperties;
  self->_transitProperties = v18;

  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[PKTransitBalanceModel displayableCommutePlans](self->_transitBalanceModel, "displayableCommutePlans");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v26, "title", v35);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v21, "addObject:", v26);
          objc_msgSend(v20, "addObject:", v27);
        }

      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v23);
  }

  v28 = (NSArray *)objc_msgSend(v20, "copy");
  commutePlanFields = self->_commutePlanFields;
  self->_commutePlanFields = v28;

  v30 = (NSArray *)objc_msgSend(v21, "copy");
  commutePlans = self->_commutePlans;
  self->_commutePlans = v30;

  -[PKPaymentPassDetailViewController _ingestPassFields](self, "_ingestPassFields");
  -[PKPaymentPassDetailViewController _updateExpressPassInformation](self, "_updateExpressPassInformation");
  if (self->_expressPassesInformationToken == -1
    && -[PKPaymentPassDetailViewController _showExpressDetails](self, "_showExpressDetails"))
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", self, sel__expressPassDidChange, CFSTR("PKExpressPassesViewControllerExpressPassChangedNotification"), 0);
    v33 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D69CB8], "UTF8String");
    v34 = MEMORY[0x1E0C80D38];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __81__PKPaymentPassDetailViewController__applyIvarsFromCollectedPropertiesViewModel___block_invoke;
    handler[3] = &unk_1E3E62660;
    objc_copyWeak(&v38, &location);
    notify_register_dispatch(v33, &self->_expressPassesInformationToken, MEMORY[0x1E0C80D38], handler);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  -[PKPaymentPassDetailViewController _updateDisplayableBalances](self, "_updateDisplayableBalances", v35);
  -[PKPaymentPassDetailPassActionSectionController setTransitBalanceModel:](self->_passActionSectionController, "setTransitBalanceModel:", *(Class *)((char *)&self->super.super.super.super.super.isa + v36));
  -[PKPassDetailBankConnectSectionController updatePass:](self->_bankConnectSectionController, "updatePass:", self->_pass);
  -[PKPassDetailAccountCredentialsSectionController updatePass:](self->_accountCredentialsSectionController, "updatePass:", self->_pass);
  -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 0);

}

void __81__PKPaymentPassDetailViewController__applyIvarsFromCollectedPropertiesViewModel___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_expressPassDidChange");

}

- (void)_updatePassPropertiesForPass:(id)a3
{
  -[PKPaymentPassDetailViewController _updatePassPropertiesForPass:completion:](self, "_updatePassPropertiesForPass:completion:", a3, 0);
}

- (void)_updatePassPropertiesForPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__PKPaymentPassDetailViewController__updatePassPropertiesForPass_completion___block_invoke;
  v10[3] = &unk_1E3E79608;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[PKPaymentPassDetailViewController _refreshStaleBalanceModelForPass:completion:](self, "_refreshStaleBalanceModelForPass:completion:", v8, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __77__PKPaymentPassDetailViewController__updatePassPropertiesForPass_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__PKPaymentPassDetailViewController__updatePassPropertiesForPass_completion___block_invoke_2;
    v13[3] = &unk_1E3E795E0;
    objc_copyWeak(&v15, (id *)(a1 + 48));
    v14 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "_updateDisplayableBalancesPlansAndTransitPropertiesForPass:balances:plans:transitProperties:withCompletion:", v11, v7, v8, v9, v13);

    objc_destroyWeak(&v15);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(void))(v12 + 16))();
  }

}

void __77__PKPaymentPassDetailViewController__updatePassPropertiesForPass_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_applyIvarsFromCollectedPropertiesViewModel:", v6);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)_expressPassDidChange
{
  int v3;
  int v4;
  int nfcExpressModeEnabled;
  int v6;
  id v7;

  -[PKExpressPassController existingExpressPassConfigurationForPass:](self->_expressPassController, "existingExpressPassConfigurationForPass:", self->_pass);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "isNFCExpressEnabled");
  v4 = v3;
  nfcExpressModeEnabled = self->_nfcExpressModeEnabled;
  if (nfcExpressModeEnabled != v3)
    self->_nfcExpressModeEnabled = v3;
  v6 = objc_msgSend(v7, "isUWBExpressEnabled");
  if (self->_uwbExpressModeEnabled == v6)
  {
    if (nfcExpressModeEnabled == v4)
      goto LABEL_8;
  }
  else
  {
    self->_uwbExpressModeEnabled = v6;
  }
  -[PKPaymentPassDetailViewController reloadSection:](self, "reloadSection:", 33);
LABEL_8:

}

- (void)_updateExpressPassInformation
{
  PKPaymentPass *v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  _BOOL4 nfcExpressModeEnabled;
  _BOOL4 uwbExpressModeSupported;
  _BOOL4 uwbExpressModeEnabled;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  PKPaymentPass *v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((PKIsPad() & 1) == 0)
  {
    v3 = self->_pass;
    v4 = -[PKExpressPassController isExpressModeSupportedForPass:](self->_expressPassController, "isExpressModeSupportedForPass:", v3);
    if (v4)
    {
      if (-[PKPaymentPass isHomeKeyPass](v3, "isHomeKeyPass"))
      {
        v5 = self->_radioTechnologyType & 1;
        v6 = (self->_radioTechnologyType >> 1) & 1;
      }
      else if (-[PKPaymentPass isCarKeyPass](v3, "isCarKeyPass"))
      {
        v6 = (self->_radioTechnologyType & 2) >> 1;
        LOBYTE(v5) = (self->_radioTechnologyType & 2) == 0;
      }
      else
      {
        LOBYTE(v6) = 0;
        LOBYTE(v5) = 1;
      }
      -[PKExpressPassController existingExpressPassConfigurationForPass:](self->_expressPassController, "existingExpressPassConfigurationForPass:", self->_pass);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_nfcExpressModeSupported = v5;
      self->_nfcExpressModeEnabled = objc_msgSend(v7, "isNFCExpressEnabled");
      self->_uwbExpressModeSupported = v6 & 1;
      self->_uwbExpressModeEnabled = objc_msgSend(v7, "isUWBExpressEnabled");

    }
    else
    {
      self->_nfcExpressModeSupported = -[PKExpressPassController hasEligibleExpressUpgradeRequestForPass:](self->_expressPassController, "hasEligibleExpressUpgradeRequestForPass:", self->_pass);
      self->_nfcExpressModeEnabled = 0;
      self->_uwbExpressModeSupported = 0;
      self->_uwbExpressModeEnabled = 0;
    }
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v3;
      if (self->_isCredentialedPass)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      PKRadioTechnologiesToString();
      v10 = objc_claimAutoreleasedReturnValue();
      nfcExpressModeEnabled = self->_nfcExpressModeEnabled;
      uwbExpressModeSupported = self->_uwbExpressModeSupported;
      uwbExpressModeEnabled = self->_uwbExpressModeEnabled;
      if (v4)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      if (self->_nfcExpressModeSupported)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      *(_DWORD *)buf = 138413826;
      if (nfcExpressModeEnabled)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v22 = v9;
      v3 = v20;
      if (uwbExpressModeSupported)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v23 = 2112;
      if (uwbExpressModeEnabled)
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      v24 = v10;
      v19 = (void *)v10;
      v25 = 2112;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v18;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentPassDetailViewController: Updated for express info (credentialed: %@, radio technology supported: %@, express supported: %@, nfc supported: %@, nfc enabled: %@, uwb supported: %@, uwb enabled: %@)", buf, 0x48u);

    }
  }
}

- (void)_ingestPassFields
{
  id v3;
  void *v4;
  NSArray *v5;
  NSArray *balanceFields;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  PKPaymentPassDetailViewController *v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKTransitBalanceModel balanceFields](self->_transitBalanceModel, "balanceFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  balanceFields = self->_balanceFields;
  v20 = 1352;
  self->_balanceFields = v5;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = self;
  -[PKPaymentPass backFieldBuckets](self->_pass, "backFieldBuckets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v23 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
              objc_msgSend(v16, "key", v20);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v17, "hasPrefix:", CFSTR("balance_identifier_field_")))
                objc_msgSend(v3, "addObject:", v16);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v13);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(*(id *)((char *)&v21->super.super.super.super.super.isa + v20), "count"))
  {
    v18 = objc_msgSend(v3, "copy");
    v19 = *(Class *)((char *)&v21->super.super.super.super.super.isa + v20);
    *(Class *)((char *)&v21->super.super.super.super.super.isa + v20) = (Class)v18;

  }
}

- (void)_updateDisplayableBalances
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *displayableBalanceFields;
  id v26;
  PKPaymentPassDetailViewController *v27;
  NSArray *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = self;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_balanceFields;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v7, "foreignReferenceType") == 1 || objc_msgSend(v7, "foreignReferenceType") == 2)
        {
          objc_msgSend(v7, "foreignReferenceIdentifiers");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            -[NSDictionary objectForKeyedSubscript:](v27->_balances, "objectForKeyedSubscript:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "localizedTitle");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (v10)
            {
              v12 = v10;
            }
            else
            {
              objc_msgSend(v7, "label");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (v13)
              {
                v15 = v13;
              }
              else
              {
                PKLocalizedPaymentString(CFSTR("PASS_DETAILS_DEFAULT_BALANCE_NAME"));
                v15 = (id)objc_claimAutoreleasedReturnValue();
              }
              v12 = v15;

            }
            if (v9)
            {
              objc_msgSend(v9, "formattedValue");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v16 = 0;
            }
            objc_msgSend(v7, "label");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = PKEqualObjects();

            if ((v18 & 1) == 0)
              objc_msgSend(v7, "setLabel:", v12);
            objc_msgSend(v7, "value");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = PKEqualObjects();

            if ((v20 & 1) == 0)
            {
              objc_msgSend(v7, "setUnformattedValue:", v16);
              objc_msgSend(v7, "flushCachedValue");
            }
            objc_msgSend(v7, "label");
            v21 = objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              v22 = (void *)v21;
              objc_msgSend(v7, "value");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
                objc_msgSend(v26, "addObject:", v7);
            }

          }
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v4);
  }

  v24 = objc_msgSend(v26, "copy");
  displayableBalanceFields = v27->_displayableBalanceFields;
  v27->_displayableBalanceFields = (NSArray *)v24;

}

- (void)_updateDisplayableBalancesPlansAndTransitPropertiesForPass:(id)a3 balances:(id)a4 plans:(id)a5 transitProperties:(id)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  PKTransitBalanceModel *transitBalanceModel;
  PKTransitBalanceModel *v16;
  PKTransitBalanceModel *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  PKTransitBalanceModel *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  PKPaymentPassDetailViewController *v65;
  void *v66;
  id v67;
  PKTransitBalanceModel *v68;
  id obj;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  PKTransitBalanceModel *v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v67 = a6;
  v63 = a7;
  v65 = self;
  transitBalanceModel = self->_transitBalanceModel;
  if (transitBalanceModel)
    v16 = transitBalanceModel;
  else
    v16 = (PKTransitBalanceModel *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", v12);
  v17 = v16;
  -[PKTransitBalanceModel setTransitProperties:](v16, "setTransitProperties:", v67);
  -[PKTransitBalanceModel updateWithDynamicBalances:](v17, "updateWithDynamicBalances:", v13);
  v68 = v17;
  v66 = v14;
  -[PKTransitBalanceModel updateWithDynamicCommutePlans:](v17, "updateWithDynamicCommutePlans:", v14);
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v19 = v13;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v100, v108, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v101;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v101 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
        objc_msgSend(v24, "identifiers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, v25);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v100, v108, 16);
    }
    while (v21);
  }

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[PKTransitBalanceModel displayableBalances](v68, "displayableBalances");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v97;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v97 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
        objc_msgSend(v31, "identifiers");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v31, v32);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
    }
    while (v28);
  }

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  -[PKTransitBalanceModel displayableCommutePlanBalances](v68, "displayableCommutePlanBalances");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v93;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v93 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * k);
        objc_msgSend(v38, "identifiers");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v38, v39);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
    }
    while (v35);
  }

  v64 = v18;
  v62 = (void *)objc_msgSend(v18, "copy");
  v75 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v19;
  v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v105, 16);
  if (v72)
  {
    v70 = *(_QWORD *)v89;
    v74 = (void *)*MEMORY[0x1E0D6ACB8];
    v71 = v12;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v89 != v70)
          objc_enumerationMutation(obj);
        v73 = v40;
        objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * v40), "identifiers");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        objc_msgSend(v12, "availableActions");
        v76 = (id)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v84, v104, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v85;
          do
          {
            for (m = 0; m != v43; ++m)
            {
              if (*(_QWORD *)v85 != v44)
                objc_enumerationMutation(v76);
              v46 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * m);
              objc_msgSend(v46, "associatedEnteredValueIdentifier");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = (void *)objc_msgSend(v47, "copy");
              v49 = v48;
              if (v48)
              {
                v50 = v48;
              }
              else
              {
                objc_msgSend(v46, "relevantPropertyIdentifier");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v51, "copy");
                v53 = (void *)v52;
                v54 = v74;
                if (v52)
                  v54 = (void *)v52;
                v50 = v54;

              }
              if (objc_msgSend(v41, "containsObject:", v50))
                objc_msgSend(v75, "setObject:forKeyedSubscript:", v46, v41);

            }
            v43 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v84, v104, 16);
          }
          while (v43);
        }

        v40 = v73 + 1;
        v12 = v71;
      }
      while (v73 + 1 != v72);
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v105, 16);
    }
    while (v72);
  }

  v55 = (void *)objc_msgSend(v75, "copy");
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __144__PKPaymentPassDetailViewController__updateDisplayableBalancesPlansAndTransitPropertiesForPass_balances_plans_transitProperties_withCompletion___block_invoke;
  v77[3] = &unk_1E3E79630;
  v78 = v12;
  v79 = v67;
  v80 = v68;
  v81 = v62;
  v82 = v55;
  v83 = v63;
  v56 = v55;
  v57 = v62;
  v58 = v68;
  v59 = v67;
  v60 = v12;
  v61 = v63;
  -[PKPaymentPassDetailViewController _fetchBalanceRemindersWithActionForBalanceIdentifier:transitProperties:balances:pass:withCompletion:](v65, "_fetchBalanceRemindersWithActionForBalanceIdentifier:transitProperties:balances:pass:withCompletion:", v75, v59, v57, v60, v77);

}

void __144__PKPaymentPassDetailViewController__updateDisplayableBalancesPlansAndTransitPropertiesForPass_balances_plans_transitProperties_withCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PKPaymentPassDetailCollectedProperties *v7;

  if (a1[9])
  {
    v5 = a3;
    v6 = a2;
    v7 = -[PKPaymentPassDetailCollectedProperties initWithPass:transitPassProperties:transitBalanceModel:balances:actionForBalanceIdentifier:transitPropertiesBalanceReminder:reminderForBalanceIdentifier:]([PKPaymentPassDetailCollectedProperties alloc], "initWithPass:transitPassProperties:transitBalanceModel:balances:actionForBalanceIdentifier:transitPropertiesBalanceReminder:reminderForBalanceIdentifier:", a1[4], a1[5], a1[6], a1[7], a1[8], v6, v5);

    (*(void (**)(void))(a1[9] + 16))();
  }
}

- (void)_refreshDisplayWithBalances:(id)a3 plans:(id)a4 transitProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPaymentPass *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_pass;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__PKPaymentPassDetailViewController__refreshDisplayWithBalances_plans_transitProperties___block_invoke;
  v12[3] = &unk_1E3E79658;
  objc_copyWeak(&v13, &location);
  -[PKPaymentPassDetailViewController _updateDisplayableBalancesPlansAndTransitPropertiesForPass:balances:plans:transitProperties:withCompletion:](self, "_updateDisplayableBalancesPlansAndTransitPropertiesForPass:balances:plans:transitProperties:withCompletion:", v11, v8, v9, v10, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __89__PKPaymentPassDetailViewController__refreshDisplayWithBalances_plans_transitProperties___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_applyIvarsFromCollectedPropertiesViewModel:", v5);

}

- (void)_handleUpdatedBalanceReminder:(id)a3 forBalanceWithIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSMutableDictionary *reminderForBalanceIdentifier;
  NSObject *v11;
  uint8_t *v12;
  __int16 v13;
  __int16 v14;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    -[NSMutableDictionary objectForKey:](self->_reminderForBalanceIdentifier, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      reminderForBalanceIdentifier = self->_reminderForBalanceIdentifier;
      if (v7)
        -[NSMutableDictionary setObject:forKeyedSubscript:](reminderForBalanceIdentifier, "setObject:forKeyedSubscript:", v7, v8);
      else
        -[NSMutableDictionary removeObjectForKey:](reminderForBalanceIdentifier, "removeObjectForKey:", v8);
      goto LABEL_10;
    }
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v12 = (uint8_t *)&v14;
LABEL_13:
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Received unknown balance reminder update.", v12, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!self->_transitProperties)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      v12 = (uint8_t *)&v13;
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  objc_storeStrong((id *)&self->_transitPropertiesBalanceReminder, a3);
LABEL_10:
  -[PKPaymentPassDetailViewController reloadSection:](self, "reloadSection:", 30);
LABEL_15:

}

- (void)_fetchBalanceRemindersWithActionForBalanceIdentifier:(id)a3 transitProperties:(id)a4 balances:(id)a5 pass:(id)a6 withCompletion:(id)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  PKPaymentDataProvider *paymentServiceDataProvider;
  PKPaymentPassDetailViewController *v21;
  id v22;
  id v23;
  PKPaymentDataProvider *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  uint64_t *v34;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v26 = a4;
  v30 = a5;
  v29 = a6;
  v12 = a7;
  if (v12)
  {
    v25 = v12;
    v13 = dispatch_group_create();
    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__64;
    v50 = __Block_byref_object_dispose__64;
    v51 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      objc_msgSend(v27, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v43 != v16)
              objc_enumerationMutation(v14);
            v18 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v30, "objectForKeyedSubscript:", v18, v25);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              dispatch_group_enter(v13);
              paymentServiceDataProvider = self->_paymentServiceDataProvider;
              v38[0] = MEMORY[0x1E0C809B0];
              v38[1] = 3221225472;
              v38[2] = __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke;
              v38[3] = &unk_1E3E79680;
              v21 = self;
              v22 = v19;
              v39 = v22;
              v40 = v28;
              v41 = v13;
              v23 = v22;
              self = v21;
              -[PKPaymentDataProvider balanceReminderThresholdForBalance:pass:withCompletion:](paymentServiceDataProvider, "balanceReminderThresholdForBalance:pass:withCompletion:", v23, v29, v38);

            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        }
        while (v15);
      }

      if (v26)
      {
        dispatch_group_enter(v13);
        v24 = self->_paymentServiceDataProvider;
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_3;
        v35[3] = &unk_1E3E796A8;
        v37 = &v46;
        v36 = v13;
        -[PKPaymentDataProvider balanceReminderThresholdForBalance:pass:withCompletion:](v24, "balanceReminderThresholdForBalance:pass:withCompletion:", 0, v29, v35);

      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_5;
      block[3] = &unk_1E3E71D38;
      v33 = v25;
      v34 = &v46;
      v32 = v28;
      dispatch_group_notify(v13, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      (*((void (**)(id, uint64_t, id))v25 + 2))(v25, v47[5], v28);
    }
    _Block_object_dispose(&v46, 8);

    v12 = v25;
  }

}

void __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(a1[4], "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_2;
  v8[3] = &unk_1E3E62460;
  v9 = v3;
  v10 = v5;
  v11 = a1[5];
  v12 = a1[6];
  v6 = v5;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  __int128 v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_4;
  block[3] = &unk_1E3E792A0;
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v9 = v6;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __137__PKPaymentPassDetailViewController__fetchBalanceRemindersWithActionForBalanceIdentifier_transitProperties_balances_pass_withCompletion___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
}

- (unint64_t)_accountFeature
{
  unint64_t result;

  result = -[PKAccount feature](self->_account, "feature");
  if (!result)
    return -[PKPaymentPass associatedAccountFeatureIdentifier](self->_pass, "associatedAccountFeatureIdentifier");
  return result;
}

- (void)_fetchMerchantTokens
{
  id v3;
  PKPaymentWebService *webService;
  _QWORD v5[4];
  id v6;
  id location;

  if (-[PKPaymentPass hasMerchantTokens](self->_pass, "hasMerchantTokens"))
  {
    if (!self->_merchantTokensResponse)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0D675B0]);
      objc_msgSend(v3, "setPass:", self->_pass);
      objc_initWeak(&location, self);
      webService = self->_webService;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __57__PKPaymentPassDetailViewController__fetchMerchantTokens__block_invoke;
      v5[3] = &unk_1E3E75B00;
      objc_copyWeak(&v6, &location);
      -[PKPaymentWebService retrieveMerchantTokensWithRequest:completion:](webService, "retrieveMerchantTokensWithRequest:completion:", v3, v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);

    }
  }
}

void __57__PKPaymentPassDetailViewController__fetchMerchantTokens__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PKPaymentPassDetailViewController__fetchMerchantTokens__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __57__PKPaymentPassDetailViewController__fetchMerchantTokens__block_invoke_2(uint64_t a1)
{
  char *WeakRetained;
  _QWORD *v3;
  void *v4;
  id *v5;
  void *v6;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      v5 = (id *)(WeakRetained + 2000);
      if (!v3[250])
      {
        v6 = v3;
        objc_storeStrong(v5, v4);
        objc_msgSend(v6, "_reloadMerchantTokenRows");
        v3 = v6;
      }
    }
  }

}

- (void)_reloadMerchantTokenRows
{
  -[PKDynamicTableViewController reloadRow:inSectionWithSectionIdentifier:](self, "reloadRow:inSectionWithSectionIdentifier:", 0, CFSTR("MerchantTokens"));
  -[PKDynamicTableViewController reloadRow:inSectionWithSectionIdentifier:](self, "reloadRow:inSectionWithSectionIdentifier:", 0, CFSTR("AccountServiceMerchantTokens"));
  -[PKDynamicTableViewController reloadRow:inSectionWithSectionIdentifier:](self, "reloadRow:inSectionWithSectionIdentifier:", 0, CFSTR("PeerPaymentMerchantTokens"));
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  UISegmentedControl *tabBar;
  uint64_t v6;
  int v7;
  BOOL v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *pass;
  void *v14;
  int v15;
  _BOOL4 v16;
  void *v17;
  PKAccount *account;
  PKAccount *v19;
  BOOL v20;
  PKAccount *v21;
  PKAccount *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  int v27;
  BOOL v28;
  PKPeerPaymentAccount *peerPaymentAccount;
  int v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  int v37;
  char v38;
  PKGroup *group;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  int v44;
  int64_t detailViewStyle;
  void *v46;
  char v47;
  char v48;
  BOOL v49;
  PKPeerPaymentAccount *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  NSUInteger v57;
  char v58;
  char v59;
  NSObject *v60;
  void *v61;
  char v62;
  void *v63;
  int v64;
  uint64_t v65;
  uint8_t buf[16];

  tabBar = self->_tabBar;
  if (tabBar)
    v6 = -[UISegmentedControl selectedSegmentIndex](tabBar, "selectedSegmentIndex");
  else
    v6 = 0;
  if (-[PKPaymentPass activationState](self->_pass, "activationState"))
    v7 = -[PKPaymentPass isShellPass](self->_pass, "isShellPass");
  else
    v7 = 1;
  switch(a3)
  {
    case 0uLL:
      if (v6)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController _shouldShowActionWidgets](self, "_shouldShowActionWidgets");
    case 1uLL:
      if (v6)
        goto LABEL_291;
      -[PKPaymentPass storeIdentifiers](self->_pass, "storeIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      goto LABEL_239;
    case 2uLL:
      if (v6 || !self->_peerPaymentAccount || !self->_peerPaymentAccountResolutionController)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController _shouldShowAccountActions](self, "_shouldShowAccountActions");
    case 3uLL:
      if (v6)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController _shouldShowAccessPersonInformation](self, "_shouldShowAccessPersonInformation");
    case 4uLL:
      if (v6 || !-[PKPaymentPass isAccessPass](self->_pass, "isAccessPass"))
        goto LABEL_291;
      -[PKPaymentPass cardHolderPicture](self->_pass, "cardHolderPicture");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_167;
      LODWORD(pass) = !-[PKConfigurablePassDetailSectionsController hasArbitraryInfoField:](self->_configurableSectionController, "hasArbitraryInfoField:", *MEMORY[0x1E0D6A6B0]);
      goto LABEL_168;
    case 5uLL:
      if (v6)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController shouldShowIdentityDocumentSection](self, "shouldShowIdentityDocumentSection");
    case 6uLL:
      if (v6)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController shouldShowReplaceBiometricSection](self, "shouldShowReplaceBiometricSection");
    case 7uLL:
      if (v6)
        goto LABEL_291;
      -[PKPaymentPass barcode](self->_pass, "barcode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_71;
    case 8uLL:
      if (v6)
        v15 = 0;
      else
        v15 = v7;
      if (v15 != 1)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController _shouldShowAutomaticPresentation](self, "_shouldShowAutomaticPresentation");
    case 9uLL:
      if (v6)
        goto LABEL_291;
      return -[PKPaymentPass isCarKeyPass](self->_pass, "isCarKeyPass");
    case 0xAuLL:
      if ((-[PKPaymentPass isAccessPass](self->_pass, "isAccessPass") & 1) != 0 || self->_isCredentialedPass)
        v16 = self->_nfcExpressModeSupported || self->_uwbExpressModeSupported;
      else
        v16 = 0;
      if (v6)
        v56 = 0;
      else
        v56 = v7;
      if (v56 != 1 || (PKRunningInViewService() & 1) != 0)
        goto LABEL_291;
      LODWORD(pass) = v16 & (PKRunningInLockScreenPlugin() ^ 1);
      return (char)pass;
    case 0xBuLL:
      if (v6)
        goto LABEL_291;
      -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_pass, "associatedAccountServiceAccountIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "length")
        || -[PKPaymentPassDetailViewController _shouldShowServicingSection](self, "_shouldShowServicingSection"))
      {
        goto LABEL_167;
      }
      LOBYTE(pass) = -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature") != 4;
      goto LABEL_168;
    case 0xCuLL:
      if (v6 || !-[PKPaymentPassDetailViewController _shouldShowServicingSection](self, "_shouldShowServicingSection"))
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController shouldShowAccountUsersSection](self, "shouldShowAccountUsersSection");
    case 0xDuLL:
      if (v6)
        goto LABEL_291;
      -[PKAccount creditDetails](self->_account, "creditDetails");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "installmentPlans");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(pass) = objc_msgSend(v17, "count")
                  && -[PKPaymentPassDetailViewController _shouldShowServicingSection](self, "_shouldShowServicingSection")&& (-[PKAccount blockAllAccountAccess](self->_account, "blockAllAccountAccess") & 1) == 0&& -[PKAccount state](self->_account, "state") != 3;
      goto LABEL_53;
    case 0xEuLL:
      if (v6)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController _shouldShowCardNumbersSection](self, "_shouldShowCardNumbersSection");
    case 0xFuLL:
      if (v6)
        goto LABEL_291;
      account = self->_account;
      if (!account)
        goto LABEL_291;
      -[PKAccount creditDetails](account, "creditDetails");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12 || !-[PKAccount supportsShowAccountSummary](self->_account, "supportsShowAccountSummary"))
        goto LABEL_167;
      goto LABEL_66;
    case 0x10uLL:
      if (v6)
        goto LABEL_291;
      v19 = self->_account;
      if (!v19)
        goto LABEL_291;
      -[PKAccount creditDetails](v19, "creditDetails");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12
        || !-[PKAccount supportsShowAccountSummary](self->_account, "supportsShowAccountSummary")
        || !-[PKPaymentPassDetailViewController _shouldShowServicingSection](self, "_shouldShowServicingSection"))
      {
        goto LABEL_167;
      }
LABEL_66:
      v20 = +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", self->_transactionSourceCollection, self->_account);
      goto LABEL_99;
    case 0x11uLL:
      if (v6
        || (-[PKPaymentPass hasMerchantTokens](self->_pass, "hasMerchantTokens") & 1) == 0
        && !-[PKPaymentPass hadMerchantTokens](self->_pass, "hadMerchantTokens"))
      {
        goto LABEL_291;
      }
      -[PKAccount creditDetails](self->_account, "creditDetails");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_71:
      LOBYTE(pass) = v14 != 0;
      goto LABEL_311;
    case 0x12uLL:
      if (v6
        || !self->_account
        || !-[PKPaymentPassDetailViewController _shouldShowProductBenefitsCell](self, "_shouldShowProductBenefitsCell"))
      {
        goto LABEL_291;
      }
      goto LABEL_221;
    case 0x13uLL:
      if (v6
        || !-[PKPaymentPassDetailViewController _accountInGoodStateForAMPEligbilityCheck](self, "_accountInGoodStateForAMPEligbilityCheck"))
      {
        goto LABEL_291;
      }
      v8 = !self->_isAmpEligible;
      goto LABEL_79;
    case 0x14uLL:
      if (v6)
        goto LABEL_291;
      v21 = self->_account;
      if (!v21
        || !-[PKAccount supportsRedeemRewards](v21, "supportsRedeemRewards")
        || !self->_allowStatementCreditRedemption && !self->_cashbackResolution)
      {
        goto LABEL_291;
      }
      if (!+[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", self->_transactionSourceCollection, self->_account)|| !-[PKPaymentPassDetailViewController _shouldShowServicingSection](self, "_shouldShowServicingSection"))
      {
        goto LABEL_291;
      }
      if (-[PKAccount accessLevel](self->_account, "accessLevel") != 2 || self->_peerPaymentAccount)
        goto LABEL_245;
      -[PKFamilyMemberCollection currentUser](self->_familyCollection, "currentUser");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(pass) = objc_msgSend(v10, "memberType") == 0;
      goto LABEL_252;
    case 0x15uLL:
      if (v6)
        goto LABEL_291;
      v22 = self->_account;
      if (!v22)
        goto LABEL_291;
      -[PKAccount creditDetails](v22, "creditDetails");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12
        || !self->_physicalCardController
        || -[PKPaymentPassDetailViewController _numberOfAccountServicePhysicalCardRowsEnabled](self, "_numberOfAccountServicePhysicalCardRowsEnabled") < 1|| !+[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", self->_transactionSourceCollection, self->_account))
      {
        goto LABEL_167;
      }
      v20 = -[PKPaymentPassDetailViewController _shouldShowServicingSection](self, "_shouldShowServicingSection");
LABEL_99:
      LOBYTE(pass) = v20;
      goto LABEL_168;
    case 0x16uLL:
      -[PKPaymentPassDetailViewController traitCollection](self, "traitCollection");
      pass = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(pass, "userInterfaceIdiom");

      LOBYTE(pass) = 0;
      if ((v23 & 0xFFFFFFFFFFFFFFFBLL) != 0 || v6 || ((v7 ^ 1) & 1) != 0)
        return (char)pass;
      if ((objc_opt_respondsToSelector() & 1) == 0
        || !-[PKPaymentDataProvider supportsMessagesForPass:](self->_paymentServiceDataProvider, "supportsMessagesForPass:", self->_pass))
      {
        goto LABEL_291;
      }
      -[PKPaymentPass messageServiceURL](self->_pass, "messageServiceURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_167;
      -[PKPaymentPass messagePushTopic](self->_pass, "messagePushTopic");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(pass) = v24 != 0;

      goto LABEL_168;
    case 0x17uLL:
      -[PKTransitPassProperties felicaProperties](self->_transitProperties, "felicaProperties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v25;
      if (v25)
        v26 = v6 == 0;
      else
        v26 = 0;
      if (v26)
        LOBYTE(pass) = objc_msgSend(v25, "hasGreenCarTicket");
      else
        LOBYTE(pass) = 0;
      goto LABEL_252;
    case 0x18uLL:
    case 0x1BuLL:
      if (v6)
        goto LABEL_291;
      v8 = self->_peerPaymentAccount == 0;
LABEL_79:
      if (v8)
        LOBYTE(pass) = 0;
      else
        LOBYTE(pass) = v7;
      return (char)pass;
    case 0x19uLL:
      if (v6)
        goto LABEL_291;
      v27 = self->_peerPaymentAccount ? v7 : 0;
      if (v27 != 1)
        goto LABEL_291;
      v28 = self->_detailViewStyle == 2;
      goto LABEL_147;
    case 0x1AuLL:
      if (v6)
        goto LABEL_291;
      peerPaymentAccount = self->_peerPaymentAccount;
      if (!peerPaymentAccount)
        goto LABEL_291;
      if (self->_loadingPeerPaymentPreferences)
      {
        if (!v7)
        {
LABEL_291:
          LOBYTE(pass) = 0;
          return (char)pass;
        }
      }
      else
      {
        if (self->_peerPaymentPreferences)
          v59 = v7;
        else
          v59 = 0;
        if ((v59 & 1) == 0)
          goto LABEL_291;
      }
      if (-[PKPeerPaymentAccount state](peerPaymentAccount, "state") == 3)
        goto LABEL_291;
      v28 = -[PKPeerPaymentAccount state](self->_peerPaymentAccount, "state") == 4;
LABEL_147:
      LOBYTE(pass) = !v28;
      return (char)pass;
    case 0x1CuLL:
      if (v6)
        v30 = 0;
      else
        v30 = v7;
      if (v30 != 1
        || -[PKPaymentPass contactlessActivationGroupingType](self->_pass, "contactlessActivationGroupingType") != 2)
      {
        goto LABEL_291;
      }
      return -[PKPaymentPass hasContactlessDevicePaymentApplicationsAvailable](self->_pass, "hasContactlessDevicePaymentApplicationsAvailable");
    case 0x1DuLL:
      if (v6
        || !-[PKPaymentPassDetailViewController _isShowingLostModeInterface](self, "_isShowingLostModeInterface")
        && v7 == 1
        || !self->_detailViewStyle)
      {
        goto LABEL_291;
      }
      pass = self->_pass;
      -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "secureElementIdentifiers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(pass) = objc_msgSend(pass, "isPrecursorPass:", v31) ^ 1;

      goto LABEL_252;
    case 0x1EuLL:
      if (v6
        || (-[PKPaymentPass isStoredValuePass](self->_pass, "isStoredValuePass") & 1) == 0
        && !-[PKPaymentPass isAccessPass](self->_pass, "isAccessPass")
        || -[PKPaymentPass activationState](self->_pass, "activationState"))
      {
        goto LABEL_291;
      }
      if (-[NSArray count](self->_displayableBalanceFields, "count"))
        goto LABEL_245;
      v32 = -[NSArray count](self->_commutePlanFields, "count");
LABEL_142:
      v28 = v32 == 0;
      goto LABEL_147;
    case 0x1FuLL:
      if (v6)
        goto LABEL_291;
      v32 = -[PKPaymentPassDetailViewController _contactBankCellWithOutput:forRowIndex:tableView:](self, "_contactBankCellWithOutput:forRowIndex:tableView:", 0, 0, 0);
      goto LABEL_142;
    case 0x20uLL:
      if (v6
        || (-[PKPaymentPass hasMerchantTokens](self->_pass, "hasMerchantTokens") & 1) == 0
        && !-[PKPaymentPass hadMerchantTokens](self->_pass, "hadMerchantTokens"))
      {
        goto LABEL_291;
      }
      v28 = self->_peerPaymentAccount == 0;
      goto LABEL_147;
    case 0x21uLL:
      if (v6
        || (-[PKPaymentPass isAccessPass](self->_pass, "isAccessPass") & 1) != 0
        || self->_isCredentialedPass
        || !-[PKPaymentPassDetailViewController _cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:", 0, 0, 0))
      {
        goto LABEL_291;
      }
      if (!self->_account)
        goto LABEL_245;
      return +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", self->_transactionSourceCollection);
    case 0x22uLL:
      if (v6
        || (-[PKPaymentPass isTransitPass](self->_pass, "isTransitPass") & 1) != 0
        || (-[PKPaymentPass isAccessPass](self->_pass, "isAccessPass") & 1) != 0
        || (-[PKPaymentPass isIdentityPass](self->_pass, "isIdentityPass") & 1) != 0
        || (-[PKPaymentPass supportsBarcodePayment](self->_pass, "supportsBarcodePayment") & 1) != 0
        || (-[PKPaymentPass isEMoneyPass](self->_pass, "isEMoneyPass") & 1) != 0
        || self->_isCredentialedPass
        || self->_peerPaymentAccount)
      {
        goto LABEL_291;
      }
      -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_pass, "associatedAccountServiceAccountIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 && self->_detailViewStyle != 2
        || -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature") == 4)
      {
LABEL_167:
        LOBYTE(pass) = 0;
      }
      else
      {
        -[PKPaymentPass deviceAccountNumberSuffix](self->_pass, "deviceAccountNumberSuffix");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length"))
        {
          LODWORD(pass) = !-[PKPaymentPassDetailViewController _shouldShowCardNumbersSection](self, "_shouldShowCardNumbersSection");
        }
        else
        {
          -[PKPaymentPass sanitizedDeviceAccountNumber](self->_pass, "sanitizedDeviceAccountNumber");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v61, "length"))
            LODWORD(pass) = !-[PKPaymentPassDetailViewController _shouldShowCardNumbersSection](self, "_shouldShowCardNumbersSection");
          else
            LOBYTE(pass) = 0;

        }
LABEL_53:

      }
LABEL_168:

      return (char)pass;
    case 0x23uLL:
      if (v6
        || (-[PKPaymentPass hasMerchantTokens](self->_pass, "hasMerchantTokens") & 1) == 0
        && !-[PKPaymentPass hadMerchantTokens](self->_pass, "hadMerchantTokens"))
      {
        goto LABEL_291;
      }
      -[PKAccount creditDetails](self->_account, "creditDetails");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        LOBYTE(pass) = 0;
      else
        LOBYTE(pass) = self->_peerPaymentAccount == 0;
LABEL_311:

      return (char)pass;
    case 0x24uLL:
      -[PKFamilyMemberCollection familyMembersByAltDSID](self->_familyCollection, "familyMembersByAltDSID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentAccount altDSID](self->_peerPaymentAccount, "altDSID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKey:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v35, "isOrganizer") & 1) != 0)
        v36 = 1;
      else
        v36 = objc_msgSend(v35, "isParent");
      v65 = -[PKPeerPaymentAccount role](self->_peerPaymentAccount, "role");
      v64 = -[PKPeerPaymentAccount supportsFamilySharing](self->_peerPaymentAccount, "supportsFamilySharing");
      detailViewStyle = self->_detailViewStyle;
      if (detailViewStyle != 2)
      {
        v48 = 1;
        goto LABEL_297;
      }
      v63 = v35;
      v62 = v36;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[PKPaymentDataProvider deviceVersion](self->_paymentServiceDataProvider, "deviceVersion");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v46 = 0;
      }
      objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "account");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "supportsFamilySharingFeatureDescriptor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "osVersionRange");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        if (!v55 && (PKPeerPaymentSkipFamilySharingVersionCheck() & 1) == 0)
        {
          PKLogFacilityTypeGetObject();
          v60 = objc_claimAutoreleasedReturnValue();
          v35 = v63;
          v36 = v62;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v60, OS_LOG_TYPE_DEFAULT, "The server has not populated the minimum version requirement for familySharing. Assuming that the targetDevice is the correct version", buf, 2u);
          }

          v48 = 1;
LABEL_296:

LABEL_297:
          if (v6)
          {
            LOBYTE(pass) = 0;
          }
          else
          {
            v57 = -[NSArray count](self->_sortedFamilyMemberRowModels, "count");
            LOBYTE(pass) = 0;
            if (detailViewStyle)
            {
              if (v57)
              {
                LOBYTE(pass) = 0;
                if (self->_peerPaymentAccount)
                {
                  if (((v7 ^ 1) & 1) == 0 && !v65 && ((v64 ^ 1) & 1) == 0)
                  {
                    if (self->_familyCollection)
                      v58 = v36;
                    else
                      v58 = 0;
                    LOBYTE(pass) = v58 & v48;
                  }
                }
              }
            }
          }

          return (char)pass;
        }
        v48 = objc_msgSend(v55, "versionMeetsRequirements:deviceClass:", v46, CFSTR("Watch"));
      }
      else
      {
        v48 = 0;
      }
      v35 = v63;
      v36 = v62;
      goto LABEL_296;
    case 0x25uLL:
      if (v6 == self->_hasTabBar)
        v37 = v7;
      else
        v37 = 0;
      if (v37 != 1
        || !self->_allContentIsLoaded
        || (objc_opt_respondsToSelector() & 1) == 0
        || !-[PKPaymentDataProvider supportsTransactionsForPass:](self->_paymentServiceDataProvider, "supportsTransactionsForPass:", self->_pass)|| !self->_detailViewStyle)
      {
        goto LABEL_291;
      }
      if (self->_peerPaymentAccount
        || (-[PKPaymentPass supportsDPANNotifications](self->_pass, "supportsDPANNotifications") & 1) != 0
        || (-[PKPaymentPass supportsFPANNotifications](self->_pass, "supportsFPANNotifications") & 1) != 0
        || (-[PKPaymentApplication generatesLocalTransactions](self->_defaultPaymentApplication, "generatesLocalTransactions") & 1) != 0)
      {
        goto LABEL_245;
      }
      if (!self->_account)
        goto LABEL_291;
      return +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", self->_transactionSourceCollection);
    case 0x26uLL:
      if (v6 != 1
        || !self->_allContentIsLoaded
        || !-[PKPaymentDataProvider supportsTransactionsForPass:](self->_paymentServiceDataProvider, "supportsTransactionsForPass:", self->_pass)|| -[PKPaymentPassDetailViewController shouldMapSection:](self, "shouldMapSection:", 39)|| (-[PKPaymentPass supportsFPANNotifications](self->_pass, "supportsFPANNotifications") & 1) != 0)
      {
        goto LABEL_291;
      }
      v38 = -[PKPaymentPass supportsDPANNotifications](self->_pass, "supportsDPANNotifications");
      goto LABEL_250;
    case 0x27uLL:
      if (!self->_allContentIsLoaded)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController _shouldShowTransactionsSection](self, "_shouldShowTransactionsSection");
    case 0x28uLL:
      if (v6 != 1 || !-[NSArray count](self->_transactionCountAndYear, "count"))
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController shouldMapSection:](self, "shouldMapSection:", 39);
    case 0x29uLL:
      if (v6)
        goto LABEL_291;
      group = self->_group;
      if (!group)
        goto LABEL_291;
      LOBYTE(pass) = (unint64_t)-[PKGroup passCount](group, "passCount") > 1;
      return (char)pass;
    case 0x2AuLL:
      if (v6
        || !-[PKPaymentPassDetailViewController _shouldShowBillingAddressCell](self, "_shouldShowBillingAddressCell"))
      {
        goto LABEL_291;
      }
      if (!self->_account)
        goto LABEL_245;
      if (!self->_loadingBillingContact && !self->_billingContact
        || !-[PKPaymentPassDetailViewController _shouldShowServicingSection](self, "_shouldShowServicingSection"))
      {
        goto LABEL_291;
      }
      if (self->_account)
        return +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", self->_transactionSourceCollection);
LABEL_245:
      LOBYTE(pass) = 1;
      return (char)pass;
    case 0x2BuLL:
      if (v6)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController shouldShowEligibleSpendSection](self, "shouldShowEligibleSpendSection");
    case 0x2CuLL:
      if (v6)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController shouldShowFinancingPlanListSection](self, "shouldShowFinancingPlanListSection");
    case 0x2DuLL:
      if (v6)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController shouldShowPersonalInformationSection](self, "shouldShowPersonalInformationSection");
    case 0x2EuLL:
      if (v6
        || !self->_account
        || !-[PKPaymentPassDetailViewController _shouldShowNetworkBenefitsCell](self, "_shouldShowNetworkBenefitsCell"))
      {
        goto LABEL_291;
      }
LABEL_221:
      if (!+[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", self->_transactionSourceCollection, self->_account))goto LABEL_291;
      return -[PKPaymentPassDetailViewController _shouldShowServicingSection](self, "_shouldShowServicingSection");
    case 0x2FuLL:
      if (v6
        || !self->_peerPaymentAccount
        || !self->_peerPaymentAccountResolutionController
        || -[PKPaymentPassDetailViewController _shouldShowAccountActions](self, "_shouldShowAccountActions")
        || (-[PKPaymentPassDetailViewController _canDoManualIdentityVerification](self, "_canDoManualIdentityVerification") & v7) != 1)
      {
        goto LABEL_291;
      }
      v28 = -[PKPeerPaymentAccount role](self->_peerPaymentAccount, "role") == 1;
      goto LABEL_147;
    case 0x30uLL:
      -[PKFamilyMemberCollection familyMembersByAltDSID](self->_familyCollection, "familyMembersByAltDSID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentAccount altDSID](self->_peerPaymentAccount, "altDSID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKey:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = -[PKPeerPaymentAccount state](self->_peerPaymentAccount, "state") == 1
         && -[PKPeerPaymentAccount stage](self->_peerPaymentAccount, "stage") == 3;
      if (-[PKPeerPaymentAccount isParticipantAccountLockedByOwner](self->_peerPaymentAccount, "isParticipantAccountLockedByOwner"))v47 = -[PKPeerPaymentAccount supportsGraduationWhileAssociatedAccountLocked](self->_peerPaymentAccount, "supportsGraduationWhileAssociatedAccountLocked");
      else
        v47 = 0;
      if (PKIsAltAccountPairedOrPairing())
        v49 = self->_detailViewStyle != 2;
      else
        v49 = 1;
      if (v6)
        goto LABEL_266;
      v50 = self->_peerPaymentAccount;
      if (!v50)
        goto LABEL_266;
      v51 = self->_peerPaymentAccountResolutionController ? v7 : 0;
      if (v51 != 1 || -[PKPeerPaymentAccount role](v50, "role") != 1)
        goto LABEL_266;
      LOBYTE(pass) = 0;
      if (self->_familyCollection && v42)
      {
        if (objc_msgSend(v42, "memberType")
          || !-[PKPeerPaymentAccount supportsFamilySharing](self->_peerPaymentAccount, "supportsFamilySharing"))
        {
LABEL_266:
          LOBYTE(pass) = 0;
        }
        else
        {
          LOBYTE(pass) = v49 & (v47 | v43);
        }
      }

      return (char)pass;
    case 0x31uLL:
      if (PKIsAltAccountPairedOrPairing() && self->_detailViewStyle == 2)
        goto LABEL_291;
      if (v6 != self->_hasTabBar)
        goto LABEL_291;
      v44 = self->_peerPaymentAccount ? v7 : 0;
      if (v44 != 1)
        goto LABEL_291;
      PKPrimaryAppleAccountEmail();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");
LABEL_239:
      LOBYTE(pass) = v11 != 0;
LABEL_252:

      return (char)pass;
    case 0x32uLL:
      if (v6)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController shouldShowVerifySSNSection](self, "shouldShowVerifySSNSection");
    case 0x33uLL:
      if (v6)
        goto LABEL_291;
      if (-[PKPaymentPassDetailViewController _shouldShowTermsCell](self, "_shouldShowTermsCell")
        || -[PKPaymentPassDetailViewController _shouldShowPrivacyPolicyCell](self, "_shouldShowPrivacyPolicyCell"))
      {
        goto LABEL_245;
      }
      return -[PKPaymentPassDetailViewController passSupportsDeviceAssessment](self, "passSupportsDeviceAssessment");
    case 0x34uLL:
      if (v6)
        goto LABEL_291;
      return -[PKPaymentPassDetailViewController shouldShowAccountUserStopSharingSection](self, "shouldShowAccountUserStopSharingSection");
    case 0x35uLL:
      if (v6)
        goto LABEL_291;
      v38 = -[PKPaymentPass isHomeKeyPass](self->_pass, "isHomeKeyPass");
LABEL_250:
      LOBYTE(pass) = v38 ^ 1;
      return (char)pass;
    default:
      goto LABEL_291;
  }
}

- (BOOL)_shouldShowTransactionsSection
{
  UISegmentedControl *tabBar;
  uint64_t v4;
  int v5;

  tabBar = self->_tabBar;
  if (!tabBar)
  {
    -[PKPaymentPassDetailViewController _isBankConnectLinked](self, "_isBankConnectLinked");
    goto LABEL_16;
  }
  v4 = -[UISegmentedControl selectedSegmentIndex](tabBar, "selectedSegmentIndex");
  if (!-[PKPaymentPassDetailViewController _isBankConnectLinked](self, "_isBankConnectLinked"))
  {
    if (v4 == 1)
    {
      v5 = -[PKPaymentDataProvider supportsTransactionsForPass:](self->_paymentServiceDataProvider, "supportsTransactionsForPass:", self->_pass);
      if (!v5)
        return v5;
      if (self->_peerPaymentAccount
        || ((-[PKPaymentPass supportsFPANNotifications](self->_pass, "supportsFPANNotifications") & 1) != 0
         || (-[PKPaymentPass supportsDPANNotifications](self->_pass, "supportsDPANNotifications") & 1) != 0
         || (-[PKPaymentPass isStoredValuePass](self->_pass, "isStoredValuePass") & 1) != 0
         || -[PKPaymentPass isIdentityPass](self->_pass, "isIdentityPass"))
        && (-[PKPaymentPass settings](self->_pass, "settings") & 8) != 0)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      if (self->_account)
      {
        LOBYTE(v5) = +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", self->_transactionSourceCollection);
        return v5;
      }
    }
LABEL_16:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (v4 != 1)
    goto LABEL_16;
  LOBYTE(v5) = -[PKPaymentPassDetailViewController _transactionsCount](self, "_transactionsCount") != 0;
  return v5;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextColor, a3);
  -[PKPaymentPassDetailViewController _decorateSections](self, "_decorateSections");
}

- (void)setDetailTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextColor, a3);
  -[PKPaymentPassDetailViewController _decorateSections](self, "_decorateSections");
}

- (void)setLinkTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_linkTextColor, a3);
  -[PKPaymentPassDetailViewController _decorateSections](self, "_decorateSections");
}

- (void)setWarningTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_warningTextColor, a3);
  -[PKPaymentPassDetailViewController _decorateSections](self, "_decorateSections");
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
  -[PKPaymentPassDetailViewController _decorateSections](self, "_decorateSections");
}

- (void)reloadData:(BOOL)a3
{
  void *v4;
  PKPaymentPassDetailWrapperSectionController *paymentPassDetailSectionController;
  void *v6;
  NSArray *sectionControllers;
  id v8;

  -[PKPaymentPassDetailViewController viewIfLoaded](self, "viewIfLoaded", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPaymentPassDetailViewController _updateSectionControllersWithSelectedSectionSegment](self, "_updateSectionControllersWithSelectedSectionSegment");
    paymentPassDetailSectionController = self->_paymentPassDetailSectionController;
    -[PKPaymentPassDetailViewController _recomputeMappedSections](self, "_recomputeMappedSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailWrapperSectionController setSectionIdentifiers:](paymentPassDetailSectionController, "setSectionIdentifiers:", v6);

    sectionControllers = self->_sectionControllers;
    -[PKPaymentPassDetailViewController _activeOrderOfSectionIdentifiers](self, "_activeOrderOfSectionIdentifiers");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PKDynamicTableViewController setSectionControllers:sectionIdentifiers:](self, "setSectionControllers:sectionIdentifiers:", sectionControllers, v8);

  }
}

- (void)reloadSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentPassDetailViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController reloadPassDetailSections:](self, "reloadPassDetailSections:", v7);

  }
}

- (void)reloadPassDetailSections:(id)a3
{
  id v4;
  void *v5;
  PKSettingTableCell *transactionsSwitch;
  PKSettingTableCell *notificationsSwitch;
  PKSettingTableCell *dailyCashSwitch;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  PKPaymentPassDetailWrapperSectionController *paymentPassDetailSectionController;
  void *v23;
  void *v24;
  id v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentPassDetailViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v4, "containsObject:", &unk_1E3FADD08))
    {
      transactionsSwitch = self->_transactionsSwitch;
      self->_transactionsSwitch = 0;

      notificationsSwitch = self->_notificationsSwitch;
      self->_notificationsSwitch = 0;

      dailyCashSwitch = self->_dailyCashSwitch;
      self->_dailyCashSwitch = 0;

    }
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v25 = v4;
      v13 = 0;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v10);
          v16 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "unsignedIntegerValue");
          PKPassDetailSectionTypeToString(v16);
          v17 = objc_claimAutoreleasedReturnValue();
          if (!v17)
            __break(1u);
          v18 = (void *)v17;
          v19 = -[PKDynamicTableViewController hasSectionForSectionIdentifier:](self, "hasSectionForSectionIdentifier:", v17);
          v20 = -[PKPaymentPassDetailViewController shouldMapSection:](self, "shouldMapSection:", v16);
          if (!v19 || !v20)
            v13 |= v19 ^ v20;
          else
            objc_msgSend(v9, "addObject:", v18);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v12);

      v4 = v25;
      if ((v13 & 1) != 0)
      {
        paymentPassDetailSectionController = self->_paymentPassDetailSectionController;
        -[PKPaymentPassDetailViewController _recomputeMappedSections](self, "_recomputeMappedSections");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentPassDetailWrapperSectionController setSectionIdentifiers:](paymentPassDetailSectionController, "setSectionIdentifiers:", v23);

        -[PKPaymentPassDetailViewController _activeOrderOfSectionIdentifiers](self, "_activeOrderOfSectionIdentifiers");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDynamicTableViewController recomputeMappedSectionsAndReloadSections:sectionIdentifiers:](self, "recomputeMappedSectionsAndReloadSections:sectionIdentifiers:", v9, v24);

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {

    }
    if (objc_msgSend(v9, "count"))
    {
      v26.receiver = self;
      v26.super_class = (Class)PKPaymentPassDetailViewController;
      -[PKDynamicTableViewController reloadSectionIdentifiers:](&v26, sel_reloadSectionIdentifiers_, v9);
    }
    goto LABEL_23;
  }
LABEL_24:

}

- (void)reloadSections:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKPaymentPassDetailViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPaymentPassDetailViewController _activeOrderOfSectionIdentifiers](self, "_activeOrderOfSectionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicTableViewController recomputeMappedSectionsAndReloadSections:sectionIdentifiers:](self, "recomputeMappedSectionsAndReloadSections:sectionIdentifiers:", v6, v5);

  }
}

- (id)_activeOrderOfSectionIdentifiers
{
  UISegmentedControl *tabBar;
  uint64_t v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  tabBar = self->_tabBar;
  if (!tabBar)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    goto LABEL_12;
  }
  v4 = -[UISegmentedControl selectedSegmentIndex](tabBar, "selectedSegmentIndex");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4 != 1)
  {
LABEL_12:
    objc_msgSend(v5, "addObjectsFromArray:", self->_orderOfSectionIdentifiers);
    goto LABEL_13;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_sectionControllers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "sectionIdentifiers", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

LABEL_13:
  v12 = (void *)objc_msgSend(v5, "copy", (_QWORD)v14);

  return v12;
}

- (id)_recomputeMappedSections
{
  id v3;
  unint64_t i;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 54; ++i)
  {
    if (-[PKPaymentPassDetailViewController shouldMapSection:](self, "shouldMapSection:", i))
    {
      PKPassDetailSectionTypeToString(i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

    }
  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (int64_t)rowAnimationForReloadingSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)rowAnimationForInsertingSection:(unint64_t)a3
{
  return 0;
}

- (int64_t)rowAnimationForDeletingSection:(unint64_t)a3
{
  return 0;
}

- (id)titleForHeaderInSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;

  v5 = 0;
  switch(a3)
  {
    case 3uLL:
      -[PKPaymentPass cardholderInfoSectionTitle](self->_pass, "cardholderInfoSectionTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (self->_isAppleAccess)
      {
        PKLocalizedPaymentString(CFSTR("EMPLOYEE_INFO_HEADER"));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if (v6)
      {
        v8 = v6;
        goto LABEL_35;
      }
      -[PKPaymentPass primaryFields](self->_pass, "primaryFields");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "label");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    case 7uLL:
      -[PKPaymentPass barcode](self->_pass, "barcode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "header");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    case 0xAuLL:
      if (!self->_nfcExpressModeSupported || !self->_uwbExpressModeSupported)
        goto LABEL_48;
      v10 = CFSTR("EXPRESS_ACCESS_TITLE");
      goto LABEL_51;
    case 0xCuLL:
      PKLocalizedMadisonString(CFSTR("ACCOUNT_USERS_SECTION_HEADER"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    case 0xFuLL:
    case 0x14uLL:
    case 0x15uLL:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      goto LABEL_12;
    case 0x17uLL:
      v10 = CFSTR("TICKET_SECTION_HEADER");
      goto LABEL_51;
    case 0x1AuLL:
      v12 = CFSTR("PEER_PAYMENT_PASS_DETAILS_ACCEPT_PAYMENTS_HEADER_TITLE");
      goto LABEL_30;
    case 0x1CuLL:
      v10 = CFSTR("PAYMENT_ACCOUNT");
      goto LABEL_51;
    case 0x1DuLL:
      -[PKPaymentPassDetailViewController _headerTitleForPassStateSection](self, "_headerTitleForPassStateSection");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    case 0x21uLL:
      if (self->_peerPaymentAccount)
        goto LABEL_48;
      -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_pass, "associatedAccountServiceAccountIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {

LABEL_48:
        v5 = 0;
        goto LABEL_53;
      }
      v16 = -[PKPaymentPassDetailViewController _shouldShowCardNumbersSection](self, "_shouldShowCardNumbersSection");

      if (v16)
        goto LABEL_48;
      PKLocalizedPaymentString(CFSTR("CARD_INFO_HEADER"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PKPaymentPass supportsBarcodePayment](self->_pass, "supportsBarcodePayment"))
      {
        PKLocalizedAquamanString(CFSTR("PASS_INFO_HEADER"));
        v23 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v23;
      }
LABEL_53:
      -[PKPaymentPassDetailViewController _configurableSectionForSectionType:](self, "_configurableSectionForSectionType:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "header");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = v20;

        v5 = v21;
      }

      return v5;
    case 0x22uLL:
      if (-[PKDynamicTableViewController hasSectionForSectionIdentifier:](self, "hasSectionForSectionIdentifier:", CFSTR("CardInfo"))|| self->_peerPaymentAccount)
      {
        goto LABEL_48;
      }
      v10 = CFSTR("CARD_INFO_HEADER");
      goto LABEL_51;
    case 0x24uLL:
      PKLocalizedPeerPaymentLexingtonString(CFSTR("BACK_OF_PASS_FAMILY_SHARING"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    case 0x25uLL:
      if (self->_peerPaymentAccount)
      {
        v12 = CFSTR("PEER_PAYMENT_PASS_DETAILS_NOTIFICATIONS_SWITCHES_TITLE");
LABEL_30:
        PKLocalizedPeerPaymentString(&v12->isa);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_pass, "associatedAccountServiceAccountIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (!v15)
        {
          v10 = CFSTR("TRANSACTIONS_HEADER");
          goto LABEL_51;
        }
        -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
LABEL_12:
        PKLocalizedFeatureString();
        v11 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_52;
    case 0x26uLL:
      -[PKPaymentPass organizationName](self->_pass, "organizationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("TRANSACTIONS_UNAVAILABLE_HEADER"), CFSTR("%@"), v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    case 0x27uLL:
      if (-[PKPaymentPassDetailViewController _isBankConnectLinked](self, "_isBankConnectLinked"))
      {
        PKLocalizedBankConnectString(CFSTR("BANK_CONNECT_DASHBOARD_TRANSACTIONS_HEADER"));
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (-[PKPaymentPass isIdentityPass](self->_pass, "isIdentityPass"))
          v10 = CFSTR("TRANSACTIONS_LATEST_ACTIVITIES_HEADER");
        else
          v10 = CFSTR("TRANSACTIONS_LATEST_HEADER");
LABEL_51:
        PKLocalizedPaymentString(&v10->isa);
        v11 = objc_claimAutoreleasedReturnValue();
      }
LABEL_52:
      v5 = (void *)v11;
      goto LABEL_53;
    case 0x28uLL:
      v12 = CFSTR("PEER_PAYMENT_PASS_DETAILS_TRANSACTIONS_BY_YEAR_SECTION_HEADER");
      goto LABEL_30;
    case 0x29uLL:
      PKLocalizedShareableCredentialString(CFSTR("CARDS_IN_GROUP_TITLE"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    case 0x2AuLL:
      if (self->_account)
        goto LABEL_48;
      v10 = CFSTR("SETTINGS_OPTIONS_BILLING_ADDRESS_VC_TITLE");
      goto LABEL_51;
    case 0x2EuLL:
      -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "paymentNetworkIdentifier");
      PKDisplayablePaymentNetworkNameForPaymentCredentialType();
      v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:
      v5 = v8;
LABEL_36:

      goto LABEL_53;
    case 0x33uLL:
      if (-[PKPaymentPassDetailViewController _numberOfPrivacyTermsInfoRows](self, "_numberOfPrivacyTermsInfoRows")
        || !-[PKPaymentPassDetailViewController passSupportsDeviceAssessment](self, "passSupportsDeviceAssessment"))
      {
        goto LABEL_48;
      }
      v10 = CFSTR("DEVICE_ASSESSMENT_SUPPORTED_PASS_DETAILS_PRIVACY_HEADER");
      goto LABEL_51;
    default:
      goto LABEL_53;
  }
}

- (id)titleForFooterInSection:(unint64_t)a3
{
  void *v5;
  int64_t detailViewStyle;
  unint64_t peerPaymentAccountResolution;
  NSString *v8;
  NSString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  int v13;
  void (*v14)(NSString *);
  const __CFString *v15;
  int v16;
  void *v18;
  void *v19;
  int v20;
  unint64_t redemptionStatus;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  NSUInteger v29;
  NSUInteger v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  int v34;
  int v35;
  __CFString *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  __CFString *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  char v48;
  __CFString *v49;
  const __CFString *v50;
  void *v51;
  unint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  int v56;
  int v57;
  uint64_t v58;
  int v59;
  id v60;
  __CFString *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  unint64_t radioTechnologyType;
  BOOL v70;
  _BOOL4 v71;
  NSString *v72;
  NSString *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;

  v5 = 0;
  v79 = *MEMORY[0x1E0C80C00];
  detailViewStyle = self->_detailViewStyle;
  switch(a3)
  {
    case 2uLL:
      peerPaymentAccountResolution = self->_peerPaymentAccountResolution;
      if (peerPaymentAccountResolution == 2)
      {
        v28 = CFSTR("PEER_PAYMENT_PASS_DETAILS_VERIFY_IDENTITY_FOOTER");
      }
      else
      {
        if (peerPaymentAccountResolution != 3)
          goto LABEL_84;
        if (-[PKPeerPaymentAccount state](self->_peerPaymentAccount, "state") == 2)
        {
          PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PEER_PAYMENT_ACCOUNT_STATE_FOOTER_RESTRICTED_CONTACT_SUPPORT_BODY"), detailViewStyle == 2);
          v8 = (NSString *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentString(v8);
          v9 = (NSString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_108;
        }
        v28 = CFSTR("PEER_PAYMENT_PASS_DETAILS_CONTACT_SUPPORT_FOOTER");
      }
LABEL_131:
      PKLocalizedPeerPaymentString(&v28->isa);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_138;
    case 5uLL:
      -[PKPaymentPassDetailViewController identityDocumentSectionFooter](self, "identityDocumentSectionFooter");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_138;
    case 6uLL:
      -[PKPaymentPassDetailViewController tableView](self, "tableView");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController footerForReplaceBiometricIdentityInTableView:](self, "footerForReplaceBiometricIdentityInTableView:", v8);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_108;
    case 8uLL:
      v11 = CFSTR("AUTOMATIC_PRESENTATION_FOOTER");
      goto LABEL_50;
    case 0xAuLL:
      v8 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
      if (-[PKPaymentPass isAccessPass](self->_pass, "isAccessPass"))
      {
        v12 = -[PKPaymentPass accessType](self->_pass, "accessType");
        v13 = 1;
        v14 = (void (*)(NSString *))MEMORY[0x1E0D6BDD0];
        v15 = CFSTR("EXPRESS_ACCESS_FOOTER");
        v16 = 1;
        switch(v12)
        {
          case 0:
            goto LABEL_86;
          case 1:
          case 3:
          case 5:
          case 6:
            v15 = CFSTR("EXPRESS_ACCESS_KEY_FOOTER");
            goto LABEL_86;
          case 2:
            v15 = CFSTR("EXPRESS_ACCESS_BADGE_FOOTER");
            goto LABEL_86;
          case 4:
            radioTechnologyType = self->_radioTechnologyType;
            if (radioTechnologyType == 1)
            {
              v13 = 0;
              v14 = (void (*)(NSString *))MEMORY[0x1E0D6BE48];
              v15 = CFSTR("CAR_KEY_EXPRESS_MODE_FOOTER");
              goto LABEL_86;
            }
            if ((radioTechnologyType & 2) != 0)
            {
              v13 = 0;
              v16 = 0;
              v14 = (void (*)(NSString *))MEMORY[0x1E0D6BE48];
              v15 = CFSTR("CAR_KEY_PASSIVE_ENTRY_FOOTER");
              goto LABEL_86;
            }
            v14 = (void (*)(NSString *))MEMORY[0x1E0D6BE48];
            if (detailViewStyle == 2)
              goto LABEL_87;
            break;
          default:
            v14 = (void (*)(NSString *))MEMORY[0x1E0D6BDD0];
            if (detailViewStyle == 2)
              goto LABEL_87;
            v16 = 1;
            goto LABEL_97;
        }
        goto LABEL_103;
      }
      v13 = 1;
      v14 = (void (*)(NSString *))MEMORY[0x1E0D6BDD0];
      v16 = 1;
      v15 = CFSTR("EXPRESS_ACCESS_FOOTER");
LABEL_86:
      -[NSString appendString:](v8, "appendString:", v15);
      if (detailViewStyle == 2)
      {
LABEL_87:
        v50 = CFSTR("_WATCH");
        goto LABEL_106;
      }
      if (!v13)
        goto LABEL_102;
LABEL_97:
      if (PKNearFieldLowPowerSupportIsAvailable())
      {
        -[NSString appendString:](v8, "appendString:", CFSTR("_LPEM"));
        if ((v16 & 1) == 0)
          goto LABEL_107;
      }
      else
      {
LABEL_102:
        if (!v16)
          goto LABEL_107;
      }
LABEL_103:
      if (PKPearlIsAvailable())
        v50 = CFSTR("_FACEID");
      else
        v50 = CFSTR("_TOUCHID");
LABEL_106:
      -[NSString appendString:](v8, "appendString:", v50);
LABEL_107:
      v14(v8);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_108;
    case 0xDuLL:
      PKLocalizedBeekmanString(CFSTR("DETAILS_FOOTER_TEXT"));
      return (id)objc_claimAutoreleasedReturnValue();
    case 0xFuLL:
      -[PKAccount creditDetails](self->_account, "creditDetails");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "accountSummary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "requiresDebtCollectionNotices");

      if (v20)
        goto LABEL_14;
      -[PKAccount stateReason](self->_account, "stateReason");
      if (!PKAccountStateReasonIsInMerge())
        goto LABEL_14;
      v49 = CFSTR("ACCOUNT_MERGING_CREDIT_DETAILS_FOOTER");
      goto LABEL_80;
    case 0x13uLL:
      if (!self->_isAmpEligible)
        goto LABEL_84;
LABEL_136:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      goto LABEL_137;
    case 0x14uLL:
      switch(self->_cashbackResolution)
      {
        case 1uLL:
          redemptionStatus = self->_redemptionStatus;
          if (redemptionStatus < 2 || redemptionStatus == 2)
            goto LABEL_136;
          goto LABEL_84;
        case 2uLL:
        case 3uLL:
        case 4uLL:
          goto LABEL_136;
        default:
          goto LABEL_84;
      }
    case 0x15uLL:
      -[PKPhysicalCardController unactivatedPhysicalCard](self->_physicalCardController, "unactivatedPhysicalCard");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v22;
      if (!v22)
        goto LABEL_139;
      objc_msgSend(v22, "latestShippingActivity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23 && objc_msgSend(v23, "shippingStatus"))
      {
        switch(objc_msgSend(v24, "shippingStatus"))
        {
          case 1:
            objc_msgSend(v24, "estimatedDeliveryDate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
            if (!v25)
              goto LABEL_182;
            objc_msgSend(v24, "formattedEstimatedDeliveryDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedFeatureString();
            v27 = objc_claimAutoreleasedReturnValue();
            goto LABEL_150;
          case 2:
          case 3:
            goto LABEL_169;
          case 4:
            objc_msgSend(v24, "localizedDeliveryExceptionReason");
            v65 = (id)objc_claimAutoreleasedReturnValue();
            if (!v65)
            {
LABEL_169:
              -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
LABEL_182:
              PKLocalizedFeatureString();
              v65 = (id)objc_claimAutoreleasedReturnValue();
            }
            break;
          default:
            v65 = 0;
            break;
        }
      }
      else
      {
        objc_msgSend(v5, "latestOrderActivity");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        switch(objc_msgSend(v26, "activity"))
        {
          case 1:
          case 2:
          case 3:
            -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
            PKLocalizedFeatureString();
            v27 = objc_claimAutoreleasedReturnValue();
LABEL_150:
            v65 = (id)v27;
            break;
          case 4:
            objc_msgSend(v26, "localizedReason");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v66;
            if (v66)
            {
              v68 = v66;
            }
            else
            {
              -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
              PKLocalizedFeatureString();
              v68 = (id)objc_claimAutoreleasedReturnValue();
            }
            v65 = v68;

            break;
          default:
            v65 = 0;
            break;
        }

      }
      return v65;
    case 0x16uLL:
      -[PKPaymentPass organizationName](self->_pass, "organizationName");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("MESSAGE_SERVICE_FOOTER"), CFSTR("%@"), v8);
      goto LABEL_63;
    case 0x18uLL:
      v28 = CFSTR("PEER_PAYMENT_PASS_DETAILS_ACTION_EDUCATION_FOOTER");
      goto LABEL_131;
    case 0x1AuLL:
      if (!-[PKPeerPaymentAccount supportsDeviceTap](self->_peerPaymentAccount, "supportsDeviceTap")
        || !PKCashDeviceTapEnabled())
      {
        goto LABEL_84;
      }
      PKLocalizedNearbyPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_ACCEPT_PAYMENTS_FOOTER"));
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_138;
    case 0x1CuLL:
      v11 = CFSTR("PAYMENT_ACCOUNT_FOOTER");
      goto LABEL_50;
    case 0x1DuLL:
      -[PKPaymentPassDetailViewController _footerTextForPassStateSection](self, "_footerTextForPassStateSection");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_138;
    case 0x1EuLL:
      v29 = -[NSArray count](self->_displayableBalanceFields, "count");
      v30 = -[NSArray count](self->_commutePlanFields, "count");
      v31 = -[PKPaymentPassDetailViewController _hasActionOfType:](self, "_hasActionOfType:", 2);
      v32 = -[PKPaymentPassDetailViewController _hasActionOfType:](self, "_hasActionOfType:", 1);
      v33 = v32;
      if (v30)
        v34 = !v31;
      else
        v34 = 1;
      if (v29)
        v35 = !v32;
      else
        v35 = 1;
      PKLocalizedPaymentString(CFSTR("REMINDERS_SECTION_REMINDER_FOOTER_ONLY"));
      v73 = (NSString *)objc_claimAutoreleasedReturnValue();
      if ((-[PKPaymentPass isAutoTopEnabled](self->_pass, "isAutoTopEnabled") & 1) != 0 || !(v30 | v29) && (v31 || v33))
        goto LABEL_42;
      if (v29)
        v56 = v34;
      else
        v56 = 0;
      if (v56 != 1 || (self->_transitProperties ? (v57 = 1) : (v57 = v33), v57 != 1))
      {
        if (v30)
          v59 = v35;
        else
          v59 = 0;
        if ((v59 & v31) == 1)
        {
          if (detailViewStyle == 2)
            goto LABEL_181;
          v72 = 0;
          goto LABEL_186;
        }
        if (v29)
        {
          if (self->_transitProperties)
          {
            if ((v34 & 1) == 0)
            {
LABEL_180:
              if (detailViewStyle == 2)
                goto LABEL_181;
              v72 = 0;
LABEL_186:
              PKPassLocalizedStringWithFormat();
              v58 = objc_claimAutoreleasedReturnValue();
              goto LABEL_187;
            }
          }
          else
          {
            if (v30)
              v71 = v33;
            else
              v71 = 0;
            if (v71 && v31)
              goto LABEL_180;
          }
        }
LABEL_42:
        v5 = 0;
LABEL_43:
        v8 = v73;
        goto LABEL_109;
      }
      if (detailViewStyle != 2)
      {
        PKLocalizedPaymentString(CFSTR("BALANCE_AND_PLAN_SECTION_FOOTER_BALANCE"));
        v58 = objc_claimAutoreleasedReturnValue();
LABEL_187:
        v5 = (void *)v58;
        goto LABEL_43;
      }
LABEL_181:
      v8 = v73;
      v9 = v73;
LABEL_108:
      v5 = v9;
LABEL_109:

LABEL_139:
      -[PKPaymentPassDetailViewController _configurableSectionForSectionType:](self, "_configurableSectionForSectionType:", a3, v72);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "footer");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (v63)
      {
        v64 = v63;

        v5 = v64;
      }
      v65 = v5;

      return v65;
    case 0x1FuLL:
      if (-[PKPaymentPassDetailViewController _shouldShowServiceMode](self, "_shouldShowServiceMode"))
      {
        if (-[PKPaymentPass isEMoneyPass](self->_pass, "isEMoneyPass"))
          v36 = CFSTR("SERVICE_MODE_NON_TRANSIT_SECTION_FOOTER");
        else
          v36 = CFSTR("SERVICE_MODE_SECTION_FOOTER");
        PKLocalizedPaymentString(&v36->isa);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
      -[PKPaymentPassDetailViewController traitCollection](self, "traitCollection");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "userInterfaceIdiom");

      if (v52 > 6 || ((1 << v52) & 0x62) == 0)
        goto LABEL_139;
      -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
      v53 = objc_claimAutoreleasedReturnValue();
      v8 = (NSString *)v53;
      if (v53)
      {
        PKLocalizedPaymentString(CFSTR("CONTACT_ISSUER_BY_PHONE_FOOTER"), CFSTR("%@"), v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "length"))
        {
          objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("\n\n%@"), v54);
          v55 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v55 = v54;
        }
        v60 = v55;

        v5 = v60;
      }
      goto LABEL_109;
    case 0x22uLL:
      v11 = CFSTR("DPAN_FOOTER");
LABEL_50:
      PKLocalizedPaymentString(&v11->isa);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_138;
    case 0x24uLL:
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      -[PKPeerPaymentAccount associatedAccountInformation](self->_peerPaymentAccount, "associatedAccountInformation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "associatedAccountInvitations");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
      if (!v39)
        goto LABEL_59;
      v40 = v39;
      v41 = *(_QWORD *)v75;
      while (2)
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v75 != v41)
            objc_enumerationMutation(v38);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "status") == 1)
          {

LABEL_84:
            v5 = 0;
            goto LABEL_139;
          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
        if (v40)
          continue;
        break;
      }
LABEL_59:

      v43 = CFSTR("BACK_OF_PASS_FAMILY_SHARING_FOOTER");
LABEL_78:
      PKLocalizedPeerPaymentLexingtonString(&v43->isa);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_138:
      v5 = (void *)v10;
      goto LABEL_139;
    case 0x25uLL:
      if (!-[PKPaymentPassDetailViewController _showsTransactionHistorySwitch](self, "_showsTransactionHistorySwitch"))
        goto LABEL_84;
      -[PKPaymentPass organizationName](self->_pass, "organizationName");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("TRANSACTIONS_SERVICE_FOOTER"), CFSTR("%@"), v8);
      goto LABEL_63;
    case 0x26uLL:
      -[PKPaymentPass organizationName](self->_pass, "organizationName");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("TRANSACTIONS_UNAVAILABLE_FOOTER"), CFSTR("%@"), v8);
      goto LABEL_63;
    case 0x27uLL:
      if (-[PKPaymentPassDetailViewController _isBankConnectLinked](self, "_isBankConnectLinked")
        || self->_peerPaymentAccount
        || self->_account)
      {
        goto LABEL_84;
      }
      if (-[PKPaymentPass supportsFPANNotifications](self->_pass, "supportsFPANNotifications")
        && -[PKPaymentPass supportsDPANNotifications](self->_pass, "supportsDPANNotifications"))
      {
        -[PKPaymentPass organizationName](self->_pass, "organizationName");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("TRANSACTIONS_FOOTER_FPAN_ENABLED"), CFSTR("%@"), v8);
LABEL_63:
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_108;
      }
      if ((-[PKPaymentPass isStoredValuePass](self->_pass, "isStoredValuePass") & 1) == 0
        && (-[PKPaymentPass isIdentityPass](self->_pass, "isIdentityPass") & 1) == 0)
      {
        PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("TRANSACTIONS_FOOTER"), self->_detailViewStyle == 2);
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentPass organizationName](self->_pass, "organizationName");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(v8, CFSTR("%@"), v45);
        v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_133;
      }
      if (-[PKPaymentPass isIdentityPass](self->_pass, "isIdentityPass"))
        v70 = detailViewStyle == 2;
      else
        v70 = 0;
      if (v70 && -[PKPaymentPassDetailViewController _transactionsCount](self, "_transactionsCount"))
      {
        PKLocalizedIdentityString(CFSTR("ACTIVITIES_COMPLETE_HISTORY_FOOTER"));
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_138;
      }
      goto LABEL_84;
    case 0x29uLL:
      -[PKLinkedApplication displayName](self->_linkedApplication, "displayName");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (-[NSString length](v8, "length"))
      {
        v72 = v8;
        PKPassLocalizedStringWithFormat();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (!v44
          || (v46 = v44, v46 == CFSTR("ADDITIONAL_SHARING_INFO"))
          || (v47 = v46,
              v48 = objc_msgSend(CFSTR("ADDITIONAL_SHARING_INFO"), "isEqualToString:", v46, v8),
              v47,
              (v48 & 1) != 0))
        {
          v5 = 0;
        }
        else
        {
          v61 = v47;
LABEL_133:
          v5 = v61;
        }

      }
      else
      {
        v5 = 0;
      }
      goto LABEL_109;
    case 0x2DuLL:
      -[PKPaymentPassDetailViewController footerTextForPersonalInformationSection](self, "footerTextForPersonalInformationSection");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_138;
    case 0x2FuLL:
      v28 = CFSTR("PEER_PAYMENT_PASS_DETAILS_MANUAL_VERIFY_IDENTITY_FOOTER");
      goto LABEL_131;
    case 0x30uLL:
      v43 = CFSTR("PEER_PAYMENT_PASS_DETAILS_GRADUATION_FOOTER");
      goto LABEL_78;
    case 0x32uLL:
      v49 = CFSTR("BUILD_CREDIT_HISTORY_FOOTER");
LABEL_80:
      PKLocalizedMadisonString(&v49->isa);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_138;
    case 0x35uLL:
      if (-[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature") != 2)
        goto LABEL_84;
LABEL_14:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
LABEL_137:
      PKLocalizedFeatureString();
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_138;
    default:
      goto LABEL_139;
  }
}

- (unint64_t)_transactionsCount
{
  return -[NSArray count](self->_transactions, "count");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionCase:(unint64_t)a4
{
  id v6;
  int64_t isAmpEligible;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  PKPeerPaymentAccount *peerPaymentAccount;

  v6 = a3;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 4uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xBuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x16uLL:
    case 0x18uLL:
    case 0x1BuLL:
    case 0x20uLL:
    case 0x23uLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x34uLL:
      goto LABEL_2;
    case 3uLL:
      v8 = -[PKPaymentPassDetailViewController _accessPersonInfoSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_accessPersonInfoSectionGenerateCellWithOutput:forRowIndex:tableView:", 0, 0, 0);
      goto LABEL_41;
    case 5uLL:
      v8 = -[PKPaymentPassDetailViewController numberOfIdentityDocumentRowsInTableView:](self, "numberOfIdentityDocumentRowsInTableView:", v6);
      goto LABEL_41;
    case 6uLL:
      v8 = -[PKPaymentPassDetailViewController numberOfReplaceBiometricRowsInTableView:](self, "numberOfReplaceBiometricRowsInTableView:", v6);
      goto LABEL_41;
    case 0xAuLL:
      isAmpEligible = self->_uwbExpressModeSupported + (unint64_t)self->_nfcExpressModeSupported;
      break;
    case 0xCuLL:
      v8 = -[PKPaymentPassDetailViewController numberOfAccountUserRowsInTableView:](self, "numberOfAccountUserRowsInTableView:", v6);
      goto LABEL_41;
    case 0xFuLL:
      v8 = -[PKPaymentPassDetailViewController _numberOfAccountServiceCreditDetailsRowsEnabled](self, "_numberOfAccountServiceCreditDetailsRowsEnabled");
      goto LABEL_41;
    case 0x12uLL:
      v9 = -[PKPaymentPassDetailViewController _shouldShowProductBenefitsCell](self, "_shouldShowProductBenefitsCell");
      goto LABEL_38;
    case 0x13uLL:
      isAmpEligible = self->_isAmpEligible;
      break;
    case 0x14uLL:
      v8 = -[PKPaymentPassDetailViewController _numberOfAccountServiceRewardsRowsEnabled](self, "_numberOfAccountServiceRewardsRowsEnabled");
      goto LABEL_41;
    case 0x15uLL:
      v8 = -[PKPaymentPassDetailViewController _numberOfAccountServicePhysicalCardRowsEnabled](self, "_numberOfAccountServicePhysicalCardRowsEnabled");
      goto LABEL_41;
    case 0x17uLL:
      v8 = -[PKPaymentPassDetailViewController _transitCellGenerateCellWithOutput:forRowIndex:tableView:](self, "_transitCellGenerateCellWithOutput:forRowIndex:tableView:", 0, 0, 0);
      goto LABEL_41;
    case 0x19uLL:
      v8 = -[PKPaymentPassDetailViewController _numberOfPeerPaymentMoneyActionsEnabled](self, "_numberOfPeerPaymentMoneyActionsEnabled");
      goto LABEL_41;
    case 0x1AuLL:
      isAmpEligible = 2 * !self->_loadingPeerPaymentPreferences;
      break;
    case 0x1CuLL:
      v10 = 1272;
      goto LABEL_32;
    case 0x1DuLL:
      v8 = -[PKPaymentPassDetailViewController _passStateSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_passStateSectionGenerateCellWithOutput:forRowIndex:tableView:", 0, 0, 0);
      goto LABEL_41;
    case 0x1EuLL:
      v11 = -[NSArray count](self->_displayableBalanceFields, "count");
      isAmpEligible = -[NSArray count](self->_commutePlanFields, "count") + v11;
      break;
    case 0x1FuLL:
      v8 = -[PKPaymentPassDetailViewController _contactBankCellWithOutput:forRowIndex:tableView:](self, "_contactBankCellWithOutput:forRowIndex:tableView:", 0, 0, 0);
      goto LABEL_41;
    case 0x21uLL:
      v8 = -[PKPaymentPassDetailViewController _cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:", 0, 0, 0);
      goto LABEL_41;
    case 0x22uLL:
      v10 = 1264;
      goto LABEL_32;
    case 0x24uLL:
      v12 = -[NSArray count](self->_sortedFamilyMemberRowModels, "count");
      goto LABEL_34;
    case 0x25uLL:
      if (-[PKPaymentPassDetailViewController _showsTransactionHistorySwitch](self, "_showsTransactionHistorySwitch"))
      {
        if ((-[PKPaymentPass settings](self->_pass, "settings") & 8) != 0)
          isAmpEligible = 2;
        else
          isAmpEligible = 1;
      }
      else
      {
        peerPaymentAccount = self->_peerPaymentAccount;
        if (!peerPaymentAccount || -[PKPeerPaymentAccount role](peerPaymentAccount, "role"))
LABEL_2:
          isAmpEligible = 1;
        else
          isAmpEligible = 2;
      }
      break;
    case 0x26uLL:
      -[PKPaymentPass storeIdentifiers](self->_pass, "storeIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      isAmpEligible = objc_msgSend(v13, "count") != 0;

      break;
    case 0x27uLL:
      if (!-[PKPaymentPassDetailViewController _transactionsCount](self, "_transactionsCount"))
        goto LABEL_2;
      v14 = -[PKPaymentPassDetailViewController _transactionsCount](self, "_transactionsCount");
      isAmpEligible = v14
                    + -[PKPaymentPassDetailViewController _transactionDeepLinkingEnabled](self, "_transactionDeepLinkingEnabled");
      break;
    case 0x28uLL:
      v10 = 1232;
LABEL_32:
      v8 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v10), "count");
      goto LABEL_41;
    case 0x29uLL:
      v12 = -[PKGroup passCount](self->_group, "passCount");
LABEL_34:
      isAmpEligible = v12 + 1;
      break;
    case 0x2AuLL:
      if (!self->_account)
        goto LABEL_2;
      isAmpEligible = !self->_loadingBillingContact;
      break;
    case 0x2EuLL:
      v9 = -[PKPaymentPassDetailViewController _shouldShowNetworkBenefitsCell](self, "_shouldShowNetworkBenefitsCell");
LABEL_38:
      isAmpEligible = v9;
      break;
    case 0x33uLL:
      v8 = -[PKPaymentPassDetailViewController _numberOfPrivacyTermsInfoRows](self, "_numberOfPrivacyTermsInfoRows");
      goto LABEL_41;
    case 0x35uLL:
      v8 = -[PKPaymentPassDetailViewController _passOperationsCellWithOutput:forRowIndex:tableView:](self, "_passOperationsCellWithOutput:forRowIndex:tableView:", 0, 0, 0);
LABEL_41:
      isAmpEligible = v8;
      break;
    default:
      isAmpEligible = 0;
      break;
  }

  return isAmpEligible;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 section:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 uwbExpressModeSupported;
  void *v13;
  void *v14;
  void **v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v24 = 0;
  switch(a5)
  {
    case 0uLL:
      -[PKPaymentPassDetailViewController _widgetCellForTableView:](self, "_widgetCellForTableView:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 1uLL:
      -[PKPaymentPassDetailViewController _linkedAppCellForTableView:](self, "_linkedAppCellForTableView:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 2uLL:
      -[PKPaymentPassDetailViewController _peerPaymentAccountActionCellForRowIndex:tableView:](self, "_peerPaymentAccountActionCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 3uLL:
      -[PKPaymentPassDetailViewController _accessPersonInfoSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_accessPersonInfoSectionGenerateCellWithOutput:forRowIndex:tableView:", &v24, objc_msgSend(v9, "row"), v8);
      goto LABEL_75;
    case 4uLL:
      -[PKPaymentPassDetailViewController _cardHolderPictureCellForTableView:](self, "_cardHolderPictureCellForTableView:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 5uLL:
      -[PKPaymentPassDetailViewController identityDocumentTableViewCellForTableView:atIndexPath:](self, "identityDocumentTableViewCellForTableView:atIndexPath:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 6uLL:
      -[PKPaymentPassDetailViewController replaceBiometricTableViewCellForTableView:atIndexPath:](self, "replaceBiometricTableViewCellForTableView:atIndexPath:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 7uLL:
      -[PKPaymentPassDetailViewController _barcodeCell](self, "_barcodeCell");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 8uLL:
      -[PKPaymentPassDetailViewController _automaticPresentationCellForTableView:](self, "_automaticPresentationCellForTableView:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 9uLL:
      -[PKPaymentPassDetailViewController _manufacturerInfoCellForTableView:](self, "_manufacturerInfoCellForTableView:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0xAuLL:
      if (-[PKPaymentPass isHomeKeyPass](self->_pass, "isHomeKeyPass"))
      {
        uwbExpressModeSupported = self->_uwbExpressModeSupported;
        if (self->_nfcExpressModeSupported)
        {
          if (!self->_uwbExpressModeSupported || !objc_msgSend(v10, "row"))
            goto LABEL_17;
          goto LABEL_65;
        }
      }
      else
      {
        uwbExpressModeSupported = self->_uwbExpressModeSupported;
      }
      if (!uwbExpressModeSupported)
      {
LABEL_17:
        -[PKPaymentPassDetailViewController _expressAccessCellForTableView:](self, "_expressAccessCellForTableView:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_74;
      }
LABEL_65:
      -[PKPaymentPassDetailViewController _uwbExpressAccessCellForTableView:](self, "_uwbExpressAccessCellForTableView:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_74:
      v24 = v11;
LABEL_75:
      v22 = v24;

      return v22;
    case 0xBuLL:
      PKLocalizedPaymentString(CFSTR("LINK_TO_WALLET_PASS_DETAILS"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v13, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v14;

      v15 = (void **)MEMORY[0x1E0D681D0];
      goto LABEL_55;
    case 0xCuLL:
      -[PKPaymentPassDetailViewController accountUserTableViewCellForTableView:atIndexPath:](self, "accountUserTableViewCellForTableView:atIndexPath:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0xDuLL:
      -[PKPaymentPassDetailViewController _installmentsPlanCellForTableView:atIndexPath:](self, "_installmentsPlanCellForTableView:atIndexPath:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0xEuLL:
      -[PKPaymentPassDetailViewController _accountServiceCardNumbersCellForRowIndex:tableView:](self, "_accountServiceCardNumbersCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0xFuLL:
      -[PKPaymentPassDetailViewController _accountServiceCreditDetailsCellForRowIndex:tableView:](self, "_accountServiceCreditDetailsCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x10uLL:
      -[PKPaymentPassDetailViewController _accountServiceBankAccountsCellForRowIndex:tableView:](self, "_accountServiceBankAccountsCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x11uLL:
    case 0x20uLL:
    case 0x23uLL:
      -[PKPaymentPassDetailViewController _merchantTokensCellForTableView:](self, "_merchantTokensCellForTableView:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x12uLL:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v16, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v14;

      v15 = (void **)MEMORY[0x1E0D67EF8];
      goto LABEL_55;
    case 0x13uLL:
      -[PKPaymentPassDetailViewController _accountServiceMakeDefaultCellForRowIndex:tableView:](self, "_accountServiceMakeDefaultCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x14uLL:
      -[PKPaymentPassDetailViewController _accountServiceRewardsDetailsCellForRowIndex:tableView:](self, "_accountServiceRewardsDetailsCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x15uLL:
      -[PKPaymentPassDetailViewController _accountServicePhysicalCardCellForRowIndex:tableView:](self, "_accountServicePhysicalCardCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x16uLL:
      -[PKPaymentPassDetailViewController _messagesSwitchCellForTableView:](self, "_messagesSwitchCellForTableView:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x17uLL:
      -[PKPaymentPassDetailViewController _transitCellGenerateCellWithOutput:forRowIndex:tableView:](self, "_transitCellGenerateCellWithOutput:forRowIndex:tableView:", &v24, objc_msgSend(v9, "row"), v8);
      goto LABEL_75;
    case 0x18uLL:
      -[PKPaymentPassDetailViewController _peerPaymentBalanceCellForRowIndex:tableView:](self, "_peerPaymentBalanceCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x19uLL:
      -[PKPaymentPassDetailViewController _peerPaymentMoneyActionCellForRowIndex:tableView:](self, "_peerPaymentMoneyActionCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x1AuLL:
      -[PKPaymentPassDetailViewController _peerPaymentAutomaticallyAcceptPaymentsCellForRowIndex:tableView:](self, "_peerPaymentAutomaticallyAcceptPaymentsCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x1BuLL:
      -[PKPaymentPassDetailViewController _peerPaymentBankAccountsCellForRowIndex:tableView:](self, "_peerPaymentBankAccountsCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x1CuLL:
      -[PKPaymentPassDetailViewController _paymentApplicationsCellForIndexPath:tableView:](self, "_paymentApplicationsCellForIndexPath:tableView:", v9, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x1DuLL:
      -[PKPaymentPassDetailViewController _passStateSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_passStateSectionGenerateCellWithOutput:forRowIndex:tableView:", &v24, objc_msgSend(v9, "row"), v8);
      goto LABEL_75;
    case 0x1EuLL:
      -[PKPaymentPassDetailViewController _balanceOrCommutePlanCellForRowIndex:tableView:](self, "_balanceOrCommutePlanCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x1FuLL:
      -[PKPaymentPassDetailViewController _contactBankCellWithOutput:forRowIndex:tableView:](self, "_contactBankCellWithOutput:forRowIndex:tableView:", &v24, objc_msgSend(v9, "row"), v8);
      goto LABEL_75;
    case 0x21uLL:
      -[PKPaymentPassDetailViewController _cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:", &v24, objc_msgSend(v9, "row"), v8);
      goto LABEL_75;
    case 0x22uLL:
      -[PKPaymentPassDetailViewController _deviceAccountNumberCellForIndexPath:tableView:](self, "_deviceAccountNumberCellForIndexPath:tableView:", v9, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x24uLL:
      -[PKPaymentPassDetailViewController _familyMemberCellForIndexPath:tableView:](self, "_familyMemberCellForIndexPath:tableView:", v9, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x25uLL:
      if (self->_peerPaymentAccount)
      {
        -[PKPaymentPassDetailViewController _peerPaymentNotificationsSwitchCellForIndexPath:tableView:](self, "_peerPaymentNotificationsSwitchCellForIndexPath:tableView:", v9, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_74;
      }
      -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_pass, "associatedAccountServiceAccountIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v20)
        -[PKPaymentPassDetailViewController _accountServiceNotificationsSwitchCellForIndexPath:tableView:](self, "_accountServiceNotificationsSwitchCellForIndexPath:tableView:", v10, v8);
      else
        -[PKPaymentPassDetailViewController _transactionsSwitchCellForIndexPath:tableView:](self, "_transactionsSwitchCellForIndexPath:tableView:", v10, v8);
      goto LABEL_47;
    case 0x26uLL:
      -[PKPaymentPassDetailViewController _linkedApplicationCellForTableView:](self, "_linkedApplicationCellForTableView:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x27uLL:
      if (!-[PKPaymentPassDetailViewController _transactionsCount](self, "_transactionsCount"))
      {
        if ((-[PKPaymentPass isIdentityPass](self->_pass, "isIdentityPass") & 1) != 0)
          PKLocalizedIdentityString(CFSTR("ACTIVITIES_NONE_AVAILABLE"));
        else
          PKLocalizedPaymentString(CFSTR("TRANSACTIONS_NONE_AVAILABLE"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentPassDetailViewController _infoCellWithDescription:forTableView:](self, "_infoCellWithDescription:forTableView:", v21, v8);
        v24 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_75;
      }
      v17 = objc_msgSend(v10, "row");
      if (v17 >= -[PKPaymentPassDetailViewController _transactionsCount](self, "_transactionsCount"))
        -[PKPaymentPassDetailViewController _moreTransactionsCellForTableView:](self, "_moreTransactionsCellForTableView:", v8);
      else
        -[PKPaymentPassDetailViewController _transactionCellForIndexPath:tableView:](self, "_transactionCellForIndexPath:tableView:", v10, v8);
LABEL_47:
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x28uLL:
      -[PKPaymentPassDetailViewController _transactionCountByPeriodCellForIndexPath:tableView:](self, "_transactionCountByPeriodCellForIndexPath:tableView:", v9, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x29uLL:
      -[PKPaymentPassDetailViewController _passesInGroupCellForIndexPath:tableView:](self, "_passesInGroupCellForIndexPath:tableView:", v9, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x2AuLL:
      -[PKPaymentPassDetailViewController _billingAddressCellShowingAddress:forTableView:](self, "_billingAddressCellShowingAddress:forTableView:", self->_account == 0, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x2BuLL:
      -[PKPaymentPassDetailViewController payLaterEligibleSpendTableVewCellForTableView:atIndexPath:](self, "payLaterEligibleSpendTableVewCellForTableView:atIndexPath:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x2CuLL:
      -[PKPaymentPassDetailViewController financingPlanListTableVewCellForTableView:atIndexPath:](self, "financingPlanListTableVewCellForTableView:atIndexPath:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x2DuLL:
      -[PKPaymentPassDetailViewController personalInformationTableVewCellForTableView:atIndexPath:](self, "personalInformationTableVewCellForTableView:atIndexPath:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x2EuLL:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v18, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v14;

      v15 = (void **)MEMORY[0x1E0D67D90];
LABEL_55:
      PKAccessibilityIDCellSet(v14, *v15);
      goto LABEL_75;
    case 0x2FuLL:
      -[PKPaymentPassDetailViewController _peerPaymentManualIdentityVerificationCellForRowIndex:tableView:](self, "_peerPaymentManualIdentityVerificationCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x30uLL:
      -[PKPaymentPassDetailViewController _peerPaymentParticipantGraduationCellForRowIndex:tableView:](self, "_peerPaymentParticipantGraduationCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x31uLL:
      -[PKPaymentPassDetailViewController _peerPaymentStatementCellForTableView:](self, "_peerPaymentStatementCellForTableView:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x32uLL:
      -[PKPaymentPassDetailViewController verifySSNTableViewCellForTableView:atIndexPath:](self, "verifySSNTableViewCellForTableView:atIndexPath:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x33uLL:
      -[PKPaymentPassDetailViewController _privacyTermsSectionCellForRowIndex:tableView:](self, "_privacyTermsSectionCellForRowIndex:tableView:", objc_msgSend(v9, "row"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x34uLL:
      -[PKPaymentPassDetailViewController accountUserStopSharingTableViewCellForTableView:atIndexPath:](self, "accountUserStopSharingTableViewCellForTableView:atIndexPath:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    case 0x35uLL:
      -[PKPaymentPassDetailViewController _passOperationsCellWithOutput:forRowIndex:tableView:](self, "_passOperationsCellWithOutput:forRowIndex:tableView:", &v24, objc_msgSend(v9, "row"), v8);
      goto LABEL_75;
    default:
      goto LABEL_75;
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4 section:(unint64_t)a5
{
  id v8;
  id v9;
  BOOL v10;

  v8 = a3;
  v9 = a4;
  v10 = a5 == 39
     && !-[PKPaymentPassDetailViewController _isBankConnectLinked](self, "_isBankConnectLinked")
     && -[PKPaymentPassDetailViewController _transactionCellEditActionsGenerateWithOutput:forRowIndex:tableView:](self, "_transactionCellEditActionsGenerateWithOutput:forRowIndex:tableView:", 0, objc_msgSend(v9, "row"), v8);

  return v10;
}

- (int64_t)editingStyleForRowAtIndexPath:(id)a3 section:(unint64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 section:(unint64_t)a5
{
  return 0;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 section:(unint64_t)a5
{
  id v6;
  id v9;
  void *v10;
  id v12;

  v6 = 0;
  v12 = 0;
  if (a5 == 39)
  {
    v9 = a3;
    -[PKPaymentPassDetailViewController _transactionCellEditActionsGenerateWithOutput:forRowIndex:tableView:](self, "_transactionCellEditActionsGenerateWithOutput:forRowIndex:tableView:", &v12, objc_msgSend(a4, "row"), v9);

    v6 = v12;
  }
  objc_msgSend(MEMORY[0x1E0DC3D08], "configurationWithActions:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPerformsFirstActionWithFullSwipe:", 0);

  return v10;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIView *passSnapshotView;

  v4 = a3;
  -[PKPaymentPassDetailViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[PKPassHeaderView passView](self->_passHeaderView, "passView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;

  objc_msgSend(v4, "contentOffset");
  v12 = v11;
  objc_msgSend(v4, "adjustedContentInset");
  v14 = v13;

  v15 = v8 + v10 - v14;
  self->_showingTitleIconView = v12 >= v15;
  if (v12 < v15)
    passSnapshotView = 0;
  else
    passSnapshotView = self->_passSnapshotView;
  -[PKAnimatedNavigationBarTitleView setTitleView:animated:](self->_titleIconView, "setTitleView:animated:", passSnapshotView, 1);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat v6;
  CGFloat v7;

  -[PKPaymentPassDetailViewController _normalizedContentOffsetForTargetOffset:](self, "_normalizedContentOffsetForTargetOffset:", a3, a5->x, a5->y);
  a5->x = v6;
  a5->y = v7;
}

- (void)_normalizeContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v10;

  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isDragging") & 1) == 0 && (objc_msgSend(v10, "isDecelerating") & 1) == 0)
  {
    objc_msgSend(v10, "contentOffset");
    v4 = v3;
    v6 = v5;
    -[PKPaymentPassDetailViewController _normalizedContentOffsetForTargetOffset:](self, "_normalizedContentOffsetForTargetOffset:");
    if (v4 != v8 || v6 != v7)
      objc_msgSend(v10, "setContentOffset:animated:", 1);
  }

}

- (CGPoint)_normalizedContentOffsetForTargetOffset:(CGPoint)a3
{
  double y;
  CGFloat x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  double v24;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustedContentInset");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "contentSize");
  v12 = v11;
  objc_msgSend(v6, "bounds");
  v14 = v13;
  -[PKPaymentPassDetailViewController _offscreenHeaderHeight](self, "_offscreenHeaderHeight");
  v16 = -v8;
  v17 = v15 + v14 - (v10 + v8 + v12);
  if (v17 <= 0.0)
  {
    v19 = v15 - v8;
    if (y < v16)
      v20 = -v8;
    else
      v20 = y;
    if ((y + v8) / (v8 + v19) <= 0.5)
      v21 = -v8;
    else
      v21 = v19;
    if (y > v16 && y < v19)
      v18 = v21;
    else
      v18 = v20;
  }
  else
  {
    v18 = fmin(fmax(y, v16), fmax(v15 - v17, 0.0) - v8);
  }

  v23 = x;
  v24 = v18;
  result.y = v24;
  result.x = v23;
  return result;
}

- (BOOL)shouldDrawTopSeparator:(unint64_t)a3
{
  return a3 != 0;
}

- (BOOL)shouldDrawBottomSeparator:(unint64_t)a3
{
  return a3 != 0;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5 section:(unint64_t)a6
{
  double y;
  double x;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;

  y = a5.y;
  x = a5.x;
  v11 = a3;
  v12 = a4;
  if (a6 == 39)
  {
    -[PKPaymentPassDetailViewController tableView:contextMenuConfigurationForTransactionAtIndexPath:point:](self, "tableView:contextMenuConfigurationForTransactionAtIndexPath:point:", v11, v12, x, y);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a6 != 33)
    {
      v14 = 0;
      goto LABEL_7;
    }
    -[PKPaymentPassDetailViewController tableView:contextMenuConfigurationForCardInfoAtIndexPath:](self, "tableView:contextMenuConfigurationForCardInfoAtIndexPath:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
LABEL_7:

  return v14;
}

- (id)tableView:(id)a3 contextMenuConfigurationForCardInfoAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PKTableViewCellReuseIdentifierCustomerServiceIdentifier"));

  if (v7)
  {
    -[PKPaymentPass customerServiceIdentifier](self->_pass, "customerServiceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController contextMenuConfigurationForCopyingText:](self, "contextMenuConfigurationForCopyingText:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v5, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("cardNumberCell"));

  if (v11)
  {
    -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sanitizedDPAN");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && -[PKPaymentPassDetailViewController paymentApplicationShouldShowFullDPAN:](self, "paymentApplicationShouldShowFullDPAN:", v8))
    {
      PKFormattedSanitizedPAN();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController contextMenuConfigurationForCopyingText:](self, "contextMenuConfigurationForCopyingText:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

    goto LABEL_10;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)contextMenuConfigurationForCopyingText:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentPassDetailViewController_contextMenuConfigurationForCopyingText___block_invoke;
  aBlock[3] = &unk_1E3E6D5A8;
  v9 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __76__PKPaymentPassDetailViewController_contextMenuConfigurationForCopyingText___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
    return 0;
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("MENU_ACTION_COPY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PKPaymentPassDetailViewController_contextMenuConfigurationForCopyingText___block_invoke_2;
  v9[3] = &unk_1E3E6D580;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, 0, 0, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DC39D0];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuWithTitle:children:", &stru_1E3E7D690, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __76__PKPaymentPassDetailViewController_contextMenuConfigurationForCopyingText___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setString:", *(_QWORD *)(a1 + 32));

}

- (id)tableView:(id)a3 contextMenuConfigurationForTransactionAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v10, "row");
  if (v11 >= -[PKPaymentPassDetailViewController _transactionsCount](self, "_transactionsCount"))
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v9, "cellForRowAtIndexPath:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transactionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldShowTransactionPreviewForTouchAtPoint:inView:", v9, x, y);

    if (v14)
    {
      -[NSArray objectAtIndexedSubscript:](self->_transactions, "objectAtIndexedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController contextMenuConfigurationForTransaction:](self, "contextMenuConfigurationForTransaction:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (id)contextMenuConfigurationForTransaction:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  _QWORD aBlock[5];
  id v18;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentPassDetailViewController_contextMenuConfigurationForTransaction___block_invoke;
  aBlock[3] = &unk_1E3E796D0;
  aBlock[4] = self;
  v6 = v4;
  v18 = v6;
  v7 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  if (objc_msgSend(v6, "isDeletable") && objc_msgSend(v6, "transactionType") == 15)
  {
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __76__PKPaymentPassDetailViewController_contextMenuConfigurationForTransaction___block_invoke_2;
    v13[3] = &unk_1E3E796F8;
    objc_copyWeak(&v15, &location);
    v14 = v6;
    v8 = _Block_copy(v13);

    objc_destroyWeak(&v15);
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)MEMORY[0x1E0DC36B8];
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationWithIdentifier:previewProvider:actionProvider:", v10, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&location);
  return v11;
}

uint64_t __76__PKPaymentPassDetailViewController_contextMenuConfigurationForTransaction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transactionDetailViewControllerForTransaction:", *(_QWORD *)(a1 + 40));
}

id __76__PKPaymentPassDetailViewController_contextMenuConfigurationForTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3428];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __76__PKPaymentPassDetailViewController_contextMenuConfigurationForTransaction___block_invoke_3;
  v15 = &unk_1E3E659D0;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v4, "actionWithHandler:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributes:", 2, v12, v13, v14, v15);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

  PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_REMOVE_BUTTON_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  v8 = (void *)MEMORY[0x1E0DC39D0];
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "menuWithChildren:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  return v10;
}

void __76__PKPaymentPassDetailViewController_contextMenuConfigurationForTransaction___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deleteTransaction:completionHandler:", *(_QWORD *)(a1 + 32), 0);

}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  objc_msgSend(v6, "previewViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __105__PKPaymentPassDetailViewController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v9[3] = &unk_1E3E61388;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v6, "addAnimations:", v9);

  }
}

void __105__PKPaymentPassDetailViewController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);

}

- (id)tableView:(id)a3 viewForHeaderInSectionCase:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  id v13;
  PKSpinnerHeaderView *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;

  v6 = a3;
  v7 = v6;
  if (a4 != 42)
  {
    if (a4 == 26)
    {
      objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("spinner"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = &OBJC_IVAR___PKPaymentPassDetailViewController__loadingPeerPaymentPreferences;
      v10 = 1584;
      goto LABEL_6;
    }
LABEL_9:
    -[PKPaymentPassDetailViewController titleForHeaderInSection:](self, "titleForHeaderInSection:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v7, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("default"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16)
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("default"));
    }
    goto LABEL_13;
  }
  if (self->_account)
    goto LABEL_9;
  objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("spinner"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = &OBJC_IVAR___PKPaymentPassDetailViewController__loadingBillingContact;
  v10 = 1752;
LABEL_6:
  v11 = (id *)((char *)&self->super.super.super.super.super.isa + v10);
  v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
  *v11 = (id)v8;

  v13 = *v11;
  if (!*v11)
  {
    v14 = -[PKSpinnerHeaderView initWithReuseIdentifier:]([PKSpinnerHeaderView alloc], "initWithReuseIdentifier:", CFSTR("spinner"));
    v15 = *v11;
    *v11 = v14;

    v13 = *v11;
  }
  objc_msgSend(v13, "setShowSpinner:", *((unsigned __int8 *)&self->super.super.super.super.super.isa + *v9));
  v16 = *v11;
  if (!v16)
    goto LABEL_9;
LABEL_13:

  return v16;
}

- (double)tableView:(id)a3 heightForHeaderInSectionCase:(unint64_t)a4
{
  double result;

  if (!a4)
    return 0.0;
  objc_msgSend(a3, "sectionHeaderHeight");
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSectionCase:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((uint64_t)a4 > 28)
  {
    switch(a4)
    {
      case 0x1DuLL:
        -[PKPaymentPassDetailViewController _footerViewForPassStateSection](self, "_footerViewForPassStateSection");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 0x1EuLL:
      case 0x1FuLL:
      case 0x21uLL:
      case 0x22uLL:
        goto LABEL_21;
      case 0x20uLL:
      case 0x23uLL:
        goto LABEL_6;
      case 0x24uLL:
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        -[PKPeerPaymentAccount associatedAccountInformation](self->_peerPaymentAccount, "associatedAccountInformation", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "associatedAccountInvitations");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (!v10)
          goto LABEL_17;
        v11 = v10;
        v12 = *(_QWORD *)v19;
        break;
      default:
        if (a4 != 51)
          goto LABEL_21;
        -[PKPaymentPassDetailViewController _footerViewForApplePayProductPrivacySection](self, "_footerViewForApplePayProductPrivacySection");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
    }
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "status") == 1)
        {

          -[PKPaymentPassDetailViewController _footerViewForPendingPeerPaymentAssociatedAccount](self, "_footerViewForPendingPeerPaymentAssociatedAccount");
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
LABEL_17:

    goto LABEL_21;
  }
  if (a4 == 12)
  {
    -[PKPaymentPassDetailViewController _footerViewForAccountUsersSection](self, "_footerViewForAccountUsersSection");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_20:
    v14 = (void *)v7;
    if (v7)
      goto LABEL_25;
    goto LABEL_21;
  }
  if (a4 == 17)
  {
LABEL_6:
    -[PKPaymentPassDetailViewController _footerViewForMerchantTokensSection](self, "_footerViewForMerchantTokensSection");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  -[PKPaymentPassDetailViewController titleForFooterInSection:](self, "titleForFooterInSection:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("default"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("default"));
  }
LABEL_25:

  return v14;
}

- (double)tableView:(id)a3 heightForFooterInSectionCase:(unint64_t)a4
{
  id v6;
  id v7;
  double (**v8)(_QWORD);
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD aBlock[5];
  id v23;
  unint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentPassDetailViewController_tableView_heightForFooterInSectionCase___block_invoke;
  aBlock[3] = &unk_1E3E79720;
  aBlock[4] = self;
  v24 = a4;
  v7 = v6;
  v23 = v7;
  v8 = (double (**)(_QWORD))_Block_copy(aBlock);
  if ((uint64_t)a4 <= 28)
  {
    if (!a4)
    {
      v16 = 0.0;
      goto LABEL_24;
    }
    if (a4 == 12 || a4 == 17)
    {
LABEL_23:
      v16 = *MEMORY[0x1E0DC53D8];
      goto LABEL_24;
    }
  }
  else
  {
    switch(a4)
    {
      case 0x1DuLL:
        -[PKPaymentPassDetailViewController _footerViewHeightForPassStateSectionWithTableView:](self, "_footerViewHeightForPassStateSectionWithTableView:", v7);
        goto LABEL_20;
      case 0x1EuLL:
      case 0x1FuLL:
      case 0x21uLL:
      case 0x22uLL:
        goto LABEL_19;
      case 0x20uLL:
      case 0x23uLL:
        goto LABEL_23;
      case 0x24uLL:
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        -[PKPeerPaymentAccount associatedAccountInformation](self->_peerPaymentAccount, "associatedAccountInformation", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "associatedAccountInvitations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
        if (!v12)
          goto LABEL_18;
        v13 = v12;
        v14 = *(_QWORD *)v19;
        break;
      default:
        if (a4 != 51)
          goto LABEL_19;
        goto LABEL_23;
    }
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "status") == 1)
        {

          goto LABEL_23;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      if (v13)
        continue;
      break;
    }
LABEL_18:

  }
LABEL_19:
  v9 = v8[2](v8);
LABEL_20:
  v16 = v9;
LABEL_24:

  return v16;
}

uint64_t __76__PKPaymentPassDetailViewController_tableView_heightForFooterInSectionCase___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "titleForFooterInSection:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
    return objc_msgSend(*(id *)(a1 + 40), "sectionFooterHeight");
  v4 = *(void **)(a1 + 32);
  PKPassDetailSectionTypeToString(*(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfSectionIdentifier:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(*(id *)(a1 + 40), "sectionFooterHeight");
  v7 = v6 + 1;
  if (v7 >= objc_msgSend(*(id *)(a1 + 32), "numberOfSections"))
    return objc_msgSend(*(id *)(a1 + 40), "sectionFooterHeight");
  objc_msgSend(*(id *)(a1 + 32), "tableView:titleForHeaderInSection:", *(_QWORD *)(a1 + 40), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
    return objc_msgSend(*(id *)(a1 + 40), "sectionFooterHeight");
  else
    return PKFloatRoundToPixel();
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4 section:(unint64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v13;
  double v14;
  void *v15;
  double v16;

  v8 = a3;
  v9 = a4;
  if (a5 - 8 >= 0x2E)
  {
    switch(a5)
    {
      case 0uLL:
      case 2uLL:
      case 3uLL:
      case 5uLL:
      case 6uLL:
        goto LABEL_2;
      case 1uLL:
      case 7uLL:
        v11 = *MEMORY[0x1E0DC53D8];
        break;
      case 4uLL:
        -[PKPaymentPass cardHolderPicture](self->_pass, "cardHolderPicture");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "size");
        v11 = 184.0;
        if (v14 < 184.0)
        {
          -[PKPaymentPass cardHolderPicture](self->_pass, "cardHolderPicture");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "size");
          v11 = v16;

        }
        break;
      default:
        v11 = 0.0;
        break;
    }
  }
  else
  {
LABEL_2:
    objc_msgSend(v8, "rowHeight");
    v11 = v10;
  }

  return v11;
}

- (double)estimatedHeightForRowAtIndexPath:(id)a3 section:(unint64_t)a4
{
  double result;

  result = *MEMORY[0x1E0DC53D8];
  if (a4 >= 0x36)
    return 0.0;
  return result;
}

- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 section:(unint64_t)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  PKPaymentApplication *v15;
  int64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;

  v6 = a3;
  v7 = v6;
  LOBYTE(v8) = 0;
  switch(a4)
  {
    case 0uLL:
    case 3uLL:
    case 4uLL:
    case 0x18uLL:
    case 0x22uLL:
      break;
    case 0xCuLL:
      goto LABEL_34;
    case 0xEuLL:
      v10 = -[PKAccountCardNumbersPresenter isLoadingVirtualCard](self->_accountCardNumbersPresenter, "isLoadingVirtualCard");
      goto LABEL_25;
    case 0xFuLL:
      if (-[PKPaymentPassDetailViewController _accountServiceCreditDetailsRowForRowIndex:](self, "_accountServiceCreditDetailsRowForRowIndex:", objc_msgSend(v6, "row")))
      {
        goto LABEL_23;
      }
      v11 = -[PKPaymentPassDetailViewController isTotalBalanceCellSelectable](self, "isTotalBalanceCellSelectable");
      goto LABEL_35;
    case 0x10uLL:
      v12 = 1648;
      goto LABEL_27;
    case 0x11uLL:
    case 0x20uLL:
    case 0x23uLL:
      -[PKRetrieveMerchantTokensResponse merchantTokens](self->_merchantTokensResponse, "merchantTokens");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_msgSend(v9, "count") != 0;

      break;
    case 0x14uLL:
      v13 = -[PKPaymentPassDetailViewController _accountServiceRewardsRowForRowIndex:](self, "_accountServiceRewardsRowForRowIndex:", objc_msgSend(v6, "row"));
      if (v13 == 1 && !self->_redeemingRewards)
        goto LABEL_20;
      v14 = v13 == 2;
      goto LABEL_28;
    case 0x15uLL:
      if (-[PKPhysicalCardActionController state](self->_physicalCardActionController, "state") == 1
        || self->_loadingOrderPhysicalCard)
      {
        goto LABEL_23;
      }
      v12 = 1651;
      goto LABEL_27;
    case 0x1CuLL:
      -[NSArray objectAtIndex:](self->_contactlessPaymentApplications, "objectAtIndex:", objc_msgSend(v6, "row"));
      v15 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = !self->_changingDefaultPaymentApplication && self->_defaultPaymentApplication != v15;

      break;
    case 0x1EuLL:
      v11 = -[PKPaymentPassDetailViewController _canSelectBalanceOrCommutePlanCellAtRowIndex:](self, "_canSelectBalanceOrCommutePlanCellAtRowIndex:", objc_msgSend(v6, "row"));
      goto LABEL_35;
    case 0x21uLL:
      v16 = -[PKPaymentPassDetailViewController _rowIndexForExpressTransitSettingsCell](self, "_rowIndexForExpressTransitSettingsCell");
      v14 = v16 == objc_msgSend(v7, "row");
      goto LABEL_28;
    case 0x24uLL:
      v17 = objc_msgSend(v6, "row");
      if (v17 >= -[NSArray count](self->_sortedFamilyMemberRowModels, "count"))
        goto LABEL_20;
      -[NSArray objectAtIndex:](self->_sortedFamilyMemberRowModels, "objectAtIndex:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "state");
      if (v19 > 4)
      {

LABEL_34:
        v11 = -[PKPaymentPassDetailViewController canSelectAccountUserRowAtIndexPath:](self, "canSelectAccountUserRowAtIndexPath:", v7);
LABEL_35:
        LOBYTE(v8) = v11;
      }
      else
      {
        v8 = (0xEu >> v19) & 1;

      }
      break;
    case 0x27uLL:
      LOBYTE(v8) = -[PKPaymentPassDetailViewController _transactionsCount](self, "_transactionsCount") != 0;
      break;
    case 0x31uLL:
      if (self->_requestingStatement)
      {
LABEL_23:
        LOBYTE(v8) = 0;
      }
      else
      {
        v12 = 1721;
LABEL_27:
        v14 = *((_BYTE *)&self->super.super.super.super.super.isa + v12) == 0;
LABEL_28:
        LOBYTE(v8) = v14;
      }
      break;
    case 0x35uLL:
      v10 = -[PKPaymentPassDetailViewController _isDeletingPass](self, "_isDeletingPass");
LABEL_25:
      LOBYTE(v8) = !v10;
      break;
    default:
LABEL_20:
      LOBYTE(v8) = 1;
      break;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 section:(unint64_t)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v8, 1);
  switch(a5)
  {
    case 2uLL:
      -[PKPaymentPassDetailViewController _didSelectPeerPaymentAccountActionAtIndexPath:](self, "_didSelectPeerPaymentAccountActionAtIndexPath:", v8);
      break;
    case 5uLL:
      -[PKPaymentPassDetailViewController didSelectIdentityDocumentCellInTableView:atIndexPath:](self, "didSelectIdentityDocumentCellInTableView:atIndexPath:", v9, v8);
      break;
    case 6uLL:
      -[PKPaymentPassDetailViewController didSelectReplaceBiometricCellInTableView:atIndexPath:](self, "didSelectReplaceBiometricCellInTableView:atIndexPath:", v9, v8);
      break;
    case 0xBuLL:
      -[PKPaymentPassDetailViewController _didSelectServicingWalletLink](self, "_didSelectServicingWalletLink");
      break;
    case 0xCuLL:
      -[PKPaymentPassDetailViewController didSelectAccountUserCellInTableView:atIndexPath:](self, "didSelectAccountUserCellInTableView:atIndexPath:", v9, v8);
      break;
    case 0xDuLL:
      -[PKPaymentPassDetailViewController _didSelectInstallmentPlansAtIndexPath:](self, "_didSelectInstallmentPlansAtIndexPath:", v8);
      break;
    case 0xEuLL:
      -[PKPaymentPassDetailViewController _didSelectAccountServiceCardNumbersAtIndexPath:](self, "_didSelectAccountServiceCardNumbersAtIndexPath:", v8);
      break;
    case 0xFuLL:
      -[PKPaymentPassDetailViewController _didSelectCreditDetailsCell:](self, "_didSelectCreditDetailsCell:", v8);
      break;
    case 0x10uLL:
      -[PKPaymentPassDetailViewController _didSelectAccountServiceBankAccountsAtIndexPath:](self, "_didSelectAccountServiceBankAccountsAtIndexPath:", v8);
      break;
    case 0x11uLL:
    case 0x20uLL:
    case 0x23uLL:
      -[PKPaymentPassDetailViewController _didSelectMerchantTokensCell](self, "_didSelectMerchantTokensCell");
      break;
    case 0x12uLL:
      -[PKPaymentPassDetailViewController _didSelectProductBenefitsCell](self, "_didSelectProductBenefitsCell");
      break;
    case 0x13uLL:
      -[PKPaymentPassDetailViewController _didSelectAccountServiceMakeDefaultAtIndexPath:](self, "_didSelectAccountServiceMakeDefaultAtIndexPath:", v8);
      break;
    case 0x14uLL:
      -[PKPaymentPassDetailViewController _didSelectAccountServiceRewardsDetailsAtIndexPath:](self, "_didSelectAccountServiceRewardsDetailsAtIndexPath:", v8);
      break;
    case 0x15uLL:
      -[PKPaymentPassDetailViewController _didSelectAccountServicePhysicalCardAtIndexPath:](self, "_didSelectAccountServicePhysicalCardAtIndexPath:", v8);
      break;
    case 0x17uLL:
      -[PKPaymentPassDetailViewController _didSelectTransitTicketAtRow:](self, "_didSelectTransitTicketAtRow:", objc_msgSend(v8, "row"));
      break;
    case 0x19uLL:
      -[PKPaymentPassDetailViewController _didSelectPeerPaymentMoneyActionAtRow:](self, "_didSelectPeerPaymentMoneyActionAtRow:", objc_msgSend(v8, "row"));
      break;
    case 0x1AuLL:
      -[PKPaymentPassDetailViewController _didSelectAutomaticallyAcceptPaymentsPreferenceAtIndexPath:](self, "_didSelectAutomaticallyAcceptPaymentsPreferenceAtIndexPath:", v8);
      break;
    case 0x1BuLL:
      -[PKPaymentPassDetailViewController _didSelectPeerPaymentBankAccountsAtIndexPath:](self, "_didSelectPeerPaymentBankAccountsAtIndexPath:", v8);
      break;
    case 0x1CuLL:
      -[PKPaymentPassDetailViewController _didSelectPaymentApplicationSectionRowAtIndexPath:](self, "_didSelectPaymentApplicationSectionRowAtIndexPath:", v8);
      break;
    case 0x1DuLL:
      -[PKPaymentPassDetailViewController _didSelectPassStateSection](self, "_didSelectPassStateSection");
      break;
    case 0x1EuLL:
      -[PKPaymentPassDetailViewController _didSelectBalanceOrCommutePlanCellAtIndexPath:](self, "_didSelectBalanceOrCommutePlanCellAtIndexPath:", v8);
      break;
    case 0x1FuLL:
      -[PKPaymentPassDetailViewController _didSelectContactBankSectionAtIndexPath:](self, "_didSelectContactBankSectionAtIndexPath:", objc_msgSend(v8, "row"));
      break;
    case 0x21uLL:
      -[PKPaymentPassDetailViewController _didSelectCardInfoCellAtIndexPath:](self, "_didSelectCardInfoCellAtIndexPath:", v8);
      break;
    case 0x24uLL:
      -[PKPaymentPassDetailViewController _didSelectFamilySharingAtIndexPath:](self, "_didSelectFamilySharingAtIndexPath:", v8);
      break;
    case 0x25uLL:
      -[PKPaymentPassDetailViewController _didSelectTransactionTransactionsSwitchInTableView:atIndexPath:](self, "_didSelectTransactionTransactionsSwitchInTableView:atIndexPath:", v9, v8);
      break;
    case 0x26uLL:
      -[PKLinkedApplication openApplication:](self->_linkedApplication, "openApplication:", self);
      break;
    case 0x27uLL:
      -[PKPaymentPassDetailViewController _didSelectTransactionAtIndexPath:](self, "_didSelectTransactionAtIndexPath:", v8);
      break;
    case 0x28uLL:
      -[PKPaymentPassDetailViewController _didSelectTransactionCountByPeriodAtIndexPath:](self, "_didSelectTransactionCountByPeriodAtIndexPath:", v8);
      break;
    case 0x29uLL:
      -[PKPaymentPassDetailViewController _didSelectPassInGroupAtIndexPath:](self, "_didSelectPassInGroupAtIndexPath:", v8);
      break;
    case 0x2AuLL:
      -[PKPaymentPassDetailViewController _didSelectBillingAddress](self, "_didSelectBillingAddress");
      break;
    case 0x2BuLL:
      -[PKPaymentPassDetailViewController didSelectPayLaterEligibleSpendCellInTableView:atIndexPath:](self, "didSelectPayLaterEligibleSpendCellInTableView:atIndexPath:", v9, v8);
      break;
    case 0x2CuLL:
      -[PKPaymentPassDetailViewController didSelectFinancingPlanListCellInTableView:atIndexPath:](self, "didSelectFinancingPlanListCellInTableView:atIndexPath:", v9, v8);
      break;
    case 0x2DuLL:
      -[PKPaymentPassDetailViewController didSelectPersonalInformationCellInTableView:atIndexPath:](self, "didSelectPersonalInformationCellInTableView:atIndexPath:", v9, v8);
      break;
    case 0x2EuLL:
      -[PKPaymentPassDetailViewController _didSelectNetworkBenefitsCell](self, "_didSelectNetworkBenefitsCell");
      break;
    case 0x2FuLL:
      -[PKPaymentPassDetailViewController _didSelectPeerPaymentManualIdentityVerificationAtIndexPath:](self, "_didSelectPeerPaymentManualIdentityVerificationAtIndexPath:", v8);
      break;
    case 0x30uLL:
      -[PKPaymentPassDetailViewController _didSelectPeerPaymentParticipantGradutionAtIndexPath:](self, "_didSelectPeerPaymentParticipantGradutionAtIndexPath:", v8);
      break;
    case 0x31uLL:
      -[PKPaymentPassDetailViewController _didSelectPeerPaymentStatementAtIndexPath:](self, "_didSelectPeerPaymentStatementAtIndexPath:", v8);
      break;
    case 0x32uLL:
      -[PKPaymentPassDetailViewController didSelectVerifySSNCellInTableView:atIndexPath:](self, "didSelectVerifySSNCellInTableView:atIndexPath:", v9, v8);
      break;
    case 0x33uLL:
      -[PKPaymentPassDetailViewController _didSelectPrivacySectionAtRow:](self, "_didSelectPrivacySectionAtRow:", objc_msgSend(v8, "row"));
      break;
    case 0x34uLL:
      -[PKPaymentPassDetailViewController didSelectAccountUserStopSharingCellInTableView:atIndexPath:](self, "didSelectAccountUserStopSharingCellInTableView:atIndexPath:", v9, v8);
      break;
    case 0x35uLL:
      -[PKPaymentPassDetailViewController _didSelectPassOperationsSectionAtIndexPath:](self, "_didSelectPassOperationsSectionAtIndexPath:", v8);
      break;
    default:
      break;
  }

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __104__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "uniqueID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (PKEqualObjects())
  {
    v2 = PKEqualObjects();

    if ((v2 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_refreshDisplayWithBalances:plans:transitProperties:", 0, 0, *(_QWORD *)(a1 + 48));
  }
  else
  {

  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKPaymentPassDetailViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentPassDetailViewController_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __87__PKPaymentPassDetailViewController_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasBackingData");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "hasDeviceTransactionSourceIdentifier:", *(_QWORD *)(a1 + 48));
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 40), "_startPendingTransactionTimer");
  }
  return result;
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentPassDetailViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__PKPaymentPassDetailViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  _QWORD v3[5];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "hasDeviceTransactionSourceIdentifier:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1480), "objectForKey:", *(_QWORD *)(a1 + 48));
    v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __100__PKPaymentPassDetailViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_2;
      v3[3] = &unk_1E3E612E8;
      v3[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v3);
      v2[2](v2, 1);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1480), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_reloadTransactionSectionsAnimated:forceReload:", 1, 0);
    }

  }
}

uint64_t __100__PKPaymentPassDetailViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadTransactionSectionsAnimated:forceReload:", 0, 0);
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __93__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "uniqueID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "settingSwitch");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setEnabled:", 1);

  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke;
  block[3] = &unk_1E3E64908;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __97__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_cancelPendingTransactionTimer");
  if (objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {
    v3 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __97__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke_2;
      v5[3] = &unk_1E3E62288;
      v5[4] = v3;
      objc_msgSend(v3, "_reloadTransactionsWithCompletion:", v5);
    }
    else
    {
      objc_msgSend(v3, "reloadData:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_reloadTransactionSectionsAnimated:forceReload:", 1, 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "settingSwitch");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEnabled:", 1);

    }
  }

}

void __97__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "reloadPassDetailSections:", &unk_1E3FAEA10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "settingSwitch");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __93__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_refreshDisplayWithBalances:plans:transitProperties:", *(_QWORD *)(a1 + 48), 0, 0);
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __90__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_refreshDisplayWithBalances:plans:transitProperties:", 0, *(_QWORD *)(a1 + 48), 0);
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __119__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke;
  v14[3] = &unk_1E3E62460;
  v14[4] = self;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __119__PKPaymentPassDetailViewController_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  if (v3)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", *(_QWORD *)(a1 + 48), 0);
    objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedBalanceReminder:forBalanceWithIdentifier:", *(_QWORD *)(a1 + 56), v4);

  }
}

- (void)featureApplicationRemoved:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentPassDetailViewController_featureApplicationRemoved___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __63__PKPaymentPassDetailViewController_featureApplicationRemoved___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__PKPaymentPassDetailViewController_featureApplicationRemoved___block_invoke_2;
  v3[3] = &unk_1E3E612E8;
  v3[4] = v1;
  return objc_msgSend(v1, "loadPendingAccountUserInvitationsWithCompletion:", v3);
}

uint64_t __63__PKPaymentPassDetailViewController_featureApplicationRemoved___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFamilyRows");
}

- (void)featureApplicationChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentPassDetailViewController_featureApplicationChanged___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __63__PKPaymentPassDetailViewController_featureApplicationChanged___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__PKPaymentPassDetailViewController_featureApplicationChanged___block_invoke_2;
  v3[3] = &unk_1E3E612E8;
  v3[4] = v1;
  return objc_msgSend(v1, "loadPendingAccountUserInvitationsWithCompletion:", v3);
}

uint64_t __63__PKPaymentPassDetailViewController_featureApplicationChanged___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFamilyRows");
}

- (void)featureApplicationAdded:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentPassDetailViewController_featureApplicationAdded___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __61__PKPaymentPassDetailViewController_featureApplicationAdded___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__PKPaymentPassDetailViewController_featureApplicationAdded___block_invoke_2;
  v3[3] = &unk_1E3E612E8;
  v3[4] = v1;
  return objc_msgSend(v1, "loadPendingAccountUserInvitationsWithCompletion:", v3);
}

uint64_t __61__PKPaymentPassDetailViewController_featureApplicationAdded___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFamilyRows");
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPaymentPassDetailViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PKPaymentPassDetailViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __60__PKPaymentPassDetailViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  id obj;

  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", *(_QWORD *)(a1 + 32));
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 2256), obj);
    objc_msgSend(*(id *)(a1 + 40), "_updateFamilyRows");
  }

}

- (void)_reloadTransactionSourceCollectionIfNecessary
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  PKTransactionSourceCollection *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  PKAccountServiceAccountResolutionController *resolutionController;
  PKDashboardTransactionFetcher *v17;
  PKDashboardTransactionFetcher *transactionFetcher;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", self->_pass);
  objc_msgSend(v3, "addObject:", v4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PKAccountUserCollection accountUsers](self->_accountUserCollection, "accountUsers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithAccountUser:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        objc_msgSend(v3, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  v11 = self->_transactionSourceCollection;
  v12 = objc_alloc(MEMORY[0x1E0D67738]);
  v13 = (void *)objc_msgSend(v3, "copy");
  v14 = (void *)objc_msgSend(v12, "initWithTransactionSources:", v13);

  if ((PKEqualObjects() & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Pass details transaction source manager has changed %@.", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_transactionSourceCollection, v14);
    resolutionController = self->_resolutionController;
    self->_resolutionController = 0;

    v17 = (PKDashboardTransactionFetcher *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C98]), "initWithTransactionSourceCollection:paymentDataProvider:", self->_transactionSourceCollection, self->_paymentServiceDataProvider);
    transactionFetcher = self->_transactionFetcher;
    self->_transactionFetcher = v17;

    -[PKPaymentPassDetailViewController _reloadTransactionSectionsAnimated:forceReload:](self, "_reloadTransactionSectionsAnimated:forceReload:", 1, 0);
  }

}

- (void)_reloadTransactionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  PKDashboardTransactionFetcher *transactionFetcher;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  PKPaymentDataProvider *paymentServiceDataProvider;
  void *v14;
  _QWORD block[5];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v4 = a3;
  if (-[PKPaymentPassDetailViewController _isBankConnectLinked](self, "_isBankConnectLinked"))
  {
    -[FKBankConnectTransactionsAndGroupsProvider performFetchAndStartObservingNotifications](self->_bankConnectTransactionsAndGroupsProvider, "performFetchAndStartObservingNotifications");
  }
  else
  {
    -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paymentNetworkIdentifier");

    v6 = PKMaxPaymentTransactionsForCredentialType();
    v7 = dispatch_group_create();
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__64;
    v28[4] = __Block_byref_object_dispose__64;
    v29 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__64;
    v26[4] = __Block_byref_object_dispose__64;
    v27 = 0;
    dispatch_group_enter(v7);
    transactionFetcher = self->_transactionFetcher;
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__PKPaymentPassDetailViewController__reloadTransactionsWithCompletion___block_invoke;
    v23[3] = &unk_1E3E633C0;
    v25 = v28;
    v10 = v7;
    v24 = v10;
    -[PKDashboardTransactionFetcher reloadTransactionsWithCompletion:](transactionFetcher, "reloadTransactionsWithCompletion:", v23);
    if ((self->_peerPaymentAccount || self->_account) && (objc_opt_respondsToSelector() & 1) != 0)
    {
      dispatch_group_enter(v10);
      v11 = objc_alloc_init(MEMORY[0x1E0D673A0]);
      -[PKTransactionSourceCollection transactionSourceIdentifiers](self->_transactionSourceCollection, "transactionSourceIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTransactionSourceIdentifiers:", v12);

      paymentServiceDataProvider = self->_paymentServiceDataProvider;
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      v19[1] = 3221225472;
      v19[2] = __71__PKPaymentPassDetailViewController__reloadTransactionsWithCompletion___block_invoke_2;
      v19[3] = &unk_1E3E79748;
      v21 = v26;
      v22 = v6;
      v20 = v10;
      -[PKPaymentDataProvider transactionCountByPeriodForRequest:calendar:calendarUnit:includePurchaseTotal:completion:](paymentServiceDataProvider, "transactionCountByPeriodForRequest:calendar:calendarUnit:includePurchaseTotal:completion:", v11, v14, 4, 0, v19);

    }
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __71__PKPaymentPassDetailViewController__reloadTransactionsWithCompletion___block_invoke_3;
    block[3] = &unk_1E3E6BEE8;
    block[4] = self;
    v17 = v28;
    v18 = v26;
    v16 = v4;
    dispatch_group_notify(v10, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v28, 8);

  }
}

void __71__PKPaymentPassDetailViewController__reloadTransactionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3928];
  v4 = a2;
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", CFSTR("transactionDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "copy");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __71__PKPaymentPassDetailViewController__reloadTransactionsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  v5 = v3;
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v3);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "transactionCount", (_QWORD)v12);
        if (v7 > *(_QWORD *)(a1 + 48))
        {

          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v11 = v3;
          v5 = *(void **)(v10 + 40);
          *(_QWORD *)(v10 + 40) = v11;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
    v5 = v3;
  }
LABEL_11:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__PKPaymentPassDetailViewController__reloadTransactionsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_transactionSectionsDataIsChangedForNewTransactions:oldTransactions:newtransactionCountByPeriod:oldtransactionCountByPeriod:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1232));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1224), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1232), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_cancelPendingTransactionTimer");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (BOOL)_transactionSectionsDataIsChangedForNewTransactions:(id)a3 oldTransactions:(id)a4 newtransactionCountByPeriod:(id)a5 oldtransactionCountByPeriod:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v9 == v10)
    LOBYTE(v13) = 0;
  else
    v13 = objc_msgSend(v9, "isEqual:", v10) ^ 1;
  if (v11 != v12 && (v13 & 1) == 0)
    v13 = objc_msgSend(v11, "isEqual:", v12) ^ 1;

  return v13;
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentPassDetailViewController_physicalCardsChanged_forAccountIdentifier___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __79__PKPaymentPassDetailViewController_physicalCardsChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  char v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 2216);
  if (!v2)
    return;
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v2, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  if (v5 == v6)
  {

    goto LABEL_8;
  }
  v8 = v6;
  if (!v5 || !v6)
  {

    return;
  }
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
LABEL_8:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1624), "updateWithPhysicalCards:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "reloadSection:", 21);
  }
}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKPaymentPassDetailViewController_accountUsersChanged_forAccountIdentifier___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __78__PKPaymentPassDetailViewController_accountUsersChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 2216);
  if (!v2)
    return;
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v2, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  if (v5 == v6)
  {

    goto LABEL_8;
  }
  v11 = v6;
  if (!v5 || !v6)
  {

    return;
  }
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
LABEL_8:
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66940]), "initWithAccountUsers:", *(_QWORD *)(a1 + 48));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 2112);
    *(_QWORD *)(v9 + 2112) = v8;

    objc_msgSend(*(id *)(a1 + 32), "_updateFamilyRows");
    objc_msgSend(*(id *)(a1 + 32), "_reloadTransactionSourceCollectionIfNecessary");
    objc_msgSend(*(id *)(a1 + 32), "_updateCashbackPeerPaymentResolutionSection");
  }
}

- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentPassDetailViewController_accountFinancingPlanAdded_accountIdentifier___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __81__PKPaymentPassDetailViewController_accountFinancingPlanAdded_accountIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchFinancingPlansIfNecessary");
}

- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentPassDetailViewController_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __100__PKPaymentPassDetailViewController_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchFinancingPlansIfNecessary");
}

- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKPaymentPassDetailViewController_accountFinancingPlanRemoved_accountIdentifier___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __83__PKPaymentPassDetailViewController_accountFinancingPlanRemoved_accountIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchFinancingPlansIfNecessary");
}

- (void)_applyDefaultStaticStylingToCell:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  if (self->_highlightColor)
  {
    v4 = (objc_class *)MEMORY[0x1E0DC3F10];
    v5 = a3;
    v6 = [v4 alloc];
    v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v7, "setBackgroundColor:", self->_highlightColor);
    objc_msgSend(v5, "setSelectedBackgroundView:", v7);

  }
  else
  {
    objc_msgSend(a3, "setSelectedBackgroundView:", 0);
  }
  PKAccessibilityIDDefaultCellSet(a3);

}

- (void)_applyDefaultDynamicStylingToCell:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setAccessoryType:", 0);
  objc_msgSend(v3, "setSelectionStyle:", 3);
  PKAccessibilityIDDefaultCellSet(v3);

}

- (id)_defaultCellWithTextColor:(id)a3 forTableView:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("Cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("Cell"));
    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v7);
  }
  -[PKPaymentPassDetailViewController _applyDefaultDynamicStylingToCell:](self, "_applyDefaultDynamicStylingToCell:", v7);
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", 0);
  objc_msgSend(v8, "setTextColor:", v6);

  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  objc_msgSend(v7, "setAccessoryView:", 0);

  return v7;
}

- (id)_value1CellWithTextColor:(id)a3 forTableView:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("Cell-Value1"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("Cell-Value1"));
    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v7);
  }
  -[PKPaymentPassDetailViewController _applyDefaultDynamicStylingToCell:](self, "_applyDefaultDynamicStylingToCell:", v7);
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", 0);
  objc_msgSend(v8, "setTextColor:", v6);

  objc_msgSend(v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  objc_msgSend(v7, "setAccessoryView:", 0);

  return v7;
}

- (id)_subtitleCellForTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SubtitleCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("SubtitleCell"));
    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v4);
    objc_msgSend(v4, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

    objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  }
  -[PKPaymentPassDetailViewController _applyDefaultDynamicStylingToCell:](self, "_applyDefaultDynamicStylingToCell:", v4);
  return v4;
}

- (id)_spinnerCellForTableView:(id)a3
{
  PKLeftAlignedSpinnerCell *v4;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("spinnerCell"));
  v4 = (PKLeftAlignedSpinnerCell *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[PKLeftAlignedSpinnerCell initWithStyle:reuseIdentifier:]([PKLeftAlignedSpinnerCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("spinnerCell"));
    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v4);
    -[PKLeftAlignedSpinnerCell setAccessoryType:](v4, "setAccessoryType:", 0);
    -[PKLeftAlignedSpinnerCell setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (id)_imageViewCellForImage:(id)a3 forTableView:(id)a4
{
  id v6;
  PKImageViewCell *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("imageViewCell"));
  v7 = (PKImageViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[PKImageViewCell initWithReuseIdentifier:]([PKImageViewCell alloc], "initWithReuseIdentifier:", CFSTR("imageViewCell"));
    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v7);
    -[PKImageViewCell setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
  }
  -[PKImageViewCell setImage:](v7, "setImage:", v6);
  objc_msgSend(v6, "pkui_firstPixelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKImageViewCell setBackgroundColor:](v7, "setBackgroundColor:", v8);
  return v7;
}

- (id)_switchCellWithText:(id)a3 forTableView:(id)a4
{
  id v5;
  PKSettingTableCell *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = -[PKSettingTableCell initWithStyle:reuseIdentifier:]([PKSettingTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PKSettingTableCellReuseIdentifier"));
  -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v6);
  -[PKSettingTableCell textLabel](v6, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

  if (self->_primaryTextColor)
  {
    objc_msgSend(v7, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v8);

  }
  objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);

  return v6;
}

- (id)_disabledCellWithText:(id)a3 forTableView:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0DC3658];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "placeholderTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v8);

  objc_msgSend(v10, "setSelectionStyle:", 0);
  return v10;
}

- (id)_linkCellWithText:(id)a3 forTableView:(id)a4
{
  UIColor *linkTextColor;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  linkTextColor = self->_linkTextColor;
  if (linkTextColor)
  {
    v7 = a4;
    v8 = a3;
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", linkTextColor, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DC3658];
    v11 = a4;
    v12 = a3;
    objc_msgSend(v10, "systemBlueColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", a3);

  return v9;
}

- (id)_checkmarkCellWithText:(id)a3 forTableView:(id)a4
{
  id v6;
  id v7;
  UIColor *primaryTextColor;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", primaryTextColor, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v10, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v6);

  if (self->_linkTextColor)
    objc_msgSend(v9, "setTintColor:");

  return v9;
}

- (id)_disclosureCellWithTitle:(id)a3 forTableView:(id)a4
{
  UIColor *primaryTextColor;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    v7 = a4;
    v8 = a3;
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", primaryTextColor, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DC3658];
    v11 = a4;
    v12 = a3;
    objc_msgSend(v10, "labelColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", a3);

  return v9;
}

- (id)_infoCellWithDescription:(id)a3 forTableView:(id)a4
{
  UIColor *detailTextColor;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  detailTextColor = self->_detailTextColor;
  if (detailTextColor)
  {
    v7 = a4;
    v8 = a3;
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", detailTextColor, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DC3658];
    v11 = a4;
    v12 = a3;
    objc_msgSend(v10, "secondaryLabelColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", a3);

  objc_msgSend(v9, "setSelectionStyle:", 0);
  return v9;
}

- (id)_infoCellWithPrimaryText:(id)a3 detailText:(id)a4 cellStyle:(int64_t)a5 forTableView:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("CellStyle-%ld"), a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:", v13, v12, a5, v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_infoCellWithPrimaryText:(id)a3 detailText:(id)a4 cellStyle:(int64_t)a5 reuseIdentifier:(id)a6 forTableView:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend(a7, "dequeueReusableCellWithIdentifier:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", a5, v12);
    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v15);
  }
  -[PKPaymentPassDetailViewController _applyDefaultDynamicStylingToCell:](self, "_applyDefaultDynamicStylingToCell:", v15);
  objc_msgSend(v15, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "detailTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v14);

  objc_msgSend(v17, "setLineBreakMode:", 4);
  objc_msgSend(v17, "setText:", v13);

  if (self->_primaryTextColor)
  {
    objc_msgSend(v16, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v18);

  }
  objc_msgSend(v16, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  if (self->_detailTextColor)
  {
    objc_msgSend(v17, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextColor:", v19);

  }
  objc_msgSend(v17, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);

  return v15;
}

- (id)_stackedInfoCellWithPrimaryText:(id)a3 detailText:(id)a4 cellStyle:(int64_t)a5 forTableView:(id)a6
{
  id v10;
  id v11;
  PKStackedLabelCell *v12;
  void *v13;
  void *v14;

  v10 = a4;
  v11 = a3;
  objc_msgSend(a6, "dequeueReusableCellWithIdentifier:", CFSTR("StackedInfoCellIdentifier"));
  v12 = (PKStackedLabelCell *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = -[PKStackedLabelCell initWithStyle:reuseIdentifier:]([PKStackedLabelCell alloc], "initWithStyle:reuseIdentifier:", a5, CFSTR("StackedInfoCellIdentifier"));
    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v12);
    if (self->_primaryTextColor)
    {
      -[PKStackedLabelCell setTitleTextColor:](v12, "setTitleTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStackedLabelCell setTitleTextColor:](v12, "setTitleTextColor:", v13);

    }
    if (self->_detailTextColor)
    {
      -[PKStackedLabelCell setDetailTextColor:](v12, "setDetailTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStackedLabelCell setDetailTextColor:](v12, "setDetailTextColor:", v14);

    }
  }
  -[PKPaymentPassDetailViewController _applyDefaultDynamicStylingToCell:](self, "_applyDefaultDynamicStylingToCell:", v12);
  -[PKStackedLabelCell setTitleText:](v12, "setTitleText:", v11);

  -[PKStackedLabelCell setDetailText:](v12, "setDetailText:", v10);
  return v12;
}

- (id)_familyMemberCellWithRowModel:(id)a3 forTableView:(id)a4
{
  id v6;
  PKFamilyMemberTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("familyMemberCell"));
  v7 = (PKFamilyMemberTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[PKFamilyMemberTableViewCell initWithStyle:reuseIdentifier:]([PKFamilyMemberTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("familyMemberCell"));
    -[PKFamilyMemberTableViewCell textLabel](v7, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (self->_primaryTextColor)
    {
      objc_msgSend(v8, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTextColor:", v10);

    }
    -[PKFamilyMemberTableViewCell detailTextLabel](v7, "detailTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (self->_detailTextColor)
    {
      objc_msgSend(v11, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextColor:", v13);

    }
  }
  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E0D67BB8]);
  -[PKFamilyMemberTableViewCell setRowModel:](v7, "setRowModel:", v6);

  return v7;
}

- (id)_widgetCellForTableView:(id)a3
{
  PKPassDetailButtonsCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PassActionWidgetCell"));
  v4 = (PKPassDetailButtonsCell *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[PKPassDetailButtonsCell initWithReuseIdentifier:widgetViewStyle:]([PKPassDetailButtonsCell alloc], "initWithReuseIdentifier:widgetViewStyle:", CFSTR("PassActionWidgetCell"), self->_detailViewStyle != 0);
    -[PKPassDetailButtonsCell setDelegate:](v4, "setDelegate:", self);
  }
  objc_storeStrong((id *)&self->_widgetCell, v4);
  -[PKPassDetailButtonsCell setPaymentPass:](v4, "setPaymentPass:", self->_pass);
  if (-[PKPaymentPassDetailViewController _isBankConnectLinked](self, "_isBankConnectLinked"))
    -[PKPassDetailButtonsCell setBankConnectAccount:](v4, "setBankConnectAccount:", self->_bankConnectAccount);
  if (self->_account)
    -[PKPassDetailButtonsCell setAccount:](v4, "setAccount:");
  if (-[PKPaymentPass hasAssociatedPeerPaymentAccount](self->_pass, "hasAssociatedPeerPaymentAccount"))
  {
    -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "associatedPassUniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
      -[PKPassDetailButtonsCell setPeerPaymentAccount:](v4, "setPeerPaymentAccount:", self->_peerPaymentAccount);
  }
  -[PKFamilyMemberCollection currentUser](self->_familyCollection, "currentUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassDetailButtonsCell setCurrentUser:](v4, "setCurrentUser:", v10);

  return v4;
}

- (id)_linkedAppCellForTableView:(id)a3
{
  PKLinkedAppView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKLinkedAppViewReuseIdentifier"));
  v4 = (PKLinkedAppView *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[PKLinkedAppView initWithLinkedApplication:reuseIdentifier:]([PKLinkedAppView alloc], "initWithLinkedApplication:reuseIdentifier:", self->_linkedApplication, CFSTR("PKLinkedAppViewReuseIdentifier"));
    -[PKLinkedAppView linkedAppView](v4, "linkedAppView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v4);
  }
  if (self->_detailViewStyle == 2)
  {
    PKBridgeTextColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLinkedAppView setMainLabelColor:](v4, "setMainLabelColor:", v6);

    PKBridgeAltTextColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLinkedAppView setSubTextLabelColor:](v4, "setSubTextLabelColor:", v7);

    BPSBridgeTintColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLinkedAppView setButtonTintColor:](v4, "setButtonTintColor:", v8);

  }
  return v4;
}

- (id)_linkedApplicationCellForTableView:(id)a3
{
  PKLinkedApplicationActionCell *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("LinkedAppActionCell"));
  v4 = (PKLinkedApplicationActionCell *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[PKLinkedApplicationActionCell initWithLinkedApplication:reuseIdentifier:]([PKLinkedApplicationActionCell alloc], "initWithLinkedApplication:reuseIdentifier:", self->_linkedApplication, CFSTR("LinkedAppActionCell"));
    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v4);
    -[PKLinkedApplicationActionCell setTextColor:](v4, "setTextColor:", self->_linkTextColor);
    objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "altTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLinkedApplicationActionCell setDisabledTextColor:](v4, "setDisabledTextColor:", v6);

  }
  PKAccessibilityIDCellSet(v4, (void *)*MEMORY[0x1E0D67D00]);
  return v4;
}

- (id)_moreTransactionsCellForTableView:(id)a3
{
  UIColor *linkTextColor;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  linkTextColor = self->_linkTextColor;
  if (linkTextColor)
  {
    v5 = a3;
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", linkTextColor, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0DC3658];
    v8 = a3;
    objc_msgSend(v7, "systemBlueColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v5, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("TRANSACTIONS_MORE_TRANSACTIONS"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68150]);
  return v6;
}

- (id)_billingAddressCellShowingAddress:(BOOL)a3 forTableView:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  CNContact *v8;
  CNContact *billingContact;
  CNContact *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  v6 = a4;
  if (!self->_account)
  {
    objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultBillingAddressForPaymentPass:", self->_pass);
    v8 = (CNContact *)objc_claimAutoreleasedReturnValue();
    billingContact = self->_billingContact;
    self->_billingContact = v8;

  }
  v10 = self->_billingContact;
  if (v10)
    v11 = !v4;
  else
    v11 = 1;
  if (v11)
  {
    PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSACTION_DEFAULTS_BILLING_ADDRESS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _disclosureCellWithTitle:forTableView:](self, "_disclosureCellWithTitle:forTableView:", v13, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentPassDetailViewController _subtitleCellForTableView:](self, "_subtitleCellForTableView:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContact pkSingleLineFormattedContactAddress](v10, "pkSingleLineFormattedContactAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContact pk_displayName](v10, "pk_displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length"))
    {
      PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSACTION_DEFAULTS_DEFAULT_ADDRESS_LABEL"));
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    objc_msgSend(v12, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v14);

    if (self->_primaryTextColor)
    {
      objc_msgSend(v12, "textLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTextColor:", self->_primaryTextColor);

    }
    objc_msgSend(v12, "detailTextLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v13);

    objc_msgSend(v12, "detailTextLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (self->_detailTextColor)
    {
      objc_msgSend(v19, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTextColor:", v21);

    }
  }

  objc_msgSend(v12, "setAccessoryType:", 1);
  objc_msgSend(v12, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67970]);

  return v12;
}

- (void)_didSelectBillingAddress
{
  void *v3;
  uint64_t v4;
  void *v5;
  PKAccountServiceBillingAddressViewController *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKPaymentPass *v17;
  id v18;
  PKPaymentPass *v19;
  void *v20;
  uint64_t v21;
  PKPaymentPreferencesListViewController *v22;
  void *v23;
  PKPaymentPreferencesListViewController *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  PKPaymentPass *v31;
  id v32;
  _QWORD aBlock[5];
  id v34;
  id location;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_pass, "associatedAccountServiceAccountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__PKPaymentPassDetailViewController__didSelectBillingAddress__block_invoke;
    aBlock[3] = &unk_1E3E652D8;
    objc_copyWeak(&v34, &location);
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    v6 = -[PKAccountServiceBillingAddressViewController initWithBillingAddress:account:accountService:detailViewStyle:handler:]([PKAccountServiceBillingAddressViewController alloc], "initWithBillingAddress:account:accountService:detailViewStyle:handler:", self->_billingContact, self->_account, self->_accountService, self->_detailViewStyle, v5);
    -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v6, 1);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultBillingAddressForPaymentPass:", self->_pass);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safelyAddObject:", v10);

    PKLocalizedPaymentString(CFSTR("SETTINGS_OPTIONS_BILLING_ADDRESS_VC_TITLE"));
    v26 = objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_BILLINGADDRESS_GROUP_NAME"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0D67200]);
    if (objc_msgSend(v8, "count"))
      v12 = 0;
    else
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    v13 = (void *)objc_msgSend(v11, "initWithTitle:preferences:selectedIndex:readOnly:", v28, v8, v12, 0, v26);
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ENTER_NEW_BILLINGADDRESS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAddNewTitle:", v14);

    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_ADD_EXISTING_BILLINGADDRESS"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAddExistingTitle:", v15);

    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT_EXISTING_BILLINGADDRESS"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEditExistingTitle:", v16);

    objc_msgSend(v13, "setContactKey:", *MEMORY[0x1E0C967F0]);
    objc_msgSend(v13, "mergeRecentsAndMeCard");
    objc_msgSend(v13, "setType:", 0);
    if (!objc_msgSend(v8, "count") || self->_account)
      objc_msgSend(v13, "setSelectedIndex:", 0x7FFFFFFFFFFFFFFFLL);
    PKContactFormatAssignFormatErrorsToPreferenceContact();
    v17 = self->_pass;
    objc_initWeak(&location, self);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __61__PKPaymentPassDetailViewController__didSelectBillingAddress__block_invoke_2;
    v29[3] = &unk_1E3E69538;
    objc_copyWeak(&v32, &location);
    v18 = v13;
    v30 = v18;
    v19 = v17;
    v31 = v19;
    v20 = _Block_copy(v29);
    if (self->_detailViewStyle == 2)
      v21 = 2;
    else
      v21 = 1;
    v22 = [PKPaymentPreferencesListViewController alloc];
    v36[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PKPaymentPreferencesListViewController initWithPreferences:title:style:handler:contactFormatValidator:](v22, "initWithPreferences:title:style:handler:contactFormatValidator:", v23, v27, v21, v20, self->_contactFormatValidator);

    -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pushViewController:animated:", v24, 1);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
}

void __61__PKPaymentPassDetailViewController__didSelectBillingAddress__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1760), a2);
    objc_msgSend(WeakRetained, "_reloadPassAndView");
  }

}

void __61__PKPaymentPassDetailViewController__didSelectBillingAddress__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "selectedIndex");
    objc_msgSend(*(id *)(a1 + 32), "preferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v3 >= v5)
    {
      objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "defaultBillingAddressForPaymentPass:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deleteDefaultBillingAddress:", v9);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "preferences");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "selectedIndex"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDefaultBillingAddress:forPaymentPass:", v7, *(_QWORD *)(a1 + 40));
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PKPaymentPassDetailViewController__didSelectBillingAddress__block_invoke_3;
    block[3] = &unk_1E3E612E8;
    v11 = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __61__PKPaymentPassDetailViewController__didSelectBillingAddress__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadPassAndView");
}

- (id)_privacyTermsSectionCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  void *v4;
  id v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  PKAccount *account;
  uint64_t v13;
  void *v14;
  uint8_t v16[16];

  v7 = a4;
  v8 = -[PKPaymentPassDetailViewController _privacyTermsInfoRowTypeForRowIndex:](self, "_privacyTermsInfoRowTypeForRowIndex:", a3);
  if (v8)
  {
    if (v8 == 2)
    {
      PKLocalizedPaymentString(CFSTR("TERMS_BUTTON_TEXT"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      account = self->_account;
      if (account && -[PKAccount feature](account, "feature") == 3)
      {
        PKLocalizedCocoonString(CFSTR("PRIVACY_AND_TERMS_BUTTON"));
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v13;
      }
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v11, v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_loadingAccountTermsAndConditions)
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        objc_msgSend(v14, "startAnimating");
        objc_msgSend(v4, "setAccessoryView:", v14);

      }
      PKAccessibilityIDCellSet(v4, (void *)*MEMORY[0x1E0D68100]);

    }
    else if (v8 == 1)
    {
      PKLocalizedPaymentString(CFSTR("PRIVACY_BUTTON_TEXT"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v9, v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      PKAccessibilityIDCellSet(v4, (void *)*MEMORY[0x1E0D67EF0]);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_19D178000, v10, OS_LOG_TYPE_ERROR, "Unknown privacy terms info row!", v16, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (unint64_t)_numberOfPrivacyTermsInfoRows
{
  _BOOL4 v3;
  _BOOL4 v4;
  unint64_t v5;

  v3 = -[PKPaymentPassDetailViewController _shouldShowPrivacyPolicyCell](self, "_shouldShowPrivacyPolicyCell");
  v4 = -[PKPaymentPassDetailViewController _shouldShowTermsCell](self, "_shouldShowTermsCell");
  v5 = 1;
  if (v3)
    v5 = 2;
  if (v4)
    return v5;
  else
    return v3;
}

- (unint64_t)_privacyTermsInfoRowTypeForRowIndex:(int64_t)a3
{
  unint64_t v5;

  if (-[PKPaymentPassDetailViewController _shouldShowPrivacyPolicyCell](self, "_shouldShowPrivacyPolicyCell"))
  {
    v5 = 1;
    if (!a3)
      return v5;
  }
  else
  {
    v5 = 0;
  }
  if (-[PKPaymentPassDetailViewController _shouldShowTermsCell](self, "_shouldShowTermsCell") && v5 == a3)
    return 2;
  else
    return 0;
}

- (unint64_t)_rowIndexForPrivacyTermsInfoRowType:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = -[PKPaymentPassDetailViewController _numberOfPrivacyTermsInfoRows](self, "_numberOfPrivacyTermsInfoRows");
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v7 = 0;
  while (-[PKPaymentPassDetailViewController _privacyTermsInfoRowTypeForRowIndex:](self, "_privacyTermsInfoRowTypeForRowIndex:", v7) != a3)
  {
    if (v6 == ++v7)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (void)_didSelectPrivacySectionAtRow:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[16];

  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

    return;
  }
  v5 = -[PKPaymentPassDetailViewController _privacyTermsInfoRowTypeForRowIndex:](self, "_privacyTermsInfoRowTypeForRowIndex:", a3);
  if (!v5)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D178000, v9, OS_LOG_TYPE_ERROR, "Selected unknown privacy section row!", buf, 2u);
    }
    goto LABEL_16;
  }
  if (v5 == 2)
  {
    if (!-[PKPaymentPassDetailViewController _shouldShowTermsCell](self, "_shouldShowTermsCell"))
      return;
    -[PKPaymentPassDetailViewController _presentTermsAndConditionsWithRow:](self, "_presentTermsAndConditionsWithRow:", a3);
    v9 = (id)*MEMORY[0x1E0D695C8];
    if (!v9)
      return;
    goto LABEL_15;
  }
  if (v5 == 1
    && -[PKPaymentPassDetailViewController _shouldShowPrivacyPolicyCell](self, "_shouldShowPrivacyPolicyCell"))
  {
    -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6AE10]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "openURL:configuration:completionHandler:", v7, 0, 0);

    }
    v9 = (id)*MEMORY[0x1E0D69370];

    if (v9)
    {
LABEL_15:
      -[PKPaymentPassDetailViewController _reportPassDetailsAnalyticsForTappedRowTag:additionalAnalytics:](self, "_reportPassDetailsAnalyticsForTappedRowTag:additionalAnalytics:", v9, 0);
LABEL_16:

    }
  }
}

- (void)presentTermsAndConditions
{
  unint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = -[PKPaymentPassDetailViewController _rowIndexForPrivacyTermsInfoRowType:](self, "_rowIndexForPrivacyTermsInfoRowType:", 2);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_19D178000, v4, OS_LOG_TYPE_ERROR, "Attempted to present terms and conditions, but no terms row was found!", v5, 2u);
    }

  }
  else
  {
    -[PKPaymentPassDetailViewController _presentTermsAndConditionsWithRow:](self, "_presentTermsAndConditionsWithRow:", v3);
  }
}

- (void)_presentTermsAndConditionsWithRow:(unint64_t)a3
{
  PKAccount *account;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKAccountTermsAndConditionsController *v11;
  int64_t detailViewStyle;
  uint64_t v13;
  uint64_t v14;
  PKAccountTermsAndConditionsController *v15;
  PKAccountTermsAndConditionsController *termsController;
  PKAccountTermsAndConditionsController *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  account = self->_account;
  if (account)
  {
    -[PKAccount creditDetails](account, "creditDetails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "termsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (!self->_loadingAccountTermsAndConditions)
      {
        self->_loadingAccountTermsAndConditions = 1;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", CFSTR("PrivacyTermsInfo")));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentPassDetailViewController tableView](self, "tableView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cellForRowAtIndexPath:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaymentPassDetailViewController _showSpinner:inCell:overrideTextColor:](self, "_showSpinner:inCell:overrideTextColor:", 1, v10, 0);
        v11 = [PKAccountTermsAndConditionsController alloc];
        detailViewStyle = self->_detailViewStyle;
        v13 = 3;
        if (detailViewStyle != 1)
          v13 = 0;
        if (detailViewStyle == 2)
          v14 = 4;
        else
          v14 = v13;
        v15 = -[PKAccountTermsAndConditionsController initWithAccount:webService:context:termsIdentifier:](v11, "initWithAccount:webService:context:termsIdentifier:", self->_account, self->_webService, v14, v7);
        termsController = self->_termsController;
        self->_termsController = v15;

        objc_initWeak(location, self);
        v17 = self->_termsController;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __71__PKPaymentPassDetailViewController__presentTermsAndConditionsWithRow___block_invoke;
        v24[3] = &unk_1E3E62598;
        objc_copyWeak(&v25, location);
        -[PKAccountTermsAndConditionsController termsViewControllerWithCompletion:](v17, "termsViewControllerWithCompletion:", v24);
        objc_destroyWeak(&v25);
        objc_destroyWeak(location);

      }
      return;
    }
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v19;
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Error: Account: %@ is missing terms and conditions. Using the value in the pass instead.", (uint8_t *)location, 0xCu);

    }
  }
  else if (-[PKPeerPaymentAccount termsAcceptanceRequired](self->_peerPaymentAccount, "termsAcceptanceRequired", a3))
  {
    -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateAccountWithCompletion:", &__block_literal_global_644);

    return;
  }
  -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6AE20]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "openURL:configuration:completionHandler:", v21, 0, 0);

  }
}

void __71__PKPaymentPassDetailViewController__presentTermsAndConditionsWithRow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BYTE *WeakRetained;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      objc_msgSend(WeakRetained, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else
    {
      if (!v9)
      {
LABEL_7:
        WeakRetained[1652] = 0;
        objc_msgSend(WeakRetained, "reloadSection:", 51);
        goto LABEL_8;
      }
      objc_msgSend(WeakRetained, "navigationController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentViewController:animated:completion:", v9, 1, 0);
    }

    goto LABEL_7;
  }
LABEL_8:

}

void __71__PKPaymentPassDetailViewController__presentTermsAndConditionsWithRow___block_invoke_642(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v2 = a2;
  if (v2)
  {
    if (PKIsPad())
    {
      v3 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "statusBarOrientation"));
      v5 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = &unk_1E3FADD20;
    }
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentPeerPaymentTermsAndConditionsWithAccount:orientation:completion:", v2, v5, &__block_literal_global_649);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Cannot present terms acceptance flow because the account is nil", v7, 2u);
    }
  }

}

void __71__PKPaymentPassDetailViewController__presentTermsAndConditionsWithRow___block_invoke_648()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19D178000, v0, OS_LOG_TYPE_DEFAULT, "Presented Terms & Conditions acceptance flow", v1, 2u);
  }

}

- (void)_didSelectPassOperationsSectionAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "row");
  if (-[PKPaymentPassDetailViewController _shouldShowTransferCell](self, "_shouldShowTransferCell"))
  {
    if (!v4)
      -[PKPaymentPassDetailViewController _didSelectTransferCardAtIndexPath:](self, "_didSelectTransferCardAtIndexPath:", v6);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  if (v5 == v4)
    -[PKPaymentPassDetailViewController _didSelectDeleteCard](self, "_didSelectDeleteCard");

}

- (BOOL)_showExpressDetails
{
  return (-[PKPaymentPass isAccessPass](self->_pass, "isAccessPass") & 1) == 0 && self->_nfcExpressModeSupported;
}

- (BOOL)paymentApplicationShouldShowFullDPAN:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "sanitizedDPAN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "appletDataFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((PKEqualObjects() & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v4, "appletDataFormat");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((PKEqualObjects() & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(v4, "appletDataFormat");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((PKEqualObjects() & 1) != 0 || (-[PKPaymentPass isEMoneyPass](self->_pass, "isEMoneyPass") & 1) != 0)
          v7 = 1;
        else
          v7 = -[PKPaymentPass isSuicaPass](self->_pass, "isSuicaPass");

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)_cardInfoSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id *v23;
  void *v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  int64_t detailViewStyle;
  void *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  id v58;
  unint64_t v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  int64_t v70;
  void *v71;

  v8 = a5;
  if (self->_peerPaymentAccount)
  {
    v9 = 0;
    goto LABEL_34;
  }
  -[PKPaymentPass fieldForKey:](self->_pass, "fieldForKey:", *MEMORY[0x1E0D6ADB0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 1;
    if (a3 && !a4)
    {
      if (PKHandsOnDemoModeEnabled()
        && (PKFakeCardholderName(),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "length"),
            v13,
            v14))
      {
        PKFakeCardholderName();
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = v11;
      }
      v16 = v15;
      PKLocalizedPaymentString(CFSTR("CARD_INFO_NAME"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v17, v16, objc_msgSend(v10, "cellStyle"), v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *a3;
      *a3 = v18;

      objc_msgSend(*a3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679F0]);
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }
  -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("CARD_INFO_NUMBER"));
  v21 = objc_claimAutoreleasedReturnValue();
  v68 = v11;
  if (-[PKPaymentPass supportsBarcodePayment](self->_pass, "supportsBarcodePayment"))
  {
    -[PKPaymentPass organizationName](self->_pass, "organizationName");
    v22 = v8;
    v23 = a3;
    v24 = v20;
    v25 = a4;
    v26 = v12;
    v27 = v10;
    v28 = (void *)v21;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedAquamanString(CFSTR("PASS_INFO_ACCOUNT_NAME"), CFSTR("%@"), v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v10 = v27;
    v12 = v26;
    a4 = v25;
    v20 = v24;
    a3 = v23;
    v8 = v22;

    v21 = v30;
  }
  v71 = (void *)v21;
  if (!-[PKPaymentPass isSuicaPass](self->_pass, "isSuicaPass"))
  {
    if (!-[PKPaymentPass isOctopusPass](self->_pass, "isOctopusPass"))
      goto LABEL_17;
LABEL_20:
    PKSanitizedDeviceAccountNumberForPaymentApplication();
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  objc_msgSend(v20, "sanitizedDPAN");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
    goto LABEL_20;
  v32 = (void *)v31;
  v33 = -[PKPaymentPass isOctopusPass](self->_pass, "isOctopusPass");

  if ((v33 & 1) != 0)
    goto LABEL_20;
LABEL_17:
  if (!-[PKPaymentPassDetailViewController paymentApplicationShouldShowFullDPAN:](self, "paymentApplicationShouldShowFullDPAN:", v20))
  {
    if (-[PKPaymentPassDetailViewController _shouldShowCardNumbersSection](self, "_shouldShowCardNumbersSection"))
    {
LABEL_52:
      v35 = 0;
      goto LABEL_22;
    }
    -[PKPaymentPass primaryAccountNumberSuffix](self->_pass, "primaryAccountNumberSuffix");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65
      || (-[PKPaymentPass sanitizedPrimaryAccountNumber](self->_pass, "sanitizedPrimaryAccountNumber"),
          (v65 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      -[PKPaymentPass sanitizedPrimaryAccountName](self->_pass, "sanitizedPrimaryAccountName");
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v66)
        goto LABEL_52;
    }
    PKSanitizedPrimaryAccountRepresentationForPass();
    v37 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v35 = (void *)v37;
    goto LABEL_22;
  }
  objc_msgSend(v20, "sanitizedDPAN");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  PKFormattedSanitizedPAN();
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedPaymentString(CFSTR("CARD_INFO_DIGITAL_NUMBER"));
  v36 = objc_claimAutoreleasedReturnValue();

  v71 = (void *)v36;
LABEL_22:
  v67 = v10;
  v38 = objc_msgSend(v35, "length");
  v69 = v8;
  v70 = a4;
  if (v38)
  {
    v39 = v12 + 1;
    if (a3 && v12 == a4)
    {
      -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:", v71, v35, 1, CFSTR("cardNumberCell"), v8);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "detailTextLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setAdjustsFontSizeToFitWidth:", 1);

      v42 = v20;
      v43 = *a3;
      *a3 = v40;
      v44 = v40;

      v20 = v42;
      objc_msgSend(*a3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679E0]);

    }
  }
  else
  {
    v39 = v12;
  }
  -[PKPaymentPass customerServiceIdentifier](self->_pass, "customerServiceIdentifier");
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v45;
  if (v38 || !v45)
  {
    v47 = v20;
    v9 = v39;
  }
  else
  {
    v47 = v20;
    v9 = v39 + 1;
    if (a3 && v39 == v70)
    {
      PKPassLocalizedStringWithFormat();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:", v48, v46, 1, CFSTR("PKTableViewCellReuseIdentifierCustomerServiceIdentifier"), v69, 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v49, "detailTextLabel");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setAdjustsFontSizeToFitWidth:", 1);

      v51 = *a3;
      *a3 = v49;
      v52 = v49;

      objc_msgSend(*a3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68028]);
    }
  }

  v8 = v69;
  a4 = v70;
LABEL_34:
  if (-[PKPaymentPassDetailViewController _showExpressDetails](self, "_showExpressDetails"))
  {
    detailViewStyle = self->_detailViewStyle;
    if (a3)
    {
      if (v9 == a4)
      {
        PKLocalizedPaymentString(CFSTR("EXPRESS_TRANSIT_CELL_TITLE"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_nfcExpressModeEnabled)
          v55 = CFSTR("EXPRESS_MODE_STATE_ON");
        else
          v55 = CFSTR("EXPRESS_MODE_STATE_OFF");
        PKLocalizedPaymentString(&v55->isa);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:", v54, v56, 1, CFSTR("expressState"), v8);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = *a3;
        *a3 = v57;

        if (detailViewStyle)
          objc_msgSend(*a3, "setAccessoryType:", 1);
        objc_msgSend(*a3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67BA8]);
      }
      v59 = v9 + 1;
      if (!detailViewStyle)
      {
        v59 = v9 + 2;
        if (v9 + 1 == a4)
        {
          PKLocalizedPaymentString(CFSTR("EXPRESS_TRANSIT_SETTINGS_CELL_TITLE"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v60, v8);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = *a3;
          *a3 = v61;

          objc_msgSend(*a3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67BB0]);
        }
      }
    }
    else
    {
      v63 = 1;
      if (!detailViewStyle)
        v63 = 2;
      v59 = v63 + v9;
    }
  }
  else
  {
    v59 = v9;
  }

  return v59;
}

- (unint64_t)_accessPersonInfoSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v38;
  void *v39;
  void *v40;

  v8 = a5;
  -[PKPaymentPass fieldForKey:](self->_pass, "fieldForKey:", *MEMORY[0x1E0D6ADB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = 0;
    goto LABEL_15;
  }
  v11 = 1;
  if (a3 && !a4)
  {
    if (PKHandsOnDemoModeEnabled()
      && (PKFakeCardholderName(),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "length"),
          v12,
          v13))
    {
      PKFakeCardholderName();
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v10;
    }
    v15 = v14;
    if (self->_isAppleAccess)
    {
      v16 = CFSTR("EMPLOYEE_INFO_CARDHOLDER_NAME");
    }
    else
    {
      objc_msgSend(v9, "label");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v9, "label");
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      v16 = CFSTR("ACCESS_CARDHOLDER_NAME");
    }
    PKLocalizedPaymentString(&v16->isa);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v19 = (void *)v17;
    -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v17, v15, objc_msgSend(v9, "cellStyle"), v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *a3;
    *a3 = v20;

    v11 = 1;
  }
LABEL_15:
  -[PKPaymentPass fieldForKey:](self->_pass, "fieldForKey:", *MEMORY[0x1E0D6ADC0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "value");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v10;
  v40 = v9;
  v24 = v8;
  if (v23)
  {
    v25 = v11 + 1;
    if (a3 && v11 == a4)
    {
      objc_msgSend(v22, "label", v38, v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_isAppleAccess)
        v27 = 1;
      else
        v27 = objc_msgSend(v22, "cellStyle");
      -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v26, v23, v27, v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *a3;
      *a3 = v28;

    }
  }
  else
  {
    v25 = v11;
  }
  -[PKPaymentPass fieldForKey:](self->_pass, "fieldForKey:", *MEMORY[0x1E0D6ADB8], v38);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "value");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = v25 + 1;
    if (a3 && v25 == a4)
    {
      if (self->_isAppleAccess)
        PKLocalizedPaymentString(CFSTR("EMPLOYEE_INFO_CARDHOLDER_NUMBER"));
      else
        objc_msgSend(v30, "label");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_isAppleAccess)
        v34 = 1;
      else
        v34 = objc_msgSend(v30, "cellStyle");
      -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v33, v31, v34, v24);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *a3;
      *a3 = v35;

    }
  }
  else
  {
    v32 = v25;
  }

  return v32;
}

- (id)_cardHolderPictureCellForTableView:(id)a3
{
  void *v4;
  PKPaymentPass *pass;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0DC3870];
  pass = self->_pass;
  v6 = a3;
  -[PKPaymentPass cardHolderPicture](pass, "cardHolderPicture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithPKImage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _imageViewCellForImage:forTableView:](self, "_imageViewCellForImage:forTableView:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_cellForField:(id)a3 tableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v8, v9, objc_msgSend(v7, "cellStyle"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(self) = objc_msgSend(v7, "isDrillInField");
  if ((_DWORD)self)
    objc_msgSend(v10, "setAccessoryType:", 1);
  return v10;
}

- (id)_renewActionForRow:(unint64_t)a3 commutePlanIdentifier:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  char v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PKPaymentPassDetailViewController _availableCommutePlanActions](self, "_availableCommutePlanActions");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_33;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v27;
  v10 = (id)*MEMORY[0x1E0D6A808];
  if (v5)
    v11 = v10 == 0;
  else
    v11 = 1;
  v12 = !v11;
  v24 = v12;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
      if (objc_msgSend(v14, "type") == 2)
      {
        v15 = v10;
        v16 = v5;
        v17 = v16;
        if (v10 != v5)
        {
          if ((v24 & 1) != 0)
          {
            v18 = objc_msgSend(v15, "caseInsensitiveCompare:", v16);

            if (!v18)
              goto LABEL_25;
          }
          else
          {

          }
          objc_msgSend(v14, "associatedPlanIdentifier");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v20 = v17;
          v17 = v20;
          if (v19 != v20)
          {
            if (v5 && v19)
            {
              v21 = objc_msgSend(v19, "caseInsensitiveCompare:", v20);

              if (v21)
                goto LABEL_27;
LABEL_25:
              v19 = v8;
              v8 = v14;
            }
            else
            {

            }
            goto LABEL_27;
          }

        }
        goto LABEL_25;
      }
LABEL_27:
      ++v13;
    }
    while (v7 != v13);
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    v7 = v22;
  }
  while (v22);
LABEL_33:

  return v8;
}

- (id)_topUpActionForRow:(unint64_t)a3
{
  PKPaymentPassDetailViewController *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  char v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v36;
  PKPaymentPassDetailViewController *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  char v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v4 = self;
  v54 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_displayableBalanceFields, "count") <= a3)
    return 0;
  -[NSArray objectAtIndexedSubscript:](v4->_displayableBalanceFields, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "foreignReferenceIdentifiers");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (!v7)
  {
    v34 = 0;
    goto LABEL_55;
  }
  v8 = *(_QWORD *)v49;
  v9 = (void *)*MEMORY[0x1E0D6ACB8];
  v40 = v6;
  v41 = v5;
  v36 = *(_QWORD *)v49;
  v37 = v4;
  v43 = (void *)*MEMORY[0x1E0D6ACB8];
  do
  {
    v10 = 0;
    v39 = v7;
    do
    {
      if (*(_QWORD *)v49 != v8)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v10);
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      -[PKPaymentPassDetailViewController _availableActions](v4, "_availableActions", v36, v37);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (!v13)
        goto LABEL_44;
      v14 = v13;
      v15 = *(_QWORD *)v45;
      if (v9)
        v16 = v11 == 0;
      else
        v16 = 1;
      v17 = !v16;
      v42 = v17;
      v38 = v10;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v19, "type") == 1)
          {
            v20 = v11;
            v21 = v43;
            if (v43 == v11)
              goto LABEL_53;
            if ((v42 & 1) != 0)
            {
              v22 = objc_msgSend(v43, "caseInsensitiveCompare:", v20);

              if (!v22)
                goto LABEL_54;
            }
            else
            {

            }
          }
          if (objc_msgSend(v19, "featured"))
          {
            objc_msgSend(v19, "associatedEnteredValueIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v23)
              goto LABEL_54;
          }
          objc_msgSend(v19, "relevantPropertyIdentifier");
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v25 = v11;
          v26 = v25;
          if (v24 == v25)
          {
            v24 = v25;
            goto LABEL_51;
          }
          if (v11 && v24)
          {
            v27 = objc_msgSend(v24, "caseInsensitiveCompare:", v25);

            if (!v27)
              goto LABEL_52;
          }
          else
          {

          }
          objc_msgSend(v19, "associatedEnteredValueIdentifier");
          v28 = (id)objc_claimAutoreleasedReturnValue();
          v29 = v26;
          v30 = v29;
          if (v28 == v29)
          {

LABEL_51:
LABEL_52:
            v21 = v24;
LABEL_53:

LABEL_54:
            v34 = v19;

            v6 = v40;
            v5 = v41;
            goto LABEL_55;
          }
          if (v11 && v28)
          {
            v31 = objc_msgSend(v28, "caseInsensitiveCompare:", v29);

            if (!v31)
              goto LABEL_54;
          }
          else
          {

          }
          if (objc_msgSend(v19, "type") == 1)
          {
            objc_msgSend(v19, "relevantPropertyIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {

            }
            else
            {
              objc_msgSend(v19, "associatedEnteredValueIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v33)
                goto LABEL_54;
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        v6 = v40;
        v5 = v41;
        v8 = v36;
        v4 = v37;
        v9 = v43;
        v10 = v38;
        if (v14)
          continue;
        break;
      }
LABEL_44:

      ++v10;
    }
    while (v10 != v39);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    v34 = 0;
  }
  while (v7);
LABEL_55:

  return v34;
}

- (id)_balanceForRow:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NSArray objectAtIndexedSubscript:](self->_displayableBalanceFields, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "foreignReferenceIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSDictionary objectForKey:](self->_balances, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_balanceOrCommutePlanCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  NSArray *displayableBalanceFields;
  id v7;
  uint64_t v8;
  void *v9;

  displayableBalanceFields = self->_displayableBalanceFields;
  v7 = a4;
  v8 = -[NSArray count](displayableBalanceFields, "count");
  if (a3 >= v8)
    -[PKPaymentPassDetailViewController _commuterRouteCellForRowIndex:tableView:](self, "_commuterRouteCellForRowIndex:tableView:", a3 - v8, v7);
  else
    -[PKPaymentPassDetailViewController _balanceCellForRowIndex:tableView:](self, "_balanceCellForRowIndex:tableView:", a3, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_commuterRouteCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  PKTransitBalanceModel *transitBalanceModel;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  int v27;
  void *v28;
  void *v29;

  v6 = a4;
  -[PKTransitBalanceModel displayableCommutePlans](self->_transitBalanceModel, "displayableCommutePlans");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") > (unint64_t)a3)
  {
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "properties");
    objc_msgSend(v8, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((PKCommutePlanFieldEitherLabelOrValueIsEmpty() & 1) == 0)
    {
      v28 = v10;
      v13 = v11;
      v14 = v12;
      if (v13 == v14)
      {

      }
      else
      {
        v15 = v14;
        if (v13)
          v16 = v14 == 0;
        else
          v16 = 1;
        if (v16)
        {

          v10 = v28;
          if ((v9 & 4) != 0)
          {
LABEL_15:
            objc_msgSend(v8, "passFieldForKey:", *MEMORY[0x1E0D6BAA0]);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)(objc_msgSend(v18, "foreignReferenceType") - 1) <= 1)
            {
              v29 = v10;
              transitBalanceModel = self->_transitBalanceModel;
              objc_msgSend(v18, "foreignReferenceIdentifiers");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKTransitBalanceModel balanceForIdentifiers:](transitBalanceModel, "balanceForIdentifiers:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v21, "formattedValue");
              v22 = objc_claimAutoreleasedReturnValue();

              v10 = v29;
              v12 = (void *)v22;
            }

          }
LABEL_18:
          PKCommutePlanFormatTitleFromLabelAndValue();
          v23 = v11;

          v24 = v12;
          -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v24, v23, 1, v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[PKPaymentPassDetailViewController _actionForCommutePlan:](self, "_actionForCommutePlan:", v8);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setAccessoryType:", -[PKPaymentPassDetailViewController _commutePlanIsSelectable:action:](self, "_commutePlanIsSelectable:action:", v8, v25));
          PKAccessibilityIDCellSet(v17, (void *)*MEMORY[0x1E0D67A18]);

          goto LABEL_19;
        }
        v27 = objc_msgSend(v13, "isEqualToString:", v14);

        v10 = v28;
        if (!v27)
        {
          if ((v9 & 4) != 0)
            goto LABEL_15;
          goto LABEL_18;
        }
      }
    }
    if ((v9 & 4) != 0)
      goto LABEL_15;
    goto LABEL_18;
  }
  v17 = 0;
LABEL_19:

  return v17;
}

- (id)_balanceCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t detailViewStyle;
  id v13;
  id v14;
  PKBackFieldTableCell *v15;

  v6 = a4;
  if (-[NSArray count](self->_displayableBalanceFields, "count") <= a3)
  {
    v15 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_displayableBalanceFields, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Balance-%@-%@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    detailViewStyle = self->_detailViewStyle;
    v13 = v11;
    v14 = v7;
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v13);
    v15 = (PKBackFieldTableCell *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      v15 = -[PKBackFieldTableCell initWithBridgeStyle:reuseIdentifier:]([PKBackFieldTableCell alloc], "initWithBridgeStyle:reuseIdentifier:", detailViewStyle == 2, v13);
    -[PKBackFieldTableCell setShowLinks:](v15, "setShowLinks:", 0);
    -[PKBackFieldTableCell setField:](v15, "setField:", v14);

    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v15);
    -[PKPaymentPassDetailViewController _applyDefaultDynamicStylingToCell:](self, "_applyDefaultDynamicStylingToCell:", v15);
    -[PKBackFieldTableCell setAccessoryType:](v15, "setAccessoryType:", -[PKPaymentPassDetailViewController _canSelectBalanceOrCommutePlanCellAtRowIndex:](self, "_canSelectBalanceOrCommutePlanCellAtRowIndex:", a3));

  }
  PKAccessibilityIDCellSet(v15, (void *)*MEMORY[0x1E0D67928]);

  return v15;
}

- (id)_balanceReminderCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6;
  PKPaymentBalanceReminder *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *i;
  void *v19;
  NSDecimalNumber *v20;
  void *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!self->_transitProperties)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_5;
  }
  if (a3)
  {
    v7 = 0;
    v8 = 0;
    --a3;
    goto LABEL_5;
  }
  PKLocalizedPaymentString(CFSTR("LOW_BALANCE_REMINDER_SETUP_CELL_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v15, 0, 1, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_transitPropertiesBalanceReminder;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[PKPaymentPassDetailViewController _availableActions](self, "_availableActions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v17 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v16);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v19, "type") == 1)
        {
          v8 = v19;
          goto LABEL_20;
        }
      }
      v8 = (id)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_20:

  if (!v11)
  {
    a3 = -1;
LABEL_5:
    if (a3 >= -[NSArray count](self->_displayableBalanceFields, "count"))
    {
      v11 = 0;
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_displayableBalanceFields, "objectAtIndexedSubscript:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "label");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v10, 0, 1, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "foreignReferenceIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        -[NSDictionary objectForKeyedSubscript:](self->_actionForBalanceIdentifier, "objectForKeyedSubscript:", v12);
        v13 = objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKeyedSubscript:](self->_reminderForBalanceIdentifier, "objectForKeyedSubscript:", v12);
        v14 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v13;
        v7 = (PKPaymentBalanceReminder *)v14;
      }

    }
  }
  if (v8)
  {
    if (v7 && -[PKPaymentBalanceReminder isEnabled](v7, "isEnabled"))
    {
      -[PKPaymentBalanceReminder threshold](v7, "threshold");
      v20 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "enteredValueItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currency");
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "formattedStringValue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("LOW_BALANCE_REMINDER_SETUP_CELL_SUBTITLE_FORMAT_STRING"), CFSTR("%@"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "detailTextLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v25);

    }
    else
    {
      objc_msgSend(v11, "detailTextLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("COMMUTE_PLAN_RENEWAL_REMINDER_SETUP_CELL_SUBTITLE_NO_REMINDER"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v25);
    }

    objc_msgSend(v11, "setAccessoryType:", 1);
  }

  return v11;
}

- (id)_manufacturerInfoCellForTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  PKLocalizedCredentialString(CFSTR("CAR_KEY_ISSUER_NAME_CELL_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass organizationName](self->_pass, "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:", v5, v6, 1, CFSTR("manufacturerInfo"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSelectionStyle:", 0);
  return v7;
}

- (unint64_t)_passOperationsCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  id v14;

  v8 = a5;
  if (-[PKPaymentPassDetailViewController _shouldShowTransferCell](self, "_shouldShowTransferCell"))
  {
    v9 = 1;
    if (a3 && !a4)
    {
      -[PKPaymentPassDetailViewController _transferCardCellForTableView:](self, "_transferCardCellForTableView:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *a3;
      *a3 = v10;

      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }
  if (-[PKPaymentPassDetailViewController _shouldShowDeleteCell](self, "_shouldShowDeleteCell"))
  {
    v12 = v9 + 1;
    if (a3 && v9 == a4)
    {
      -[PKPaymentPassDetailViewController _deleteCardCellForTableView:](self, "_deleteCardCellForTableView:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *a3;
      *a3 = v13;

    }
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (unint64_t)_contactBankCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v8 = a5;
  if (!-[PKPaymentPassDetailViewController _shouldShowContactCell](self, "_shouldShowContactCell"))
  {
    v9 = 0;
    goto LABEL_12;
  }
  v9 = 1;
  if (a3 && !a4)
  {
    -[PKPaymentPass organizationName](self->_pass, "organizationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPaymentPass hasAssociatedPeerPaymentAccount](self->_pass, "hasAssociatedPeerPaymentAccount"))
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_CONTACT_NAME"));
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!self->_account)
      {
        if (!self->_isAppleAccess || !-[PKPaymentPass isAccessPass](self->_pass, "isAccessPass"))
          goto LABEL_11;
        -[PKPaymentPass fieldForKey:](self->_pass, "fieldForKey:", *MEMORY[0x1E0D6ADE0]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "value");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        if (v22)
          v24 = (void *)v22;
        else
          v24 = v10;
        v12 = v24;

        v10 = v21;
LABEL_10:

        v10 = v12;
LABEL_11:
        PKLocalizedPaymentString(CFSTR("CONTACT_ISSUER"), CFSTR("%@"), v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v13, v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *a3;
        *a3 = v14;

        v9 = 1;
        goto LABEL_12;
      }
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (id)v11;
    goto LABEL_10;
  }
LABEL_12:
  if (-[PKPaymentPassDetailViewController _shouldShowServiceMode](self, "_shouldShowServiceMode"))
  {
    v16 = v9 + 1;
    if (a3 && v9 == a4)
    {
      PKLocalizedPaymentString(CFSTR("SERVICE_MODE_CELL_TITLE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v17, v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *a3;
      *a3 = v18;

    }
  }
  else
  {
    v16 = v9;
  }

  return v16;
}

- (id)_automaticPresentationCellForTableView:(id)a3
{
  PKSettingTableCell *automaticPresentationSwitch;
  PKSettingTableCell *v5;
  UIColor *primaryTextColor;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKSettingTableCell *v12;

  automaticPresentationSwitch = self->_automaticPresentationSwitch;
  if (!automaticPresentationSwitch)
  {
    v5 = -[PKSettingTableCell initWithStyle:reuseIdentifier:]([PKSettingTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PKSettingTableCellReuseIdentifier"));
    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v5);
    primaryTextColor = self->_primaryTextColor;
    -[PKSettingTableCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (primaryTextColor)
    {
      objc_msgSend(v7, "setTextColor:", self->_primaryTextColor);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextColor:", v9);

    }
    -[PKSettingTableCell textLabel](v5, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("SETTINGS_AUTOMATIC_PRESENTATION_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

    -[PKSettingTableCell setTarget:action:](v5, "setTarget:action:", self, sel__automaticPresentationSwitchChanged_);
    -[PKSettingTableCell setOn:](v5, "setOn:", ((unint64_t)-[PKPaymentPass settings](self->_pass, "settings") >> 4) & 1);
    v12 = self->_automaticPresentationSwitch;
    self->_automaticPresentationSwitch = v5;

    automaticPresentationSwitch = self->_automaticPresentationSwitch;
  }
  return automaticPresentationSwitch;
}

- (id)_expressAccessCellForTableView:(id)a3
{
  PKSettingTableCell *expressAccessSwitch;
  PKSettingTableCell *v5;
  UIColor *primaryTextColor;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 uwbExpressModeSupported;
  void *v11;
  __CFString *v12;
  void *v13;
  PKSettingTableCell *v14;

  expressAccessSwitch = self->_expressAccessSwitch;
  if (!expressAccessSwitch)
  {
    v5 = -[PKSettingTableCell initWithStyle:reuseIdentifier:]([PKSettingTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PKSettingTableCellReuseIdentifier"));
    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v5);
    primaryTextColor = self->_primaryTextColor;
    -[PKSettingTableCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (primaryTextColor)
    {
      objc_msgSend(v7, "setTextColor:", self->_primaryTextColor);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextColor:", v9);

    }
    if (-[PKPaymentPass isHomeKeyPass](self->_pass, "isHomeKeyPass"))
    {
      uwbExpressModeSupported = self->_uwbExpressModeSupported;
      -[PKSettingTableCell textLabel](v5, "textLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (uwbExpressModeSupported)
      {
        v12 = CFSTR("HOME_KEY_EXPRESS_ACCESS_TITLE");
LABEL_10:
        PKLocalizedPaymentString(&v12->isa);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setText:", v13);

        -[PKSettingTableCell setTarget:action:](v5, "setTarget:action:", self, sel__expressAccessSwitchChanged_);
        -[PKSettingTableCell setOn:](v5, "setOn:", self->_nfcExpressModeEnabled);
        PKAccessibilityIDCellSet(v5, (void *)*MEMORY[0x1E0D67BA8]);
        v14 = self->_expressAccessSwitch;
        self->_expressAccessSwitch = v5;

        expressAccessSwitch = self->_expressAccessSwitch;
        return expressAccessSwitch;
      }
    }
    else
    {
      -[PKSettingTableCell textLabel](v5, "textLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = CFSTR("EXPRESS_ACCESS_TITLE");
    goto LABEL_10;
  }
  return expressAccessSwitch;
}

- (id)_uwbExpressAccessCellForTableView:(id)a3
{
  PKSettingTableCell *uwbExpressAccessSwitch;
  PKSettingTableCell *v5;
  UIColor *primaryTextColor;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  PKSettingTableCell *v13;

  uwbExpressAccessSwitch = self->_uwbExpressAccessSwitch;
  if (!uwbExpressAccessSwitch)
  {
    v5 = -[PKSettingTableCell initWithStyle:reuseIdentifier:]([PKSettingTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PKSettingTableCellReuseIdentifier"));
    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v5);
    primaryTextColor = self->_primaryTextColor;
    -[PKSettingTableCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (primaryTextColor)
    {
      objc_msgSend(v7, "setTextColor:", self->_primaryTextColor);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextColor:", v9);

    }
    v10 = -[PKPaymentPass isHomeKeyPass](self->_pass, "isHomeKeyPass");
    -[PKSettingTableCell textLabel](v5, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      PKLocalizedHomeKitUWBString(CFSTR("HOME_KEY_UNLOCK_ON_APPROACH_TITLE"));
    else
      PKLocalizedCredentialString(CFSTR("CAR_KEY_PASSIVE_ENTRY_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v12);

    -[PKSettingTableCell setTarget:action:](v5, "setTarget:action:", self, sel__uwbExpressAccessSwitchChanged_);
    -[PKSettingTableCell setOn:](v5, "setOn:", self->_uwbExpressModeEnabled);
    PKAccessibilityIDCellSet(v5, (void *)*MEMORY[0x1E0D68178]);
    v13 = self->_uwbExpressAccessSwitch;
    self->_uwbExpressAccessSwitch = v5;

    uwbExpressAccessSwitch = self->_uwbExpressAccessSwitch;
  }
  return uwbExpressAccessSwitch;
}

- (id)_passesInGroupCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  PKTableViewCellWithDefaultStyle *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  PKPassView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "row");
  if (v8 == -[PKGroup passCount](self->_group, "passCount"))
  {
    PKLocalizedShareableCredentialString(CFSTR("EDIT_PASSES_IN_GROUP_TEXT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v9, v7);
    v10 = (PKTableViewCellWithDefaultStyle *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("PKPassesInGroupTableCellReuseIdentifier"));
  v10 = (PKTableViewCellWithDefaultStyle *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    v10 = -[PKTableViewCellWithDefaultStyle initWithStyle:reuseIdentifier:]([PKTableViewCellWithDefaultStyle alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PKPassesInGroupTableCellReuseIdentifier"));
  -[PKPaymentPassDetailViewController _applyDefaultDynamicStylingToCell:](self, "_applyDefaultDynamicStylingToCell:", v10);
  -[PKGroup passAtIndex:](self->_group, "passAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableViewCellWithDefaultStyle textLabel](v10, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableViewCellWithDefaultStyle imageView](v10, "imageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", v13))
  {

    goto LABEL_9;
  }
  v14 = -[PKPaymentPass isImageSetLoaded:](self->_pass, "isImageSetLoaded:", 0);

  if (!v14)
  {
LABEL_9:
    v15 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", v9, 4, 2039);
    -[PKPassView setPaused:](v15, "setPaused:", 1);
    -[PKPassView sizeToFit](v15, "sizeToFit");
    goto LABEL_10;
  }
  -[PKPassHeaderView passView](self->_passHeaderView, "passView");
  v15 = (PKPassView *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v15, "snapshotOfFrontFaceWithRequestedSize:", 52.0, 33.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setImage:", v16);
  objc_msgSend(v9, "fieldForKey:", *MEMORY[0x1E0D6ADB0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v18);

  if (self->_primaryTextColor)
  {
    objc_msgSend(v11, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v19);

  }
  -[PKTableViewCellWithDefaultStyle setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);

LABEL_14:
  return v10;
}

- (id)_barcodeCell
{
  PKBarcodeTableViewCell *v3;

  v3 = -[PKBarcodeTableViewCell initWithStyle:reuseIdentifier:]([PKBarcodeTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PKBarcodeTableViewCellReuseIdentifier"));
  -[PKBarcodeTableViewCell setPass:](v3, "setPass:", self->_pass);
  return v3;
}

- (id)_settingsTableCellWithTitle:(id)a3 action:(SEL)a4 setOn:(BOOL)a5 enabled:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  PKSettingTableCell *v11;
  UIColor *primaryTextColor;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = -[PKSettingTableCell initWithStyle:reuseIdentifier:]([PKSettingTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PKSettingTableCellReuseIdentifier"));
  -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v11);
  primaryTextColor = self->_primaryTextColor;
  -[PKSettingTableCell textLabel](v11, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (primaryTextColor)
  {
    objc_msgSend(v13, "setTextColor:", self->_primaryTextColor);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v15);

  }
  -[PKSettingTableCell textLabel](v11, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v10);

  -[PKSettingTableCell setTarget:action:](v11, "setTarget:action:", self, a4);
  -[PKSettingTableCell setOn:](v11, "setOn:", v7);
  -[PKSettingTableCell setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", v6);
  return v11;
}

- (id)_messagesSwitchCellForTableView:(id)a3
{
  PKSettingTableCell *messagesSwitch;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  PKSettingTableCell *v8;
  PKSettingTableCell *v9;

  messagesSwitch = self->_messagesSwitch;
  if (!messagesSwitch)
  {
    PKLocalizedPaymentString(CFSTR("MESSAGE_SERVICE_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKPaymentPass settings](self->_pass, "settings");
    if ((PKStoreDemoModeEnabled() & 1) != 0)
      v7 = 0;
    else
      v7 = PKUIOnlyDemoModeEnabled() ^ 1;
    -[PKPaymentPassDetailViewController _settingsTableCellWithTitle:action:setOn:enabled:](self, "_settingsTableCellWithTitle:action:setOn:enabled:", v5, sel__messagesSwitchChanged_, (v6 >> 6) & 1, v7);
    v8 = (PKSettingTableCell *)objc_claimAutoreleasedReturnValue();
    v9 = self->_messagesSwitch;
    self->_messagesSwitch = v8;

    PKAccessibilityIDCellSet(self->_messagesSwitch, (void *)*MEMORY[0x1E0D68078]);
    messagesSwitch = self->_messagesSwitch;
  }
  return messagesSwitch;
}

- (id)_peerPaymentNotificationsSwitchCellForIndexPath:(id)a3 tableView:(id)a4
{
  uint64_t v5;
  void **p_dailyCashSwitch;
  PKSettingTableCell *dailyCashSwitch;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void **v13;
  PKSettingTableCell *v14;
  uint64_t v15;

  v5 = objc_msgSend(a3, "row");
  if (v5 == 1)
  {
    p_dailyCashSwitch = (void **)&self->_dailyCashSwitch;
    dailyCashSwitch = self->_dailyCashSwitch;
    if (!dailyCashSwitch)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_NOTIFICATIONS_SWITCH_DAILYCASH"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _settingsTableCellWithTitle:action:setOn:enabled:](self, "_settingsTableCellWithTitle:action:setOn:enabled:", v8, sel__dailyCashSwitchChanged_, (-[PKPaymentPass settings](self->_pass, "settings") & 0x400) == 0, 1);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *p_dailyCashSwitch;
      *p_dailyCashSwitch = (void *)v11;
      v13 = (void **)MEMORY[0x1E0D67A88];
LABEL_11:

      PKAccessibilityIDCellSet(*p_dailyCashSwitch, *v13);
      dailyCashSwitch = (PKSettingTableCell *)*p_dailyCashSwitch;
    }
LABEL_12:
    v14 = dailyCashSwitch;
    return v14;
  }
  if (!v5)
  {
    p_dailyCashSwitch = (void **)&self->_transactionsSwitch;
    dailyCashSwitch = self->_transactionsSwitch;
    if (!dailyCashSwitch)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_NOTIFICATIONS_SWITCH_TRANSACTIONS"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKPaymentPass settings](self->_pass, "settings");
      if ((PKStoreDemoModeEnabled() & 1) != 0)
        v10 = 0;
      else
        v10 = PKUIOnlyDemoModeEnabled() ^ 1;
      -[PKPaymentPassDetailViewController _settingsTableCellWithTitle:action:setOn:enabled:](self, "_settingsTableCellWithTitle:action:setOn:enabled:", v8, sel__transactionsSwitchChanged_, (v9 >> 3) & 1, v10);
      v15 = objc_claimAutoreleasedReturnValue();
      v12 = *p_dailyCashSwitch;
      *p_dailyCashSwitch = (void *)v15;
      v13 = (void **)MEMORY[0x1E0D68150];
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v14 = 0;
  return v14;
}

- (id)_accountServiceNotificationsSwitchCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6;
  uint64_t v7;
  PKSettingTableCell *transactionsSwitch;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  __CFString *v12;
  PKSettingTableCell *v13;
  void **p_allowNotificationCell;
  PKSettingTableCell *notificationsSwitch;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  UITableViewCell *v20;
  UITableViewCell *allowNotificationCell;
  PKSettingTableCell *v22;
  PKSettingTableCell *v23;

  v6 = a4;
  v7 = objc_msgSend(a3, "row");
  if (v7 == 1)
  {
    if (self->_notificationAuthorizationStatus == 1)
    {
      if (self->_detailViewStyle == 2)
        v12 = CFSTR("SETTINGS_ALLOW_NOTIFICATIONS_TITLE_WATCH");
      else
        v12 = CFSTR("SETTINGS_ALLOW_NOTIFICATIONS_TITLE_PHONE");
      PKLocalizedString(&v12->isa);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v19, v6);
      v20 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
      allowNotificationCell = self->_allowNotificationCell;
      self->_allowNotificationCell = v20;

      p_allowNotificationCell = (void **)&self->_allowNotificationCell;
    }
    else
    {
      p_allowNotificationCell = (void **)&self->_notificationsSwitch;
      notificationsSwitch = self->_notificationsSwitch;
      if (notificationsSwitch)
      {
LABEL_15:
        v13 = notificationsSwitch;
        PKAccessibilityIDCellSet(v13, (void *)*MEMORY[0x1E0D67898]);
        goto LABEL_19;
      }
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _settingsTableCellWithTitle:action:setOn:enabled:](self, "_settingsTableCellWithTitle:action:setOn:enabled:", v16, sel__notificationSwitchChanged_, (-[PKPaymentPass settings](self->_pass, "settings") & 0x80) == 0, 1);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *p_allowNotificationCell;
      *p_allowNotificationCell = (void *)v17;

    }
    notificationsSwitch = (PKSettingTableCell *)*p_allowNotificationCell;
    goto LABEL_15;
  }
  if (v7)
  {
    v13 = 0;
  }
  else
  {
    transactionsSwitch = self->_transactionsSwitch;
    if (!transactionsSwitch)
    {
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PKPaymentPass settings](self->_pass, "settings");
      if ((PKStoreDemoModeEnabled() & 1) != 0)
        v11 = 0;
      else
        v11 = PKUIOnlyDemoModeEnabled() ^ 1;
      -[PKPaymentPassDetailViewController _settingsTableCellWithTitle:action:setOn:enabled:](self, "_settingsTableCellWithTitle:action:setOn:enabled:", v9, sel__transactionsSwitchChanged_, (v10 >> 3) & 1, v11);
      v22 = (PKSettingTableCell *)objc_claimAutoreleasedReturnValue();
      v23 = self->_transactionsSwitch;
      self->_transactionsSwitch = v22;

      PKAccessibilityIDCellSet(self->_transactionsSwitch, (void *)*MEMORY[0x1E0D68150]);
      transactionsSwitch = self->_transactionsSwitch;
    }
    v13 = transactionsSwitch;
  }
LABEL_19:

  return v13;
}

- (id)_transactionsSwitchCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void **p_allowNotificationCell;
  PKSettingTableCell *notificationsSwitch;
  void *v11;
  uint64_t v12;
  void *v13;
  PKSettingTableCell *transactionsSwitch;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  UITableViewCell *v19;
  UITableViewCell *allowNotificationCell;
  PKSettingTableCell *v21;
  PKSettingTableCell *v22;
  PKSettingTableCell *v23;

  v6 = a3;
  v7 = a4;
  if (!-[PKPaymentPassDetailViewController _showsTransactionHistorySwitch](self, "_showsTransactionHistorySwitch"))
    goto LABEL_4;
  if (objc_msgSend(v6, "row"))
  {
    if (objc_msgSend(v6, "row") != 1)
    {
      v21 = 0;
      goto LABEL_20;
    }
LABEL_4:
    if (self->_notificationAuthorizationStatus == 1)
    {
      if (self->_detailViewStyle == 2)
        v8 = CFSTR("SETTINGS_ALLOW_NOTIFICATIONS_TITLE_WATCH");
      else
        v8 = CFSTR("SETTINGS_ALLOW_NOTIFICATIONS_TITLE_PHONE");
      PKLocalizedString(&v8->isa);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v18, v7);
      v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
      allowNotificationCell = self->_allowNotificationCell;
      self->_allowNotificationCell = v19;

      p_allowNotificationCell = (void **)&self->_allowNotificationCell;
    }
    else
    {
      p_allowNotificationCell = (void **)&self->_notificationsSwitch;
      notificationsSwitch = self->_notificationsSwitch;
      if (notificationsSwitch)
      {
LABEL_15:
        v21 = notificationsSwitch;
        PKAccessibilityIDCellSet(v21, (void *)*MEMORY[0x1E0D67898]);
        goto LABEL_20;
      }
      PKLocalizedString(CFSTR("SETTINGS_SHOW_NOTIFICATIONS_TITLE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _settingsTableCellWithTitle:action:setOn:enabled:](self, "_settingsTableCellWithTitle:action:setOn:enabled:", v11, sel__notificationSwitchChanged_, (-[PKPaymentPass settings](self->_pass, "settings") & 0x80) == 0, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *p_allowNotificationCell;
      *p_allowNotificationCell = (void *)v12;

    }
    notificationsSwitch = (PKSettingTableCell *)*p_allowNotificationCell;
    goto LABEL_15;
  }
  transactionsSwitch = self->_transactionsSwitch;
  if (!transactionsSwitch)
  {
    PKLocalizedPaymentString(CFSTR("TRANSACTIONS_SERVICE_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKPaymentPass settings](self->_pass, "settings");
    if ((PKStoreDemoModeEnabled() & 1) != 0)
      v17 = 0;
    else
      v17 = PKUIOnlyDemoModeEnabled() ^ 1;
    -[PKPaymentPassDetailViewController _settingsTableCellWithTitle:action:setOn:enabled:](self, "_settingsTableCellWithTitle:action:setOn:enabled:", v15, sel__transactionsSwitchChanged_, (v16 >> 3) & 1, v17);
    v22 = (PKSettingTableCell *)objc_claimAutoreleasedReturnValue();
    v23 = self->_transactionsSwitch;
    self->_transactionsSwitch = v22;

    PKAccessibilityIDCellSet(self->_transactionsSwitch, (void *)*MEMORY[0x1E0D68150]);
    transactionsSwitch = self->_transactionsSwitch;
  }
  v21 = transactionsSwitch;
LABEL_20:

  return v21;
}

- (id)_transactionAtIndex:(int64_t)a3
{
  return -[NSArray objectAtIndex:](self->_transactions, "objectAtIndex:", a3);
}

- (id)_transactionCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6;
  PKPaymentTransactionTableCell *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  PKTransactionSourceCollection *transactionSourceCollection;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v6 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionTableCellReuseIdentifier"));
  v7 = (PKPaymentTransactionTableCell *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  -[PKPaymentPassDetailViewController _transactionAtIndex:](self, "_transactionAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[PKPaymentTransactionTableCell initWithStyle:reuseIdentifier:]([PKPaymentTransactionTableCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("PKPaymentTransactionTableCellReuseIdentifier"));
    -[PKPaymentPassDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v7);
    -[PKPaymentTransactionTableCell textLabel](v7, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

  }
  transactionSourceCollection = self->_transactionSourceCollection;
  objc_msgSend(v9, "transactionSourceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionSourceCollection transactionSourceForTransactionSourceIdentifier:](transactionSourceCollection, "transactionSourceForTransactionSourceIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentDataProvider deviceName](self->_paymentServiceDataProvider, "deviceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    PKDeviceName();
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  -[PKFamilyMemberCollection familyMemberForTransactionSource:](self->_familyCollection, "familyMemberForTransactionSource:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionCellController configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:](self->_transactionCellController, "configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:", v7, v9, v14, v19, self->_account, self->_detailViewStyle, v18, self);

  return v7;
}

- (id)_contactKeysToFetch
{
  void *v2;
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v3 = _MergedGlobals_31();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", objc_msgSend(v4, "_supportsForceTouch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend((Class)off_1EE4C7B28(), "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend((Class)off_1EE4C7B30(), "descriptorForRequiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C966A8];
  v11[3] = v7;
  v11[4] = v8;
  v11[5] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_deleteContextualActionForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC36C8];
  PKLocalizedPaymentString(CFSTR("TRANSACTIONS_SWIPE_ACTION_DELETE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PKPaymentPassDetailViewController__deleteContextualActionForTransaction___block_invoke;
  v10[3] = &unk_1E3E70500;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  objc_msgSend(v5, "contextualActionWithStyle:title:handler:", 1, v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __75__PKPaymentPassDetailViewController__deleteContextualActionForTransaction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  void (**v6)(id, _QWORD);
  id WeakRetained;
  id v8;

  v5 = (id *)(a1 + 40);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "deleteTransaction:completionHandler:", *(_QWORD *)(a1 + 32), v6);
  else
    v6[2](v6, 0);

}

- (void)deleteTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  id v27;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "transactionType") == 15)
  {
    if (self->_detailViewStyle == 2)
      v8 = CFSTR("TRANSACTION_DELETE_ACTIVITY_SHEET_TITLE_WATCH");
    else
      v8 = CFSTR("TRANSACTION_DELETE_ACTIVITY_SHEET_TITLE_IPHONE");
    PKLocalizedIdentityString(&v8->isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_REMOVE_BUTTON_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_CANCEL_BUTTON_TITLE"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v9)
      v13 = v10 == 0;
    else
      v13 = 1;
    if (!v13 && v11 != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v15 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __73__PKPaymentPassDetailViewController_deleteTransaction_completionHandler___block_invoke;
      aBlock[3] = &unk_1E3E797B0;
      objc_copyWeak(&v27, &location);
      v16 = v7;
      v26 = v16;
      v25 = v6;
      v17 = _Block_copy(aBlock);
      v22[0] = v15;
      v22[1] = 3221225472;
      v22[2] = __73__PKPaymentPassDetailViewController_deleteTransaction_completionHandler___block_invoke_3;
      v22[3] = &unk_1E3E61CA8;
      v23 = v16;
      v18 = _Block_copy(v22);
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v10, 2, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v12, 1, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addAction:", v19);
      objc_msgSend(v21, "addAction:", v20);
      -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);

      goto LABEL_16;
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v12 = 0;
  }
  if (v7)
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_16:

}

void __73__PKPaymentPassDetailViewController_deleteTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained
    && (v3 = objc_msgSend(WeakRetained[153], "indexOfObject:", *(_QWORD *)(a1 + 32)), v3 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v5 = v3;
    objc_msgSend(v8, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__PKPaymentPassDetailViewController_deleteTransaction_completionHandler___block_invoke_2;
    v9[3] = &unk_1E3E63480;
    v9[4] = v8;
    v11 = v5;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v6, "performBatchUpdates:completion:", v9, 0);

    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

void __73__PKPaymentPassDetailViewController_deleteTransaction_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "mutableCopy");
  objc_msgSend(v2, "removeObjectAtIndex:", *(_QWORD *)(a1 + 48));
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1224);
  *(_QWORD *)(v4 + 1224) = v3;

  v6 = objc_msgSend(*(id *)(a1 + 32), "indexOfSectionIdentifier:", CFSTR("Transactions"));
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 48), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v9, 100);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadSections:withRowAnimation:", v11, 100);

  }
  v12 = *(void **)(a1 + 40);
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 2168);
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deletePaymentTransactionWithIdentifier:", v14);

}

uint64_t __73__PKPaymentPassDetailViewController_deleteTransaction_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (BOOL)_transactionCellEditActionsGenerateWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, void *, void *);
  void *v33;
  id v34;
  PKPaymentPassDetailViewController *v35;
  _QWORD v36[4];
  id v37;
  PKPaymentPassDetailViewController *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;

  v8 = a5;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (-[PKPaymentPassDetailViewController _transactionsCount](self, "_transactionsCount") <= a4)
  {
    v12 = 0;
    if (!a3)
      goto LABEL_28;
    goto LABEL_27;
  }
  -[PKPaymentPassDetailViewController _transactionAtIndex:](self, "_transactionAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v10, "isDeletable"))
  {
    if (v9)
    {
      -[PKPaymentPassDetailViewController _deleteContextualActionForTransaction:](self, "_deleteContextualActionForTransaction:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

    }
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v10, "merchant");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "useRawMerchantData") & 1) == 0)
  {
    objc_msgSend(v13, "mapsMerchant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "identifier");

    if (v15)
    {
      if (!v9)
      {
        PKTransactionDebugDetailsEnabled();
        goto LABEL_21;
      }
      objc_msgSend(v10, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0DC36C8];
      PKLocalizedPaymentString(CFSTR("TRANSACTIONS_SWIPE_ACTION_DETAILS"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __105__PKPaymentPassDetailViewController__transactionCellEditActionsGenerateWithOutput_forRowIndex_tableView___block_invoke;
      v39[3] = &unk_1E3E797D8;
      v39[4] = self;
      v40 = v16;
      v41 = v8;
      v42 = v10;
      v19 = v16;
      objc_msgSend(v17, "contextualActionWithStyle:title:handler:", 0, v18, v39);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "addObject:", v20);
      v12 = 1;
    }
  }
  if ((PKTransactionDebugDetailsEnabled() & 1) == 0)
    goto LABEL_22;
  if (v9)
  {
    v21 = (void *)MEMORY[0x1E0DC36C8];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __105__PKPaymentPassDetailViewController__transactionCellEditActionsGenerateWithOutput_forRowIndex_tableView___block_invoke_2;
    v36[3] = &unk_1E3E79800;
    v37 = v10;
    v38 = self;
    objc_msgSend(v21, "contextualActionWithStyle:title:handler:", 0, CFSTR("Debug"), v36);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v22);

  }
LABEL_21:
  v12 = 1;
LABEL_22:
  if (-[PKPaymentPassDetailViewController _transactionDeepLinkingEnabled](self, "_transactionDeepLinkingEnabled"))
  {
    if (v9)
    {
      v23 = (void *)MEMORY[0x1E0DC36C8];
      PKLocalizedPaymentString(CFSTR("TRANSACTIONS_SWIPE_ACTION_OPEN_APP"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __105__PKPaymentPassDetailViewController__transactionCellEditActionsGenerateWithOutput_forRowIndex_tableView___block_invoke_3;
      v33 = &unk_1E3E79800;
      v34 = v8;
      v35 = self;
      objc_msgSend(v23, "contextualActionWithStyle:title:handler:", 0, v24, &v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor", v30, v31, v32, v33);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBackgroundColor:", v26);

      objc_msgSend(v9, "addObject:", v25);
    }
    v12 = 1;
  }

  if (a3)
  {
LABEL_27:
    v27 = (void *)objc_msgSend(v9, "copy");
    v28 = *a3;
    *a3 = v27;

  }
LABEL_28:

  return v12;
}

void __105__PKPaymentPassDetailViewController__transactionCellEditActionsGenerateWithOutput_forRowIndex_tableView___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1480);
  v7 = a3;
  v8 = (void *)objc_msgSend(a4, "copy");
  objc_msgSend(v6, "setObject:forKey:", v8, *(_QWORD *)(a1 + 40));

  v9 = *(void **)(a1 + 48);
  objc_msgSend(v7, "center");
  objc_msgSend(v9, "convertPoint:fromView:", v7);
  v11 = v10;
  v13 = v12;

  objc_msgSend(v9, "indexPathForRowAtPoint:", v11, v13);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "cellForRowAtIndexPath:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_presentMerchantDetailsViewWithTransaction:forCell:", *(_QWORD *)(a1 + 56), v14);

}

void __105__PKPaymentPassDetailViewController__transactionCellEditActionsGenerateWithOutput_forRowIndex_tableView___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (**v5)(id, uint64_t);
  void *v6;
  PKTransactionDebugDetailsTabBarController *v7;

  v5 = a4;
  v7 = -[PKTransactionDebugDetailsTabBarController initWithTransaction:transactionSourceCollection:]([PKTransactionDebugDetailsTabBarController alloc], "initWithTransaction:transactionSourceCollection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 2200));
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v7, 1);

  v5[2](v5, 1);
}

void __105__PKPaymentPassDetailViewController__transactionCellEditActionsGenerateWithOutput_forRowIndex_tableView___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  void (**v7)(id, uint64_t);
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "center");
  objc_msgSend(v6, "convertPoint:fromView:", v8);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v6, "indexPathForRowAtPoint:", v10, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_didSelectTransactionAtIndexPath:", v13);
  v7[2](v7, 1);

}

- (int64_t)_transitCellGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8;
  void *v9;
  int64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;

  v8 = a5;
  -[PKTransitPassProperties felicaProperties](self->_transitProperties, "felicaProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasGreenCarTicket"))
  {
    v10 = 1;
    if (a3 && !a4)
    {
      -[PKPaymentPassDetailViewController _subtitleCellForTableView:](self, "_subtitleCellForTableView:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *a3;
      *a3 = v11;

      objc_msgSend(v9, "greenCarValidityStartDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "calendar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dateByAddingUnit:value:toDate:options:", 16, 1, v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "compare:", v16);

      PKLocalizedPaymentString(CFSTR("TICKET_SECTION_GREEN_CAR_UPGRADE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 == -1)
      {
        v35 = v14;
        objc_msgSend(v9, "greenCarOriginStation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "greenCarDestinationStation");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        if (v21 && v22)
        {
          v24 = (id)PKLocalizedPaymentString(CFSTR("TRANSIT_TRANSACTION_STATIONS_FORMAT"), CFSTR("%1$@%2$@"), v21, v22);
          v20 = 0;
        }
        else
        {
          if (v21)
            v25 = v21;
          else
            v25 = (void *)v22;
          v20 = v25;
        }

        v14 = v35;
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("TICKET_SECTION_EXPIRED"));
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }

      v10 = 1;
      goto LABEL_18;
    }
  }
  else
  {
    v10 = 0;
  }
  if (!a3)
    goto LABEL_25;
  v19 = 0;
  v20 = 0;
LABEL_18:
  objc_msgSend(*a3, "setSelectionStyle:", 3);
  objc_msgSend(*a3, "setAccessoryType:", 1);
  objc_msgSend(*a3, "textLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setText:", v19);

  objc_msgSend(*a3, "textLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (self->_primaryTextColor)
  {
    objc_msgSend(v27, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextColor:", v29);

  }
  objc_msgSend(*a3, "detailTextLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setText:", v20);

  objc_msgSend(*a3, "detailTextLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (self->_detailTextColor)
  {
    objc_msgSend(v31, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTextColor:", v33);

  }
LABEL_25:

  return v10;
}

- (void)_didSelectTransitTicketAtRow:(int64_t)a3
{
  void *v5;
  int v6;
  PKGreenTicketDetailViewController *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  -[PKTransitPassProperties felicaProperties](self->_transitProperties, "felicaProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasGreenCarTicket");
  if (!a3
    && v6
    && (v7 = -[PKGreenTicketDetailViewController initWithFelicaProperty:]([PKGreenTicketDetailViewController alloc], "initWithFelicaProperty:", v5), PKLocalizedPaymentString(CFSTR("TICKET_SECTION_GREEN_CAR_UPGRADE")), v8 = (void *)objc_claimAutoreleasedReturnValue(), -[PKGreenTicketDetailViewController setTitle:](v7, "setTitle:", v8), v8, v7))
  {
    -[PKTransitTicketDetailViewController setPrimaryTextColor:](v7, "setPrimaryTextColor:", self->_primaryTextColor);
    -[PKTransitTicketDetailViewController setSecondaryTextColor:](v7, "setSecondaryTextColor:", self->_detailTextColor);
    -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v7, 1);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v7 = (PKGreenTicketDetailViewController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super.super.super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19D178000, &v7->super.super.super.super.super, OS_LOG_TYPE_DEFAULT, "Selected an unexpected transit ticket type", v10, 2u);
    }
  }

}

- (id)_paymentApplicationsCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6;
  id v7;
  UIColor *primaryTextColor;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", primaryTextColor, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v10, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NSArray objectAtIndex:](self->_contactlessPaymentApplications, "objectAtIndex:", objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  -[PKPaymentApplication applicationIdentifier](self->_defaultPaymentApplication, "applicationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (v16)
    v17 = 3;
  else
    v17 = 0;
  objc_msgSend(v9, "setAccessoryType:", v17);
  if (self->_linkTextColor)
    objc_msgSend(v9, "setTintColor:");

  return v9;
}

- (void)_didSelectPaymentApplicationSectionRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKPaymentDataProvider *paymentServiceDataProvider;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v4 = a3;
  if (!self->_changingDefaultPaymentApplication)
  {
    self->_changingDefaultPaymentApplication = 1;
    -[PKPaymentPassDetailViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_detailViewStyle == 2)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setColor:", v8);

      objc_msgSend(v7, "startAnimating");
      objc_msgSend(v6, "setAccessoryView:", v7);
    }
    else
    {
      v7 = 0;
    }
    -[NSArray objectAtIndex:](self->_contactlessPaymentApplications, "objectAtIndex:", objc_msgSend(v4, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__PKPaymentPassDetailViewController__didSelectPaymentApplicationSectionRowAtIndexPath___block_invoke;
    v15[3] = &unk_1E3E79828;
    objc_copyWeak(&v19, &location);
    v12 = v7;
    v16 = v12;
    v13 = v6;
    v17 = v13;
    v14 = v9;
    v18 = v14;
    -[PKPaymentDataProvider setDefaultPaymentApplication:forPassUniqueIdentifier:completion:](paymentServiceDataProvider, "setDefaultPaymentApplication:forPassUniqueIdentifier:completion:", v14, v11, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

void __87__PKPaymentPassDetailViewController__didSelectPaymentApplicationSectionRowAtIndexPath___block_invoke(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  id v6;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __87__PKPaymentPassDetailViewController__didSelectPaymentApplicationSectionRowAtIndexPath___block_invoke_2;
  v2[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v6, a1 + 7);
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v6);
}

void __87__PKPaymentPassDetailViewController__didSelectPaymentApplicationSectionRowAtIndexPath___block_invoke_2(id *a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(a1[4], "stopAnimating");
    objc_msgSend(a1[4], "removeFromSuperview");
    objc_msgSend(a1[5], "setAccessoryView:", 0);
    objc_storeStrong(v3 + 136, a1[6]);
    objc_msgSend(v3, "_refreshPaymentApplicationsSelection");
    WeakRetained = v3;
    *((_BYTE *)v3 + 1448) = 0;
  }

}

- (void)_refreshPaymentApplicationsSelection
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSArray *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_contactlessPaymentApplications;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[PKPaymentPassDetailViewController tableView](self, "tableView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v5 + i, -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", CFSTR("PaymentApplications")));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cellForRowAtIndexPath:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[PKPaymentApplication applicationIdentifier](self->_defaultPaymentApplication, "applicationIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "applicationIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if (v14)
            v15 = 3;
          else
            v15 = 0;
          objc_msgSend(v11, "setAccessoryType:", v15);
        }

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v5 += i;
    }
    while (v4);
  }

}

- (id)_deviceAccountNumberCellForIndexPath:(id)a3 tableView:(id)a4
{
  NSArray *devicePaymentApplications;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  devicePaymentApplications = self->_devicePaymentApplications;
  v7 = a4;
  v8 = a3;
  if (-[NSArray count](devicePaymentApplications, "count") < 2)
  {
    PKLocalizedPaymentString(CFSTR("DPAN_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSArray objectAtIndex:](self->_devicePaymentApplications, "objectAtIndex:", objc_msgSend(v8, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = self->_devicePaymentApplications;
  v12 = objc_msgSend(v8, "row");

  -[NSArray objectAtIndex:](v11, "objectAtIndex:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKSanitizedDeviceAccountNumberForPaymentApplication();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPassDetailViewController _stackedInfoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_stackedInfoCellWithPrimaryText:detailText:cellStyle:forTableView:", v10, v14, 1, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_merchantTokensCellForTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKENS_CELL_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:", v5, 0, 1, CFSTR("merchantTokens"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKRetrieveMerchantTokensResponse merchantTokens](self->_merchantTokensResponse, "merchantTokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v6, "setAccessoryView:", 0);
    objc_msgSend(v6, "setAccessoryType:", 1);
  }
  else
  {
    if (self->_merchantTokensResponse
      || (-[PKPaymentPass hasMerchantTokens](self->_pass, "hasMerchantTokens") & 1) == 0
      && -[PKPaymentPass hadMerchantTokens](self->_pass, "hadMerchantTokens"))
    {
      objc_msgSend(v6, "setAccessoryView:", 0);
      objc_msgSend(v6, "setAccessoryType:", 0);
      objc_msgSend(v6, "textLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTextColor:", v10);

    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v9, "startAnimating");
      objc_msgSend(v6, "setAccessoryView:", v9);
    }

  }
  PKAccessibilityIDCellSet(v6, (void *)*MEMORY[0x1E0D67D50]);
  return v6;
}

- (id)_footerViewForMerchantTokensSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKENS_FOOTER_LINK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKENS_FOOTER"), CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht212954?cid=mc-ols-applepay-article_ht212954-app-11122021"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKAttributedStringByAddingLinkToSubstring(v4, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &__block_literal_global_46;
  -[PKPaymentPassDetailViewController createFooterHyperlinkViewWithText:action:](self, "createFooterHyperlinkViewWithText:action:", v6, &__block_literal_global_46);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_transferCardCellForTableView:(id)a3
{
  id v4;
  UIColor *warningTextColor;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  _BOOL4 performingCardTransfer;
  void *v14;
  void *v15;
  _BOOL8 v16;

  v4 = a3;
  warningTextColor = self->_warningTextColor;
  if (warningTextColor)
  {
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", warningTextColor, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v7, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  PKAssignedDeviceName();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("SETTINGS_TRANSFER_BACK_OF_PASS"), CFSTR("%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  v11 = -[PKPaymentPassDetailViewController _isDeletingPass](self, "_isDeletingPass");
  if (self->_performingCardTransfer)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v12, "startAnimating");
    objc_msgSend(v6, "setAccessoryView:", v12);

  }
  else
  {
    objc_msgSend(v6, "setAccessoryView:", 0);
  }
  performingCardTransfer = self->_performingCardTransfer;
  objc_msgSend(v6, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = !performingCardTransfer && !v11;
  objc_msgSend(v14, "setEnabled:", v16);

  PKAccessibilityIDCellSet(v6, (void *)*MEMORY[0x1E0D68158]);
  return v6;
}

- (id)_deleteCardCellForTableView:(id)a3
{
  id v4;
  UIColor *warningTextColor;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  PKPaymentPass *pass;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  warningTextColor = self->_warningTextColor;
  if (warningTextColor)
  {
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", warningTextColor, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v7, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[PKPaymentPass supportsBarcodePayment](self->_pass, "supportsBarcodePayment"))
  {
    PKLocalizedAquamanString(CFSTR("DELETE_PASS_ACCOUNT"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[PKPaymentPass isIdentityPass](self->_pass, "isIdentityPass");
    pass = self->_pass;
    if (v9)
    {
      v11 = -[PKPaymentPass identityType](pass, "identityType");
      if (v11 < 2)
      {
        v12 = CFSTR("DELETE_PASS_DL");
      }
      else if (v11 == 3)
      {
        v12 = CFSTR("DELETE_PASS_NID");
      }
      else
      {
        if (v11 != 2)
        {
LABEL_17:
          v14 = 0;
          goto LABEL_21;
        }
        v12 = CFSTR("DELETE_PASS_STATE_ID");
      }
      PKLocalizedIdentityString(&v12->isa);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[PKPaymentPass isAccessPass](pass, "isAccessPass"))
      {
        switch(-[PKPaymentPass accessType](self->_pass, "accessType"))
        {
          case 0:
            break;
          case 1:
          case 3:
          case 5:
          case 6:
            v13 = CFSTR("DELETE_PASS_KEY");
            goto LABEL_15;
          case 2:
            v13 = CFSTR("DELETE_PASS_BADGE");
            goto LABEL_15;
          case 4:
            PKLocalizedCredentialString(CFSTR("REMOVE_CAR_KEY"));
            v8 = objc_claimAutoreleasedReturnValue();
            goto LABEL_20;
          default:
            goto LABEL_17;
        }
      }
      v13 = CFSTR("DELETE_PASS");
LABEL_15:
      PKLocalizedPaymentString(&v13->isa);
      v8 = objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_20:
  v14 = (void *)v8;
LABEL_21:
  objc_msgSend(v6, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  if (-[PKPaymentPassDetailViewController _isDeletingPass](self, "_isDeletingPass"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v16, "startAnimating");
    objc_msgSend(v6, "setAccessoryView:", v16);

  }
  else
  {
    objc_msgSend(v6, "setAccessoryView:", 0);
    if (!self->_performingCardTransfer)
    {
      objc_msgSend(v6, "textLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 1;
      goto LABEL_25;
    }
  }
  objc_msgSend(v6, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = 0;
LABEL_25:
  objc_msgSend(v17, "setEnabled:", v19);

  PKAccessibilityIDCellSet(v6, (void *)*MEMORY[0x1E0D67F60]);
  return v6;
}

- (id)_peerPaymentBalanceCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_BALANCE_ACTIONS_SECTION_HEADER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount currentBalance](self->_peerPaymentAccount, "currentBalance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formattedStringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v6, v8, 1, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PKAccessibilityIDCellSet(v9, (void *)*MEMORY[0x1E0D67928]);
  return v9;
}

- (id)_peerPaymentMoneyActionCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6;
  unint64_t v7;
  void **v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = -[PKPaymentPassDetailViewController _peerPaymentMoneyActionForRowIndex:](self, "_peerPaymentMoneyActionForRowIndex:", a3);
  if (v7)
  {
    if (v7 != 1)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_7;
    }
    v8 = (void **)MEMORY[0x1E0D68160];
    v9 = CFSTR("PEER_PAYMENT_PASS_DETAILS_TRANSFER_TO_BANK");
  }
  else
  {
    v8 = (void **)MEMORY[0x1E0D67850];
    v9 = CFSTR("PEER_PAYMENT_PASS_DETAILS_ADD_MONEY");
  }
  PKLocalizedPeerPaymentString(&v9->isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKAccessibilityIDCellSet(v11, *v8);
LABEL_7:

  return v11;
}

- (id)_peerPaymentManualIdentityVerificationCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_IDENTITY_VERIFICATION"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E0D67C60]);
  return v7;
}

- (id)_peerPaymentParticipantGraduationCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_PASS_DETAILS_GRADUATION"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E0D68050]);
  return v7;
}

- (id)_peerPaymentAccountActionCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = self->_peerPaymentAccountResolution - 1;
  if (v6 > 2)
  {
    v7 = 0;
  }
  else
  {
    PKLocalizedPeerPaymentString(&off_1E3E79E50[v6]->isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKAccessibilityIDCellSet(v8, (void *)*MEMORY[0x1E0D67830]);

  return v8;
}

- (id)_peerPaymentAutomaticallyAcceptPaymentsCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void **v10;
  int v11;

  v6 = a4;
  if (a3 == 1)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_ACCEPT_PAYMENTS_MANUALLY"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _checkmarkCellWithText:forTableView:](self, "_checkmarkCellWithText:forTableView:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPeerPaymentPreferences requiresConfirmation](self->_peerPaymentPreferences, "requiresConfirmation");
    v10 = (void **)MEMORY[0x1E0D67D28];
    if (!v11)
      goto LABEL_7;
LABEL_6:
    objc_msgSend(v8, "setAccessoryType:", 3);
    goto LABEL_7;
  }
  if (a3)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_9;
  }
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_ACCEPT_PAYMENTS_AUTOMATICALLY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _checkmarkCellWithText:forTableView:](self, "_checkmarkCellWithText:forTableView:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPeerPaymentPreferences requiresConfirmation](self->_peerPaymentPreferences, "requiresConfirmation");
  v10 = (void **)MEMORY[0x1E0D67908];
  if ((v9 & 1) == 0)
    goto LABEL_6;
LABEL_7:
  PKAccessibilityIDCellSet(v8, *v10);
LABEL_9:

  return v8;
}

- (id)_peerPaymentBankAccountsCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5;
  UIColor *primaryTextColor;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v5 = a4;
  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", primaryTextColor, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v8, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (PKBankCredentialCenterEnabled())
    v9 = CFSTR("PEER_PAYMENT_PASS_DETAILS_BANK_ACCOUNTS");
  else
    v9 = CFSTR("PEER_PAYMENT_PASS_DETAILS_BANK_ACCOUNT");
  PKLocalizedPeerPaymentString(&v9->isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(v7, "setAccessoryType:", 1);
  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E0D67930]);

  return v7;
}

- (id)_peerPaymentStatementCellForTableView:(id)a3
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

  v4 = a3;
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_EMAIL_STATEMENT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_requestingStatement)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v7, "startAnimating");
    objc_msgSend(v6, "setAccessoryView:", v7);
    objc_msgSend(v6, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_STATEMENT_SENDING_STATEMENT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v10);

    objc_msgSend(v6, "detailTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", 0);

LABEL_5:
    goto LABEL_6;
  }
  if (self->_sentStatement)
  {
    objc_msgSend(v6, "setAccessoryView:", 0);
    objc_msgSend(v6, "setAccessoryType:", 3);
    objc_msgSend(v6, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v12);

    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_STATEMENT_SENT_STATEMENT"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v13);

    objc_msgSend(v6, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", 0);
    goto LABEL_5;
  }
LABEL_6:
  PKAccessibilityIDCellSet(v6, (void *)*MEMORY[0x1E0D680B0]);

  return v6;
}

- (id)_familyMemberCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = objc_msgSend(a3, "row");
  if (v7 >= -[NSArray count](self->_sortedFamilyMemberRowModels, "count"))
  {
    PKLocalizedPeerPaymentLexingtonString(CFSTR("BACK_OF_PASS_Family_SHARING_SETTINGS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v8, v6);
  }
  else
  {
    -[NSArray objectAtIndex:](self->_sortedFamilyMemberRowModels, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _familyMemberCellWithRowModel:forTableView:](self, "_familyMemberCellWithRowModel:forTableView:", v8, v6);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PKAccessibilityIDCellSet(v9, (void *)*MEMORY[0x1E0D67BB8]);
  return v9;
}

- (id)_accountServiceCreditDetailsCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDecimalNumber *v20;
  void *v21;
  id *v22;
  NSDecimalNumber *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;

  v6 = a4;
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPaymentPassDetailViewController _accountServiceCreditDetailsRowForRowIndex:](self, "_accountServiceCreditDetailsRowForRowIndex:", a3);
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currencyCode");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  v12 = (id)*MEMORY[0x1E0D67A60];
  v32 = v8;
  switch(v9)
  {
    case 0uLL:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cardBalance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "amount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "compare:", v16);

      if (v17 == -1)
      {
        objc_msgSend(v14, "negativeValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "formattedStringValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v29, v32);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v28;
      }
      else
      {
        objc_msgSend(v14, "formattedStringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19 = -[PKPaymentPassDetailViewController isTotalBalanceCellSelectable](self, "isTotalBalanceCellSelectable");
      v27 = (id)*MEMORY[0x1E0D67928];

      v12 = v14;
      goto LABEL_11;
    case 1uLL:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "creditLimit");
      v20 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v20, v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "formattedStringValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (id *)MEMORY[0x1E0D67A68];
      goto LABEL_8;
    case 2uLL:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "availableCredit");
      v23 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v23, v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "formattedStringValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (id *)MEMORY[0x1E0D67918];
      goto LABEL_8;
    case 3uLL:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccount creditDetails](self->_account, "creditDetails");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "rates");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "formattedAPRForPurchasesPercentageString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (id *)MEMORY[0x1E0D677E0];
LABEL_8:
      v27 = *v22;
      v19 = 0;
LABEL_11:

      v12 = v27;
      break;
    default:
      v19 = 0;
      v18 = 0;
      v13 = 0;
      break;
  }
  -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v13, v18, 1, v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAccessoryType:", v19);
  PKAccessibilityIDCellSet(v30, v12);

  return v30;
}

- (int64_t)_numberOfAccountServiceCreditDetailsRowsEnabled
{
  uint64_t v3;
  int64_t v4;

  v3 = 0;
  v4 = 0;
  do
    v4 += -[PKPaymentPassDetailViewController _accountServiceCreditDetailsRowIsEnabled:](self, "_accountServiceCreditDetailsRowIsEnabled:", v3++);
  while (v3 != 4);
  return v4;
}

- (BOOL)_accountServiceCreditDetailsRowIsEnabled:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  int v10;
  void *v11;
  void *v12;

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 0uLL:
      objc_msgSend(v6, "adjustedBalance");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (self->_detailViewStyle)
        v9 = v7 == 0;
      else
        v9 = 1;
      if (v9)
        goto LABEL_7;
      goto LABEL_10;
    case 1uLL:
      objc_msgSend(v6, "creditLimit");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToNumber:", v11) ^ 1;
LABEL_18:

      }
      else
      {
LABEL_7:
        LOBYTE(v10) = 0;
      }

LABEL_20:
      return v10;
    case 2uLL:
      objc_msgSend(v6, "creditLimit");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "availableCredit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        LOBYTE(v10) = 0;
        if ((objc_msgSend(v8, "isEqualToNumber:", v12) & 1) == 0 && v11)
          v10 = objc_msgSend(v11, "isEqualToNumber:", v12) ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }

      goto LABEL_18;
    case 3uLL:
      -[PKAccount creditDetails](self->_account, "creditDetails");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = v11 != 0;
      goto LABEL_18;
    default:
      LOBYTE(v10) = 0;
      goto LABEL_20;
  }
}

- (unint64_t)_accountServiceCreditDetailsRowForRowIndex:(int64_t)a3
{
  unint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  do
  {
    if (-[PKPaymentPassDetailViewController _accountServiceCreditDetailsRowIsEnabled:](self, "_accountServiceCreditDetailsRowIsEnabled:", v5))
    {
      if (v6 == a3)
        return v5;
      ++v6;
    }
    ++v5;
  }
  while (v5 != 4);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_accountServiceBankAccountsCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6;
  UIColor *primaryTextColor;
  UIColor *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    v8 = primaryTextColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
    PKLocalizedFeatureString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_loadingBankAccounts)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v11, "startAnimating");
      v13 = 0;
      v9 = (void *)v14;
      goto LABEL_9;
    }
    v11 = 0;
  }
  v13 = 1;
LABEL_9:
  objc_msgSend(v10, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v12);

  objc_msgSend(v10, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v9);

  objc_msgSend(v10, "detailTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", 0);

  objc_msgSend(v10, "setAccessoryType:", v13);
  objc_msgSend(v10, "setAccessoryView:", v11);
  PKAccessibilityIDCellSet(v10, (void *)*MEMORY[0x1E0D67930]);

  return v10;
}

- (id)_accountServiceMakeDefaultCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
  PKLocalizedFeatureString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E0D67D18]);
  return v7;
}

- (id)_accountServiceRewardsDetailsCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDecimalNumber *v14;
  NSString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;

  v6 = a4;
  v7 = -[PKPaymentPassDetailViewController _accountServiceRewardsRowForRowIndex:](self, "_accountServiceRewardsRowForRowIndex:", a3);
  if (v7 == 2)
  {
    switch(self->_cashbackResolution)
    {
      case 1uLL:
      case 4uLL:
        v18 = CFSTR("PEER_PAYMENT_SETUP_APPLE_CASH_BUTTON");
        goto LABEL_18;
      case 2uLL:
        v18 = CFSTR("PEER_PAYMENT_ACCOUNT_STATE_FOOTER_IDENTITY_VERIFICATION_BUTTON");
LABEL_18:
        PKLocalizedPeerPaymentString(&v18->isa);
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 3uLL:
        PKLocalizedFeatureString();
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v19 = (void *)v28;
        break;
      default:
        v19 = 0;
        break;
    }
    -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v19, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v7 == 1)
  {
    -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
    PKLocalizedFeatureString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v19, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_redeemingRewards)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v21, "startAnimating");
      objc_msgSend(v20, "setAccessoryView:", v21);
      objc_msgSend(v20, "textLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTextColor:", v23);

      objc_msgSend(v20, "textLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v25);

      objc_msgSend(v20, "detailTextLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", 0);

    }
  }
  else
  {
    if (v7)
    {
      v20 = 0;
    }
    else
    {
      -[PKAccount creditDetails](self->_account, "creditDetails");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accountSummary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountUserCollection currentAccountUser](self->_accountUserCollection, "currentAccountUser");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "altDSID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "accountUserActivityForAccountUserAltDSID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "rewardsBalance");
        v14 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

        if (v14)
          goto LABEL_7;
      }
      objc_msgSend(v9, "rewardsBalance");
      v14 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
LABEL_7:
        objc_msgSend(v8, "currencyCode");
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        PKCurrencyAmountCreate(v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "minimalFormattedStringValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v27, v17, 1, v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v19 = 0;
  }

  return v20;
}

- (BOOL)_accountServiceRewardsRowIsEnabled:(unint64_t)a3
{
  int v5;
  BOOL v6;

  v5 = -[PKAccount supportsRedeemRewards](self->_account, "supportsRedeemRewards");
  if (a3 >= 2)
  {
    if (a3 != 2)
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    if (!v5)
      return v5;
    v6 = self->_cashbackResolution == 0;
  }
  else
  {
    if (!v5)
      return v5;
    v6 = !self->_allowStatementCreditRedemption;
  }
  LOBYTE(v5) = !v6;
  return v5;
}

- (int64_t)_numberOfAccountServiceRewardsRowsEnabled
{
  uint64_t v3;
  int64_t v4;

  v3 = 0;
  v4 = 0;
  do
    v4 += -[PKPaymentPassDetailViewController _accountServiceRewardsRowIsEnabled:](self, "_accountServiceRewardsRowIsEnabled:", v3++);
  while (v3 != 3);
  return v4;
}

- (unint64_t)_accountServiceRewardsRowForRowIndex:(int64_t)a3
{
  unint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  do
  {
    if (-[PKPaymentPassDetailViewController _accountServiceRewardsRowIsEnabled:](self, "_accountServiceRewardsRowIsEnabled:", v5))
    {
      if (v6 == a3)
        return v5;
      ++v6;
    }
    ++v5;
  }
  while (v5 != 3);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_accountServicePhysicalCardRowIsEnabled:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  switch(a3)
  {
    case 0uLL:
      -[PKPhysicalCardController primaryPhysicalCard](self->_physicalCardController, "primaryPhysicalCard");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "state");

      return (v4 & 0xFFFFFFFFFFFFFFFELL) == 2;
    case 1uLL:
      return -[PKPhysicalCardController canActivatePhysicalCard](self->_physicalCardController, "canActivatePhysicalCard");
    case 2uLL:
      return -[PKPhysicalCardController canRequestNewPhysicalCard](self->_physicalCardController, "canRequestNewPhysicalCard");
    case 3uLL:
      return -[PKPhysicalCardController canReplacePhysicalCard](self->_physicalCardController, "canReplacePhysicalCard");
    case 4uLL:
      -[PKPhysicalCardController unactivatedPhysicalCard](self->_physicalCardController, "unactivatedPhysicalCard");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_9;
      v8 = v7;
      objc_msgSend(v7, "latestShippingActivity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shipmentTrackingURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v8, "shipmentTrackingURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v11 != 0;

      }
      break;
    default:
LABEL_9:
      v5 = 0;
      break;
  }
  return v5;
}

- (int64_t)_numberOfAccountServicePhysicalCardRowsEnabled
{
  uint64_t v3;
  int64_t v4;

  v3 = 0;
  v4 = 0;
  do
    v4 += -[PKPaymentPassDetailViewController _accountServicePhysicalCardRowIsEnabled:](self, "_accountServicePhysicalCardRowIsEnabled:", v3++);
  while (v3 != 5);
  return v4;
}

- (unint64_t)_accountServicePhysicalCardRowForRowIndex:(int64_t)a3
{
  unint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  do
  {
    if (-[PKPaymentPassDetailViewController _accountServicePhysicalCardRowIsEnabled:](self, "_accountServicePhysicalCardRowIsEnabled:", v5))
    {
      if (v6 == a3)
        return v5;
      ++v6;
    }
    ++v5;
  }
  while (v5 != 5);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_rowIndexForAccountServicePhysicalCardRow:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;

  if (!-[PKPaymentPassDetailViewController _accountServicePhysicalCardRowIsEnabled:](self, "_accountServicePhysicalCardRowIsEnabled:"))return 0x7FFFFFFFFFFFFFFFLL;
  if (!a3)
    return 0;
  v5 = 0;
  v6 = 0;
  do
    v6 += -[PKPaymentPassDetailViewController _accountServicePhysicalCardRowIsEnabled:](self, "_accountServicePhysicalCardRowIsEnabled:", v5++);
  while (a3 != v5);
  return v6;
}

- (id)_accountServicePhysicalCardCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6;
  int64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = -[PKPhysicalCardActionController state](self->_physicalCardActionController, "state");
  v8 = (id)*MEMORY[0x1E0D67EB8];
  switch(-[PKPaymentPassDetailViewController _accountServicePhysicalCardRowForRowIndex:](self, "_accountServicePhysicalCardRowForRowIndex:", a3))
  {
    case 0uLL:
      -[PKPhysicalCardController primaryPhysicalCardEnabled](self->_physicalCardController, "primaryPhysicalCardEnabled");
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_loadingEnableDisablePhysicalCard)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        objc_msgSend(v11, "startAnimating");
        objc_msgSend(v10, "setAccessoryView:", v11);

      }
      goto LABEL_11;
    case 1uLL:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2uLL:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v12, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 1649;
      goto LABEL_8;
    case 3uLL:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v14, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 1651;
LABEL_8:
      if (!*((_BYTE *)&self->super.super.super.super.super.isa + v13))
        goto LABEL_12;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v9, "startAnimating");
      objc_msgSend(v10, "setAccessoryView:", v9);
LABEL_11:

LABEL_12:
      if (v7 == 1 || self->_loadingOrderPhysicalCard)
      {
        objc_msgSend(v10, "textLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTextColor:", v17);

      }
      PKAccessibilityIDCellSet(v10, v8);

      return v10;
    case 4uLL:
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v15, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v8;
      v8 = (id)*MEMORY[0x1E0D67EC0];
      goto LABEL_11;
    default:
      v10 = 0;
      goto LABEL_12;
  }
}

- (id)_accountServiceCardNumbersCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5;
  UIColor *primaryTextColor;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", primaryTextColor, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v8, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_INFORMATION_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  -[PKPaymentPassDetailViewController _showSpinner:inCell:overrideTextColor:](self, "_showSpinner:inCell:overrideTextColor:", -[PKAccountCardNumbersPresenter isLoadingVirtualCard](self->_accountCardNumbersPresenter, "isLoadingVirtualCard"), v7, 0);
  if (!-[PKAccountCardNumbersPresenter isLoadingVirtualCard](self->_accountCardNumbersPresenter, "isLoadingVirtualCard"))objc_msgSend(v7, "setAccessoryType:", 1);
  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E0D679D8]);

  return v7;
}

- (id)_transactionYearFormatter
{
  NSDateFormatter *transactionYearFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;
  id v7;
  void *v8;

  transactionYearFormatter = self->_transactionYearFormatter;
  if (!transactionYearFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_transactionYearFormatter;
    self->_transactionYearFormatter = v4;

    v6 = self->_transactionYearFormatter;
    v7 = objc_alloc(MEMORY[0x1E0C99D48]);
    v8 = (void *)objc_msgSend(v7, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    -[NSDateFormatter setCalendar:](v6, "setCalendar:", v8);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_transactionYearFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("y"));
    transactionYearFormatter = self->_transactionYearFormatter;
  }
  return transactionYearFormatter;
}

- (id)_transactionCountFormatter
{
  NSNumberFormatter *transactionCountFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;

  transactionCountFormatter = self->_transactionCountFormatter;
  if (!transactionCountFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v5 = self->_transactionCountFormatter;
    self->_transactionCountFormatter = v4;

    -[NSNumberFormatter setNumberStyle:](self->_transactionCountFormatter, "setNumberStyle:", 1);
    transactionCountFormatter = self->_transactionCountFormatter;
  }
  return transactionCountFormatter;
}

- (id)_transactionCountByPeriodCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_transactionCountAndYear, "objectAtIndexedSubscript:", objc_msgSend(a3, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "transactionCount");
  -[PKPaymentPassDetailViewController _transactionYearFormatter](self, "_transactionYearFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPassDetailViewController _transactionCountFormatter](self, "_transactionCountFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromNumber:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_TRANSACTIONS_IN_YEAR_FORMAT"), CFSTR("%@"), v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v15, v14, 1, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setAccessoryType:", 1);
  PKAccessibilityIDCellSet(v16, (void *)*MEMORY[0x1E0D68150]);

  return v16;
}

- (void)_didSelectTransactionCountByPeriodAtIndexPath:(id)a3
{
  void *v4;
  PKPaymentTransactionsInYearTableViewController *v5;
  void *v6;
  PKTransactionSourceCollection *transactionSourceCollection;
  PKFamilyMemberCollection *familyCollection;
  int64_t detailViewStyle;
  PKPaymentDataProvider *paymentServiceDataProvider;
  void *v11;
  PKPaymentTransactionsInYearTableViewController *v12;
  void *v13;
  id v14;

  -[NSArray objectAtIndexedSubscript:](self->_transactionCountAndYear, "objectAtIndexedSubscript:", objc_msgSend(a3, "row"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PKPaymentTransactionsInYearTableViewController alloc];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  transactionSourceCollection = self->_transactionSourceCollection;
  familyCollection = self->_familyCollection;
  detailViewStyle = self->_detailViewStyle;
  paymentServiceDataProvider = self->_paymentServiceDataProvider;
  -[PKPaymentPassDetailViewController contactResolver](self, "contactResolver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKPaymentTransactionsInYearTableViewController initWithDateFromYear:calendar:transactionSourceCollection:familyCollection:detailViewStyle:paymentServiceDataProvider:contactResolver:peerPaymentWebService:account:](v5, "initWithDateFromYear:calendar:transactionSourceCollection:familyCollection:detailViewStyle:paymentServiceDataProvider:contactResolver:peerPaymentWebService:account:", v4, v6, transactionSourceCollection, familyCollection, detailViewStyle, paymentServiceDataProvider, v11, self->_peerPaymentWebService, self->_account);

  -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushViewController:animated:", v12, 1);

}

- (void)_updatePeerPaymentPreferencesWithNewPreferences:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  PKPeerPaymentWebService *peerPaymentWebService;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[5];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKPaymentPassDetailViewController__updatePeerPaymentPreferencesWithNewPreferences___block_invoke;
  aBlock[3] = &unk_1E3E79850;
  aBlock[4] = self;
  v5 = a3;
  v6 = _Block_copy(aBlock);
  -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreferences:completion:", v5, v6);
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67478]), "initWithPeerPaymentPreferences:", v5);

    peerPaymentWebService = self->_peerPaymentWebService;
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __85__PKPaymentPassDetailViewController__updatePeerPaymentPreferencesWithNewPreferences___block_invoke_887;
    v11[3] = &unk_1E3E79878;
    v12 = v6;
    -[PKPeerPaymentWebService peerPaymentUpdatePreferencesWithRequest:completion:](peerPaymentWebService, "peerPaymentUpdatePreferencesWithRequest:completion:", v9, v11);
    v5 = v12;
  }

}

void __85__PKPaymentPassDetailViewController__updatePeerPaymentPreferencesWithNewPreferences___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __85__PKPaymentPassDetailViewController__updatePeerPaymentPreferencesWithNewPreferences___block_invoke_2;
  block[3] = &unk_1E3E61400;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __85__PKPaymentPassDetailViewController__updatePeerPaymentPreferencesWithNewPreferences___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Error updating peer payment preferences: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1568), *(id *)(a1 + 48));
  }
  return objc_msgSend(*(id *)(a1 + 40), "_updatePeerPaymentPreferencesSectionVisibilityAndReloadIfNecessary");
}

void __85__PKPaymentPassDetailViewController__updatePeerPaymentPreferencesWithNewPreferences___block_invoke_887(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "peerPaymentPreferences");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, a5, 0);
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  -[PKPaymentPassDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a4, 0);
  -[PKPaymentPassDetailViewController _updateCashbackPeerPaymentResolutionSection](self, "_updateCashbackPeerPaymentResolutionSection");
}

- (void)_didSelectPeerPaymentMoneyActionAtRow:(int64_t)a3
{
  unint64_t v4;

  v4 = -[PKPaymentPassDetailViewController _peerPaymentMoneyActionForRowIndex:](self, "_peerPaymentMoneyActionForRowIndex:", a3);
  if (v4 == 1)
  {
    -[PKPaymentPassDetailViewController _didSelectTransferToBank](self, "_didSelectTransferToBank");
  }
  else if (!v4)
  {
    -[PKPaymentPassDetailViewController presentTopUp](self, "presentTopUp");
  }
}

- (void)_didSelectPeerPaymentBankAccountsAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  PKACHBankCredentialPickerViewController *v10;
  PKPeerPaymentBankAccountsViewController *v11;
  PKNavigationController *v12;
  int64_t detailViewStyle;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  id location;

  v4 = a3;
  if (!PKBankCredentialCenterEnabled())
    goto LABEL_3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66BC8]), "initWithType:", 0);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKPaymentPassDetailViewController__didSelectPeerPaymentBankAccountsAtIndexPath___block_invoke;
  aBlock[3] = &unk_1E3E798A0;
  objc_copyWeak(&v24, &location);
  v7 = v5;
  v23 = v7;
  v8 = _Block_copy(aBlock);
  v17 = v6;
  v18 = 3221225472;
  v19 = __82__PKPaymentPassDetailViewController__didSelectPeerPaymentBankAccountsAtIndexPath___block_invoke_2;
  v20 = &unk_1E3E61310;
  objc_copyWeak(&v21, &location);
  v9 = _Block_copy(&v17);
  v10 = [PKACHBankCredentialPickerViewController alloc];
  v11 = -[PKACHBankCredentialPickerViewController initWithCurrentBankInformation:selectAction:cancelAction:](v10, "initWithCurrentBankInformation:selectAction:cancelAction:", v7, v8, v9, v17, v18, v19, v20);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  if (!v11)
LABEL_3:
    v11 = -[PKPeerPaymentBankAccountsViewController initWithPeerPaymentAccount:detailViewStyle:]([PKPeerPaymentBankAccountsViewController alloc], "initWithPeerPaymentAccount:detailViewStyle:", self->_peerPaymentAccount, self->_detailViewStyle);
  v12 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v11);
  detailViewStyle = self->_detailViewStyle;
  v14 = 3;
  if (detailViewStyle != 1)
    v14 = 0;
  if (detailViewStyle == 2)
    v15 = 4;
  else
    v15 = v14;
  PKPaymentSetupApplyContextAppearance(v15, v12);
  -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pushViewController:animated:", v11, 1);

}

void __82__PKPaymentPassDetailViewController__didSelectPeerPaymentBankAccountsAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v13, "routingNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRoutingNumber:", v5);

    v6 = *(void **)(a1 + 32);
    objc_msgSend(v13, "accountNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccountNumber:", v7);

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v13, "bankName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBankName:", v9);

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v13, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIdentifier:", v11);

    objc_msgSend(WeakRetained, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void __82__PKPaymentPassDetailViewController__didSelectPeerPaymentBankAccountsAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = v3;
  }

}

- (void)_didSelectAutomaticallyAcceptPaymentsPreferenceAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = -[PKPeerPaymentPreferences requiresConfirmation](self->_peerPaymentPreferences, "requiresConfirmation");
  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, objc_msgSend(v4, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB36B0];
  v11 = objc_msgSend(v4, "section");

  objc_msgSend(v10, "indexPathForRow:inSection:", 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForRowAtIndexPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = 0;
    v15 = (_QWORD *)MEMORY[0x1E0D68568];
    v14 = 3;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    v14 = 0;
    v6 = 1;
    v15 = (_QWORD *)MEMORY[0x1E0D68570];
    v5 = 3;
LABEL_5:
    MEMORY[0x1A1AE3A74](*v15, 0);
    objc_msgSend(v17, "setAccessoryType:", v14);
    objc_msgSend(v13, "setAccessoryType:", v5);
  }
  v16 = (void *)-[PKPeerPaymentPreferences copy](self->_peerPaymentPreferences, "copy");
  objc_msgSend(v16, "setRequiresConfirmation:", v6);
  -[PKPaymentPassDetailViewController _updatePeerPaymentPreferencesWithNewPreferences:](self, "_updatePeerPaymentPreferencesWithNewPreferences:", v16);

}

- (void)_didSelectPeerPaymentManualIdentityVerificationAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  PKPeerPaymentAccountResolutionController *peerPaymentAccountResolutionController;
  _QWORD v11[5];

  v5 = a3;
  if (!self->_loadingPeerPaymentAccountActionIndexPath)
  {
    objc_storeStrong((id *)&self->_loadingPeerPaymentAccountActionIndexPath, a3);
    -[PKPaymentPassDetailViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForRowAtIndexPath:", self->_loadingPeerPaymentAccountActionIndexPath);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v8, "startAnimating");
    objc_msgSend(v7, "setAccessoryView:", v8);
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D685B8], 0);
    v9 = objc_alloc_init(MEMORY[0x1E0D673D8]);
    objc_msgSend(v9, "setVerificationContext:", 1);
    peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __96__PKPaymentPassDetailViewController__didSelectPeerPaymentManualIdentityVerificationAtIndexPath___block_invoke;
    v11[3] = &unk_1E3E62288;
    v11[4] = self;
    -[PKPeerPaymentAccountResolutionController presentFlowForAccountResolution:configuration:completion:](peerPaymentAccountResolutionController, "presentFlowForAccountResolution:configuration:completion:", 2, v9, v11);

  }
}

void __96__PKPaymentPassDetailViewController__didSelectPeerPaymentManualIdentityVerificationAtIndexPath___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PKPaymentPassDetailViewController__didSelectPeerPaymentManualIdentityVerificationAtIndexPath___block_invoke_2;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __96__PKPaymentPassDetailViewController__didSelectPeerPaymentManualIdentityVerificationAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doneLoadingPeerPaymentAccountAction");
}

- (void)_didSelectPeerPaymentParticipantGradutionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL4 v9;
  int v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD aBlock[6];

  if (!self->_peerPaymentGraduationInProgress)
  {
    v4 = a3;
    -[PKPaymentPassDetailViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v7, "startAnimating");
    objc_msgSend(v6, "setAccessoryView:", v7);
    v8 = objc_alloc_init(MEMORY[0x1E0D673D8]);
    objc_msgSend(v8, "setGraduation:", 1);
    v9 = -[PKPeerPaymentAccount state](self->_peerPaymentAccount, "state") == 1
      && -[PKPeerPaymentAccount stage](self->_peerPaymentAccount, "stage") == 3;
    if (-[PKPeerPaymentAccount isParticipantAccountLockedByOwner](self->_peerPaymentAccount, "isParticipantAccountLockedByOwner"))v10 = -[PKPeerPaymentAccount supportsGraduationWhileAssociatedAccountLocked](self->_peerPaymentAccount, "supportsGraduationWhileAssociatedAccountLocked");
    else
      v10 = 0;
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke;
    aBlock[3] = &unk_1E3E612E8;
    aBlock[4] = self;
    v12 = _Block_copy(aBlock);
    v42[0] = v11;
    v42[1] = 3221225472;
    v42[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_2;
    v42[3] = &unk_1E3E65388;
    v42[4] = self;
    v13 = v8;
    v43 = v13;
    v14 = v12;
    v44 = v14;
    v15 = _Block_copy(v42);
    v16 = v15;
    if (v9)
    {
      (*((void (**)(void *))v15 + 2))(v15);
    }
    else
    {
      v35 = v6;
      v17 = (void *)MEMORY[0x1E0DC3450];
      if (v10)
      {
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_GRADUATION_APPLE_CASH_LOCKED_TITLE"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_GRADUATION_APPLE_CASH_LOCKED_MESSAGE"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v18, v19, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPaymentString(CFSTR("CONTINUE"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v11;
        v40[1] = 3221225472;
        v40[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_5;
        v40[3] = &unk_1E3E61CA8;
        v41 = v16;
        objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, v40);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAction:", v23);

        v24 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedString(CFSTR("CANCEL"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v11;
        v38[1] = 3221225472;
        v38[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_6;
        v38[3] = &unk_1E3E61CA8;
        v39 = v14;
        objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 1, v38);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAction:", v26);

        -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "presentViewController:animated:completion:", v20, 1, 0);

        v28 = v41;
      }
      else
      {
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_FEATURE_NOT_SUPPORTED_TITLE"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_FEATURE_NOT_SUPPORTED_MESSAGE"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v29, v30, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v11;
        v36[1] = 3221225472;
        v36[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_7;
        v36[3] = &unk_1E3E61CA8;
        v37 = v14;
        objc_msgSend(v31, "actionWithTitle:style:handler:", v32, 0, v36);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAction:", v33);

        -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "presentViewController:animated:completion:", v20, 1, 0);

        v28 = v37;
      }

      v6 = v35;
    }

  }
}

void __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "indexOfSectionIdentifier:", CFSTR("PeerPaymentParticipantGraduation"));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForRowAtIndexPath:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessoryView:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1816) = 0;

}

void __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1704);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_3;
  v3[3] = &unk_1E3E614F0;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "presentFlowForAccountResolution:configuration:completion:", 2, v1, v3);

}

void __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_4;
  block[3] = &unk_1E3E61590;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__PKPaymentPassDetailViewController__didSelectPeerPaymentParticipantGradutionAtIndexPath___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_didSelectPeerPaymentAccountActionAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t peerPaymentAccountResolution;
  PKPeerPaymentAccountResolutionController *peerPaymentAccountResolutionController;
  _QWORD v11[5];

  v5 = a3;
  if (!self->_loadingPeerPaymentAccountActionIndexPath)
  {
    objc_storeStrong((id *)&self->_loadingPeerPaymentAccountActionIndexPath, a3);
    -[PKPaymentPassDetailViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForRowAtIndexPath:", self->_loadingPeerPaymentAccountActionIndexPath);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v8, "startAnimating");
    objc_msgSend(v7, "setAccessoryView:", v8);
    peerPaymentAccountResolution = self->_peerPaymentAccountResolution;
    if (peerPaymentAccountResolution == 3)
    {
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68578], 0);
      peerPaymentAccountResolution = self->_peerPaymentAccountResolution;
    }
    if (peerPaymentAccountResolution)
    {
      peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __83__PKPaymentPassDetailViewController__didSelectPeerPaymentAccountActionAtIndexPath___block_invoke;
      v11[3] = &unk_1E3E62288;
      v11[4] = self;
      -[PKPeerPaymentAccountResolutionController presentResolutionForCurrentAccountStateWithCompletion:](peerPaymentAccountResolutionController, "presentResolutionForCurrentAccountStateWithCompletion:", v11);
    }

  }
}

void __83__PKPaymentPassDetailViewController__didSelectPeerPaymentAccountActionAtIndexPath___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKPaymentPassDetailViewController__didSelectPeerPaymentAccountActionAtIndexPath___block_invoke_2;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __83__PKPaymentPassDetailViewController__didSelectPeerPaymentAccountActionAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doneLoadingPeerPaymentAccountAction");
}

- (void)_didSelectPeerPaymentStatementAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68580], 0, a3);
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_STATEMENT_ALERT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKPrimaryAppleAccountFormattedUsername();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_STATEMENT_ALERT_MESSAGE"), CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_STATEMENT_ALERT_CANCEL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_STATEMENT_ALERT_SEND"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PKPaymentPassDetailViewController__didSelectPeerPaymentStatementAtIndexPath___block_invoke;
  v14[3] = &unk_1E3E61D68;
  v14[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v10);
  objc_msgSend(v7, "addAction:", v13);
  objc_msgSend(v7, "setPreferredAction:", v13);
  PKAccessibilityIDAlertSet(v7, (void *)*MEMORY[0x1E0D67A28]);
  -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

void __79__PKPaymentPassDetailViewController__didSelectPeerPaymentStatementAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1720) = 1;
  objc_msgSend(*(id *)(a1 + 32), "reloadSectionIdentifier:", CFSTR("PeerPaymentStatement"));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 2192);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__PKPaymentPassDetailViewController__didSelectPeerPaymentStatementAtIndexPath___block_invoke_2;
  v5[3] = &unk_1E3E75DF8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "peerPaymentRequestStatementForAccountIdentifier:withCompletion:", 0, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __79__PKPaymentPassDetailViewController__didSelectPeerPaymentStatementAtIndexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentPassDetailViewController__didSelectPeerPaymentStatementAtIndexPath___block_invoke_3;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __79__PKPaymentPassDetailViewController__didSelectPeerPaymentStatementAtIndexPath___block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _BYTE *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    WeakRetained[1720] = 0;
    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(a1 + 40))
    {
      if (!v4)
      {
        v9[1721] = 1;
LABEL_8:
        objc_msgSend(v9, "reloadSectionIdentifier:", CFSTR("PeerPaymentStatement"));

        WeakRetained = v9;
        goto LABEL_9;
      }
    }
    else if (!v4)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_EMAIL_STATEMENT_ERROR_TITLE"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_EMAIL_STATEMENT_ERROR_MESSAGE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
    }
    v8 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
    objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

    goto LABEL_8;
  }
LABEL_9:

}

- (void)_didSelectFamilySharingAtIndexPath:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  PKPeerPaymentAssociatedAccountPresentationContext *v7;
  PKPeerPaymentAssociatedAccountsController *peerPaymentAssociatedAccountsController;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[16];

  v4 = objc_msgSend(a3, "row");
  if (v4 >= -[NSArray count](self->_sortedFamilyMemberRowModels, "count"))
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Opening apple cash family sharing settings from back of pass", buf, 2u);
    }

    PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openSensitiveURL:withOptions:", v11, 0);

  }
  else
  {
    -[NSArray objectAtIndex:](self->_sortedFamilyMemberRowModels, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "familyMember");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[NSArray objectAtIndex:](self->_sortedFamilyMemberRowModels, "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v6, "state") - 1) <= 2)
    {
      v7 = -[PKPeerPaymentAssociatedAccountPresentationContext initWithPKFamilyMember:options:]([PKPeerPaymentAssociatedAccountPresentationContext alloc], "initWithPKFamilyMember:options:", v13, 0);
      peerPaymentAssociatedAccountsController = self->_peerPaymentAssociatedAccountsController;
      -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentAssociatedAccountsController presentAssociatedAccountsFlowWithPresentationContext:fromNavigationController:](peerPaymentAssociatedAccountsController, "presentAssociatedAccountsFlowWithPresentationContext:fromNavigationController:", v7, v9);

    }
  }
}

- (void)_didSelectBalanceOrCommutePlanCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  v4 = a3;
  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v4, 1);

  v6 = objc_msgSend(v4, "row");
  v7 = -[NSArray count](self->_displayableBalanceFields, "count");
  if (v6 >= v7)
  {
    if (v6 - v7 >= 0)
      -[PKPaymentPassDetailViewController _didSelectCommutePlanAtRowIndex:](self, "_didSelectCommutePlanAtRowIndex:", v6 - v7);
  }
  else
  {
    -[PKPaymentPassDetailViewController _didSelectBalanceAtRowIndex:](self, "_didSelectBalanceAtRowIndex:", v6);
  }
}

- (void)_didSelectBalanceAtRowIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  PKPaymentDataProvider *paymentServiceDataProvider;
  PKPaymentPass *pass;
  _QWORD v9[4];
  id v10;
  PKPaymentPassDetailViewController *v11;
  id v12;
  id v13;
  id location;

  -[PKPaymentPassDetailViewController _balanceForRow:](self, "_balanceForRow:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _topUpActionForRow:](self, "_topUpActionForRow:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    pass = self->_pass;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__PKPaymentPassDetailViewController__didSelectBalanceAtRowIndex___block_invoke;
    v9[3] = &unk_1E3E798C8;
    objc_copyWeak(&v13, &location);
    v10 = v5;
    v11 = self;
    v12 = v6;
    -[PKPaymentDataProvider balanceReminderThresholdForBalance:pass:withCompletion:](paymentServiceDataProvider, "balanceReminderThresholdForBalance:pass:withCompletion:", v10, pass, v9);

    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&location);

}

void __65__PKPaymentPassDetailViewController__didSelectBalanceAtRowIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKPaymentPassDetailViewController__didSelectBalanceAtRowIndex___block_invoke_2;
  block[3] = &unk_1E3E623E8;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v11 = v3;
  v12 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
}

void __65__PKPaymentPassDetailViewController__didSelectBalanceAtRowIndex___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  PKBalanceDetailsViewController *v4;
  PKBalanceDetailsViewController *v5;
  _QWORD *v6;
  PKBalanceDetailsViewController *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = [PKBalanceDetailsViewController alloc];
    if (v3)
    {
      v5 = -[PKBalanceDetailsViewController initWithBalance:forPass:balanceReminder:associatedAction:paymentDataProvider:webService:style:](v4, "initWithBalance:forPass:balanceReminder:associatedAction:paymentDataProvider:webService:style:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1064), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 2168), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 2184), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 2144) > 1uLL);
    }
    else
    {
      v6 = *(_QWORD **)(a1 + 40);
      v5 = -[PKBalanceDetailsViewController initWithTransitPassProperties:forPass:balanceReminder:associatedAction:paymentDataProvider:webService:style:](v4, "initWithTransitPassProperties:forPass:balanceReminder:associatedAction:paymentDataProvider:webService:style:", v6[164], v6[133], *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v6[271], v6[273], v6[268] > 1uLL);
    }
    v7 = v5;
    -[PKBalanceDetailsViewController setDelegate:](v5, "setDelegate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushViewController:animated:", v7, 1);

    WeakRetained = v9;
  }

}

- (id)_actionForCommutePlan:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKRenewActionForPaymentPassAndIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_commutePlanIsSelectable:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = v6 || objc_msgSend(v5, "hasDisplayableInformation");

  return v7;
}

- (void)_didSelectCommutePlanAtRowIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  PKCommutePlanDetailsViewController *v6;
  _QWORD v7[4];
  PKCommutePlanDetailsViewController *v8;
  id v9;
  id location;

  -[NSArray objectAtIndex:](self->_commutePlans, "objectAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _actionForCommutePlan:](self, "_actionForCommutePlan:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentPassDetailViewController _commutePlanIsSelectable:action:](self, "_commutePlanIsSelectable:action:", v4, v5))
  {
    v6 = -[PKCommutePlanDetailsViewController initWithCommutePlan:associatedAction:forPass:paymentDataProvider:webService:style:]([PKCommutePlanDetailsViewController alloc], "initWithCommutePlan:associatedAction:forPass:paymentDataProvider:webService:style:", v4, v5, self->_pass, self->_paymentServiceDataProvider, self->_webService, self->_detailViewStyle);
    if (v6)
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __69__PKPaymentPassDetailViewController__didSelectCommutePlanAtRowIndex___block_invoke;
      v7[3] = &unk_1E3E62FA0;
      objc_copyWeak(&v9, &location);
      v8 = v6;
      -[PKCommutePlanDetailsViewController preflightWithCompletion:](v8, "preflightWithCompletion:", v7);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }

  }
}

void __69__PKPaymentPassDetailViewController__didSelectCommutePlanAtRowIndex___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a2)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

    WeakRetained = v6;
  }

}

- (void)_didSelectPassInGroupAtIndexPath:(id)a3
{
  PKGroup *group;
  id v5;
  uint64_t v6;
  uint64_t v7;
  PKEditPassesNavigationController *v8;

  group = self->_group;
  v5 = a3;
  v6 = -[PKGroup passCount](group, "passCount");
  v7 = objc_msgSend(v5, "row");

  if (v7 == v6)
  {
    v8 = -[PKEditPassesNavigationController initWithExistingGroupsController:specificGroup:isForWatch:delegate:]([PKEditPassesNavigationController alloc], "initWithExistingGroupsController:specificGroup:isForWatch:delegate:", self->_groupsController, self->_group, self->_detailViewStyle == 2, 0);
    -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (void)_didSelectCardInfoCellAtIndexPath:(id)a3
{
  PKExpressPassesViewController *v4;
  int64_t v5;
  int64_t detailViewStyle;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v4 = (PKExpressPassesViewController *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
LABEL_8:

    goto LABEL_9;
  }
  v5 = -[PKPaymentPassDetailViewController _rowIndexForExpressTransitSettingsCell](self, "_rowIndexForExpressTransitSettingsCell");
  if (v5 == objc_msgSend(v9, "row"))
  {
    detailViewStyle = self->_detailViewStyle;
    if (detailViewStyle)
    {
      v4 = -[PKExpressPassesViewController initWithPaymentDataProvider:controller:style:]([PKExpressPassesViewController alloc], "initWithPaymentDataProvider:controller:style:", self->_paymentServiceDataProvider, self->_expressPassController, detailViewStyle != 1);
      -[PKPassLibraryDataProvider paymentPasses](self->_passLibraryDataProvider, "paymentPasses");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKExpressPassesViewController setPasses:](v4, "setPasses:", v7);

      -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pushViewController:animated:", v4, 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v4 = (PKExpressPassesViewController *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _settingsExpressTransitURL](self, "_settingsExpressTransitURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKExpressPassesViewController openSensitiveURL:withOptions:](v4, "openSensitiveURL:withOptions:", v8, 0);
    }

    goto LABEL_8;
  }
LABEL_9:

}

- (void)_didSelectMerchantTokensCell
{
  void *v3;
  uint64_t v4;
  void *v5;
  PKMerchantTokensViewController *v6;

  -[PKRetrieveMerchantTokensResponse merchantTokens](self->_merchantTokensResponse, "merchantTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v6 = -[PKMerchantTokensViewController initWithPass:merchantTokensResponse:]([PKMerchantTokensViewController alloc], "initWithPass:merchantTokensResponse:", self->_pass, self->_merchantTokensResponse);
    -[PKMerchantTokensViewController setDelegate:](v6, "setDelegate:", self);
    -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v6, 1);

  }
}

- (id)_settingsExpressTransitURL
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("prefs:root=PASSBOOK&path="));
  objc_msgSend(v3, "appendString:", *MEMORY[0x1E0D6BAD0]);
  objc_msgSend(v3, "appendString:", CFSTR("&"));
  objc_msgSend(v3, "appendString:", *MEMORY[0x1E0D6BBE0]);
  objc_msgSend(v3, "appendString:", CFSTR("="));
  v4 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formUnionWithCharacterSet:", v5);

  objc_msgSend(v4, "removeCharactersInString:", CFSTR("="));
  -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendString:", v7);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_didSelectInstallmentPlansAtIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;
  PKTransactionHistoryViewController *v6;
  void *v7;
  PKInstallmentPlansViewController *v8;
  void *v9;
  id v10;

  -[PKAccount creditDetails](self->_account, "creditDetails", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installmentPlans");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v10, "count");
  if (v5)
  {
    if (v5 == 1)
    {
      v6 = [PKTransactionHistoryViewController alloc];
      objc_msgSend(v10, "anyObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PKTransactionHistoryViewController initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:](v6, "initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:", v7, self->_transactionSourceCollection, self->_familyCollection, self->_account, self->_accountUserCollection, self->_physicalCards);

      if (!v8)
        goto LABEL_7;
      goto LABEL_6;
    }
    v8 = -[PKInstallmentPlansViewController initWithAccount:accountUserCollection:physicalCards:accountService:transactionSourceCollection:familyCollection:dataProvider:]([PKInstallmentPlansViewController alloc], "initWithAccount:accountUserCollection:physicalCards:accountService:transactionSourceCollection:familyCollection:dataProvider:", self->_account, self->_accountUserCollection, self->_physicalCards, self->_accountService, self->_transactionSourceCollection, self->_familyCollection, self->_paymentServiceDataProvider);
    if (v8)
    {
LABEL_6:
      -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pushViewController:animated:", v8, 1);

    }
  }
LABEL_7:

}

- (id)_installmentsPlanCellForTableView:(id)a3 atIndexPath:(id)a4
{
  PKAccount *account;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;

  account = self->_account;
  v6 = a3;
  -[PKAccount creditDetails](account, "creditDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "installmentPlans");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 >= 2)
    v13 = CFSTR("INSTALLMENTS");
  else
    v13 = CFSTR("INSTALLMENT");
  PKLocalizedBeekmanString(&v13->isa);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "_infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v14, v12, 1, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAccessoryType:", 1);
  PKAccessibilityIDCellSet(v15, (void *)*MEMORY[0x1E0D67C98]);

  return v15;
}

- (void)_didSelectAccountServiceBankAccountsAtIndexPath:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

  }
  else if (!objc_msgSend(v5, "row"))
  {
    -[PKPaymentPassDetailViewController presentBankAccounts](self, "presentBankAccounts");
  }

}

- (void)_didSelectAccountServiceMakeDefaultAtIndexPath:(id)a3
{
  -[PKPaymentPassDetailViewController presentMakeDefaultAtApple](self, "presentMakeDefaultAtApple", a3);
  -[PKPaymentPassDetailViewController _reportPassDetailsAnalyticsForTappedRowTag:additionalAnalytics:](self, "_reportPassDetailsAnalyticsForTappedRowTag:additionalAnalytics:", *MEMORY[0x1E0D68DD0], 0);
}

- (void)_didSelectAccountServiceRewardsDetailsAtIndexPath:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[PKPaymentPassDetailViewController _accountServiceRewardsRowForRowIndex:](self, "_accountServiceRewardsRowForRowIndex:", objc_msgSend(v5, "row"));
  if (v4 == 2)
  {
    -[PKPaymentPassDetailViewController _didSelectFixPeerPaymentAtIndexPath:](self, "_didSelectFixPeerPaymentAtIndexPath:", v5);
  }
  else if (v4 == 1)
  {
    -[PKPaymentPassDetailViewController _didSelectRedeemAtIndexPath:](self, "_didSelectRedeemAtIndexPath:", v5);
  }

}

- (void)_didSelectAccountServicePhysicalCardAtIndexPath:(id)a3
{
  id v4;
  PKReplacePhysicalCardReasonViewController *v5;
  void *v6;
  void *v7;
  CLInUseAssertion *v8;
  CLInUseAssertion *inUseAssertion;
  PKReplacePhysicalCardReasonViewController *v10;
  int64_t detailViewStyle;
  uint64_t v12;
  uint64_t v13;
  PKNavigationController *v14;
  _QWORD v15[5];
  PKReplacePhysicalCardReasonViewController *v16;

  v4 = a3;
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v5 = (PKReplacePhysicalCardReasonViewController *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
LABEL_3:

  }
  else
  {
    switch(-[PKPaymentPassDetailViewController _accountServicePhysicalCardRowForRowIndex:](self, "_accountServicePhysicalCardRowForRowIndex:", objc_msgSend(v4, "row")))
    {
      case 0uLL:
        -[PKPhysicalCardController primaryPhysicalCard](self->_physicalCardController, "primaryPhysicalCard");
        v5 = (PKReplacePhysicalCardReasonViewController *)objc_claimAutoreleasedReturnValue();
        if (v5 && !self->_loadingEnableDisablePhysicalCard)
        {
          if (!self->_inUseAssertion)
          {
            v6 = (void *)MEMORY[0x1E0C9E3A8];
            PKPassKitCoreBundle();
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = (CLInUseAssertion *)objc_msgSend(v6, "newAssertionForBundle:withReason:", v7, CFSTR("Enable/disable physical card"));
            inUseAssertion = self->_inUseAssertion;
            self->_inUseAssertion = v8;

          }
          self->_loadingEnableDisablePhysicalCard = 1;
          if (-[PKPhysicalCardController primaryPhysicalCardEnabled](self->_physicalCardController, "primaryPhysicalCardEnabled"))
          {
            -[PKPhysicalCardActionController disablePhysicalCard:](self->_physicalCardActionController, "disablePhysicalCard:", v5);
          }
          else
          {
            v15[0] = MEMORY[0x1E0C809B0];
            v15[1] = 3221225472;
            v15[2] = __85__PKPaymentPassDetailViewController__didSelectAccountServicePhysicalCardAtIndexPath___block_invoke;
            v15[3] = &unk_1E3E64E38;
            v15[4] = self;
            v16 = v5;
            -[PKPaymentPassDetailViewController _presentPhysicalCardPasswordAuthorization:](self, "_presentPhysicalCardPasswordAuthorization:", v15);

          }
        }
        goto LABEL_3;
      case 1uLL:
        -[PKPaymentPassDetailViewController presentActivatePhysicalCard](self, "presentActivatePhysicalCard");
        break;
      case 2uLL:
        -[PKPaymentPassDetailViewController presentOrderPhysicalCard](self, "presentOrderPhysicalCard");
        break;
      case 3uLL:
        v10 = [PKReplacePhysicalCardReasonViewController alloc];
        detailViewStyle = self->_detailViewStyle;
        v12 = 3;
        if (detailViewStyle != 1)
          v12 = 0;
        if (detailViewStyle == 2)
          v13 = 4;
        else
          v13 = v12;
        v5 = -[PKReplacePhysicalCardReasonViewController initWithPhysicalCardController:context:](v10, "initWithPhysicalCardController:context:", self->_physicalCardController, v13);
        v14 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
        -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

        goto LABEL_3;
      case 4uLL:
        -[PKPaymentPassDetailViewController presentTrackPhysicalCard](self, "presentTrackPhysicalCard");
        break;
      default:
        break;
    }
  }

}

void __85__PKPaymentPassDetailViewController__didSelectAccountServicePhysicalCardAtIndexPath___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v8 = v5;
    objc_msgSend(*(id *)(v6 + 1632), "enablePhysicalCard:", *(_QWORD *)(a1 + 40));
LABEL_5:
    v5 = v8;
    goto LABEL_6;
  }
  *(_BYTE *)(v6 + 1650) = 0;
  if (v5)
  {
    v8 = v5;
    v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v7, 1, 0);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)_presentPhysicalCardPasswordAuthorization:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_appleAccountInformation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0D002F8]);
    objc_msgSend(v7, "setPresentingViewController:", self);
    objc_msgSend(v6, "appleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUsername:", v8);

    objc_msgSend(v6, "aaAlternateDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAltDSID:", v9);

    objc_msgSend(v7, "setIsUsernameEditable:", 0);
    objc_msgSend(v7, "setShouldPromptForPasswordOnly:", 1);
    objc_msgSend(v7, "setAuthenticationType:", 2);
    -[PKAccount feature](self->_account, "feature");
    objc_msgSend(v6, "appleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setReason:", v11, v10);

    v12 = objc_alloc_init(MEMORY[0x1E0D00130]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__PKPaymentPassDetailViewController__presentPhysicalCardPasswordAuthorization___block_invoke;
    v13[3] = &unk_1E3E618C8;
    v13[4] = self;
    v14 = v4;
    objc_msgSend(v12, "authenticateWithContext:completion:", v7, v13);

  }
}

void __79__PKPaymentPassDetailViewController__presentPhysicalCardPasswordAuthorization___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__PKPaymentPassDetailViewController__presentPhysicalCardPasswordAuthorization___block_invoke_2;
  v10[3] = &unk_1E3E65E08;
  v11 = v5;
  v12 = v6;
  v7 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __79__PKPaymentPassDetailViewController__presentPhysicalCardPasswordAuthorization___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v16 = 138412546;
    v17 = v3;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Request for user authentication returned result with keys: %@ error: %@", (uint8_t *)&v16, 0x16u);

  }
  v5 = *(void **)(a1 + 40);
  if (!v5)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_8;
  }
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CFFF10];
  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0CFFF10]))
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v8 == -7003)
    {
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_8:
      v9();
      return;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqual:", v7))
  {
    v11 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v11 == -7005)
    {
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      return;
    }
  }
  else
  {

  }
  +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "_accountFeature"), 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_didSelectAccountServiceCardNumbersAtIndexPath:(id)a3
{
  -[PKPaymentPassDetailViewController presentCardNumbers](self, "presentCardNumbers", a3);
  -[PKPaymentPassDetailViewController _reportPassDetailsAnalyticsForTappedRowTag:additionalAnalytics:](self, "_reportPassDetailsAnalyticsForTappedRowTag:additionalAnalytics:", *MEMORY[0x1E0D68910], 0);
}

- (void)_didSelectServicingWalletLink
{
  id v2;

  -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  PKOpenPassDetails();

}

- (void)_doneLoadingPeerPaymentAccountAction
{
  void *v3;
  NSIndexPath *loadingPeerPaymentAccountActionIndexPath;
  id v5;

  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForRowAtIndexPath:", self->_loadingPeerPaymentAccountActionIndexPath);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessoryView:", 0);
  loadingPeerPaymentAccountActionIndexPath = self->_loadingPeerPaymentAccountActionIndexPath;
  self->_loadingPeerPaymentAccountActionIndexPath = 0;

}

- (void)presentTopUp
{
  -[PKPaymentPassDetailViewController _showPeerPaymentActionViewControllerForAction:](self, "_showPeerPaymentActionViewControllerForAction:", 1);
}

- (void)presentTransferToBank
{
  -[PKPaymentPassDetailViewController _showPeerPaymentActionViewControllerForAction:](self, "_showPeerPaymentActionViewControllerForAction:", 2);
}

- (void)presentAutoReload
{
  -[PKPeerPaymentAutoReloadSectionController presentAutoReload](self->_peerPaymentAutoReloadSectionController, "presentAutoReload");
}

- (void)presentRecurringPaymentsWithIdentifier:(id)a3
{
  -[PKPeerPaymentRecurringPaymentPassDetailsSectionController presentRecurringPaymentsWithIdentifier:](self->_peerPaymentRecurringPaymentSectionController, "presentRecurringPaymentsWithIdentifier:", a3);
}

- (void)presentAddCard
{
  -[PKPaymentPassDetailViewController _openPaymentSetupWithNetworkWhitelist:paymentSetupMode:](self, "_openPaymentSetupWithNetworkWhitelist:paymentSetupMode:", 0, 0);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v6, v4);

}

- (void)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;

  v3 = a3;
  -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", v3);

}

- (void)presentIdentityVerification
{
  PKPeerPaymentAccount *peerPaymentAccount;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  char v10;
  unint64_t v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[2];
  __int16 v21;

  if ((PKDeviceSupportsPeerPaymentIdentityVerification() & 1) == 0)
  {
    PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);
LABEL_12:

    return;
  }
  peerPaymentAccount = self->_peerPaymentAccount;
  if (peerPaymentAccount && self->_pass)
  {
    -[PKPeerPaymentAccount associatedPassUniqueID](peerPaymentAccount, "associatedPassUniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v7 = v5;
    if (v6 == v7)
    {

      goto LABEL_15;
    }
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {

    }
    else
    {
      v10 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v10 & 1) != 0)
      {
LABEL_15:
        if (-[PKPaymentPassDetailViewController _shouldShowAccountActions](self, "_shouldShowAccountActions"))
        {
          if (self->_peerPaymentAccountResolution == 2)
          {
            v11 = 2;
            goto LABEL_24;
          }
        }
        else if (-[PKPaymentPassDetailViewController _canDoManualIdentityVerification](self, "_canDoManualIdentityVerification"))
        {
          v11 = 47;
LABEL_24:
          PKPassDetailSectionTypeToString(v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[PKDynamicTableViewController hasSectionForSectionIdentifier:](self, "hasSectionForSectionIdentifier:", v15);

          if (v16)
          {
            v17 = (void *)MEMORY[0x1E0CB36B0];
            PKPassDetailSectionTypeToString(v11);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "indexPathForRow:inSection:", 0, -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", v18));
            v19 = (id)objc_claimAutoreleasedReturnValue();

            -[PKPaymentPassDetailViewController _didSelectPeerPaymentManualIdentityVerificationAtIndexPath:](self, "_didSelectPeerPaymentManualIdentityVerificationAtIndexPath:", v19);
            goto LABEL_12;
          }
        }
        PKLogFacilityTypeGetObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        v21 = 0;
        v13 = "Identity Verification not required";
        v14 = (uint8_t *)&v21;
        goto LABEL_20;
      }
    }
  }
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v13 = "Will not present peer payment identity verification: peer payment pass is not being presented";
    v14 = buf;
LABEL_20:
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
  }
LABEL_21:

}

- (void)presentISO18013Details
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", CFSTR("IdentityDocumentDetails")));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController didSelectIdentityDocumentCellInTableView:atIndexPath:](self, "didSelectIdentityDocumentCellInTableView:atIndexPath:", v3, v4);

}

- (void)presentTermsAcceptance
{
  PKPeerPaymentAccount *peerPaymentAccount;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  PKPeerPaymentTermsController *v15;
  void *v16;
  PKPeerPaymentTermsController *v17;
  _QWORD v18[4];
  id v19;
  id location[2];

  peerPaymentAccount = self->_peerPaymentAccount;
  if (peerPaymentAccount && self->_pass)
  {
    -[PKPeerPaymentAccount associatedPassUniqueID](peerPaymentAccount, "associatedPassUniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v7 = v5;
    if (v6 == v7)
    {

      goto LABEL_12;
    }
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {

    }
    else
    {
      v10 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v10 & 1) != 0)
      {
LABEL_12:
        -[PKPeerPaymentAccount termsURL](self->_peerPaymentAccount, "termsURL");
        v11 = objc_claimAutoreleasedReturnValue();
        -[PKPeerPaymentAccount termsIdentifier](self->_peerPaymentAccount, "termsIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          v14 = v12 == 0;
        else
          v14 = 1;
        if (!v14)
        {
          v15 = [PKPeerPaymentTermsController alloc];
          objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[PKPeerPaymentTermsController initWithTermsURL:termsIdentifier:passUniqueID:webService:](v15, "initWithTermsURL:termsIdentifier:passUniqueID:webService:", v11, v12, v13, v16);

          objc_initWeak(location, self);
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __59__PKPaymentPassDetailViewController_presentTermsAcceptance__block_invoke;
          v18[3] = &unk_1E3E634A8;
          objc_copyWeak(&v19, location);
          -[PKPeerPaymentTermsController presentTermsOverController:showInterstitialViewController:withCompletionHandler:](v17, "presentTermsOverController:showInterstitialViewController:withCompletionHandler:", self, 0, v18);
          objc_destroyWeak(&v19);
          objc_destroyWeak(location);

        }
        goto LABEL_20;
      }
    }
  }
  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Will not present peer payment terms for acceptance: peer payment pass is not being presented", (uint8_t *)location, 2u);
  }
LABEL_20:

}

void __59__PKPaymentPassDetailViewController_presentTermsAcceptance__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if ((unint64_t)(a2 - 1) >= 2)
    {
      if (!a2)
      {
        objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);

        objc_msgSend(v6, "presentViewController:animated:completion:", v8, 1, 0);
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
    }
  }

}

- (void)_didSelectTransferToBank
{
  -[PKPaymentPassDetailViewController _showPeerPaymentActionViewControllerForAction:](self, "_showPeerPaymentActionViewControllerForAction:", 2);
}

- (id)_accountResolutionController
{
  PKAccountServiceAccountResolutionController *resolutionController;
  PKAccountServiceAccountResolutionController *v4;
  PKAccountServiceAccountResolutionController *v5;

  resolutionController = self->_resolutionController;
  if (!resolutionController)
  {
    v4 = -[PKAccountServiceAccountResolutionController initWithAccount:accountUserCollection:transactionSourceCollection:]([PKAccountServiceAccountResolutionController alloc], "initWithAccount:accountUserCollection:transactionSourceCollection:", self->_account, self->_accountUserCollection, self->_transactionSourceCollection);
    v5 = self->_resolutionController;
    self->_resolutionController = v4;

    -[PKAccountServiceAccountResolutionController setDelegate:](self->_resolutionController, "setDelegate:", self);
    resolutionController = self->_resolutionController;
  }
  return resolutionController;
}

- (void)presentSchedulePayments
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__PKPaymentPassDetailViewController_presentSchedulePayments__block_invoke;
  v3[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __60__PKPaymentPassDetailViewController_presentSchedulePayments__block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_sceneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)WeakRetained[234];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__PKPaymentPassDetailViewController_presentSchedulePayments__block_invoke_2;
    v9[3] = &unk_1E3E62638;
    objc_copyWeak(&v10, v2);
    objc_msgSend(v8, "presentSchedulePayments:completion:", v7, v9);
    objc_destroyWeak(&v10);

  }
}

void __60__PKPaymentPassDetailViewController_presentSchedulePayments__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)presentCardNumbers
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id buf[2];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to present virtual card and card numbers", (uint8_t *)buf, 2u);
  }

  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

  }
  else
  {
    objc_initWeak(buf, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__PKPaymentPassDetailViewController_presentCardNumbers__block_invoke;
    v5[3] = &unk_1E3E61B68;
    objc_copyWeak(&v6, buf);
    v5[4] = self;
    -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __55__PKPaymentPassDetailViewController_presentCardNumbers__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PKAccountCardNumbersPresenter *v13;
  int v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained[205], "isLoadingVirtualCard") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, objc_msgSend(v3, "indexOfSectionIdentifier:", CFSTR("AccountServiceCardNumbers")));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "_showSpinner:inCell:overrideTextColor:", 1, v6, 0);
    objc_msgSend(v3[277], "creditDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "virtualCards");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = PKVirtualCardEnabledWithWebService();

    if ((_DWORD)v8)
    {
      objc_msgSend(MEMORY[0x1E0D67778], "cardsForPaymentPass:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "anyObject");
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
    }
    v13 = [PKAccountCardNumbersPresenter alloc];
    v14 = objc_msgSend(v3[203], "hasExpiredPhysicalCardOnly");
    v15 = v3[203];
    if (v14)
      objc_msgSend(v15, "expiredPhysicalCard");
    else
      objc_msgSend(v15, "primaryPhysicalCard");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2144);
    v18 = 3;
    if (v17 != 1)
      v18 = 0;
    if (v17 == 2)
      v19 = 4;
    else
      v19 = v18;
    v20 = -[PKAccountCardNumbersPresenter initWithVirtualCard:physicalCard:account:peerPaymentAccount:pass:context:](v13, "initWithVirtualCard:physicalCard:account:peerPaymentAccount:pass:context:", v9, v16, v3[277], v3[195], v3[133], v19);
    v21 = v3[205];
    v3[205] = (id)v20;

    v22 = v3[205];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __55__PKPaymentPassDetailViewController_presentCardNumbers__block_invoke_2;
    v24[3] = &unk_1E3E65198;
    v24[4] = v3;
    v25 = v4;
    v23 = v4;
    objc_msgSend(v22, "presentCardNumbersWithCompletion:", v24);

  }
}

void __55__PKPaymentPassDetailViewController_presentCardNumbers__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_showSpinner:inCell:overrideTextColor:", 0, v4, 0);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "presentViewController:animated:completion:", v8, 1, 0);
  }
  else
  {
    objc_msgSend(v6, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v8, 1);

  }
}

- (void)presentBalanceDetails
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PKPaymentPassDetailViewController_presentBalanceDetails__block_invoke;
  v3[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __58__PKPaymentPassDetailViewController_presentBalanceDetails__block_invoke(uint64_t a1)
{
  PKCreditBalanceDetailsViewController *v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = -[PKCreditBalanceDetailsViewController initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:]([PKCreditBalanceDetailsViewController alloc], "initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:", 1, WeakRetained[275], WeakRetained[282], WeakRetained[273], WeakRetained[277], WeakRetained[264], WeakRetained[281], 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pushViewController:animated:", v2, 1);

  }
}

- (void)presentBankAccounts
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PKPaymentPassDetailViewController_presentBankAccounts__block_invoke;
  v3[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, &location);
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __56__PKPaymentPassDetailViewController_presentBankAccounts__block_invoke(uint64_t a1)
{
  id *v1;
  _BYTE *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  PKAccountBankAccountsViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PKAccountBankAccountsViewController *v11;
  PKAccountBankAccountsViewController *v12;
  _QWORD v13[4];
  PKAccountBankAccountsViewController *v14;
  id v15;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained && !WeakRetained[1648])
  {
    WeakRetained[1648] = 1;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, objc_msgSend(WeakRetained, "indexOfSectionIdentifier:", CFSTR("AccountServiceBankAccounts")));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "_showSpinner:inCell:overrideTextColor:", 1, v6, 0);
    v7 = [PKAccountBankAccountsViewController alloc];
    v8 = v3[268];
    v9 = 3;
    if (v8 != 1)
      v9 = 0;
    if (v8 == 2)
      v10 = 4;
    else
      v10 = v9;
    v11 = -[PKAccountBankAccountsViewController initWithAccount:paymentWebService:context:](v7, "initWithAccount:paymentWebService:context:", v3[277], v3[273], v10);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__PKPaymentPassDetailViewController_presentBankAccounts__block_invoke_2;
    v13[3] = &unk_1E3E625E8;
    objc_copyWeak(&v15, v1);
    v12 = v11;
    v14 = v12;
    -[PKAccountBankAccountsViewController preflightWithCompletion:](v12, "preflightWithCompletion:", v13);

    objc_destroyWeak(&v15);
  }

}

void __56__PKPaymentPassDetailViewController_presentBankAccounts__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PKPaymentPassDetailViewController_presentBankAccounts__block_invoke_3;
  v7[3] = &unk_1E3E625C0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v11 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v10);
}

void __56__PKPaymentPassDetailViewController_presentBankAccounts__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained[174], "objectAtIndex:", objc_msgSend(WeakRetained[190], "selectedSegmentIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, objc_msgSend(v11, "indexOfSectionIdentifier:", CFSTR("AccountServiceBankAccounts")));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForRowAtIndexPath:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "_showSpinner:inCell:overrideTextColor:", 0, v7, 0);
    }
    v8 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(a1 + 56) || v8)
    {
      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v8, objc_msgSend(v11[277], "feature"), 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);
      objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

    }
    else
    {
      objc_msgSend(v11, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);
    }

    WeakRetained = v11;
    *((_BYTE *)v11 + 1648) = 0;
  }

}

- (void)presentAccountUserDetailsForAccountUserAltDSID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__PKPaymentPassDetailViewController_presentAccountUserDetailsForAccountUserAltDSID___block_invoke;
  v6[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __84__PKPaymentPassDetailViewController_presentAccountUserDetailsForAccountUserAltDSID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  id v18;
  id v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v1 = a1;
  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_23;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = *(id *)(*(_QWORD *)(v1 + 32) + 2264);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v4)
    goto LABEL_22;
  v5 = v4;
  v19 = WeakRetained;
  v6 = *(_QWORD *)v22;
LABEL_4:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v22 != v6)
      objc_enumerationMutation(v3);
    v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_16;
    v9 = v3;
    objc_msgSend(v8, "accountUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v1;
    v13 = *(void **)(v1 + 40);
    v14 = v11;
    v15 = v13;
    if (v14 == v15)
      break;
    v16 = v15;
    if (v14)
      v17 = v15 == 0;
    else
      v17 = 1;
    if (v17)
    {

      v1 = v12;
      v3 = v9;
    }
    else
    {
      v20 = objc_msgSend(v14, "isEqualToString:", v15);

      v1 = v12;
      v3 = v9;
      if ((v20 & 1) != 0)
        goto LABEL_20;
    }
LABEL_16:
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v5)
        goto LABEL_4;
      WeakRetained = v19;
      goto LABEL_22;
    }
  }

  v1 = v12;
  v3 = v9;
LABEL_20:
  v18 = v8;

  WeakRetained = v19;
  if (!v18)
    goto LABEL_23;
  objc_msgSend(*(id *)(v1 + 32), "presentAccountUserDetailsForRowModel:", v18);
  v3 = v18;
LABEL_22:

LABEL_23:
}

- (void)presentAccountUserInvitationWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__PKPaymentPassDetailViewController_presentAccountUserInvitationWithIdentifier___block_invoke;
  v6[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __80__PKPaymentPassDetailViewController_presentAccountUserInvitationWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  id v18;
  id v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v1 = a1;
  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_23;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = *(id *)(*(_QWORD *)(v1 + 32) + 2264);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v4)
    goto LABEL_22;
  v5 = v4;
  v19 = WeakRetained;
  v6 = *(_QWORD *)v22;
LABEL_4:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v22 != v6)
      objc_enumerationMutation(v3);
    v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_16;
    v9 = v3;
    objc_msgSend(v8, "invitation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v1;
    v13 = *(void **)(v1 + 40);
    v14 = v11;
    v15 = v13;
    if (v14 == v15)
      break;
    v16 = v15;
    if (v14)
      v17 = v15 == 0;
    else
      v17 = 1;
    if (v17)
    {

      v1 = v12;
      v3 = v9;
    }
    else
    {
      v20 = objc_msgSend(v14, "isEqualToString:", v15);

      v1 = v12;
      v3 = v9;
      if ((v20 & 1) != 0)
        goto LABEL_20;
    }
LABEL_16:
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v5)
        goto LABEL_4;
      WeakRetained = v19;
      goto LABEL_22;
    }
  }

  v1 = v12;
  v3 = v9;
LABEL_20:
  v18 = v8;

  WeakRetained = v19;
  if (!v18)
    goto LABEL_23;
  objc_msgSend(*(id *)(v1 + 32), "presentAccountUserInvitationForRowModel:", v18);
  v3 = v18;
LABEL_22:

LABEL_23:
}

- (void)presentShareAccount
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PKPaymentPassDetailViewController_presentShareAccount__block_invoke;
  v3[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, &location);
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __56__PKPaymentPassDetailViewController_presentShareAccount__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "presentAddAccountUser");
    WeakRetained = v2;
  }

}

- (void)presentMakeDefaultAtApple
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__PKPaymentPassDetailViewController_presentMakeDefaultAtApple__block_invoke;
  v3[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, &location);
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __62__PKPaymentPassDetailViewController_presentMakeDefaultAtApple__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  PKAccountFlowController *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  PKAccountFlowController *v8;
  void *v9;
  PKNavigationController *v10;
  void *v11;
  void *v12;
  _QWORD *v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v13 = WeakRetained;
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", WeakRetained[273]);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66840]), "initWithAccount:", v13[277]);
    objc_msgSend(v3, "setPaymentPass:", v13[133]);
    v4 = [PKAccountFlowController alloc];
    v5 = v13[268];
    v6 = 3;
    if (v5 != 1)
      v6 = 0;
    if (v5 == 2)
      v7 = 4;
    else
      v7 = v6;
    v8 = -[PKAccountFlowController initWithAccountCredential:provisioningController:setupDelegate:context:operations:](v4, "initWithAccountCredential:provisioningController:setupDelegate:context:operations:", v3, v2, 0, v7, 24);
    -[PKAccountFlowController firstAccountViewController](v8, "firstAccountViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v9);
    if (v13[268] == 2)
    {
      PKBridgeAppearanceGetAppearanceSpecifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKAppearanceApplyToContainer(v11, v10);

    }
    objc_msgSend(v13, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentViewController:animated:completion:", v10, 1, 0);

    WeakRetained = v13;
  }

}

- (void)presentOrderPhysicalCard
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__PKPaymentPassDetailViewController_presentOrderPhysicalCard__block_invoke;
  v3[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, &location);
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __61__PKPaymentPassDetailViewController_presentOrderPhysicalCard__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[1649])
  {
    objc_msgSend(WeakRetained, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "indexOfSectionIdentifier:", CFSTR("AccountServicePhysicalCard"));
    v5 = objc_msgSend(v2, "_rowIndexForAccountServicePhysicalCardRow:", 2);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0x7FFFFFFFFFFFFFFFLL, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 1, 1);

    }
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v2[1649] = 1;
      objc_msgSend(v2, "reloadSection:", 21);
      v7 = (void *)*((_QWORD *)v2 + 203);
      v8 = *((_QWORD *)v2 + 268);
      v9 = 3;
      if (v8 != 1)
        v9 = 0;
      if (v8 == 2)
        v10 = 4;
      else
        v10 = v9;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __61__PKPaymentPassDetailViewController_presentOrderPhysicalCard__block_invoke_2;
      v11[3] = &unk_1E3E73350;
      v11[4] = v2;
      objc_msgSend(v7, "orderFlowViewControllerForReason:content:completion:", 0, v10, v11);
    }

  }
}

void __61__PKPaymentPassDetailViewController_presentOrderPhysicalCard__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  PKNavigationController *v8;
  _QWORD aBlock[5];

  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKPaymentPassDetailViewController_presentOrderPhysicalCard__block_invoke_3;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v7 = _Block_copy(aBlock);
  if (v5)
  {
    v8 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
    -[PKNavigationController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, v7);

    goto LABEL_6;
  }
  if (v6)
  {
    v8 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __61__PKPaymentPassDetailViewController_presentOrderPhysicalCard__block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1649) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "reloadSection:", 21);
}

- (void)presentReplacePhysicalCard
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__PKPaymentPassDetailViewController_presentReplacePhysicalCard__block_invoke;
  v3[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __63__PKPaymentPassDetailViewController_presentReplacePhysicalCard__block_invoke(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  _BYTE *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && !WeakRetained[1651])
  {
    objc_msgSend(WeakRetained, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "indexOfSectionIdentifier:", CFSTR("AccountServicePhysicalCard"));
    v7 = objc_msgSend(v4, "_rowIndexForAccountServicePhysicalCardRow:", 3);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0x7FFFFFFFFFFFFFFFLL, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scrollToRowAtIndexPath:atScrollPosition:animated:", v8, 1, 1);

    }
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4[1651] = 1;
      objc_msgSend(v4, "reloadSection:", 21);
      v9 = (void *)*((_QWORD *)v4 + 203);
      v10 = *((_QWORD *)v4 + 268);
      v11 = 3;
      if (v10 != 1)
        v11 = 0;
      if (v10 == 2)
        v12 = 4;
      else
        v12 = v11;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1624), "primaryPhysicalCard");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __63__PKPaymentPassDetailViewController_presentReplacePhysicalCard__block_invoke_2;
      v14[3] = &unk_1E3E798F0;
      objc_copyWeak(&v15, v2);
      objc_msgSend(v9, "replaceFlowViewControllerForReason:content:currentPhysicalCard:completion:", 1, v12, v13, v14);

      objc_destroyWeak(&v15);
    }

  }
}

void __63__PKPaymentPassDetailViewController_presentReplacePhysicalCard__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  PKNavigationController *v10;
  _QWORD aBlock[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PKPaymentPassDetailViewController_presentReplacePhysicalCard__block_invoke_3;
    aBlock[3] = &unk_1E3E612E8;
    aBlock[4] = WeakRetained;
    v9 = _Block_copy(aBlock);
    if (v5)
    {
      v10 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
      -[PKNavigationController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);
    }
    else
    {
      if (!v6)
      {
LABEL_7:

        goto LABEL_8;
      }
      v10 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    }
    objc_msgSend(v8, "presentViewController:animated:completion:", v10, 1, v9);

    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __63__PKPaymentPassDetailViewController_presentReplacePhysicalCard__block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1651) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "reloadSection:", 21);
}

- (void)presentActivatePhysicalCard
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PKPaymentPassDetailViewController_presentActivatePhysicalCard__block_invoke;
  v3[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __64__PKPaymentPassDetailViewController_presentActivatePhysicalCard__block_invoke(uint64_t a1)
{
  PKPhysicalCardManualActivationViewController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PKPhysicalCardManualActivationViewController *v8;
  PKNavigationController *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [PKPhysicalCardManualActivationViewController alloc];
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 2216);
    v6 = *(_QWORD *)(v4 + 1064);
    objc_msgSend(*(id *)(v4 + 1624), "unactivatedPhysicalCard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKPhysicalCardManualActivationViewController initWithAccountService:account:accountUser:paymentPass:physicalCard:activationCode:](v2, "initWithAccountService:account:accountUser:paymentPass:physicalCard:activationCode:", v3, v5, 0, v6, v7, 0);

    v9 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

- (void)presentTrackPhysicalCard
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__PKPaymentPassDetailViewController_presentTrackPhysicalCard__block_invoke;
  v3[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __61__PKPaymentPassDetailViewController_presentTrackPhysicalCard__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1624), "unactivatedPhysicalCard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shipmentTrackingURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      || (objc_msgSend(v3, "latestShippingActivity"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "shipmentTrackingURL"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v4))
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "openURL:configuration:completionHandler:", v4, 0, 0);

    }
    WeakRetained = v7;
  }

}

- (void)showStatementDetailsWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke;
  v6[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 2176);
    objc_msgSend(*(id *)(v3 + 2216), "accountIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke_2;
    v8[3] = &unk_1E3E79918;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v10 = v7;
    v11 = WeakRetained;
    objc_msgSend(v4, "creditStatementsForAccountIdentifier:completion:", v5, v8);

  }
}

void __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD block[4];
  __int128 v9;
  uint64_t *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__64;
    v18 = __Block_byref_object_dispose__64;
    v7 = MEMORY[0x1E0C809B0];
    v19 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke_3;
    v11[3] = &unk_1E3E6CD18;
    v12 = *(id *)(a1 + 32);
    v13 = &v14;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
    if (v15[5])
    {
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke_4;
      block[3] = &unk_1E3E6A300;
      v9 = *(_OWORD *)(a1 + 40);
      v10 = &v14;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }

    _Block_object_dispose(&v14, 8);
  }

}

void __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  if (v5 == v6)
  {

  }
  else
  {
    v7 = v6;
    if (!v5 || !v6)
    {

      goto LABEL_9;
    }
    v8 = objc_msgSend(v5, "isEqualToString:", v6);

    if (!v8)
      goto LABEL_10;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = v11;
  v5 = *(id *)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v10;
LABEL_9:

LABEL_10:
}

void __72__PKPaymentPassDetailViewController_showStatementDetailsWithIdentifier___block_invoke_4(uint64_t a1)
{
  PKCreditBalanceDetailsViewController *v2;
  _QWORD *v3;
  void *v4;
  PKCreditBalanceDetailsViewController *v5;

  v2 = [PKCreditBalanceDetailsViewController alloc];
  v3 = *(_QWORD **)(a1 + 32);
  v5 = -[PKCreditBalanceDetailsViewController initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:](v2, "initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:", 1, v3[275], v3[282], v3[273], v3[277], v3[264], v3[281], 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 0);

  -[PKCreditBalanceDetailsViewController showStatement:style:](v5, "showStatement:style:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 1);
}

- (void)presentBillPayment
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PKPaymentPassDetailViewController_presentBillPayment__block_invoke;
  v3[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __55__PKPaymentPassDetailViewController_presentBillPayment__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "didSelectMakePayment");
    WeakRetained = v3;
  }

}

- (void)presentInstallmentPlansForFeature:(unint64_t)a3
{
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__PKPaymentPassDetailViewController_presentInstallmentPlansForFeature___block_invoke;
  v4[3] = &unk_1E3E61B68;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __71__PKPaymentPassDetailViewController_presentInstallmentPlansForFeature___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  PKInstallmentPlansViewController *v13;
  PKInstallmentPlansViewController *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id *v20;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[277];
    if (v4)
    {
      v20 = v3;
      objc_msgSend(v4, "creditDetails");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "installmentPlans");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7 == 1)
      {
        objc_msgSend(v20[277], "creditDetails");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "installmentPlans");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
LABEL_8:

          v3 = v20;
          goto LABEL_9;
        }
        v12 = *(void **)(a1 + 32);
        objc_msgSend(v11, "identifier");
        v13 = (PKInstallmentPlansViewController *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "presentInstallmentPlanWithIdentifier:", v13);
      }
      else
      {
        v11 = objc_alloc_init(MEMORY[0x1E0D67100]);
        v14 = [PKInstallmentPlansViewController alloc];
        v15 = v20[277];
        v16 = v20[264];
        v17 = v20[281];
        objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PKInstallmentPlansViewController initWithAccount:accountUserCollection:physicalCards:accountService:transactionSourceCollection:familyCollection:dataProvider:](v14, "initWithAccount:accountUserCollection:physicalCards:accountService:transactionSourceCollection:familyCollection:dataProvider:", v15, v16, v17, v18, v20[275], v20[282], v11);

        objc_msgSend(v20, "navigationController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "pushViewController:animated:", v13, 1);

      }
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)presentInstallmentPlanWithIdentifier:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __74__PKPaymentPassDetailViewController_presentInstallmentPlanWithIdentifier___block_invoke;
    v5[3] = &unk_1E3E61B68;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    -[PKPaymentPassDetailViewController executeAfterContentIsLoaded:](self, "executeAfterContentIsLoaded:", v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __74__PKPaymentPassDetailViewController_presentInstallmentPlanWithIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKTransactionHistoryViewController *v8;
  void *v9;
  id *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[277];
    if (v4)
    {
      v10 = v3;
      objc_msgSend(v4, "creditDetails");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v10;
      if (v5)
      {
        objc_msgSend(v10[277], "creditDetails");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "installmentPlanWithIdentifier:", *(_QWORD *)(a1 + 32));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v8 = -[PKTransactionHistoryViewController initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:]([PKTransactionHistoryViewController alloc], "initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:", v7, v10[275], v10[282], v10[277], v10[264], v10[281]);
          objc_msgSend(v10, "navigationController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "pushViewController:animated:", v8, 1);

        }
        v3 = v10;
      }
    }
  }

}

- (void)_showSpinner:(BOOL)a3 inCell:(id)a4 detailText:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[PKPaymentPassDetailViewController _showSpinner:inCell:overrideTextColor:](self, "_showSpinner:inCell:overrideTextColor:", v6, v9, 0);
  objc_msgSend(v9, "detailTextLabel");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setText:", v8);
}

- (void)_showSpinner:(BOOL)a3 inCell:(id)a4 overrideTextColor:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  UIColor *primaryTextColor;
  UIColor *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIColor *v15;

  v6 = a3;
  v15 = (UIColor *)a5;
  v8 = a4;
  objc_msgSend(v8, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  primaryTextColor = v15;
  if (v15 || (primaryTextColor = self->_primaryTextColor) != 0)
  {
    v11 = primaryTextColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if (v6)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v13, "startAnimating");
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v9, "setTextColor:", v12);
  objc_msgSend(v8, "setAccessoryView:", v13);

}

- (void)_didSelectFixPeerPaymentAtIndexPath:(id)a3
{
  void *v4;
  PKPeerPaymentAccountResolutionController *v5;
  int64_t detailViewStyle;
  uint64_t v7;
  uint64_t v8;
  PKPeerPaymentAccountResolutionController *v9;
  PKPeerPaymentAccountResolutionController *peerPaymentAccountResolutionControllerForAccountService;
  uint64_t v11;
  void *v12;
  unint64_t cashbackResolution;
  id v15;
  void *v16;
  void *v17;
  id v18;

  -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_peerPaymentAccountResolutionControllerForAccountService)
  {
    v5 = [PKPeerPaymentAccountResolutionController alloc];
    detailViewStyle = self->_detailViewStyle;
    v7 = 3;
    if (detailViewStyle != 1)
      v7 = 0;
    if (detailViewStyle == 2)
      v8 = 4;
    else
      v8 = v7;
    v9 = -[PKPeerPaymentAccountResolutionController initWithAccount:webService:context:delegate:passLibraryDataProvider:](v5, "initWithAccount:webService:context:delegate:passLibraryDataProvider:", v18, self->_peerPaymentWebService, v8, self, self->_passLibraryDataProvider);
    peerPaymentAccountResolutionControllerForAccountService = self->_peerPaymentAccountResolutionControllerForAccountService;
    self->_peerPaymentAccountResolutionControllerForAccountService = v9;

  }
  v11 = objc_msgSend(v18, "pendingPaymentCount");
  PKSharedCacheGetStringForKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    cashbackResolution = self->_cashbackResolution;
    if (cashbackResolution != 1 || v11 != 1)
      goto LABEL_18;
    if (!objc_msgSend(v12, "length"))
    {
      cashbackResolution = self->_cashbackResolution;
LABEL_18:
      -[PKPeerPaymentAccountResolutionController presentFlowForAccountResolution:configuration:completion:](self->_peerPaymentAccountResolutionControllerForAccountService, "presentFlowForAccountResolution:configuration:completion:", cashbackResolution, 0, 0);
      goto LABEL_19;
    }
    v15 = objc_alloc_init(MEMORY[0x1E0D673D8]);
    objc_msgSend(v15, "setRegistrationFlowState:", 2);
    objc_msgSend(v15, "setSenderAddress:", v12);
    -[PKPeerPaymentAccountResolutionController presentFlowForAccountResolution:configuration:completion:](self->_peerPaymentAccountResolutionControllerForAccountService, "presentFlowForAccountResolution:configuration:completion:", 1, v15, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=PASSBOOK"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "openSensitiveURL:withOptions:", v16, 0);

  }
LABEL_19:

}

- (void)_didSelectRedeemAtIndexPath:(id)a3
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  PKAccountService *accountService;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;

  v4 = a3;
  if (!self->_redeemingRewards)
  {
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountSummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      self->_redeemingRewards = 1;
      -[PKPaymentPassDetailViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v4;
      objc_msgSend(v7, "cellForRowAtIndexPath:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "textLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "text");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "detailTextLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "detailTextLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v13, "startAnimating");
      v44 = v13;
      objc_msgSend(v8, "setAccessoryView:", v13);
      objc_msgSend(v8, "textLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v15);

      objc_msgSend(v8, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v17);

      v45 = v8;
      objc_msgSend(v8, "detailTextLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setText:", 0);

      -[PKAccountUserCollection currentAccountUser](self->_accountUserCollection, "currentAccountUser");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (!v19)
        goto LABEL_5;
      objc_msgSend(v19, "altDSID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accountUserActivityForAccountUserAltDSID:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "rewardsBalance");
      v23 = objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
LABEL_5:
        objc_msgSend(v6, "rewardsBalance");
        v23 = objc_claimAutoreleasedReturnValue();
      }
      v38 = (void *)v23;
      v24 = objc_alloc_init(MEMORY[0x1E0D66828]);
      objc_msgSend(v24, "setActionType:", 0);
      objc_msgSend(v24, "setAmount:", v23);
      objc_msgSend(v5, "currencyCode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setCurrencyCode:", v25);

      objc_msgSend(v24, "setRedemptionType:", 2);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setIdentifier:", v27);

      accountService = self->_accountService;
      -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountUserCollection currentAccountUser](self->_accountUserCollection, "currentAccountUser");
      v37 = v20;
      v29 = v6;
      v30 = v5;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "altDSID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __65__PKPaymentPassDetailViewController__didSelectRedeemAtIndexPath___block_invoke;
      v47[3] = &unk_1E3E79940;
      v47[4] = self;
      v48 = v43;
      v49 = v41;
      v50 = v42;
      v51 = v39;
      v40 = v39;
      v33 = v42;
      v34 = v41;
      v35 = v43;
      -[PKAccountService performAccountAction:withAccountIdentifier:accountUserAltDSID:completion:](accountService, "performAccountAction:withAccountIdentifier:accountUserAltDSID:completion:", v24, v28, v32, v47);

      v5 = v30;
      v6 = v29;

      v4 = v46;
    }

  }
}

void __65__PKPaymentPassDetailViewController__didSelectRedeemAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKPaymentPassDetailViewController__didSelectRedeemAtIndexPath___block_invoke_2;
  block[3] = &unk_1E3E72198;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__PKPaymentPassDetailViewController__didSelectRedeemAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1722) = 0;
  v2 = *(void **)(a1 + 40);
  if (v2 && !*(_QWORD *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 2216), v2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1664) = 0;
    objc_msgSend(*(id *)(a1 + 32), "reloadPassDetailSections:", &unk_1E3FAEA28);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1872), "updateWithAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2216));
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "objectAtIndex:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1520), "selectedSegmentIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

    if (!v4)
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "indexOfSectionIdentifier:", CFSTR("AccountServiceRewardsDetails"));
      v6 = objc_msgSend(*(id *)(a1 + 32), "_accountServiceRewardsRowForRowIndex:", 1);
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v6, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "setAccessoryView:", 0);
        objc_msgSend(v9, "textLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setText:", *(_QWORD *)(a1 + 56));

        objc_msgSend(v9, "detailTextLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setText:", *(_QWORD *)(a1 + 64));

        objc_msgSend(v9, "textLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTextColor:", *(_QWORD *)(a1 + 72));

        objc_msgSend(v9, "detailTextLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTextColor:", *(_QWORD *)(a1 + 80));

      }
    }
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v14, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2216), "feature"), 0, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v15 = PKAlertForDisplayableErrorWithHandlers(v16, 0, 0, 0);
      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v15, 1, 0);

    }
  }
}

- (BOOL)_shouldShowNetworkBenefitsCell
{
  BOOL v3;
  void *v4;

  if (!self->_account
    || -[PKPaymentPassDetailViewController _shouldShowProductBenefitsCell](self, "_shouldShowProductBenefitsCell"))
  {
    return 0;
  }
  -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6AE00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") != 0;

  return v3;
}

- (void)_didSelectNetworkBenefitsCell
{
  void *v3;
  void *v4;
  id v5;

  -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6AE00]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openURL:configuration:completionHandler:", v3, 0, 0);

  }
  -[PKPaymentPassDetailViewController _reportPassDetailsAnalyticsForTappedRowTag:additionalAnalytics:](self, "_reportPassDetailsAnalyticsForTappedRowTag:additionalAnalytics:", *MEMORY[0x1E0D697B8], 0);

}

- (BOOL)_shouldShowProductBenefitsCell
{
  void *v2;
  BOOL v3;

  if (!self->_account)
    return 0;
  -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6AE18]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)_didSelectProductBenefitsCell
{
  void *v3;
  void *v4;
  id v5;

  -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6AE18]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openURL:configuration:completionHandler:", v3, 0, 0);

  }
  -[PKPaymentPassDetailViewController _reportPassDetailsAnalyticsForTappedRowTag:additionalAnalytics:](self, "_reportPassDetailsAnalyticsForTappedRowTag:additionalAnalytics:", *MEMORY[0x1E0D697E0], 0);

}

- (void)_didSelectCreditDetailsCell:(id)a3
{
  void *v4;
  PKCreditBalanceDetailsViewController *v5;

  if (!-[PKPaymentPassDetailViewController _accountServiceCreditDetailsRowForRowIndex:](self, "_accountServiceCreditDetailsRowForRowIndex:", objc_msgSend(a3, "row")))
  {
    if (-[PKPaymentPassDetailViewController isTotalBalanceCellSelectable](self, "isTotalBalanceCellSelectable"))
    {
      v5 = -[PKCreditBalanceDetailsViewController initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:]([PKCreditBalanceDetailsViewController alloc], "initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:", 1, self->_transactionSourceCollection, self->_familyCollection, self->_webService, self->_account, self->_accountUserCollection, self->_physicalCards, 0, 0);
      -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pushViewController:animated:", v5, 1);

    }
  }
}

- (BOOL)isTotalBalanceCellSelectable
{
  return self->_detailViewStyle != 2;
}

- (void)_showPeerPaymentActionViewControllerForAction:(unint64_t)a3
{
  _BOOL4 v5;
  id v6;
  int64_t detailViewStyle;
  uint64_t v8;
  uint64_t v9;
  PKPeerPaymentActionViewController *v10;
  PKPeerPaymentActionViewController *peerPaymentActionViewController;
  PKPeerPaymentActionViewController *v12;
  PKNavigationController *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v15 = 0;
  v16 = 0;
  v5 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:account:unableReason:displayableError:](PKPeerPaymentActionController, "canPerformPeerPaymentAction:account:unableReason:displayableError:", a3, self->_peerPaymentAccount, &v16, &v15);
  v6 = v15;
  if (v5)
  {
    detailViewStyle = self->_detailViewStyle;
    v8 = 3;
    if (detailViewStyle != 1)
      v8 = 0;
    if (detailViewStyle == 2)
      v9 = 4;
    else
      v9 = v8;
    +[PKPeerPaymentActionViewController peerPaymentActionViewControllerForAction:paymentPass:webService:passLibraryDataProvider:context:](PKPeerPaymentActionViewController, "peerPaymentActionViewControllerForAction:paymentPass:webService:passLibraryDataProvider:context:", a3, self->_pass, self->_peerPaymentWebService, self->_passLibraryDataProvider, v9);
    v10 = (PKPeerPaymentActionViewController *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionViewController setDelegate:](v10, "setDelegate:", self);
    peerPaymentActionViewController = self->_peerPaymentActionViewController;
    self->_peerPaymentActionViewController = v10;
    v12 = v10;

    v13 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v12);
    -[PKNavigationController setSupportedInterfaceOrientations:](v13, "setSupportedInterfaceOrientations:", 2);
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      -[PKNavigationController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 2);
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__PKPaymentPassDetailViewController__showPeerPaymentActionViewControllerForAction___block_invoke;
    v14[3] = &unk_1E3E612E8;
    v14[4] = self;
    +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:](PKPeerPaymentActionController, "alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:", v16, v6, v14);
    v13 = (PKNavigationController *)objc_claimAutoreleasedReturnValue();
  }
  -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

}

uint64_t __83__PKPaymentPassDetailViewController__showPeerPaymentActionViewControllerForAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openPaymentSetupWithNetworkWhitelist:paymentSetupMode:", 0, 0);
}

- (void)peerPaymentActionViewControllerDidCancel:(id)a3
{
  void *v4;
  void *v5;
  PKPeerPaymentActionViewController *peerPaymentActionViewController;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v7, "presentingViewController");
  else
    -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  peerPaymentActionViewController = self->_peerPaymentActionViewController;
  self->_peerPaymentActionViewController = 0;

}

- (void)peerPaymentActionViewControllerDidPerformAction:(id)a3
{
  void *v4;
  void *v5;
  PKPeerPaymentActionViewController *peerPaymentActionViewController;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v7, "presentingViewController");
  else
    -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  peerPaymentActionViewController = self->_peerPaymentActionViewController;
  self->_peerPaymentActionViewController = 0;

}

- (void)_updatePeerPaymentAccount
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKPaymentPassDetailViewController__updatePeerPaymentAccount__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __62__PKPaymentPassDetailViewController__updatePeerPaymentAccount__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id obj;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2192), "targetDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(obj, "associatedPassUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1560), obj);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1704), "setAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1560));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1512), "setPeerPaymentAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1560));
    objc_msgSend(*(id *)(a1 + 32), "_updateHeaderActionView");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1592), "setAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1560));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1712) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1704), "currentPeerPaymentAccountResolution");
    objc_msgSend(*(id *)(a1 + 32), "_updateCashbackPeerPaymentResolutionSection");
    objc_msgSend(*(id *)(a1 + 32), "_updatePeerPaymentFamilyMemberRows");
    objc_msgSend(*(id *)(a1 + 32), "_reloadView");
  }

}

- (void)_updatePeerPaymentFamilyMemberRows
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_sortedFamilyMemberRowModels;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "familyMember", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "altDSID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPeerPaymentAccount peerPaymentAccountWithAltDSID:](self->_peerPaymentAccount, "peerPaymentAccountWithAltDSID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAccount:", v11);

        -[PKPeerPaymentAccount accountInvitationWithAltDSID:](self->_peerPaymentAccount, "accountInvitationWithAltDSID:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setInvitation:", v12);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)_updatePeerPaymentPreferences
{
  PKPeerPaymentWebService *peerPaymentWebService;
  void *v4;
  char v5;
  void *v6;
  PKPeerPaymentPreferences *v7;
  PKPeerPaymentPreferences *peerPaymentPreferences;
  PKPeerPaymentWebService *v9;
  _QWORD v10[5];

  peerPaymentWebService = self->_peerPaymentWebService;
  if (peerPaymentWebService)
  {
    -[PKPeerPaymentWebService targetDevice](peerPaymentWebService, "targetDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferences");
      v7 = (PKPeerPaymentPreferences *)objc_claimAutoreleasedReturnValue();
      peerPaymentPreferences = self->_peerPaymentPreferences;
      self->_peerPaymentPreferences = v7;

      -[PKPaymentPassDetailViewController _updatePeerPaymentPreferencesSectionVisibilityAndReloadIfNecessary](self, "_updatePeerPaymentPreferencesSectionVisibilityAndReloadIfNecessary");
    }
    else
    {
      self->_loadingPeerPaymentPreferences = 1;
      -[PKSpinnerHeaderView setShowSpinner:](self->_peerPaymentPreferencesHeaderView, "setShowSpinner:", 1);
      v9 = self->_peerPaymentWebService;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __66__PKPaymentPassDetailViewController__updatePeerPaymentPreferences__block_invoke;
      v10[3] = &unk_1E3E79968;
      v10[4] = self;
      -[PKPeerPaymentWebService peerPaymentPreferencesWithCompletion:](v9, "peerPaymentPreferencesWithCompletion:", v10);
    }
  }
}

void __66__PKPaymentPassDetailViewController__updatePeerPaymentPreferences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "peerPaymentPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching peer payment preferences: %@", buf, 0xCu);
    }

    v6 = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PKPaymentPassDetailViewController__updatePeerPaymentPreferences__block_invoke_982;
  v9[3] = &unk_1E3E61388;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __66__PKPaymentPassDetailViewController__updatePeerPaymentPreferences__block_invoke_982(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1576) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1584), "setShowSpinner:", 0);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1568), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updatePeerPaymentPreferencesSectionVisibilityAndReloadIfNecessary");
}

- (void)_updateAmpEligibility
{
  uint64_t v3;
  void *v4;
  void *v5;
  PKPaymentPass *pass;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD aBlock[4];
  id v13;
  id location;

  if (-[PKPaymentPassDetailViewController _accountInGoodStateForAMPEligbilityCheck](self, "_accountInGoodStateForAMPEligbilityCheck"))
  {
    if (!self->_loadingAMPEligibility)
    {
      self->_isAmpEligible = 0;
      self->_loadingAMPEligibility = 1;
      -[PKPaymentPassDetailViewController reloadSection:](self, "reloadSection:", 19);
      objc_initWeak(&location, self);
      v3 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke;
      aBlock[3] = &unk_1E3E65F18;
      objc_copyWeak(&v13, &location);
      v4 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x1E0D66800], "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "registerObserver:", self);
      pass = self->_pass;
      v10[0] = v3;
      v10[1] = 3221225472;
      v10[2] = __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke_3;
      v10[3] = &unk_1E3E79990;
      v11 = v4;
      v8[0] = v3;
      v8[1] = 3221225472;
      v8[2] = __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke_984;
      v8[3] = &unk_1E3E653D8;
      v7 = v11;
      v9 = v7;
      objc_msgSend(v5, "enrollmentStatusForPaymentPass:completion:progress:", pass, v10, v8);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  _QWORD v5[5];
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke_2;
    v5[3] = &unk_1E3E64C10;
    v5[4] = WeakRetained;
    v6 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }

}

uint64_t __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ampEligbilityUpdated:", *(unsigned __int8 *)(a1 + 40));
}

void __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134349314;
    v8 = a2;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "enrollmentStatusForPaymentPass completion status: %{public}lu error: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 1, v5);
}

void __58__PKPaymentPassDetailViewController__updateAmpEligibility__block_invoke_984(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "enrollmentStatusForPaymentPass progress success: %@ error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ampEnrollmentManager:(id)a3 didEnrollPaymentPass:(id)a4 success:(BOOL)a5
{
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  PKPaymentPassDetailViewController *v11;
  BOOL v12;

  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentPassDetailViewController_ampEnrollmentManager_didEnrollPaymentPass_success___block_invoke;
  block[3] = &unk_1E3E64908;
  v10 = v7;
  v11 = self;
  v12 = a5;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __87__PKPaymentPassDetailViewController_ampEnrollmentManager_didEnrollPaymentPass_success___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 48))
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "ampEnrollmentManager didEnrollPaymentPass: success: %@", (uint8_t *)&v8, 0xCu);
    }

    v7 = *(void **)(a1 + 40);
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v7, "_ampEligbilityUpdated:", 0);
    else
      objc_msgSend(v7, "_updateAmpEligibility");
  }
}

- (void)_ampEligbilityUpdated:(BOOL)a3
{
  self->_loadingAMPEligibility = 0;
  self->_isAmpEligible = a3;
  -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 0);
}

- (void)_handlePeerPaymentPreferencestDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKPaymentPassDetailViewController__handlePeerPaymentPreferencestDidChangeNotification___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __89__PKPaymentPassDetailViewController__handlePeerPaymentPreferencestDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePeerPaymentPreferences");
}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)_handleAccountServiceAccountDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKPaymentPassDetailViewController__handleAccountServiceAccountDidChangeNotification___block_invoke;
  aBlock[3] = &unk_1E3E61D40;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_pass, "associatedAccountServiceAccountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountWithIdentifier:completion:", v5, v4);

  }
}

void __87__PKPaymentPassDetailViewController__handleAccountServiceAccountDidChangeNotification___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __87__PKPaymentPassDetailViewController__handleAccountServiceAccountDidChangeNotification___block_invoke_2;
  v6[3] = &unk_1E3E61388;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __87__PKPaymentPassDetailViewController__handleAccountServiceAccountDidChangeNotification___block_invoke_2(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(result + 32);
  if (v1)
  {
    v2 = result;
    objc_storeStrong((id *)(*(_QWORD *)(result + 40) + 2216), v1);
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 1936), "setFeatureIdentifier:", objc_msgSend(*(id *)(v2 + 32), "feature"));
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 1624), "updateWithAccount:", *(_QWORD *)(v2 + 32));
    objc_msgSend(*(id *)(v2 + 40), "_updateBalanceIfNecessary");
    objc_msgSend(*(id *)(v2 + 40), "fetchFinancingPlansIfNecessary");
    return objc_msgSend(*(id *)(v2 + 40), "_reloadView");
  }
  return result;
}

- (void)merchantTokensViewController:(id)a3 didDeleteMerchantToken:(id)a4
{
  PKRetrieveMerchantTokensResponse *merchantTokensResponse;
  id v6;
  void *v7;
  int v8;
  PKRetrieveMerchantTokensResponse *v9;

  merchantTokensResponse = self->_merchantTokensResponse;
  v6 = a4;
  -[PKRetrieveMerchantTokensResponse merchantTokens](merchantTokensResponse, "merchantTokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    v9 = self->_merchantTokensResponse;
    self->_merchantTokensResponse = 0;

    -[PKPaymentPassDetailViewController _reloadMerchantTokenRows](self, "_reloadMerchantTokenRows");
    -[PKPaymentPassDetailViewController _fetchMerchantTokens](self, "_fetchMerchantTokens");
  }
}

- (void)merchantTokenDetailViewController:(id)a3 didDeleteMerchantToken:(id)a4
{
  PKRetrieveMerchantTokensResponse *merchantTokensResponse;
  id v6;
  void *v7;
  int v8;
  PKRetrieveMerchantTokensResponse *v9;

  merchantTokensResponse = self->_merchantTokensResponse;
  v6 = a4;
  -[PKRetrieveMerchantTokensResponse merchantTokens](merchantTokensResponse, "merchantTokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    v9 = self->_merchantTokensResponse;
    self->_merchantTokensResponse = 0;

    -[PKPaymentPassDetailViewController _reloadMerchantTokenRows](self, "_reloadMerchantTokenRows");
    -[PKPaymentPassDetailViewController _fetchMerchantTokens](self, "_fetchMerchantTokens");
  }
}

- (void)_startPendingTransactionTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *transactionTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[PKPaymentPassDetailViewController _cancelPendingTransactionTimer](self, "_cancelPendingTransactionTimer");
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  transactionTimer = self->_transactionTimer;
  self->_transactionTimer = v3;

  v5 = self->_transactionTimer;
  v6 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  objc_initWeak(&location, self);
  v7 = self->_transactionTimer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PKPaymentPassDetailViewController__startPendingTransactionTimer__block_invoke;
  v8[3] = &unk_1E3E61310;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_transactionTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __66__PKPaymentPassDetailViewController__startPendingTransactionTimer__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_reloadTransactionSectionsAnimated:forceReload:", 1, 0);
    v2 = (void *)v3[131];
    v3[131] = 0;

    WeakRetained = v3;
  }

}

- (void)_cancelPendingTransactionTimer
{
  NSObject *transactionTimer;
  OS_dispatch_source *v4;

  transactionTimer = self->_transactionTimer;
  if (transactionTimer)
  {
    dispatch_source_cancel(transactionTimer);
    v4 = self->_transactionTimer;
    self->_transactionTimer = 0;

  }
}

- (void)_updateHeaderActionView
{
  if (self->_hasTabBar)
    -[PKPaymentPassDetailViewController _updateTabBar](self, "_updateTabBar");
}

- (void)_updateTabBar
{
  id v3;
  id v4;
  id v5;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  objc_msgSend(v4, "addObject:", &unk_1E3FADD50);
  if (-[PKPaymentPassDetailViewController _shouldShowTransactions](self, "_shouldShowTransactions"))
    objc_msgSend(v4, "addObject:", &unk_1E3FADD68);
  if (objc_msgSend(v4, "count"))
  {
    v3 = v4;
  }
  else
  {

    v3 = 0;
  }
  v5 = v3;
  if ((PKEqualObjects() & 1) == 0)
    -[PKPaymentPassDetailViewController _updateTabBarWithSegments:](self, "_updateTabBarWithSegments:", v5);

}

- (void)_updateSectionControllersWithSelectedSectionSegment
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  UISegmentedControl *tabBar;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_sectionControllers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          tabBar = self->_tabBar;
          v10 = v8;
          objc_msgSend(v10, "setCurrentSegment:", -[UISegmentedControl selectedSegmentIndex](tabBar, "selectedSegmentIndex", (_QWORD)v11));

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_updateTabBarWithSegments:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  UISegmentedControl *tabBar;
  NSArray **p_tabBarSegments;
  NSArray *tabBarSegments;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  void *v16;
  UISegmentedControl *v17;
  UISegmentedControl *v18;
  UISegmentedControl *v20;
  UISegmentedControl *v21;
  id v22;

  v22 = a3;
  v5 = objc_msgSend(v22, "count");
  tabBar = self->_tabBar;
  if (tabBar)
  {
    v4 = -[UISegmentedControl selectedSegmentIndex](tabBar, "selectedSegmentIndex");
    p_tabBarSegments = &self->_tabBarSegments;
    tabBarSegments = self->_tabBarSegments;
    v9 = -1;
    if (tabBarSegments && (v4 & 0x8000000000000000) == 0)
    {
      -[NSArray objectAtIndexedSubscript:](tabBarSegments, "objectAtIndexedSubscript:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v22, "indexOfObject:", v10);

      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        v9 = -1;
      else
        v9 = v11;
    }
  }
  else
  {
    p_tabBarSegments = &self->_tabBarSegments;
    v9 = -1;
  }
  if (v5)
    v12 = v9 <= -1;
  else
    v12 = 0;
  if (v12)
    v13 = 0;
  else
    v13 = v9;
  v14 = objc_msgSend(v22, "copy", v4);
  v15 = *p_tabBarSegments;
  *p_tabBarSegments = (NSArray *)v14;

  -[PKPaymentPassDetailViewController viewIfLoaded](self, "viewIfLoaded");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = self->_tabBar;
    if (v17)
    {
      -[UISegmentedControl removeTarget:action:forControlEvents:](v17, "removeTarget:action:forControlEvents:", self, sel__tabBarSegmentChanged_, 4096);
      -[UISegmentedControl removeFromSuperview](self->_tabBar, "removeFromSuperview");
      v18 = self->_tabBar;
      self->_tabBar = 0;

    }
    if (self->_hasTabBar && v5 >= 2)
    {
      -[PKPaymentPassDetailViewController _createTabBarWithSelectedIndex:](self, "_createTabBarWithSelectedIndex:", v13);
      v20 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
      v21 = self->_tabBar;
      self->_tabBar = v20;

      -[UITableViewHeaderFooterView addSubview:](self->_headerView, "addSubview:", self->_tabBar);
    }
    if (v9 < 0)
      -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 0);
    if (-[PKPaymentPassDetailViewController _updateHeaderHeightDeterminingLayout:](self, "_updateHeaderHeightDeterminingLayout:", 0))
    {
      objc_msgSend(v16, "setNeedsLayout");
    }
  }

}

- (BOOL)_updateHeaderHeightDeterminingLayout:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSUInteger v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double headerHeight;
  UISegmentedControl *tabBar;
  double v19;
  double tabBarHeight;
  BOOL v21;
  double v23;
  BOOL v24;

  -[PKPaymentPassDetailViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "separatorInset");
  v6 = fmax(v5, 10.0);
  v7 = *MEMORY[0x1E0DC49E8];
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  objc_msgSend(v4, "bounds");
  v10 = v9 - v6 - v6;
  v11 = -[NSArray count](self->_tabBarSegments, "count");
  v12 = -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  v13 = 80.0;
  if (!v12)
    v13 = 61.0;
  -[PKPassHeaderView sizeThatFits:](self->_passHeaderView, "sizeThatFits:", v10, v13);
  v15 = 0.0;
  if (v14 >= 0.0)
    v16 = v14;
  else
    v16 = 0.0;
  headerHeight = self->_headerHeight;
  self->_headerHeight = v16;
  tabBar = self->_tabBar;
  if (tabBar)
  {
    if (v11 >= 2)
    {
      -[UISegmentedControl frame](tabBar, "frame");
      v15 = v19 + 30.0;
    }
    if (headerHeight != v16)
    {
      self->_tabBarHeight = v15;
LABEL_14:
      v21 = 1;
      goto LABEL_15;
    }
    tabBarHeight = self->_tabBarHeight;
    self->_tabBarHeight = v15;
    if (tabBarHeight != v15)
      goto LABEL_14;
  }
  else
  {
    if (headerHeight != v16)
    {
      self->_tabBarHeight = 0.0;
      goto LABEL_14;
    }
    v23 = self->_tabBarHeight;
    self->_tabBarHeight = 0.0;
    if (v23 != 0.0)
      goto LABEL_14;
  }
  v24 = self->_headerContentInset.left != v6;
  if (self->_headerContentInset.top != v7)
    v24 = 1;
  if (self->_headerContentInset.right != v6)
    v24 = 1;
  v21 = self->_headerContentInset.bottom != v8 || v24;
LABEL_15:
  self->_headerContentInset.top = v7;
  self->_headerContentInset.left = v6;
  self->_headerContentInset.bottom = v8;
  self->_headerContentInset.right = v6;

  return v21;
}

- (double)_offscreenHeaderHeight
{
  return self->_headerHeight + self->_tabBarHeight;
}

- (id)_createTabBarWithSelectedIndex:(int64_t)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_tabBarSegments, "count"))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_tabBarSegments, "count"));
  else
    v4 = 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_tabBarSegments;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "unsignedIntegerValue");
        if (!v10)
        {
          v11 = CFSTR("PASS_DETAILS_INFO");
LABEL_15:
          PKLocalizedString(&v11->isa);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        if (v10 == 1)
        {
          if (-[PKPaymentPass isIdentityPass](self->_pass, "isIdentityPass"))
            v11 = CFSTR("PASS_DETAILS_ACTIVITY");
          else
            v11 = CFSTR("PASS_DETAILS_TRANSACTIONS");
          goto LABEL_15;
        }
        v12 = 0;
LABEL_17:
        if (v12)
          v13 = v12;
        else
          v13 = &stru_1E3E7D690;
        objc_msgSend(v4, "addObject:", v13);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", v4);
  objc_msgSend(v14, "setSelectedSegmentIndex:", a3);
  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel__tabBarSegmentChanged_, 4096);
  objc_msgSend(v14, "sizeToFit");
  if (self->_linkTextColor)
    objc_msgSend(v14, "setTintColor:");

  return v14;
}

- (BOOL)_shouldShowTransactions
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  v3 = -[PKPaymentDataProvider supportsTransactionsForPass:](self->_paymentServiceDataProvider, "supportsTransactionsForPass:", self->_pass);
  if (v3)
  {
    -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4
      && (-[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "state"),
          v5,
          v6 != 7))
    {
      if (!self->_account
        || (v3 = +[PKCreditAccountController shouldDisplayTransactionsForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayTransactionsForTransactionSourceCollection:withAccount:", self->_transactionSourceCollection)) != 0)
      {
        if (!-[PKPaymentPass isTransitPass](self->_pass, "isTransitPass")
          || (-[PKPaymentPass supportsFPANNotifications](self->_pass, "supportsFPANNotifications") & 1) != 0
          || (-[PKPaymentPass supportsDPANNotifications](self->_pass, "supportsDPANNotifications") & 1) != 0)
        {
          LOBYTE(v3) = 1;
        }
        else
        {
          -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "generatesLocalTransactions");

          LOBYTE(v3) = v8;
        }
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)_showsTransactionHistorySwitch
{
  int v3;

  if ((-[PKPaymentPass supportsFPANNotifications](self->_pass, "supportsFPANNotifications") & 1) != 0
    || (v3 = -[PKPaymentPass supportsDPANNotifications](self->_pass, "supportsDPANNotifications")) != 0)
  {
    if (self->_peerPaymentAccount || self->_account)
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[PKPaymentPassDetailViewController _isBankConnectLinked](self, "_isBankConnectLinked");
  }
  return v3;
}

- (void)_updatePeerPaymentPreferencesSectionVisibilityAndReloadIfNecessary
{
  -[PKPaymentPassDetailViewController reloadSection:](self, "reloadSection:", 26);
}

- (BOOL)_shouldShowTransferCell
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PKPaymentPass *pass;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_detailViewStyle != 2
    || (PKIsAltAccountPairedOrPairing() & 1) != 0
    || self->_detailViewStyle != 2
    || -[PKPaymentPass activationState](self->_pass, "activationState"))
  {
    LOBYTE(v3) = 0;
    return v3;
  }
  v3 = -[PKPaymentPass requiresTransferSerialNumberBasedProvisioning](self->_pass, "requiresTransferSerialNumberBasedProvisioning");
  if (!v3)
    return v3;
  if (-[PKPaymentPass isStoredValuePass](self->_pass, "isStoredValuePass"))
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PKPaymentPass requiresFelicaSecureElement](self->_pass, "requiresFelicaSecureElement"))
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v5, "felicaSecureElementIsAvailable") & 1) == 0)
        goto LABEL_30;
    }
    else if ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v5, "secureElementIsAvailable"))
    {
      goto LABEL_30;
    }
    objc_msgSend(v5, "secureElementIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    pass = self->_pass;
    if (v7 == 2)
    {
      if (-[PKPaymentPass isSuicaPass](pass, "isSuicaPass"))
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        -[PKPaymentPass paymentApplications](self->_pass, "paymentApplications", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          while (2)
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "supportedTransitNetworkIdentifiers");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "containsObject:", CFSTR("transit.felica.suica"));

              if (!v15)
              {
                v16 = 0;
                goto LABEL_34;
              }
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            if (v11)
              continue;
            break;
          }
        }
        v16 = 1;
LABEL_34:

        goto LABEL_31;
      }
    }
    else
    {
      if (!-[PKPaymentPass isOctopusPass](pass, "isOctopusPass"))
      {
        v16 = 1;
        goto LABEL_31;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v16 = objc_msgSend(v5, "supportsExpressForAutomaticSelectionTechnologyType:", 6);
LABEL_31:

        LOBYTE(v3) = v16 != 0;
        return v3;
      }
    }
LABEL_30:
    v16 = 0;
    goto LABEL_31;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)_shouldShowDeleteCell
{
  return self->_peerPaymentAccount == 0;
}

- (BOOL)_canDoManualIdentityVerification
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[PKPeerPaymentAccount state](self->_peerPaymentAccount, "state");
  v4 = -[PKPeerPaymentAccount stage](self->_peerPaymentAccount, "stage");
  return v3 == 1 && v4 == 2;
}

- (BOOL)_shouldShowAccountActions
{
  return self->_peerPaymentAccountResolution - 1 < 3;
}

- (unint64_t)_numberOfPeerPaymentMoneyActionsEnabled
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  char v6;
  _BOOL4 v7;

  v3 = 0;
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = -[PKPaymentPassDetailViewController _peerPaymentMoneyActionEnabled:](self, "_peerPaymentMoneyActionEnabled:", v3);
    v5 = 0;
    v4 += v7;
    v3 = 1;
  }
  while ((v6 & 1) != 0);
  return v4;
}

- (BOOL)_peerPaymentMoneyActionEnabled:(unint64_t)a3
{
  PKPeerPaymentAccount *v3;
  void *v4;
  char v5;
  PKPeerPaymentAccount *peerPaymentAccount;
  BOOL v7;

  if (a3 == 1)
  {
    peerPaymentAccount = self->_peerPaymentAccount;
    -[PKFamilyMemberCollection currentUser](self->_familyCollection, "currentUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKPeerPaymentAccount isEligibleToWithdrawForUser:](peerPaymentAccount, "isEligibleToWithdrawForUser:", v4);
  }
  else
  {
    if (a3)
      return 0;
    v3 = self->_peerPaymentAccount;
    -[PKFamilyMemberCollection currentUser](self->_familyCollection, "currentUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKPeerPaymentAccount isEligibleToAddMoneyForUser:](v3, "isEligibleToAddMoneyForUser:", v4);
  }
  v7 = v5;

  return v7;
}

- (unint64_t)_peerPaymentMoneyActionForRowIndex:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  char v7;
  char v8;

  v5 = 0;
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = v7;
    if (-[PKPaymentPassDetailViewController _peerPaymentMoneyActionEnabled:](self, "_peerPaymentMoneyActionEnabled:", v5))
    {
      if (v6 == a3)
        return v5;
      ++v6;
    }
    v7 = 0;
    v5 = 1;
  }
  while ((v8 & 1) != 0);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_rowIndexForPeerPaymentActionRow:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  char v7;
  char v8;

  v5 = 0;
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = v7;
    if (-[PKPaymentPassDetailViewController _peerPaymentMoneyActionEnabled:](self, "_peerPaymentMoneyActionEnabled:", v5))
    {
      if (v5 == a3)
        return v6;
      ++v6;
    }
    v7 = 0;
    v5 = 1;
  }
  while ((v8 & 1) != 0);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_shouldShowActionWidgets
{
  void *v4;
  void *v5;
  char v6;

  if (self->_detailViewStyle == 2)
    return 0;
  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _widgetCellForTableView:](self, "_widgetCellForTableView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasEnabledWidgets");

  return v6;
}

- (BOOL)_shouldShowServicingSection
{
  BOOL v2;
  void *v3;

  if (self->_detailViewStyle == 2)
    return 0;
  -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_pass, "associatedAccountServiceAccountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "length") != 0;

  return v2;
}

- (BOOL)_shouldShowCardNumbersSection
{
  BOOL v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  char v8;

  v3 = +[PKCreditAccountController shouldShowCardNumbersWithAccount:andPass:](PKCreditAccountController, "shouldShowCardNumbersWithAccount:andPass:", self->_account, self->_pass);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKVirtualCardEnabledWithWebService() && -[PKPaymentPass cardType](self->_pass, "cardType") == 1)
  {
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      LOBYTE(v6) = 0;
    else
      v6 = -[PKPaymentPass isEMoneyPass](self->_pass, "isEMoneyPass") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  if (-[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature") == 4)
    LOBYTE(v7) = 0;
  else
    v7 = -[PKPaymentPass isAppleBalancePass](self->_pass, "isAppleBalancePass") ^ 1;
  v8 = v3 | v6;
  if (self->_detailViewStyle == 2)
    v8 = 0;
  return v8 & v7;
}

- (BOOL)_accountInGoodStateForAMPEligbilityCheck
{
  PKAccount *account;

  account = self->_account;
  if (account)
    LOBYTE(account) = -[PKAccount state](account, "state") == 1
                   && -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature") != 3
                   && -[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature") != 4;
  return (char)account;
}

- (BOOL)_shouldShowAutomaticPresentation
{
  void *v3;
  int v4;
  int v5;
  char v6;

  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsAutomaticPassPresentation");

  if (v4)
  {
    if ((-[PKPaymentPass availableForAutomaticPresentationUsingBeaconContext](self->_pass, "availableForAutomaticPresentationUsingBeaconContext") & 1) != 0)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = -[PKPaymentPass availableForAutomaticPresentationUsingInAppOrWebContext](self->_pass, "availableForAutomaticPresentationUsingInAppOrWebContext");
      v6 = v5;
      if (self->_detailViewStyle != 2)
      {
        LOBYTE(v5) = 1;
        if ((v6 & 1) == 0)
        {
          v5 = PKValueAddedServicesEnabled();
          if (v5)
            LOBYTE(v5) = -[PKPaymentPass availableForAutomaticPresentationUsingVASContext](self->_pass, "availableForAutomaticPresentationUsingVASContext");
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)_shouldShowBillingAddressCell
{
  if ((-[PKPaymentPass supportsBarcodePayment](self->_pass, "supportsBarcodePayment") & 1) != 0)
    return 0;
  if (-[PKAccount feature](self->_account, "feature") == 2
    && (-[PKAccount isClosedAndChargedOff](self->_account, "isClosedAndChargedOff") & 1) != 0)
  {
    return 1;
  }
  return -[PKPaymentDataProvider supportsInAppPaymentsForPass:](self->_paymentServiceDataProvider, "supportsInAppPaymentsForPass:", self->_pass);
}

- (BOOL)_shouldShowTermsCell
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "termsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = 1;
  }
  else
  {
    -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6AE20]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "length") != 0;

  }
  return v5;
}

- (BOOL)_shouldShowPrivacyPolicyCell
{
  void *v2;
  BOOL v3;

  -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6AE10]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)_shouldShowContactCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADD8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADF0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass businessChatIdentifier](self->_pass, "businessChatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "length") || objc_msgSend(v4, "length") || objc_msgSend(v5, "length"))
    && (-[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature") == 4 || self->_detailViewStyle == 2))
  {
    v7 = 1;
  }
  else if (objc_msgSend(v6, "length"))
  {
    v7 = self->_detailViewStyle == 2;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldShowAccessPersonInformation
{
  _BOOL4 isAppleAccess;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v9;

  if (!-[PKPaymentPass isAccessPass](self->_pass, "isAccessPass"))
    return 0;
  isAppleAccess = self->_isAppleAccess;
  if (self->_isAppleAccess)
  {
    -[PKPaymentPass cardHolderPicture](self->_pass, "cardHolderPicture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 1;
LABEL_11:

      return v5;
    }
  }
  -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADB8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "length"))
    {
      -[PKPaymentPass localizedValueForFieldKey:](self->_pass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADC0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "length") != 0;

      if (!isAppleAccess)
        return v5;
      goto LABEL_10;
    }

  }
  v5 = 1;
  if (isAppleAccess)
  {
LABEL_10:
    v4 = 0;
    goto LABEL_11;
  }
  return v5;
}

- (BOOL)_shouldShowServiceMode
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  if ((!PKRunningInRemoteContext() || (unint64_t)(self->_detailViewStyle - 1) <= 1)
    && -[PKPaymentPass isStoredValuePass](self->_pass, "isStoredValuePass"))
  {
    -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "supportsServiceMode"))
    {
      v8 = 0;
LABEL_14:

      return v8;
    }
    -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsTransitHistory");
    if ((v7 & 1) != 0
      || (-[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "appletDataFormat"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          PKEqualObjects()))
    {
      -[PKPaymentPass effectiveContactlessPaymentApplicationState](self->_pass, "effectiveContactlessPaymentApplicationState");
      v8 = PKPaymentApplicationStateIsPersonalized() != 0;
      if ((v7 & 1) != 0)
        goto LABEL_13;
    }
    else
    {
      v8 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  return 0;
}

- (id)_activationFooterView
{
  PKPaymentPassDetailActivationFooterView *activationFooter;
  void *v4;
  void *v5;
  PKPaymentPassDetailActivationFooterView *v6;
  PKPaymentPassDetailActivationFooterView *v7;
  PKPaymentPassDetailActivationFooterView *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  activationFooter = self->_activationFooter;
  if (!activationFooter)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0DC3428];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __58__PKPaymentPassDetailViewController__activationFooterView__block_invoke;
    v13 = &unk_1E3E62BD0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "actionWithHandler:", &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [PKPaymentPassDetailActivationFooterView alloc];
    v7 = -[PKPaymentPassDetailActivationFooterView initWithFrame:activationAction:](v6, "initWithFrame:activationAction:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v10, v11, v12, v13);
    v8 = self->_activationFooter;
    self->_activationFooter = v7;

    -[PKPaymentPassDetailViewController updateActivationFooterViewContents](self, "updateActivationFooterViewContents");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    activationFooter = self->_activationFooter;
  }
  return activationFooter;
}

void __58__PKPaymentPassDetailViewController__activationFooterView__block_invoke(uint64_t a1, void *a2)
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

  objc_msgSend(WeakRetained, "_activationFooterPressed:", v4);
}

- (void)updateActivationFooterViewContents
{
  PKPaymentPassDetailActivationFooterView *activationFooter;
  void *v4;
  PKPaymentPassDetailActivationFooterView *v5;
  id v6;

  activationFooter = self->_activationFooter;
  -[PKPaymentVerificationController verificationBodyString](self->_verificationController, "verificationBodyString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailActivationFooterView setFooterText:](activationFooter, "setFooterText:", v4);

  v5 = self->_activationFooter;
  -[PKPaymentVerificationController alternateMethodButtonTitle](self->_verificationController, "alternateMethodButtonTitle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailActivationFooterView setActivationButtonText:](v5, "setActivationButtonText:", v6);

}

- (BOOL)_transactionDeepLinkingEnabled
{
  char v2;

  if (self->_deepLinkingEnabled)
    v2 = objc_opt_respondsToSelector();
  else
    v2 = 0;
  return v2 & 1;
}

- (id)_availableActions
{
  return (id)-[PKPaymentPass availableActions](self->_pass, "availableActions");
}

- (id)_availableCommutePlanActions
{
  void *v2;
  void *v3;

  -[PKPaymentPass availableActions](self->_pass, "availableActions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_objectsPassingTest:", &__block_literal_global_1008);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __65__PKPaymentPassDetailViewController__availableCommutePlanActions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") != 1;
}

- (BOOL)_hasActionOfType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKPaymentPassDetailViewController _availableActions](self, "_availableActions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "type") == a3)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithWebService:", v8);

  objc_msgSend(v9, "setAllowedPaymentNetworks:", v6);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v9, "setAllowedFeatureIdentifiers:", v10);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__PKPaymentPassDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E3E61A30;
  objc_copyWeak(v14, &location);
  v11 = v9;
  v13 = v11;
  v14[1] = (id)a4;
  objc_msgSend(v11, "preflightWithCompletion:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __92__PKPaymentPassDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11[2];
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PKPaymentPassDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E3E61A08;
  objc_copyWeak(v11, a1 + 5);
  v12 = a2;
  v6 = a1[4];
  v11[1] = a1[6];
  v9 = v6;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v11);
}

void __92__PKPaymentPassDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "_paymentSetupNavigationControllerForProvisioningController:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPaymentSetupMode:", *(_QWORD *)(a1 + 56));
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __92__PKPaymentPassDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v8[3] = &unk_1E3E619E0;
      v9 = v3;
      v10 = v4;
      v5 = v4;
      objc_msgSend(v5, "preflightWithCompletion:", v8);

    }
    else
    {
      v6 = *(void **)(a1 + 40);
      if (v6)
      {
        v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v7;
      objc_msgSend(v3, "_handleProvisioningError:", v7);
    }

  }
}

uint64_t __92__PKPaymentPassDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_didSelectTransactionAtIndexPath:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  PKPaymentDataProvider *paymentServiceDataProvider;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "row");
  if (v4 < -[PKPaymentPassDetailViewController _transactionsCount](self, "_transactionsCount"))
  {
    -[PKPaymentPassDetailViewController _transactionAtIndex:](self, "_transactionAtIndex:", objc_msgSend(v11, "row"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[PKPaymentPassDetailViewController presentTransactionDetailsForTransaction:animated:](self, "presentTransactionDetailsForTransaction:animated:", v5, 1);
LABEL_8:

      goto LABEL_9;
    }
  }
  if (-[PKPaymentPassDetailViewController _transactionDeepLinkingEnabled](self, "_transactionDeepLinkingEnabled"))
  {
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDataProvider transactionsAppLaunchTokenForPassWithUniqueIdentifier:](paymentServiceDataProvider, "transactionsAppLaunchTokenForPassWithUniqueIdentifier:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:pass:appLaunchToken:](PKPaymentNotificationAppURLHelper, "appURLForTransactionNotification:pass:appLaunchToken:", 0, self->_pass, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "openURL:configuration:completionHandler:", v9, 0, 0);

    }
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_didSelectTransactionTransactionsSwitchInTableView:(id)a3 atIndexPath:(id)a4
{
  UITableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UITableViewCell *v10;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v5 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->_allowNotificationCell && self->_notificationAuthorizationStatus == 1)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    v10 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("prefs:root=NOTIFICATIONS_ID&path=%@"), *MEMORY[0x1E0D6B590]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "openSensitiveURL:withOptions:", v8, 0);

    v5 = v10;
  }

}

- (void)_didSelectContactBankSectionAtIndexPath:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  PKPaymentDataProvider *paymentServiceDataProvider;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];

  if (-[PKPaymentPassDetailViewController _shouldShowContactCell](self, "_shouldShowContactCell"))
  {
    if (!a3)
    {
      v5 = -[PKPaymentPassDetailViewController _removeUnsupportedContactIssuerOptions:](self, "_removeUnsupportedContactIssuerOptions:", 15);
      -[PKPaymentPassDetailViewController contactIssuerHelper](self, "contactIssuerHelper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentContactViewController:", v5);

    }
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  if (-[PKPaymentPassDetailViewController _shouldShowServiceMode](self, "_shouldShowServiceMode") && v7 == a3)
  {
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D684F0], 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      paymentServiceDataProvider = self->_paymentServiceDataProvider;
      -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[PKPaymentDataProvider startServiceModeForPassWithUniqueIdentifier:visibleViewController:](paymentServiceDataProvider, "startServiceModeForPassWithUniqueIdentifier:visibleViewController:", v17, self);
LABEL_12:

      return;
    }
    if ((PKRunningInRemoteContext() & 1) != 0)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v17, "setScheme:", CFSTR("shoebox"));
      objc_msgSend(v17, "setHost:", CFSTR("card"));
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("/%@/%@"), v10, *MEMORY[0x1E0D6BC28]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPath:", v11);

      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "openSensitiveURL:withOptions:", v13, 0);

      goto LABEL_12;
    }
    -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController presentingViewController](self, "presentingViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __77__PKPaymentPassDetailViewController__didSelectContactBankSectionAtIndexPath___block_invoke;
      v18[3] = &unk_1E3E612E8;
      v18[4] = self;
      objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v18);
      v16 = (id)objc_msgSend(v14, "popToRootViewControllerAnimated:", 1);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    else
    {
      -[PKPaymentPassDetailViewController postServiceModeNotification](self, "postServiceModeNotification");
      objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, 0);
    }

  }
}

uint64_t __77__PKPaymentPassDetailViewController__didSelectContactBankSectionAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postServiceModeNotification");
}

- (void)postServiceModeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("PKPDVCRequestedServiceMode"), self, 0);

}

- (void)contactSupportSectionControllerDidSelect:(id)a3
{
  unint64_t v4;
  id v5;

  v4 = -[PKPaymentPassDetailViewController _removeUnsupportedContactIssuerOptions:](self, "_removeUnsupportedContactIssuerOptions:", objc_msgSend(a3, "contactOption"));
  -[PKPaymentPassDetailViewController contactIssuerHelper](self, "contactIssuerHelper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentContactViewController:", v4);

}

- (void)contactIssuerHelper:(id)a3 didRequestPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, a5, a6);
}

- (void)contactIssuerHelper:(id)a3 didRequestDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  -[PKPaymentPassDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a4, a5);
}

- (unint64_t)_removeUnsupportedContactIssuerOptions:(unint64_t)a3
{
  _BOOL4 v4;
  uint64_t v5;

  if ((-[PKAccount feature](self->_account, "feature") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v4 = +[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat");
    v5 = 7;
    if (v4)
      v5 = 15;
  }
  else
  {
    v5 = 7;
  }
  return v5 & a3;
}

- (void)_preflightWatchForTransferWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKPaymentWebService *webService;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (v4)
  {
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      webService = self->_webService;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __78__PKPaymentPassDetailViewController__preflightWatchForTransferWithCompletion___block_invoke;
      v9[3] = &unk_1E3E653D8;
      v10 = v4;
      objc_msgSend(v5, "paymentWebService:validateTransferPreconditionsWithCompletion:", webService, v9);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Error: Unable to validate transfer preconditions of target device", v8, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }

  }
}

uint64_t __78__PKPaymentPassDetailViewController__preflightWatchForTransferWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_didSelectTransferCardAtIndexPath:(id)a3
{
  id v4;
  PKTransitPassProperties *transitProperties;
  NSObject *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  PKTransitPassProperties *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id buf[2];

  v4 = a3;
  transitProperties = self->_transitProperties;
  if (transitProperties)
  {
    if (-[PKTransitPassProperties isEnRoute](transitProperties, "isEnRoute"))
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Unable to perform transfer. Pass is in transit.", (uint8_t *)buf, 2u);
      }

      v7 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedPaymentString(CFSTR("CARD_IN_TRANSIT"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("CARD_IN_TRANSIT_MESSAGE_TRANSFER_CARD");
LABEL_11:
      PKLocalizedPaymentString(&v9->isa);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v14 = (void *)v12;
      objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v12, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAction:", v18);

      -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
      goto LABEL_18;
    }
    v10 = self->_transitProperties;
    if (v10 && -[PKTransitPassProperties isBlocked](v10, "isBlocked"))
    {
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Unable to perform transfer. Pass is blocked.", (uint8_t *)buf, 2u);
      }

      v7 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedPaymentString(CFSTR("COULD_NOT_ADD_CARD_TITLE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("COULD_NOT_ADD_CARD_MESSAGE");
      goto LABEL_11;
    }
  }
  if ((objc_msgSend(MEMORY[0x1E0D67798], "isWalletVisible") & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Unable to perform transfer. Wallet app is not installed.", (uint8_t *)buf, 2u);
    }

    v7 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPaymentString(CFSTR("COULD_NOT_ADD_CARD_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedDeletableString(CFSTR("WALLET_UNINSTALLED_ALERT_MESSAGE"));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  self->_performingCardTransfer = 1;
  -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 0);
  objc_initWeak(buf, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke;
  v19[3] = &unk_1E3E625E8;
  objc_copyWeak(&v20, buf);
  v19[4] = self;
  -[PKPaymentPassDetailViewController _preflightWatchForTransferWithCompletion:](self, "_preflightWatchForTransferWithCompletion:", v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(buf);
LABEL_18:

}

void __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  char v12;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_2;
  v8[3] = &unk_1E3E625C0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v12 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v11);
}

void __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_2(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 56) && !*(_QWORD *)(a1 + 32))
    {
      v6 = objc_alloc(MEMORY[0x1E0D67230]);
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithWebService:", v7);

      objc_msgSend(v8, "setPaymentDataProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 2168));
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_3;
      v10[3] = &unk_1E3E63548;
      objc_copyWeak(&v12, v2);
      v10[4] = *(_QWORD *)(a1 + 40);
      v9 = v8;
      v11 = v9;
      objc_msgSend(v9, "validatePreconditionsAndRegister:", v10);

      objc_destroyWeak(&v12);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "description");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Transfer preflight failed for watch with error:%@", buf, 0xCu);

      }
      objc_msgSend(WeakRetained, "_handleProvisioningError:", *(_QWORD *)(a1 + 32));
      WeakRetained[1304] = 0;
      objc_msgSend(WeakRetained, "reloadData:", 0);
    }
  }

}

void __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_3(uint64_t a1, char a2, void *a3)
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
  char v14;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_4;
  block[3] = &unk_1E3E799D8;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  v14 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
}

void __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_4(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 64) && !*(_QWORD *)(a1 + 32))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67168]), "initWithPaymentPass:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1064));
      v7 = *(void **)(a1 + 48);
      v14[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_5;
      v9[3] = &unk_1E3E625E8;
      objc_copyWeak(&v11, v2);
      v10 = *(id *)(a1 + 48);
      objc_msgSend(v7, "associateCredentials:withCompletionHandler:", v8, v9);

      objc_destroyWeak(&v11);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "description");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v5;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Transfer preflight failed for local device with error:%@", buf, 0xCu);

      }
      objc_msgSend(WeakRetained, "_handleProvisioningError:", *(_QWORD *)(a1 + 32));
      WeakRetained[1304] = 0;
      objc_msgSend(WeakRetained, "reloadData:", 0);
    }
  }

}

void __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_6;
  v7[3] = &unk_1E3E625C0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v11 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v10);
}

void __71__PKPaymentPassDetailViewController__didSelectTransferCardAtIndexPath___block_invoke_6(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 56) && !*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "_paymentSetupNavigationControllerForProvisioningController:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowsManualEntry:", 0);
      objc_msgSend(v6, "setPaymentSetupMode:", 1);
      objc_msgSend(v3, "presentViewController:animated:completion:", v6, 1, 0);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "description");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412290;
        v8 = v5;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Transfer associateCredential failed for local device with error:%@", (uint8_t *)&v7, 0xCu);

      }
      objc_msgSend(v3, "_handleProvisioningError:", *(_QWORD *)(a1 + 32));
    }
    v3[1304] = 0;
    objc_msgSend(v3, "reloadData:", 0);
  }

}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  int64_t detailViewStyle;
  uint64_t v5;
  uint64_t v6;
  id v7;
  PKPaymentSetupNavigationController *v8;

  detailViewStyle = self->_detailViewStyle;
  v5 = 3;
  if (detailViewStyle != 1)
    v5 = 0;
  if (detailViewStyle == 2)
    v6 = 4;
  else
    v6 = v5;
  v7 = a3;
  v8 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", v7, v6);

  -[PKPaymentSetupNavigationController setGroupsController:](v8, "setGroupsController:", self->_groupsController);
  -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v8, "setCustomFormSheetPresentationStyleForiPad");
  -[PKPaymentSetupNavigationController setSetupDelegate:](v8, "setSetupDelegate:", self);
  -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v8, "setShowsWelcomeViewController:", 0);
  return v8;
}

- (void)_handleProvisioningError:(id)a3
{
  id v4;

  +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (BOOL)_isJapaneseRegion
{
  void *v2;
  void *v3;
  char v4;

  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("JP"));

  return v4;
}

- (void)_didSelectDeleteCard
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  PKPaymentPass *pass;
  PKAccount *account;
  PKRetrieveMerchantTokensResponse *merchantTokensResponse;
  id WeakRetained;
  PKPassLibraryDataProvider *passLibraryDataProvider;
  void *v15;
  PKPaymentPass *v16;
  PKAccount *v17;
  PKPaymentDataProvider *paymentServiceDataProvider;
  PKTransitBalanceModel *transitBalanceModel;
  PKTransitPassProperties *transitProperties;
  int64_t detailViewStyle;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (-[PKPaymentPass hasMerchantTokens](self->_pass, "hasMerchantTokens"))
  {
    v3 = (void *)MEMORY[0x1E0D66A58];
    v27[0] = *MEMORY[0x1E0D69910];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D68B18];
    v6 = *MEMORY[0x1E0D68858];
    v25[0] = *MEMORY[0x1E0D68AA0];
    v25[1] = v6;
    v7 = *MEMORY[0x1E0D69400];
    v26[0] = v5;
    v26[1] = v7;
    v25[2] = *MEMORY[0x1E0D68F50];
    v26[2] = *MEMORY[0x1E0D68FC0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subjects:sendEvent:", v4, v8);

    v9 = self->_detailViewStyle == 2;
    pass = self->_pass;
    account = self->_account;
    merchantTokensResponse = self->_merchantTokensResponse;
    WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);
    passLibraryDataProvider = self->_passLibraryDataProvider;
    -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = v9;
    +[PKPassDeleteHelper presentMerchantTokenDeletePaymentPassAlertForPass:withAccount:merchantTokensResponse:deleteHander:passLibraryDataProvider:navigationController:presentingViewController:isBridge:](PKPassDeleteHelper, "presentMerchantTokenDeletePaymentPassAlertForPass:withAccount:merchantTokensResponse:deleteHander:passLibraryDataProvider:navigationController:presentingViewController:isBridge:", pass, account, merchantTokensResponse, WeakRetained, passLibraryDataProvider, v15, self, v23);

  }
  else
  {
    v16 = self->_pass;
    v17 = self->_account;
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    transitBalanceModel = self->_transitBalanceModel;
    transitProperties = self->_transitProperties;
    -[PKPassDetailBankConnectSectionController connectedInstitution](self->_bankConnectSectionController, "connectedInstitution");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    detailViewStyle = self->_detailViewStyle;
    v22 = objc_loadWeakRetained((id *)&self->_deleteOverrider);
    +[PKPassDeleteHelper presentDeletePaymentPassAlertForPass:withAccount:paymentServiceDataProvider:transitBalanceModel:transitPassProperties:fkInstitution:detailViewStyle:deleteHander:passLibraryDataProvider:presentingViewController:](PKPassDeleteHelper, "presentDeletePaymentPassAlertForPass:withAccount:paymentServiceDataProvider:transitBalanceModel:transitPassProperties:fkInstitution:detailViewStyle:deleteHander:passLibraryDataProvider:presentingViewController:", v16, v17, paymentServiceDataProvider, transitBalanceModel, transitProperties, v24, detailViewStyle, v22, self->_passLibraryDataProvider, self);

  }
}

- (BOOL)_canSelectBalanceOrCommutePlanCellAtRowIndex:(int64_t)a3
{
  BOOL v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  char v9;
  void *v10;

  if ((-[PKPaymentPass isAutoTopEnabled](self->_pass, "isAutoTopEnabled") & 1) != 0)
    return 0;
  v6 = -[NSArray count](self->_displayableBalanceFields, "count");
  v7 = a3 - v6;
  if (a3 >= v6)
  {
    -[NSArray objectAtIndex:](self->_commutePlans, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController _actionForCommutePlan:](self, "_actionForCommutePlan:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (v7 & 0x8000000000000000) == 0
      && v7 < -[NSArray count](self->_commutePlanFields, "count")
      && -[PKPaymentPassDetailViewController _commutePlanIsSelectable:action:](self, "_commutePlanIsSelectable:action:", v8, v10);

  }
  else
  {
    -[PKPaymentPassDetailViewController _topUpActionForRow:](self, "_topUpActionForRow:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKPaymentPass needsHardcodedReminderOptions](self->_pass, "needsHardcodedReminderOptions");
    if (v8)
      v5 = 1;
    else
      v5 = v9;
  }

  return v5;
}

- (int64_t)_rowIndexForExpressTransitSettingsCell
{
  void *v3;
  int64_t v4;

  if (!-[PKPaymentPassDetailViewController _showExpressDetails](self, "_showExpressDetails")
    || !-[PKDynamicTableViewController hasSectionForSectionIdentifier:](self, "hasSectionForSectionIdentifier:", CFSTR("CardInfo")))
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfRowsInSection:", -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", CFSTR("CardInfo")))- 1;

  return v4;
}

- (PKContactResolver)contactResolver
{
  PKContactResolver *contactResolver;
  id v4;
  id v5;
  void *v6;
  PKContactResolver *v7;
  PKContactResolver *v8;

  contactResolver = self->_contactResolver;
  if (!contactResolver)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v5 = objc_alloc(MEMORY[0x1E0D66C60]);
    -[PKPaymentPassDetailViewController _contactKeysToFetch](self, "_contactKeysToFetch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PKContactResolver *)objc_msgSend(v5, "initWithContactStore:keysToFetch:", v4, v6);
    v8 = self->_contactResolver;
    self->_contactResolver = v7;

    -[PKContactResolver addDelegate:](self->_contactResolver, "addDelegate:", self);
    contactResolver = self->_contactResolver;
  }
  return contactResolver;
}

- (PKContactAvatarManager)contactAvatarManager
{
  PKContactAvatarManager *contactAvatarManager;
  PKContactAvatarManager *v4;
  void *v5;
  PKContactAvatarManager *v6;
  PKContactAvatarManager *v7;

  contactAvatarManager = self->_contactAvatarManager;
  if (!contactAvatarManager)
  {
    v4 = [PKContactAvatarManager alloc];
    -[PKPaymentPassDetailViewController contactResolver](self, "contactResolver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKContactAvatarManager initWithContactResolver:paymentDataProvider:](v4, "initWithContactResolver:paymentDataProvider:", v5, self->_paymentServiceDataProvider);
    v7 = self->_contactAvatarManager;
    self->_contactAvatarManager = v6;

    contactAvatarManager = self->_contactAvatarManager;
  }
  return contactAvatarManager;
}

- (id)_contactInfoAttributedText:(id)a3 phoneNumber:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = (_QWORD *)MEMORY[0x1E0DC1138];
  v10 = (_QWORD *)MEMORY[0x1E0DC1140];
  if (v5)
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC4920], 4096, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *v10);

    if (v6)
      v13 = CFSTR("%@\n");
    else
      v13 = CFSTR("%@");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v14, v8);
    objc_msgSend(v7, "appendAttributedString:", v15);

  }
  if (v6)
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 4096, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, *v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, *v10);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v8);
    objc_msgSend(v7, "appendAttributedString:", v18);

  }
  v19 = (void *)objc_msgSend(v7, "copy");

  return v19;
}

- (unint64_t)_passStateSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v8 = a5;
  if (!-[PKPaymentPassDetailViewController _isShowingLostModeInterface](self, "_isShowingLostModeInterface"))
  {
    if (-[PKPaymentPass activationState](self->_pass, "activationState") != PKPaymentPassActivationStateRequiresActivation)
    {
      v9 = 0;
      goto LABEL_13;
    }
    -[PKPaymentVerificationController continueVerificationButtonTitle](self->_verificationController, "continueVerificationButtonTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    -[PKPaymentVerificationController verificationRecord](self->_verificationController, "verificationRecord");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "channel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "type") == 4)
    {

      if ((v14 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        v9 = 0;
        goto LABEL_7;
      }
    }
    else
    {

    }
    v9 = 1;
    if (!a3 || a4)
      goto LABEL_7;
    if (!v10)
    {
      -[PKPaymentPassDetailViewController _spinnerCellForTableView:](self, "_spinnerCellForTableView:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (-[PKPaymentVerificationController shouldDisabledVerificationButton](self->_verificationController, "shouldDisabledVerificationButton"))
    {
      -[PKPaymentPassDetailViewController _disabledCellWithText:forTableView:](self, "_disabledCellWithText:forTableView:", v10, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_5:
    -[PKPaymentPassDetailViewController _linkCellWithText:forTableView:](self, "_linkCellWithText:forTableView:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v12 = *a3;
    *a3 = v11;

    v9 = 1;
LABEL_7:

    goto LABEL_13;
  }
  v9 = 1;
  if (a3 && !a4)
  {
    PKLocalizedPaymentString(CFSTR("LOSTMODE_ENTER_PASSWORD_BUTTON"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_13:

  return v9;
}

- (id)_headerTitleForPassStateSection
{
  __CFString *v3;
  void *v4;

  if (-[PKPaymentPassDetailViewController _isShowingLostModeInterface](self, "_isShowingLostModeInterface"))
  {
    v3 = CFSTR("LOSTMODE_HEADER");
  }
  else
  {
    if (-[PKPaymentPass activationState](self->_pass, "activationState") != PKPaymentPassActivationStateRequiresActivation)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("ACTIVATION_HEADER");
  }
  PKLocalizedPaymentString(&v3->isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (BOOL)_isShowingLostModeInterface
{
  void *v3;
  char v4;

  -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "state") == 7)
  {
    v4 = 1;
  }
  else if (self->_detailViewStyle == 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = PKNeedsLostModeExitAuth();
  }

  return v4;
}

- (void)_didSelectPassStateSection
{
  NSObject *v3;
  void *v4;
  id v5;
  uint8_t buf[16];

  if (-[PKPaymentPassDetailViewController _isShowingLostModeInterface](self, "_isShowingLostModeInterface"))
  {
    if (self->_detailViewStyle == 2)
    {
      v5 = objc_alloc_init(getNPKCompanionAgentConnectionClass_8());
      objc_msgSend(v5, "initiateLostModeExitAuthWithCompletion:", 0);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Starting FMDFMIP lost mode exit.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "initiateLostModeExitAuthWithCompletion:", &__block_literal_global_1052);

    }
  }
  else if (-[PKPaymentPass activationState](self->_pass, "activationState") == PKPaymentPassActivationStateRequiresActivation)
  {
    -[PKPaymentPassDetailViewController _presentVerificationFlow](self, "_presentVerificationFlow");
  }
}

void __63__PKPaymentPassDetailViewController__didSelectPassStateSection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(v2, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Error exiting lost mode: %@", (uint8_t *)&v6, 0xCu);

    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Completed FMDFMIP lost mode exit.", (uint8_t *)&v6, 2u);
    }

    PKSetNeedsLostModeExitAuth();
  }

}

- (double)_footerViewHeightForPassStateSectionWithTableView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  if (!-[PKPaymentPassDetailViewController _isShowingLostModeInterface](self, "_isShowingLostModeInterface")
    && -[PKPaymentPass activationState](self->_pass, "activationState") == PKPaymentPassActivationStateRequiresActivation
    && (-[PKPaymentVerificationController verificationRecord](self->_verificationController, "verificationRecord"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    objc_msgSend(v4, "bounds");
    v7 = v6;
    -[PKPaymentPassDetailViewController _activationFooterView](self, "_activationFooterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeThatFits:", v7, 1.79769313e308);
    v10 = v9;

  }
  else
  {
    objc_msgSend(v4, "sectionFooterHeight");
    v10 = v11;
  }

  return v10;
}

- (id)_footerViewForPassStateSection
{
  void *v3;
  void *v4;

  if (!-[PKPaymentPassDetailViewController _isShowingLostModeInterface](self, "_isShowingLostModeInterface")
    && -[PKPaymentPass activationState](self->_pass, "activationState") == PKPaymentPassActivationStateRequiresActivation
    && (-[PKPaymentVerificationController verificationRecord](self->_verificationController, "verificationRecord"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[PKPaymentPassDetailViewController _activationFooterView](self, "_activationFooterView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)createFooterHyperlinkViewWithText:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  PKFooterHyperlinkView *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PKFooterHyperlinkView);
  -[PKFooterHyperlinkView setAttributedText:](v8, "setAttributedText:", v7);

  -[PKFooterHyperlinkView setLinkTextColor:](v8, "setLinkTextColor:", self->_linkTextColor);
  -[PKFooterHyperlinkView setAction:](v8, "setAction:", v6);

  return v8;
}

- (id)_footerViewForPendingPeerPaymentAssociatedAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_FAMILY_PENDING_FOOTER_TEXT_LINK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_FAMILY_PENDING_FOOTER_TEXT"), CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/kb/HT211324"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKAttributedStringByAddingLinkToSubstring(v4, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &__block_literal_global_46;
  -[PKPaymentPassDetailViewController createFooterHyperlinkViewWithText:action:](self, "createFooterHyperlinkViewWithText:action:", v6, &__block_literal_global_46);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_footerViewForAccountUsersSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  PKLocalizedMadisonString(CFSTR("ACCOUNT_USERS_SECTION_FOOTER_TEXT_LINK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("ACCOUNT_USERS_SECTION_FOOTER_TEXT"), CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/kb/HT212020"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKAttributedStringByAddingLinkToSubstring(v4, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &__block_literal_global_46;
  -[PKPaymentPassDetailViewController createFooterHyperlinkViewWithText:action:](self, "createFooterHyperlinkViewWithText:action:", v6, &__block_literal_global_46);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)passSupportsDeviceAssessment
{
  return -[PKPaymentPass supportsDeviceAssessmentAccordingToService:](self->_pass, "supportsDeviceAssessmentAccordingToService:", self->_webService);
}

- (id)_footerViewForApplePayProductPrivacySection
{
  PKPeerPaymentAccount *peerPaymentAccount;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  PKPaymentPassDetailViewController *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  peerPaymentAccount = self->_peerPaymentAccount;
  if (peerPaymentAccount)
  {
    if (-[PKPeerPaymentAccount stage](peerPaymentAccount, "stage") == 3)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_ACCOUNT_VERIFIED_FOOTER"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_PRIVACY_FOOTER"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@\n\n%@"), v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_PRIVACY_FOOTER"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = self;
    v11 = v7;
    v12 = 2;
  }
  else
  {
    v8 = -[PKAccount feature](self->_account, "feature");
    v9 = -[PKAccount feature](self->_account, "feature");
    if (v8 == 2)
    {
      PKLocalizedFeatureString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self;
      v11 = v7;
      v12 = 4;
    }
    else
    {
      if (v9 == 3)
      {
        -[PKPaymentPassDetailViewController createPrivacyFooterViewForContext:](self, "createPrivacyFooterViewForContext:", 32);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        return v13;
      }
      if (!-[PKPaymentPassDetailViewController passSupportsDeviceAssessment](self, "passSupportsDeviceAssessment"))
      {
        v13 = 0;
        return v13;
      }
      PKLocalizedPaymentString(CFSTR("DEVICE_ASSESSMENT_SUPPORTED_PASS_DETAILS_PRIVACY_FOOTER"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self;
      v11 = v7;
      v12 = 1;
    }
  }
  -[PKPaymentPassDetailViewController createPrivacyFooterViewWithText:showingPrivacyOnboardingForContext:](v10, "createPrivacyFooterViewWithText:showingPrivacyOnboardingForContext:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)createPrivacyFooterViewForContext:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIColor *linkTextColor;
  UIColor *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0D65188], "pk_privacyFlowForContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "localizedButtonCaption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedButtonTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      PKLocalizedPaymentString(CFSTR("PASS_DETAILS_PRIVACY_FOOTER_FORMAT"), CFSTR("%@%@"), v6, v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v7;
    }
    v11 = v9;
    v12 = (void *)MEMORY[0x1E0C99E98];
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("onboarding:%@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_detailViewStyle == 2)
      linkTextColor = self->_linkTextColor;
    else
      linkTextColor = 0;
    v18 = linkTextColor;
    PKAttributedStringByAddingLinkToSubstring(v11, v8, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKGenericOnboardingPresenter(self, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    PKOpenOnboardingHyperlinkAction(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController createFooterHyperlinkViewWithText:action:](self, "createFooterHyperlinkViewWithText:action:", v19, v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createPrivacyFooterViewWithText:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", v5);

  -[PKPaymentPassDetailViewController createFooterHyperlinkViewWithText:action:](self, "createFooterHyperlinkViewWithText:action:", v6, &__block_literal_global_1084);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createPrivacyFooterViewWithText:(id)a3 showingPrivacyOnboardingForContext:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIColor *linkTextColor;
  UIColor *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D65188], "pk_privacyFlowForContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "localizedButtonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      PKLocalizedPaymentString(CFSTR("PASS_DETAILS_PRIVACY_FOOTER_FORMAT"), CFSTR("%@%@"), v6, v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v9;
    }
    v13 = v11;
    v14 = (void *)MEMORY[0x1E0C99E98];
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("onboarding:%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLWithString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_detailViewStyle == 2)
      linkTextColor = self->_linkTextColor;
    else
      linkTextColor = 0;
    v20 = linkTextColor;
    PKAttributedStringByAddingLinkToSubstring(v13, v10, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKGenericOnboardingPresenter(self, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    PKOpenOnboardingHyperlinkAction(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController createFooterHyperlinkViewWithText:action:](self, "createFooterHyperlinkViewWithText:action:", v21, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKPaymentPassDetailViewController createPrivacyFooterViewWithText:](self, "createPrivacyFooterViewWithText:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_footerTextForPassStateSection
{
  void *v3;
  PKPaymentPass *pass;
  void *v5;
  void *v6;
  void (*v7)(void *, const __CFString *);
  void (*v8)(void);
  const __CFString *v9;
  unint64_t v10;
  PKPaymentPassActivationState v11;
  PKPaymentPassActivationState v12;
  PKPaymentPassActivationState v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void (*v33)(void *, const __CFString *);

  PKPassLocalizedStringForStateWithFormat(CFSTR("PASS_DASHBOARD_TITLE"), &self->_pass->super, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pass = self->_pass;
  -[PKPaymentPass localizedDescription](pass, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKPassLocalizedStringForStateWithFormat(CFSTR("PASS_DASHBOARD_DETAIL"), &pass->super, CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_14;
  if ((-[PKPaymentPass supportsBarcodePayment](self->_pass, "supportsBarcodePayment") & 1) != 0)
  {
    v7 = (void (*)(void *, const __CFString *))MEMORY[0x1E0D6BD90];
    v8 = (void (*)(void))MEMORY[0x1E0D6BD88];
    v9 = CFSTR("_ACCOUNT");
  }
  else if (-[PKPaymentPass cardType](self->_pass, "cardType") == 3
         && (v10 = -[PKPaymentPass accessType](self->_pass, "accessType") - 1, v10 <= 5))
  {
    v9 = off_1E3E79E68[v10];
    v7 = (void (*)(void *, const __CFString *))MEMORY[0x1E0D6BDD8];
    v8 = (void (*)(void))MEMORY[0x1E0D6BDD0];
  }
  else
  {
    v7 = (void (*)(void *, const __CFString *))MEMORY[0x1E0D6BDD8];
    v8 = (void (*)(void))MEMORY[0x1E0D6BDD0];
    v9 = &stru_1E3E7D690;
  }
  if (-[PKPaymentPassDetailViewController _isShowingLostModeInterface](self, "_isShowingLostModeInterface"))
    goto LABEL_9;
  v33 = v7;
  v11 = -[PKPaymentPass activationState](self->_pass, "activationState");
  v12 = -[PKPaymentPass activationState](self->_pass, "activationState");
  v13 = -[PKPaymentPass activationState](self->_pass, "activationState");
  -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "state");

  if (v11 == PKPaymentPassActivationStateActivating)
  {
    PKLocalizedPaymentString(CFSTR("ACTIVATING_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("ACTIVATING_MESSAGE");
LABEL_12:
    -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8();
    v18 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v18;
LABEL_13:

    goto LABEL_14;
  }
  if (v12 == PKPaymentPassActivationStateDeactivated)
  {
    objc_msgSend(CFSTR("PAYMENT_APP_ERROR_TITLE"), "stringByAppendingString:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v8();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == 5)
    {
      v16 = CFSTR("PAYMENT_APP_VERIFICATION_TERMINATED");
      goto LABEL_12;
    }
    -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "state");

    if (v27 == 10)
    {
      v25 = CFSTR("PAYMENT_APP_REMOVED_BY_ISSUER");
      goto LABEL_26;
    }
  }
  else
  {
    if (v13 != PKPaymentPassActivationStateSuspended)
    {
LABEL_9:
      v3 = 0;
      goto LABEL_14;
    }
    objc_msgSend(CFSTR("PAYMENT_APP_ERROR_TITLE"), "stringByAppendingString:", v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v8();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == 6)
    {
      v25 = CFSTR("PAYMENT_APP_SUSPENDED_BY_ISSUER");
LABEL_26:
      -[__CFString stringByAppendingString:](v25, "stringByAppendingString:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPass organizationName](self->_pass, "organizationName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33(v17, CFSTR("%@"));
      v28 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v28;
      goto LABEL_13;
    }
    -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "state");

    if (v30 != 9)
    {
      v16 = CFSTR("PAYMENT_APP_ERROR_BODY");
      goto LABEL_12;
    }
    -[PKPaymentPass localizedSuspendedReason](self->_pass, "localizedSuspendedReason");
    v31 = objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      objc_msgSend(CFSTR("PAYMENT_APP_ERROR_BODY"), "stringByAppendingString:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v8();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v6 = (void *)v31;
  }
LABEL_14:
  objc_msgSend(v3, "pk_uppercaseStringForPreferredLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingString:", v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = v19;
  }

  return v21;
}

- (double)_heightForPassStateSectionWithTableView:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  if (-[PKPaymentPass activationState](self->_pass, "activationState") == PKPaymentPassActivationStateRequiresActivation
    || -[PKPaymentPassDetailViewController _isShowingLostModeInterface](self, "_isShowingLostModeInterface"))
  {
    objc_msgSend(v4, "sectionHeaderHeight");
    v6 = v5;
  }
  else
  {
    v6 = 0.1;
  }

  return v6;
}

- (void)_updateBalanceIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[PKPaymentPassDetailViewController _accountFeature](self, "_accountFeature") == 4)
  {
    if (-[PKAccount state](self->_account, "state") == 1)
    {
      -[PKAccount appleBalanceDetails](self->_account, "appleBalanceDetails");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "accountSummary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentBalance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currencyCode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountMake();
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    -[PKPaymentPassDetailBalanceSectionController setBalance:](self->_balanceSectionController, "setBalance:", v7);

  }
}

- (void)setDeleteOverrider:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);

  if (WeakRetained != v4)
  {
    v6 = objc_loadWeakRetained((id *)&self->_deleteOverrider);
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "setDeletionStatusHandler:forPass:", 0, self->_pass);
    objc_storeWeak((id *)&self->_deleteOverrider, v4);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __56__PKPaymentPassDetailViewController_setDeleteOverrider___block_invoke;
      v7[3] = &unk_1E3E61310;
      objc_copyWeak(&v8, &location);
      objc_msgSend(v4, "setDeletionStatusHandler:forPass:", v7, self->_pass);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }

  }
}

void __56__PKPaymentPassDetailViewController_setDeleteOverrider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "reloadData:", 0);
    WeakRetained = v2;
  }

}

- (BOOL)_isDeletingPass
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOverrider);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "isDeletionInProgressForPass:", self->_pass);
  else
    v4 = 0;

  return v4;
}

- (void)_updateCashbackPeerPaymentResolutionSection
{
  PKAccount *account;
  void *v4;
  void *v5;
  PKAccount *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  account = self->_account;
  if (account)
  {
    if (-[PKAccount feature](account, "feature") == 2)
    {
      -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "account");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v6 = self->_account;
      -[PKAccountUserCollection currentAccountUser](self->_accountUserCollection, "currentAccountUser");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __80__PKPaymentPassDetailViewController__updateCashbackPeerPaymentResolutionSection__block_invoke;
      v8[3] = &unk_1E3E79A68;
      objc_copyWeak(&v9, &location);
      +[PKCreditAccountController resolutionToReceiveCashbackForAccount:accountUser:withPeerPaymentAccount:completion:](PKCreditAccountController, "resolutionToReceiveCashbackForAccount:accountUser:withPeerPaymentAccount:completion:", v6, v7, v5, v8);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);

    }
  }
}

void __80__PKPaymentPassDetailViewController__updateCashbackPeerPaymentResolutionSection__block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4, void *a5)
{
  _QWORD v8[4];
  id v9[3];
  char v10;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PKPaymentPassDetailViewController__updateCashbackPeerPaymentResolutionSection__block_invoke_2;
  v8[3] = &unk_1E3E79A40;
  objc_copyWeak(v9, (id *)(a1 + 32));
  v10 = a3;
  v9[1] = a2;
  v9[2] = a5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);
  objc_destroyWeak(v9);
}

void __80__PKPaymentPassDetailViewController__updateCashbackPeerPaymentResolutionSection__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1664] = *(_BYTE *)(a1 + 56);
    *((_QWORD *)WeakRetained + 209) = *(_QWORD *)(a1 + 40);
    *((_QWORD *)WeakRetained + 210) = *(_QWORD *)(a1 + 48);
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "reloadSection:", 20);
    WeakRetained = v3;
  }

}

- (void)_tabBarSegmentChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  _QWORD v8[6];

  -[NSArray objectAtIndex:](self->_tabBarSegments, "objectAtIndex:", -[UISegmentedControl selectedSegmentIndex](self->_tabBar, "selectedSegmentIndex", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKSegmentToSegmentString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PKSetPassDetailsLastSelectedSegment();
  v6 = objc_msgSend(v4, "unsignedIntegerValue");
  if (self->_peerPaymentAccount)
    v7 = v6 == 1;
  else
    v7 = 0;
  if (v7)
  {
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D685B0], 0);
    goto LABEL_10;
  }
  if (v6 == 1)
  {
LABEL_10:
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__PKPaymentPassDetailViewController__tabBarSegmentChanged___block_invoke;
    v8[3] = &unk_1E3E6F828;
    v8[4] = self;
    v8[5] = 1;
    -[PKPaymentPassDetailViewController _reloadTransactionsWithCompletion:](self, "_reloadTransactionsWithCompletion:", v8);
    goto LABEL_11;
  }
  -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 0);
LABEL_11:

}

uint64_t __59__PKPaymentPassDetailViewController__tabBarSegmentChanged___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 40) == 1)
    return objc_msgSend(*(id *)(result + 32), "reloadData:", 0);
  return result;
}

- (void)_automaticPresentationSwitchChanged:(id)a3
{
  PKPaymentPass *pass;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  pass = self->_pass;
  v5 = a3;
  v6 = -[PKPaymentPass settings](pass, "settings");
  v7 = objc_msgSend(v5, "isOn");

  if (((v7 ^ ((v6 & 0x10) == 0)) & 1) == 0)
  {
    v8 = 16;
    if (!v7)
      v8 = 0;
    -[PKPaymentPass setSettings:](self->_pass, "setSettings:", v6 & 0xFFFFFFFFFFFFFFCFLL | v8 | 0x20);
  }
}

- (void)_expressAccessSwitchChanged:(id)a3
{
  -[PKPaymentPassDetailViewController _expressAccessSwitchChanged:isUWB:](self, "_expressAccessSwitchChanged:isUWB:", a3, 0);
}

- (void)_uwbExpressAccessSwitchChanged:(id)a3
{
  -[PKPaymentPassDetailViewController _expressAccessSwitchChanged:isUWB:](self, "_expressAccessSwitchChanged:isUWB:", a3, 1);
}

- (void)_expressAccessSwitchChanged:(id)a3 isUWB:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  char v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  BOOL v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  char v29;
  id location;
  _QWORD v31[4];
  void (**v32)(_QWORD);
  _QWORD aBlock[5];
  char v34;
  BOOL v35;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  v8 = 106;
  if (v4)
    v8 = 107;
  v9 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR___PKPaymentPassDetailViewController__expressPassesInformationToken[v8]) != 0;
  v10 = objc_msgSend(v6, "isOn");
  if (v9 != v10)
  {
    v11 = v10;
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke;
    aBlock[3] = &unk_1E3E64930;
    aBlock[4] = self;
    v34 = v10;
    v35 = v4;
    v13 = (void (**)(_QWORD))_Block_copy(aBlock);
    if ((v11 & 1) != 0
      || (-[PKPaymentPass isCarKeyPass](self->_pass, "isCarKeyPass") ? (v14 = !v4) : (v14 = 1), v14))
    {
      v13[2](v13);
    }
    else
    {
      if (self->_radioTechnologyType == 2)
      {
        v15 = CFSTR("CAR_KEY_TURN_OFF_UWB_KEY");
      }
      else if (self->_detailViewStyle == 2)
      {
        v15 = CFSTR("CAR_KEY_TURN_OFF_UWB_PORTION_OF_KEY_WATCH");
      }
      else
      {
        v15 = CFSTR("CAR_KEY_TURN_OFF_UWB_PORTION_OF_KEY");
      }
      PKLocalizedCredentialString(&v15->isa);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedCredentialString(CFSTR("CAR_KEY_TURN_OFF_PASSIVE_ENTRY_TITLE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v18, v16, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedCredentialString(CFSTR("CAR_KEY_TURN_OFF_BUTTON"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v12;
      v31[1] = 3221225472;
      v31[2] = __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_3;
      v31[3] = &unk_1E3E61CA8;
      v32 = v13;
      objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAction:", v22);

      objc_initWeak(&location, self);
      v23 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("CANCEL"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v12;
      v27[1] = 3221225472;
      v27[2] = __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_4;
      v27[3] = &unk_1E3E79AB8;
      objc_copyWeak(&v28, &location);
      v29 = v11;
      objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, v27);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAction:", v25);

      -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "presentViewController:animated:completion:", v19, 1, 0);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);

    }
  }

}

void __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26[2];
  char v27;
  id location;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v3 = a1 + 32;
  v2 = *(_QWORD **)(a1 + 32);
  v4 = v2[268];
  v5 = 3;
  if (v4 != 1)
    v5 = 0;
  v6 = v4 == 2;
  if (v4 == 2)
    v7 = 4;
  else
    v7 = v5;
  objc_msgSend(v2, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)v3 + 1176), "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)v3 + 1184), "setUserInteractionEnabled:", 0);
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);
  v10 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
    v11 = v6;
  else
    v11 = 1;
  if ((v11 & 1) != 0)
    goto LABEL_12;
  if (PKIsSimulator())
  {
    v10 = *(unsigned __int8 *)(a1 + 40);
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "_setExpressAccessEnabled:isUWB:paymentSetupContext:authenticationCredential:", v10 != 0, *(unsigned __int8 *)(a1 + 41), v7, 0);
    goto LABEL_13;
  }
  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 1064);
  v13 = v12;
  if (*(_BYTE *)(a1 + 41))
  {
    v14 = objc_msgSend(v12, "isHomeKeyPass");
    objc_msgSend(v13, "localizedDescription");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v14)
      PKLocalizedPaymentString(CFSTR("UNLOCK_ON_APPROACH_AUTHENTICATION_REASON"), CFSTR("%@"), v15);
    else
      PKLocalizedPaymentString(CFSTR("PASSIVE_ENTRY_AUTHENTICATION_REASON"), CFSTR("%@"), v15);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("EXPRESS_ACCESS_AUTHENTICATION_REASON"), CFSTR("%@"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;

  v19 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 1280);
  *(_QWORD *)(v20 + 1280) = v19;

  v29[0] = &unk_1E3FADD80;
  v29[1] = &unk_1E3FADD98;
  v30[0] = v18;
  PKLocalizedString(CFSTR("WALLET"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, *(id *)(a1 + 32));
  v24 = *(void **)(*(_QWORD *)(a1 + 32) + 1280);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_1125;
  v25[3] = &unk_1E3E79A90;
  objc_copyWeak(v26, &location);
  v27 = *(_BYTE *)(a1 + 41);
  v26[1] = (id)v7;
  objc_msgSend(v24, "evaluatePolicy:options:reply:", 2, v23, v25);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

LABEL_13:
}

void __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_1125(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12[2];
  char v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_2;
  block[3] = &unk_1E3E61A08;
  objc_copyWeak(v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v13 = *(_BYTE *)(a1 + 48);
  v12[1] = *(id *)(a1 + 40);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v12);
}

void __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(WeakRetained[160], "externalizedContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = v4;
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(WeakRetained, "_setExpressAccessEnabled:isUWB:paymentSetupContext:authenticationCredential:", 1, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), v3);

}

uint64_t __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__PKPaymentPassDetailViewController__expressAccessSwitchChanged_isUWB___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[148], "setOn:", *(_BYTE *)(a1 + 40) == 0);

}

- (void)_setExpressAccessEnabled:(BOOL)a3 isUWB:(BOOL)a4 paymentSetupContext:(int64_t)a5 authenticationCredential:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void (**v9)(void *, uint64_t, uint64_t);
  PKPaymentPass *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PKExpressPassController *expressPassController;
  id *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  void (**v25)(void *, uint64_t, uint64_t);
  id v26;
  _QWORD v27[6];
  void (**v28)(void *, uint64_t, uint64_t);
  id v29;
  _QWORD aBlock[5];
  id v31;
  id location;
  _QWORD v33[3];

  v6 = a4;
  v7 = a3;
  v33[1] = *MEMORY[0x1E0C80C00];
  v23 = a6;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke;
  aBlock[3] = &unk_1E3E79AE0;
  objc_copyWeak(&v31, &location);
  aBlock[4] = self;
  v9 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  v10 = self->_pass;
  if ((-[PKExpressPassController isExpressModeSupportedForPass:](self->_expressPassController, "isExpressModeSupportedForPass:", v10) & 1) != 0)
  {
    -[PKExpressPassController existingExpressPassConfigurationForPass:](self->_expressPassController, "existingExpressPassConfigurationForPass:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isNFCExpressEnabled");
    v22 = v11;
    v13 = objc_msgSend(v11, "isUWBExpressEnabled");
    v14 = v13;
    if (v7)
    {
      if (!v23 && self->_detailViewStyle != 2)
      {
        v9[2](v9, v12, v13);
LABEL_22:

        goto LABEL_23;
      }
      if (v6)
      {
        if (!self->_nfcExpressModeSupported)
          v12 = self->_radioTechnologyType & 1;
        v14 = 1;
      }
      else
      {
        v12 = 1;
      }
    }
    else if (v6)
    {
      v14 = 0;
      if (self->_nfcExpressModeSupported)
        v12 = v12;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
      if (self->_uwbExpressModeSupported)
        v14 = v13;
      else
        v14 = 0;
    }
    -[PKExpressPassController expressModeSupportedForPass:](self->_expressPassController, "expressModeSupportedForPass:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D48]), "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:", v15, v12, v14);
    expressPassController = self->_expressPassController;
    if (v16)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke_3;
      v27[3] = &unk_1E3E79B08;
      v18 = &v29;
      objc_copyWeak(&v29, &location);
      v27[4] = v16;
      v27[5] = v10;
      v28 = v9;
      -[PKExpressPassController setExpressModeWithPassConfiguration:credential:completion:](expressPassController, "setExpressModeWithPassConfiguration:credential:completion:", v16, v23, v27);
      v19 = (id *)&v28;
    }
    else
    {
      -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke_4;
      v24[3] = &unk_1E3E79B30;
      v18 = &v26;
      objc_copyWeak(&v26, &location);
      v24[4] = v10;
      v25 = v9;
      -[PKExpressPassController disableExpressModeForPassesWithUniqueIdentifiers:withCompletion:](expressPassController, "disableExpressModeForPassesWithUniqueIdentifiers:withCompletion:", v21, v24);

      v19 = (id *)&v25;
    }

    objc_destroyWeak(v18);
    goto LABEL_22;
  }
  v9[2](v9, 0, 0);
LABEL_23:

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

void __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke(uint64_t a1, char a2, char a3)
{
  id WeakRetained;
  void *v7;
  uint64_t v8;
  _QWORD block[6];
  char v10;
  char v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke_2;
    block[3] = &unk_1E3E74900;
    v10 = a3;
    v11 = a2;
    v8 = *(_QWORD *)(a1 + 32);
    block[4] = WeakRetained;
    block[5] = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1290) = *(_BYTE *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setOn:", *(unsigned __int8 *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1288) = *(_BYTE *)(a1 + 49);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setOn:", *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setUserInteractionEnabled:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setUserInteractionEnabled:", 1);
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1280);
  if (v3)
  {
    objc_msgSend(v3, "invalidate");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 1280);
    *(_QWORD *)(v4 + 1280) = 0;

  }
}

void __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  _QWORD *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));
  v6 = WeakRetained[133];
  if (v5)
  {
    objc_msgSend(WeakRetained, "_reportExpressModeEnable:", v6);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "isNFCExpressEnabled"), objc_msgSend(*(id *)(a1 + 32), "isUWBExpressEnabled"));
  }
  else
  {
    v18 = WeakRetained;
    objc_msgSend(WeakRetained, "_reportExpressModeEnableFailed:", v6);
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v3;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "passUniqueIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v7);

          if (v16)
          {
            v17 = v14;

            v11 = v17;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v11, "isNFCExpressEnabled"), objc_msgSend(v11, "isUWBExpressEnabled"));
    WeakRetained = v18;
    v3 = v19;
  }

}

void __113__PKPaymentPassDetailViewController__setExpressAccessEnabled_isUWB_paymentSetupContext_authenticationCredential___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  _QWORD *WeakRetained;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_reportExpressModeDisable:", WeakRetained[133]);
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "passUniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
        {
          v14 = v11;

          v8 = v14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v8, "isNFCExpressEnabled"), objc_msgSend(v8, "isUWBExpressEnabled"));
}

- (void)_messagesSwitchChanged:(id)a3
{
  PKPaymentPass *pass;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  pass = self->_pass;
  v5 = a3;
  v6 = -[PKPaymentPass settings](pass, "settings");
  v7 = objc_msgSend(v5, "isOn");

  if (((v7 ^ ((v6 & 0x40) == 0)) & 1) == 0)
  {
    v8 = 64;
    if (!(_DWORD)v7)
      v8 = 0;
    v9 = v8 | v6 & 0xFFFFFFFFFFFFFFBFLL;
    v10 = *MEMORY[0x1E0D684E0];
    v14 = CFSTR("messages");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE3A74](v10, v12);

    -[PKSettingTableCell settingSwitch](self->_messagesSwitch, "settingSwitch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", 0);

    -[PKPaymentPass setSettings:](self->_pass, "setSettings:", v9);
  }
}

- (void)_transactionsSwitchChanged:(id)a3
{
  PKPaymentPass *pass;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  pass = self->_pass;
  v5 = a3;
  v6 = -[PKPaymentPass settings](pass, "settings");
  v7 = objc_msgSend(v5, "isOn");

  if (((v7 ^ ((v6 & 8) == 0)) & 1) == 0)
  {
    v8 = 8;
    if (!(_DWORD)v7)
      v8 = 0;
    v9 = v8 | v6 & 0xFFFFFFFFFFFFFFF7;
    v10 = *MEMORY[0x1E0D684E0];
    v15 = CFSTR("transactions");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE3A74](v10, v12);

    -[PKPaymentPass transactionServiceURL](self->_pass, "transactionServiceURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[PKSettingTableCell settingSwitch](self->_transactionsSwitch, "settingSwitch");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEnabled:", 0);

    }
    -[PKPaymentPass setSettings:](self->_pass, "setSettings:", v9);
    -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 1);
    -[PKPaymentPassDetailViewController _reportPassDetailsAnalyticsForToggleTag:toggleResult:additionalAnalytics:](self, "_reportPassDetailsAnalyticsForToggleTag:toggleResult:additionalAnalytics:", *MEMORY[0x1E0D69608], v7, 0);
  }
}

- (void)_notificationSwitchChanged:(id)a3
{
  PKPaymentPass *pass;
  id v5;
  unint64_t v6;
  int v7;
  uint64_t v8;

  pass = self->_pass;
  v5 = a3;
  v6 = -[PKPaymentPass settings](pass, "settings");
  v7 = objc_msgSend(v5, "isOn");

  if (v7 == ((v6 >> 7) & 1))
  {
    v8 = 128;
    if (v7)
      v8 = 0;
    -[PKPaymentPass setSettings:](self->_pass, "setSettings:", v8 | v6 & 0xFFFFFFFFFFFFFF7FLL);
  }
}

- (void)_dailyCashSwitchChanged:(id)a3
{
  PKPaymentPass *pass;
  id v5;
  unint64_t v6;
  int v7;
  uint64_t v8;

  pass = self->_pass;
  v5 = a3;
  v6 = -[PKPaymentPass settings](pass, "settings");
  v7 = objc_msgSend(v5, "isOn");

  if (v7 == ((v6 >> 10) & 1))
  {
    v8 = 1024;
    if (v7)
      v8 = 0;
    -[PKPaymentPass setSettings:](self->_pass, "setSettings:", v8 | v6 & 0xFFFFFFFFFFFFFBFFLL);
  }
}

- (void)_activationFooterPressed:(id)a3
{
  -[PKPaymentVerificationController clearSelectedChannel](self->_verificationController, "clearSelectedChannel", a3);
  -[PKPaymentPassDetailViewController _presentVerificationFlow](self, "_presentVerificationFlow");
}

- (void)_presentVerificationFlow
{
  PKPaymentSetupDismissibleNavigationController *v3;
  void *v4;
  id v5;
  int64_t detailViewStyle;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  PKPaymentPass *pass;
  PKPaymentVerificationController *verificationController;
  PKPaymentSetupDismissibleNavigationController *v12;
  _QWORD v13[4];
  PKPaymentSetupDismissibleNavigationController *v14;
  id v15;
  id location;

  v3 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", -[PKPaymentVerificationController context](self->_verificationController, "context"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", self->_webService);
  v5 = objc_alloc(MEMORY[0x1E0D67540]);
  detailViewStyle = self->_detailViewStyle;
  v7 = 3;
  if (detailViewStyle != 1)
    v7 = 0;
  if (detailViewStyle == 2)
    v8 = 4;
  else
    v8 = v7;
  v9 = (void *)objc_msgSend(v5, "initWithEnvironment:provisioningController:groupsController:", v8, v4, self->_groupsController);
  objc_msgSend(v9, "setIsFollowupProvisioning:", 1);
  objc_initWeak(&location, self);
  pass = self->_pass;
  verificationController = self->_verificationController;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__PKPaymentPassDetailViewController__presentVerificationFlow__block_invoke;
  v13[3] = &unk_1E3E61B68;
  objc_copyWeak(&v15, &location);
  v12 = v3;
  v14 = v12;
  +[PKProvisioningFlowBridge startVerificationFlowWithNavController:context:pass:verificationController:presentNavController:](PKProvisioningFlowBridge, "startVerificationFlowWithNavController:context:pass:verificationController:presentNavController:", v12, v9, pass, verificationController, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __61__PKPaymentPassDetailViewController__presentVerificationFlow__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);

    WeakRetained = v4;
  }

}

- (void)_done:(id)a3
{
  -[PKPaymentPassDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_passSettingsChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D6A7F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D6A7E8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_msgSend(v10, "unsignedIntegerValue");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __58__PKPaymentPassDetailViewController__passSettingsChanged___block_invoke;
      v12[3] = &unk_1E3E62010;
      v12[4] = self;
      v12[5] = v11;
      dispatch_async(MEMORY[0x1E0C80D38], v12);
    }

  }
}

void __58__PKPaymentPassDetailViewController__passSettingsChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setSettingsWithoutUpdatingDataAccessor:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1144);
  if (v3)
  {
    v4 = objc_msgSend(v3, "isOn") ^ ((*(_BYTE *)(a1 + 40) & 8) == 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 1;
  }
  objc_msgSend(*(id *)(v2 + 1136), "settingSwitch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOn:", (*(_QWORD *)(a1 + 40) >> 6) & 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "settingSwitch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOn:", (*(_QWORD *)(a1 + 40) >> 3) & 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "settingSwitch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOn:", (*(_QWORD *)(a1 + 40) >> 4) & 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "settingSwitch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOn:", (*(_QWORD *)(a1 + 40) & 0x80) == 0);

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "reloadPassDetailSections:", &unk_1E3FAEA40);
}

- (void)contactsDidChangeForContactResolver:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKPaymentPassDetailViewController_contactsDidChangeForContactResolver___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __73__PKPaymentPassDetailViewController_contactsDidChangeForContactResolver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadTransactionSectionsAnimated:forceReload:", 1, 1);
}

- (void)paymentSetupDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "provisioningController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provisionedPasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureElementPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_detailViewStyle == 2 && v8 != 0)
  {
    -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "popViewControllerAnimated:", 0);

  }
  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)passHeaderViewPassWasDeleted:(id)a3
{
  PKGroup *group;
  void *v5;
  PKPaymentPass *v6;
  PKPaymentPass *pass;
  id v8;

  v8 = a3;
  group = self->_group;
  if (group && -[PKGroup passCount](group, "passCount"))
  {
    -[PKGroup passAtIndex:](self->_group, "passAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paymentPass");
    v6 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue();
    pass = self->_pass;
    self->_pass = v6;

    -[PKPaymentPassDetailViewController _applyStaticPassPropertiesForPass](self, "_applyStaticPassPropertiesForPass");
    objc_msgSend(v8, "setPass:", self->_pass);
    -[PKPaymentPassDetailViewController _updatePassSnapshot](self, "_updatePassSnapshot");
    if (self->_showingTitleIconView)
      -[PKAnimatedNavigationBarTitleView setTitleView:animated:](self->_titleIconView, "setTitleView:animated:", self->_passSnapshotView, 0);
    -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 0);
  }

}

- (void)callIssuer
{
  void *v3;

  -[PKPaymentPassDetailViewController contactIssuerHelper](self, "contactIssuerHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "callIssuer");

  -[PKPaymentPassDetailViewController _reportPassDetailsAnalyticsForTappedButtonTag:additionalAnalytics:](self, "_reportPassDetailsAnalyticsForTappedButtonTag:additionalAnalytics:", *MEMORY[0x1E0D688D0], 0);
}

- (void)openIssuerWebsite
{
  void *v3;

  -[PKPaymentPassDetailViewController contactIssuerHelper](self, "contactIssuerHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openIssuerWebsite");

  -[PKPaymentPassDetailViewController _reportPassDetailsAnalyticsForTappedButtonTag:additionalAnalytics:](self, "_reportPassDetailsAnalyticsForTappedButtonTag:additionalAnalytics:", *MEMORY[0x1E0D69598], 0);
}

- (void)emailIssuer
{
  id v2;

  -[PKPaymentPassDetailViewController contactIssuerHelper](self, "contactIssuerHelper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emailIssuer");

}

- (void)openBusinessChat
{
  void *v3;
  void *v4;
  void *v5;
  PKBusinessChatPassDetailsContext *v6;
  id v7;
  void *v8;
  id v9;

  if (-[PKPaymentPassDetailViewController _isBankConnectLinked](self, "_isBankConnectLinked"))
  {
    -[PKPaymentPassDetailViewController bankConnectAccount](self, "bankConnectAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "digitalServicingURL");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "openURL:withOptions:", v9, 0);

    }
    goto LABEL_6;
  }
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
LABEL_6:

    return;
  }
  if (-[PKAccount feature](self->_account, "feature") == 2)
  {
    v6 = -[PKBusinessChatPassDetailsContext initWithPass:]([PKBusinessChatPassDetailsContext alloc], "initWithPass:", self->_pass);
    v7 = objc_alloc_init(MEMORY[0x1E0D668F0]);
    objc_msgSend(v7, "setBusinessChatContext:", v6);
    -[PKPaymentPassDetailViewController _accountResolutionController](self, "_accountResolutionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentFlowForAccountResolution:configuration:completion:", 3, v7, 0);

  }
  else if (-[PKAccount feature](self->_account, "feature") == 3)
  {
    -[PKPaymentPassDetailViewController handleOpenBusinessChatForPayLater](self, "handleOpenBusinessChatForPayLater");
  }
  -[PKPaymentPassDetailViewController _reportPassDetailsAnalyticsForTappedButtonTag:additionalAnalytics:](self, "_reportPassDetailsAnalyticsForTappedButtonTag:additionalAnalytics:", *MEMORY[0x1E0D68E40], 0);
}

- (void)presentContactIssuerSheet
{
  id v2;

  -[PKPaymentPassDetailViewController contactIssuerHelper](self, "contactIssuerHelper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentContactViewController:", 3);

}

- (void)addMoney
{
  if (-[PKPaymentPass isPeerPaymentPass](self->_pass, "isPeerPaymentPass"))
  {
    -[PKPaymentPassDetailViewController presentTopUp](self, "presentTopUp");
  }
  else if (-[PKPaymentPass isAppleBalancePass](self->_pass, "isAppleBalancePass"))
  {
    -[PKAppleBalanceAddMoneyUIManager presentAddMoneyFromViewController:dtuConfiguration:inStoreToken:](self->_appleBalanceAddMoneyUIManager, "presentAddMoneyFromViewController:dtuConfiguration:inStoreToken:", self, 0, 0);
  }
}

- (void)redeemGiftCard
{
  -[PKAppleBalanceAddMoneyUIManager presentAMSRedeemGiftcardFromViewController:webViewDelegate:](self->_appleBalanceAddMoneyUIManager, "presentAMSRedeemGiftcardFromViewController:webViewDelegate:", self, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKPaymentPassDetailViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PKPaymentPassDetailViewController _updateHeaderHeightDeterminingLayout:](self, "_updateHeaderHeightDeterminingLayout:", 0);
  -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 0);
}

- (void)presentCombinedPassActionViewControllerFromBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PKPaymentPassCombinedActionDataController *v10;
  PKPaymentPassCombinedActionDataController *combinedActionController;
  void *v12;
  _QWORD *v13;
  PKPaymentPassActionDataController *v14;
  PKPaymentPass *pass;
  PKPaymentDataProvider *paymentServiceDataProvider;
  PKPaymentWebService *webService;
  PKTransitBalanceModel *transitBalanceModel;
  void *v19;
  uint64_t v20;
  PKPaymentPassActionDataController *v21;
  PKPaymentPassActionDataController *actionController;
  id v23;
  _QWORD v24[5];
  _QWORD v25[5];

  v4 = a3;
  objc_msgSend(v4, "actionGroups");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionsMatchingTypes:", &unk_1E3FAEA58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionsMatchingTypes:", &unk_1E3FAEA70);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v23, "count");
  v8 = objc_msgSend(v5, "count");
  v9 = objc_msgSend(v6, "count");
  if (!v7)
  {
    if (v8)
    {
      v14 = [PKPaymentPassActionDataController alloc];
      pass = self->_pass;
      paymentServiceDataProvider = self->_paymentServiceDataProvider;
      webService = self->_webService;
      transitBalanceModel = self->_transitBalanceModel;
      v19 = v5;
      v20 = 2;
    }
    else
    {
      if (!v9)
        goto LABEL_8;
      v14 = [PKPaymentPassActionDataController alloc];
      pass = self->_pass;
      paymentServiceDataProvider = self->_paymentServiceDataProvider;
      webService = self->_webService;
      transitBalanceModel = self->_transitBalanceModel;
      v19 = v6;
      v20 = 1;
    }
    v21 = -[PKPaymentPassActionDataController initWithPass:actions:paymentDataProvider:webService:actionType:balanceModel:](v14, "initWithPass:actions:paymentDataProvider:webService:actionType:balanceModel:", pass, v19, paymentServiceDataProvider, webService, v20, transitBalanceModel);
    actionController = self->_actionController;
    self->_actionController = v21;

LABEL_8:
    v12 = self->_actionController;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __87__PKPaymentPassDetailViewController_presentCombinedPassActionViewControllerFromBundle___block_invoke_2;
    v24[3] = &unk_1E3E688A8;
    v24[4] = self;
    v13 = v24;
    goto LABEL_9;
  }
  v10 = -[PKPaymentPassCombinedActionDataController initWithPass:actionGroups:paymentDataProvider:webService:balanceModel:mode:]([PKPaymentPassCombinedActionDataController alloc], "initWithPass:actionGroups:paymentDataProvider:webService:balanceModel:mode:", self->_pass, v23, self->_paymentServiceDataProvider, self->_webService, self->_transitBalanceModel, 0);
  combinedActionController = self->_combinedActionController;
  self->_combinedActionController = v10;

  v12 = self->_combinedActionController;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __87__PKPaymentPassDetailViewController_presentCombinedPassActionViewControllerFromBundle___block_invoke;
  v25[3] = &unk_1E3E688A8;
  v25[4] = self;
  v13 = v25;
LABEL_9:
  objc_msgSend(v12, "fetchViewController:", v13);

}

void __87__PKPaymentPassDetailViewController_presentCombinedPassActionViewControllerFromBundle___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v5, "presentViewController:animated:completion:", a3, 1, 0);
  }
  else
  {
    objc_msgSend(v5, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushViewController:animated:", v7, 1);

  }
}

void __87__PKPaymentPassDetailViewController_presentCombinedPassActionViewControllerFromBundle___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);
  }
  else if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushViewController:animated:", v7, 1);

  }
}

- (void)performPaymentPassActionBundle:(id)a3
{
  id v4;

  objc_msgSend(a3, "actionBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController presentCombinedPassActionViewControllerFromBundle:](self, "presentCombinedPassActionViewControllerFromBundle:", v4);

}

- (void)didChangeVerificationPresentation
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentPassDetailViewController_didChangeVerificationPresentation__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __70__PKPaymentPassDetailViewController_didChangeVerificationPresentation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "updateActivationFooterViewContents");
  objc_msgSend(*(id *)(a1 + 32), "reloadSection:", 29);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1984), "allSectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1992), "allSectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v6, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSections:", v5);

}

- (void)dismissVerificationViewControllerAnimated:(BOOL)a3
{
  -[PKPaymentPassDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3, 0);
}

- (id)presentationContext
{
  void *v2;
  void *v3;

  -[PKPaymentPassDetailViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_presentMerchantDetailsViewWithTransaction:(id)a3 forCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id location;
  _QWORD handler[4];
  NSObject *v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "merchant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mapsMerchant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0CC1808]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setMuids:", v12);

  if (objc_msgSend(v9, "resultProviderIdentifier"))
    objc_msgSend(v10, "_setResultProviderID:", objc_msgSend(v9, "resultProviderIdentifier"));
  v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  v14 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v15 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __88__PKPaymentPassDetailViewController__presentMerchantDetailsViewWithTransaction_forCell___block_invoke;
  handler[3] = &unk_1E3E61388;
  v16 = v13;
  v31 = v16;
  v17 = v7;
  v32 = v17;
  dispatch_source_set_event_handler(v16, handler);
  dispatch_resume(v16);
  objc_msgSend(v17, "setUserInteractionEnabled:", 0);
  objc_initWeak(&location, self);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17F0]), "initWithRequest:", v10);
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __88__PKPaymentPassDetailViewController__presentMerchantDetailsViewWithTransaction_forCell___block_invoke_2;
  v23[3] = &unk_1E3E79B58;
  v19 = v16;
  v24 = v19;
  objc_copyWeak(&v28, &location);
  v20 = v6;
  v25 = v20;
  v21 = v17;
  v26 = v21;
  v22 = v9;
  v27 = v22;
  objc_msgSend(v18, "startWithCompletionHandler:", v23);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

uint64_t __88__PKPaymentPassDetailViewController__presentMerchantDetailsViewWithTransaction_forCell___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_source_cancel(v2);
  return objc_msgSend(*(id *)(a1 + 40), "setShowsActionSpinner:", 1);
}

void __88__PKPaymentPassDetailViewController__presentMerchantDetailsViewWithTransaction_forCell___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD *WeakRetained;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  PKMerchantMapViewController *v19;
  void *v20;
  void *v21;
  PKMerchantMapViewController *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  if (v7)
    dispatch_source_cancel(v7);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (objc_msgSend(WeakRetained, "isViewLoaded"))
  {
    v9 = (void *)WeakRetained[185];
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    v12 = (void *)WeakRetained[185];
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v13);

    objc_msgSend(*(id *)(a1 + 48), "setShowsActionSpinner:", 0);
    objc_msgSend(*(id *)(a1 + 48), "setUserInteractionEnabled:", 1);
    if (v6
      || (objc_msgSend(v5, "mapItems"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "count"),
          v17,
          !v18))
    {
      PKLogFacilityTypeGetObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(*(id *)(a1 + 56), "identifier");
        if (v6)
        {
          objc_msgSend(v6, "localizedDescription");
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = CFSTR("no map items.");
        }
        v24 = 134218242;
        v25 = v15;
        v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "PKPaymentPassDetailViewController: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", (uint8_t *)&v24, 0x16u);
        if (v6)

      }
      if (v11)
        v11[2](v11, 0);
    }
    else
    {
      v19 = [PKMerchantMapViewController alloc];
      objc_msgSend(v5, "mapItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[PKMerchantMapViewController initWithMapItem:configOptions:](v19, "initWithMapItem:configOptions:", v21, 129);

      objc_msgSend(WeakRetained, "navigationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pushViewController:animated:", v22, 1);

      if (v11)
        v11[2](v11, 1);

    }
  }

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
  block[2] = __93__PKPaymentPassDetailViewController_physicalCardActionController_didChangeToState_withError___block_invoke;
  block[3] = &unk_1E3E63480;
  v10 = v7;
  v11 = a4;
  block[4] = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __93__PKPaymentPassDetailViewController_physicalCardActionController_didChangeToState_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    v3 = v2 == 2;
  else
    v3 = 1;
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1651) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1650) = 0;
  }
  else if (v2 == 3)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1651) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1650) = 0;
    +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_accountFeature"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);

  }
  return objc_msgSend(*(id *)(a1 + 32), "reloadSection:", 21);
}

- (id)presentationSceneIdentifierForPhysicalCardActionController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaymentPassDetailViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  -[PKPaymentPassDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, a5);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)refreshControlValueChanged:(id)a3
{
  id v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *refreshTimeout;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  void *v20;
  PKPaymentWebService *webService;
  dispatch_time_t v22;
  NSObject *v23;
  NSObject *v24;
  id obj;
  _QWORD v26[6];
  id v27;
  _QWORD block[4];
  NSObject *v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD handler[5];
  id v38;
  _QWORD v39[3];
  char v40;
  _QWORD v41[3];
  char v42;
  id location;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isRefreshing"))
  {
    objc_initWeak(&location, self);
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v42 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v40 = 1;
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    refreshTimeout = self->_refreshTimeout;
    self->_refreshTimeout = v5;

    v7 = self->_refreshTimeout;
    v8 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v9 = self->_refreshTimeout;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke;
    handler[3] = &unk_1E3E672D0;
    handler[4] = v41;
    objc_copyWeak(&v38, &location);
    dispatch_source_set_event_handler(v9, handler);
    v10 = dispatch_group_create();
    -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appletDataFormat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (!v13)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      -[PKPaymentWebService context](self->_webService, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "TSMPushTopics");
      obj = (id)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            v18 = v4;
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            dispatch_group_enter(v10);
            -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            webService = self->_webService;
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke_2;
            v30[3] = &unk_1E3E79B80;
            v32 = v39;
            v31 = v10;
            objc_msgSend(v20, "paymentWebService:queueConnectionToTrustedServiceManagerForPushTopic:withCompletion:", webService, v19, v30);

            v4 = v18;
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
        }
        while (v15);
      }

    }
    dispatch_group_enter(v10);
    v22 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke_3;
    block[3] = &unk_1E3E612E8;
    v29 = v10;
    v23 = v10;
    v24 = MEMORY[0x1E0C80D38];
    dispatch_after(v22, MEMORY[0x1E0C80D38], block);

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke_4;
    v26[3] = &unk_1E3E79BA8;
    v26[4] = v41;
    objc_copyWeak(&v27, &location);
    v26[5] = v39;
    dispatch_group_notify(v23, v24, v26);

    dispatch_resume((dispatch_object_t)self->_refreshTimeout);
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v38);
    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v41, 8);
    objc_destroyWeak(&location);
  }

}

void __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_refreshFinished:", 1);

  }
}

void __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__PKPaymentPassDetailViewController_refreshControlValueChanged___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_refreshFinished:", *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0);

  }
}

- (void)_refreshFinished:(BOOL)a3
{
  NSObject *refreshTimeout;
  OS_dispatch_source *v5;

  refreshTimeout = self->_refreshTimeout;
  if (refreshTimeout)
  {
    dispatch_source_cancel(refreshTimeout);
    v5 = self->_refreshTimeout;
    self->_refreshTimeout = 0;

  }
  -[UIRefreshControl endRefreshing](self->_refreshControl, "endRefreshing", a3);
}

- (BOOL)shouldAllowRefresh
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PKPaymentPass devicePrimaryPaymentApplication](self->_pass, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appletDataFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKPaymentWebService context](self->_webService, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "TSMPushTopics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)balanceDetailsViewController:(id)a3 didUpdateBalanceReminder:(id)a4 forBalance:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  objc_msgSend(a5, "identifiers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController _handleUpdatedBalanceReminder:forBalanceWithIdentifier:](self, "_handleUpdatedBalanceReminder:forBalanceWithIdentifier:", v7, v8);

}

- (void)_updatePassesInGroupSectionWithUpdatedGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
  -[PKPaymentPassDetailViewController reloadSection:](self, "reloadSection:", 41);
}

- (void)_reportPassDetailsAnalyticsForTappedRowTag:(id)a3 additionalAnalytics:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = *MEMORY[0x1E0D68FB8];
    v9 = *MEMORY[0x1E0D68AA0];
    v15[0] = *MEMORY[0x1E0D68F50];
    v15[1] = v9;
    v10 = *MEMORY[0x1E0D68C08];
    v16[0] = v8;
    v16[1] = v10;
    v15[2] = *MEMORY[0x1E0D69438];
    v16[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if (v7)
      objc_msgSend(v12, "addEntriesFromDictionary:", v7);
    v13 = (void *)MEMORY[0x1E0D66A58];
    v14 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v13, "reportDashboardEventIfNecessary:forPass:", v14, self->_pass);

  }
}

- (void)_reportPassDetailsAnalyticsForTappedButtonTag:(id)a3 additionalAnalytics:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = *MEMORY[0x1E0D68FB8];
    v9 = *MEMORY[0x1E0D68AA0];
    v15[0] = *MEMORY[0x1E0D68F50];
    v15[1] = v9;
    v10 = *MEMORY[0x1E0D68B18];
    v16[0] = v8;
    v16[1] = v10;
    v15[2] = *MEMORY[0x1E0D68858];
    v16[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if (v7)
      objc_msgSend(v12, "addEntriesFromDictionary:", v7);
    v13 = (void *)MEMORY[0x1E0D66A58];
    v14 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v13, "reportDashboardEventIfNecessary:forPass:", v14, self->_pass);

  }
}

- (void)_reportPassDetailsAnalyticsForToggleTag:(id)a3 toggleResult:(BOOL)a4 additionalAnalytics:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v6 = a4;
  v21[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = *MEMORY[0x1E0D68FB8];
    v11 = *MEMORY[0x1E0D68AA0];
    v20[0] = *MEMORY[0x1E0D68F50];
    v20[1] = v11;
    v12 = *MEMORY[0x1E0D68C28];
    v21[0] = v10;
    v21[1] = v12;
    v13 = *MEMORY[0x1E0D695A0];
    v20[2] = *MEMORY[0x1E0D695D8];
    v20[3] = v13;
    v14 = (uint64_t *)MEMORY[0x1E0D695B0];
    if (!v6)
      v14 = (uint64_t *)MEMORY[0x1E0D695A8];
    v15 = *v14;
    v21[2] = v8;
    v21[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    if (v9)
      objc_msgSend(v17, "addEntriesFromDictionary:", v9);
    v18 = (void *)MEMORY[0x1E0D66A58];
    v19 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v18, "reportDashboardEventIfNecessary:forPass:", v19, self->_pass);

  }
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x1E0D69910];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69910]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    self->_didBeginPassManagementSubject = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v3);
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginPassManagementSubject)
  {
    self->_didBeginPassManagementSubject = 0;
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69910]);
  }
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  _BOOL4 v4;
  PKLinkedApplication *v5;
  PKLinkedApplication *v6;

  v6 = (PKLinkedApplication *)a3;
  v4 = -[PKDynamicTableViewController hasSectionForSectionIdentifier:](self, "hasSectionForSectionIdentifier:", CFSTR("PassesInGroup"));
  v5 = v6;
  if (v4 && self->_linkedApplication == v6)
  {
    -[PKPaymentPassDetailViewController reloadSection:](self, "reloadSection:", 41);
    v5 = v6;
  }

}

- (void)presentAuthRequestForPolicy:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  LAContext *v8;
  LAContext **p_authenticationContext;
  LAContext *authenticationContext;
  void *v11;
  void *v12;
  uint64_t v13;
  LAContext *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3)
  {
    v8 = (LAContext *)objc_alloc_init(MEMORY[0x1E0CC12A0]);
    p_authenticationContext = &self->_authenticationContext;
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v8;

    v19[0] = &unk_1E3FADD98;
    PKLocalizedString(CFSTR("WALLET"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = &unk_1E3FADDC8;
    v20[0] = v11;
    v20[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    if (a3 == 1)
      v13 = 2;
    else
      v13 = 1;
    v14 = *p_authenticationContext;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__PKPaymentPassDetailViewController_presentAuthRequestForPolicy_completion___block_invoke;
    v15[3] = &unk_1E3E79BD0;
    objc_copyWeak(&v17, &location);
    v16 = v7;
    -[LAContext evaluatePolicy:options:reply:](v14, "evaluatePolicy:options:reply:", v13, v12, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  else
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

void __76__PKPaymentPassDetailViewController_presentAuthRequestForPolicy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PKPaymentPassDetailViewController_presentAuthRequestForPolicy_completion___block_invoke_2;
  v10[3] = &unk_1E3E670F8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v14);
}

void __76__PKPaymentPassDetailViewController_presentAuthRequestForPolicy_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  _BOOL8 v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[160], "invalidate");
    v3 = v5[160];
    v5[160] = 0;

    if (*(_QWORD *)(a1 + 32))
      v4 = *(_QWORD *)(a1 + 40) == 0;
    else
      v4 = 0;
    (*(void (**)(_QWORD, _BOOL8))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v4);
    WeakRetained = v5;
  }

}

- (void)presentPassDetailDrillInForField:(id)a3
{
  id v4;
  void *v5;
  PKPassDetailSectionDrillInViewController *v6;

  v4 = a3;
  v6 = -[PKPassDetailSectionDrillInViewController initWithPass:field:useBridgeStyle:isShowingSecureInformation:]([PKPassDetailSectionDrillInViewController alloc], "initWithPass:field:useBridgeStyle:isShowingSecureInformation:", self->_pass, v4, self->_detailViewStyle == 2, objc_msgSend(v4, "authRequirement") != 0);

  -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)sharesSectionControllerDidSelectViewEntitlements:(id)a3
{
  void *v4;
  PKPassShareEntitlementSelectionViewController *v5;
  void *v6;
  id v7;

  -[PKPassDetailSharesSectionController sharesController](self->_sharesSectionController, "sharesController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "myEntitlements");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[PKPassShareEntitlementSelectionViewController initWithMyEntitlements:]([PKPassShareEntitlementSelectionViewController alloc], "initWithMyEntitlements:", v7);
  -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

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
  id v7;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", 0);
  objc_msgSend(v4, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
  -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "popToRootViewControllerAnimated:", 1);

}

- (void)presentPassActionViewController:(id)a3
{
  PKNavigationController *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "setDelegate:", self);
      objc_msgSend(v6, "setWebService:", self->_webService);
      v4 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v6);
      -[PKNavigationController setSupportedInterfaceOrientations:](v4, "setSupportedInterfaceOrientations:", 2);
      -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

    }
    else if (v6)
    {
      -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pushViewController:animated:", v6, 1);

    }
  }

}

- (void)autoReloadSetupControllerDidComplete
{
  id v2;
  id v3;

  -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popToRootViewControllerAnimated:", 1);

}

- (void)launchAppURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  _QWORD block[5];

  v4 = a3;
  if (v4
    && (objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isApplicationAvailableToOpenURL:error:", v4, 0),
        v5,
        v6))
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openURL:configuration:completionHandler:", v4, 0, 0);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PKPaymentPassDetailViewController_launchAppURL___block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __50__PKPaymentPassDetailViewController_launchAppURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "openApplication:");
}

- (void)launchURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D107F8]), "initWithURL:", v4);
    objc_msgSend(v5, "setShouldReturnErrorOnUserCancellation:", 1);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__PKPaymentPassDetailViewController_launchURL___block_invoke;
    v7[3] = &unk_1E3E64E38;
    v7[4] = self;
    v8 = v4;
    v6 = v4;
    objc_msgSend(v5, "requestClipWithCompletion:", v7);

  }
  else
  {
    -[PKPaymentPassDetailViewController launchAppURL:](self, "launchAppURL:");
  }
}

void __47__PKPaymentPassDetailViewController_launchURL___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentPassDetailAutoReloadMerchantSectionControllerDelegate launches app clip", v8, 2u);
    }

  }
  else if (objc_msgSend(v5, "code") != 8)
  {
    objc_msgSend(*(id *)(a1 + 32), "launchAppURL:", *(_QWORD *)(a1 + 40));
  }

}

- (void)didSelectInDemoMode
{
  id v3;

  PKUIStoreDemoGatewayViewController();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)didSelectMakePayment
{
  id v2;

  -[PKPaymentPassDetailViewController _accountResolutionController](self, "_accountResolutionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentFlowForAccountResolution:configuration:completion:", 1, 0, 0);

}

- (void)didSelectPayment:(id)a3
{
  id v4;
  void *v5;
  PKCreditAccountPaymentDetailsViewController *v6;

  v4 = a3;
  v6 = -[PKCreditAccountPaymentDetailsViewController initWithAccount:payment:paymentWebService:detailViewStyle:]([PKCreditAccountPaymentDetailsViewController alloc], "initWithAccount:payment:paymentWebService:detailViewStyle:", self->_account, v4, self->_webService, self->_detailViewStyle);

  -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)recomputeMappedSectionsAndReloadSections:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[PKPaymentPassDetailViewController _activeOrderOfSectionIdentifiers](self, "_activeOrderOfSectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPassDetailViewController;
  -[PKDynamicTableViewController recomputeMappedSectionsAndReloadSections:sectionIdentifiers:](&v6, sel_recomputeMappedSectionsAndReloadSections_sectionIdentifiers_, v4, v5);

}

- (id)cellForRow:(unint64_t)a3 inSection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, -[PKDynamicTableViewController indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)didUpdateLatestTransactions:(id)a3 monthlyTransactionGroups:(id)a4 yearlyTransactionGroups:(id)a5
{
  id v7;
  id v8;
  NSArray *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSArray *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSArray *transactions;
  NSArray *v25;
  NSArray *transactionCountAndYear;
  NSArray *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (-[PKPaymentPassDetailViewController _isBankConnectLinked](self, "_isBankConnectLinked"))
  {
    v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    -[PKPassDetailBankConnectSectionController connectedInstitution](self->_bankConnectSectionController, "connectedInstitution");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67370]), "initFromFKTransaction:institution:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v15), v10);
          -[NSArray addObject:](v9, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0D67370], "augmentTransactionsIfNeeded:usingDataProvider:", v9, self->_paymentServiceDataProvider);
    v17 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v30 = v8;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67388]), "initFromFKTransactionGroup:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v22));
          -[NSArray addObject:](v17, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v20);
    }

    transactions = self->_transactions;
    self->_transactions = v9;
    v25 = v9;

    transactionCountAndYear = self->_transactionCountAndYear;
    self->_transactionCountAndYear = v17;
    v27 = v17;

    -[NSArray objectAtIndex:](self->_tabBarSegments, "objectAtIndex:", -[UISegmentedControl selectedSegmentIndex](self->_tabBar, "selectedSegmentIndex"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v28, "unsignedIntegerValue");
    if (v29 == 1)
      -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 0);

    v8 = v30;
    v7 = v31;
  }

}

- (void)didEvaluatePolicyToOpenBankConnectAccountCredentials:(id)a3 accountCredentialsTitle:(id)a4
{
  void *v5;
  id v6;

  +[BankConnectAccountCredentialsViewControllerProvider makeViewControllerWithAccountCredentials:title:](_TtC9PassKitUI51BankConnectAccountCredentialsViewControllerProvider, "makeViewControllerWithAccountCredentials:title:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)didReloadBankConnectAccountCredentials
{
  if (!-[UISegmentedControl selectedSegmentIndex](self->_tabBar, "selectedSegmentIndex"))
    -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 0);
}

- (void)didFindLinkableBankConnectInstitution
{
  id v3;

  -[PKPassDetailBankConnectSectionController allSectionIdentifiers](self->_bankConnectSectionController, "allSectionIdentifiers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailViewController reloadSections:](self, "reloadSections:", v3);

}

- (void)didStartBankConnectAuthorizationForInstitution:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  Class FKBankConnectAuthorizationViewControllerProviderClass_1;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  PKPaymentPassDetailViewController *v30;
  id v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[6];

  v34[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PKPaymentPassDetailViewController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
  v8 = (void *)MEMORY[0x1E0D66A58];
  v9 = *MEMORY[0x1E0D69910];
  v10 = *MEMORY[0x1E0D68B18];
  v11 = *MEMORY[0x1E0D68F50];
  v33[0] = *MEMORY[0x1E0D68AA0];
  v33[1] = v11;
  v12 = *MEMORY[0x1E0D68FB8];
  v34[0] = v10;
  v34[1] = v12;
  v13 = *MEMORY[0x1E0D68858];
  v34[2] = *MEMORY[0x1E0D68DB8];
  v14 = *MEMORY[0x1E0D68D88];
  v33[2] = v13;
  v33[3] = v14;
  objc_msgSend(v7, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v15;
  v33[4] = *MEMORY[0x1E0D69010];
  -[PKPaymentPassDetailViewController pass](self, "pass");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "issuerCountryCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subject:sendEvent:", v9, v18);

  +[PKDismissalPreventionAssertionManager sharedInstance](PKDismissalPreventionAssertionManager, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "acquireAssertion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  FKBankConnectAuthorizationViewControllerProviderClass_1 = getFKBankConnectAuthorizationViewControllerProviderClass_1();
  -[PKPaymentPassDetailViewController pass](self, "pass");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __99__PKPaymentPassDetailViewController_didStartBankConnectAuthorizationForInstitution_withCompletion___block_invoke;
  v29 = &unk_1E3E689B8;
  v31 = v20;
  v32 = v6;
  v30 = self;
  v23 = v20;
  v24 = v6;
  -[objc_class makeAuthorizationViewControllerWithPaymentPass:institution:completion:](FKBankConnectAuthorizationViewControllerProviderClass_1, "makeAuthorizationViewControllerWithPaymentPass:institution:completion:", v22, v7, &v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPassDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v25, 1, 0, v26, v27, v28, v29, v30);
}

uint64_t __99__PKPaymentPassDetailViewController_didStartBankConnectAuthorizationForInstitution_withCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)didUpdateBankConnectAccount:(id)a3
{
  _QWORD v5[5];

  -[PKPaymentPassDetailViewController setBankConnectAccount:](self, "setBankConnectAccount:");
  if (a3)
  {
    -[PKPaymentPassDetailViewController _loadBankConnectTransactions](self, "_loadBankConnectTransactions");
  }
  else if (-[PKPaymentPassDetailViewController _shouldShowTransactionsSection](self, "_shouldShowTransactionsSection"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__PKPaymentPassDetailViewController_didUpdateBankConnectAccount___block_invoke;
    v5[3] = &unk_1E3E62288;
    v5[4] = self;
    -[PKPaymentPassDetailViewController _reloadTransactionsWithCompletion:](self, "_reloadTransactionsWithCompletion:", v5);
    return;
  }
  -[PKPaymentPassDetailViewController contentIsLoaded](self, "contentIsLoaded");
  -[PKPaymentPassDetailViewController reloadData:](self, "reloadData:", 0);
}

uint64_t __65__PKPaymentPassDetailViewController_didUpdateBankConnectAccount___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "contentIsLoaded");
  return objc_msgSend(*(id *)(a1 + 32), "reloadData:", 0);
}

- (void)didSelectPrecursorPassRequestForDescription:(id)a3 controller:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  PKPaymentSetupDismissibleNavigationController *v16;
  void *v17;
  void *v18;
  PKPaymentPass *pass;
  id v20;
  PKPaymentSetupDismissibleNavigationController *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(_QWORD);
  _QWORD v26[4];
  PKPaymentSetupDismissibleNavigationController *v27;
  void (**v28)(_QWORD);
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  PKPaymentSetupDismissibleNavigationController *v32;
  void (**v33)(_QWORD);
  _QWORD *v34;
  _QWORD v35[3];
  char v36;
  _QWORD aBlock[4];
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke;
  aBlock[3] = &unk_1E3E61590;
  v12 = v10;
  v38 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  switch(objc_msgSend(v8, "actionType"))
  {
    case 0:
      goto LABEL_3;
    case 1:
      v16 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", 0);
      if (self->_detailViewStyle == 2)
        objc_msgSend(MEMORY[0x1E0D67230], "watchWebServiceForIssuerProvisioning");
      else
        objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", v23);
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 0, v22, 0);
      objc_msgSend(v17, "setIsFollowupProvisioning:", 1);
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x2020000000;
      v36 = 0;
      -[PKPaymentPassDetailViewController navigationController](self, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      pass = self->_pass;
      v30[0] = v11;
      v30[1] = 3221225472;
      v30[2] = __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_2;
      v30[3] = &unk_1E3E79BF8;
      v20 = v18;
      v31 = v20;
      v32 = v16;
      v34 = v35;
      v33 = v13;
      v26[0] = v11;
      v26[1] = 3221225472;
      v26[2] = __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_4;
      v26[3] = &unk_1E3E68D90;
      v29 = v35;
      v28 = v33;
      v21 = v32;
      v27 = v21;
      +[PKProvisioningFlowBridge startPrecursorPassFlowWithNavController:context:pass:precursorController:parentNavController:presentNavController:completion:](PKProvisioningFlowBridge, "startPrecursorPassFlowWithNavController:context:pass:precursorController:parentNavController:presentNavController:completion:", v21, v17, pass, v9, v20, v30, v26);

      _Block_object_dispose(v35, 8);
      break;
    case 2:
    case 3:
      -[PKPaymentPassDetailViewController _didSelectDeleteCard](self, "_didSelectDeleteCard");
LABEL_3:
      v13[2](v13);
      break;
    case 4:
      objc_msgSend(v8, "actionURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v11;
        v24[1] = 3221225472;
        v24[2] = __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_5;
        v24[3] = &unk_1E3E65EA8;
        v25 = v13;
        objc_msgSend(v15, "openURL:configuration:completionHandler:", v14, 0, v24);

      }
      else
      {
        v13[2](v13);
      }

      break;
    default:
      break;
  }

}

uint64_t __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_3;
  v5[3] = &unk_1E3E64A20;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v1, "presentViewController:animated:completion:", v2, 1, v5);

}

uint64_t __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_4(uint64_t a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __103__PKPaymentPassDetailViewController_didSelectPrecursorPassRequestForDescription_controller_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didSelectDeleteReAddForSectionController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKPaymentWebService *v8;
  PKPaymentPass *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  PKPaymentWebService *v15;
  PKPaymentPass *v16;
  _QWORD v17[4];
  PKPaymentWebService *v18;
  PKPaymentPass *v19;
  id v20;
  id v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = self->_webService;
  v9 = self->_pass;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke;
  aBlock[3] = &unk_1E3E773A8;
  v11 = v7;
  v23 = v11;
  objc_copyWeak(&v24, &location);
  v12 = _Block_copy(aBlock);
  -[PKPaymentWebService targetDevice](v8, "targetDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_2;
  v17[3] = &unk_1E3E6EBC8;
  objc_copyWeak(&v21, &location);
  v14 = v12;
  v20 = v14;
  v15 = v8;
  v18 = v15;
  v16 = v9;
  v19 = v16;
  objc_msgSend(v13, "paymentWebService:removePass:withCompletionHandler:", v15, v16, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
}

void __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  id v5;
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  }
}

void __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      PKDisplayableErrorForCommonType();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v10, 1, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", *(_QWORD *)(a1 + 32));
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_3;
      v11[3] = &unk_1E3E6EBC8;
      objc_copyWeak(&v15, (id *)(a1 + 56));
      v14 = *(id *)(a1 + 48);
      v12 = *(id *)(a1 + 40);
      v8 = v7;
      v13 = v8;
      objc_msgSend(v8, "preflightWithRequirements:completionRequirements:completion:", 45, 45, v11);

      objc_destroyWeak(&v15);
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  uint64_t v9;
  PKPaymentSetupDismissibleNavigationController *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PKPaymentSetupDismissibleNavigationController *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  PKPaymentSetupDismissibleNavigationController *v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      if (v5)
      {
        v17 = v5;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v18 = v17;
      v19 = PKAlertForDisplayableErrorWithHandlers(v17, 0, 0, 0);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v19, 1, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0D67168]);
      objc_msgSend(*(id *)(a1 + 32), "paymentPass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "initWithPaymentPass:", v8);

      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 4, *(_QWORD *)(a1 + 40), 0);
      v10 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", 4);
      -[PKPaymentSetupDismissibleNavigationController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 0);
      objc_msgSend(WeakRetained, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = 0;
      v30[1] = v30;
      v30[2] = 0x2020000000;
      v31 = 0;
      v12 = (void *)v9;
      v32[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_4;
      v25[3] = &unk_1E3E79BF8;
      v26 = v11;
      v15 = v10;
      v27 = v15;
      v29 = v30;
      v28 = *(id *)(a1 + 48);
      v21[0] = v14;
      v21[1] = 3221225472;
      v21[2] = __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_6;
      v21[3] = &unk_1E3E79C20;
      v24 = v30;
      v16 = v26;
      v22 = v16;
      v23 = *(id *)(a1 + 48);
      +[PKProvisioningFlowBridge startCredentialsProvisioningFlowWithNavController:context:credentials:parentNavController:presentNavController:completion:](PKProvisioningFlowBridge, "startCredentialsProvisioningFlowWithNavController:context:credentials:parentNavController:presentNavController:completion:", v15, v20, v13, v16, v25, v21);

      _Block_object_dispose(v30, 8);
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_5;
  v5[3] = &unk_1E3E64A20;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v1, "presentViewController:animated:completion:", v2, 1, v5);

}

uint64_t __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_5(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__PKPaymentPassDetailViewController_didSelectDeleteReAddForSectionController_completion___block_invoke_6(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_reportExpressModeEnable:(id)a3
{
  -[PKPaymentPassDetailViewController _reportExpressModeEvent:forPass:](self, "_reportExpressModeEvent:forPass:", *MEMORY[0x1E0D68B48], a3);
}

- (void)_reportExpressModeEnableFailed:(id)a3
{
  -[PKPaymentPassDetailViewController _reportExpressModeEvent:forPass:](self, "_reportExpressModeEvent:forPass:", *MEMORY[0x1E0D68B50], a3);
}

- (void)_reportExpressModeDisable:(id)a3
{
  -[PKPaymentPassDetailViewController _reportExpressModeEvent:forPass:](self, "_reportExpressModeEvent:forPass:", *MEMORY[0x1E0D68B40], a3);
}

- (void)_reportExpressModeEvent:(id)a3 forPass:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  id *v14;
  __CFString *v15;
  unint64_t v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;

  v6 = a4;
  v7 = *MEMORY[0x1E0D69958];
  v8 = (void *)MEMORY[0x1E0D66A58];
  v9 = a3;
  objc_msgSend(v8, "beginSubjectReporting:", v7);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "safelySetObject:forKey:", v9, *MEMORY[0x1E0D68AA0]);

  objc_msgSend(v10, "setObject:forKey:", *MEMORY[0x1E0D68FC0], *MEMORY[0x1E0D68F50]);
  if (self->_detailViewStyle == 2)
    v11 = (_QWORD *)MEMORY[0x1E0D693A0];
  else
    v11 = (_QWORD *)MEMORY[0x1E0D693C0];
  objc_msgSend(v10, "setObject:forKey:", *v11, *MEMORY[0x1E0D693B0]);
  v12 = v10;
  v35 = v6;
  if (!v35 || !v12)
    goto LABEL_30;
  v13 = objc_msgSend(v35, "passType");
  v14 = (id *)MEMORY[0x1E0D69618];
  if ((unint64_t)(v13 + 1) >= 3)
    v15 = (__CFString *)(id)*MEMORY[0x1E0D69618];
  else
    v15 = off_1E3E79E98[v13 + 1];
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D69040]);

  v16 = objc_msgSend(v35, "style");
  if (v16 < 0xD && ((0x13FFu >> v16) & 1) != 0)
    v17 = off_1E3E79EB0[v16];
  else
    v17 = (__CFString *)*v14;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D69038]);

  objc_msgSend(v35, "nfcPayload");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PKAnalyticsReportSwitchToggleResultValue();
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D69000]);

  v20 = v35;
  if (objc_msgSend(v20, "passType") == 1)
  {
    objc_msgSend(v20, "secureElementPass");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "cardType");
    if (v22 <= 4)
      v19 = (__CFString *)**((id **)&unk_1E3E79F18 + v22);

  }
  else
  {
    v19 = CFSTR("other");
  }

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D69028]);
  objc_msgSend(v20, "secureElementPass");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "isIdentityPass"))
  {
    v24 = objc_msgSend(v23, "identityType");
    if ((unint64_t)(v24 - 1) < 3)
    {
      v25 = off_1E3E79F40[v24 - 1];
      goto LABEL_25;
    }
  }
  else if (objc_msgSend(v23, "isAccessPass"))
  {
    v26 = objc_msgSend(v23, "accessType");
    if (v26 < 7)
    {
      v25 = off_1E3E79F58[v26];
      goto LABEL_25;
    }
  }
  v25 = (__CFString *)*v14;
LABEL_25:

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D69020]);
  objc_msgSend(v20, "secureElementPass");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "devicePaymentApplications");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "count");

  PKAnalyticsReportSwitchToggleResultValue();
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D68940]);
  objc_msgSend(v20, "secureElementPass");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *v14;
  objc_msgSend(v30, "organizationName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "length"))
  {
    v33 = objc_msgSend(v30, "cardType");
    if (v33 == 4 || v33 == 2)
    {
      v34 = v32;

      v31 = v34;
    }
  }

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D68D88]);
LABEL_30:

  objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", v7, v12);
  objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", v7);

}

- (void)appViewContentSizeChanged:(id)a3
{
  void *v4;
  id v5;

  -[PKPaymentPassDetailViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginUpdates");

  -[PKPaymentPassDetailViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endUpdates");

}

- (BOOL)handleDeletePassWithUniqueID:(id)a3
{
  PKPaymentPass *pass;
  id v5;
  void *v6;
  int v7;

  pass = self->_pass;
  v5 = a3;
  -[PKPaymentPass uniqueID](pass, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PKEqualObjects();

  if (v7)
    -[PKPaymentPassDetailViewController _didSelectDeleteCard](self, "_didSelectDeleteCard");
  return v7;
}

- (PKPassDeleteHandler)deleteOverrider
{
  return (PKPassDeleteHandler *)objc_loadWeakRetained((id *)&self->_deleteOverrider);
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (UIColor)warningTextColor
{
  return self->_warningTextColor;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (BOOL)loadingIdentityDetails
{
  return self->_loadingIdentityDetails;
}

- (void)setLoadingIdentityDetails:(BOOL)a3
{
  self->_loadingIdentityDetails = a3;
}

- (PKIdentityReplaceFingerprintHelper)fingeprintHelper
{
  return self->_fingeprintHelper;
}

- (void)setFingeprintHelper:(id)a3
{
  objc_storeStrong((id *)&self->_fingeprintHelper, a3);
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (void)setAccountUserCollection:(id)a3
{
  objc_storeStrong((id *)&self->_accountUserCollection, a3);
}

- (NSArray)accountUserInvitations
{
  return self->_accountUserInvitations;
}

- (void)setAccountUserInvitations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2120);
}

- (BOOL)isRemovingAccountUser
{
  return self->_removingAccountUser;
}

- (void)setRemovingAccountUser:(BOOL)a3
{
  self->_removingAccountUser = a3;
}

- (PKApplyController)applyController
{
  return self->_applyController;
}

- (void)setApplyController:(id)a3
{
  objc_storeStrong((id *)&self->_applyController, a3);
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (PKGroupsController)groupsController
{
  return self->_groupsController;
}

- (void)setGroupsController:(id)a3
{
  objc_storeStrong((id *)&self->_groupsController, a3);
}

- (int64_t)detailViewStyle
{
  return self->_detailViewStyle;
}

- (void)setDetailViewStyle:(int64_t)a3
{
  self->_detailViewStyle = a3;
}

- (void)setContactResolver:(id)a3
{
  objc_storeStrong((id *)&self->_contactResolver, a3);
}

- (void)setContactAvatarManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactAvatarManager, a3);
}

- (PKPaymentDataProvider)paymentServiceDataProvider
{
  return self->_paymentServiceDataProvider;
}

- (void)setPaymentServiceDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, a3);
}

- (PKAccountService)accountService
{
  return self->_accountService;
}

- (void)setAccountService:(id)a3
{
  objc_storeStrong((id *)&self->_accountService, a3);
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
  objc_storeStrong((id *)&self->_webService, a3);
}

- (PKPeerPaymentWebService)peerPaymentWebService
{
  return self->_peerPaymentWebService;
}

- (void)setPeerPaymentWebService:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentWebService, a3);
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (void)setTransactionSourceCollection:(id)a3
{
  objc_storeStrong((id *)&self->_transactionSourceCollection, a3);
}

- (PKBusinessChatController)businessChatController
{
  return self->_businessChatController;
}

- (void)setBusinessChatController:(id)a3
{
  objc_storeStrong((id *)&self->_businessChatController, a3);
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (FKBankConnectAccountsProvider)bankConnectAccountsProvider
{
  return self->_bankConnectAccountsProvider;
}

- (void)setBankConnectAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_bankConnectAccountsProvider, a3);
}

- (FKAccount)bankConnectAccount
{
  return self->_bankConnectAccount;
}

- (void)setBankConnectAccount:(id)a3
{
  objc_storeStrong((id *)&self->_bankConnectAccount, a3);
}

- (PKPassLibraryDataProvider)passLibraryDataProvider
{
  return self->_passLibraryDataProvider;
}

- (void)setPassLibraryDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_passLibraryDataProvider, a3);
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (void)setPhysicalCards:(id)a3
{
  objc_storeStrong((id *)&self->_physicalCards, a3);
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
{
  objc_storeStrong((id *)&self->_familyCollection, a3);
}

- (NSArray)sortedFamilyMemberRowModels
{
  return self->_sortedFamilyMemberRowModels;
}

- (void)setSortedFamilyMemberRowModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2264);
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (PKPayLaterFinancingPlansFetcher)financingPlansFetcher
{
  return self->_financingPlansFetcher;
}

- (void)setFinancingPlansFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_financingPlansFetcher, a3);
}

- (PKPayLaterPaymentIntentController)paymentIntentController
{
  return self->_paymentIntentController;
}

- (void)setPaymentIntentController:(id)a3
{
  objc_storeStrong((id *)&self->_paymentIntentController, a3);
}

- (int64_t)activeFinancingPlansCount
{
  return self->_activeFinancingPlansCount;
}

- (void)setActiveFinancingPlansCount:(int64_t)a3
{
  self->_activeFinancingPlansCount = a3;
}

- (int64_t)completedFinancingPlansCount
{
  return self->_completedFinancingPlansCount;
}

- (void)setCompletedFinancingPlansCount:(int64_t)a3
{
  self->_completedFinancingPlansCount = a3;
}

- (PKPayLaterSetupFlowController)payLaterSetupFlowController
{
  return self->_payLaterSetupFlowController;
}

- (void)setPayLaterSetupFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_payLaterSetupFlowController, a3);
}

- (PKPayLaterBusinessChatTopicComposer)payLaterTopicsComposer
{
  return self->_payLaterTopicsComposer;
}

- (void)setPayLaterTopicsComposer:(id)a3
{
  objc_storeStrong((id *)&self->_payLaterTopicsComposer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payLaterTopicsComposer, 0);
  objc_storeStrong((id *)&self->_payLaterSetupFlowController, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_financingPlansFetcher, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_sortedFamilyMemberRowModels, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_bankConnectAccount, 0);
  objc_storeStrong((id *)&self->_bankConnectAccountsProvider, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_contactAvatarManager, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_accountUserInvitations, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_fingeprintHelper, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_warningTextColor, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_destroyWeak((id *)&self->_deleteOverrider);
  objc_storeStrong((id *)&self->_broadwayFeaturesAndBenefitsSectionController, 0);
  objc_storeStrong((id *)&self->_peerPaymentIdentityManagementSectionController, 0);
  objc_storeStrong((id *)&self->_peerPaymentRecurringPaymentSectionController, 0);
  objc_storeStrong((id *)&self->_peerPaymentAutoReloadSectionController, 0);
  objc_storeStrong((id *)&self->_appleBalanceAddMoneyUIManager, 0);
  objc_storeStrong((id *)&self->_merchantTokensResponse, 0);
  objc_storeStrong((id *)&self->_accountCredentialsSectionController, 0);
  objc_storeStrong((id *)&self->_bankConnectSectionController, 0);
  objc_storeStrong((id *)&self->_bioBindingSectionController, 0);
  objc_storeStrong((id *)&self->_precursorSectionController, 0);
  objc_storeStrong((id *)&self->_combinedActionController, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_actionGroupController, 0);
  objc_storeStrong((id *)&self->_contactIssuerHelper, 0);
  objc_storeStrong((id *)&self->_sharesSectionController, 0);
  objc_storeStrong((id *)&self->_configurableSectionController, 0);
  objc_storeStrong((id *)&self->_paymentPassDetailSectionController, 0);
  objc_storeStrong((id *)&self->_autoReloadMerchantSectionController, 0);
  objc_storeStrong((id *)&self->_autoReloadActionSectionController, 0);
  objc_storeStrong((id *)&self->_passActionSectionController, 0);
  objc_storeStrong((id *)&self->_balanceSectionController, 0);
  objc_storeStrong((id *)&self->_scheduledPaymentsSectionController, 0);
  objc_storeStrong((id *)&self->_orderOfSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_peerPaymentAssociatedAccountsController, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_executionBlocksContentIsLoaded, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_billingContact, 0);
  objc_storeStrong((id *)&self->_billingAddressHeaderView, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_initialLoadGroup, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_loadingPeerPaymentAccountActionIndexPath, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionControllerForAccountService, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_accountCardNumbersPresenter, 0);
  objc_storeStrong((id *)&self->_physicalCardActionController, 0);
  objc_storeStrong((id *)&self->_physicalCardController, 0);
  objc_storeStrong((id *)&self->_resolutionController, 0);
  objc_storeStrong((id *)&self->_transactionDetailsFactory, 0);
  objc_storeStrong((id *)&self->_peerPaymentActionViewController, 0);
  objc_storeStrong((id *)&self->_peerPaymentPreferencesHeaderView, 0);
  objc_storeStrong((id *)&self->_peerPaymentPreferences, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_rendererState, 0);
  objc_storeStrong((id *)&self->_titleIconView, 0);
  objc_storeStrong((id *)&self->_passSnapshotView, 0);
  objc_storeStrong((id *)&self->_tabBar, 0);
  objc_storeStrong((id *)&self->_passHeaderView, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contextualActionHandlers, 0);
  objc_storeStrong((id *)&self->_tabBarSegments, 0);
  objc_storeStrong((id *)&self->_displayableBalanceFields, 0);
  objc_storeStrong((id *)&self->_reminderForBalanceIdentifier, 0);
  objc_storeStrong((id *)&self->_actionForBalanceIdentifier, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_balanceFields, 0);
  objc_storeStrong((id *)&self->_commutePlans, 0);
  objc_storeStrong((id *)&self->_commutePlanFields, 0);
  objc_storeStrong((id *)&self->_commuterFields, 0);
  objc_storeStrong((id *)&self->_transitPropertiesBalanceReminder, 0);
  objc_storeStrong((id *)&self->_transitProperties, 0);
  objc_storeStrong((id *)&self->_expressPassController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_contactlessPaymentApplications, 0);
  objc_storeStrong((id *)&self->_devicePaymentApplications, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_transactionCountFormatter, 0);
  objc_storeStrong((id *)&self->_transactionYearFormatter, 0);
  objc_storeStrong((id *)&self->_transactionCountAndYear, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_bankConnectTransactionsAndGroupsProvider, 0);
  objc_storeStrong((id *)&self->_allowNotificationCell, 0);
  objc_storeStrong((id *)&self->_widgetCell, 0);
  objc_storeStrong((id *)&self->_transactionCellController, 0);
  objc_storeStrong((id *)&self->_uwbExpressAccessSwitch, 0);
  objc_storeStrong((id *)&self->_expressAccessSwitch, 0);
  objc_storeStrong((id *)&self->_automaticPresentationSwitch, 0);
  objc_storeStrong((id *)&self->_notificationsSwitch, 0);
  objc_storeStrong((id *)&self->_dailyCashSwitch, 0);
  objc_storeStrong((id *)&self->_transactionsSwitch, 0);
  objc_storeStrong((id *)&self->_messagesSwitch, 0);
  objc_storeStrong((id *)&self->_refreshTimeout, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_associatedAccountPendingFooterView, 0);
  objc_storeStrong((id *)&self->_activationFooter, 0);
  objc_storeStrong((id *)&self->_verificationController, 0);
  objc_storeStrong((id *)&self->_defaultPaymentApplication, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_transactionTimer, 0);
}

@end
