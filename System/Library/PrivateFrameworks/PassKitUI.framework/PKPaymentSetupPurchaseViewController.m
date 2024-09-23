@implementation PKPaymentSetupPurchaseViewController

- (PKPaymentSetupPurchaseViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 product:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKPaymentSetupPurchaseViewController *v14;
  PKPaymentSetupPurchaseViewController *v15;
  uint64_t v16;
  PKPaymentProvisioningMethodMetadata *provisioningMethodMetadata;
  uint64_t v18;
  NSDecimalNumber *currentAmount;
  PKPaymentSetupPurchaseController *v20;
  PKPaymentSetupPurchaseController *purchaseController;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  objc_super v27;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentSetupPurchaseViewController;
  v14 = -[PKPaymentSetupPurchaseViewController init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_product, a6);
    objc_storeStrong((id *)&v15->_provisioningController, a3);
    v15->_setupContext = a4;
    objc_storeWeak((id *)&v15->_setupDelegate, v12);
    -[PKPaymentSetupProduct provisioningMethodMetadataForType:](v15->_product, "provisioningMethodMetadataForType:", *MEMORY[0x1E0D6AE28]);
    v16 = objc_claimAutoreleasedReturnValue();
    provisioningMethodMetadata = v15->_provisioningMethodMetadata;
    v15->_provisioningMethodMetadata = (PKPaymentProvisioningMethodMetadata *)v16;

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v18 = objc_claimAutoreleasedReturnValue();
    currentAmount = v15->_currentAmount;
    v15->_currentAmount = (NSDecimalNumber *)v18;

    v20 = -[PKPaymentSetupPurchaseController initWithProvisioningController:context:purchaseControllerDelegate:product:provisioningMetadata:]([PKPaymentSetupPurchaseController alloc], "initWithProvisioningController:context:purchaseControllerDelegate:product:provisioningMetadata:", v11, a4, v15, v13, v15->_provisioningMethodMetadata);
    purchaseController = v15->_purchaseController;
    v15->_purchaseController = v20;

    -[PKPaymentSetupPurchaseViewController navigationItem](v15, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v23, "configureWithTransparentBackground");
    objc_msgSend(v22, "setStandardAppearance:", v23);
    objc_msgSend(v22, "setTitle:", 0);
    -[PKPaymentSetupPurchaseViewController _rightBarButton](v15, "_rightBarButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRightBarButtonItem:", v24);

    v15->_fieldsVerified = 0;
    objc_msgSend(v22, "rightBarButtonItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setEnabled:", v15->_fieldsVerified);

  }
  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupPurchaseViewController;
  -[PKPaymentSetupPurchaseViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PKPaymentSetupPurchaseViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PKPaymentSetupPurchaseViewController _createSubviews](self, "_createSubviews");
  -[PKPaymentSetupPurchaseViewController _createConstraints](self, "_createConstraints");
}

- (void)viewWillAppear:(BOOL)a3
{
  int64_t setupContext;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupPurchaseViewController;
  -[PKPaymentSetupPurchaseViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  self->_visibility = 1;
  setupContext = self->_setupContext;
  -[PKPaymentSetupPurchaseViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKPaymentSetupApplyContextAppearance(setupContext, v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupPurchaseViewController;
  -[PKPaymentSetupPurchaseViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_visibility = 3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupPurchaseViewController;
  -[PKPaymentSetupPurchaseViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  self->_visibility = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupPurchaseViewController;
  -[PKPaymentSetupPurchaseViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
  self->_visibility = 2;
  self->_didPurchase = 0;
  -[PKPaymentSetupPurchaseViewController showKeyPad](self, "showKeyPad");
  if ((-[PKPaymentSetupProduct flags](self->_product, "flags") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPaymentString(CFSTR("TRANSIT_CARD_ONLY_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("TRANSIT_CARD_ONLY_MESSAGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("TRANSIT_CARD_ONLY_OK_BUTTON"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addAction:", v10);
    -[PKPaymentSetupPurchaseViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentViewController:animated:completion:", v7, 1, 0);

  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  PKPaymentSetupProduct *product;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  product = self->_product;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PKPaymentSetupPurchaseViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E3E632B8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = -[PKPaymentSetupProduct digitalCardCachedImage:](product, "digitalCardCachedImage:", v8);

}

void __64__PKPaymentSetupPurchaseViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 969) = 1;
    objc_msgSend(*(id *)(a1 + 32), "setCardImage:", v4);
    v4 = v6;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 1, v4);
    v4 = v6;
  }

}

- (void)shakeCard
{
  -[UIImageView pkui_shakeWithCompletion:](self->_passView, "pkui_shakeWithCompletion:", 0);
}

- (void)didUpdateAmount:(id)a3 isValid:(BOOL)a4
{
  void *v6;
  void *v7;
  int64_t setupContext;
  id v9;

  objc_storeStrong((id *)&self->_currentAmount, a3);
  self->_fieldsVerified = a4;
  -[PKPaymentSetupPurchaseViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", self->_fieldsVerified);

  setupContext = self->_setupContext;
  -[PKPaymentSetupPurchaseViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  PKPaymentSetupApplyContextAppearance(setupContext, v9);

}

- (void)transferBalanceFromExistingCard
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(WeakRetained, "purchaseViewControllerDidRequestTransferBalance:", self);

}

- (BOOL)acceptedTerms
{
  return -[PKPaymentSetupPurchaseController acceptedTerms](self->_purchaseController, "acceptedTerms");
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  objc_class *v5;
  void (**v6)(id, id);
  id v7;

  v5 = (objc_class *)MEMORY[0x1E0D670A8];
  v6 = (void (**)(id, id))a5;
  v7 = (id)objc_msgSend([v5 alloc], "initWithStatus:errors:", 0, 0);
  v6[2](v6, v7);

}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__PKPaymentSetupPurchaseViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  objc_msgSend(a3, "dismissWithCompletion:", v3);
}

void __81__PKPaymentSetupPurchaseViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentSetupPurchaseViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __81__PKPaymentSetupPurchaseViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1080);
  *(_QWORD *)(v2 + 1080) = 0;

  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 1088))
  {
    v5 = *(void **)(result + 1000);
    v18 = *MEMORY[0x1E0D68AA0];
    v19[0] = *MEMORY[0x1E0D68BA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportEvent:", v6);

    v7 = objc_alloc(MEMORY[0x1E0D66C88]);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v8 + 1072);
    objc_msgSend(*(id *)(v8 + 1032), "currency");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithAmount:currency:exponent:", v9, v10, 0);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67110]), "initWithPaymentSetupProduct:purchase:balance:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088), v11);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 1088);
    *(_QWORD *)(v13 + 1088) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 968) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "resolveRequirementsUsingProvisioningMethodMetadata:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032));
    objc_msgSend(v12, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "requirementsResponse");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRequirementsResponse:", v16);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
    objc_msgSend(WeakRetained, "purchaseViewController:didPerformPurchaseWithCredential:", *(_QWORD *)(a1 + 32), v12);

    result = *(_QWORD *)(a1 + 32);
  }
  if (!*(_BYTE *)(result + 968))
    return objc_msgSend((id)result, "showKeyPad");
  return result;
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaymentSetupPurchaseViewController view](self, "view", a3);
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
  id v7;
  void *v8;
  void (**v9)(id, _QWORD);
  void (*v10)(void);
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __104__PKPaymentSetupPurchaseViewController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke;
    v12[3] = &unk_1E3E61388;
    v12[4] = self;
    v13 = v7;
    v9 = (void (**)(id, _QWORD))a5;
    dispatch_async(MEMORY[0x1E0C80D38], v12);
    v9[2](v9, 0);

  }
  else
  {
    v10 = (void (*)(void))*((_QWORD *)a5 + 2);
    v11 = a5;
    v10();

  }
}

void __104__PKPaymentSetupPurchaseViewController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1088), *(id *)(a1 + 40));
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", self);

}

- (void)viewController:(id)a3 didShowProvisioningError:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  -[PKProvisioningAnalyticsSessionUIReporter reportError:context:](self->_reporter, "reportError:context:", v9, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v6 = objc_opt_respondsToSelector();

  v7 = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v8 = v7;
  if (v9 && (v6 & 1) != 0)
    objc_msgSend(v7, "viewController:didShowProvisioningError:", self, v9);
  else
    objc_msgSend(v7, "viewControllerDidTerminateSetupFlow:", self);

}

- (void)viewController:(id)a3 requestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(v8, "targetDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "requestPasscodeUpgradeForPasscodeUpgradeFlowController:withVisibleViewController:completion:", v8, v7, v9);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D6A758];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("Error: PKPaymentSetupPurchaseViewController does not support viewController:requestPasscodeUpgradeWithCompletion:");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v9[2](v9, 0, v14);
  }

}

- (void)viewController:(id)a3 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 withShouldContinue:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v8;
  void *v9;
  id v10;

  v7 = a5;
  v10 = a4;
  v8 = a6;
  objc_msgSend(v10, "targetDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "exitPasscodeUpgradeForPasscodeUpgradeFlowController:withShouldContinue:error:", v10, v7, v8);

}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  PKPaymentSetupPurchaseController *purchaseController;
  id v8;
  id v9;
  id v10;

  v10 = a4;
  purchaseController = self->_purchaseController;
  v8 = a3;
  -[PKPaymentSetupPurchaseController termsController](purchaseController, "termsController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
    PKPaymentSetupApplyContextAppearance(self->_setupContext, v10);

}

- (void)paymentSetupDidFinish:(id)a3
{
  -[PKPaymentSetupPurchaseViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[PKPaymentSetupPurchaseViewController showKeyPad](self, "showKeyPad");
}

- (BOOL)_shouldHideImage
{
  return !PKUIGetMinScreenWidthType()
      || -[PKPaymentSetupPurchaseViewController _isCompactHeight](self, "_isCompactHeight");
}

- (BOOL)_isCompactHeight
{
  void *v2;
  BOOL v3;

  -[PKPaymentSetupPurchaseViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verticalSizeClass") == 1;

  return v3;
}

- (void)_createSubviews
{
  PKPaymentSetupPurchaseAmountView *v3;
  PKPaymentSetupPurchaseAmountView *amountView;
  id v5;
  UIImage *cardImage;
  void *v7;
  UIImageView *v8;
  UIImageView *passView;
  void *v10;
  id v11;
  double v12;
  id v13;
  void *v14;
  UILabel *v15;
  UILabel *titleLabel;
  UILabel *v17;
  void *v18;
  id v19;

  -[PKPaymentSetupPurchaseViewController view](self, "view");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PKPaymentSetupPurchaseAmountView initWithProduct:provisioningMethodMetadata:]([PKPaymentSetupPurchaseAmountView alloc], "initWithProduct:provisioningMethodMetadata:", self->_product, self->_provisioningMethodMetadata);
  amountView = self->_amountView;
  self->_amountView = v3;

  -[PKPaymentSetupPurchaseAmountView setTranslatesAutoresizingMaskIntoConstraints:](self->_amountView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKPaymentSetupPurchaseAmountView setDelegate:](self->_amountView, "setDelegate:", self);
  objc_msgSend(v19, "addSubview:", self->_amountView);
  if (!-[PKPaymentSetupPurchaseViewController _shouldHideImage](self, "_shouldHideImage"))
  {
    -[PKPaymentSetupPurchaseViewController _imageSize](self, "_imageSize");
    v5 = objc_alloc(MEMORY[0x1E0DC3890]);
    cardImage = self->_cardImage;
    v7 = cardImage;
    if (!cardImage)
    {
      PKUIImageNamed(CFSTR("PlaceholderCardArt_Large"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = (UIImageView *)objc_msgSend(v5, "initWithImage:", v7);
    passView = self->_passView;
    self->_passView = v8;

    if (!cardImage)
    -[UIImageView layer](self->_passView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowRadius:", 12.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setShadowColor:", objc_msgSend(v11, "CGColor"));

    objc_msgSend(v10, "setShadowOffset:", 0.0, 12.0);
    LODWORD(v12) = 1.0;
    objc_msgSend(v10, "setShadowOpacity:", v12);
    objc_msgSend(v10, "setMasksToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "CGColor");
    PKPaymentStyleApplyCorners();

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_passView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIgnoresInvertColors:](self->_passView, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(v19, "addSubview:", self->_passView);

  }
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B48], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v15;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = self->_titleLabel;
  PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_SELECT_AMOUNT_TITLE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v17, "setText:", v18);

  -[UILabel setFont:](self->_titleLabel, "setFont:", v14);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4);
  objc_msgSend(v19, "addSubview:", self->_titleLabel);

}

- (void)_createConstraints
{
  void *v3;
  id v4;
  id v5;
  UIImageView *v6;
  UIImageView *passView;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UILabel *titleLabel;
  void *v16;
  UIImageView *v17;
  uint64_t v18;
  _BOOL4 v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *amountViewBottomHeightConstraint;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  id v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  id v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  -[PKPaymentSetupPurchaseViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = v3;
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v6 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  passView = self->_passView;
  v41 = v4;
  if (passView)
  {
    -[PKPaymentSetupPurchaseViewController _imageSize](self, "_imageSize", v4);
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passView, 7, 0, 0, 0, 1.0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passView, 8, 0, 0, 0, 1.0, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);
    objc_msgSend(v4, "addObject:", v11);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passView, 9, 0, v6, 9, 1.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_passView, 3, 0, v6, 15, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

    passView = self->_passView;
  }
  titleLabel = self->_titleLabel;
  v16 = (void *)MEMORY[0x1E0CB3718];
  if (passView)
    v17 = passView;
  else
    v17 = v6;
  if (passView)
    v18 = 4;
  else
    v18 = 15;
  v19 = -[PKPaymentSetupPurchaseViewController _isCompactHeight](self, "_isCompactHeight", v41);
  v20 = 8.0;
  if (!v19)
    v20 = 44.0;
  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", titleLabel, 12, 0, v17, v18, 1.0, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v21);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 5, 0, v6, 17, 1.0, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v22);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 6, 0, v6, 18, 1.0, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v23);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_amountView, 3, 0, self->_titleLabel, 11, 1.0, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v24);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_amountView, 4, 0, v6, 4, 1.0, 0.0);
  v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  amountViewBottomHeightConstraint = self->_amountViewBottomHeightConstraint;
  self->_amountViewBottomHeightConstraint = v25;

  -[PKPaymentSetupPurchaseViewController _updateBottomHeightConstraint](self, "_updateBottomHeightConstraint");
  objc_msgSend(v5, "addObject:", self->_amountViewBottomHeightConstraint);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_amountView, 5, 0, v6, 17, 1.0, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v27);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_amountView, 6, 0, v6, 18, 1.0, 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v28);

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v29 = v42;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v30)
  {
    v32 = v30;
    v33 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v49 != v33)
          objc_enumerationMutation(v29);
        LODWORD(v31) = 1148846080;
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "setPriority:", v31);
      }
      v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v32);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v35 = v5;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v36)
  {
    v38 = v36;
    v39 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(v35);
        LODWORD(v37) = 1144750080;
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "setPriority:", v37);
      }
      v38 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v38);
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v29);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v35);

}

- (id)_rightBarButton
{
  void *v3;
  void *v4;

  PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_ACTION_ADD"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v3, 2, self, sel__rightBarButtonPressed_);

  return v4;
}

- (id)_spinnerBarButton
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *activityIndicator;

  if (!self->_activityIndicator)
  {
    v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v3;

    PKPaymentSetupApplyContextAppearance(-[PKPaymentSetupPurchaseViewController setupContext](self, "setupContext"), self->_activityIndicator);
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_activityIndicator);
}

- (void)showKeyPad
{
  id v2;

  -[PKPaymentSetupPurchaseAmountView amountTextField](self->_amountView, "amountTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[PKPaymentSetupPurchaseViewController navigationItem](self, "navigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKPaymentSetupPurchaseViewController _spinnerBarButton](self, "_spinnerBarButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", v5);

    -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
  }
  else
  {
    -[PKPaymentSetupPurchaseViewController _rightBarButton](self, "_rightBarButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", v6);

    -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
  }

}

- (void)_rightBarButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  if (self->_fieldsVerified)
  {
    -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
    -[PKPaymentSetupPurchaseAmountView amountTextField](self->_amountView, "amountTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resignFirstResponder");

    -[PKPaymentSetupPurchaseController paymentRequestForAmount:](self->_purchaseController, "paymentRequestForAmount:", self->_currentAmount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__PKPaymentSetupPurchaseViewController__rightBarButtonPressed___block_invoke;
    v8[3] = &unk_1E3E63520;
    v8[4] = self;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v6, "canPresentPaymentRequest:completion:", v7, v8);

  }
}

void __63__PKPaymentSetupPurchaseViewController__rightBarButtonPressed___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD block[5];
  id v5;
  uint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentSetupPurchaseViewController__rightBarButtonPressed___block_invoke_2;
  block[3] = &unk_1E3E63480;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __63__PKPaymentSetupPurchaseViewController__rightBarButtonPressed___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 984), "presetPaymentRequest:forResultType:", a1[5], a1[6]);
}

- (void)_presetPaymentRequest:(id)a3 forResultType:(int64_t)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v6 = a3;
  if (a4 == 5 || a4 == 2)
  {
    -[PKPaymentSetupPurchaseController presetPaymentRequest:forResultType:](self->_purchaseController, "presetPaymentRequest:forResultType:", v6, a4);
  }
  else if (PKViewVisibilityStateIsVisible())
  {
    -[PKPaymentSetupPurchaseViewController _showSpinner:](self, "_showSpinner:", 1);
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__PKPaymentSetupPurchaseViewController__presetPaymentRequest_forResultType___block_invoke;
    v7[3] = &unk_1E3E63548;
    objc_copyWeak(&v9, &location);
    v7[4] = self;
    v8 = v6;
    -[PKPaymentSetupPurchaseViewController _presentTermsAndConditionsWithCompletion:](self, "_presentTermsAndConditionsWithCompletion:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __76__PKPaymentSetupPurchaseViewController__presetPaymentRequest_forResultType___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
    v6 = *MEMORY[0x1E0D68AA0];
    v12[0] = *MEMORY[0x1E0D68C30];
    v7 = *MEMORY[0x1E0D695C0];
    v11[0] = v6;
    v11[1] = v7;
    PKAnalyticsReportSwitchToggleResultValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportEvent:", v9);

    objc_msgSend(WeakRetained, "_showSpinner:", 0);
    if (a2)
    {
      if (PKViewVisibilityStateIsVisible())
      {
        objc_msgSend(WeakRetained, "authorizationCoordinator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67088]), "initWithPaymentRequest:", *(_QWORD *)(a1 + 40));
          objc_msgSend(WeakRetained, "setAuthorizationCoordinator:", v10);
          objc_msgSend(v10, "setDelegate:", WeakRetained);
          objc_msgSend(v10, "_setPrivateDelegate:", WeakRetained);
          objc_msgSend(v10, "presentWithCompletion:", 0);
        }

      }
    }
  }

}

- (void)_presentTermsAndConditionsWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  RemoteUIController *v7;
  RemoteUIController *termsController;
  void *v9;
  PKPortraitNavigationController *v10;
  void *v11;
  void *v12;
  RemoteUIController *v13;
  PKPortraitNavigationController *v14;
  _QWORD v15[4];
  PKPortraitNavigationController *v16;
  PKPaymentSetupPurchaseViewController *v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  id v20;
  id location;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (self->_acceptedTerms)
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }
  else
  {
    -[PKPaymentSetupProduct termsURL](self->_product, "termsURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (!self->_termsController)
      {
        v7 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E0D872F0]);
        termsController = self->_termsController;
        self->_termsController = v7;

        -[RemoteUIController setDelegate:](self->_termsController, "setDelegate:", self);
      }
      -[PKPaymentSetupPurchaseViewController resignFirstResponder](self, "resignFirstResponder");
      -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(PKPortraitNavigationController);
      -[PKPortraitNavigationController setModalInPresentation:](v10, "setModalInPresentation:", 1);
      -[RemoteUIController setNavigationController:](self->_termsController, "setNavigationController:", v10);
      -[RemoteUIController loader](self->_termsController, "loader");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAllowNonSecureHTTP:", objc_msgSend(v12, "devSigned"));

      objc_initWeak(&location, self);
      v13 = self->_termsController;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke;
      v15[3] = &unk_1E3E635C0;
      objc_copyWeak(&v20, &location);
      v14 = v10;
      v16 = v14;
      v17 = self;
      v19 = v5;
      v18 = v6;
      -[RemoteUIController loadURL:postBody:completion:](v13, "loadURL:postBody:completion:", v18, 0, v15);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);

    }
    else
    {
      v5[2](v5, 1, 0);
    }

  }
}

void __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E63598;
  objc_copyWeak(&v15, (id *)(a1 + 64));
  v16 = a2;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  v14 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 48);
  v13 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v15);
}

void __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  _QWORD v16[4];
  id v17;
  id v18;
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      PKPaymentSetupApplyContextAppearance(objc_msgSend(WeakRetained, "setupContext"), *(void **)(a1 + 32));
      v5 = objc_msgSend(*(id *)(a1 + 40), "pkui_userInterfaceIdiomSupportsLargeLayouts");
      if (PKViewVisibilityStateIsVisible())
      {
        if (v5)
        {
          objc_msgSend(*(id *)(a1 + 32), "setModalPresentationStyle:", 3);
          objc_msgSend(v4, "presentViewController:withTransition:completion:", *(_QWORD *)(a1 + 32), 1, 0);
        }
        else
        {
          objc_msgSend(v4, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
        }
        v9 = (void *)v4[139];
        v10 = MEMORY[0x1E0C809B0];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke_3;
        v16[3] = &unk_1E3E63570;
        objc_copyWeak(&v18, v2);
        v19 = v5;
        v17 = *(id *)(a1 + 64);
        objc_msgSend(v9, "setHandlerForElementName:handler:", CFSTR("agree"), v16);
        v11 = (void *)v4[139];
        v12[0] = v10;
        v12[1] = 3221225472;
        v12[2] = __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke_4;
        v12[3] = &unk_1E3E63570;
        objc_copyWeak(&v14, v2);
        v15 = v5;
        v13 = *(id *)(a1 + 64);
        objc_msgSend(v11, "setHandlerForElementName:handler:", CFSTR("disagree"), v12);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&v18);
      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 56), "localizedDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v7;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Error loading terms UI at %@ with error: %@", buf, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
  }

}

void __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setAcceptedTerms:", 1);
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v3, "dismissViewControllerWithTransition:completion:", 1, 0);
    else
      objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void __81__PKPaymentSetupPurchaseViewController__presentTermsAndConditionsWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(WeakRetained, "dismissViewControllerWithTransition:completion:", 2, 0);
    else
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (CGSize)_imageSize
{
  unint64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = PKUIGetMinScreenWidthType();
  v3 = dbl_19DF14E90[v2 < 4];
  v4 = dbl_19DF14EA0[v2 < 4];
  if (!v2)
  {
    v4 = 81.0;
    v3 = 51.0;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)_updateBottomHeightConstraint
{
  double v3;
  double v4;
  NSLayoutConstraint *amountViewBottomHeightConstraint;
  double v6;

  -[PKPaymentSetupPurchaseAmountView defaultKeyboardSize](self->_amountView, "defaultKeyboardSize");
  v4 = v3;
  amountViewBottomHeightConstraint = self->_amountViewBottomHeightConstraint;
  +[PKNumberPadSuggestionsView defaultSize](PKNumberPadSuggestionsView, "defaultSize");
  -[NSLayoutConstraint setConstant:](amountViewBottomHeightConstraint, "setConstant:", -(v4 + v6));
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (PKPaymentSetupPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (PKPaymentSetupPurchaseViewControllerFlowDelegate)flowDelegate
{
  return (PKPaymentSetupPurchaseViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
}

- (void)setFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowDelegate, a3);
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningController, a3);
}

- (int64_t)setupContext
{
  return self->_setupContext;
}

- (void)setSetupContext:(int64_t)a3
{
  self->_setupContext = a3;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (PKPaymentProvisioningMethodMetadata)provisioningMethodMetadata
{
  return self->_provisioningMethodMetadata;
}

- (void)setProvisioningMethodMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningMethodMetadata, a3);
}

- (UIImageView)passView
{
  return self->_passView;
}

- (void)setPassView:(id)a3
{
  objc_storeStrong((id *)&self->_passView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (PKPaymentSetupPurchaseAmountView)amountView
{
  return self->_amountView;
}

- (void)setAmountView:(id)a3
{
  objc_storeStrong((id *)&self->_amountView, a3);
}

- (NSLayoutConstraint)amountViewBottomHeightConstraint
{
  return self->_amountViewBottomHeightConstraint;
}

- (void)setAmountViewBottomHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_amountViewBottomHeightConstraint, a3);
}

- (NSDecimalNumber)currentAmount
{
  return self->_currentAmount;
}

- (void)setCurrentAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (PKPaymentAuthorizationCoordinator)authorizationCoordinator
{
  return self->_authorizationCoordinator;
}

- (void)setAuthorizationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationCoordinator, a3);
}

- (PKServiceProviderPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
  objc_storeStrong((id *)&self->_purchase, a3);
}

- (BOOL)fieldsVerified
{
  return self->_fieldsVerified;
}

- (void)setFieldsVerified:(BOOL)a3
{
  self->_fieldsVerified = a3;
}

- (void)setAcceptedTerms:(BOOL)a3
{
  self->_acceptedTerms = a3;
}

- (UIImage)cardImage
{
  return self->_cardImage;
}

- (void)setCardImage:(id)a3
{
  objc_storeStrong((id *)&self->_cardImage, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (RemoteUIController)termsController
{
  return self->_termsController;
}

- (void)setTermsController:(id)a3
{
  objc_storeStrong((id *)&self->_termsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_currentAmount, 0);
  objc_storeStrong((id *)&self->_amountViewBottomHeightConstraint, 0);
  objc_storeStrong((id *)&self->_amountView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_provisioningMethodMetadata, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end
