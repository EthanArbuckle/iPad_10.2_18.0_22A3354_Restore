@implementation PKDashboardMoreMenuFactory

- (PKDashboardMoreMenuFactory)init
{
  PKDashboardMoreMenuFactory *v2;
  PKPaymentDefaultDataProvider *v3;
  PKPaymentDefaultDataProvider *paymentServiceDataProvider;
  PKPassLibraryDefaultDataProvider *v5;
  PKPassLibraryDefaultDataProvider *passLibraryDataProvider;
  uint64_t v7;
  PKPaymentWebService *webService;
  uint64_t v9;
  PKExpressPassController *expressPassController;
  uint64_t v11;
  PKAccountService *accountService;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKDashboardMoreMenuFactory;
  v2 = -[PKDashboardMoreMenuFactory init](&v14, sel_init);
  if (v2)
  {
    v3 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E0D67100]);
    paymentServiceDataProvider = v2->_paymentServiceDataProvider;
    v2->_paymentServiceDataProvider = v3;

    -[PKPaymentDefaultDataProvider addDelegate:](v2->_paymentServiceDataProvider, "addDelegate:", v2);
    v5 = (PKPassLibraryDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E0D66F18]);
    passLibraryDataProvider = v2->_passLibraryDataProvider;
    v2->_passLibraryDataProvider = v5;

    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v7 = objc_claimAutoreleasedReturnValue();
    webService = v2->_webService;
    v2->_webService = (PKPaymentWebService *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66D50]), "initWithPaymentDataProvider:passLibraryDataProvider:isForWatch:", v2->_paymentServiceDataProvider, v2->_passLibraryDataProvider, 0);
    expressPassController = v2->_expressPassController;
    v2->_expressPassController = (PKExpressPassController *)v9;

    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    accountService = v2->_accountService;
    v2->_accountService = (PKAccountService *)v11;

    -[PKAccountService registerObserver:](v2->_accountService, "registerObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentDefaultDataProvider removeDelegate:](self->_paymentServiceDataProvider, "removeDelegate:", self);
  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardMoreMenuFactory;
  -[PKDashboardMoreMenuFactory dealloc](&v3, sel_dealloc);
}

- (id)moreMenu
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;

  if ((PKPreferenceBOOLforKey() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = -[PKDashboardMoreMenuFactory moreMenuType](self, "moreMenuType");
    v5 = 0;
    self->_forceShowMoreMenuIcon = 0;
    switch(v4)
    {
      case 1:
        -[PKDashboardMoreMenuFactory _barcodePassMenuItems](self, "_barcodePassMenuItems");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 2:
        -[PKDashboardMoreMenuFactory _paymentPassMenuItems](self, "_paymentPassMenuItems");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 4:
        if (-[PKDashboardMoreMenuFactory _isPassActivating](self, "_isPassActivating"))
          self->_forceShowMoreMenuIcon = 1;
        -[PKDashboardMoreMenuFactory _transitPassMenuItems](self, "_transitPassMenuItems");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 5:
        -[PKDashboardMoreMenuFactory _accessPassMenuItems](self, "_accessPassMenuItems");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 6:
        if (-[PKDashboardMoreMenuFactory _isPassActivating](self, "_isPassActivating"))
          self->_forceShowMoreMenuIcon = 1;
        -[PKDashboardMoreMenuFactory _eMoneyPassMenuItems](self, "_eMoneyPassMenuItems");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 7:
        -[PKDashboardMoreMenuFactory _savingsMenuItems](self, "_savingsMenuItems");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 8:
        -[PKDashboardMoreMenuFactory _appleCardMenuItems](self, "_appleCardMenuItems");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 9:
        -[PKDashboardMoreMenuFactory _appleCashMenuItems](self, "_appleCashMenuItems");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 11:
        -[PKDashboardMoreMenuFactory _appleBalanceMenuItems](self, "_appleBalanceMenuItems");
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v5 = (void *)v6;
        break;
      default:
        break;
    }
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D70]);
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (id)_barcodePassMenuItems
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PKDashboardMoreMenuFactory _canShowNotificationsInfo](self, "_canShowNotificationsInfo");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKDashboardMoreMenuFactory _showCalendarAction](self, "_showCalendarAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safelyAddObject:", v6);

  -[PKDashboardMoreMenuFactory _showTransferAction](self, "_showTransferAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safelyAddObject:", v7);

  -[PKDashboardMoreMenuFactory _showSellAction](self, "_showSellAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safelyAddObject:", v8);

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E3E7D690, 0, 0, 1, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v9);

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKDashboardMoreMenuFactory _showPassInfoAction](self, "_showPassInfoAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safelyAddObject:", v11);

  if (v3)
  {
    -[PKDashboardMoreMenuFactory _showPassManageNotifications](self, "_showPassManageNotifications");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safelyAddObject:", v12);

  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E3E7D690, 0, 0, 1, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v13);

  }
  v14 = (void *)MEMORY[0x1E0DC39D0];
  -[PKDashboardMoreMenuFactory _removePassAction](self, "_removePassAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "menuWithTitle:image:identifier:options:children:", &stru_1E3E7D690, 0, 0, 1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safelyAddObject:", v17);

  v18 = (void *)objc_msgSend(v4, "copy");
  return v18;
}

- (id)_paymentPassMenuItems
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[PKDashboardMoreMenuFactory _canShowNotificationsInfo](self, "_canShowNotificationsInfo");
  v4 = -[PKDashboardMoreMenuFactory _canShowPaymentCardNumberAction](self, "_canShowPaymentCardNumberAction");
  v5 = v4;
  if (v3 || v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PKDashboardMoreMenuFactory _showPaymentCardNumberAction](self, "_showPaymentCardNumberAction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safelyAddObject:", v8);

    }
    -[PKDashboardMoreMenuFactory _showPassInfoAction](self, "_showPassInfoAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safelyAddObject:", v9);

    if (v3)
    {
      -[PKDashboardMoreMenuFactory _showPassManageNotifications](self, "_showPassManageNotifications");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safelyAddObject:", v10);

    }
    v6 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_transitPassMenuItems
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = -[PKDashboardMoreMenuFactory _hasValidEnteredValueActions](self, "_hasValidEnteredValueActions");
  v4 = -[PKDashboardMoreMenuFactory _hasTransitCardNumber](self, "_hasTransitCardNumber");
  v5 = -[PKDashboardMoreMenuFactory _canShowNotificationsInfo](self, "_canShowNotificationsInfo");
  v6 = -[PKDashboardMoreMenuFactory _hasValidSelectedItemActions](self, "_hasValidSelectedItemActions");
  v7 = -[PKDashboardMoreMenuFactory _hasGroupActions](self, "_hasGroupActions");
  v8 = -[PKDashboardMoreMenuFactory _hasCombinedActions](self, "_hasCombinedActions");
  if (!v3 && !v4 && !v5 && !v6 && !v7)
  {
    v9 = 0;
    return v9;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v3)
  {
    -[PKDashboardMoreMenuFactory _showEnteredValuePassActions](self, "_showEnteredValuePassActions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safelyAddObject:", v12);

  }
  if (v8)
  {
    -[PKDashboardMoreMenuFactory _showCombinedPassActionsBuy](self, "_showCombinedPassActionsBuy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safelyAddObject:", v13);

    -[PKDashboardMoreMenuFactory _showCombinedPassActionsRenew](self, "_showCombinedPassActionsRenew");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      -[PKDashboardMoreMenuFactory _showSelectedItemPassActions](self, "_showSelectedItemPassActions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safelyAddObject:", v15);

    }
    if (!v7)
      goto LABEL_16;
    -[PKDashboardMoreMenuFactory _showPassActionGroups](self, "_showPassActionGroups");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v14;
  objc_msgSend(v11, "safelyAddObject:", v14);

LABEL_16:
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E3E7D690, 0, 0, 1, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safelyAddObject:", v17);

  }
  if (v4)
  {
    -[PKDashboardMoreMenuFactory _showTransitCardNumberAction](self, "_showTransitCardNumberAction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safelyAddObject:", v18);

  }
  -[PKDashboardMoreMenuFactory _showPassInfoAction](self, "_showPassInfoAction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safelyAddObject:", v19);

  if (v5)
  {
    -[PKDashboardMoreMenuFactory _showPassManageNotifications](self, "_showPassManageNotifications");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safelyAddObject:", v20);

  }
  v9 = (void *)objc_msgSend(v10, "copy");

  return v9;
}

- (id)_eMoneyPassMenuItems
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = -[PKDashboardMoreMenuFactory _hasValidEnteredValueActions](self, "_hasValidEnteredValueActions");
  v4 = -[PKDashboardMoreMenuFactory _hasTransitCardNumber](self, "_hasTransitCardNumber");
  v5 = -[PKDashboardMoreMenuFactory _canShowNotificationsInfo](self, "_canShowNotificationsInfo");
  v6 = v5;
  if (v3 || v4 || v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v3)
    {
      -[PKDashboardMoreMenuFactory _showEnteredValuePassActions](self, "_showEnteredValuePassActions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safelyAddObject:", v10);

    }
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E3E7D690, 0, 0, 1, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safelyAddObject:", v11);

    }
    if (v4)
    {
      -[PKDashboardMoreMenuFactory _showTransitCardNumberAction](self, "_showTransitCardNumberAction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safelyAddObject:", v12);

    }
    -[PKDashboardMoreMenuFactory _showPassInfoAction](self, "_showPassInfoAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safelyAddObject:", v13);

    if (v6)
    {
      -[PKDashboardMoreMenuFactory _showPassManageNotifications](self, "_showPassManageNotifications");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safelyAddObject:", v14);

    }
    v7 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_accessPassMenuItems
{
  _BOOL4 v3;
  _BOOL4 homeKitHasHomeGuestAccessSchedule;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[PKDashboardMoreMenuFactory _canShowNotificationsInfo](self, "_canShowNotificationsInfo");
  homeKitHasHomeGuestAccessSchedule = self->_homeKitHasHomeGuestAccessSchedule;
  if (v3 || self->_homeKitHasHomeGuestAccessSchedule)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (homeKitHasHomeGuestAccessSchedule)
    {
      -[PKDashboardMoreMenuFactory _showHasHomeGuestAccessScheduleAction](self, "_showHasHomeGuestAccessScheduleAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safelyAddObject:", v7);

    }
    -[PKDashboardMoreMenuFactory _showPassInfoAction](self, "_showPassInfoAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safelyAddObject:", v8);

    if (v3)
    {
      -[PKDashboardMoreMenuFactory _showPassManageNotifications](self, "_showPassManageNotifications");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safelyAddObject:", v9);

    }
    v5 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_savingsMenuItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMoreMenuFactory _savingsDetailsAction](self, "_savingsDetailsAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  -[PKDashboardMoreMenuFactory _showSavingsDocumentsAction](self, "_showSavingsDocumentsAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v5);

  -[PKDashboardMoreMenuFactory _showAccountManageNotifications](self, "_showAccountManageNotifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v6);

  -[PKDashboardMoreMenuFactory _showSavingsDebugAction](self, "_showSavingsDebugAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v7);

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (id)_appleCardMenuItems
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  void *v27;

  v3 = (-[PKAccount blockAllAccountAccess](self->_account, "blockAllAccountAccess") & 1) != 0
    || -[PKAccount state](self->_account, "state") == 3;
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountSummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "requiresDebtCollectionNotices");

  }
  else
  {
    v7 = 0;
  }

  if (((v3 | v7) & 1) != 0)
    v8 = 0;
  else
    v8 = PKRewardsCenterEnabled();
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "installmentPlans");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = !v3 && objc_msgSend(v10, "count") != 0;
  v12 = -[PKDashboardMoreMenuFactory _canShowNotificationsInfo](self, "_canShowNotificationsInfo");
  v13 = v12;
  if (((v8 | v11) & 1) == 0 && !v12)
  {
    v14 = 0;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass paymentPass](self->_pass, "paymentPass");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[PKCreditAccountController shouldDisplayScheduledPaymentsWithAccount:andPass:](PKCreditAccountController, "shouldDisplayScheduledPaymentsWithAccount:andPass:", self->_account, v16))
  {
    if (!v11)
      goto LABEL_18;
LABEL_28:
    -[PKDashboardMoreMenuFactory _showInstallmentPlansAction](self, "_showInstallmentPlansAction");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safelyAddObject:", v27);

    if (!v8)
      goto LABEL_20;
    goto LABEL_19;
  }
  -[PKDashboardMoreMenuFactory _showScheduledPaymentsAction](self, "_showScheduledPaymentsAction");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safelyAddObject:", v26);

  if (v11)
    goto LABEL_28;
LABEL_18:
  if (v8)
  {
LABEL_19:
    -[PKDashboardMoreMenuFactory _openRewardsHubAction](self, "_openRewardsHubAction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safelyAddObject:", v17);

  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMoreMenuFactory _showPassInfoAction](self, "_showPassInfoAction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safelyAddObject:", v19);

  if (v13)
  {
    -[PKDashboardMoreMenuFactory _showPassManageNotifications](self, "_showPassManageNotifications");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "safelyAddObject:", v20);

  }
  v21 = objc_msgSend(v15, "count");
  v22 = v18;
  if (v21)
  {
    v23 = objc_msgSend(v18, "count");
    v22 = v15;
    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E3E7D690, 0, 0, 1, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safelyAddObject:", v24);

      v22 = v15;
    }
  }
  v14 = (void *)objc_msgSend(v22, "copy");

LABEL_26:
  return v14;
}

- (id)_appleCashMenuItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKFamilyMemberCollection currentUser](self->_familyCollection, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPeerPaymentAccount isEligibleToAddMoneyForUser:](self->_peerPaymentAccount, "isEligibleToAddMoneyForUser:", v4))
  {
    -[PKDashboardMoreMenuFactory _addMoneyPeerPaymentAction](self, "_addMoneyPeerPaymentAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safelyAddObject:", v5);

  }
  if (-[PKPeerPaymentAccount isEligibleToWithdrawForUser:](self->_peerPaymentAccount, "isEligibleToWithdrawForUser:", v4))
  {
    -[PKDashboardMoreMenuFactory _transferToBankAction](self, "_transferToBankAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safelyAddObject:", v6);

  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKDashboardMoreMenuFactory _recurringPeerPaymentsPaymentsAction](self, "_recurringPeerPaymentsPaymentsAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safelyAddObject:", v8);

  -[PKDashboardMoreMenuFactory _peerPaymentFamilyAction](self, "_peerPaymentFamilyAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safelyAddObject:", v9);

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PKDashboardMoreMenuFactory _canShowPaymentCardNumberAction](self, "_canShowPaymentCardNumberAction"))
  {
    -[PKDashboardMoreMenuFactory _showPaymentCardNumberAction](self, "_showPaymentCardNumberAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safelyAddObject:", v11);

  }
  -[PKDashboardMoreMenuFactory _showPassInfoAction](self, "_showPassInfoAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safelyAddObject:", v12);

  if (-[PKDashboardMoreMenuFactory _canShowNotificationsInfo](self, "_canShowNotificationsInfo"))
  {
    -[PKDashboardMoreMenuFactory _showPassManageNotifications](self, "_showPassManageNotifications");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safelyAddObject:", v13);

  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E3E7D690, 0, 0, 1, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safelyAddObject:", v14);

  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E3E7D690, 0, 0, 1, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safelyAddObject:", v15);

  }
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (id)_appleBalanceMenuItems
{
  void *v3;
  int v4;
  int v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[PKPass paymentPass](self->_pass, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKCanShowAppleBalanceTopUpOptions();

  if ((-[PKAccount supportsTopUp](self->_account, "supportsTopUp") & 1) != 0)
    v5 = 0;
  else
    v5 = -[PKAccount supportsAMPTopUp](self->_account, "supportsAMPTopUp") ^ 1;
  v6 = -[PKAccount supportsAMPRedeemGiftcard](self->_account, "supportsAMPRedeemGiftcard");
  v7 = -[PKDashboardMoreMenuFactory _canShowNotificationsInfo](self, "_canShowNotificationsInfo");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKDashboardMoreMenuFactory _showPassInfoAction](self, "_showPassInfoAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safelyAddObject:", v10);

  if (v7)
  {
    -[PKDashboardMoreMenuFactory _showPassManageNotifications](self, "_showPassManageNotifications");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safelyAddObject:", v11);

  }
  if (((v4 ^ 1 | v5) & 1) == 0)
  {
    -[PKDashboardMoreMenuFactory _addMoneyAppleBalanceAction](self, "_addMoneyAppleBalanceAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safelyAddObject:", v12);

  }
  if ((v4 & v6) == 1)
  {
    -[PKDashboardMoreMenuFactory _redeemAction](self, "_redeemAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safelyAddObject:", v13);

  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E3E7D690, 0, 0, 1, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safelyAddObject:", v14);

  }
  else
  {
    objc_msgSend(v8, "addObjectsFromArray:", v9);
  }
  v15 = (void *)objc_msgSend(v8, "copy");

  return v15;
}

- (id)_showPassManageNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_MANAGE_NOTIFICATIONS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("bell.badge"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PKDashboardMoreMenuFactory__showPassManageNotifications__block_invoke;
  v8[3] = &unk_1E3E659D0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67DA0]);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __58__PKDashboardMoreMenuFactory__showPassManageNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "paymentPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = *(_QWORD **)(a1 + 32);
      v6 = v5[2];
      v7 = v5[9];
      v8 = v5[14];
      objc_msgSend(v5, "account");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "presentManagePaymentPassNotificationsControllerWithDataProvider:peerPaymentAccount:bankConnectAccount:account:", v6, v7, v8, v9);

    }
    else
    {
      objc_msgSend(v3, "presentManageBarcodePassNotifications");
    }

    WeakRetained = v10;
  }

}

- (id)_showEnteredValuePassActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  PKPassLocalizedStringWithFormat();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PKDashboardMoreMenuFactory__showEnteredValuePassActions__block_invoke;
  v8[3] = &unk_1E3E659D0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B58]);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __58__PKDashboardMoreMenuFactory__showEnteredValuePassActions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentActionsWithPaymentDataProvider:webService:actionType:transitBalanceModel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

    WeakRetained = v4;
  }

}

- (id)_showCombinedPassActionsBuy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  PKPassLocalizedStringWithFormat();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("creditcard"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PKDashboardMoreMenuFactory__showCombinedPassActionsBuy__block_invoke;
  v8[3] = &unk_1E3E659D0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67998]);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __57__PKDashboardMoreMenuFactory__showCombinedPassActionsBuy__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentCombinedActionsWithPaymentDataProvider:webService:balanceModel:mode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 0);

    WeakRetained = v4;
  }

}

- (id)_showCombinedPassActionsRenew
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  PKPassLocalizedStringWithFormat();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("creditcard"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PKDashboardMoreMenuFactory__showCombinedPassActionsRenew__block_invoke;
  v8[3] = &unk_1E3E659D0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F68]);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __59__PKDashboardMoreMenuFactory__showCombinedPassActionsRenew__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentCombinedActionsWithPaymentDataProvider:webService:balanceModel:mode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 1);

    WeakRetained = v4;
  }

}

- (id)_showSelectedItemPassActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  PKPassLocalizedStringWithFormat();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("creditcard"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PKDashboardMoreMenuFactory__showSelectedItemPassActions__block_invoke;
  v8[3] = &unk_1E3E659D0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F68]);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __58__PKDashboardMoreMenuFactory__showSelectedItemPassActions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentActionsWithPaymentDataProvider:webService:actionType:transitBalanceModel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

    WeakRetained = v4;
  }

}

- (id)_showPassActionGroups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  PKPassLocalizedStringWithFormat();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("creditcard"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PKDashboardMoreMenuFactory__showPassActionGroups__block_invoke;
  v8[3] = &unk_1E3E659D0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67998]);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __51__PKDashboardMoreMenuFactory__showPassActionGroups__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentActionGroupsWithPaymentDataProvider:balanceModel:webService:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

    WeakRetained = v4;
  }

}

- (id)_showPassInfoAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  -[PKDashboardMoreMenuFactory _showPassInfoLocalizedTitle](self, "_showPassInfoLocalizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("info.circle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __49__PKDashboardMoreMenuFactory__showPassInfoAction__block_invoke;
  v11 = &unk_1E3E62BD0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679D8], v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

void __49__PKDashboardMoreMenuFactory__showPassInfoAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentPassDetailsAnimated:action:", 1, 0);

    WeakRetained = v3;
  }

}

- (id)_showCalendarAction
{
  uint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  __CFString *v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  BOOL v28;
  _QWORD v29[4];
  __CFString *v30;
  id v31;
  id v32;
  id location;

  objc_initWeak(&location, self);
  v3 = PKIsAuthorizedForEvents();
  if (v3 != 2 && -[PKPass style](self->_pass, "style") == 9)
  {
    v4 = v3 == 1;
    PKEventStore();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKExistingCalendarEventsForPass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3 == 1 && v6 && objc_msgSend(v6, "count"))
    {
      PKNextCalendarEventFromEvents();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0DC3428];
      PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_VIEW_CALENDAR_EVENT"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __49__PKDashboardMoreMenuFactory__showCalendarAction__block_invoke;
      v29[3] = &unk_1E3E675A8;
      v12 = &v32;
      objc_copyWeak(&v32, &location);
      v13 = v8;
      v30 = v13;
      v31 = v5;
      objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v11, 0, v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id *)&v30;

      v16 = v31;
    }
    else
    {
      -[PKPass relevantDates](self->_pass, "relevantDates");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 < 1
        || (-[PKPass eventName](self->_pass, "eventName"),
            (v19 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v14 = 0;
        goto LABEL_16;
      }
      v20 = v19;
      v14 = (void *)objc_msgSend(v19, "length");

      if (!v14)
      {
LABEL_16:

        goto LABEL_17;
      }
      v21 = CFSTR("calendar");
      if ((unint64_t)v18 > 1)
        v21 = CFSTR("calendar.badge.plus");
      v13 = v21;
      v22 = (void *)MEMORY[0x1E0DC3428];
      PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_ADD_TO_CALENDAR"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __49__PKDashboardMoreMenuFactory__showCalendarAction__block_invoke_2;
      v25[3] = &unk_1E3E6B8A8;
      v12 = &v27;
      objc_copyWeak(&v27, &location);
      v28 = v4;
      v26 = v5;
      objc_msgSend(v22, "actionWithTitle:image:identifier:handler:", v16, v23, 0, v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = &v26;

    }
    objc_destroyWeak(v12);

    objc_msgSend(v14, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679B0]);
    goto LABEL_16;
  }
  v14 = 0;
LABEL_17:
  objc_destroyWeak(&location);
  return v14;
}

void __49__PKDashboardMoreMenuFactory__showCalendarAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentExistingCalendarEvent:eventStore:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

void __49__PKDashboardMoreMenuFactory__showCalendarAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_performAddToCalendarRequestNeedingPermission:eventStore:", *(_BYTE *)(a1 + 48) == 0, *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_performAddToCalendarRequestNeedingPermission:(BOOL)a3 eventStore:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  id location;

  v4 = a3;
  v6 = a4;
  if (v4)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v8, &location);
    v7 = v6;
    PKRequestEventsAuthorization();

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKDashboardMoreMenuFactory _addEventsToCalendarWithEventStore:](self, "_addEventsToCalendarWithEventStore:", v6);
  }

}

void __87__PKDashboardMoreMenuFactory__performAddToCalendarRequestNeedingPermission_eventStore___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __87__PKDashboardMoreMenuFactory__performAddToCalendarRequestNeedingPermission_eventStore___block_invoke_2;
    v7[3] = &unk_1E3E64E10;
    v11 = a2;
    v8 = v5;
    v9 = WeakRetained;
    v10 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __87__PKDashboardMoreMenuFactory__performAddToCalendarRequestNeedingPermission_eventStore___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56) && !*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_addEventsToCalendarWithEventStore:", *(_QWORD *)(a1 + 48));
  else
    return objc_msgSend(*(id *)(a1 + 40), "_presentNeedsCalendarPermissionsAlert");
}

- (void)_addEventsToCalendarWithEventStore:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  PKGenerateCalendarEventsForPass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    if (v5 == 1)
    {
      -[PKDashboardMoreMenuFactory navigationDashboardPassVC](self, "navigationDashboardPassVC");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentEditCalendarEvent:eventStore:", v7, v8);

    }
    else
    {
      PKCommitCalendarEvents();
    }
  }

}

- (void)_presentNeedsCalendarPermissionsAlert
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
  id v13;

  v3 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_CALENDAR_ALERT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_CALENDAR_ALERT_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_CALENDAR_SETTINGS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, &__block_literal_global_89);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v8);

  v9 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("CANCEL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v11);

  -[PKDashboardMoreMenuFactory navigationDashboardPassVC](self, "navigationDashboardPassVC");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, 0);

}

void __67__PKDashboardMoreMenuFactory__presentNeedsCalendarPermissionsAlert__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Privacy&path=CALENDARS"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

- (id)_showTransferAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[PKPass transferURL](self->_pass, "transferURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3428];
    PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_TRANSFER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.line.dotted.person"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__PKDashboardMoreMenuFactory__showTransferAction__block_invoke;
    v9[3] = &unk_1E3E659D0;
    objc_copyWeak(&v11, &location);
    v10 = v3;
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68158]);
    objc_destroyWeak(&v11);
  }
  else
  {
    v7 = 0;
  }

  objc_destroyWeak(&location);
  return v7;
}

void __49__PKDashboardMoreMenuFactory__showTransferAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

    WeakRetained = v4;
  }

}

- (id)_showSellAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[PKPass sellURL](self->_pass, "sellURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3428];
    PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_SELL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("banknote"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__PKDashboardMoreMenuFactory__showSellAction__block_invoke;
    v9[3] = &unk_1E3E659D0;
    objc_copyWeak(&v11, &location);
    v10 = v3;
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68008]);
    objc_destroyWeak(&v11);
  }
  else
  {
    v7 = 0;
  }

  objc_destroyWeak(&location);
  return v7;
}

void __45__PKDashboardMoreMenuFactory__showSellAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

    WeakRetained = v4;
  }

}

- (id)_showTransitCardNumberAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  if (-[PKPass passType](self->_pass, "passType") != PKPassTypeSecureElement)
    return 0;
  -[PKPass paymentPass](self->_pass, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isStoredValuePass"))
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0DC3428];
    PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_SHOW_CARD_NUMBER_TRANSIT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("creditcard.and.123"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __58__PKDashboardMoreMenuFactory__showTransitCardNumberAction__block_invoke;
    v12 = &unk_1E3E62BD0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679E8], v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __58__PKDashboardMoreMenuFactory__showTransitCardNumberAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentTransitCardNumber");
    v4 = *MEMORY[0x1E0D68B18];
    v5 = *MEMORY[0x1E0D68858];
    v8[0] = *MEMORY[0x1E0D68AA0];
    v8[1] = v5;
    v6 = *MEMORY[0x1E0D68908];
    v9[0] = v4;
    v9[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reportEventForPassIfNecessary:", v7);

  }
}

- (BOOL)_canShowPaymentCardNumberAction
{
  void *v3;
  void *v4;
  PKAccount *account;
  void *v6;
  BOOL v7;

  if (-[PKPass passType](self->_pass, "passType") != PKPassTypeSecureElement)
    return 0;
  -[PKDashboardMoreMenuFactory pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secureElementPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isAppleCardPass"))
  {
    account = self->_account;
    objc_msgSend(v4, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[PKCreditAccountController shouldShowCardNumbersWithAccount:andPass:](PKCreditAccountController, "shouldShowCardNumbersWithAccount:andPass:", account, v6);

  }
  else
  {
    v7 = objc_msgSend(v4, "passActivationState") == 0;
  }

  return v7;
}

- (id)_showPaymentCardNumberAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_SHOW_CARD_NUMBERS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("creditcard.and.123"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __58__PKDashboardMoreMenuFactory__showPaymentCardNumberAction__block_invoke;
  v10 = &unk_1E3E62BD0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679E8], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __58__PKDashboardMoreMenuFactory__showPaymentCardNumberAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentCardNumbers");
    v4 = *MEMORY[0x1E0D68B18];
    v5 = *MEMORY[0x1E0D68858];
    v8[0] = *MEMORY[0x1E0D68AA0];
    v8[1] = v5;
    v6 = *MEMORY[0x1E0D68908];
    v9[0] = v4;
    v9[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reportEventForPassIfNecessary:", v7);

  }
}

- (id)_removePassAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  -[PKDashboardMoreMenuFactory _removePassLocalizedTitle](self, "_removePassLocalizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("minus.circle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __47__PKDashboardMoreMenuFactory__removePassAction__block_invoke;
  v11 = &unk_1E3E62BD0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAttributes:", 2, v8, v9, v10, v11);
  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F60]);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

void __47__PKDashboardMoreMenuFactory__removePassAction__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v17 = WeakRetained;
    if (objc_msgSend(WeakRetained, "moreMenuType") == 1)
    {
      objc_msgSend(v17, "pass");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "navigationDashboardPassVC");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "navigationDashboardPassVC");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPassDeleteHelper presentDeleteBarcodePassAlertForPass:withHandler:presentingViewController:](PKPassDeleteHelper, "presentDeleteBarcodePassAlertForPass:withHandler:presentingViewController:", v2, v3, v4);

    }
    objc_msgSend(v17, "pass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "hasMerchantTokens");
    objc_msgSend(v17, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v17, "navigationDashboardPassVC");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(MEMORY[0x1E0D66F18]);
      objc_msgSend(v17, "navigationDashboardPassVC");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "navigationDashboardPassVC");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = 0;
      +[PKPassDeleteHelper presentMerchantTokenDeletePaymentPassAlertForPass:withAccount:merchantTokensResponse:deleteHander:passLibraryDataProvider:navigationController:presentingViewController:isBridge:](PKPassDeleteHelper, "presentMerchantTokenDeletePaymentPassAlertForPass:withAccount:merchantTokensResponse:deleteHander:passLibraryDataProvider:navigationController:presentingViewController:isBridge:", v6, v8, 0, v9, v10, v11, v12, v16);

    }
    else
    {
      v14 = v17[3];
      v13 = v17[4];
      v15 = v17[2];
      objc_msgSend(v17, "navigationDashboardPassVC");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(MEMORY[0x1E0D66F18]);
      objc_msgSend(v17, "navigationDashboardPassVC");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPassDeleteHelper presentDeletePaymentPassAlertForPass:withAccount:paymentServiceDataProvider:transitBalanceModel:transitPassProperties:fkInstitution:detailViewStyle:deleteHander:passLibraryDataProvider:presentingViewController:](PKPassDeleteHelper, "presentDeletePaymentPassAlertForPass:withAccount:paymentServiceDataProvider:transitBalanceModel:transitPassProperties:fkInstitution:detailViewStyle:deleteHander:passLibraryDataProvider:presentingViewController:", v6, v8, v15, v13, v14, 0, 0, v9, v10, v11);
    }

    WeakRetained = v17;
  }

}

- (id)_addMoneyPeerPaymentAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_ADD_MONEY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("dollarsign.circle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PKDashboardMoreMenuFactory__addMoneyPeerPaymentAction__block_invoke;
  v8[3] = &unk_1E3E659D0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67850]);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __56__PKDashboardMoreMenuFactory__addMoneyPeerPaymentAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentPeerPaymentActionViewControllerForAction:pass:passLibraryDataProvider:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

    WeakRetained = v4;
  }

}

- (id)_transferToBankAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_TRANSFER_TO_BANK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrowshape.turn.up.right"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PKDashboardMoreMenuFactory__transferToBankAction__block_invoke;
  v8[3] = &unk_1E3E659D0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68160]);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __51__PKDashboardMoreMenuFactory__transferToBankAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentPeerPaymentActionViewControllerForAction:pass:passLibraryDataProvider:", 2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

    WeakRetained = v4;
  }

}

- (id)_peerPaymentFamilyAction
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id location;

  -[PKFamilyMemberCollection familyMembersByAltDSID](self->_familyCollection, "familyMembersByAltDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount altDSID](self->_peerPaymentAccount, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isOrganizer") & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend(v5, "isParent") ^ 1;
  v7 = -[PKPeerPaymentAccount role](self->_peerPaymentAccount, "role");
  v8 = -[PKPeerPaymentAccount supportsFamilySharing](self->_peerPaymentAccount, "supportsFamilySharing");
  v9 = 0;
  if (!v7 && v8 && (v6 & 1) == 0)
  {
    -[PKFamilyMemberCollection familyMembers](self->_familyCollection, "familyMembers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPeerPaymentFamilyMemberRowModel sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:peerPaymentAccount:](PKPeerPaymentFamilyMemberRowModel, "sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:peerPaymentAccount:", v10, self->_peerPaymentAccount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      objc_initWeak(&location, self);
      v12 = (void *)MEMORY[0x1E0DC3428];
      PKLocalizedPeerPaymentLexingtonString(CFSTR("MORE_MENU_FAMILY_SHARING"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.2"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __54__PKDashboardMoreMenuFactory__peerPaymentFamilyAction__block_invoke;
      v16[3] = &unk_1E3E659D0;
      objc_copyWeak(&v17, &location);
      v16[4] = self;
      objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v13, v14, 0, v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67BC8]);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);

    }
    else
    {

      v9 = 0;
    }
  }

  return v9;
}

void __54__PKDashboardMoreMenuFactory__peerPaymentFamilyAction__block_invoke(uint64_t a1)
{
  PKPeerPaymentFamilySettingsViewController *v2;
  void *v3;
  PKPeerPaymentFamilySettingsViewController *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [PKPeerPaymentFamilySettingsViewController alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "paymentPass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PKPeerPaymentFamilySettingsViewController initWithPass:dataProvider:peerPaymentAccount:familyCollection:](v2, "initWithPass:dataProvider:peerPaymentAccount:familyCollection:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));

    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v4, 1);

  }
}

- (id)_recurringPeerPaymentsPaymentsAction
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  -[PKFamilyMemberCollection currentUser](self->_familyCollection, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass secureElementPass](self->_pass, "secureElementPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devicePrimaryPaymentApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if (!-[PKPeerPaymentAccount supportsRecurringPayments](self->_peerPaymentAccount, "supportsRecurringPayments"))
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v7 = 0;
  if (-[PKPeerPaymentAccount isEligibleForRecurringPaymentsForUser:](self->_peerPaymentAccount, "isEligibleForRecurringPaymentsForUser:", v3)&& v6 != 7)
  {
    if ((PKIsVision() & 1) == 0)
    {
      objc_initWeak(&location, self);
      v9 = (void *)MEMORY[0x1E0DC3428];
      PKLocalizedPeerPaymentRecurringString(CFSTR("DASHBOARD_MORE_MENU_RECURRING_PAYMENTS"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("clock.arrow.2.circlepath"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __66__PKDashboardMoreMenuFactory__recurringPeerPaymentsPaymentsAction__block_invoke;
      v15 = &unk_1E3E62BD0;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v11, 0, &v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F48], v12, v13, v14, v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

void __66__PKDashboardMoreMenuFactory__recurringPeerPaymentsPaymentsAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentPeerPaymentRecurringPaymentsWithIdentifier:completion:", 0, 0);

    WeakRetained = v3;
  }

}

- (id)_savingsDetailsAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("info.circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __51__PKDashboardMoreMenuFactory__savingsDetailsAction__block_invoke;
  v10 = &unk_1E3E62BD0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __51__PKDashboardMoreMenuFactory__savingsDetailsAction__block_invoke(uint64_t a1)
{
  PKAccountViewInterfaceConfiguration *v1;
  void *v2;
  PKSavingsAccountDetailsViewController *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    objc_msgSend(WeakRetained, "account");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountViewInterfaceConfiguration setAccount:](v1, "setAccount:", v2);

    -[PKAccountViewInterfaceConfiguration setViewStyle:](v1, "setViewStyle:", 0);
    v3 = -[PKSavingsAccountDetailsViewController initWithConfiguration:]([PKSavingsAccountDetailsViewController alloc], "initWithConfiguration:", v1);
    objc_msgSend(WeakRetained, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pushViewController:animated:", v3, 1);

  }
}

- (id)_showSavingsDocumentsAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.plaintext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __57__PKDashboardMoreMenuFactory__showSavingsDocumentsAction__block_invoke;
  v10 = &unk_1E3E62BD0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B08], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __57__PKDashboardMoreMenuFactory__showSavingsDocumentsAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  PKAccountDocumentsViewInterfaceConfiguration *v2;
  void *v3;
  void *v4;
  PKAccountDocumentsViewController *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(PKAccountDocumentsViewInterfaceConfiguration);
    objc_msgSend(WeakRetained, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountDocumentsViewInterfaceConfiguration setAccounts:](v2, "setAccounts:", v4);

    v5 = -[PKAccountDocumentsViewController initWithConfiguration:]([PKAccountDocumentsViewController alloc], "initWithConfiguration:", v2);
    objc_msgSend(WeakRetained, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushViewController:animated:", v5, 1);

  }
}

- (id)_showAccountManageNotifications
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("DASHBOARD_MORE_MENU_MANAGE_NOTIFICATIONS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("bell.badge"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __61__PKDashboardMoreMenuFactory__showAccountManageNotifications__block_invoke;
  v10 = &unk_1E3E62BD0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67DA0], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __61__PKDashboardMoreMenuFactory__showAccountManageNotifications__block_invoke(uint64_t a1)
{
  PKAccountViewInterfaceConfiguration *v1;
  void *v2;
  PKAccountManageNotificationsViewController *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    objc_msgSend(WeakRetained, "account");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountViewInterfaceConfiguration setAccount:](v1, "setAccount:", v2);

    -[PKAccountViewInterfaceConfiguration setViewStyle:](v1, "setViewStyle:", 0);
    v3 = -[PKAccountManageNotificationsViewController initWithConfiguration:]([PKAccountManageNotificationsViewController alloc], "initWithConfiguration:", v1);
    objc_msgSend(WeakRetained, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pushViewController:animated:", v3, 1);

  }
}

- (id)_showSavingsDebugAction
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if ((PKSavingsDemoAccountEnabled() & 1) != 0
    || !os_variant_has_internal_ui()
    || !PKTransactionDebugDetailsEnabled())
  {
    return 0;
  }
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __53__PKDashboardMoreMenuFactory__showSavingsDebugAction__block_invoke;
  v10 = &unk_1E3E62BD0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", CFSTR("[INTERNAL] Diagnostics"), v4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AC0], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __53__PKDashboardMoreMenuFactory__showSavingsDebugAction__block_invoke(uint64_t a1)
{
  PKAccountViewInterfaceConfiguration *v1;
  void *v2;
  PKAccountDebugViewController *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    objc_msgSend(WeakRetained, "account");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountViewInterfaceConfiguration setAccount:](v1, "setAccount:", v2);

    -[PKAccountViewInterfaceConfiguration setViewStyle:](v1, "setViewStyle:", 0);
    v3 = -[PKAccountDebugViewController initWithConfiguration:]([PKAccountDebugViewController alloc], "initWithConfiguration:", v1);
    objc_msgSend(WeakRetained, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pushViewController:animated:", v3, 1);

  }
}

- (id)_openRewardsHubAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __51__PKDashboardMoreMenuFactory__openRewardsHubAction__block_invoke;
  v10 = &unk_1E3E62BD0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F88], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __51__PKDashboardMoreMenuFactory__openRewardsHubAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && PKRewardsCenterEnabled())
  {
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentRewardsHubWithCompletion:", 0);
    v3 = *MEMORY[0x1E0D68B18];
    v4 = *MEMORY[0x1E0D68858];
    v7[0] = *MEMORY[0x1E0D68AA0];
    v7[1] = v4;
    v5 = *MEMORY[0x1E0D69858];
    v8[0] = v3;
    v8[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reportEventForPassIfNecessary:", v6);

  }
}

- (id)_showScheduledPaymentsAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("clock.arrow.2.circlepath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __58__PKDashboardMoreMenuFactory__showScheduledPaymentsAction__block_invoke;
  v10 = &unk_1E3E62BD0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FD0], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __58__PKDashboardMoreMenuFactory__showScheduledPaymentsAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentScheduledPayments");

    WeakRetained = v3;
  }

}

- (id)_showInstallmentPlansAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar.badge.clock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __57__PKDashboardMoreMenuFactory__showInstallmentPlansAction__block_invoke;
  v10 = &unk_1E3E62BD0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C98], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __57__PKDashboardMoreMenuFactory__showInstallmentPlansAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentInstallmentPlans");

    WeakRetained = v3;
  }

}

- (id)_addMoneyAppleBalanceAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("dollarsign.circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __57__PKDashboardMoreMenuFactory__addMoneyAppleBalanceAction__block_invoke;
  v10 = &unk_1E3E62BD0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67850], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __57__PKDashboardMoreMenuFactory__addMoneyAppleBalanceAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentAddMoneyAppleBalance");

    WeakRetained = v3;
  }

}

- (id)_redeemAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("giftcard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __43__PKDashboardMoreMenuFactory__redeemAction__block_invoke;
  v10 = &unk_1E3E62BD0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F50], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __43__PKDashboardMoreMenuFactory__redeemAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentRedeemGiftcard");

    WeakRetained = v3;
  }

}

- (id)_showHasHomeGuestAccessScheduleAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedHomeKitUWBString(CFSTR("PASS_DETAILS_SHOW_ACCESS_SCHEDULE_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PKDashboardMoreMenuFactory__showHasHomeGuestAccessScheduleAction__block_invoke;
  v7[3] = &unk_1E3E62BD0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

void __67__PKDashboardMoreMenuFactory__showHasHomeGuestAccessScheduleAction__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentRestrictedGuestAccessScheduleWithHomeIdentifier:", v3[16]);

    WeakRetained = v3;
  }

}

- (void)setPass:(id)a3
{
  PKIdentityReplaceFingerprintHelper *v5;
  void *v6;
  PKIdentityReplaceFingerprintHelper *v7;
  PKIdentityReplaceFingerprintHelper *fingerprintHelper;
  void *v9;
  void *v10;
  void *v11;
  PKPeerPaymentAccount *v12;
  PKPeerPaymentAccount *peerPaymentAccount;
  id v14;

  v14 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_pass, a3);
    -[PKDashboardMoreMenuFactory _reevaluateMoreMenuType](self, "_reevaluateMoreMenuType");
    if (self->_moreMenuType == 3)
    {
      v5 = [PKIdentityReplaceFingerprintHelper alloc];
      objc_msgSend(v14, "secureElementPass");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PKIdentityReplaceFingerprintHelper initWithPass:isRemote:](v5, "initWithPass:isRemote:", v6, 0);
      fingerprintHelper = self->_fingerprintHelper;
      self->_fingerprintHelper = v7;

    }
    else
    {
      v6 = self->_fingerprintHelper;
      self->_fingerprintHelper = 0;
    }

    -[PKDashboardMoreMenuFactory _recalculateTransitPassDetails](self, "_recalculateTransitPassDetails");
    if (-[PKDashboardMoreMenuFactory _isPeerPaymentPass](self, "_isPeerPaymentPass"))
    {
      objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "targetDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!self->_peerPaymentAccount)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__peerPaymentAccountChanged_, *MEMORY[0x1E0D6B2B8], v10);

      }
      objc_msgSend(v10, "account");
      v12 = (PKPeerPaymentAccount *)objc_claimAutoreleasedReturnValue();
      peerPaymentAccount = self->_peerPaymentAccount;
      self->_peerPaymentAccount = v12;

    }
  }

}

- (void)setAccount:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_account, a3);
    -[PKDashboardMoreMenuFactory _reevaluateMoreMenuType](self, "_reevaluateMoreMenuType");
  }

}

- (void)_reevaluateMoreMenuType
{
  self->_moreMenuType = -[PKDashboardMoreMenuFactory _moreMenuTypeValue](self, "_moreMenuTypeValue");
}

- (int64_t)_moreMenuTypeValue
{
  PKAccount *account;
  PKPass *pass;
  int64_t v5;
  PKPass *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  pass = self->_pass;
  account = self->_account;
  if ((unint64_t)pass | (unint64_t)account)
  {
    if (-[PKAccount type](account, "type") == 4)
      return 7;
    v6 = self->_pass;
    if (v6)
    {
      if (-[PKPass passType](v6, "passType") == PKPassTypeBarcode)
        return 1;
      -[PKPass secureElementPass](self->_pass, "secureElementPass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7)
      {
        v5 = 0;
        goto LABEL_31;
      }
      if ((objc_msgSend(v7, "isTransitPass") & 1) != 0)
      {
        v5 = 4;
LABEL_31:

        return v5;
      }
      if ((objc_msgSend(v8, "isEMoneyPass") & 1) != 0)
      {
        v5 = 6;
        goto LABEL_31;
      }
      if ((objc_msgSend(v8, "isAccessPass") & 1) != 0)
      {
        v5 = 5;
        goto LABEL_31;
      }
      if (-[PKDashboardMoreMenuFactory _isCreditPass](self, "_isCreditPass"))
      {
        v5 = 8;
        goto LABEL_31;
      }
      if (-[PKDashboardMoreMenuFactory _isPeerPaymentPass](self, "_isPeerPaymentPass"))
      {
        v5 = 9;
        goto LABEL_31;
      }
      if (-[PKDashboardMoreMenuFactory _isPayLaterPass](self, "_isPayLaterPass"))
      {
        v5 = 10;
        goto LABEL_31;
      }
      if (-[PKDashboardMoreMenuFactory _isAppleBalancePass](self, "_isAppleBalancePass"))
      {
        v5 = 11;
        goto LABEL_31;
      }
      objc_msgSend(v8, "associatedAccountServiceAccountIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (objc_msgSend(v8, "cardType") == 1)
      {
        if (v10)
          goto LABEL_26;
      }
      else if (objc_msgSend(v8, "cardType") | v10)
      {
LABEL_26:
        if (objc_msgSend(v8, "isIdentityPass"))
          v5 = 3;
        else
          v5 = 0;
        goto LABEL_31;
      }
      v5 = 2;
      goto LABEL_31;
    }
  }
  return 0;
}

- (id)_showPassInfoLocalizedTitle
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  switch(-[PKDashboardMoreMenuFactory moreMenuType](self, "moreMenuType"))
  {
    case 2:
      v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_PAYMENT_PASS_INFO");
      goto LABEL_13;
    case 3:
      v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_IDENTITY_PASS_INFO");
      goto LABEL_13;
    case 4:
      v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_TRANSIT_PASS_INFO");
      goto LABEL_13;
    case 5:
      -[PKPass secureElementPass](self->_pass, "secureElementPass");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "accessType");

      switch(v5)
      {
        case 1:
          v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_ACCESS_PASS_HOSPITALITY_INFO");
          break;
        case 2:
          v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_ACCESS_PASS_CORPORATE_INFO");
          break;
        case 3:
          v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_ACCESS_PASS_HOME_INFO");
          break;
        case 4:
          v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_ACCESS_PASS_CAR_INFO");
          break;
        case 5:
          v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_ACCESS_PASS_MULTI_FAMILY_HOME_INFO");
          break;
        case 6:
          v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_ACCESS_PASS_URBAN_MOBILITY");
          break;
        default:
          v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_GENERIC_CARD_INFO");
          break;
      }
      goto LABEL_13;
    case 6:
      v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_EMONEY_PASS_INFO");
      goto LABEL_13;
    case 8:
      v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_APPLE_CARD_PASS_INFO");
      goto LABEL_13;
    case 9:
      v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_APPLE_CASH_PASS_INFO");
      goto LABEL_13;
    case 10:
      PKLocalizedCocoonString(CFSTR("DASHBOARD_MORE_MENU_SHOW_PAY_LATER_PASS_INFO"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    case 11:
      PKLocalizedLynxString(CFSTR("DASHBOARD_MORE_MENU_SHOW_APPLE_BALANCE_PASS_INFO"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    default:
      v3 = CFSTR("DASHBOARD_MORE_MENU_SHOW_GENERIC_PASS_INFO");
LABEL_13:
      PKLocalizedString(&v3->isa);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
  }
}

- (id)_removePassLocalizedTitle
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  switch(-[PKDashboardMoreMenuFactory moreMenuType](self, "moreMenuType"))
  {
    case 2:
      v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_PAYMENT_PASS");
      goto LABEL_11;
    case 3:
      v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_IDENTITY_PASS");
      goto LABEL_11;
    case 4:
      v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_TRANSIT_PASS");
      goto LABEL_11;
    case 5:
      -[PKPass secureElementPass](self->_pass, "secureElementPass");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "accessType");

      switch(v5)
      {
        case 1:
          v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_ACCESS_PASS_HOSPITALITY");
          break;
        case 2:
          v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_ACCESS_PASS_CORPORATE");
          break;
        case 3:
          v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_ACCESS_PASS_HOME");
          break;
        case 4:
          v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_ACCESS_PASS_CAR");
          break;
        case 5:
          v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_ACCESS_PASS_MULTI_FAMILY_HOME");
          break;
        case 6:
          v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_ACCESS_PASS_URBAN_MOBILITY");
          break;
        default:
          v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_GENERIC_CARD");
          break;
      }
      goto LABEL_11;
    case 6:
      v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_EMONEY_PASS");
      goto LABEL_11;
    case 8:
      v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_APPLE_CARD_PASS");
      goto LABEL_11;
    case 9:
      v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_APPLE_CASH_PASS");
      goto LABEL_11;
    case 11:
      PKLocalizedLynxString(CFSTR("DASHBOARD_MORE_MENU_REMOVE_APPLE_BALANCE_PASS"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    default:
      v3 = CFSTR("DASHBOARD_MORE_MENU_REMOVE_GENERIC_PASS");
LABEL_11:
      PKLocalizedString(&v3->isa);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
  }
}

- (BOOL)_canShowNotificationsInfo
{
  PKPassType v3;
  void *v5;
  PKPaymentDefaultDataProvider *paymentServiceDataProvider;
  PKPeerPaymentAccount *peerPaymentAccount;
  FKAccount *bankConnectAccount;
  void *v9;
  BOOL v10;

  v3 = -[PKPass passType](self->_pass, "passType");
  if (v3 == PKPassTypeSecureElement)
  {
    -[PKPass paymentPass](self->_pass, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    peerPaymentAccount = self->_peerPaymentAccount;
    bankConnectAccount = self->_bankConnectAccount;
    -[PKDashboardMoreMenuFactory account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[PKManagePaymentPassNotificationsViewController canShowForPass:dataProvider:peerPaymentAccount:bankConnectAccount:account:](PKManagePaymentPassNotificationsViewController, "canShowForPass:dataProvider:peerPaymentAccount:bankConnectAccount:account:", v5, paymentServiceDataProvider, peerPaymentAccount, bankConnectAccount, v9);

    return v10;
  }
  else
  {
    return v3 == PKPassTypeBarcode
        && +[PKManageBarcodePassNotificationsViewController canShowForPass:](PKManageBarcodePassNotificationsViewController, "canShowForPass:", self->_pass);
  }
}

- (void)_recalculateTransitPassDetails
{
  void *v3;
  void *v4;
  PKTransitPassProperties *v5;
  PKTransitPassProperties *v6;
  PKTransitBalanceModel *v7;
  PKTransitBalanceModel *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char v12;
  uint64_t v13;
  PKPaymentDefaultDataProvider *paymentServiceDataProvider;
  void *v15;
  char v16;
  PKPaymentDefaultDataProvider *v17;
  PKPaymentDefaultDataProvider *v18;
  id v19;
  PKTransitPassProperties *transitPassProperties;
  PKTransitBalanceModel *transitBalanceModel;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  id v27;
  id location;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD *v31;
  _QWORD v32[4];
  NSObject *v33;
  _QWORD *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  NSObject *v38;
  _QWORD *v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;

  -[PKPass paymentPass](self->_pass, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "isStoredValuePass") & 1) == 0)
  {
    transitPassProperties = self->_transitPassProperties;
    self->_transitPassProperties = 0;

    transitBalanceModel = self->_transitBalanceModel;
    self->_transitBalanceModel = 0;

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D67748], "passPropertiesForPass:", v4);
  v5 = (PKTransitPassProperties *)objc_claimAutoreleasedReturnValue();
  v6 = self->_transitPassProperties;
  self->_transitPassProperties = v5;

  v7 = (PKTransitBalanceModel *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", v4);
  v8 = self->_transitBalanceModel;
  self->_transitBalanceModel = v7;

  -[PKTransitBalanceModel setTransitProperties:andApplyStoredValueBalances:](self->_transitBalanceModel, "setTransitProperties:andApplyStoredValueBalances:", self->_transitPassProperties, 1);
  objc_msgSend(v4, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devicePrimaryPaymentApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_group_create();
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__22;
  v44[4] = __Block_byref_object_dispose__22;
  v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__22;
  v42[4] = __Block_byref_object_dispose__22;
  v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__22;
  v40[4] = __Block_byref_object_dispose__22;
  v41 = 0;
  v12 = objc_opt_respondsToSelector();
  v13 = MEMORY[0x1E0C809B0];
  if ((v12 & 1) != 0)
  {
    dispatch_group_enter(v11);
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    v35[0] = v13;
    v35[1] = 3221225472;
    v35[2] = __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke;
    v35[3] = &unk_1E3E69088;
    v39 = v44;
    v36 = v10;
    v37 = v4;
    v38 = v11;
    -[PKPaymentDefaultDataProvider transitStateWithPassUniqueIdentifier:paymentApplication:completion:](paymentServiceDataProvider, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v9, v36, v35);

  }
  objc_msgSend(v4, "balanceFields");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
    goto LABEL_8;
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    dispatch_group_enter(v11);
    v17 = self->_paymentServiceDataProvider;
    v32[0] = v13;
    v32[1] = 3221225472;
    v32[2] = __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke_2;
    v32[3] = &unk_1E3E690B0;
    v34 = v42;
    v33 = v11;
    -[PKPaymentDefaultDataProvider balancesForPaymentPassWithUniqueIdentifier:completion:](v17, "balancesForPaymentPassWithUniqueIdentifier:completion:", v9, v32);
    v15 = v33;
LABEL_8:

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(v11);
    v18 = self->_paymentServiceDataProvider;
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke_3;
    v29[3] = &unk_1E3E633C0;
    v31 = v40;
    v30 = v11;
    -[PKPaymentDefaultDataProvider plansForPaymentPassWithUniqueIdentifier:completion:](v18, "plansForPaymentPassWithUniqueIdentifier:completion:", v9, v29);

  }
  objc_initWeak(&location, self);
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke_4;
  v22[3] = &unk_1E3E6B8F0;
  objc_copyWeak(&v27, &location);
  v23 = v9;
  v24 = v44;
  v25 = v42;
  v26 = v40;
  v19 = v9;
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);

LABEL_13:
}

void __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "transitPassPropertiesWithPaymentApplication:pass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[12], "paymentPass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      objc_storeStrong(v5 + 3, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      objc_msgSend(v5[4], "setTransitProperties:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      objc_msgSend(v5[4], "setDynamicBalances:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v5[4], "updateWithDynamicCommutePlans:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      objc_msgSend(v5, "_reloadMoreMenuItems");
    }

    WeakRetained = v5;
  }

}

- (BOOL)_isCreditPass
{
  return -[PKDashboardMoreMenuFactory _feature](self, "_feature") == 2;
}

- (BOOL)_isPeerPaymentPass
{
  return -[PKDashboardMoreMenuFactory _feature](self, "_feature") == 1;
}

- (BOOL)_isPayLaterPass
{
  return -[PKDashboardMoreMenuFactory _feature](self, "_feature") == 3;
}

- (BOOL)_isAppleBalancePass
{
  return -[PKDashboardMoreMenuFactory _feature](self, "_feature") == 4;
}

- (unint64_t)_feature
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PKDashboardMoreMenuFactory pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PKAccount feature](self->_account, "feature");
  if (!v5)
  {
    v5 = objc_msgSend(v4, "associatedAccountFeatureIdentifier");
    if (!v5)
      v5 = objc_msgSend(v4, "hasAssociatedPeerPaymentAccount");
  }

  return v5;
}

- (id)_passActions
{
  void *v2;
  void *v3;
  void *v4;

  -[PKDashboardMoreMenuFactory pass](self, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "availableActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_isPassActivating
{
  void *v2;
  void *v3;

  -[PKDashboardMoreMenuFactory pass](self, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "activationState") == 2;
  return (char)v2;
}

- (BOOL)_isPassActivated
{
  void *v2;
  void *v3;

  -[PKDashboardMoreMenuFactory pass](self, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "activationState") == 0;
  return (char)v2;
}

- (BOOL)_isPassRequiresActivation
{
  void *v2;
  void *v3;

  -[PKDashboardMoreMenuFactory pass](self, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "activationState") == 1;
  return (char)v2;
}

- (BOOL)_hasValidEnteredValueActions
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[PKDashboardMoreMenuFactory _isPassActivated](self, "_isPassActivated"))
    return 0;
  -[PKDashboardMoreMenuFactory _passActions](self, "_passActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_240);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "unavailableActionBehavior", (_QWORD)v12) & 4) != 0)
        {

          v10 = 0;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }

  v10 = objc_msgSend(v5, "count") != 0;
LABEL_13:

  return v10;
}

BOOL __58__PKDashboardMoreMenuFactory__hasValidEnteredValueActions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 1;
}

- (BOOL)_hasCombinedActions
{
  _BOOL4 v3;

  v3 = -[PKDashboardMoreMenuFactory _hasValidSelectedItemActions](self, "_hasValidSelectedItemActions");
  if (v3)
    LOBYTE(v3) = -[PKDashboardMoreMenuFactory _hasGroupActions](self, "_hasGroupActions");
  return v3;
}

- (BOOL)_hasValidSelectedItemActions
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[PKDashboardMoreMenuFactory _isPassActivated](self, "_isPassActivated"))
    return 0;
  -[PKTransitBalanceModel displayableCommutePlanActions](self->_transitBalanceModel, "displayableCommutePlanActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_241);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count") != 0;
  return v5;
}

BOOL __58__PKDashboardMoreMenuFactory__hasValidSelectedItemActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") == 2
    && objc_msgSend(v2, "isActionAvailable")
    && (objc_msgSend(v2, "unavailableActionBehavior") & 4) == 0;

  return v3;
}

- (BOOL)_hasGroupActions
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[PKDashboardMoreMenuFactory _isPassActivated](self, "_isPassActivated"))
    return 0;
  -[PKDashboardMoreMenuFactory pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "actionGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (BOOL)_hasTransitCardNumber
{
  void *v4;
  BOOL v5;

  if (-[PKDashboardMoreMenuFactory _isPassActivating](self, "_isPassActivating"))
    return 0;
  -[PKPass paymentPass](self->_pass, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PKTransitCardNumberViewController canShowForPass:expressPassController:](PKTransitCardNumberViewController, "canShowForPass:expressPassController:", v4, self->_expressPassController);

  return v5;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  PKPass *pass;
  id v8;
  void *v9;
  int v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  pass = self->_pass;
  v8 = a3;
  -[PKPass uniqueID](pass, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __97__PKDashboardMoreMenuFactory_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

uint64_t __97__PKDashboardMoreMenuFactory_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setTransitProperties:", *(_QWORD *)(a1 + 40));
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6;
  PKPass *pass;
  id v8;
  void *v9;
  int v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  pass = self->_pass;
  v8 = a3;
  -[PKPass uniqueID](pass, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__PKDashboardMoreMenuFactory_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

uint64_t __83__PKDashboardMoreMenuFactory_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "updateWithDynamicCommutePlans:", *(_QWORD *)(a1 + 40));
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  PKPass *pass;
  id v8;
  void *v9;
  int v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  pass = self->_pass;
  v8 = a3;
  -[PKPass uniqueID](pass, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__PKDashboardMoreMenuFactory_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

uint64_t __86__PKDashboardMoreMenuFactory_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDynamicBalances:", *(_QWORD *)(a1 + 40));
}

- (void)_reloadMoreMenuItems
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "menuFactoryDidUpdateMenu:", self);

}

- (void)_peerPaymentAccountChanged:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PKDashboardMoreMenuFactory__peerPaymentAccountChanged___block_invoke;
  v3[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __57__PKDashboardMoreMenuFactory__peerPaymentAccountChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "_isPeerPaymentPass");
    v2 = v8;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "targetDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "account");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v8[9];
      v8[9] = v6;

      objc_msgSend(v8, "_reloadMoreMenuItems");
      v2 = v8;
    }
  }

}

- (void)accountChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PKDashboardMoreMenuFactory_accountChanged___block_invoke;
  block[3] = &unk_1E3E61B68;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __45__PKDashboardMoreMenuFactory_accountChanged___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v8[13], "accountIdentifier");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = v3;
      v6 = v5;
      if (v4 == v5)
      {

      }
      else
      {
        if (!v4)
        {

          goto LABEL_10;
        }
        v7 = objc_msgSend(v4, "isEqualToString:", v5);

        if (!v7)
          goto LABEL_10;
      }
      objc_storeStrong(v8 + 13, *(id *)(a1 + 32));
    }
LABEL_10:

    WeakRetained = v8;
  }

}

- (PKPass)pass
{
  return self->_pass;
}

- (PKAccount)account
{
  return self->_account;
}

- (FKAccount)bankConnectAccount
{
  return self->_bankConnectAccount;
}

- (void)setBankConnectAccount:(id)a3
{
  objc_storeStrong((id *)&self->_bankConnectAccount, a3);
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
{
  objc_storeStrong((id *)&self->_familyCollection, a3);
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (void)setPeerPaymentAccount:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
}

- (BOOL)homeKitHasHomeGuestAccessSchedule
{
  return self->_homeKitHasHomeGuestAccessSchedule;
}

- (void)setHomeKitHasHomeGuestAccessSchedule:(BOOL)a3
{
  self->_homeKitHasHomeGuestAccessSchedule = a3;
}

- (NSUUID)homeKitHomeIdentifier
{
  return self->_homeKitHomeIdentifier;
}

- (void)setHomeKitHomeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitHomeIdentifier, a3);
}

- (PKNavigationDashboardPassViewController)navigationDashboardPassVC
{
  return (PKNavigationDashboardPassViewController *)objc_loadWeakRetained((id *)&self->_navigationDashboardPassVC);
}

- (void)setNavigationDashboardPassVC:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDashboardPassVC, a3);
}

- (PKDashboardMoreMenuFactoryDelegate)delegate
{
  return (PKDashboardMoreMenuFactoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)forceShowMoreMenuIcon
{
  return self->_forceShowMoreMenuIcon;
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (int64_t)moreMenuType
{
  return self->_moreMenuType;
}

- (void)setMoreMenuType:(int64_t)a3
{
  self->_moreMenuType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_navigationDashboardPassVC);
  objc_storeStrong((id *)&self->_homeKitHomeIdentifier, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_bankConnectAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_expressPassController, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_transitPassProperties, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_fingerprintHelper, 0);
}

@end
