@implementation PKPaymentPassDetailsNotificationSettingsSectionController

+ (BOOL)validForPaymentPass:(id)a3
{
  return 1;
}

- (PKPaymentPassDetailsNotificationSettingsSectionController)init
{

  return 0;
}

- (PKPaymentPassDetailsNotificationSettingsSectionController)initWithPass:(id)a3 peerPaymentAccount:(id)a4 bankConnectAccount:(id)a5 account:(id)a6 paymentDataProvider:(id)a7 transactionSourceCollection:(id)a8 detailViewStyle:(int64_t)a9 delegate:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  PKPaymentPassDetailsNotificationSettingsSectionController *v21;
  PKPaymentPassDetailsNotificationSettingsSectionController *v22;
  uint64_t v23;
  PKPaymentApplication *paymentApplication;
  void *v25;
  void *v26;
  id v28;
  id obj;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v17 = a3;
  v18 = a4;
  v28 = a5;
  v19 = a5;
  v32 = a6;
  v31 = a7;
  v30 = a8;
  v20 = a10;
  v33.receiver = self;
  v33.super_class = (Class)PKPaymentPassDetailsNotificationSettingsSectionController;
  v21 = -[PKPaymentPassDetailSectionController init](&v33, sel_init);
  v22 = v21;
  if (v21)
  {
    obj = v20;
    objc_storeStrong((id *)&v21->_pass, a3);
    -[PKPaymentPass devicePrimaryPaymentApplication](v22->_pass, "devicePrimaryPaymentApplication");
    v23 = objc_claimAutoreleasedReturnValue();
    paymentApplication = v22->_paymentApplication;
    v22->_paymentApplication = (PKPaymentApplication *)v23;

    objc_msgSend((id)objc_opt_class(), "_updatedPeerPaymentAccountForPeerPaymentAccount:pass:", v18, v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      objc_storeStrong((id *)&v22->_peerPaymentAccount, a4);
    objc_storeStrong((id *)&v22->_paymentDataProvider, a7);
    objc_storeStrong((id *)&v22->_transactionSourceCollection, a8);
    objc_storeStrong((id *)&v22->_account, a6);
    v22->_detailViewStyle = a9;
    objc_storeWeak((id *)&v22->_delegate, obj);
    if (-[PKPaymentPassDetailsNotificationSettingsSectionController _shouldShowBankConnectData](v22, "_shouldShowBankConnectData"))
    {
      objc_storeStrong((id *)&v22->_bankConnectAccount, v28);
    }
    -[PKPaymentPassDetailsNotificationSettingsSectionController fetchAuthorizationStatusWithCompletion:](v22, "fetchAuthorizationStatusWithCompletion:", 0);
    PKObservePassSettingsChanged();
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v22, sel__passSettingsChanged_, *MEMORY[0x1E0D6A7C0], 0);

    v20 = obj;
  }

  return v22;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  PKUnregisterPassSettingsChangedObserver();
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D6A7C0], 0);

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPassDetailsNotificationSettingsSectionController;
  -[PKPaymentPassDetailsNotificationSettingsSectionController dealloc](&v4, sel_dealloc);
}

- (void)fetchAuthorizationStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D67768], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__PKPaymentPassDetailsNotificationSettingsSectionController_fetchAuthorizationStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E3E6F588;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "authorizationStatusWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __100__PKPaymentPassDetailsNotificationSettingsSectionController_fetchAuthorizationStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__PKPaymentPassDetailsNotificationSettingsSectionController_fetchAuthorizationStatusWithCompletion___block_invoke_2;
    block[3] = &unk_1E3E6F560;
    block[4] = WeakRetained;
    v8 = a2;
    v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

_QWORD *__100__PKPaymentPassDetailsNotificationSettingsSectionController_fetchAuthorizationStatusWithCompletion___block_invoke_2(_QWORD *result)
{
  uint64_t v1;

  *(_QWORD *)(result[4] + 128) = result[6];
  v1 = result[5];
  if (v1)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(result[5], *(_QWORD *)(result[4] + 128));
  return result;
}

- (void)setTransactionsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[PKPaymentPassDetailsNotificationSettingsSectionController _cellForType:](self, "_cellForType:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settingSwitch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOn:", v3);

}

- (id)allSectionIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("NotificationsSectionIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionIdentifiers
{
  void *v3;

  if (-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment")
    || !-[PKPaymentPassDetailsNotificationSettingsSectionController _shouldMapSection](self, "_shouldMapSection"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PKPaymentPassDetailsNotificationSettingsSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  if (PKEqualObjects())
  {
    if (self->_peerPaymentAccount)
    {
      -[PKPaymentPassDetailsNotificationSettingsSectionController _peerPaymentNotificationsSwitchCellForIndexPath:tableView:](self, "_peerPaymentNotificationsSwitchCellForIndexPath:tableView:", v8, v7);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_pass, "associatedAccountServiceAccountIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12)
        -[PKPaymentPassDetailsNotificationSettingsSectionController _accountServiceNotificationsSwitchCellForIndexPath:tableView:](self, "_accountServiceNotificationsSwitchCellForIndexPath:tableView:", v8, v7);
      else
        -[PKPaymentPassDetailsNotificationSettingsSectionController _transactionsSwitchCellForIndexPath:tableView:](self, "_transactionsSwitchCellForIndexPath:tableView:", v8, v7);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_indexPathForRowType:(int64_t)a3
{
  PKPeerPaymentAccount *peerPaymentAccount;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  id WeakRetained;
  uint64_t v11;

  peerPaymentAccount = self->_peerPaymentAccount;
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = a3 != 0;
  if (!a3)
    v4 = 0;
  if (a3 == 2)
  {
    v5 = 0;
    v4 = 1;
  }
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = a3 != 0;
  if (!a3)
    v6 = 0;
  if (a3 == 1)
  {
    v7 = 0;
    v6 = 1;
  }
  if (peerPaymentAccount)
    v8 = v7;
  else
    v8 = v5;
  if (peerPaymentAccount)
    v9 = v6;
  else
    v9 = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_msgSend(WeakRetained, "indexOfSectionIdentifier:", CFSTR("NotificationsSectionIdentifier"));

  if (v8)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id WeakRetained;

  if (PKEqualObjects())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didSelectEditNotificationSettings:", self);

  }
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  void *v3;
  void *v5;
  uint64_t v6;

  if (self->_peerPaymentAccount)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_NOTIFICATIONS_SWITCHES_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_pass, "associatedAccountServiceAccountIdentifier", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      -[PKPaymentPassDetailsNotificationSettingsSectionController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("TRANSACTIONS_HEADER"));
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend((id)objc_opt_class(), "_showsTransactionHistorySwitchForPass:peerPaymentAccount:bankConnectAccount:account:", self->_pass, self->_peerPaymentAccount, self->_bankConnectAccount, self->_account))
  {
    -[PKPaymentPass organizationName](self->_pass, "organizationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("TRANSACTIONS_SERVICE_FOOTER"), CFSTR("%@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)shouldDrawTopSeparatorForSectionIdentifier:(id)a3
{
  return 1;
}

- (BOOL)shouldDrawBottomSeparatorForSectionIdentifier:(id)a3
{
  return 1;
}

- (int64_t)_countOfRows
{
  return objc_msgSend((id)objc_opt_class(), "_countOfRowsForPass:peerPaymentAccount:bankConnectAccount:account:", self->_pass, self->_peerPaymentAccount, self->_bankConnectAccount, self->_account);
}

- (unint64_t)_accountFeature
{
  unint64_t result;

  result = -[PKAccount feature](self->_account, "feature");
  if (!result)
    return -[PKPaymentPass associatedAccountFeatureIdentifier](self->_pass, "associatedAccountFeatureIdentifier");
  return result;
}

+ (BOOL)_showsTransactionHistorySwitchForPass:(id)a3 peerPaymentAccount:(id)a4 bankConnectAccount:(id)a5 account:(id)a6
{
  id v9;
  BOOL v10;
  char v11;

  v9 = a3;
  if ((objc_msgSend(v9, "supportsFPANNotifications") & 1) != 0)
  {
    if ((unint64_t)a4 | (unint64_t)a6)
    {
      v10 = 0;
      goto LABEL_8;
    }
LABEL_7:
    v10 = a5 == 0;
    goto LABEL_8;
  }
  v11 = objc_msgSend(v9, "supportsDPANNotifications");
  v10 = 0;
  if (!a6 && !a4 && (v11 & 1) != 0)
    goto LABEL_7;
LABEL_8:

  return v10;
}

- (id)_peerPaymentNotificationsSwitchCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PKPaymentPassDetailsNotificationSettingsSectionController *v13;
  void *v14;
  char *v15;

  v6 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("NotificationsInfoCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  if (v8 == 1)
  {
    if (!v7)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_NOTIFICATIONS_SWITCH_DAILYCASH"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (-[PKPaymentPass settings](self->_pass, "settings") & 0x400) == 0;
      v13 = self;
      v14 = v9;
      v15 = sel__dailyCashSwitchChanged_;
      v11 = 1;
LABEL_10:
      -[PKPaymentPassDetailSectionController settingsTableCellWithTitle:action:setOn:enabled:](v13, "settingsTableCellWithTitle:action:setOn:enabled:", v14, v15, v12, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (!v8 && !v7)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_NOTIFICATIONS_SWITCH_TRANSACTIONS"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKPaymentPass settings](self->_pass, "settings");
    if ((PKStoreDemoModeEnabled() & 1) != 0)
      v11 = 0;
    else
      v11 = PKUIOnlyDemoModeEnabled() ^ 1;
    v12 = (v10 >> 3) & 1;
    v13 = self;
    v14 = v9;
    v15 = sel__transactionsSwitchChanged_;
    goto LABEL_10;
  }
  return v7;
}

- (id)_accountServiceNotificationsSwitchCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  PKPaymentPassDetailsNotificationSettingsSectionController *v15;
  void *v16;
  char *v17;
  uint64_t v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("NotificationsInfoCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "row");

  if (v9 == 1)
  {
    if (self->_notificationAuthorizationStatus == 1)
    {
      if (self->_detailViewStyle == 2)
        v13 = CFSTR("SETTINGS_ALLOW_NOTIFICATIONS_TITLE_WATCH");
      else
        v13 = CFSTR("SETTINGS_ALLOW_NOTIFICATIONS_TITLE_PHONE");
      PKLocalizedString(&v13->isa);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailSectionController linkCellWithText:forTableView:](self, "linkCellWithText:forTableView:", v10, v6);
      v18 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v18;
      goto LABEL_16;
    }
    if (!v8)
    {
      -[PKPaymentPassDetailsNotificationSettingsSectionController _accountFeature](self, "_accountFeature");
      PKLocalizedFeatureString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (-[PKPaymentPass settings](self->_pass, "settings") & 0x80) == 0;
      v15 = self;
      v16 = v10;
      v17 = sel__notificationSwitchChanged_;
      v12 = 1;
LABEL_15:
      -[PKPaymentPassDetailSectionController settingsTableCellWithTitle:action:setOn:enabled:](v15, "settingsTableCellWithTitle:action:setOn:enabled:", v16, v17, v14, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    }
  }
  else if (!v9 && !v8)
  {
    -[PKPaymentPassDetailsNotificationSettingsSectionController _accountFeature](self, "_accountFeature");
    PKLocalizedFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPaymentPass settings](self->_pass, "settings");
    if ((PKStoreDemoModeEnabled() & 1) != 0)
      v12 = 0;
    else
      v12 = PKUIOnlyDemoModeEnabled() ^ 1;
    v14 = (v11 >> 3) & 1;
    v15 = self;
    v16 = v10;
    v17 = sel__transactionsSwitchChanged_;
    goto LABEL_15;
  }

  return v8;
}

- (id)_transactionsSwitchCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  PKPaymentPassDetailsNotificationSettingsSectionController *v12;
  void *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("NotificationsInfoCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend((id)objc_opt_class(), "_showsTransactionHistorySwitchForPass:peerPaymentAccount:bankConnectAccount:account:", self->_pass, self->_peerPaymentAccount, self->_bankConnectAccount, self->_account))
  {
LABEL_4:
    if (self->_notificationAuthorizationStatus == 1)
    {
      if (self->_detailViewStyle == 2)
        v9 = CFSTR("SETTINGS_ALLOW_NOTIFICATIONS_TITLE_WATCH");
      else
        v9 = CFSTR("SETTINGS_ALLOW_NOTIFICATIONS_TITLE_PHONE");
      PKLocalizedString(&v9->isa);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailSectionController linkCellWithText:forTableView:](self, "linkCellWithText:forTableView:", v10, v7);
      v17 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v17;
      goto LABEL_17;
    }
    if (!v8)
    {
      PKLocalizedString(CFSTR("SETTINGS_SHOW_NOTIFICATIONS_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (-[PKPaymentPass settings](self->_pass, "settings") & 0x80) == 0;
      v12 = self;
      v13 = v10;
      v14 = sel__notificationSwitchChanged_;
      v15 = 1;
LABEL_16:
      -[PKPaymentPassDetailSectionController settingsTableCellWithTitle:action:setOn:enabled:](v12, "settingsTableCellWithTitle:action:setOn:enabled:", v13, v14, v11, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "row"))
  {
    if (objc_msgSend(v6, "row") != 1)
      goto LABEL_18;
    goto LABEL_4;
  }
  if (!v8)
  {
    PKLocalizedPaymentString(CFSTR("TRANSACTIONS_SERVICE_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKPaymentPass settings](self->_pass, "settings");
    if ((PKStoreDemoModeEnabled() & 1) != 0)
      v15 = 0;
    else
      v15 = PKUIOnlyDemoModeEnabled() ^ 1;
    v11 = (v16 >> 3) & 1;
    v12 = self;
    v13 = v10;
    v14 = sel__transactionsSwitchChanged_;
    goto LABEL_16;
  }
LABEL_18:

  return v8;
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
  id WeakRetained;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
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
    v16 = CFSTR("transactions");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE3A74](v10, v12);

    -[PKPaymentPassDetailsNotificationSettingsSectionController _cellForType:](self, "_cellForType:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "settingSwitch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEnabled:", 0);

    -[PKPaymentPass setSettings:](self->_pass, "setSettings:", v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "reloadSectionIdentifier:", CFSTR("NotificationsSectionIdentifier"));

    -[PKPaymentPassDetailSectionController reportPassDetailsAnalyticsForToggleTag:toggleResult:additionalAnalytics:pass:](self, "reportPassDetailsAnalyticsForToggleTag:toggleResult:additionalAnalytics:pass:", *MEMORY[0x1E0D69608], v7, 0, self->_pass);
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

+ (BOOL)canShowSectionforPass:(id)a3 dataProvider:(id)a4 peerPaymentAccount:(id)a5 bankConnectAccount:(id)a6 account:(id)a7 transactionSourceCollection:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v21;
  char v22;
  void *v24;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(a1, "_updatedPeerPaymentAccountForPeerPaymentAccount:pass:", a5, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "activationState"))
    v20 = objc_msgSend(v14, "isShellPass") ^ 1;
  else
    v20 = 0;
  v21 = objc_msgSend(a1, "_countOfRowsForPass:peerPaymentAccount:bankConnectAccount:account:", v14, v19, v16, v17);
  v22 = 0;
  if (v21 >= 1 && (v20 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v15, "supportsTransactionsForPass:", v14))
    {
      if (v19
        || (objc_msgSend(v14, "supportsDPANNotifications") & 1) != 0
        || (objc_msgSend(v14, "supportsFPANNotifications") & 1) != 0)
      {
        v22 = 1;
      }
      else
      {
        objc_msgSend(v14, "devicePrimaryPaymentApplication");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "generatesLocalTransactions") & 1) != 0
          || v17
          && +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", v18, v17)|| (objc_msgSend(v14, "isAppleCardPass") & 1) != 0|| (objc_msgSend(v14, "isPeerPaymentPass") & 1) != 0)
        {
          v22 = 1;
        }
        else
        {
          v22 = objc_msgSend(v14, "isAppleBalancePass");
        }

      }
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

+ (id)_updatedPeerPaymentAccountForPeerPaymentAccount:(id)a3 pass:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "associatedPassUniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v7, "isEqualToString:", v8);
  if ((_DWORD)v6)
    v9 = v5;
  else
    v9 = 0;

  return v9;
}

+ (int64_t)_countOfRowsForPass:(id)a3 peerPaymentAccount:(id)a4 bankConnectAccount:(id)a5 account:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int64_t v14;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  objc_msgSend(a1, "_updatedPeerPaymentAccountForPeerPaymentAccount:pass:", a4, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend((id)objc_opt_class(), "_showsTransactionHistorySwitchForPass:peerPaymentAccount:bankConnectAccount:account:", v10, v13, v12, v11);

  if ((a4 & 1) != 0)
  {
    if ((objc_msgSend(v10, "settings") & 8) != 0)
      v14 = 2;
    else
      v14 = 1;
  }
  else if (v13)
  {
    if (objc_msgSend(v13, "role"))
      v14 = 1;
    else
      v14 = 2;
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)_shouldShowBankConnectData
{
  int v3;

  v3 = PKBankConnectEnabled();
  if (v3)
    LOBYTE(v3) = self->_detailViewStyle < 2uLL;
  return v3;
}

- (BOOL)_shouldMapSection
{
  return objc_msgSend((id)objc_opt_class(), "canShowSectionforPass:dataProvider:peerPaymentAccount:bankConnectAccount:account:transactionSourceCollection:", self->_pass, self->_paymentDataProvider, self->_peerPaymentAccount, self->_bankConnectAccount, self->_account, self->_transactionSourceCollection);
}

- (id)_cellForType:(int64_t)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  -[PKPaymentPassDetailsNotificationSettingsSectionController _indexPathForRowType:](self, "_indexPathForRowType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "cellForRowAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_passSettingsChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  -[PKPaymentPassDetailsNotificationSettingsSectionController _cellForType:](self, "_cellForType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailsNotificationSettingsSectionController _cellForType:](self, "_cellForType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D6A7F0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D6A7E8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_msgSend(v12, "unsignedIntegerValue");
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __82__PKPaymentPassDetailsNotificationSettingsSectionController__passSettingsChanged___block_invoke;
      v14[3] = &unk_1E3E664B0;
      v14[4] = self;
      v17 = v13;
      v15 = v5;
      v16 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], v14);

    }
  }

}

void __82__PKPaymentPassDetailsNotificationSettingsSectionController__passSettingsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id WeakRetained;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setSettingsWithoutUpdatingDataAccessor:", *(_QWORD *)(a1 + 56));
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = objc_msgSend(v2, "isOn") ^ ((*(_BYTE *)(a1 + 56) & 8) == 0);
    v2 = *(void **)(a1 + 40);
  }
  else
  {
    v3 = 1;
  }
  objc_msgSend(v2, "settingSwitch");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setOn:", (*(_QWORD *)(a1 + 56) >> 3) & 1);
  objc_msgSend(*(id *)(a1 + 48), "settingSwitch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setOn:", (*(_QWORD *)(a1 + 56) & 0x80) == 0);
  if ((v3 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
    objc_msgSend(WeakRetained, "reloadSectionIdentifier:", CFSTR("NotificationsSectionIdentifier"));

  }
}

- (int64_t)notificationAuthorizationStatus
{
  return self->_notificationAuthorizationStatus;
}

- (PKPaymentPassDetailsNotificationSettingsSectionControllerDelegate)delegate
{
  return (PKPaymentPassDetailsNotificationSettingsSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bankConnectAccount, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
