@implementation PKPeerPaymentRegistrationFlowController

- (PKPeerPaymentRegistrationFlowController)initWithAccount:(id)a3 currencyAmount:(id)a4 state:(unint64_t)a5 senderAddress:(id)a6 setupDelegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPeerPaymentRegistrationFlowController *v17;
  PKPeerPaymentRegistrationFlowController *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PKPeerPaymentRegistrationFlowController;
  v17 = -[PKPeerPaymentRegistrationFlowController init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_account, a3);
    objc_storeStrong((id *)&v18->_currencyAmount, a4);
    v18->_state = a5;
    objc_storeStrong((id *)&v18->_senderAddress, a6);
    objc_storeWeak((id *)&v18->_setupDelegate, v16);
  }

  return v18;
}

- (PKPeerPaymentRegistrationFlowController)initWithUserInfo:(id)a3 setupDelegate:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentRegistrationFlowController *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  PKPeerPaymentAccount *account;
  NSDecimalNumber *v18;
  NSString *v19;
  uint64_t v20;
  PKCurrencyAmount *currencyAmount;
  uint64_t v22;
  NSString *senderAddress;
  void *v24;
  objc_super v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKPeerPaymentRegistrationFlowController;
  v8 = -[PKPeerPaymentRegistrationFlowController init](&v26, sel_init);
  if (!v8)
    goto LABEL_14;
  objc_msgSend(v6, "objectForKey:", CFSTR("account"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, 0);
  if (v10)
  {
    v11 = objc_opt_class();
    v12 = *MEMORY[0x1E0CB2CD0];
    v27 = 0;
    objc_msgSend(v10, "decodeTopLevelObjectOfClass:forKey:error:", v11, v12, &v27);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v27;
    objc_msgSend(v10, "finishDecoding");
    if (v13)
      goto LABEL_10;
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject description](v14, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Could not unarchive peer payment account data with error:%@", buf, 0xCu);

    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Could not initialize unarchiver with peer payment account data.", buf, 2u);
    }
  }
  v13 = 0;
LABEL_10:

  account = v8->_account;
  v8->_account = (PKPeerPaymentAccount *)v13;

  objc_msgSend(v6, "objectForKey:", CFSTR("amount"));
  v18 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("currency"));
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](v19, "length") && v18)
  {
    PKCurrencyAmountCreate(v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v8->_currencyAmount;
    v8->_currencyAmount = (PKCurrencyAmount *)v20;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("senderAddress"));
  v22 = objc_claimAutoreleasedReturnValue();
  senderAddress = v8->_senderAddress;
  v8->_senderAddress = (NSString *)v22;

  objc_msgSend(v6, "objectForKey:", CFSTR("state"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_state = objc_msgSend(v24, "unsignedIntegerValue");

  objc_storeWeak((id *)&v8->_setupDelegate, v7);
LABEL_14:

  return v8;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  PKPeerPaymentRegistrationFlowController *v14;
  id v15;
  uint8_t buf[16];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (self->_account)
    {
      v5 = objc_alloc(MEMORY[0x1E0D67230]);
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithWebService:", v6);

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67408]), "initWithPeerPaymentAccount:", self->_account);
      objc_msgSend(v8, "setAmount:", self->_currencyAmount);
      objc_msgSend(v8, "setFlowState:", self->_state);
      objc_msgSend(v8, "setPendingPaymentSenderAddress:", self->_senderAddress);
      if (v8)
      {
        v17[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __67__PKPeerPaymentRegistrationFlowController_preflightWithCompletion___block_invoke;
        v12[3] = &unk_1E3E69B48;
        v13 = v7;
        v14 = self;
        v15 = v4;
        objc_msgSend(v13, "associateCredentials:withCompletionHandler:", v9, v12);

        v10 = v13;
      }
      else
      {
        PKLogFacilityTypeGetObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Could not create peer payment credential.", buf, 2u);
        }

        +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", 0);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setModalInPresentation:", 1);
        (*((void (**)(id, id))v4 + 2))(v4, v10);
      }

    }
    else
    {
      +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setModalInPresentation:", 1);
      (*((void (**)(id, void *))v4 + 2))(v4, v7);
    }

  }
}

void __67__PKPeerPaymentRegistrationFlowController_preflightWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  char v15;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKPeerPaymentRegistrationFlowController_preflightWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E6C4F8;
  v15 = a2;
  v11 = v5;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __67__PKPeerPaymentRegistrationFlowController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  PKPaymentSetupNavigationController *v4;
  PKPaymentSetupNavigationController *v5;
  id WeakRetained;
  _QWORD v7[4];
  PKPaymentSetupNavigationController *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64) && !*(_QWORD *)(a1 + 32))
  {
    v5 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", *(_QWORD *)(a1 + 40), 0);
    -[PKPaymentSetupNavigationController setPaymentSetupMode:](v5, "setPaymentSetupMode:", 1);
    -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v5, "setCustomFormSheetPresentationStyleForiPad");
    -[PKPaymentSetupNavigationController setAllowsManualEntry:](v5, "setAllowsManualEntry:", 0);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 40));
    -[PKPaymentSetupNavigationController setSetupDelegate:](v5, "setSetupDelegate:", WeakRetained);

    -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v5, "setShowsWelcomeViewController:", 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__PKPeerPaymentRegistrationFlowController_preflightWithCompletion___block_invoke_3;
    v7[3] = &unk_1E3E669E0;
    v8 = v5;
    v9 = *(id *)(a1 + 56);
    v4 = v5;
    -[PKPaymentSetupNavigationController preflightWithCompletion:](v4, "preflightWithCompletion:", v7);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Peer Payment associateCredential failed for local device with error:%@", buf, 0xCu);

    }
    +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", *(_QWORD *)(a1 + 32));
    v4 = (PKPaymentSetupNavigationController *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupNavigationController setModalInPresentation:](v4, "setModalInPresentation:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __67__PKPeerPaymentRegistrationFlowController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setModalInPresentation:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (PKPaymentSetupDelegate)setupDelegate
{
  return (PKPaymentSetupDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
