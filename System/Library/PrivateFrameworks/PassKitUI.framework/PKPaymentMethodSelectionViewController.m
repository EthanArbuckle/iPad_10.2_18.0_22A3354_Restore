@implementation PKPaymentMethodSelectionViewController

- (PKPaymentMethodSelectionViewController)initWithPaymentRequest:(id)a3 selectedPass:(id)a4 paymentMethodName:(id)a5 paymentMethodIdentifier:(id)a6 allowAppleCashToggle:(BOOL)a7 useAppleCashBalance:(BOOL)a8 viewStyle:(int64_t)a9 delegate:(id)a10
{
  _BOOL8 v10;
  _BOOL4 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  PKPaymentMethodSelectionViewController *v21;
  PKPaymentMethodSelectionViewController *v22;
  PKPaymentRequest **p_paymentRequest;
  void *v24;
  void *v25;
  id v26;
  PKPaymentMethodPeerPaymentSectionController *v27;
  PKPaymentMethodPeerPaymentSectionController *peerPaymentController;
  PKPaymentMethodPassesSectionController *v29;
  PKPaymentMethodPassesSectionController *passesController;
  void *v31;
  void *v32;
  PKPaymentMethodRemovedSectionController *v33;
  PKPaymentMethodActionSectionController *v34;
  PKPaymentMethodActionSectionController *actionsController;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  id v41;
  objc_super v42;

  v10 = a8;
  v11 = a7;
  v17 = a3;
  v41 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a10;
  v42.receiver = self;
  v42.super_class = (Class)PKPaymentMethodSelectionViewController;
  v21 = -[PKDynamicCollectionViewController init](&v42, sel_init);
  v22 = v21;
  if (v21)
  {
    v40 = v17;
    p_paymentRequest = &v21->_paymentRequest;
    objc_storeStrong((id *)&v21->_paymentRequest, a3);
    objc_storeStrong((id *)&v22->_selectedPass, a4);
    objc_storeWeak((id *)&v22->_delegate, v20);
    -[PKPaymentMethodSelectionViewController navigationItem](v22, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("AUTO_RELOAD_PAYMENT_METHOD"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTitle:", v25);

    objc_msgSend(v24, "setLargeTitleDisplayMode:", 2);
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v11)
    {
      v27 = -[PKPaymentMethodPeerPaymentSectionController initWithDelegate:request:useAppleCashBalance:]([PKPaymentMethodPeerPaymentSectionController alloc], "initWithDelegate:request:useAppleCashBalance:", v22, *p_paymentRequest, v10);
      peerPaymentController = v22->_peerPaymentController;
      v22->_peerPaymentController = v27;

      objc_msgSend(v26, "addObject:", v22->_peerPaymentController);
    }
    v29 = -[PKPaymentMethodPassesSectionController initWithDelegate:request:selectedPass:]([PKPaymentMethodPassesSectionController alloc], "initWithDelegate:request:selectedPass:", v22, *p_paymentRequest, v22->_selectedPass);
    passesController = v22->_passesController;
    v22->_passesController = v29;

    objc_msgSend(v26, "addObject:", v22->_passesController);
    if (v18)
    {
      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "passWithFPANIdentifier:", v19);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          v33 = -[PKPaymentMethodRemovedSectionController initWithPaymentMethodName:paymentMethodIdentifier:]([PKPaymentMethodRemovedSectionController alloc], "initWithPaymentMethodName:paymentMethodIdentifier:", v18, v19);
          objc_msgSend(v26, "addObject:", v33);

        }
      }
    }
    v34 = -[PKPaymentMethodActionSectionController initWithDelegate:]([PKPaymentMethodActionSectionController alloc], "initWithDelegate:", v22);
    actionsController = v22->_actionsController;
    v22->_actionsController = v34;

    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (a9 == 2)
      PKBridgeButtonTextColor();
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentMethodActionSectionController setLinkTextColor:](v22->_actionsController, "setLinkTextColor:", v37);
    objc_msgSend(v26, "addObject:", v22->_actionsController);
    -[PKDynamicCollectionViewController setSections:animated:](v22, "setSections:animated:", v26, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v22, sel__handlePassUpdate_, *MEMORY[0x1E0D6A788], 0);

    v17 = v40;
  }

  return v22;
}

- (void)performedAddPaymentMethodWithCompletion:(id)a3
{
  -[PKPaymentMethodSelectionViewController _openPaymentSetupWithNetworkWhitelist:completion:](self, "_openPaymentSetupWithNetworkWhitelist:completion:", 0, a3);
}

- (void)selectedPass:(id)a3
{
  PKPaymentMethodSelectionViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "paymentMethodSelectionViewController:didSelectPaymentMethod:", self, v5);

}

- (void)requestOpenURL:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CD5600];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithURL:", v5);

  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  -[PKPaymentMethodSelectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)toggledUseAppleCashBalance:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "paymentMethodSelectionViewController:didToggleUseAppleCashBalance:", self, v3);

}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PKPaymentMethodSelectionViewController *v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithWebService:", v9);

  objc_msgSend(v10, "setAllowedPaymentNetworks:", v6);
  objc_msgSend(v10, "setAllowedCardTypes:", &unk_1E3FAE7D0);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v10, "setAllowedFeatureIdentifiers:", v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke;
  v14[3] = &unk_1E3E6EBC8;
  objc_copyWeak(&v18, &location);
  v12 = v7;
  v17 = v12;
  v13 = v10;
  v15 = v13;
  v16 = self;
  objc_msgSend(v13, "preflightWithCompletion:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  char v15;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke_2;
  v9[3] = &unk_1E3E6EBA0;
  objc_copyWeak(&v14, (id *)(a1 + 56));
  v15 = a2;
  v10 = v5;
  v13 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v14);
}

void __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  PKPaymentSetupDismissibleNavigationController *v4;
  uint64_t v5;
  PKPaymentSetupDismissibleNavigationController *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  PKPaymentSetupDismissibleNavigationController *v14;
  id v15;
  id v16;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 0, *(_QWORD *)(a1 + 40), 0);
      v4 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", 0);
      -[PKPaymentSetupDismissibleNavigationController useStandardPlatformPresentationStyle](v4, "useStandardPlatformPresentationStyle");
      objc_initWeak(&location, *(id *)(a1 + 48));
      v5 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke_3;
      v13[3] = &unk_1E3E61B90;
      objc_copyWeak(&v16, &location);
      v6 = v4;
      v14 = v6;
      v15 = *(id *)(a1 + 56);
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke_4;
      v11[3] = &unk_1E3E61310;
      objc_copyWeak(&v12, &location);
      +[PKProvisioningFlowBridge startProvisionToPurchaseFlowWithNavController:context:onFirstViewControllerShown:completion:](PKProvisioningFlowBridge, "startProvisionToPurchaseFlowWithNavController:context:onFirstViewControllerShown:completion:", v6, v3, v13, v11);
      objc_destroyWeak(&v12);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);

    }
    else
    {
      v7 = *(void **)(a1 + 32);
      if (v7)
      {
        v8 = v7;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v3 = v8;
      +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1, *(_QWORD *)(a1 + 56));

    }
  }

}

void __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

void __91__PKPaymentMethodSelectionViewController__openPaymentSetupWithNetworkWhitelist_completion___block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_handlePassUpdate:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PKPaymentMethodSelectionViewController__handlePassUpdate___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __60__PKPaymentMethodSelectionViewController__handlePassUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataForSectionIdentifier:animated:", CFSTR("passes"), 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_passesController, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedPass, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
}

@end
