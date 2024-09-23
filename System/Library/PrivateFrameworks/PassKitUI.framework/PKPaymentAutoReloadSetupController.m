@implementation PKPaymentAutoReloadSetupController

- (PKPaymentAutoReloadSetupController)initWithPass:(id)a3 provisioningController:(id)a4 viewStyle:(int64_t)a5 delegate:(id)a6
{
  return -[PKPaymentAutoReloadSetupController initWithPass:paymentDataProvider:provisioningController:viewStyle:delegate:](self, "initWithPass:paymentDataProvider:provisioningController:viewStyle:delegate:", a3, 0, a4, a5, a6);
}

- (PKPaymentAutoReloadSetupController)initWithPass:(id)a3 paymentDataProvider:(id)a4 viewStyle:(int64_t)a5 delegate:(id)a6
{
  return -[PKPaymentAutoReloadSetupController initWithPass:paymentDataProvider:provisioningController:viewStyle:delegate:](self, "initWithPass:paymentDataProvider:provisioningController:viewStyle:delegate:", a3, a4, 0, a5, a6);
}

- (PKPaymentAutoReloadSetupController)initWithPass:(id)a3 paymentDataProvider:(id)a4 provisioningController:(id)a5 viewStyle:(int64_t)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  PKPaymentPassAction *v16;
  PKPaymentPassAction *action;
  uint64_t v18;
  void *v19;
  int64_t v20;
  PKThresholdTopUpSetupViewController *v21;
  PKThresholdTopUpSetupViewController *thresholdTopUpSetupViewController;

  v13 = a3;
  v14 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_pass, a3);
    v15 = a7;
    self->_passUpdated = 0;
    objc_storeStrong((id *)&self->_paymentDataProvider, a4);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PKPaymentDataProvider addDelegate:](self->_paymentDataProvider, "addDelegate:", self);
    +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:](PKPaymentPassDetailAutoReloadSectionController, "autoTopUpActionForPass:", v13);
    v16 = (PKPaymentPassAction *)objc_claimAutoreleasedReturnValue();
    action = self->_action;
    self->_action = v16;

    -[PKPaymentPass autoTopUpMerchantTokenIdentifier](self->_pass, "autoTopUpMerchantTokenIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      LOBYTE(v18) = -[PKPaymentPass isAutoTopEnabled](self->_pass, "isAutoTopEnabled");
    self->_isWalletAutoTopEnabled = v18;

    self->_viewStyle = a6;
    objc_storeWeak((id *)&self->_delegate, v15);

    if (a5)
    {
      v20 = 2;
    }
    else
    {
      if (!self->_isWalletAutoTopEnabled)
      {
        self->_setupMode = 0;
        goto LABEL_11;
      }
      v20 = 1;
    }
    self->_setupMode = v20;
LABEL_11:
    -[PKPaymentAutoReloadSetupController _createThresholdTopUpSetupViewController](self, "_createThresholdTopUpSetupViewController");
    v21 = (PKThresholdTopUpSetupViewController *)objc_claimAutoreleasedReturnValue();
    thresholdTopUpSetupViewController = self->_thresholdTopUpSetupViewController;
    self->_thresholdTopUpSetupViewController = v21;

  }
  return self;
}

+ (BOOL)shouldOfferAutoReloadForPass:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:](PKPaymentPassDetailAutoReloadSectionController, "autoTopUpActionForPass:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(v3, "isAutoTopEnabled") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (id)_createThresholdTopUpSetupViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *currency;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *j;
  void *v34;
  NSString *v35;
  NSString *originalPaymentMethodIdentifier;
  PKThresholdTopUpSetupViewController *v37;
  void *v38;
  void *v39;
  void *v40;
  int64_t setupMode;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[2];
  int v55;
  _QWORD v56[2];
  int v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  uint64_t v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  -[PKPaymentPassAction autoTopUpItem](self->_action, "autoTopUpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultAmountSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPassAction autoTopUpItem](self->_action, "autoTopUpItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultThresholdSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPassAction autoTopUpItem](self->_action, "autoTopUpItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currency");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  currency = self->_currency;
  self->_currency = v8;

  if (self->_isWalletAutoTopEnabled)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    -[PKPaymentPass autoTopUpFields](self->_pass, "autoTopUpFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    if (v11)
    {
      v12 = v11;
      v49 = v4;
      v13 = v6;
      v14 = *(_QWORD *)v59;
      v15 = *MEMORY[0x1E0D6A6F0];
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v59 != v14)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v17, "key");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v15);

          if (v19)
          {
            v22 = objc_alloc(MEMORY[0x1E0CB3598]);
            v23 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v17, "threshold");
            objc_msgSend(v23, "numberWithDouble:");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v24)
            {
              objc_msgSend(v24, "decimalValue");
            }
            else
            {
              v56[0] = 0;
              v56[1] = 0;
              v57 = 0;
            }
            v6 = v13;
            v21 = (void *)objc_msgSend(v22, "initWithDecimal:", v56);

            v27 = objc_alloc(MEMORY[0x1E0CB3598]);
            v28 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v17, "amount");
            objc_msgSend(v28, "numberWithDouble:");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            v4 = v49;
            if (v29)
            {
              objc_msgSend(v29, "decimalValue");
            }
            else
            {
              v54[0] = 0;
              v54[1] = 0;
              v55 = 0;
            }
            v20 = objc_msgSend(v27, "initWithDecimal:", v54);

            goto LABEL_20;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
        if (v12)
          continue;
        break;
      }
      v20 = 0;
      v21 = 0;
      v6 = v13;
      v4 = v49;
    }
    else
    {
      v20 = 0;
      v21 = 0;
    }
LABEL_20:

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[PKPaymentPass balances](self->_pass, "balances");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    if (v26)
    {
      v32 = *(_QWORD *)v51;
      while (2)
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v51 != v32)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j), "paymentMethod");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v34, "type"))
          {
            objc_msgSend(v34, "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "fpanIdentifier");
            v35 = (NSString *)objc_claimAutoreleasedReturnValue();
            originalPaymentMethodIdentifier = self->_originalPaymentMethodIdentifier;
            self->_originalPaymentMethodIdentifier = v35;

            goto LABEL_30;
          }

        }
        v26 = (void *)objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
        if (v26)
          continue;
        break;
      }
    }
LABEL_30:

    if (v20)
    {
      if (v21)
        goto LABEL_37;
      goto LABEL_35;
    }
  }
  else
  {
    v21 = 0;
    v26 = 0;
  }
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    PKLogFacilityTypeGetObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 134217984;
      v63 = v45;
      _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "PKPaymentAutoReloadSetupController: defaultAmountSuggestions count [%lu] is less than 2 items per spec. Need to update server configuration for the actions.json.", buf, 0xCu);
    }
    goto LABEL_47;
  }
  objc_msgSend(v4, "firstObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v21)
    goto LABEL_37;
LABEL_35:
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    PKLogFacilityTypeGetObject();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134217984;
      v63 = v47;
      _os_log_impl(&dword_19D178000, v46, OS_LOG_TYPE_DEFAULT, "PKPaymentAutoReloadSetupController: no defaultThresholdSuggestions [%lu] is less than 2 items per spec. Need to update server configuration for the actions.json.", buf, 0xCu);
    }

    v21 = 0;
LABEL_47:
    v37 = 0;
    goto LABEL_48;
  }
  objc_msgSend(v6, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
  v37 = -[PKThresholdTopUpSetupViewController initWithAmountSuggestions:selectedAmount:thresholdSuggestions:selectedThreshold:currencyCode:paymentMethodName:paymentMethodIdentifier:mode:viewStyle:delegate:]([PKThresholdTopUpSetupViewController alloc], "initWithAmountSuggestions:selectedAmount:thresholdSuggestions:selectedThreshold:currencyCode:paymentMethodName:paymentMethodIdentifier:mode:viewStyle:delegate:", v4, v20, v6, v21, self->_currency, v26, self->_originalPaymentMethodIdentifier, self->_setupMode, self->_viewStyle, self);
  -[PKPaymentAutoReloadSetupController paymentRequest:threshold:paymentMethodIdentifier:](self, "paymentRequest:threshold:paymentMethodIdentifier:", v20, v21, self->_originalPaymentMethodIdentifier);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKThresholdTopUpSetupViewController setPaymentRequest:](v37, "setPaymentRequest:", v38);

  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AMOUNT"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKThresholdTopUpSetupViewController setAmountTitle:](v37, "setAmountTitle:", v39);

  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_MINIMUM_BALANCE"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKThresholdTopUpSetupViewController setThresholdTitle:](v37, "setThresholdTitle:", v40);

  setupMode = self->_setupMode;
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (setupMode != 1)
  {
    -[PKPaymentSetupOptionsViewController setTitleText:](v37, "setTitleText:", v42);

    PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_SUBTITLE"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSubtitleText:](v37, "setSubtitleText:", v44);
    goto LABEL_43;
  }
  -[PKThresholdTopUpSetupViewController setTitle:](v37, "setTitle:", v42);

  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_CANCEL_TITLE"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKThresholdTopUpSetupViewController setCancelTitle:](v37, "setCancelTitle:", v43);

  if (objc_msgSend(v26, "length"))
  {
    PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_PAYMETN_METHOD"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKThresholdTopUpSetupViewController setPaymentMethodTitle:](v37, "setPaymentMethodTitle:", v44);
LABEL_43:

  }
LABEL_48:

  return v37;
}

- (void)presentAutoTopUpFlow
{
  int64_t setupMode;
  id v4;
  char v5;
  id v6;
  id WeakRetained;
  char v8;
  PKNavigationController *v9;
  id v10;

  if (self->_thresholdTopUpSetupViewController)
  {
    setupMode = self->_setupMode;
    if (setupMode == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        v10 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v10, "autoReloadSetupController:requestsPushViewController:", self, self->_thresholdTopUpSetupViewController);

      }
    }
    else if (!setupMode)
    {
      v4 = objc_loadWeakRetained((id *)&self->_delegate);
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        v9 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", self->_thresholdTopUpSetupViewController);
        v6 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v6, "autoReloadSetupController:requestsPresentViewController:", self, v9);

      }
    }
  }
}

- (void)autoReloadSetupCompleteViewControllerDidComplete
{
  int64_t setupMode;
  PKPaymentAutoReloadSetupControllerDelegate **p_delegate;
  id v5;
  char v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  char v11;
  id v12;

  setupMode = self->_setupMode;
  switch(setupMode)
  {
    case 2:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[PKProvisioningAnalyticsSessionUIReporter reportPageCompleted:context:](self->_reporter, "reportPageCompleted:context:", 0, 0);
        v12 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v12, "autoReloadSetupControllerDidCancel:", self);
LABEL_13:

      }
      break;
    case 1:
      p_delegate = &self->_delegate;
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        v7 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v7, "autoReloadSetupController:requestsPopViewController:", self, self->_thresholdTopUpSetupViewController);
        goto LABEL_11;
      }
LABEL_12:
      v12 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v12, "autoReloadSetupControllerDidCompleteWithAmount:threshold:", self->_currentAmount, self->_currentThreshold);
      goto LABEL_13;
    case 0:
      p_delegate = &self->_delegate;
      v5 = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        v7 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v7, "autoReloadSetupController:requestsDismissViewController:", self, self->_thresholdTopUpSetupViewController);
LABEL_11:

        goto LABEL_12;
      }
      goto LABEL_12;
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__PKPaymentAutoReloadSetupController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __94__PKPaymentAutoReloadSetupController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  char v12;
  id v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 1;
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v4 + 112))
    {
      *(_BYTE *)(v4 + 64) = 0;
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(NSObject **)(v5 + 128);
      if (v6)
      {
        dispatch_source_cancel(v6);
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(void **)(v7 + 128);
        *(_QWORD *)(v7 + 128) = 0;

        v5 = *(_QWORD *)(a1 + 32);
      }
      (*(void (**)(void))(*(_QWORD *)(v5 + 112) + 16))();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 112);
      *(_QWORD *)(v9 + 112) = 0;

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
        objc_msgSend(v13, "autoReloadSetupControllerDidCancel:", *(_QWORD *)(a1 + 32));

      }
      objc_msgSend(*(id *)(a1 + 32), "autoReloadSetupCompleteViewControllerDidComplete");
    }
  }
}

- (void)thresholdTopUpDidSelectCancel:(id)a3
{
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  id v5;

  reporter = self->_reporter;
  v5 = a3;
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](reporter, "reportButtonPressed:", 2);
  -[PKPaymentAutoReloadSetupController _dismissViewController:](self, "_dismissViewController:", v5);

}

- (void)thresholdTopUpPerformCancel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKPaymentDataProvider *paymentDataProvider;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  self->_passUpdated = 0;
  objc_initWeak(&location, self);
  paymentDataProvider = self->_paymentDataProvider;
  -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass autoTopUpBalanceIdentifiers](self->_pass, "autoTopUpBalanceIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke;
  v12[3] = &unk_1E3E61968;
  objc_copyWeak(&v14, &location);
  v11 = v7;
  v12[4] = self;
  v13 = v11;
  -[PKPaymentDataProvider cancelAutoTopUpForPassWithUniqueIdentifier:balanceIdentifiers:completion:](paymentDataProvider, "cancelAutoTopUpForPassWithUniqueIdentifier:balanceIdentifiers:completion:", v9, v10, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke(uint64_t a1, char a2)
{
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  char v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke_2;
  v5[3] = &unk_1E3E6C5E8;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  v8 = a2;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  char v5;
  id v6;
  uint64_t v7;
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
  id v19;
  NSObject *v20;
  id v21;
  dispatch_source_t v22;
  id v23;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  _QWORD handler[5];
  id v30;
  id location;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_7:
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
    goto LABEL_13;
  }
  if (!*(_BYTE *)(a1 + 56))
  {
    v8 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_UNABLE_TO_CANCEL_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_UNABLE_TO_CANCEL_MESSAGE"), CFSTR("%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_OK_BUTTON"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v15);

    v16 = *(void **)(a1 + 40);
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke_4;
    v27[3] = &unk_1E3E61590;
    v28 = v16;
    objc_msgSend(v17, "presentViewController:animated:completion:", v12, 1, v27);

    goto LABEL_13;
  }
  if (*((_BYTE *)WeakRetained + 65))
  {
    *((_BYTE *)WeakRetained + 64) = 0;
    v4 = objc_loadWeakRetained(WeakRetained + 13);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained(v3 + 13);
      objc_msgSend(v6, "autoReloadSetupControllerDidCancel:", *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(v3, "autoReloadSetupCompleteViewControllerDidComplete");
    goto LABEL_7;
  }
  v18 = _Block_copy(*(const void **)(a1 + 40));
  v19 = v3[14];
  v3[14] = v18;

  v20 = v3[16];
  if (v20)
  {
    dispatch_source_cancel(v20);
    v21 = v3[16];
    v3[16] = 0;

  }
  objc_initWeak(&location, v3);
  v22 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  v23 = v3[16];
  v3[16] = v22;

  v24 = v3[16];
  v25 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v26 = v3[16];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke_3;
  handler[3] = &unk_1E3E61B68;
  objc_copyWeak(&v30, &location);
  handler[4] = *(_QWORD *)(a1 + 32);
  dispatch_source_set_event_handler(v26, handler);
  dispatch_resume((dispatch_object_t)v3[16]);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
LABEL_13:

}

void __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  id v9;
  char v10;
  id v11;
  _QWORD *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 64) = 0;
    v4 = *((_QWORD *)WeakRetained + 16);
    v12 = v3;
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = (void *)v12[16];
      v12[16] = 0;

      v3 = v12;
    }
    v6 = v3[14];
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
      v7 = (void *)v12[14];
      v12[14] = 0;

      v3 = v12;
    }
    v8 = (id *)(v3 + 13);
    v9 = objc_loadWeakRetained((id *)v3 + 13);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained(v8);
      objc_msgSend(v11, "autoReloadSetupControllerDidCancel:", *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(v12, "autoReloadSetupCompleteViewControllerDidComplete");
    v3 = v12;
  }

}

uint64_t __77__PKPaymentAutoReloadSetupController_thresholdTopUpPerformCancel_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)thresholdTopUpDidSelectContinue:(id)a3 completion:(id)a4
{
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  reporter = self->_reporter;
  v7 = a4;
  v8 = a3;
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](reporter, "reportButtonPressed:", 0);
  objc_msgSend(v8, "currentAmount");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentThreshold");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "primaryAccountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAutoReloadSetupController _didUpdateAutoReloadWithAmount:threshold:paymentMethodIdentifier:completion:](self, "_didUpdateAutoReloadWithAmount:threshold:paymentMethodIdentifier:completion:", v12, v9, v11, v7);

}

- (void)thresholdTopUpDidSelectUpdate:(id)a3 completion:(id)a4
{
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  reporter = self->_reporter;
  v7 = a4;
  v8 = a3;
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](reporter, "reportButtonPressed:", 1);
  objc_msgSend(v8, "currentAmount");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentThreshold");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "primaryAccountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAutoReloadSetupController _didUpdateAutoReloadWithAmount:threshold:paymentMethodIdentifier:completion:](self, "_didUpdateAutoReloadWithAmount:threshold:paymentMethodIdentifier:completion:", v12, v9, v11, v7);

}

- (void)_dismissViewController:(id)a3
{
  uint64_t v4;
  id v5;
  char v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  id v11;
  char v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "mode");
  switch(v4)
  {
    case 2:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v10 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v10, "autoReloadSetupControllerDidCancel:", self);

        -[PKProvisioningAnalyticsSessionUIReporter reportPageCompleted:context:](self->_reporter, "reportPageCompleted:context:", 0, 0);
      }
      break;
    case 1:
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        v7 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v7, "autoReloadSetupController:requestsPopViewController:", self, v13);
        goto LABEL_10;
      }
      break;
    case 0:
      v5 = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        v7 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v7, "autoReloadSetupController:requestsDismissViewController:", self, v13);
LABEL_10:

      }
      break;
  }

}

- (id)paymentRequest:(id)a3 threshold:(id)a4 paymentMethodIdentifier:(id)a5
{
  id v8;
  id v9;
  NSString *currency;
  id v11;
  void *v12;
  PKCurrencyAmount *v13;
  PKCurrencyAmount *currentAmount;
  PKCurrencyAmount *v15;
  void *currentThreshold;
  void *v17;
  PKCurrencyAmount *v18;
  PKCurrencyAmount *v19;
  id v20;
  PKCurrencyAmount *v21;
  PKCurrencyAmount *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSString *originalPaymentMethodIdentifier;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  PKPaymentAutoReloadSetupController *v66;
  NSString *v67;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v67 = (NSString *)a5;
  currency = self->_currency;
  v11 = objc_alloc(MEMORY[0x1E0D66C88]);
  v12 = v11;
  v68 = v9;
  if (currency)
  {
    v13 = (PKCurrencyAmount *)objc_msgSend(v11, "initWithAmount:currency:exponent:", v8, self->_currency, 0);
    currentAmount = self->_currentAmount;
    self->_currentAmount = v13;

    v15 = (PKCurrencyAmount *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", v9, self->_currency, 0);
    currentThreshold = self->_currentThreshold;
    self->_currentThreshold = v15;
  }
  else
  {
    -[PKThresholdTopUpSetupViewController currentAmount](self->_thresholdTopUpSetupViewController, "currentAmount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (PKCurrencyAmount *)objc_msgSend(v12, "initWithAmount:currency:exponent:", v17, self->_currency, 0);
    v19 = self->_currentAmount;
    self->_currentAmount = v18;

    v20 = objc_alloc(MEMORY[0x1E0D66C88]);
    -[PKThresholdTopUpSetupViewController currentThreshold](self->_thresholdTopUpSetupViewController, "currentThreshold");
    currentThreshold = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (PKCurrencyAmount *)objc_msgSend(v20, "initWithAmount:currency:exponent:", currentThreshold, self->_currency, 0);
    v22 = self->_currentThreshold;
    self->_currentThreshold = v21;

  }
  v69 = v8;

  v66 = self;
  -[PKPaymentPass autoTopUpFields](self->_pass, "autoTopUpFields");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (v24)
  {
    v25 = v24;
    v26 = 0;
    v27 = *(_QWORD *)v71;
    v28 = *MEMORY[0x1E0D6A6F8];
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v71 != v27)
          objc_enumerationMutation(v23);
        v30 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend(v30, "key");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", v28);

        if (v32)
        {
          v33 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v30, "link");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "URLWithString:", v34);
          v35 = objc_claimAutoreleasedReturnValue();

          v26 = (void *)v35;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    }
    while (v25);
  }
  else
  {
    v26 = 0;
  }
  -[PKPaymentPass transactionServiceURL](v66->_pass, "transactionServiceURL");
  v36 = objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_RELOAD_AMOUNT"));
  v37 = objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass organizationName](v66->_pass, "organizationName");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66BB0], "summaryItemWithLabel:amount:type:", v37, v69, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setThresholdAmount:", v68);
  v64 = (void *)v37;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66BA8]), "initWithPaymentDescription:automaticReloadBilling:managementURL:", v37, v38, v26);
  v65 = (void *)v36;
  objc_msgSend(v39, "setTokenNotificationURL:", v36);
  -[PKPaymentPass localizedDescription](v66->_pass, "localizedDescription");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_BILLING_AGREEMENT"), CFSTR("%@"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setBillingAgreement:", v41);

  -[PKPaymentPassAction autoTopUpItem](v66->_action, "autoTopUpItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "serviceProviderData");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "mutableCopy");

  objc_msgSend(v44, "setObject:forKey:", v69, *MEMORY[0x1E0D6B5A0]);
  objc_msgSend(v44, "setObject:forKey:", v68, *MEMORY[0x1E0D6B5A8]);
  objc_msgSend(v44, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D6B5B8]);
  if (v67)
  {
    v45 = *MEMORY[0x1E0D6A740];
    v46 = v44;
    originalPaymentMethodIdentifier = v67;
LABEL_18:
    objc_msgSend(v46, "setObject:forKey:", originalPaymentMethodIdentifier, v45);
    goto LABEL_19;
  }
  originalPaymentMethodIdentifier = v66->_originalPaymentMethodIdentifier;
  v45 = *MEMORY[0x1E0D6A740];
  v46 = v44;
  if (originalPaymentMethodIdentifier)
    goto LABEL_18;
  objc_msgSend(v44, "setValue:forKey:", 0, v45);
LABEL_19:
  v48 = objc_alloc_init(MEMORY[0x1E0D66EB0]);
  -[PKPaymentPassAction actionDescription](v66->_action, "actionDescription");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setItemDescription:", v49);

  v50 = (void *)objc_msgSend(v44, "copy");
  objc_msgSend(v48, "setServiceProviderData:", v50);

  -[PKPaymentPassAction serviceProviderIdentifier](v66->_action, "serviceProviderIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setServiceProviderIdentifier:", v51);

  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67660]), "initWithServiceProviderOrder:", v48);
  objc_msgSend(v52, "setCurrencyCode:", v66->_currency);
  -[PKPaymentPassAction serviceProviderAcceptedNetworks](v66->_action, "serviceProviderAcceptedNetworks");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setSupportedNetworks:", v53);

  objc_msgSend(v52, "setMerchantCapabilities:", -[PKPaymentPassAction serviceProviderCapabilities](v66->_action, "serviceProviderCapabilities"));
  -[PKPaymentPassAction serviceProviderCountryCode](v66->_action, "serviceProviderCountryCode");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setCountryCode:", v54);

  -[PKPaymentPassAction serviceProviderSupportedCountries](v66->_action, "serviceProviderSupportedCountries");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setSupportedCountries:", v55);

  v56 = (void *)objc_msgSend(v38, "copy");
  -[PKPaymentPassAction serviceProviderLocalizedDisplayName](v66->_action, "serviceProviderLocalizedDisplayName");
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)v57;
  if (v57)
    v59 = (void *)v57;
  else
    v59 = v63;
  v60 = v59;

  objc_msgSend(v56, "setLabel:", v60);
  v74 = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setPaymentSummaryItems:", v61);

  objc_msgSend(v52, "setAutomaticReloadPaymentRequest:", v39);
  objc_msgSend(v52, "setConfirmationStyle:", 1);

  return v52;
}

- (void)_didUpdateAutoReloadWithAmount:(id)a3 threshold:(id)a4 paymentMethodIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  id paymentAuthCompletionHandler;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  -[PKPaymentAutoReloadSetupController paymentRequest:threshold:paymentMethodIdentifier:](self, "paymentRequest:threshold:paymentMethodIdentifier:", v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_paymentAuthCompletionHandler)
  {
    if (v13)
      v13[2](v13, 0);
  }
  else
  {
    v15 = _Block_copy(v13);
    paymentAuthCompletionHandler = self->_paymentAuthCompletionHandler;
    self->_paymentAuthCompletionHandler = v15;

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67088]), "initWithPaymentRequest:", v14);
    objc_msgSend(v17, "setDelegate:", self);
    objc_msgSend(v17, "_setPrivateDelegate:", self);
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __114__PKPaymentAutoReloadSetupController__didUpdateAutoReloadWithAmount_threshold_paymentMethodIdentifier_completion___block_invoke;
    v18[3] = &unk_1E3E61C58;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v17, "presentWithCompletion:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

void __114__PKPaymentAutoReloadSetupController__didUpdateAutoReloadWithAmount_threshold_paymentMethodIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  _QWORD v4[5];
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __114__PKPaymentAutoReloadSetupController__didUpdateAutoReloadWithAmount_threshold_paymentMethodIdentifier_completion___block_invoke_2;
  v4[3] = &unk_1E3E64C10;
  v5 = a2;
  v4[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __114__PKPaymentAutoReloadSetupController__didUpdateAutoReloadWithAmount_threshold_paymentMethodIdentifier_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  if (!*(_BYTE *)(a1 + 40))
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_19D178000, v2, OS_LOG_TYPE_ERROR, "Error: Device failed to present payment coordinator!", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_showGenericErrorAlert:", 0);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
    if (v3)
    {
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 120);
      *(_QWORD *)(v4 + 120) = 0;

    }
  }
}

- (void)_showGenericErrorAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D671C8], "displayableErrorForAction:andReason:", self->_action, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningAnalyticsSessionUIReporter reportError:context:](self->_reporter, "reportError:context:", v5, 0);
  v6 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v5, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedRecoverySuggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_OK_BUTTON_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__PKPaymentAutoReloadSetupController__showGenericErrorAlert___block_invoke;
  v14[3] = &unk_1E3E61CA8;
  v15 = v4;
  v12 = v4;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v13);

  -[PKThresholdTopUpSetupViewController presentViewController:animated:completion:](self->_thresholdTopUpSetupViewController, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __61__PKPaymentAutoReloadSetupController__showGenericErrorAlert___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  objc_class *v5;
  void (**v6)(id, id);
  id v7;

  v5 = (objc_class *)MEMORY[0x1E0D670A8];
  v6 = (void (**)(id, id))a5;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setStatus:", 1);
  v6[2](v6, v7);

}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__PKPaymentAutoReloadSetupController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  objc_msgSend(a3, "dismissWithCompletion:", v3);
}

void __79__PKPaymentAutoReloadSetupController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentAutoReloadSetupController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __79__PKPaymentAutoReloadSetupController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  PKPaymentAutoReloadSetupCompleteViewController *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  if (v3)
  {
    *(_QWORD *)(v2 + 56) = 0;

    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v4 + 96) == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v4 + 104));
      objc_msgSend(WeakRetained, "autoReloadSetupControllerDidCompleteWithAmount:threshold:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "reportPageCompleted:context:", 1, 0);
    }
    else
    {
      v6 = -[PKPaymentAutoReloadSetupCompleteViewController initWithPass:amount:threshold:setupMode:paymentDataProvider:delegate:]([PKPaymentAutoReloadSetupCompleteViewController alloc], "initWithPass:amount:threshold:setupMode:paymentDataProvider:delegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pushViewController:animated:", v6, 1);

    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 120);
  if (v9)
  {
    (*(void (**)(uint64_t, BOOL))(v9 + 16))(v9, *(_QWORD *)(v8 + 56) != 0);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 120);
    *(_QWORD *)(v10 + 120) = 0;

  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKThresholdTopUpSetupViewController view](self->_thresholdTopUpSetupViewController, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD);
  id v9;

  v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)&self->_completedAutoReload, a4);
    v8 = (void (**)(id, _QWORD))a5;
    v8[2](v8, 0);
  }
  else
  {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }

}

- (PKThresholdTopUpSetupViewController)thresholdTopUpSetupViewController
{
  return self->_thresholdTopUpSetupViewController;
}

- (void)setThresholdTopUpSetupViewController:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdTopUpSetupViewController, a3);
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
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_paymentAuthCompletionHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_thresholdTopUpSetupViewController, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_completedAutoReload, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_originalPaymentMethodIdentifier, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_currentThreshold, 0);
  objc_storeStrong((id *)&self->_currentAmount, 0);
}

@end
