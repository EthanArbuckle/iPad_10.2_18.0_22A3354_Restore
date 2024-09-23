@implementation PKAccountServiceAccountResolutionController

- (PKAccountServiceAccountResolutionController)initWithAccount:(id)a3 accountUserCollection:(id)a4 transactionSourceCollection:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKAccountServiceAccountResolutionController *v12;
  PKAccountServiceAccountResolutionController *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountServiceAccountResolutionController;
  v12 = -[PKAccountServiceAccountResolutionController init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_accountUserCollection, a4);
    objc_storeStrong((id *)&v13->_transactionSourceCollection, a5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__handleAccountServiceAccountDidChangeNotification_, *MEMORY[0x1E0D68290], 0);

  }
  return v13;
}

- (void)presentFlowForAccountResolution:(unint64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!self->_isInPreflight)
  {
    objc_initWeak((id *)buf, self);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __104__PKAccountServiceAccountResolutionController_presentFlowForAccountResolution_configuration_completion___block_invoke;
    v16 = &unk_1E3E61C30;
    objc_copyWeak(&v18, (id *)buf);
    v9 = v9;
    v17 = v9;
    v11 = _Block_copy(&v13);
    v12 = v11;
    self->_isInPreflight = 1;
    if (a3 - 1 >= 3)
    {
      if (v9)
        (*((void (**)(void *, _QWORD))v11 + 2))(v11, 0);
    }
    else
    {
      -[PKAccountServiceAccountResolutionController _presentAccountServiceAction:configuration:completion:](self, "_presentAccountServiceAction:configuration:completion:", a3, v8, v11, v13, v14, v15, v16);

      v9 = 0;
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
    goto LABEL_11;
  }
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = a3;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Failed to present flow for resolution %lu as its already in preflight", buf, 0xCu);
  }

  if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
LABEL_11:

  }
}

void __104__PKAccountServiceAccountResolutionController_presentFlowForAccountResolution_configuration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 16) = 0;
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v7 = v5;
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
      v5 = v7;
    }
  }

}

- (void)_presentAccountServiceAction:(unint64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  uint64_t v10;
  uint64_t (**v11)(void *, void *, _QWORD);
  PKAccount *account;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  PKAccount *v17;
  PKAccountUserCollection *accountUserCollection;
  char v19;
  uint64_t v20;
  _QWORD v21[4];
  uint64_t (**v22)(void *, void *, _QWORD);
  void (**v23)(id, uint64_t);
  id v24;
  id v25;
  _QWORD aBlock[4];
  id v27[2];
  id location;

  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PKAccountServiceAccountResolutionController__presentAccountServiceAction_configuration_completion___block_invoke;
  aBlock[3] = &unk_1E3E61CF0;
  objc_copyWeak(v27, &location);
  v27[1] = (id)a3;
  v11 = (uint64_t (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  switch(a3)
  {
    case 3uLL:
      objc_msgSend(v8, "businessChatContext");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[PKAccountServiceAccountResolutionController _openBusinessChatWithContext:](self, "_openBusinessChatWithContext:", v14);
        v19 = 1;
        if (v9)
          v9[2](v9, 1);
LABEL_18:

        if (!v9)
          goto LABEL_21;
        goto LABEL_19;
      }
      goto LABEL_15;
    case 2uLL:
      objc_msgSend(v8, "businessChatContext");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[PKAccountServiceAccountResolutionController _alertControllerForBusinessChatContext:](self, "_alertControllerForBusinessChatContext:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v11[2](v11, v16, 0);
        if (v9)
          v9[2](v9, v20);
        goto LABEL_12;
      }
LABEL_15:
      v19 = 0;
      goto LABEL_18;
    case 1uLL:
      account = self->_account;
      v25 = 0;
      v13 = +[PKAccountBillPaymentViewController canPayBillForAccount:displayableError:](PKAccountBillPaymentViewController, "canPayBillForAccount:displayableError:", account, &v25);
      v14 = v25;
      if (!v13)
      {
        +[PKAccountBillPaymentViewController alertControllerForDisplayableError:](PKAccountBillPaymentViewController, "alertControllerForDisplayableError:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, v16, 0);
        v19 = 0;
        goto LABEL_17;
      }
      -[PKTransactionSourceCollection transactionSourcesForType:](self->_transactionSourceCollection, "transactionSourcesForType:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "anyObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v21[0] = v10;
      v17 = self->_account;
      accountUserCollection = self->_accountUserCollection;
      v21[1] = 3221225472;
      v21[2] = __101__PKAccountServiceAccountResolutionController__presentAccountServiceAction_configuration_completion___block_invoke_2;
      v21[3] = &unk_1E3E61D18;
      objc_copyWeak(&v24, &location);
      v22 = v11;
      v23 = v9;
      +[PKAccountBillPaymentViewController billPaymentViewControllerForAccount:accountUserCollection:transactionSource:configuration:withCompletion:](PKAccountBillPaymentViewController, "billPaymentViewControllerForAccount:accountUserCollection:transactionSource:configuration:withCompletion:", v17, accountUserCollection, v16, v8, v21);

      objc_destroyWeak(&v24);
LABEL_12:
      v19 = 1;
LABEL_17:

      goto LABEL_18;
  }
  v19 = 0;
  if (!v9)
    goto LABEL_21;
LABEL_19:
  if ((v19 & 1) == 0)
    v9[2](v9, 0);
LABEL_21:

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

}

BOOL __101__PKAccountServiceAccountResolutionController__presentAccountServiceAction_configuration_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  PKNavigationController *v7;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3)
    {
      v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
      if (PKIsVision() && *(_QWORD *)(a1 + 40) == 1)
      {
        -[PKNavigationController setPageSheetPresentation](v7, "setPageSheetPresentation");
      }
      else if (objc_msgSend(0, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
      {
        -[PKNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
      }
    }
    else
    {
      v7 = (PKNavigationController *)v5;
    }
    objc_msgSend(WeakRetained, "_presentViewController:", v7);

  }
  return WeakRetained != 0;
}

void __101__PKAccountServiceAccountResolutionController__presentAccountServiceAction_configuration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = 0;
  if (v7 && WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 7);
    objc_msgSend(v7, "setObserver:", v5);

    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v4);

}

- (void)_presentViewController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PKAccountServiceAccountResolutionController__presentViewController___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __70__PKAccountServiceAccountResolutionController__presentViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));

  v3 = *(_QWORD *)(a1 + 32);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(v3 + 64));
    objc_msgSend(v5, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
LABEL_5:
    v4 = v5;
    goto LABEL_6;
  }
  v4 = objc_loadWeakRetained((id *)(v3 + 48));
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "accountServiceAccountResolutionController:requestsPresentViewController:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_handleAccountServiceAccountDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PKAccountServiceAccountResolutionController__handleAccountServiceAccountDidChangeNotification___block_invoke;
  aBlock[3] = &unk_1E3E61D40;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  if (self->_account)
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountWithIdentifier:completion:", v6, v4);

  }
}

void __97__PKAccountServiceAccountResolutionController__handleAccountServiceAccountDidChangeNotification___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __97__PKAccountServiceAccountResolutionController__handleAccountServiceAccountDidChangeNotification___block_invoke_2;
  v6[3] = &unk_1E3E61388;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __97__PKAccountServiceAccountResolutionController__handleAccountServiceAccountDidChangeNotification___block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), v1);
}

- (id)_alertControllerForBusinessChatContext:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];

  v20 = a3;
  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "businessChatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("CONTACT_ISSUER"), CFSTR("%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("CALL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __86__PKAccountServiceAccountResolutionController__alertControllerForBusinessChatContext___block_invoke;
    v23[3] = &unk_1E3E61D68;
    v23[4] = self;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v12);

  }
  if (v6
    && +[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
  {
    v13 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("MESSAGE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __86__PKAccountServiceAccountResolutionController__alertControllerForBusinessChatContext___block_invoke_2;
    v21[3] = &unk_1E3E61D90;
    v21[4] = self;
    v22 = v20;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v15);

  }
  v16 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("CANCEL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v18);

  return v9;
}

uint64_t __86__PKAccountServiceAccountResolutionController__alertControllerForBusinessChatContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callIssuer");
}

uint64_t __86__PKAccountServiceAccountResolutionController__alertControllerForBusinessChatContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openBusinessChatWithContext:", *(_QWORD *)(a1 + 40));
}

- (void)_callIssuer
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKTelephoneURLFromPhoneNumber();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)_openBusinessChatWithContext:(id)a3
{
  id v4;
  PKBusinessChatController *v5;
  PKBusinessChatController *businessChatController;
  PKBusinessChatController *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
  {
    if (!self->_businessChatController)
    {
      v5 = objc_alloc_init(PKBusinessChatController);
      businessChatController = self->_businessChatController;
      self->_businessChatController = v5;

    }
    objc_initWeak(&location, self);
    v7 = self->_businessChatController;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__PKAccountServiceAccountResolutionController__openBusinessChatWithContext___block_invoke;
    v8[3] = &unk_1E3E61DB8;
    objc_copyWeak(&v9, &location);
    -[PKBusinessChatController openBusinessChatWithContext:completion:](v7, "openBusinessChatWithContext:completion:", v4, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __76__PKAccountServiceAccountResolutionController__openBusinessChatWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__PKAccountServiceAccountResolutionController__openBusinessChatWithContext___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __76__PKAccountServiceAccountResolutionController__openBusinessChatWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v5 = WeakRetained;
      v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      objc_msgSend(v5, "_presentViewController:", v4);

      WeakRetained = v5;
    }
  }

}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (void)setAccountUserCollection:(id)a3
{
  objc_storeStrong((id *)&self->_accountUserCollection, a3);
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (void)setTransactionSourceCollection:(id)a3
{
  objc_storeStrong((id *)&self->_transactionSourceCollection, a3);
}

- (PKAccountServiceAccountResolutionControllerDelegate)delegate
{
  return (PKAccountServiceAccountResolutionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKAccountBillPaymentObserver)billPaymentObserver
{
  return (PKAccountBillPaymentObserver *)objc_loadWeakRetained((id *)&self->_billPaymentObserver);
}

- (void)setBillPaymentObserver:(id)a3
{
  objc_storeWeak((id *)&self->_billPaymentObserver, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_billPaymentObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
}

@end
