@implementation PKPeerPaymentRemoteMessagesComposer

- (PKPeerPaymentRemoteMessagesComposer)initWithPeerPaymentController:(id)a3 presentingViewController:(id)a4 actionType:(int64_t)a5 sourceType:(unint64_t)a6
{
  id v11;
  id v12;
  PKPeerPaymentRemoteMessagesComposer *v13;
  PKPeerPaymentRemoteMessagesComposer *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentRemoteMessagesComposer;
  v13 = -[PKPeerPaymentRemoteMessagesComposer init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_peerPaymentController, a3);
    objc_storeWeak((id *)&v14->_presentingViewController, v12);
    v14->_actionType = a5;
    v14->_sourceType = a6;
  }

  return v14;
}

- (void)validateRecipientWithAddress:(id)a3 completion:(id)a4
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
  v10[2] = __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke;
  v10[3] = &unk_1E3E685A8;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[PKPeerPaymentRemoteMessagesComposer _showAlertForInvalidStateIfNeededWithCompletion:](self, "_showAlertForInvalidStateIfNeededWithCompletion:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke(void **a1, int a2)
{
  id *v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void (**v12)(void *, _QWORD);
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v4 = a1 + 6;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained[9], "webService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_appleAccountInformation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      PKPeerPaymentSenderAddressForRecipientAddress(a1[4]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(v8, "primaryEmailAddress");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v11;

      objc_msgSend(v6[9], "reset");
      v14 = v6[9];
      v15 = a1[4];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_2;
      v16[3] = &unk_1E3E6F968;
      objc_copyWeak(&v19, v4);
      v18 = a1[5];
      v17 = a1[4];
      objc_msgSend(v14, "identifyRecipientWithAddress:senderAddress:completion:", v15, v13, v16);

      objc_destroyWeak(&v19);
    }
    else
    {
      v12 = (void (**)(void *, _QWORD))a1[5];
      if (v12)
        v12[2](v12, 0);
    }
  }

}

void __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];

  v7 = a3;
  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_3;
  v12[3] = &unk_1E3E6F940;
  objc_copyWeak(v17, a1 + 6);
  v13 = v8;
  v9 = a1[5];
  v17[1] = a2;
  v16 = v9;
  v14 = v7;
  v15 = a1[4];
  v10 = v7;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

  objc_destroyWeak(v17);
}

void __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
    goto LABEL_17;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
    if (v4)
    {
      v5 = objc_loadWeakRetained(WeakRetained + 4);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_4;
      v11[3] = &unk_1E3E61590;
      v12 = *(id *)(a1 + 56);
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, v11);

    }
    else
    {
      v8 = *(_QWORD *)(a1 + 56);
      if (v8)
        (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
    }

    goto LABEL_17;
  }
  v6 = *(_QWORD *)(a1 + 72);
  if (v6 == 2)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      objc_msgSend(*(id *)(a1 + 40), "displayName");
    else
      objc_msgSend(WeakRetained[9], "displayNameForRecipientAddress:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_showAlertForInvalidRecipientWithName:statusReason:completion:", v10, objc_msgSend(*(id *)(a1 + 40), "statusReason"), *(_QWORD *)(a1 + 56));
    goto LABEL_17;
  }
  if (v6 != 1)
  {
    if (v6)
      goto LABEL_17;
    goto LABEL_8;
  }
  objc_storeStrong(WeakRetained + 1, *(id *)(a1 + 40));
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
LABEL_17:

}

uint64_t __79__PKPeerPaymentRemoteMessagesComposer_validateRecipientWithAddress_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)presentRemoteMessageComposerWithAmount:(id)a3 requestToken:(id)a4 memo:(id)a5 sessionID:(id)a6 overViewController:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  MSSession *v22;
  MSSession *session;
  int64_t actionType;
  unint64_t v25;
  uint64_t v26;
  PKPeerPaymentController *v27;
  unint64_t sourceType;
  NSObject *v29;
  PKPeerPaymentController *peerPaymentController;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id location;
  uint8_t buf[4];
  int64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_storeStrong((id *)&self->_memo, a5);
  objc_storeStrong((id *)&self->_requestToken, a4);
  objc_storeWeak((id *)&self->_presentingViewController, v18);
  if (v17)
  {
    v20 = objc_alloc(MEMORY[0x1E0CC6948]);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v17);
    v22 = (MSSession *)objc_msgSend(v20, "initWithIdentifier:", v21);
    session = self->_session;
    self->_session = v22;

  }
  objc_initWeak(&location, self);
  actionType = self->_actionType;
  if (actionType)
  {
    if (actionType == 1)
    {
      -[PKPeerPaymentController selectMode:](self->_peerPaymentController, "selectMode:", 1);
      v25 = self->_sourceType - 1;
      if (v25 > 2)
        v26 = 0;
      else
        v26 = qword_19DF16908[v25];
      peerPaymentController = self->_peerPaymentController;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke;
      v35[3] = &unk_1E3E61AA8;
      objc_copyWeak(&v37, &location);
      v36 = v19;
      -[PKPeerPaymentController quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:](peerPaymentController, "quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:", v14, v26, v15, 0, 0, 0, 0, 0, 0, v35);

      objc_destroyWeak(&v37);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v40 = actionType;
        _os_log_impl(&dword_19D178000, v29, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Unable to present remote message composer for action type: %ld", buf, 0xCu);
      }

    }
  }
  else
  {
    -[PKPeerPaymentController selectMode:](self->_peerPaymentController, "selectMode:", 3);
    v27 = self->_peerPaymentController;
    if (self->_sourceType - 1 >= 3)
      sourceType = 0;
    else
      sourceType = self->_sourceType;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke_3;
    v31[3] = &unk_1E3E6F9B8;
    objc_copyWeak(&v34, &location);
    v32 = v14;
    v33 = v19;
    -[PKPeerPaymentController formalRequestTokenForAmount:source:completion:](v27, "formalRequestTokenForAmount:source:completion:", v32, sourceType, v31);

    objc_destroyWeak(&v34);
  }
  objc_destroyWeak(&location);

}

void __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke_2;
  block[3] = &unk_1E3E6F1A0;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v17 = a2;
  v13 = v7;
  v9 = *(id *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v16);
}

void __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "_confirmPaymentMessageInsertionWithQuote:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
LABEL_11:
      WeakRetained = v11;
      goto LABEL_12;
    }
    v3 = *(id *)(a1 + 40);
    objc_msgSend(v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6B2D8]))
    {
      v7 = objc_msgSend(v5, "code");

      if (v7)
      {
LABEL_8:
        objc_msgSend(v11, "_handleError:", v3);
        v10 = *(_QWORD *)(a1 + 48);
        if (v10)
          (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);

        goto LABEL_11;
      }
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_MESSAGE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v9 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v9;
    }

    goto LABEL_8;
  }
LABEL_12:

}

void __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke_3(id *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;

  v7 = a3;
  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke_4;
  v12[3] = &unk_1E3E6F990;
  objc_copyWeak(&v17, a1 + 6);
  v18 = a2;
  v13 = v7;
  v14 = a1[4];
  v9 = a1[5];
  v15 = v8;
  v16 = v9;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

  objc_destroyWeak(&v17);
}

void __136__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithAmount_requestToken_memo_sessionID_overViewController_completion___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v12 = WeakRetained;
    if (*(_BYTE *)(a1 + 72))
    {
      v3 = *(void **)(a1 + 32);
      if (v3)
      {
        objc_storeStrong(WeakRetained + 7, v3);
        objc_msgSend(v12, "_insertRequestMessageWithAmount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
LABEL_12:
        WeakRetained = v12;
        goto LABEL_13;
      }
    }
    v4 = *(id *)(a1 + 48);
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6B2D8]))
    {
      v8 = objc_msgSend(v6, "code");

      if (v8)
      {
LABEL_9:
        objc_msgSend(v12, "_handleError:", v4);
        v11 = *(_QWORD *)(a1 + 56);
        if (v11)
          (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);

        goto LABEL_12;
      }
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_REQUEST_MONEY_GENERIC_ERROR_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_REQUEST_MONEY_GENERIC_ERROR_MESSAGE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v10;
    }

    goto LABEL_9;
  }
LABEL_13:

}

- (void)presentRemoteMessageComposerWithRecurringPayment:(id)a3 overViewController:(id)a4 completion:(id)a5
{
  id v9;
  int64_t actionType;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  PKPeerPaymentController *peerPaymentController;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id location;
  uint8_t buf[4];
  int64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v25 = a4;
  v26 = a5;
  objc_storeWeak((id *)&self->_presentingViewController, v25);
  objc_initWeak(&location, self);
  actionType = self->_actionType;
  if (actionType == 2)
  {
    objc_storeStrong((id *)&self->_recurringPayment, a3);
    objc_msgSend(v9, "amount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currency");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fundingSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fpanIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "passWithFPANIdentifier:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "usesAppleCashBalance"))
      v17 = 2;
    else
      v17 = 1;
    -[PKPeerPaymentController selectMode:](self->_peerPaymentController, "selectMode:", 1);
    v18 = self->_sourceType - 1;
    if (v18 > 2)
      v23 = 0;
    else
      v23 = qword_19DF16908[v18];
    peerPaymentController = self->_peerPaymentController;
    objc_msgSend(v9, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v9, "frequency");
    objc_msgSend(v9, "startDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __118__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithRecurringPayment_overViewController_completion___block_invoke;
    v27[3] = &unk_1E3E6FA08;
    objc_copyWeak(&v30, &location);
    v27[4] = self;
    v28 = v9;
    v29 = v26;
    -[PKPeerPaymentController quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:](peerPaymentController, "quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:", v13, v23, 0, v24, v17, v20, v21, v22, 0, v27);

    objc_destroyWeak(&v30);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v33 = actionType;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Unable to present remote message composer for non-recurring payment action type: %ld", buf, 0xCu);
    }
  }

  objc_destroyWeak(&location);
}

void __118__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithRecurringPayment_overViewController_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithRecurringPayment_overViewController_completion___block_invoke_2;
  block[3] = &unk_1E3E6F9E0;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  v19 = a2;
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = v9;
  v10 = *(id *)(a1 + 48);
  v16 = v8;
  v17 = v10;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v18);
}

void __118__PKPeerPaymentRemoteMessagesComposer_presentRemoteMessageComposerWithRecurringPayment_overViewController_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v21 = WeakRetained;
    if (*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "identifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
        objc_msgSend(*(id *)(a1 + 40), "recurringPaymentIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setIdentifier:", v5);

      }
      v6 = objc_alloc(MEMORY[0x1E0CC6948]);
      v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);
      v10 = objc_msgSend(v6, "initWithIdentifier:", v9);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 48);
      *(_QWORD *)(v11 + 48) = v10;

      objc_msgSend(v21, "_confirmPaymentMessageInsertionWithQuote:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
LABEL_13:
      WeakRetained = v21;
      goto LABEL_14;
    }
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v13, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D6B2D8]))
    {
      v17 = objc_msgSend(v15, "code");

      if (v17)
      {
LABEL_10:
        objc_msgSend(v21, "_handleError:", v13);
        v20 = *(_QWORD *)(a1 + 64);
        if (v20)
          (*(void (**)(uint64_t, _QWORD))(v20 + 16))(v20, 0);

        goto LABEL_13;
      }
      PKLocalizedPeerPaymentRecurringString(CFSTR("SETUP_GENERIC_ERROR_TITLE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentRecurringString(CFSTR("SETUP_GENERIC_ERROR_MESSAGE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v19 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v19;
    }

    goto LABEL_10;
  }
LABEL_14:

}

- (void)_showAlertForInvalidStateIfNeededWithCompletion:(id)a3
{
  id v3;
  id v4;
  _QWORD *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!PKNetworkConnectivityAvailable())
  {
    v6 = CFSTR("PEER_PAYMENT_INTERNET_CONNECTION_ERROR_MESSAGE");
    v7 = CFSTR("PEER_PAYMENT_INTERNET_CONNECTION_ERROR_TITLE");
LABEL_7:
    PKLocalizedPeerPaymentString(&v7->isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C9B800]);

    v5 = (_QWORD *)MEMORY[0x1E0C9B810];
    goto LABEL_8;
  }
  if (!objc_msgSend(MEMORY[0x1E0CC68C8], "isiMessageEnabled"))
  {
    v6 = CFSTR("PEER_PAYMENT_IMESSAGE_DISABLED_ERROR_MESSAGE");
    v7 = CFSTR("PEER_PAYMENT_IMESSAGE_DISABLED_ERROR_TITLE");
    goto LABEL_7;
  }
  if ((objc_msgSend(MEMORY[0x1E0CC68C8], "canSendText") & 1) != 0)
    goto LABEL_9;
  v5 = (_QWORD *)MEMORY[0x1E0C9B800];
  v6 = CFSTR("PEER_PAYMENT_MESSAGES_UNAVAILABLE_ERROR_TITLE");
LABEL_8:
  PKLocalizedPeerPaymentString(&v6->isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *v5);

  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9B838]);

LABEL_9:
  if (objc_msgSend(v4, "count"))
  {
    v11 = (void *)MEMORY[0x1E0D67760];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__PKPeerPaymentRemoteMessagesComposer__showAlertForInvalidStateIfNeededWithCompletion___block_invoke;
    v12[3] = &unk_1E3E629E0;
    v13 = v3;
    objc_msgSend(v11, "presentNotificationWithParameters:responseHandler:", v4, v12);

  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }

}

uint64_t __87__PKPeerPaymentRemoteMessagesComposer__showAlertForInvalidStateIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_showAlertForInvalidRecipientWithName:(id)a3 statusReason:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a4 < 2)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_RECIPIENT_ERROR_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9B800]);

    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_RECIPIENT_ERROR_FORMAT"), CFSTR("%@"), v7);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = (void *)v11;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C9B810]);

    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9B838]);

    goto LABEL_6;
  }
  if (a4 == 2)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_RECIPIENT_ERROR_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0C9B800]);

    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_FAMILY_RESTRICTED_MESSAGE"));
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  v15 = (void *)MEMORY[0x1E0D67760];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __101__PKPeerPaymentRemoteMessagesComposer__showAlertForInvalidRecipientWithName_statusReason_completion___block_invoke;
  v17[3] = &unk_1E3E629E0;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v15, "presentNotificationWithParameters:responseHandler:", v9, v17);

}

uint64_t __101__PKPeerPaymentRemoteMessagesComposer__showAlertForInvalidRecipientWithName_statusReason_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (BOOL)_recipientFoundInContacts
{
  PKPeerPaymentController *peerPaymentController;
  void *v3;
  id v4;
  BOOL v6;

  v6 = 0;
  peerPaymentController = self->_peerPaymentController;
  -[PKPeerPaymentRecipient phoneOrEmail](self->_recipient, "phoneOrEmail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[PKPeerPaymentController displayNameForRecipientAddress:foundInContacts:](peerPaymentController, "displayNameForRecipientAddress:foundInContacts:", v3, &v6);

  return v6;
}

- (void)_confirmPaymentMessageInsertionWithQuote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23[2];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Confirm payment message insertion with peer payment quote: %@", buf, 0xCu);
  }

  if (-[PKPeerPaymentRemoteMessagesComposer _recipientFoundInContacts](self, "_recipientFoundInContacts")
    || (-[PKPeerPaymentController account](self->_peerPaymentController, "account"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "sendRestrictionType") == 2,
        v9,
        !v10))
  {
    if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) != 3
      || -[PKPeerPaymentRemoteMessagesComposer _recipientFoundInContacts](self, "_recipientFoundInContacts"))
    {
      goto LABEL_11;
    }
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D6BC20]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D6BC18]);
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_TITLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0C9B800]);

    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_MESSAGE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C9B810]);

    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_ACTION_CONTINUE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0C9B838]);

    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_ACTION_CANCEL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9B868]);
    v15 = 0;
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D6BC20]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D6BC18]);
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_RECIPIENT_ERROR_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0C9B800]);

    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_CONTACTS_RESTRICTED_MESSAGE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0C9B810]);

    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9B838]);
    v15 = 3;
  }

  if (!v11)
  {
LABEL_11:
    -[PKPeerPaymentRemoteMessagesComposer _insertPaymentMessageWithQuote:completion:](self, "_insertPaymentMessageWithQuote:completion:", v6, v7);
    goto LABEL_12;
  }
  objc_initWeak((id *)buf, self);
  v19 = (void *)MEMORY[0x1E0D67760];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __91__PKPeerPaymentRemoteMessagesComposer__confirmPaymentMessageInsertionWithQuote_completion___block_invoke;
  v20[3] = &unk_1E3E6FA30;
  objc_copyWeak(v23, (id *)buf);
  v23[1] = (id)v15;
  v21 = v6;
  v22 = v7;
  objc_msgSend(v19, "presentNotificationWithParameters:responseHandler:", v11, v20);

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);

LABEL_12:
}

void __91__PKPeerPaymentRemoteMessagesComposer__confirmPaymentMessageInsertionWithQuote_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 56) == a3)
    {
      objc_msgSend(WeakRetained, "_insertPaymentMessageWithQuote:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: User does not want to insert payment message.", v9, 2u);
      }

      v8 = *(_QWORD *)(a1 + 40);
      if (v8)
        (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
    }
  }

}

- (void)_insertPaymentMessageWithQuote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSDecimalNumber *v9;
  NSString *v10;
  void *v11;
  int v12;
  uint64_t v13;
  PKPeerPaymentMessage *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v6;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Insert payment message with peer payment quote: %@", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(v6, "totalReceiveAmount");
  v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalReceiveAmountCurrency");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v6, "isRecurringPayment");
  if (v12)
    v13 = 3;
  else
    v13 = 1;
  v14 = -[PKPeerPaymentMessage initWithType:session:]([PKPeerPaymentMessage alloc], "initWithType:session:", v13, self->_session);
  -[PKPeerPaymentMessage setCurrencyAmount:](v14, "setCurrencyAmount:", v11);
  -[PKPeerPaymentController senderPhoneOrEmail](self->_peerPaymentController, "senderPhoneOrEmail");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage setSenderAddress:](v14, "setSenderAddress:", v15);

  -[PKPeerPaymentRecipient phoneOrEmail](self->_recipient, "phoneOrEmail");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage setRecipientAddress:](v14, "setRecipientAddress:", v16);

  -[PKPeerPaymentMessage setSource:](v14, "setSource:", 1);
  if (self->_memo)
    -[PKPeerPaymentMessage setMemo:](v14, "setMemo:");
  if (self->_requestToken)
    -[PKPeerPaymentMessage setRequestToken:](v14, "setRequestToken:");
  if (v12)
  {
    objc_msgSend(v6, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessage setRecurringPaymentStartDate:](v14, "setRecurringPaymentStartDate:", v17);

    -[PKPeerPaymentMessage setRecurringPaymentFrequency:](v14, "setRecurringPaymentFrequency:", objc_msgSend(v6, "frequency"));
    -[PKPeerPaymentRecurringPayment memo](self->_recurringPayment, "memo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessage setRecurringPaymentMemo:](v14, "setRecurringPaymentMemo:", v18);

  }
  -[PKPeerPaymentRemoteMessagesComposer _presentPeerPaymentMessage:completion:](self, "_presentPeerPaymentMessage:completion:", v14, v7);

}

- (void)_insertRequestMessageWithAmount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PKPeerPaymentRequestToken *requestToken;
  PKPeerPaymentMessage *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  PKPeerPaymentRequestToken *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    requestToken = self->_requestToken;
    v13 = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = requestToken;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Insert request with amount: %@ requestToken: %@", (uint8_t *)&v13, 0x16u);
  }

  v10 = -[PKPeerPaymentMessage initWithType:session:]([PKPeerPaymentMessage alloc], "initWithType:session:", 2, self->_session);
  -[PKPeerPaymentMessage setCurrencyAmount:](v10, "setCurrencyAmount:", v6);
  -[PKPeerPaymentMessage setRequestToken:](v10, "setRequestToken:", self->_requestToken);
  -[PKPeerPaymentController senderPhoneOrEmail](self->_peerPaymentController, "senderPhoneOrEmail");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage setSenderAddress:](v10, "setSenderAddress:", v11);

  -[PKPeerPaymentRecipient phoneOrEmail](self->_recipient, "phoneOrEmail");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentMessage setRecipientAddress:](v10, "setRecipientAddress:", v12);

  -[PKPeerPaymentMessage setSource:](v10, "setSource:", 1);
  if (self->_memo)
    -[PKPeerPaymentMessage setMemo:](v10, "setMemo:");
  -[PKPeerPaymentRemoteMessagesComposer _presentPeerPaymentMessage:completion:](self, "_presentPeerPaymentMessage:completion:", v10, v7);

}

- (void)_presentPeerPaymentMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  +[PKMessagesAppSharedContext sharedContext](PKMessagesAppSharedContext, "sharedContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentController externalizedControllerState](self->_peerPaymentController, "externalizedControllerState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistExternalizedControllerState:forMessageIdentifier:", v9, v10);

  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__PKPeerPaymentRemoteMessagesComposer__presentPeerPaymentMessage_completion___block_invoke;
  v13[3] = &unk_1E3E61B90;
  objc_copyWeak(&v16, &location);
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __77__PKPeerPaymentRemoteMessagesComposer__presentPeerPaymentMessage_completion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  PKPeerPaymentMessageComposeController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v4 = [PKPeerPaymentMessageComposeController alloc];
    objc_msgSend(a1[4], "underlyingMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "recipientAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPeerPaymentMessageComposeController initWithMessage:recipientAddress:](v4, "initWithMessage:recipientAddress:", v5, v6);
    v8 = (void *)*((_QWORD *)WeakRetained + 3);
    *((_QWORD *)WeakRetained + 3) = v7;

    v9 = (void *)*((_QWORD *)WeakRetained + 3);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __77__PKPeerPaymentRemoteMessagesComposer__presentPeerPaymentMessage_completion___block_invoke_2;
    v15 = &unk_1E3E6FA58;
    objc_copyWeak(&v17, v2);
    v16 = a1[5];
    objc_msgSend(v9, "setCompletionHandler:", &v12);
    v10 = (void *)*((_QWORD *)WeakRetained + 3);
    v11 = objc_loadWeakRetained((id *)WeakRetained + 4);
    objc_msgSend(v10, "presentMessageOverController:presentationHandler:", v11, 0, v12, v13, v14, v15);

    objc_destroyWeak(&v17);
  }

}

void __77__PKPeerPaymentRemoteMessagesComposer__presentPeerPaymentMessage_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!a2 || a2 == 2)
    {
      v8 = *(_QWORD *)(a1 + 32);
      if (!v8)
        goto LABEL_10;
      v9 = *(void (**)(void))(v8 + 16);
      goto LABEL_9;
    }
    if (a2 == 1)
    {
      if (WeakRetained[8])
      {
        objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v5[8];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __77__PKPeerPaymentRemoteMessagesComposer__presentPeerPaymentMessage_completion___block_invoke_3;
        v11[3] = &unk_1E3E61590;
        v12 = *(id *)(a1 + 32);
        objc_msgSend(v6, "insertOrUpdateRecurringPayments:completion:", v7, v11);

        goto LABEL_10;
      }
      v10 = *(_QWORD *)(a1 + 32);
      if (!v10)
        goto LABEL_10;
      v9 = *(void (**)(void))(v10 + 16);
LABEL_9:
      v9();
    }
  }
LABEL_10:

}

uint64_t __77__PKPeerPaymentRemoteMessagesComposer__presentPeerPaymentMessage_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_handleError:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D6BC20]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D6BC18]);
  PKTitleForDisplayableError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0C9B800]);

  MEMORY[0x1A1AE46BC](v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C9B810]);

  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C9B838];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C9B838]);

  objc_msgSend(v3, "localizedRecoveryOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D69EF0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v13)
  {
    PKLocalizedString(CFSTR("CANCEL_BUTTON_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v9);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C9B868]);
  }
  v15 = (void *)MEMORY[0x1E0D67760];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__PKPeerPaymentRemoteMessagesComposer__handleError___block_invoke;
  v17[3] = &unk_1E3E6FA80;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v15, "presentNotificationWithParameters:responseHandler:", v4, v17);

}

void __52__PKPeerPaymentRemoteMessagesComposer__handleError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (a3 == 2)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

    }
  }
}

- (PKPeerPaymentController)peerPaymentController
{
  return self->_peerPaymentController;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_recurringPayment, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_memo, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_composeController, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
