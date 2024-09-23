@implementation PKAccountBillPaymentController

- (PKAccountBillPaymentController)init
{
  return -[PKAccountBillPaymentController initWithAccount:](self, "initWithAccount:", 0);
}

- (PKAccountBillPaymentController)initWithAccount:(id)a3
{
  return -[PKAccountBillPaymentController initWithAccount:paymentPass:](self, "initWithAccount:paymentPass:", a3, 0);
}

- (PKAccountBillPaymentController)initWithAccount:(id)a3 paymentPass:(id)a4
{
  id v7;
  id v8;
  PKAccountBillPaymentController *v9;
  PKAccountBillPaymentController *v10;
  uint64_t v11;
  NSMutableSet *dataFetchingCompletionHandlers;
  uint64_t v13;
  PKAccountService *accountService;
  PKPaymentService *v15;
  PKPaymentService *paymentService;
  uint64_t v17;
  PKPaymentWebService *webService;
  uint64_t v19;
  NSDecimalNumber *totalPaymentAmount;
  void *v21;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKAccountBillPaymentController;
  v9 = -[PKAccountBillPaymentController init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_pass, a4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    dataFetchingCompletionHandlers = v10->_dataFetchingCompletionHandlers;
    v10->_dataFetchingCompletionHandlers = (NSMutableSet *)v11;

    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    accountService = v10->_accountService;
    v10->_accountService = (PKAccountService *)v13;

    v15 = objc_alloc_init(PKPaymentService);
    paymentService = v10->_paymentService;
    v10->_paymentService = v15;

    +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
    v17 = objc_claimAutoreleasedReturnValue();
    webService = v10->_webService;
    v10->_webService = (PKPaymentWebService *)v17;

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v19 = objc_claimAutoreleasedReturnValue();
    totalPaymentAmount = v10->_totalPaymentAmount;
    v10->_totalPaymentAmount = (NSDecimalNumber *)v19;

    -[PKAccountBillPaymentController _fetchFundingSources](v10, "_fetchFundingSources");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v10, sel__accountDidChange_, CFSTR("PKAccountServiceAccountsChangedNotification"), 0);

  }
  return v10;
}

- (void)_fetchFundingSources
{
  NSObject *v3;
  PKAccountPaymentFundingSource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id buf[2];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!self->_fetchingData)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Fetching funding sources in PKAccountBillPaymentController", (uint8_t *)buf, 2u);
    }

    self->_fetchingData = 1;
    if (PKUIOnlyDemoModeEnabled())
    {
      v4 = -[PKAccountPaymentFundingSource initWithType:]([PKAccountPaymentFundingSource alloc], "initWithType:", 1);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountPaymentFundingSource setIdentifier:](v4, "setIdentifier:", v6);

      -[PKAccountPaymentFundingSource setAccountSuffix:](v4, "setAccountSuffix:", CFSTR("12345"));
      v13[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountBillPaymentController setFundingSources:](self, "setFundingSources:", v7);

      -[PKAccountBillPaymentController _completeFetchingFundingSources](self, "_completeFetchingFundingSources");
    }
    else
    {
      objc_initWeak(buf, self);
      +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __54__PKAccountBillPaymentController__fetchFundingSources__block_invoke;
      v10[3] = &unk_1E2AC2E90;
      objc_copyWeak(&v11, buf);
      objc_msgSend(v8, "updatePaymentFundingSourcesForAccountIdentifier:force:completion:", v9, 1, v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
}

void __54__PKAccountBillPaymentController__fetchFundingSources__block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __54__PKAccountBillPaymentController__fetchFundingSources__block_invoke_2;
  block[3] = &unk_1E2AC2E68;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __54__PKAccountBillPaymentController__fetchFundingSources__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(const char **)(a1 + 32);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Completed fetching funding sources in PKAccountBillPaymentController with error %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong(WeakRetained + 13, *(id *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = "-[PKAccountBillPaymentController _fetchFundingSources]_block_invoke";
        v8 = 2048;
        v9 = WeakRetained;
        v10 = 2112;
        v11 = v5;
        _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "%s %p: Error: Get funding sources failed with error: %@.", (uint8_t *)&v6, 0x20u);
      }

    }
    else
    {
      objc_msgSend(WeakRetained, "setFundingSources:", *(_QWORD *)(a1 + 40));
    }
    objc_msgSend(WeakRetained, "_completeFetchingFundingSources");
  }

}

- (void)_completeFetchingFundingSources
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_fetchingData = 0;
  -[NSMutableSet allObjects](self->_dataFetchingCompletionHandlers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[NSMutableSet removeAllObjects](self->_dataFetchingCompletionHandlers, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_updateUseApplePayCashSetting:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[PKObject settings](self->_pass, "settings");
  if (((v5 >> 9) & 1) != v3)
  {
    v6 = 512;
    if (!v3)
      v6 = 0;
    -[PKObject setSettings:](self->_pass, "setSettings:", v5 & 0xFFFFFFFFFFFFFDFFLL | v6);
  }
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  PKPaymentAuthorizationCoordinator *v4;
  NSObject *v5;
  _QWORD v6[5];
  PKPaymentAuthorizationCoordinator *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  PKAccountBillPaymentController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (PKPaymentAuthorizationCoordinator *)a3;
  if (self->_schedulePaymentAuthorizationCoordinator == v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[PKAccountBillPaymentController paymentAuthorizationCoordinatorDidFinish:]";
      v10 = 2048;
      v11 = self;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "%s %p: paymentAuthorizationCoordinatorDidFinish: callback called.", buf, 0x16u);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__PKAccountBillPaymentController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
    v6[3] = &unk_1E2ABE0D0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __75__PKAccountBillPaymentController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = 0;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKAccountBillPaymentController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  v8[3] = &unk_1E2ABE120;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v6, "dismissWithCompletion:", v8);
}

void __75__PKAccountBillPaymentController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 120))
  {
    if (!*(_BYTE *)(v1 + 97))
    {
      *(_BYTE *)(v1 + 97) = 1;
      dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 120));
    }
  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presentationSceneIdentifierForAccountBillPaymentController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
  -[PKAccountBillPaymentController _performApplePayTrustSignatureRequestWithSignature:completion:](self, "_performApplePayTrustSignatureRequestWithSignature:completion:", a4, a5);
}

- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PKPaymentWebService *webService;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;
  PKAccountBillPaymentController *v19;
  id v20;

  v7 = a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke;
  aBlock[3] = &unk_1E2AC2EE0;
  v10 = v7;
  v18 = v10;
  v19 = self;
  v11 = v8;
  v20 = v11;
  v12 = _Block_copy(aBlock);
  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    webService = self->_webService;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_4;
    v15[3] = &unk_1E2ABE430;
    v16 = v12;
    objc_msgSend(v13, "paymentWebService:deviceMetadataWithFields:completion:", webService, 251, v15);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v12 + 2))(v12, 0);
  }

}

void __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "bankAccountInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_addNewBankAccountIfNecessary:", v5);
  objc_msgSend(*(id *)(a1 + 32), "peerPaymentBalance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "amount");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 72);
  *(_QWORD *)(v8 + 72) = v7;

  v10 = objc_msgSend(*(id *)(a1 + 32), "selectedMethods");
  objc_msgSend(*(id *)(a1 + 40), "_updateUseApplePayCashSetting:", (v10 >> 1) & 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "paymentSummaryItemsWithFundingSources:bankAccount:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_createSchedulePaymentRequestWithSelectedMethods:bankInformation:", v10, v5);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(v13 + 24);
  *(_QWORD *)(v13 + 24) = v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setDeviceMetadata:", v4);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(void **)(a1 + 48);
  v17 = *(void **)(v15 + 8);
  v18 = *(_QWORD *)(v15 + 24);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_2;
  v20[3] = &unk_1E2AC2EB8;
  v20[4] = v15;
  v21 = v11;
  v22 = v16;
  v19 = v11;
  objc_msgSend(v17, "schedulePaymentWithRequest:completion:", v18, v20);

}

void __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_3;
  block[3] = &unk_1E2ABE260;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v7;
  block[1] = 3221225472;
  v12 = v5;
  v15 = v8;
  v16 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  PKApplePayTrustSignatureRequest *v6;
  void *v7;
  PKPaymentRequestPaymentMethodUpdate *v8;
  PKApplePayTrustSignatureRequest *v9;

  v2 = *(void **)(a1 + 32);
  if (v2 && !*(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 48) + 24);
    objc_msgSend(v2, "referenceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "manifestHashWithReferenceIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [PKApplePayTrustSignatureRequest alloc];
    objc_msgSend(*(id *)(a1 + 32), "nonce");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKApplePayTrustSignatureRequest initWithKeyIdentifier:manifestHash:nonce:](v6, "initWithKeyIdentifier:manifestHash:nonce:", CFSTR("com.apple.wallet.applepaytrust"), v5, v7);

  }
  else
  {
    v9 = 0;
  }
  v8 = -[PKPaymentRequestPaymentMethodUpdate initWithPaymentSummaryItems:]([PKPaymentRequestPaymentMethodUpdate alloc], "initWithPaymentSummaryItems:", *(_QWORD *)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_5;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)canPerformBillPaymentWithAmount:(id)a3 scheduledDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSMutableSet *dataFetchingCompletionHandlers;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  id v27;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKAccountBillPaymentController_canPerformBillPaymentWithAmount_scheduledDate_completion___block_invoke;
  aBlock[3] = &unk_1E2AC2F08;
  objc_copyWeak(&v27, &location);
  v12 = v8;
  v25 = v12;
  v13 = v9;
  v26 = v13;
  v14 = _Block_copy(aBlock);
  v15 = v14;
  if (self->_fetchingData || !self->_fundingSources)
  {
    dataFetchingCompletionHandlers = self->_dataFetchingCompletionHandlers;
    v18 = v11;
    v19 = 3221225472;
    v20 = __91__PKAccountBillPaymentController_canPerformBillPaymentWithAmount_scheduledDate_completion___block_invoke_2;
    v21 = &unk_1E2AC2F30;
    v22 = v14;
    v23 = v10;
    v17 = _Block_copy(&v18);
    -[NSMutableSet addObject:](dataFetchingCompletionHandlers, "addObject:", v17, v18, v19, v20, v21);

    if (!self->_fetchingData)
      -[PKAccountBillPaymentController _fetchFundingSources](self, "_fetchFundingSources");

  }
  else
  {
    (*((void (**)(void *, id))v14 + 2))(v14, v10);
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __91__PKAccountBillPaymentController_canPerformBillPaymentWithAmount_scheduledDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  void (**v5)(id, BOOL, _QWORD);

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_buildTransferRequestForDate:", *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, BOOL, id))v5)[2](v5, v4 != 0, WeakRetained[13]);

    }
  }
  else if (v5)
  {
    v5[2](v5, 0, 0);
  }

}

uint64_t __91__PKAccountBillPaymentController_canPerformBillPaymentWithAmount_scheduledDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)performBillPaymentActionWithAmount:(id)a3
{
  -[PKAccountBillPaymentController performBillPaymentActionWithAmount:billPaymentSuggestedAmountDataEvent:](self, "performBillPaymentActionWithAmount:billPaymentSuggestedAmountDataEvent:", a3, 0);
}

- (void)performBillPaymentActionWithAmount:(id)a3 billPaymentSuggestedAmountDataEvent:(id)a4
{
  -[PKAccountBillPaymentController performBillPaymentActionWithAmount:scheduledDate:billPaymentSuggestedAmountDataEvent:](self, "performBillPaymentActionWithAmount:scheduledDate:billPaymentSuggestedAmountDataEvent:", a3, 0, a4);
}

- (void)performBillPaymentActionWithAmount:(id)a3 scheduledDate:(id)a4 billPaymentSuggestedAmountDataEvent:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  NSObject *v16;
  NSMutableSet *dataFetchingCompletionHandlers;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  PKAccountBillPaymentController *v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke;
  v22 = &unk_1E2AC0F90;
  v23 = self;
  v11 = v8;
  v24 = v11;
  v12 = v9;
  v25 = v12;
  v13 = v10;
  v26 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(&v19);
  v15 = v14;
  if (self->_performingAction)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[PKAccountBillPaymentController performBillPaymentActionWithAmount:scheduledDate:billPaymentSuggestedAmountDataEvent:]";
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "%s: Cannot Present - already performing action", buf, 0xCu);
    }

    -[PKAccountBillPaymentController _billPaymentHasCompletedWithState:error:](self, "_billPaymentHasCompletedWithState:error:", 2, 0, v19, v20, v21, v22, v23, v24, v25);
  }
  else if (self->_fetchingData)
  {
    dataFetchingCompletionHandlers = self->_dataFetchingCompletionHandlers;
    v18 = _Block_copy(v14);
    -[NSMutableSet addObject:](dataFetchingCompletionHandlers, "addObject:", v18, v19, v20, v21, v22, v23, v24, v25);

  }
  else
  {
    v14[2](v14);
  }

}

uint64_t __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_buildTransferRequestForDate:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 56));
  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke_2;
  v8[3] = &unk_1E2AC2F80;
  v8[4] = v5;
  return objc_msgSend(v5, "_presentPaymentAuthorizationWithPaymentRequest:completion:", v6, v8);
}

void __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke_3;
  block[3] = &unk_1E2AC2F58;
  v9 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke_3(uint64_t a1)
{
  dispatch_group_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120))
    {
      v2 = dispatch_group_create();
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 120);
      *(_QWORD *)(v3 + 120) = v2;

      dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 120));
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(NSObject **)(v5 + 120);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke_4;
      block[3] = &unk_1E2ABE120;
      block[4] = v5;
      dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);
    }
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v13 = "-[PKAccountBillPaymentController performBillPaymentActionWithAmount:scheduledDate:billPaymentSuggestedAmount"
            "DataEvent:]_block_invoke_3";
      v14 = 2048;
      v15 = v8;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "%s %p: Succeeded presenting PKPaymentAuthorizationCoordinator.", buf, 0x16u);
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v13 = "-[PKAccountBillPaymentController performBillPaymentActionWithAmount:scheduledDate:billPaymentSuggestedAmount"
            "DataEvent:]_block_invoke";
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "%s %p: Failed to present PKPaymentAuthorizationCoordinator.", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_billPaymentHasCompletedWithState:error:", 0, *(_QWORD *)(a1 + 40));
  }
}

void __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 98))
  {
    v3 = 0;
    v4 = 1;
  }
  else
  {
    v5 = *(void **)(v2 + 40);
    if (v5)
    {
      v3 = v5;
      v4 = 0;
      v2 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v3 = 0;
      v4 = 2;
    }
  }
  v6 = v3;
  objc_msgSend((id)v2, "_billPaymentHasCompletedWithState:error:", v4, v3);

}

- (id)_createSchedulePaymentRequestWithSelectedMethods:(unint64_t)a3 bankInformation:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  PKAccountServiceTransferRequest *paymentRequest;
  id v11;
  id v12;
  PKAccountScheduledPaymentList *v13;
  void *v14;
  void *v15;
  PKAccountPaymentScheduleDetails *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PKAccountWebServiceSchedulePaymentRequest *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;

  v6 = (void *)MEMORY[0x1E0CB3598];
  v7 = a4;
  objc_msgSend(v6, "zero");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  paymentRequest = self->_paymentRequest;
  v26 = v9;
  v27 = v8;
  -[PKAccountServiceTransferRequest paymentAmountsWithFundingSources:apc:ach:](paymentRequest, "paymentAmountsWithFundingSources:apc:ach:", a3, &v27, &v26);
  v11 = v27;

  v12 = v26;
  v13 = objc_alloc_init(PKAccountScheduledPaymentList);
  -[PKAccountBillPaymentController _achPaymentWithAmount:bankInformation:](self, "_achPaymentWithAmount:bankInformation:", v12, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAccountScheduledPaymentList addScheduledPayment:](v13, "addScheduledPayment:", v14);
  -[PKAccountBillPaymentController _apcPaymentWithAmount:](self, "_apcPaymentWithAmount:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountScheduledPaymentList addScheduledPayment:](v13, "addScheduledPayment:", v15);

  v16 = objc_alloc_init(PKAccountPaymentScheduleDetails);
  -[PKAccountPaymentScheduleDetails setFrequency:](v16, "setFrequency:", -[PKPaymentRequest paymentFrequency](self->_paymentRequest, "paymentFrequency"));
  -[PKAccountPaymentScheduleDetails setPreset:](v16, "setPreset:", 1);
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "productTimeZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountPaymentScheduleDetails setScheduleTimeZone:](v16, "setScheduleTimeZone:", v18);

  if (-[PKPaymentRequest paymentFrequency](self->_paymentRequest, "paymentFrequency") != 1)
  {
    -[PKPaymentRequest paymentDate](self->_paymentRequest, "paymentDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountPaymentScheduleDetails setScheduledDate:](v16, "setScheduledDate:", v19);

  }
  if (v14)
  {
    -[PKAccount schedulePaymentFeatureDescriptor](self->_account, "schedulePaymentFeatureDescriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "paymentTermsIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAccountPaymentScheduleDetails setPaymentTermsIdentifier:](v16, "setPaymentTermsIdentifier:", v21);
  }
  v22 = objc_alloc_init(PKAccountWebServiceSchedulePaymentRequest);
  -[PKAccountWebServiceSchedulePaymentRequest setScheduledPayments:](v22, "setScheduledPayments:", v13);
  -[PKAccountWebServiceSchedulePaymentRequest setScheduleDetails:](v22, "setScheduleDetails:", v16);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceSchedulePaymentRequest setAccountIdentifier:](v22, "setAccountIdentifier:", v23);

  -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceSchedulePaymentRequest setBaseURL:](v22, "setBaseURL:", v24);

  -[PKAccountWebServiceSchedulePaymentRequest setCertificatesResponse:](v22, "setCertificatesResponse:", 0);
  return v22;
}

- (id)_achPaymentWithAmount:(id)a3 bankInformation:(id)a4
{
  NSDecimalNumber *v6;
  id v7;
  void *v8;
  uint64_t v9;
  PKAccountScheduledPayment *v10;
  PKAccountPaymentFundingSource *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;

  v6 = (NSDecimalNumber *)a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "compare:", v6);

  if (v9 == -1)
  {
    v11 = -[PKAccountPaymentFundingSource initWithType:]([PKAccountPaymentFundingSource alloc], "initWithType:", 1);
    -[PKAccountPaymentFundingSource fundingDetails](v11, "fundingDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[PKAccountPaymentFundingSource setIdentifier:](v11, "setIdentifier:", v13);
    }
    else
    {
      -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAccountIdentifier:", v14);

      objc_msgSend(v7, "accountNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAccountNumber:", v15);

      objc_msgSend(v7, "routingNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setRoutingNumber:", v16);

      objc_msgSend(v7, "bankName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setName:", v17);

    }
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currencyCode");
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v6, v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[PKAccountScheduledPayment initWithCurrencyAmount:fundingSource:]([PKAccountScheduledPayment alloc], "initWithCurrencyAmount:fundingSource:", v20, v11);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_apcPaymentWithAmount:(id)a3
{
  NSDecimalNumber *v4;
  void *v5;
  uint64_t v6;
  PKAccountScheduledPayment *v7;
  PKAccountPaymentFundingSource *v8;
  void *v9;
  NSString *v10;
  void *v11;

  v4 = (NSDecimalNumber *)a3;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", v4);

  if (v6 == -1)
  {
    v8 = -[PKAccountPaymentFundingSource initWithType:]([PKAccountPaymentFundingSource alloc], "initWithType:", 2);
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currencyCode");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v4, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[PKAccountScheduledPayment initWithCurrencyAmount:fundingSource:]([PKAccountScheduledPayment alloc], "initWithCurrencyAmount:fundingSource:", v11, v8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_buildTransferRequestForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDecimalNumber *totalPaymentAmount;
  void *v12;
  NSString *v13;
  void *v14;
  PKAccountServiceTransferRequest *v15;

  v4 = a3;
  +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "associatedPassUniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passWithUniqueID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  totalPaymentAmount = self->_totalPaymentAmount;
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currencyCode");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(totalPaymentAmount, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[PKAccountServiceTransferRequest initWithAccount:peerPaymentAccount:peerPaymentPass:transferType:fundingSources:currencyAmount:paymentDate:objectSettings:]([PKAccountServiceTransferRequest alloc], "initWithAccount:peerPaymentAccount:peerPaymentPass:transferType:fundingSources:currencyAmount:paymentDate:objectSettings:", self->_account, v6, v10, 1, self->_fundingSources, v14, v4, self->_pass);
  -[PKPaymentRequest setConfirmationStyle:](v15, "setConfirmationStyle:", 0);
  -[PKPaymentRequest setApplePayTrustSignatureRequest:](v15, "setApplePayTrustSignatureRequest:", 0);

  return v15;
}

- (id)_bankAccountsForFundingSources:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "bankAccountRepresentation", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "safelyAddObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  v11 = (void *)objc_msgSend(v4, "copy", (_QWORD)v13);

  return v11;
}

- (void)_addNewBankAccountIfNecessary:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSArray *fundingSources;
  NSArray *v13;
  NSArray *v14;
  BOOL v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PKAccountPaymentFundingSource *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = self->_fundingSources;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "identifier", (_QWORD)v25);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          fundingSources = v10;
          v13 = v11;
          if (fundingSources == v13)
          {

            v21 = (PKAccountPaymentFundingSource *)fundingSources;
            goto LABEL_19;
          }
          v14 = v13;
          if (fundingSources)
            v15 = v13 == 0;
          else
            v15 = 1;
          if (v15)
          {

          }
          else
          {
            v16 = -[NSArray isEqualToString:](fundingSources, "isEqualToString:", v13);

            if ((v16 & 1) != 0)
              goto LABEL_20;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v7)
          continue;
        break;
      }
    }

    v5 = objc_alloc_init(PKAccountPaymentFundingDetailsBankAccount);
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray setAccountIdentifier:](v5, "setAccountIdentifier:", v17);

    objc_msgSend(v4, "bankName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray setName:](v5, "setName:", v18);

    -[NSArray setStatus:](v5, "setStatus:", objc_msgSend(v4, "status"));
    objc_msgSend(v4, "routingNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray setRoutingNumber:](v5, "setRoutingNumber:", v19);

    objc_msgSend(v4, "accountNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray setAccountNumber:](v5, "setAccountNumber:", v20);

    v21 = -[PKAccountPaymentFundingSource initWithType:]([PKAccountPaymentFundingSource alloc], "initWithType:", 1);
    objc_msgSend(v4, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountPaymentFundingSource setIdentifier:](v21, "setIdentifier:", v22);

    objc_msgSend(v4, "accountSuffix");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountPaymentFundingSource setAccountSuffix:](v21, "setAccountSuffix:", v23);

    -[PKAccountPaymentFundingSource setFundingDetails:](v21, "setFundingDetails:", v5);
    v24 = (NSArray *)-[NSArray mutableCopy](self->_fundingSources, "mutableCopy");
    -[NSArray addObject:](v24, "addObject:", v21);
    fundingSources = self->_fundingSources;
    self->_fundingSources = v24;
LABEL_19:

LABEL_20:
  }

}

- (id)_paymentSummaryItemsForPaymentAmountACH:(id)a3 apc:(id)a4 bankInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PKAccount feature](self->_account, "feature");
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "compare:", v9);
    if (!v8 || v19 != -1)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "compare:", v8);

    if (v10 && v21 == -1)
    {
      PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SCHEDULE_PAYMENT_APC_ITEM"), v17, 0, v12, v13, v14, v15, v16, v35);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bankName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SCHEDULE_PAYMENT_ACH_ITEM_FORMAT"), v17, CFSTR("%@"), v23, v24, v25, v26, v27, (uint64_t)v22);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      +[PKPaymentSummaryItem summaryItemWithLabel:amount:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:", v28, v8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentSummaryItem summaryItemWithLabel:amount:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:", v18, v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safelyAddObject:", v30);
      objc_msgSend(v11, "safelyAddObject:", v29);

LABEL_7:
    }
  }
  PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_SCHEDULE_PAYMENT_ITEM_TOTAL"), v17, 0, v12, v13, v14, v15, v16, v35);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentSummaryItem summaryItemWithLabel:amount:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:", v31, self->_totalPaymentAmount);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v32);

  v33 = (void *)objc_msgSend(v11, "copy");
  return v33;
}

- (void)_presentPaymentAuthorizationWithPaymentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKPaymentAuthorizationCoordinator *v8;
  PKPaymentAuthorizationCoordinator *schedulePaymentAuthorizationCoordinator;
  PKPaymentAuthorizationCoordinator *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  PKAccountBillPaymentController *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[PKPaymentAuthorizationCoordinator initWithPaymentRequest:]([PKPaymentAuthorizationCoordinator alloc], "initWithPaymentRequest:", v6);
  schedulePaymentAuthorizationCoordinator = self->_schedulePaymentAuthorizationCoordinator;
  self->_schedulePaymentAuthorizationCoordinator = v8;

  -[PKPaymentAuthorizationCoordinator setDelegate:](self->_schedulePaymentAuthorizationCoordinator, "setDelegate:", self);
  -[PKPaymentAuthorizationCoordinator _setPrivateDelegate:](self->_schedulePaymentAuthorizationCoordinator, "_setPrivateDelegate:", self);
  v10 = self->_schedulePaymentAuthorizationCoordinator;
  if (v10)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92__PKAccountBillPaymentController__presentPaymentAuthorizationWithPaymentRequest_completion___block_invoke;
    v16[3] = &unk_1E2ABDCE8;
    v17 = v6;
    v18 = v7;
    -[PKPaymentAuthorizationCoordinator presentWithCompletion:](v10, "presentWithCompletion:", v16);

    v11 = v17;
  }
  else
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v22 = "-[PKAccountBillPaymentController _presentPaymentAuthorizationWithPaymentRequest:completion:]";
      v23 = 2048;
      v24 = self;
      v25 = 2048;
      v26 = v6;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "%s %p: PKPaymentAuthorizationCoordinator could not be instantiated with paymentRequest: %p.", buf, 0x20u);
    }

    v13 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PKPaymentAuthorizationCoordinator could not be instantiated with paymentRequest: %@."), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 0, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
  }

}

void __92__PKAccountBillPaymentController__presentPaymentAuthorizationWithPaymentRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PKPaymentAuthorizationCoordinator could not be presented with paymentRequest: %@."), *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB2D50]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 0, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v4);

}

- (void)_performApplePayTrustSignatureRequestWithSignature:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  PKPaymentAuthorizationResult *v10;
  PKAccountWebServiceApplePayTrustRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  PKAccountService *accountService;
  PKPaymentAuthorizationResult *v20;
  PKAccountService *v21;
  void *v22;
  PKPaymentWebService *webService;
  PKAccount *account;
  void *v25;
  _QWORD v26[4];
  PKPaymentAuthorizationResult *v27;
  id v28;
  _QWORD v29[5];
  void (**v30)(_QWORD);
  id v31;
  _QWORD aBlock[6];

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke;
  aBlock[3] = &unk_1E2ABE120;
  aBlock[4] = self;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (PKUIOnlyDemoModeEnabled())
  {
    v10 = -[PKPaymentAuthorizationResult initWithStatus:errors:]([PKPaymentAuthorizationResult alloc], "initWithStatus:errors:", 0, 0);
    self->_completedBillPayment = 1;
    v11 = (PKAccountWebServiceApplePayTrustRequest *)-[PKAccount copy](self->_account, "copy");
    -[PKAccountWebServiceApplePayTrustRequest creditDetails](v11, "creditDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountSummary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "adjustedBalance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "decimalNumberBySubtracting:", self->_totalPaymentAmount);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceApplePayTrustRequest creditDetails](v11, "creditDetails");
    v15 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountSummary");
    v17 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCurrentBalance:", v14);

    v7 = v15;
    v9[2](v9);
    accountService = self->_accountService;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_3_77;
    v26[3] = &unk_1E2AC3040;
    v27 = v10;
    v28 = v15;
    v20 = v10;
    v21 = accountService;
    v6 = v17;
    -[PKAccountService updateMockAccountWithAccount:completion:](v21, "updateMockAccountWithAccount:completion:", v11, v26);

    v22 = v25;
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_performBillPaymentGroup);
    v11 = -[PKAccountWebServiceApplePayTrustRequest initWithApplePayTrustProtocol:]([PKAccountWebServiceApplePayTrustRequest alloc], "initWithApplePayTrustProtocol:", self->_schedulePaymentRequest);
    -[PKAccountWebServiceApplePayTrustRequest setSignature:](v11, "setSignature:", v6);
    webService = self->_webService;
    account = self->_account;
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2;
    v29[3] = &unk_1E2AC3018;
    v29[4] = self;
    v30 = v9;
    v31 = v7;
    -[PKPaymentWebService applePayTrustSignatureRequestWithRequest:account:completion:](webService, "applePayTrustSignatureRequestWithRequest:account:completion:", v11, account, v29);

    v22 = v30;
  }

}

void __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  v2 = objc_opt_respondsToSelector();
  v3 = *(_QWORD *)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(v3 + 48), "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "recomputeCategoryVisualizationMangitudesForPassUniqueID:style:paymentService:", v4, 2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  }
  else
  {
    v5 = *(void **)(v3 + 16);
    objc_msgSend(*(id *)(v3 + 48), "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recomputeCategoryVisualizationMangitudesForPassUniqueID:style:", v4, 2);
  }

}

void __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_3;
  block[3] = &unk_1E2AC2FF0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v7;
  block[1] = 3221225472;
  v12 = v5;
  v15 = v8;
  v16 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_3(uint64_t a1)
{
  _BOOL4 v2;
  BOOL v3;
  PKPaymentAuthorizationResult *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  PKPaymentAuthorizationResult *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[4];
  PKPaymentAuthorizationResult *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
    v2 = *(_QWORD *)(a1 + 40) == 0;
  else
    v2 = 0;
  v3 = !v2;
  v4 = -[PKPaymentAuthorizationResult initWithStatus:errors:]([PKPaymentAuthorizationResult alloc], "initWithStatus:errors:", !v2, 0);
  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 40), *(id *)(a1 + 40));
    v20 = *(_QWORD *)(a1 + 64);
    if (v20)
      (*(void (**)(uint64_t, PKPaymentAuthorizationResult *))(v20 + 16))(v20, v4);
    v21 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 120);
    if (v21)
      dispatch_group_leave(v21);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "payments");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(void **)(v6 + 152);
    *(_QWORD *)(v6 + 152) = v5;

    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 98) = 1;
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(v8 + 88);
    if (v9)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Inserting bill payment selected suggested amount data for successful payment: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 128), "accountIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "insertEvents:withAccountidentifier:completion:", v11, v12, &__block_literal_global_22);

      v8 = *(_QWORD *)(a1 + 48);
    }
    objc_msgSend(*(id *)(v8 + 24), "scheduleDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "frequency");

    if (v14 == 1)
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(void **)(v15 + 56);
    v17 = *(_QWORD *)(v15 + 128);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_74;
    v22[3] = &unk_1E2AC2FC8;
    v25 = *(id *)(a1 + 64);
    v18 = v4;
    v19 = *(_QWORD *)(a1 + 48);
    v23 = v18;
    v24 = v19;
    objc_msgSend(v16, "updateScheduledPaymentsWithAccount:completion:", v17, v22);

  }
}

void __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_72(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Error inserting bill payment selected suggested amount data: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_74(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;
  uint64_t v6;
  id v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2_75;
  block[3] = &unk_1E2ABDA68;
  v7 = *(id *)(a1 + 48);
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2_75(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = a1[6];
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, a1[4]);
  v3 = *(NSObject **)(a1[5] + 120);
  if (v3)
    dispatch_group_leave(v3);
}

uint64_t __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_3_77(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_billPaymentHasCompletedWithState:(unint64_t)a3 error:(id)a4
{
  NSError *applePayTrustResponseError;
  PKAccountWebServiceSchedulePaymentRequest *schedulePaymentRequest;
  PKAccountEvent *billPaymentSuggestedAmountDataEvent;
  OS_dispatch_group *performBillPaymentGroup;
  void *v10;
  void *v11;
  PKAccountService *accountService;
  id v13;

  v13 = a4;
  applePayTrustResponseError = self->_applePayTrustResponseError;
  self->_applePayTrustResponseError = 0;

  schedulePaymentRequest = self->_schedulePaymentRequest;
  self->_schedulePaymentRequest = 0;

  billPaymentSuggestedAmountDataEvent = self->_billPaymentSuggestedAmountDataEvent;
  self->_billPaymentSuggestedAmountDataEvent = 0;

  self->_performingAction = 0;
  self->_completedBillPayment = 0;
  performBillPaymentGroup = self->_performBillPaymentGroup;
  self->_performBillPaymentGroup = 0;

  self->_dismissedBillPayment = 0;
  -[PKAccountBillPaymentController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a3 == 1)
  {
    objc_msgSend(v10, "accountBillPaymentController:hasChangedState:error:updatedAccount:", self, 1, 0, 0);

    accountService = self->_accountService;
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService updateAccountWithIdentifier:extended:completion:](accountService, "updateAccountWithIdentifier:extended:completion:", v11, 0, 0);
  }
  else
  {
    objc_msgSend(v10, "accountBillPaymentController:hasChangedState:error:updatedAccount:", self, a3, v13, 0);
  }

}

- (void)_accountDidChange:(id)a3
{
  PKAccount *account;
  PKAccountService *accountService;
  void *v6;
  _QWORD v7[5];

  account = self->_account;
  if (account)
  {
    accountService = self->_accountService;
    -[PKAccount accountIdentifier](account, "accountIdentifier", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__PKAccountBillPaymentController__accountDidChange___block_invoke;
    v7[3] = &unk_1E2AC3068;
    v7[4] = self;
    -[PKAccountService accountWithIdentifier:completion:](accountService, "accountWithIdentifier:completion:", v6, v7);

  }
}

void __52__PKAccountBillPaymentController__accountDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PKAccountBillPaymentController__accountDidChange___block_invoke_2;
  v5[3] = &unk_1E2ABE0D0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __52__PKAccountBillPaymentController__accountDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccount:", *(_QWORD *)(a1 + 40));
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (PKAccountBillPaymentControllerDelegate)delegate
{
  return (PKAccountBillPaymentControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)fundingSources
{
  return self->_fundingSources;
}

- (void)setFundingSources:(id)a3
{
  objc_storeStrong((id *)&self->_fundingSources, a3);
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
  objc_storeStrong((id *)&self->_payments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_fundingSources, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_performBillPaymentGroup, 0);
  objc_storeStrong((id *)&self->_dataFetchingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_fetchingDataError, 0);
  objc_storeStrong((id *)&self->_billPaymentSuggestedAmountDataEvent, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_peerPaymentBalance, 0);
  objc_storeStrong((id *)&self->_totalPaymentAmount, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_applePayTrustResponseError, 0);
  objc_storeStrong((id *)&self->_schedulePaymentAuthorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_schedulePaymentRequest, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end
