@implementation PKPaymentAuthorizationOnboardingInterface

- (id)applyWelcomeCardExperiment
{
  PKAppleCardWelcomeExperiment *applyWelcomeCardExperiment;
  PKAppleCardWelcomeExperiment *v4;
  PKAppleCardWelcomeExperiment *v5;

  applyWelcomeCardExperiment = self->_applyWelcomeCardExperiment;
  if (!applyWelcomeCardExperiment)
  {
    if (self->_feature == 2)
    {
      v4 = (PKAppleCardWelcomeExperiment *)objc_alloc_init(MEMORY[0x1E0D66A80]);
      v5 = self->_applyWelcomeCardExperiment;
      self->_applyWelcomeCardExperiment = v4;

      applyWelcomeCardExperiment = self->_applyWelcomeCardExperiment;
    }
    else
    {
      applyWelcomeCardExperiment = 0;
    }
  }
  return applyWelcomeCardExperiment;
}

- (PKPaymentProvisioningController)provisioningController
{
  PKPaymentProvisioningController *provisioningController;
  id v4;
  void *v5;
  PKPaymentProvisioningController *v6;
  PKPaymentProvisioningController *v7;
  PKPaymentProvisioningController *v8;
  void *v9;
  void *v10;
  void *v11;
  PKPaymentProvisioningController *v12;
  void *v13;
  void *v14;
  void *v15;

  provisioningController = self->_provisioningController;
  if (!provisioningController)
  {
    v4 = objc_alloc(MEMORY[0x1E0D67230]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (PKPaymentProvisioningController *)objc_msgSend(v4, "initWithWebService:", v5);
    v7 = self->_provisioningController;
    self->_provisioningController = v6;

    v8 = self->_provisioningController;
    -[PKPaymentAuthorizationContext request](self->_authorizationContext, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "installmentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "referrerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentProvisioningController setReferrerIdentifier:](v8, "setReferrerIdentifier:", v11);

    v12 = self->_provisioningController;
    v13 = (void *)MEMORY[0x1E0C99E60];
    PKFeatureIdentifierToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentProvisioningController setAllowedFeatureIdentifiers:](v12, "setAllowedFeatureIdentifiers:", v15);

    provisioningController = self->_provisioningController;
  }
  return provisioningController;
}

- (PKPaymentAuthorizationOnboardingInterface)initWithOnboardingContext:(int64_t)a3 authorizationContext:(id)a4 configuration:(id)a5
{
  id v9;
  id v10;
  PKPaymentAuthorizationOnboardingInterface *v11;
  PKPaymentAuthorizationOnboardingInterface *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PKNavigationController *primaryViewController;
  PKPaymentAuthorizationOnboardingInterface *v17;
  objc_super v19;

  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentAuthorizationOnboardingInterface;
  v11 = -[PKPaymentAuthorizationOnboardingInterface init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_onboardingContext = a3;
    objc_storeStrong((id *)&v11->_authorizationContext, a4);
    objc_storeStrong((id *)&v12->_configuration, a5);
    objc_msgSend(v9, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "installmentConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "feature");
    v12->_feature = PKFeatureIdentifierFromPaymentSetupFeatureType();

    if (!v12->_feature)
    {
      v17 = 0;
      goto LABEL_6;
    }
    -[PKPaymentAuthorizationOnboardingInterface _createPrimaryViewController](v12, "_createPrimaryViewController");
    v15 = objc_claimAutoreleasedReturnValue();
    primaryViewController = v12->_primaryViewController;
    v12->_primaryViewController = (PKNavigationController *)v15;

  }
  v17 = v12;
LABEL_6:

  return v17;
}

- (id)_createPrimaryViewController
{
  PKLoadingViewController *v3;
  PKNavigationController *v4;
  void *v5;
  void *v6;

  v3 = -[PKLoadingViewController initWithDelegate:]([PKLoadingViewController alloc], "initWithDelegate:", self);
  v4 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v3);
  -[PKNavigationController setSupportedInterfaceOrientations:](v4, "setSupportedInterfaceOrientations:", -[PKPaymentAuthorizationInterfaceConfiguration supportedOrientations](self->_configuration, "supportedOrientations"));
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v3, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 16);
    -[PKNavigationController view](v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setMasksToBounds:", 1);
    objc_msgSend(v6, "setCornerRadius:", 6.0);

  }
  else
  {
    -[PKNavigationController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 3);
  }

  return v4;
}

- (void)willAppear
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__PKPaymentAuthorizationOnboardingInterface_willAppear__block_invoke;
  v2[3] = &unk_1E3E668C8;
  v2[4] = self;
  -[PKPaymentAuthorizationOnboardingInterface _getProduct:](self, "_getProduct:", v2);
}

void __55__PKPaymentAuthorizationOnboardingInterface_willAppear__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint8_t buf[16];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__PKPaymentAuthorizationOnboardingInterface_willAppear__block_invoke_12;
    v10[3] = &unk_1E3E668A0;
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 32);
    v11 = v6;
    v12 = v7;
    objc_msgSend(v5, "_getAugmentedProduct:", v10);
    v8 = v11;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Couldn't get payment setup product. Dismissing payment authorization.", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "presenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissWithReason:error:completion:", 1, 0, 0);
  }

}

void __55__PKPaymentAuthorizationOnboardingInterface_willAppear__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "augmentWithProduct:", v3);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Couldn't get augmented product. Continuining without augmenting.", buf, 2u);
    }

  }
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PKPaymentAuthorizationOnboardingInterface_willAppear__block_invoke_13;
  v7[3] = &unk_1E3E66878;
  v7[4] = v5;
  objc_msgSend(v5, "_loadFeatureOnboardingViewControllerForProduct:completion:", v6, v7);

}

void __55__PKPaymentAuthorizationOnboardingInterface_willAppear__block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v8 = a2;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setViewControllers:animated:", v6, 0, v8, v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v5);

}

- (void)_getProduct:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PKPaymentAuthorizationOnboardingInterface provisioningController](self, "provisioningController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PKPaymentAuthorizationOnboardingInterface__getProduct___block_invoke;
  v7[3] = &unk_1E3E66918;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "preflightWithCompletion:", v7);

}

void __57__PKPaymentAuthorizationOnboardingInterface__getProduct___block_invoke(uint64_t a1, char a2)
{
  id v3;
  _QWORD block[5];
  id v5;
  char v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PKPaymentAuthorizationOnboardingInterface__getProduct___block_invoke_2;
  block[3] = &unk_1E3E668F0;
  v6 = a2;
  v3 = *(id *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __57__PKPaymentAuthorizationOnboardingInterface__getProduct___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "provisioningController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "paymentSetupProductModel");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "productsForFeatureIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)_getAugmentedProduct:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "request:augmentedProduct", ", buf, 2u);
    }
  }

  -[PKPaymentAuthorizationContext request](self->_authorizationContext, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationOnboardingInterface applyWelcomeCardExperiment](self, "applyWelcomeCardExperiment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0D672B0]);
  objc_msgSend(v8, "installmentConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "experimentDetails");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__PKPaymentAuthorizationOnboardingInterface__getAugmentedProduct___block_invoke;
  v14[3] = &unk_1E3E66940;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v10, "augmentedProductForInstallmentConfiguration:experimentDetails:withCompletion:", v11, v12, v14);

}

void __66__PKPaymentAuthorizationOnboardingInterface__getAugmentedProduct___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKPaymentAuthorizationOnboardingInterface__getAugmentedProduct___block_invoke_2;
  block[3] = &unk_1E3E65388;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __66__PKPaymentAuthorizationOnboardingInterface__getAugmentedProduct___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "product");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, *(const void **)(a1 + 40));
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v3, OS_SIGNPOST_INTERVAL_END, v5, "request:augmentedProduct", ", v6, 2u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_loadFeatureOnboardingViewControllerForProduct:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKFeatureOnBoardingViewController *v8;
  int64_t onboardingContext;
  unint64_t feature;
  void *v11;
  void *v12;
  void *v13;
  PKFeatureOnBoardingViewController *v14;
  void *v15;
  void *v16;
  PKFeatureOnBoardingViewController *v17;
  id v18;
  _QWORD v19[4];
  PKFeatureOnBoardingViewController *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = [PKFeatureOnBoardingViewController alloc];
  onboardingContext = self->_onboardingContext;
  feature = self->_feature;
  -[PKPaymentAuthorizationOnboardingInterface provisioningController](self, "provisioningController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "onboardingItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKFeatureOnBoardingViewController initWithParentFlowController:setupDelegate:setupContext:onboardingContext:featureIdentifier:provisioningController:paymentSetupProduct:currentPage:](v8, "initWithParentFlowController:setupDelegate:setupContext:onboardingContext:featureIdentifier:provisioningController:paymentSetupProduct:currentPage:", 0, self, 8, onboardingContext, feature, v11, v7, v13);

  -[PKPaymentAuthorizationContext request](self->_authorizationContext, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "installmentConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFeatureOnBoardingViewController setInstallmentConfiguration:](v14, "setInstallmentConfiguration:", v16);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __103__PKPaymentAuthorizationOnboardingInterface__loadFeatureOnboardingViewControllerForProduct_completion___block_invoke;
  v19[3] = &unk_1E3E61338;
  v20 = v14;
  v21 = v6;
  v17 = v14;
  v18 = v6;
  -[PKFeatureOnBoardingViewController preflightWithCompletion:](v17, "preflightWithCompletion:", v19);

}

void __103__PKPaymentAuthorizationOnboardingInterface__loadFeatureOnboardingViewControllerForProduct_completion___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __103__PKPaymentAuthorizationOnboardingInterface__loadFeatureOnboardingViewControllerForProduct_completion___block_invoke_2;
  v2[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __103__PKPaymentAuthorizationOnboardingInterface__loadFeatureOnboardingViewControllerForProduct_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)loadingViewControllerDidCancel:(id)a3
{
  id v3;

  -[PKPaymentAuthorizationInterfaceConfiguration presenter](self->_configuration, "presenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissWithReason:error:completion:", 3, 0, 0);

}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "paymentAuthorizationOnboardingDidFinishWithError:", self->_setupError);

}

- (void)viewController:(id)a3 canProceedWithInstallment:(BOOL)a4 featureApplication:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id buf[2];

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v8)
  {
    if (v12)
      (*((void (**)(id))v12 + 2))(v12);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Cannot proceed with installment authorization", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __116__PKPaymentAuthorizationOnboardingInterface_viewController_canProceedWithInstallment_featureApplication_completion___block_invoke;
    v15[3] = &unk_1E3E66968;
    objc_copyWeak(&v17, buf);
    v16 = v13;
    -[PKPaymentAuthorizationOnboardingInterface _bindFeatureApplication:completion:](self, "_bindFeatureApplication:completion:", v11, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(buf);
  }

}

void __116__PKPaymentAuthorizationOnboardingInterface_viewController_canProceedWithInstallment_featureApplication_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D6A758];
    objc_msgSend(WeakRetained, "_setupErrorUserInfoWithBindToken:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, -2016, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSetupError:", v8);

    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(void))(v9 + 16))();
  }

}

- (id)_setupErrorUserInfoWithBindToken:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v7 = *MEMORY[0x1E0D6AD10];
  v8[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_bindFeatureApplication:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[PKPaymentAuthorizationOnboardingInterface _createBindRequestForFeatureApplication:](self, "_createBindRequestForFeatureApplication:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PKPaymentAuthorizationOnboardingInterface__bindFeatureApplication_completion___block_invoke;
  v10[3] = &unk_1E3E66990;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "performInstallmentBindWithRequest:completion:", v7, v10);

}

void __80__PKPaymentAuthorizationOnboardingInterface__bindFeatureApplication_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v7;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Installment bind error: %@", (uint8_t *)&v10, 0xCu);
      }

    }
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "bindToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_createBindRequestForFeatureApplication:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[PKPaymentAuthorizationContext request](self->_authorizationContext, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0D669B0]);
  objc_msgSend(v4, "applicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setApplicationIdentifier:", v7);

  objc_msgSend(v5, "installmentConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bindingTotalAmount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBindingAmount:", v9);

  objc_msgSend(v5, "merchantIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "setMerchantIdentifier:", v10);
  }
  else
  {
    objc_msgSend(v5, "installmentConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "installmentMerchantIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMerchantIdentifier:", v12);

  }
  objc_msgSend(v4, "applicationBaseURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBaseURL:", v13);

  return v6;
}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  PKPaymentAuthorizationOnboardingInterface *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationOnboardingInterface (%{public}p): Dismissing because setup was cancelled", (uint8_t *)&v6, 0xCu);
  }

  -[PKPaymentAuthorizationInterfaceConfiguration presenter](self->_configuration, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissWithReason:error:completion:", 3, 0, 0);

}

- (PKNavigationController)primaryViewController
{
  return self->_primaryViewController;
}

- (void)setPrimaryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_primaryViewController, a3);
}

- (PKPaymentAuthorizationOnboardingInterfaceDelegate)delegate
{
  return (PKPaymentAuthorizationOnboardingInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningController, a3);
}

- (NSError)setupError
{
  return self->_setupError;
}

- (void)setSetupError:(id)a3
{
  objc_storeStrong((id *)&self->_setupError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_primaryViewController, 0);
  objc_storeStrong((id *)&self->_setupError, 0);
  objc_storeStrong((id *)&self->_applyWelcomeCardExperiment, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_authorizationContext, 0);
}

@end
