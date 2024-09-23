@implementation PKAccountCardNumbersPresenter

- (PKAccountCardNumbersPresenter)initWithVirtualCard:(id)a3 physicalCard:(id)a4 account:(id)a5 peerPaymentAccount:(id)a6 pass:(id)a7 context:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PKAccountCardNumbersPresenter *v18;
  PKAccountCardNumbersPresenter *v19;
  uint64_t v20;
  PKAccountService *accountService;
  id v24;
  objc_super v25;

  v24 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKAccountCardNumbersPresenter;
  v18 = -[PKAccountCardNumbersPresenter init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_virtualCard, a3);
    objc_storeStrong((id *)&v19->_physicalCard, a4);
    objc_storeStrong((id *)&v19->_account, a5);
    objc_storeStrong((id *)&v19->_peerPaymentAccount, a6);
    objc_storeStrong((id *)&v19->_pass, a7);
    v19->_context = a8;
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v20 = objc_claimAutoreleasedReturnValue();
    accountService = v19->_accountService;
    v19->_accountService = (PKAccountService *)v20;

    v19->_isLoadingVirtualCard = 0;
  }

  return v19;
}

- (void)presentCardNumbersWithCompletion:(id)a3
{
  id v4;
  PKPeerPaymentAccount *peerPaymentAccount;
  _BOOL8 v6;
  void *v7;
  id *v8;
  PKVirtualCard *virtualCard;
  PKAccountOtherCardNumbersViewController *v10;
  NSObject *v11;
  PKAccountOtherCardNumbersViewController *v12;
  NSObject *v13;
  PKAccountService *accountService;
  void *v15;
  NSObject *v16;
  PKAccountService *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id location[2];

  v4 = a3;
  if (!v4)
    goto LABEL_24;
  peerPaymentAccount = self->_peerPaymentAccount;
  if (peerPaymentAccount)
    v6 = -[PKPeerPaymentAccount state](peerPaymentAccount, "state") == 3
      || -[PKPeerPaymentAccount state](self->_peerPaymentAccount, "state") == 4;
  else
    v6 = 0;
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKVirtualCardEnabledWithWebService()
    && (-[PKAccount supportsShowVirtualCard](self->_account, "supportsShowVirtualCard") & 1) == 0
    && -[PKPaymentPass hasActiveVirtualCard](self->_pass, "hasActiveVirtualCard"))
  {

    if (!v6)
    {
      objc_initWeak(location, self);
      self->_isLoadingVirtualCard = 1;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke;
      v26[3] = &unk_1E3E6D8C0;
      objc_copyWeak(&v28, location);
      v26[4] = self;
      v27 = v4;
      +[PKCardNumbersAuthentication authenticationContextLocationBased:completion:](PKCardNumbersAuthentication, "authenticationContextLocationBased:completion:", 1, v26);

      v8 = &v28;
LABEL_33:
      objc_destroyWeak(v8);
      objc_destroyWeak(location);
      goto LABEL_24;
    }
  }
  else
  {

  }
  if ((-[PKAccount supportsShowVirtualCard](self->_account, "supportsShowVirtualCard") & 1) == 0)
  {
    v10 = -[PKAccountOtherCardNumbersViewController initWithPaymentPass:account:context:preferDefaultTitle:]([PKAccountOtherCardNumbersViewController alloc], "initWithPaymentPass:account:context:preferDefaultTitle:", self->_pass, 0, self->_context, v6);
LABEL_23:
    v12 = v10;
    (*((void (**)(id, PKAccountOtherCardNumbersViewController *))v4 + 2))(v4, v10);

    goto LABEL_24;
  }
  if (!-[PKAccount supportsShowVirtualCard](self->_account, "supportsShowVirtualCard"))
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Account doesn't support showing virtual card", (uint8_t *)location, 2u);
    }

    v10 = -[PKAccountCardNumbersViewController initWithPass:accountService:account:physicalCard:context:]([PKAccountCardNumbersViewController alloc], "initWithPass:accountService:account:physicalCard:context:", self->_pass, self->_accountService, self->_account, self->_physicalCard, self->_context);
    goto LABEL_23;
  }
  if (!self->_isLoadingVirtualCard)
  {
    self->_isLoadingVirtualCard = 1;
    virtualCard = self->_virtualCard;
    if (!virtualCard)
    {
      PKLogFacilityTypeGetObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Card information selected: no virtual cards on the account, calling create", (uint8_t *)location, 2u);
      }

      objc_initWeak(location, self);
      accountService = self->_accountService;
      -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_17;
      v20[3] = &unk_1E3E6D910;
      objc_copyWeak(&v22, location);
      v21 = v4;
      -[PKAccountService createVirtualCard:forAccountIdentifier:completion:](accountService, "createVirtualCard:forAccountIdentifier:completion:", 1, v15, v20);

      v8 = &v22;
      goto LABEL_33;
    }
    if (-[PKVirtualCard hasSensitiveCredentials](virtualCard, "hasSensitiveCredentials"))
    {
      -[PKAccountCardNumbersPresenter _prepareAuthForVirtualCard:completion:](self, "_prepareAuthForVirtualCard:completion:", self->_virtualCard, v4);
      self->_isLoadingVirtualCard = 0;
    }
    else
    {
      if ((PKUIOnlyDemoModeEnabled() & 1) == 0)
      {
        PKLogFacilityTypeGetObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Card information selected: attempting to fetch virtual card", (uint8_t *)location, 2u);
        }

        objc_initWeak(location, self);
        v17 = self->_accountService;
        -[PKVirtualCard identifier](self->_virtualCard, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_13;
        v23[3] = &unk_1E3E6D910;
        objc_copyWeak(&v25, location);
        v24 = v4;
        -[PKAccountService performVirtualCardAction:forVirtualCardIdentifier:forAccountIdentifier:completion:](v17, "performVirtualCardAction:forVirtualCardIdentifier:forAccountIdentifier:completion:", 1, v18, v19, v23);

        v8 = &v25;
        goto LABEL_33;
      }
      self->_isLoadingVirtualCard = 0;
      -[PKAccountCardNumbersPresenter _prepareAuthForVirtualCard:completion:](self, "_prepareAuthForVirtualCard:completion:", self->_virtualCard, v4);
    }
  }
LABEL_24:

}

void __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_2;
    block[3] = &unk_1E3E669B8;
    block[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    v11 = WeakRetained;
    v12 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  PKAccountCardNumbersViewController *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  if (*(_QWORD *)(a1 + 40) && !*(_QWORD *)(a1 + 48))
  {
    v6 = -[PKAccountCardNumbersViewController initWithPass:localAuthenticationContext:virtualCard:context:]([PKAccountCardNumbersViewController alloc], "initWithPass:localAuthenticationContext:virtualCard:context:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Card information selected: unable to present card numbers UI because auth failed with error: %@", buf, 0xCu);
    }

    if ((objc_msgSend(*(id *)(a1 + 48), "pk_shouldSuppressAfterAuthenticationPolicyWasLocationBased:", 1) & 1) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      +[PKCardNumbersAuthentication genericDisplayableVirtualCardError](PKCardNumbersAuthentication, "genericDisplayableVirtualCardError");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    }
  }
}

void __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_2_14;
  block[3] = &unk_1E3E6D8E8;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v14 = v7;
  v15 = v9;
  v16 = v8;
  v17 = *(id *)(a1 + 32);
  v10 = v8;
  v11 = v9;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v18);
}

void __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_2_14(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  PKAccountCardNumbersViewController *v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 64) = 0;
    v4 = *(void **)(a1 + 32);
    if (v4 && !*(_QWORD *)(a1 + 40))
    {
      objc_storeStrong(WeakRetained + 1, v4);
      objc_storeStrong(v3 + 3, *(id *)(a1 + 48));
      if (objc_msgSend(v3[1], "hasSensitiveCredentials"))
      {
        objc_msgSend(v3, "_prepareAuthForVirtualCard:completion:", v3[1], *(_QWORD *)(a1 + 56));
        goto LABEL_8;
      }
      v7 = -[PKAccountCardNumbersViewController initWithPass:accountService:account:cardCredentials:virtualCard:physicalCard:context:]([PKAccountCardNumbersViewController alloc], "initWithPass:accountService:account:cardCredentials:virtualCard:physicalCard:context:", v3[5], v3[7], v3[3], 0, v3[1], v3[2], v3[6]);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Card information selected: unable to present card numbers UI because virtual card action failed with error: %@", buf, 0xCu);
      }

      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(a1 + 40), objc_msgSend(v3[3], "feature"), 0, 0);
      v7 = (PKAccountCardNumbersViewController *)objc_claimAutoreleasedReturnValue();
      v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
  }
LABEL_8:

}

void __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_17(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_2_18;
  block[3] = &unk_1E3E6D8E8;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v14 = v7;
  v15 = v9;
  v16 = v8;
  v17 = *(id *)(a1 + 32);
  v10 = v8;
  v11 = v9;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v18);
}

void __66__PKAccountCardNumbersPresenter_presentCardNumbersWithCompletion___block_invoke_2_18(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  PKAccountCardNumbersViewController *v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 64) = 0;
    v4 = *(void **)(a1 + 32);
    if (v4 && !*(_QWORD *)(a1 + 40))
    {
      objc_storeStrong(WeakRetained + 1, v4);
      objc_storeStrong(v3 + 3, *(id *)(a1 + 48));
      if (objc_msgSend(v3[1], "hasSensitiveCredentials"))
      {
        objc_msgSend(v3, "_prepareAuthForVirtualCard:completion:", v3[1], *(_QWORD *)(a1 + 56));
        goto LABEL_8;
      }
      v7 = -[PKAccountCardNumbersViewController initWithPass:accountService:account:cardCredentials:virtualCard:physicalCard:context:]([PKAccountCardNumbersViewController alloc], "initWithPass:accountService:account:cardCredentials:virtualCard:physicalCard:context:", v3[5], v3[7], v3[3], 0, v3[1], v3[2], v3[6]);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Unable to present card numbers UI because create virtual card failed with error: %@", buf, 0xCu);
      }

      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(a1 + 40), objc_msgSend(v3[3], "feature"), 0, 0);
      v7 = (PKAccountCardNumbersViewController *)objc_claimAutoreleasedReturnValue();
      v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
  }
LABEL_8:

}

- (void)_prepareAuthForVirtualCard:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id buf[2];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to auth to decrypt virtual card", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v9 = (void *)objc_opt_class();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PKAccountCardNumbersPresenter__prepareAuthForVirtualCard_completion___block_invoke;
  v12[3] = &unk_1E3E6D938;
  objc_copyWeak(&v15, buf);
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v9, "authAndDecryptWithVirtualCard:completion:", v10, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);

}

void __71__PKAccountCardNumbersPresenter__prepareAuthForVirtualCard_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__PKAccountCardNumbersPresenter__prepareAuthForVirtualCard_completion___block_invoke_2;
    v11[3] = &unk_1E3E69A80;
    v12 = v7;
    v13 = v8;
    v14 = WeakRetained;
    v15 = a1[4];
    v16 = v9;
    v17 = a1[5];
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

void __71__PKAccountCardNumbersPresenter__prepareAuthForVirtualCard_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  PKAccountCardNumbersViewController *v7;
  PKAccountCardNumbersViewController *v8;
  _QWORD *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    v8 = [PKAccountCardNumbersViewController alloc];
    v9 = *(_QWORD **)(a1 + 48);
    v7 = -[PKAccountCardNumbersViewController initWithPass:accountService:account:cardCredentials:virtualCard:physicalCard:context:](v8, "initWithPass:accountService:account:cardCredentials:virtualCard:physicalCard:context:", v9[5], v9[7], v9[3], *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v9[2], v9[6]);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Auth and decrypt virtual card failed with error: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 64), "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D68208]);

    if (v5)
    {
      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "feature"), 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (PKAccountCardNumbersViewController *)PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);

    }
    else
    {
      v7 = 0;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

+ (void)authAndDecryptWithVirtualCard:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__PKAccountCardNumbersPresenter_authAndDecryptWithVirtualCard_completion___block_invoke;
    v7[3] = &unk_1E3E6D988;
    v8 = v5;
    v9 = v6;
    +[PKCardNumbersAuthentication authenticationContextLocationBased:completion:](PKCardNumbersAuthentication, "authenticationContextLocationBased:completion:", 1, v7);

  }
}

void __74__PKAccountCardNumbersPresenter_authAndDecryptWithVirtualCard_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "externalizedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((PKUIOnlyDemoModeEnabled() & 1) != 0)
    {
      if (*(_QWORD *)(a1 + 40))
      {
        v8 = objc_alloc_init(MEMORY[0x1E0D67780]);
        objc_msgSend(v8, "setPrimaryAccountNumber:", CFSTR("1234567890"));
        objc_msgSend(v8, "setCardSecurityCode:", CFSTR("123"));
        objc_msgSend(v8, "setCardType:", 3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __74__PKAccountCardNumbersPresenter_authAndDecryptWithVirtualCard_completion___block_invoke_2;
      v12[3] = &unk_1E3E6D960;
      v13 = v5;
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v10, "cardCredentialsForVirtualCard:authorization:action:completion:", v11, v7, 1, v12);

    }
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(v6, "pk_shouldSuppressAfterAuthenticationPolicyWasLocationBased:", 1))
      v9 = v6;
    else
      v9 = 0;
    (*(void (**)(_QWORD, _QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v6, v9);
  }

}

void __74__PKAccountCardNumbersPresenter_authAndDecryptWithVirtualCard_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v6, "invalidate");
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    if (!v11 || v5)
    {
      v8 = 0;
      v9 = v5;
      v10 = v5;
    }
    else
    {
      v8 = v11;
      v9 = 0;
      v10 = 0;
    }
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))(v7, v8, v9, v10);
  }

}

- (BOOL)isLoadingVirtualCard
{
  return self->_isLoadingVirtualCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_physicalCard, 0);
  objc_storeStrong((id *)&self->_virtualCard, 0);
}

@end
