@implementation PKPeerPaymentThresholdTopUpController

- (PKPeerPaymentThresholdTopUpController)initWithPeerPaymentAccount:(id)a3 pass:(id)a4 context:(int64_t)a5 passLibraryDataProvider:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  PKPeerPaymentThresholdTopUpController *v15;
  PKPeerPaymentThresholdTopUpController *v16;
  objc_super v18;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentThresholdTopUpController;
  v15 = -[PKPeerPaymentThresholdTopUpController init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pass, a4);
    v16->_context = a5;
    objc_storeStrong((id *)&v16->_account, a3);
    objc_storeWeak((id *)&v16->_delegate, v14);
  }

  return v16;
}

- (void)presentTopUpFlowForRecurringPayment:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke;
  v5[3] = &unk_1E3E61E98;
  v5[4] = self;
  objc_msgSend(v4, "recurringPaymentsWithCompletion:", v5);

}

void __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  _BOOL4 v15;
  id v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PKThresholdTopUpSetupViewController *v28;
  void *v29;
  void *v30;
  PKThresholdTopUpSetupViewController *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  PKDashboardPassMessage *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id WeakRetained;
  PKThresholdTopUpSetupViewController *v49;
  void *v50;
  void *v51;
  PKThresholdTopUpSetupViewController *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  PKNavigationController *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  PKThresholdTopUpSetupViewController *v78;
  void *v79;
  _QWORD v80[5];
  id v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v84;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v84 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") == 3)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v9);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  v82 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "thresholdTopUpFeatureDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "amountSuggestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "thresholdSuggestions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
    v13 = objc_msgSend(v12, "count") == 0;
  else
    v13 = 1;
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v81 = 0;
  v15 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:account:unableReason:displayableError:](PKPeerPaymentActionController, "canPerformPeerPaymentAction:account:unableReason:displayableError:", 1, v14, &v82, &v81);
  v16 = v81;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 64);
  if (v18)
    v19 = 1;
  else
    v19 = v15;
  if (v19 != 1 || v13)
  {
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke_4;
    v80[3] = &unk_1E3E612E8;
    v80[4] = v17;
    +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:](PKPeerPaymentActionController, "alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:", v82, v16, v80);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "thresholdTopUpController:requestsPresentViewController:", *(_QWORD *)(a1 + 32), v47);

  }
  else if (v18)
  {
    v75 = v16;
    v76 = v10;
    objc_msgSend(v18, "fundingSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "name");
    v21 = objc_claimAutoreleasedReturnValue();

    v78 = [PKThresholdTopUpSetupViewController alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "amount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "threshold");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "currentBalance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "currency");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "fundingSource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fpanIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v78;
    v77 = v11;
    v79 = v12;
    v29 = v11;
    v30 = (void *)v21;
    v31 = -[PKThresholdTopUpSetupViewController initWithAmountSuggestions:selectedAmount:thresholdSuggestions:selectedThreshold:currencyCode:paymentMethodName:paymentMethodIdentifier:mode:viewStyle:delegate:](v28, "initWithAmountSuggestions:selectedAmount:thresholdSuggestions:selectedThreshold:currencyCode:paymentMethodName:paymentMethodIdentifier:mode:viewStyle:delegate:", v29, v22, v12, v23, v25, v21, v27, 1, 0, *(_QWORD *)(a1 + 32));

    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), v31);
    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_CREATE_TITLE"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKThresholdTopUpSetupViewController setTitle:](v31, "setTitle:", v32);

    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_AMOUNT"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKThresholdTopUpSetupViewController setAmountTitle:](v31, "setAmountTitle:", v33);

    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_THRESHOLD"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKThresholdTopUpSetupViewController setThresholdTitle:](v31, "setThresholdTitle:", v34);

    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "actions") & 2) != 0)
    {
      PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_CANCEL"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKThresholdTopUpSetupViewController setCancelTitle:](v31, "setCancelTitle:", v35);

    }
    v36 = v30;
    v10 = v76;
    if (objc_msgSend(v30, "length"))
    {
      PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_PAYMENT_METHOD"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKThresholdTopUpSetupViewController setPaymentMethodTitle:](v31, "setPaymentMethodTitle:", v37);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "lastExecutedTransaction");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "status");
    v11 = v77;
    if (v38)
    {
      v40 = v39;
      if ((unint64_t)(v39 - 3) <= 1 && objc_msgSend(v38, "status") == 3)
      {
        v74 = objc_msgSend(v38, "errorCode");
        v41 = objc_alloc_init(MEMORY[0x1E0C99E10]);
        v42 = objc_alloc_init(PKDashboardPassMessage);
        objc_msgSend(v38, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPassMessage setIdentifier:](v42, "setIdentifier:", v43);

        if (v40 == 4)
        {
          v44 = v41;
          PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_ERROR_PROBLEM_TITLE_PAUSED"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDashboardPassMessage setTitle:](v42, "setTitle:", v45);

          PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_ERROR_PROBLEM_MESSAGE_PAUSED"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDashboardPassMessage setMessage:](v42, "setMessage:", v46);

          -[PKThresholdTopUpSetupViewController setEditingUnavailable:](v31, "setEditingUnavailable:", 1);
        }
        else
        {
          v44 = v41;
          objc_msgSend(*(id *)(a1 + 32), "_titleForErrorCode:", v74);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDashboardPassMessage setTitle:](v42, "setTitle:", v59);

          objc_msgSend(*(id *)(a1 + 32), "_messageForErrorCode:", v74);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDashboardPassMessage setMessage:](v42, "setMessage:", v60);

          if (objc_msgSend(v38, "exceedsAppleCashLimits"))
          {
            PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_ERROR_LEARN_MORE"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setButtonTitle:](v42, "setButtonTitle:", v61);

            -[PKDashboardPassMessage setActionOnButtonPress:](v42, "setActionOnButtonPress:", &__block_literal_global_66);
          }
        }
        PKPassKitUIBundle();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "URLForResource:withExtension:", CFSTR("MessageAlert"), CFSTR("pdf"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = PKUIScreenScale();
        PKUIImageFromPDF(v63, 45.0, 45.0, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPassMessage setImage:](v42, "setImage:", v65);
        objc_msgSend(v44, "addObject:", v42);
        -[PKThresholdTopUpSetupViewController setMessages:](v31, "setMessages:", v44);

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "loadFromCardFeatureDescriptor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_alloc_init(MEMORY[0x1E0D67460]);
    objc_msgSend(v66, "merchantIdentifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setMerchantIdentifier:", v68);

    objc_msgSend(v66, "supportedNetworks");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setSupportedNetworks:", v69);

    objc_msgSend(v67, "setMerchantCapabilities:", objc_msgSend(v66, "merchantCapabilities"));
    v70 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "countryCode");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setWithObject:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setSupportedCountries:", v72);

    -[PKThresholdTopUpSetupViewController setPaymentRequest:](v31, "setPaymentRequest:", v67);
    v73 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v73, "thresholdTopUpController:requestsPushViewController:", *(_QWORD *)(a1 + 32), v31);

    v12 = v79;
    v16 = v75;
  }
  else
  {
    v49 = [PKThresholdTopUpSetupViewController alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "currentBalance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "currency");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[PKThresholdTopUpSetupViewController initWithAmountSuggestions:selectedAmount:thresholdSuggestions:selectedThreshold:currencyCode:paymentMethodName:paymentMethodIdentifier:mode:viewStyle:delegate:](v49, "initWithAmountSuggestions:selectedAmount:thresholdSuggestions:selectedThreshold:currencyCode:paymentMethodName:paymentMethodIdentifier:mode:viewStyle:delegate:", v11, 0, v12, 0, v51, 0, 0, 0, 0, *(_QWORD *)(a1 + 32));

    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), v52);
    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_CREATE_TITLE"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setTitleText:](v52, "setTitleText:", v53);

    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_CREATE_SUBTITLE"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSubtitleText:](v52, "setSubtitleText:", v54);

    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_AMOUNT"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKThresholdTopUpSetupViewController setAmountTitle:](v52, "setAmountTitle:", v55);

    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_THRESHOLD"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKThresholdTopUpSetupViewController setThresholdTitle:](v52, "setThresholdTitle:", v56);

    v57 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v52);
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v52, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      -[PKNavigationController setModalPresentationStyle:](v57, "setModalPresentationStyle:", 2);
    }
    v58 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v58, "thresholdTopUpController:requestsPresentViewController:", *(_QWORD *)(a1 + 32), v57);

  }
}

void __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke_3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/en-us/HT207884"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openURL:configuration:completionHandler:", v0, 0, 0);

}

uint64_t __77__PKPeerPaymentThresholdTopUpController_presentTopUpFlowForRecurringPayment___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openPaymentSetupWithNetworkWhitelist:paymentSetupMode:", 0, 0);
}

- (id)_titleForErrorCode:(unint64_t)a3
{
  return (id)PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_ERROR_PROBLEM_TITLE"));
}

- (id)_messageForErrorCode:(unint64_t)a3
{
  const __CFString *v3;
  __CFString *v4;

  v3 = CFSTR("AUTO_RELOAD_ERROR_PROBLEM_MESSAGE_CUMULATIVE_LIMIT");
  if (a3 - 40305 > 1)
    v3 = CFSTR("AUTO_RELOAD_ERROR_PROBLEM_MESSAGE_PAYMENT_METHOD");
  if (a3 - 40340 >= 4)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("AUTO_RELOAD_ERROR_PROBLEM_MESSAGE_FRAUD");
  PKLocalizedPeerPaymentRecurringString(&v4->isa);
  return (id)objc_claimAutoreleasedReturnValue();
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
  v12[2] = __96__PKPeerPaymentThresholdTopUpController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E3E61A30;
  objc_copyWeak(v14, &location);
  v11 = v9;
  v13 = v11;
  v14[1] = (id)a4;
  objc_msgSend(v11, "preflightWithCompletion:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __96__PKPeerPaymentThresholdTopUpController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
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
  block[2] = __96__PKPeerPaymentThresholdTopUpController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
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

void __96__PKPeerPaymentThresholdTopUpController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "_paymentSetupNavigationControllerForProvisioningController:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPaymentSetupMode:", *(_QWORD *)(a1 + 56));
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __96__PKPeerPaymentThresholdTopUpController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v10[3] = &unk_1E3E619E0;
      v10[4] = v3;
      v11 = v4;
      v5 = v4;
      objc_msgSend(v5, "preflightWithCompletion:", v10);

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
      +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained(v3 + 1);
      objc_msgSend(v9, "thresholdTopUpController:requestsPresentViewController:", v3, v8);

    }
  }

}

void __96__PKPeerPaymentThresholdTopUpController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "thresholdTopUpController:requestsPresentViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4;
  PKPaymentSetupNavigationController *v5;

  v4 = a3;
  v5 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", v4, 0);

  -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v5, "setCustomFormSheetPresentationStyleForiPad");
  -[PKPaymentSetupNavigationController setSetupDelegate:](v5, "setSetupDelegate:", self);
  -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v5, "setShowsWelcomeViewController:", 0);
  return v5;
}

- (void)paymentSetupDidFinish:(id)a3
{
  PKPeerPaymentThresholdTopUpControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "thresholdTopUpController:requestsDismissViewController:", self, v5);

}

- (void)thresholdTopUpDidSelectCancel:(id)a3
{
  PKPeerPaymentThresholdTopUpControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "thresholdTopUpController:requestsDismissViewController:", self, v5);

}

- (void)thresholdTopUpPerformCancel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PKPeerPaymentThresholdTopUpController *v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[PKPeerPaymentRecurringPayment identifier](self->_existingTopUp, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling threshold top up", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke;
  v14[3] = &unk_1E3E69BF0;
  v15 = v8;
  v16 = self;
  v17 = v6;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v8;
  objc_msgSend(v10, "peerPaymentRecurringPaymentPerformAction:identifier:completion:", 2, v13, v14);

}

void __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[16];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke_3;
    v15[3] = &unk_1E3E65388;
    v8 = v6;
    v9 = *(_QWORD *)(a1 + 40);
    v16 = v8;
    v17 = v9;
    v18 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], v15);

    v10 = v16;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Deleting threshold top up from database", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke_57;
    v19[3] = &unk_1E3E65388;
    v14 = *(void **)(a1 + 48);
    v19[4] = *(_QWORD *)(a1 + 40);
    v20 = v14;
    v21 = *(id *)(a1 + 56);
    objc_msgSend(v12, "deleteRecurringPaymentsForIdentifiers:completion:", v13, v19);

    v10 = v20;
  }

}

void __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke_57(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke_2;
  block[3] = &unk_1E3E65388;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke_2(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = objc_loadWeakRetained((id *)(a1[4] + 8));
    objc_msgSend(v2, "thresholdTopUpController:requestsPopViewController:", a1[4], a1[5]);

  }
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);

}

void __80__PKPeerPaymentThresholdTopUpController_thresholdTopUpPerformCancel_completion___block_invoke_3(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id WeakRetained;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Cancelling threshold top up failed with error %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, &__block_literal_global_62, 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
  objc_msgSend(WeakRetained, "thresholdTopUpController:requestsPresentViewController:", a1[5], v5);

  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);

}

- (void)thresholdTopUpDidSelectContinue:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id actionCompletedBlock;
  void *v10;
  PKPeerPaymentActionController *v11;
  PKPeerPaymentActionController *controller;
  void *v13;
  void *v14;
  PKPeerPaymentActionController *v15;
  PKThresholdTopUpSetupViewController **p_vc;
  id WeakRetained;
  void *v18;
  void *v19;
  PKPeerPaymentActionController *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_actionCompletedBlock)
  {
    if (v6)
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }
  else
  {
    v8 = _Block_copy(v6);
    actionCompletedBlock = self->_actionCompletedBlock;
    self->_actionCompletedBlock = v8;

    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPeerPaymentActionController initWithPaymentPass:webService:context:passLibraryDataProvider:delegate:]([PKPeerPaymentActionController alloc], "initWithPaymentPass:webService:context:passLibraryDataProvider:delegate:", self->_pass, v10, self->_context, self->_passLibraryDataProvider, self);
    controller = self->_controller;
    self->_controller = v11;

    -[PKPeerPaymentActionController setControllerAction:](self->_controller, "setControllerAction:", 1);
    -[PKPeerPaymentAccount currentBalance](self->_account, "currentBalance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currency");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = self->_controller;
    p_vc = &self->_vc;
    WeakRetained = objc_loadWeakRetained((id *)&self->_vc);
    objc_msgSend(WeakRetained, "currentThreshold");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionController setThresholdAmount:](v15, "setThresholdAmount:", v19);

    v20 = self->_controller;
    v21 = objc_loadWeakRetained((id *)p_vc);
    objc_msgSend(v21, "currentAmount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionController performActionWithCurrencyAmount:](v20, "performActionWithCurrencyAmount:", v23);

  }
}

- (void)thresholdTopUpDidSelectUpdate:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id actionCompletedBlock;
  void *v10;
  PKPeerPaymentActionController *v11;
  PKPeerPaymentActionController *controller;
  void *v13;
  void *v14;
  PKPeerPaymentActionController *v15;
  void *v16;
  PKPeerPaymentActionController *v17;
  PKThresholdTopUpSetupViewController **p_vc;
  id WeakRetained;
  void *v20;
  void *v21;
  PKPeerPaymentActionController *v22;
  id v23;
  void *v24;
  PKPeerPaymentActionController *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_actionCompletedBlock)
  {
    if (v6)
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }
  else
  {
    v8 = _Block_copy(v6);
    actionCompletedBlock = self->_actionCompletedBlock;
    self->_actionCompletedBlock = v8;

    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPeerPaymentActionController initWithPaymentPass:webService:context:passLibraryDataProvider:delegate:]([PKPeerPaymentActionController alloc], "initWithPaymentPass:webService:context:passLibraryDataProvider:delegate:", self->_pass, v10, self->_context, self->_passLibraryDataProvider, self);
    controller = self->_controller;
    self->_controller = v11;

    -[PKPeerPaymentActionController setControllerAction:](self->_controller, "setControllerAction:", 1);
    -[PKPeerPaymentAccount currentBalance](self->_account, "currentBalance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currency");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = self->_controller;
    -[PKPeerPaymentRecurringPayment identifier](self->_existingTopUp, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionController setRecurringPaymentIdentifier:](v15, "setRecurringPaymentIdentifier:", v16);

    v17 = self->_controller;
    p_vc = &self->_vc;
    WeakRetained = objc_loadWeakRetained((id *)&self->_vc);
    objc_msgSend(WeakRetained, "currentThreshold");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionController setThresholdAmount:](v17, "setThresholdAmount:", v21);

    v22 = self->_controller;
    v23 = objc_loadWeakRetained((id *)&self->_vc);
    objc_msgSend(v23, "selectedPass");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionController setAlternateFundingSource:](v22, "setAlternateFundingSource:", v24);

    v25 = self->_controller;
    v26 = objc_loadWeakRetained((id *)p_vc);
    objc_msgSend(v26, "currentAmount");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionController performActionWithCurrencyAmount:](v25, "performActionWithCurrencyAmount:", v28);

  }
}

- (void)peerPaymentActionController:(id)a3 hasChangedState:(unint64_t)a4
{
  id v6;
  void (**actionCompletedBlock)(id, _QWORD);
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[16];

  v6 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAccount currentBalance](self->_account, "currentBalance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currency");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_vc);
    objc_msgSend(WeakRetained, "currentAmount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_loadWeakRetained((id *)&self->_vc);
    objc_msgSend(v17, "currentThreshold");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "Updating local threshold top up", buf, 2u);
    }

    objc_msgSend(v6, "recurringPaymentIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __85__PKPeerPaymentThresholdTopUpController_peerPaymentActionController_hasChangedState___block_invoke;
    v25[3] = &unk_1E3E69C58;
    v25[4] = self;
    v26 = v16;
    v27 = v19;
    v28 = v12;
    v22 = v12;
    v23 = v19;
    v24 = v16;
    objc_msgSend(v22, "updateAutoReloadAmount:threshold:identifier:completion:", v24, v23, v21, v25);

    goto LABEL_10;
  }
  actionCompletedBlock = (void (**)(id, _QWORD))self->_actionCompletedBlock;
  if (actionCompletedBlock)
  {
    actionCompletedBlock[2](actionCompletedBlock, 0);
    v8 = self->_actionCompletedBlock;
    self->_actionCompletedBlock = 0;

  }
  if (a4 - 3 <= 1)
  {
    v9 = objc_loadWeakRetained((id *)&self->_vc);
    objc_msgSend(v9, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_10:

  }
}

void __85__PKPeerPaymentThresholdTopUpController_peerPaymentActionController_hasChangedState___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__PKPeerPaymentThresholdTopUpController_peerPaymentActionController_hasChangedState___block_invoke_2;
  v3[3] = &unk_1E3E62460;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __85__PKPeerPaymentThresholdTopUpController_peerPaymentActionController_hasChangedState___block_invoke_2(id *a1)
{
  id v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  PKExplanationViewController *v8;
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
  id v20;
  void *v21;
  NSObject *v22;
  uint8_t buf[16];

  v2 = a1[4];
  v3 = *((_QWORD *)v2 + 9);
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
    v4 = a1[4];
    v5 = (void *)v4[9];
    v4[9] = 0;

    v2 = a1[4];
  }
  WeakRetained = objc_loadWeakRetained((id *)v2 + 3);
  v7 = objc_msgSend(WeakRetained, "mode");

  if (!v7)
  {
    v8 = -[PKExplanationViewController initWithContext:]([PKExplanationViewController alloc], "initWithContext:", *((_QWORD *)a1[4] + 4));
    -[PKExplanationViewController setShowCancelButton:](v8, "setShowCancelButton:", 0);
    -[PKExplanationViewController navigationItem](v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidesBackButton:", 1);

    -[PKExplanationViewController explanationView](v8, "explanationView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShowPrivacyView:", 0);
    objc_msgSend(v10, "setDelegate:", a1[4]);
    objc_msgSend(a1[4], "_setupCompleteImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v11);

    objc_msgSend(v10, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setCornerRadius:", 14.0);

    objc_msgSend(a1[5], "minimalFormattedStringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "minimalFormattedStringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_SETUP_COMPLETE_SUBTITLE"), CFSTR("%@%@"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBodyText:", v15);

    objc_msgSend(v10, "setShowCheckmark:", 1);
    objc_msgSend(v10, "dockView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "primaryButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_SETUP_COMPLETE_DONE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:forState:", v18, 0);

    PKLocalizedPeerPaymentRecurringString(CFSTR("AUTO_RELOAD_SETUP_COMPLETE_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleText:", v19);

    v20 = objc_loadWeakRetained((id *)a1[4] + 3);
    objc_msgSend(v20, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pushViewController:animated:", v8, 1);

  }
  PKLogFacilityTypeGetObject();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "Updating recurring peer payments following successful setup", buf, 2u);
  }

  return objc_msgSend(a1[7], "updateRecurringPaymentsWithCompletion:", &__block_literal_global_75);
}

void __85__PKPeerPaymentThresholdTopUpController_peerPaymentActionController_hasChangedState___block_invoke_73()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19D178000, v0, OS_LOG_TYPE_DEFAULT, "Updated recurring peer payments after successful setup", v1, 2u);
  }

}

- (id)_setupCompleteImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 60.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("dollarsign.arrow.circlepath"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTintColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKUIImageWithBackground(v5, v6, 80.0, 80.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)peerPaymentActionController:(id)a3 requestPresentViewController:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_vc);
  objc_msgSend(WeakRetained, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "presentViewController:animated:completion:", v8, 1, 0);
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "thresholdTopUpController:requestsPresentViewController:", self, v8);

  }
}

- (id)presentationSceneIdentifierForPeerPaymentActionController:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationSceneIdentifierForTopUpController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)presentationSceneBundleIdentifierForPeerPaymentActionController:(id)a3
{
  return 0;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "thresholdTopUpControllerCompletedSetup:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionCompletedBlock, 0);
  objc_storeStrong((id *)&self->_existingTopUp, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_vc);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
