@implementation PKPeerPaymentActionController

+ (BOOL)canPerformPeerPaymentAction:(unint64_t)a3 account:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  return +[PKPeerPaymentActionController canPerformPeerPaymentAction:account:unableReason:displayableError:](PKPeerPaymentActionController, "canPerformPeerPaymentAction:account:unableReason:displayableError:", a3, a4, &v6, &v5);
}

+ (BOOL)canPerformPeerPaymentAction:(unint64_t)a3 account:(id)a4 unableReason:(unint64_t *)a5 displayableError:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  unint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;

  v10 = a4;
  v11 = v10;
  if (a3 == 3)
  {
    if (!objc_msgSend(v10, "supportsRecurringPayments"))
      goto LABEL_14;
    objc_msgSend(v11, "recurringPaymentsFeatureDescriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc_init(MEMORY[0x1E0D67460]);
    objc_msgSend(v23, "merchantIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMerchantIdentifier:", v25);

    objc_msgSend(v23, "supportedNetworks");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSupportedNetworks:", v26);

    objc_msgSend(v24, "setMerchantCapabilities:", objc_msgSend(v23, "merchantCapabilities"));
    v27 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v11, "countryCode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithObject:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSupportedCountries:", v29);

    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_defaultPaymentPassForPaymentRequest:", v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v31 != 0;
    v22 = 4 * (v31 == 0);

    if (!a5)
      goto LABEL_18;
    goto LABEL_17;
  }
  if (a3 == 2)
  {
    if ((objc_msgSend(v10, "supportsTransferToBank") & 1) == 0
      && !objc_msgSend(v11, "supportsInstantWithdrawal"))
    {
      goto LABEL_14;
    }
    v22 = 0;
    v21 = 1;
    if (!a5)
      goto LABEL_18;
LABEL_17:
    *a5 = v22;
    goto LABEL_18;
  }
  if (a3 != 1)
  {
    v22 = 0;
    v21 = 0;
    if (!a5)
      goto LABEL_18;
    goto LABEL_17;
  }
  if (objc_msgSend(v10, "supportsLoadFromCard"))
  {
    objc_msgSend(v11, "loadFromCardFeatureDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0D67460]);
    objc_msgSend(v12, "merchantIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMerchantIdentifier:", v14);

    objc_msgSend(v12, "supportedNetworks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSupportedNetworks:", v15);

    objc_msgSend(v13, "setMerchantCapabilities:", objc_msgSend(v12, "merchantCapabilities"));
    v16 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v11, "countryCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSupportedCountries:", v18);

    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_defaultPaymentPassForPaymentRequest:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 != 0;
    v33 = v12;
    if (v20)
    {
      v22 = 0;
    }
    else if ((objc_msgSend(v12, "merchantCapabilities") & 8) != 0)
    {
      if ((objc_msgSend(v12, "merchantCapabilities") & 4) != 0)
        v22 = 3;
      else
        v22 = 4;
    }
    else
    {
      v22 = 3;
    }

    if (!a5)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_14:
  v21 = 0;
  v22 = 2;
  if (a5)
    goto LABEL_17;
LABEL_18:
  if (a6)
  {
    objc_msgSend(a1, "displayableErrorForPeerPaymentAction:andReason:", a3, v22);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (id)displayableErrorForPeerPaymentAction:(unint64_t)a3 andReason:(unint64_t)a4
{
  void *v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACTION_UNAVAILABLE_GENERIC_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a4)
  {
    case 4uLL:
      if (a3 == 3)
      {
        PKLocalizedPeerPaymentRecurringString(CFSTR("SETUP_NO_DEBIT_CARD_AVAILABLE_TITLE"));
        v8 = objc_claimAutoreleasedReturnValue();

        PKLocalizedPeerPaymentRecurringString(CFSTR("SETUP_NO_DEBIT_CARD_AVAILABLE_MESSAGE"));
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (a3 != 1)
        goto LABEL_11;
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACTION_UNAVAILABLE_REASON_ADD_MONEY_NO_DEBIT_PAYMENT_CARDS_AVAILABLE_TITLE"));
      v8 = objc_claimAutoreleasedReturnValue();

      v9 = CFSTR("PEER_PAYMENT_ACTION_UNAVAILABLE_REASON_ADD_MONEY_NO_DEBIT_PAYMENT_CARDS_AVAILABLE_DESCRIPTION");
LABEL_10:
      PKLocalizedPeerPaymentString(&v9->isa);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v11 = (void *)v10;
      v6 = (void *)v8;
      goto LABEL_15;
    case 3uLL:
      if (a3 != 1)
        goto LABEL_11;
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACTION_UNAVAILABLE_REASON_ADD_MONEY_NO_PAYMENT_CARDS_AVAILABLE_TITLE"));
      v8 = objc_claimAutoreleasedReturnValue();

      v9 = CFSTR("PEER_PAYMENT_ACTION_UNAVAILABLE_REASON_ADD_MONEY_NO_PAYMENT_CARDS_AVAILABLE_DESCRIPTION");
      goto LABEL_10;
    case 2uLL:
LABEL_11:
      v7 = CFSTR("PEER_PAYMENT_ACTION_UNAVAILABLE_FEATURE_NOT_SUPPORTED_DESCRIPTION");
      goto LABEL_12;
  }
  v7 = CFSTR("PEER_PAYMENT_ACTION_UNAVAILABLE_GENERIC_DESCRIPTION");
LABEL_12:
  PKLocalizedPeerPaymentString(&v7->isa);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  PKDisplayableErrorCustom();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)alertControllerForPeerPaymentActionUnableReason:(unint64_t)a3 displayableError:(id)a4 addCardActionHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v7 = a5;
  if (a4)
  {
    v8 = (void *)MEMORY[0x1E0DC3450];
    v9 = a4;
    PKTitleForDisplayableError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE46BC](v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
    a4 = (id)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("CANCEL_BUTTON_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a4, "addAction:", v14);
    if (a3 - 3 <= 1 && v7)
    {
      v15 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACTION_UNAVAILABLE_ADD_CARD_BUTTON_TITLE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __119__PKPeerPaymentActionController_alertControllerForPeerPaymentActionUnableReason_displayableError_addCardActionHandler___block_invoke;
      v19[3] = &unk_1E3E61CA8;
      v20 = v7;
      objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a4, "addAction:", v17);
      objc_msgSend(a4, "setPreferredAction:", v17);

    }
  }

  return a4;
}

uint64_t __119__PKPeerPaymentActionController_alertControllerForPeerPaymentActionUnableReason_displayableError_addCardActionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PKPeerPaymentActionController)initWithPaymentPass:(id)a3 webService:(id)a4 context:(int64_t)a5 passLibraryDataProvider:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPeerPaymentActionController *v17;
  PKPeerPaymentActionController *v18;
  void *v19;
  uint64_t v20;
  PKPeerPaymentAccount *account;
  PKBankAccountInformation *v22;
  PKBankAccountInformation *bankInformation;
  void *v24;
  uint64_t v25;
  void *v26;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PKPeerPaymentActionController;
  v17 = -[PKPeerPaymentActionController init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_pass, a3);
    objc_storeStrong((id *)&v18->_peerPaymentWebService, a4);
    v18->_context = a5;
    objc_storeWeak((id *)&v18->_delegate, v16);
    v18->_controllerAction = 0;
    -[PKPeerPaymentWebService targetDevice](v18->_peerPaymentWebService, "targetDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "account");
    v20 = objc_claimAutoreleasedReturnValue();
    account = v18->_account;
    v18->_account = (PKPeerPaymentAccount *)v20;

    v22 = (PKBankAccountInformation *)objc_alloc_init(MEMORY[0x1E0D66BC8]);
    bankInformation = v18->_bankInformation;
    v18->_bankInformation = v22;

    objc_storeStrong((id *)&v18->_passLibraryDataProvider, a6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0D6B2B8];
    -[PKPeerPaymentWebService targetDevice](v18->_peerPaymentWebService, "targetDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v18, sel__handlePeerPaymentAccountDidChangeNotification_, v25, v26);

  }
  return v18;
}

- (void)performActionWithCurrencyAmount:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  PKPeerPaymentController *v9;
  PKPeerPaymentController *peerPaymentController;
  unint64_t controllerAction;
  PKPeerPaymentController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKPeerPaymentController *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke;
  aBlock[3] = &unk_1E3E77E48;
  aBlock[4] = self;
  v6 = v4;
  v23 = v6;
  v7 = _Block_copy(aBlock);
  if (self->_performingAction)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[PKPeerPaymentActionController performActionWithCurrencyAmount:]";
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "%s: Cannot Present - already performing action", buf, 0xCu);
    }

    -[PKPeerPaymentActionController _peerPaymentActionHasCompletedWithState:](self, "_peerPaymentActionHasCompletedWithState:", 2);
    goto LABEL_14;
  }
  if (!self->_peerPaymentController)
  {
    v9 = (PKPeerPaymentController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D673F8]), "initWithPeerPaymentWebService:", self->_peerPaymentWebService);
    peerPaymentController = self->_peerPaymentController;
    self->_peerPaymentController = v9;

    -[PKPeerPaymentController setDelegate:](self->_peerPaymentController, "setDelegate:", self);
  }
  controllerAction = self->_controllerAction;
  switch(controllerAction)
  {
    case 3uLL:
      -[PKBankAccountInformation updateToLatestKeychainData](self->_bankInformation, "updateToLatestKeychainData");
      v12 = self->_peerPaymentController;
      -[PKBankAccountInformation routingNumber](self->_bankInformation, "routingNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKBankAccountInformation accountNumber](self->_bankInformation, "accountNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKBankAccountInformation bankName](self->_bankInformation, "bankName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v5;
      v20[1] = 3221225472;
      v20[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_52;
      v20[3] = &unk_1E3E6DA48;
      v20[4] = self;
      v21 = v7;
      -[PKPeerPaymentController identifyRecipientWithRoutingNumber:accountNumber:accountName:completion:](v12, "identifyRecipientWithRoutingNumber:accountNumber:accountName:completion:", v13, v14, v15, v20);

      v16 = v21;
LABEL_13:

      break;
    case 2uLL:
      v17 = self->_peerPaymentController;
      v18[0] = v5;
      v18[1] = 3221225472;
      v18[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_3_55;
      v18[3] = &unk_1E3E6DA48;
      v18[4] = self;
      v19 = v7;
      -[PKPeerPaymentController identifyRecipientDebitCardWithCompletion:](v17, "identifyRecipientDebitCardWithCompletion:", v18);
      v16 = v19;
      goto LABEL_13;
    case 1uLL:
      -[PKPeerPaymentController identifyRecipientSelf](self->_peerPaymentController, "identifyRecipientSelf");
      (*((void (**)(void *, PKPeerPaymentController *))v7 + 2))(v7, self->_peerPaymentController);
      break;
  }
LABEL_14:

}

void __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "selectMode:", objc_msgSend(*(id *)(a1 + 32), "_peerPaymentControllerModeForAction"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(v4 + 104);
  v6 = *(_QWORD *)(v4 + 112);
  objc_msgSend(*(id *)(v4 + 96), "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_2;
  v11[3] = &unk_1E3E77E20;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v9;
  v10 = v3;
  objc_msgSend(v10, "quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:", v5, 3, 0, v6, 0, v7, 0, 0, v8, v11);

}

uint64_t __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  _QWORD v6[5];

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 40), "_handleError:", a4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_3;
  v6[3] = &unk_1E3E77DF8;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v4, "performQuote:completion:", a3, v6);
}

void __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_4;
  v11[3] = &unk_1E3E64E10;
  v14 = a2;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id WeakRetained;
  _QWORD v10[5];

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = *(_QWORD **)(a1 + 32);
    if (!v2[13])
    {
      objc_msgSend(*(id *)(a1 + 40), "recurringPaymentIdentifier");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 104);
      *(_QWORD *)(v4 + 104) = v3;

      v2 = *(_QWORD **)(a1 + 32);
    }
    v6 = 0;
    goto LABEL_5;
  }
  v7 = *(void **)(a1 + 48);
  if (!v7)
  {
    v2 = *(_QWORD **)(a1 + 32);
    v6 = 2;
LABEL_5:
    objc_msgSend(v2, "_peerPaymentActionHasCompletedWithState:", v6);
    return;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_5;
  v10[3] = &unk_1E3E612E8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, v10, 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "peerPaymentActionController:requestPresentViewController:", *(_QWORD *)(a1 + 32), v8);

}

uint64_t __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_peerPaymentActionHasCompletedWithState:", 2);
}

void __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_52(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_2_53;
  v8[3] = &unk_1E3E74190;
  v11 = a2;
  v6 = *(id *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v8[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_2_53(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 56) == 1)
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  else
    return objc_msgSend(*(id *)(a1 + 32), "_handleError:", *(_QWORD *)(a1 + 40));
}

void __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_3_55(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_4_56;
  v8[3] = &unk_1E3E74190;
  v11 = a2;
  v6 = *(id *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v8[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __65__PKPeerPaymentActionController_performActionWithCurrencyAmount___block_invoke_4_56(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 56) == 1)
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  else
    return objc_msgSend(*(id *)(a1 + 32), "_handleError:", *(_QWORD *)(a1 + 40));
}

- (void)_peerPaymentActionHasCompletedWithState:(unint64_t)a3
{
  id WeakRetained;

  self->_performingAction = 0;
  if (a3 == 2)
    -[PKPeerPaymentController reset](self->_peerPaymentController, "reset");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "peerPaymentActionController:hasChangedState:", self, a3);

}

- (void)bankAccountInformationViewControllerChangedBankAccountInformation:(id)a3
{
  id WeakRetained;

  -[PKBankAccountInformation updateToLatestKeychainData](self->_bankInformation, "updateToLatestKeychainData", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "peerPaymentActionController:hasChangedState:", self, 5);

}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
  -[PKPeerPaymentActionController _peerPaymentActionHasCompletedWithState:](self, "_peerPaymentActionHasCompletedWithState:", 4);
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  -[PKPeerPaymentActionController _peerPaymentActionHasCompletedWithState:](self, "_peerPaymentActionHasCompletedWithState:", 3);
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  -[PKPeerPaymentActionController _peerPaymentActionHasCompletedWithState:](self, "_peerPaymentActionHasCompletedWithState:", 4);
}

- (id)presentationSceneIdentifierForPeerPaymentController:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presentationSceneIdentifierForPeerPaymentActionController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)presentationSceneBundleIdentifierForPeerPaymentController:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presentationSceneBundleIdentifierForPeerPaymentActionController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_handleError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPeerPaymentActionController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PKPeerPaymentActionController__handleError___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __46__PKPeerPaymentActionController__handleError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  id WeakRetained;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id *v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  _QWORD aBlock[6];

  switch(objc_msgSend(MEMORY[0x1E0D673F8], "proposedResolutionForError:", *(_QWORD *)(a1 + 32)))
  {
    case 0:
      goto LABEL_9;
    case 1:
      if (!*(_QWORD *)(a1 + 32))
      {
LABEL_9:
        objc_msgSend(*(id *)(a1 + 40), "_peerPaymentActionHasCompletedWithState:", 2);
        return;
      }
      objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "userInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__PKPeerPaymentActionController__handleError___block_invoke_2;
      aBlock[3] = &unk_1E3E612E8;
      aBlock[4] = *(_QWORD *)(a1 + 40);
      v6 = _Block_copy(aBlock);
      objc_msgSend(v4, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6B2D8]);

      if (!v8)
        goto LABEL_21;
      if (!objc_msgSend(v4, "code"))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) - 1;
        if (v12 > 2)
        {
          v15 = 0;
          v14 = 0;
        }
        else
        {
          v13 = off_1E3E77EA8[v12];
          PKLocalizedPeerPaymentString(&off_1E3E77E90[v12]->isa);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentString(&v13->isa);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        PKDisplayableErrorCustom();
        v16 = objc_claimAutoreleasedReturnValue();

        goto LABEL_26;
      }
      if (objc_msgSend(v4, "code") == 40301)
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
        if (v9 == 3)
        {
          v10 = CFSTR("PEER_PAYMENT_INSUFFICIENT_BALANCE_TRANSFER_TO_BANK_ERROR_DESCRIPTION");
          v11 = CFSTR("PEER_PAYMENT_INSUFFICIENT_BALANCE_TRANSFER_TO_BANK_ERROR_TITLE");
        }
        else
        {
          if (v9 != 2)
          {
            v15 = 0;
            v14 = 0;
            goto LABEL_25;
          }
          v10 = CFSTR("PEER_PAYMENT_INSUFFICIENT_BALANCE_TRANSFER_TO_DEBIT_CARD_ERROR_DESCRIPTION");
          v11 = CFSTR("PEER_PAYMENT_INSUFFICIENT_BALANCE_TRANSFER_TO_DEBIT_CARD_ERROR_TITLE");
        }
        PKLocalizedPeerPaymentString(&v11->isa);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(&v10->isa);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
        PKDisplayableErrorCustom();
        v16 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "_updateAccountWithCompletion:", 0);
LABEL_26:
        v2 = (void *)v16;
        goto LABEL_27;
      }
      if (objc_msgSend(v4, "code") == 40317)
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) == 3)
        {
          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_BANK_INFORMATION_ERROR_TITLE"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_BANK_INFORMATION_ERROR_DESCRIPTION"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
          v14 = 0;
        }
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedString(CFSTR("CANCEL"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v5;
        v34[1] = 3221225472;
        v34[2] = __46__PKPeerPaymentActionController__handleError___block_invoke_3;
        v34[3] = &unk_1E3E61CA8;
        v29 = &v35;
        v35 = v6;
        objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 1, v34);
        v28 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_BANK_INFORMATION_ERROR_UPDATE_ACCOUNT_BUTTON"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v5;
        v22 = (void *)v28;
        v33[1] = 3221225472;
        v33[2] = __46__PKPeerPaymentActionController__handleError___block_invoke_4;
        v33[3] = &unk_1E3E61D68;
        v33[4] = *(_QWORD *)(a1 + 40);
        v23 = v33;
      }
      else
      {
        if (objc_msgSend(v4, "code") != 40318)
        {
LABEL_21:
          v14 = 0;
          v15 = 0;
LABEL_27:
          v17 = PKAlertForDisplayableErrorWithHandlers(v2, 0, v6, 0);
          goto LABEL_28;
        }
        PKLocalizedPeerPaymentString(&CFSTR("PEER_PAYMENT_ACTION_UNAVAILABLE_REASON_ADD_MONEY_NO_INSTANT_FUNDS_OUT_DEBIT_PAYMEN"
                                            "T_CARDS_AVAILABLE_TITLE").isa);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(&CFSTR("PEER_PAYMENT_ACTION_UNAVAILABLE_REASON_ADD_MONEY_NO_INSTANT_FUNDS_OUT_DEBIT_PAYMEN"
                                            "T_CARDS_AVAILABLE_DESCRIPTION").isa);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedString(CFSTR("CANCEL"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v5;
        v31[1] = 3221225472;
        v31[2] = __46__PKPeerPaymentActionController__handleError___block_invoke_5;
        v31[3] = &unk_1E3E61CA8;
        v29 = &v32;
        v32 = v6;
        objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, v31);
        v28 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACTION_UNAVAILABLE_ADD_CARD_BUTTON_TITLE"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v5;
        v22 = (void *)v28;
        v30[1] = 3221225472;
        v30[2] = __46__PKPeerPaymentActionController__handleError___block_invoke_6;
        v30[3] = &unk_1E3E61D68;
        v30[4] = *(_QWORD *)(a1 + 40);
        v23 = v30;
      }
      objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v23, v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "addAction:", v22);
      objc_msgSend(v17, "addAction:", v27);
      objc_msgSend(v17, "setPreferredAction:", v27);

      if (!v17)
        goto LABEL_27;
LABEL_28:
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));
      objc_msgSend(WeakRetained, "peerPaymentActionController:requestPresentViewController:", *(_QWORD *)(a1 + 40), v17);

      return;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "_presentTermsAndConditionsWithError:", *(_QWORD *)(a1 + 32));
      return;
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "_presentIdentityVerificationWithError:", *(_QWORD *)(a1 + 32));
      return;
    default:
      return;
  }
}

uint64_t __46__PKPeerPaymentActionController__handleError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_peerPaymentActionHasCompletedWithState:", 2);
}

uint64_t __46__PKPeerPaymentActionController__handleError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__PKPeerPaymentActionController__handleError___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentAddBankAccountViewController");
}

uint64_t __46__PKPeerPaymentActionController__handleError___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__PKPeerPaymentActionController__handleError___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentAddDebitCardViewController");
}

- (void)_presentIdentityVerificationWithError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  PKPeerPaymentIdentityVerificationController *v14;
  void *WeakRetained;
  PKNavigationController *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  uint8_t buf[8];
  _QWORD v25[5];

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

  if (v6)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  v9 = PKDeviceSupportsPeerPaymentIdentityVerification();
  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D6A3A0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v9 & 1) == 0)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __71__PKPeerPaymentActionController__presentIdentityVerificationWithError___block_invoke;
    v25[3] = &unk_1E3E612E8;
    v25[4] = self;
    PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(v25);
    v14 = (PKPeerPaymentIdentityVerificationController *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "peerPaymentActionController:requestPresentViewController:", self, v14);
LABEL_12:

    goto LABEL_13;
  }
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Presenting identity verification flow.", buf, 2u);
    }

    v14 = -[PKPeerPaymentIdentityVerificationController initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:]([PKPeerPaymentIdentityVerificationController alloc], "initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:", self->_peerPaymentWebService, v11, self, 0, self->_context);
    -[PKPeerPaymentIdentityVerificationController firstViewController](v14, "firstViewController");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained)
    {
      v16 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", WeakRetained);
      -[PKNavigationController setSupportedInterfaceOrientations:](v16, "setSupportedInterfaceOrientations:", 2);
      -[PKNavigationController setModalInPresentation:](v16, "setModalInPresentation:", 1);
      if (objc_msgSend(WeakRetained, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
        -[PKNavigationController setModalPresentationStyle:](v16, "setModalPresentationStyle:", 2);
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v17, "peerPaymentActionController:requestPresentViewController:", self, v16);

    }
    goto LABEL_12;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Cannot present identity verification flow because the response data is nil", buf, 2u);
  }

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_GENERIC_ERROR_TITLE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_GENERIC_ERROR_MESSAGE"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustom();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __71__PKPeerPaymentActionController__presentIdentityVerificationWithError___block_invoke_99;
  v23[3] = &unk_1E3E612E8;
  v23[4] = self;
  v21 = PKAlertForDisplayableErrorWithHandlers(v20, 0, v23, 0);
  v22 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v22, "peerPaymentActionController:requestPresentViewController:", self, v21);

  v4 = v20;
LABEL_13:

}

uint64_t __71__PKPeerPaymentActionController__presentIdentityVerificationWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_peerPaymentActionHasCompletedWithState:", 2);
}

uint64_t __71__PKPeerPaymentActionController__presentIdentityVerificationWithError___block_invoke_99(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_peerPaymentActionHasCompletedWithState:", 2);
}

- (void)_presentTermsAndConditionsWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKPeerPaymentActionController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PKPeerPaymentActionController _updateAccountWithCompletion:](self, "_updateAccountWithCompletion:", v6);

}

void __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  PKPeerPaymentTermsController *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id WeakRetained;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

  if (v4)
  {
    objc_msgSend(v2, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v6;
  }
  objc_msgSend(v2, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D6BA30]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "termsURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "termsIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (!v12)
    goto LABEL_11;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "termsURL");
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "termsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (v9)
    {
      v11 = v9;
      v9 = (void *)v13;
LABEL_11:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "associatedPassUniqueID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PKPeerPaymentTermsController initWithTermsURL:termsIdentifier:passUniqueID:webService:]([PKPeerPaymentTermsController alloc], "initWithTermsURL:termsIdentifier:passUniqueID:webService:", v9, v11, v14, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
      v16 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = v15;

      objc_initWeak(location, *(id *)(a1 + 40));
      v17 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
      v18 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_2;
      v36[3] = &unk_1E3E77E70;
      objc_copyWeak(&v37, location);
      objc_msgSend(v17, "setCustomPresentationHandler:", v36);
      v19 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
      v34[0] = v18;
      v34[1] = 3221225472;
      v34[2] = __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_3;
      v34[3] = &unk_1E3E634A8;
      objc_copyWeak(&v35, location);
      objc_msgSend(v19, "presentTermsOverController:showInterstitialViewController:withCompletionHandler:", 0, 1, v34);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&v37);
      objc_destroyWeak(location);

      goto LABEL_18;
    }
    PKLogFacilityTypeGetObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v28;
      _os_log_impl(&dword_19D178000, v27, OS_LOG_TYPE_DEFAULT, "Error: Cannot present terms with a nil terms identifier for account %@", (uint8_t *)location, 0xCu);
    }

    v30 = *(_QWORD *)(a1 + 40);
    v29 = (_QWORD *)(a1 + 40);
    v31 = (void *)*(v29 - 1);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_101;
    v38[3] = &unk_1E3E612E8;
    v38[4] = v30;
    v32 = PKAlertForDisplayableErrorWithHandlers(v31, 0, v38, 0);
    WeakRetained = objc_loadWeakRetained((id *)(*v29 + 80));
    objc_msgSend(WeakRetained, "peerPaymentActionController:requestPresentViewController:", *v29, v32);

    v9 = (void *)v13;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v21;
      _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "Error: Cannot present a nil terms URL for account %@", (uint8_t *)location, 0xCu);
    }

    v23 = *(_QWORD *)(a1 + 40);
    v22 = (_QWORD *)(a1 + 40);
    v24 = (void *)*(v22 - 1);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_100;
    v39[3] = &unk_1E3E612E8;
    v39[4] = v23;
    v25 = PKAlertForDisplayableErrorWithHandlers(v24, 0, v39, 0);
    v26 = objc_loadWeakRetained((id *)(*v22 + 80));
    objc_msgSend(v26, "peerPaymentActionController:requestPresentViewController:", *v22, v25);

  }
LABEL_18:

}

uint64_t __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_100(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_peerPaymentActionHasCompletedWithState:", 2);
}

uint64_t __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_101(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_peerPaymentActionHasCompletedWithState:", 2);
}

void __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *WeakRetained;
  id *v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 10);
    objc_msgSend(v6, "peerPaymentActionController:requestPresentViewController:", v5, v7);

  }
}

void __69__PKPeerPaymentActionController__presentTermsAndConditionsWithError___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_peerPaymentActionHasCompletedWithState:", 1);
    WeakRetained = v2;
  }

}

- (void)_handlePeerPaymentAccountDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKPeerPaymentActionController__handlePeerPaymentAccountDidChangeNotification___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __80__PKPeerPaymentActionController__handlePeerPaymentAccountDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "targetDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (unint64_t)_peerPaymentControllerModeForAction
{
  unint64_t v2;

  v2 = self->_controllerAction - 1;
  if (v2 > 2)
    return 0;
  else
    return qword_19DF17C90[v2];
}

- (void)_updateAccountWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PKPeerPaymentWebService peerPaymentService](self->_peerPaymentWebService, "peerPaymentService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PKPeerPaymentActionController__updateAccountWithCompletion___block_invoke;
  v7[3] = &unk_1E3E65DE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateAccountWithCompletion:", v7);

}

void __62__PKPeerPaymentActionController__updateAccountWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  block[2] = __62__PKPeerPaymentActionController__updateAccountWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E65388;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __62__PKPeerPaymentActionController__updateAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentAddBankAccountViewController
{
  PKAddBankAccountInformationViewController *v3;
  PKNavigationController *v4;
  id WeakRetained;
  id v6;

  -[PKPeerPaymentAccount countryCode](self->_account, "countryCode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PKAddBankAccountInformationViewController initWithDelegate:bankInformation:accountCountryCode:]([PKAddBankAccountInformationViewController alloc], "initWithDelegate:bankInformation:accountCountryCode:", self, self->_bankInformation, v6);
  v4 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v3);
  -[PKNavigationController setModalInPresentation:](v4, "setModalInPresentation:", 1);
  -[PKNavigationController setSupportedInterfaceOrientations:](v4, "setSupportedInterfaceOrientations:", 2);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v3, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "peerPaymentActionController:requestPresentViewController:", self, v4);

}

- (void)presentAddDebitCardViewController
{
  id v3;
  void *v4;
  PKNavigationController *v5;
  void *v6;
  PKPeerPaymentSetupFlowProvisionConfiguration *v7;
  PKPeerPaymentSetupFlowController *v8;
  PKPaymentAddDebitCardViewController *v9;
  void *v10;
  void *v11;
  PKPeerPaymentSetupFlowController *v12;
  PKPeerPaymentSetupFlowProvisionConfiguration *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  id v20;

  v3 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v3, "initWithWebService:", v4);

  v5 = objc_alloc_init(PKNavigationController);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67408]), "initWithPeerPaymentAccount:", self->_account);
  v7 = -[PKPeerPaymentSetupFlowProvisionConfiguration initWithSetupDelegate:]([PKPeerPaymentSetupFlowProvisionConfiguration alloc], "initWithSetupDelegate:", self);
  v8 = -[PKPeerPaymentSetupFlowController initWithPeerPaymentCredential:provisioningController:passLibraryDataProvider:configuration:context:]([PKPeerPaymentSetupFlowController alloc], "initWithPeerPaymentCredential:provisioningController:passLibraryDataProvider:configuration:context:", v6, v20, self->_passLibraryDataProvider, v7, self->_context);
  v9 = -[PKPaymentAddDebitCardViewController initWithPeerPaymentSetupFlowController:]([PKPaymentAddDebitCardViewController alloc], "initWithPeerPaymentSetupFlowController:", v8);
  -[PKExplanationViewController setExplanationViewControllerDelegate:](v9, "setExplanationViewControllerDelegate:", self);
  -[PKPeerPaymentAccount instantWithdrawalPromotionFeatureDescriptor](self->_account, "instantWithdrawalPromotionFeatureDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "feePercentage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v19 = v10;
    v12 = v8;
    v13 = v7;
    v14 = v6;
    v15 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v15, "setNumberStyle:", 3);
    objc_msgSend(v15, "setMaximumFractionDigits:", 1);
    objc_msgSend(v15, "stringFromNumber:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_ADD_DEBIT_CARD_MESSAGE_WITH_FEE"), CFSTR("%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v14;
    v7 = v13;
    v8 = v12;
    v10 = v19;
  }
  else
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_ADD_DEBIT_CARD_MESSAGE_DEFAULT"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PKPaymentAddDebitCardViewController setBodyText:](v9, "setBodyText:", v17);
  -[PKPaymentAddDebitCardViewController setShowDebitCardHeroView:](v9, "setShowDebitCardHeroView:", 0);
  -[PKExplanationViewController setShowCancelButton:](v9, "setShowCancelButton:", 1);
  -[PKNavigationController setModalInPresentation:](v5, "setModalInPresentation:", 1);
  -[PKNavigationController setSupportedInterfaceOrientations:](v5, "setSupportedInterfaceOrientations:", 2);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v9, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
  }
  -[PKNavigationController pushViewController:animated:](v5, "pushViewController:animated:", v9, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "peerPaymentActionController:requestPresentViewController:", self, v5);

}

- (unint64_t)controllerAction
{
  return self->_controllerAction;
}

- (void)setControllerAction:(unint64_t)a3
{
  self->_controllerAction = a3;
}

- (PKPeerPaymentActionControllerDelegate)delegate
{
  return (PKPeerPaymentActionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PKBankAccountInformation)bankInformation
{
  return self->_bankInformation;
}

- (PKCurrencyAmount)thresholdAmount
{
  return self->_thresholdAmount;
}

- (void)setThresholdAmount:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdAmount, a3);
}

- (NSString)recurringPaymentIdentifier
{
  return self->_recurringPaymentIdentifier;
}

- (void)setRecurringPaymentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recurringPaymentIdentifier, a3);
}

- (PKPaymentPass)alternateFundingSource
{
  return self->_alternateFundingSource;
}

- (void)setAlternateFundingSource:(id)a3
{
  objc_storeStrong((id *)&self->_alternateFundingSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateFundingSource, 0);
  objc_storeStrong((id *)&self->_recurringPaymentIdentifier, 0);
  objc_storeStrong((id *)&self->_thresholdAmount, 0);
  objc_storeStrong((id *)&self->_bankInformation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
