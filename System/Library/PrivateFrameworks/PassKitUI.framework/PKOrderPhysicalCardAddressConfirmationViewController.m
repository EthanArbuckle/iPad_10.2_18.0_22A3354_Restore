@implementation PKOrderPhysicalCardAddressConfirmationViewController

- (PKOrderPhysicalCardAddressConfirmationViewController)initWithOrderPhysicalCardController:(id)a3
{
  id v5;
  PKOrderPhysicalCardAddressConfirmationViewController *v6;
  PKOrderPhysicalCardAddressConfirmationViewController *v7;
  uint64_t v8;
  CNPostalAddress *shippingAddress;
  uint64_t v10;
  PKPhysicalCardArtworkOption *artworkOption;
  id v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKOrderPhysicalCardAddressConfirmationViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v15, sel_initWithContext_, objc_msgSend(v5, "paymentSetupContext"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v7->_featureIdentifier = objc_msgSend(v5, "featureIdentifier");
    objc_msgSend(v5, "shippingAddress");
    v8 = objc_claimAutoreleasedReturnValue();
    shippingAddress = v7->_shippingAddress;
    v7->_shippingAddress = (CNPostalAddress *)v8;

    objc_msgSend(v5, "selectedArtworkOption");
    v10 = objc_claimAutoreleasedReturnValue();
    artworkOption = v7->_artworkOption;
    v7->_artworkOption = (PKPhysicalCardArtworkOption *)v10;

    v7->_supportsAddressChange = +[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat");
    v12 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v12, "configureWithTransparentBackground");
    -[PKOrderPhysicalCardAddressConfirmationViewController navigationItem](v7, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStandardAppearance:", v12);

    -[PKExplanationViewController setExplanationViewControllerDelegate:](v7, "setExplanationViewControllerDelegate:", v7);
  }

  return v7;
}

- (void)dealloc
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v4;
  objc_super v5;

  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v4 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)PKOrderPhysicalCardAddressConfirmationViewController;
  -[PKOrderPhysicalCardAddressConfirmationViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PKOrderPhysicalCardHeroView *v5;
  PKOrderPhysicalCardHeroView *physicalCardHeroView;
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
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PKOrderPhysicalCardAddressConfirmationViewController;
  -[PKExplanationViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", -[PKOrderPhysicalCardAddressConfirmationViewController _shouldShowCancelNavigationButton](self, "_shouldShowCancelNavigationButton"));
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKOrderPhysicalCardAddressConfirmationViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setShowPrivacyView:", 0);
  objc_msgSend(v4, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v4, "setImageIgnoresTopSafeArea:", 1);
  v5 = objc_alloc_init(PKOrderPhysicalCardHeroView);
  physicalCardHeroView = self->_physicalCardHeroView;
  self->_physicalCardHeroView = v5;

  -[PKOrderPhysicalCardHeroView artworkView](self->_physicalCardHeroView, "artworkView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOrderPhysicalCardController nameOnCard](self->_controller, "nameOnCard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNameOnCard:", v8);

  v9 = (void *)MEMORY[0x1E0DC3870];
  -[PKPhysicalCardArtworkOption frontFaceImage](self->_artworkOption, "frontFaceImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithPKImage:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setArtworkImage:", v11);

  objc_msgSend(v4, "setHeroView:", self->_physicalCardHeroView);
  PKLocalizedFeatureString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleText:", v12);

  -[PKOrderPhysicalCardAddressConfirmationViewController _addressBodyStringWithPostalAddress:](self, "_addressBodyStringWithPostalAddress:", self->_shippingAddress);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBodyText:", v13);

  objc_msgSend(v4, "dockView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "primaryButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:forState:", v16, 0);

  objc_msgSend(v4, "dockView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "footerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setSkipCardButton:", 0);
  objc_msgSend(v18, "setManualEntryButton:", 0);
  if (self->_supportsAddressChange)
  {
    objc_msgSend(v18, "setupLaterButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:forState:", v20, 0);

  }
  else
  {
    objc_msgSend(v18, "setSetupLaterButton:", 0);
  }

}

- (BOOL)_shouldShowCancelNavigationButton
{
  void *v2;
  BOOL v3;

  -[PKOrderPhysicalCardAddressConfirmationViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "modalPresentationStyle") != 3;

  return v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKOrderPhysicalCardAddressConfirmationViewController;
  -[PKOrderPhysicalCardAddressConfirmationViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
}

- (id)_addressBodyStringWithPostalAddress:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v6 = -[PKPhysicalCardArtworkOption minimumEstimatedShippingTime](self->_artworkOption, "minimumEstimatedShippingTime");
  v7 = -[PKPhysicalCardArtworkOption maximumEstimatedShippingTime](self->_artworkOption, "maximumEstimatedShippingTime");
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    PKLocalizedFeatureString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v7;
    v11 = -[PKPhysicalCardArtworkOption shippingTimeUnit](self->_artworkOption, "shippingTimeUnit");
    if (v11 > 2)
    {
      v12 = 0;
    }
    else
    {
      PKLocalizedString(&off_1E3E62348[v11]->isa);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = v6;
    v20 = v10;
    PKStringWithValidatedFormat();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "appendString:", v9, v19, v20);
  if (self->_supportsAddressChange)
  {
    if (!v4)
      goto LABEL_18;
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    PKLocalizedFeatureString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("\n%@"), v14);
    objc_msgSend(v5, "appendString:", v15);

    if (!v4)
      goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v4, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v5, "appendString:", CFSTR("\n\n"));
    objc_msgSend(v5, "appendString:", v16);
  }

LABEL_18:
  v17 = (void *)objc_msgSend(v5, "copy");

  return v17;
}

- (void)_presentNextViewControllerOrTerminate
{
  PKOrderPhysicalCardController *controller;
  _QWORD v3[5];

  controller = self->_controller;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __93__PKOrderPhysicalCardAddressConfirmationViewController__presentNextViewControllerOrTerminate__block_invoke;
  v3[3] = &unk_1E3E62260;
  v3[4] = self;
  -[PKOrderPhysicalCardController nextViewControllerWithCompletion:](controller, "nextViewControllerWithCompletion:", v3);
}

void __93__PKOrderPhysicalCardAddressConfirmationViewController__presentNextViewControllerOrTerminate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (a3)
  {
    +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040), 0, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_showDisplayableError:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentViewController:", a2);
  }
}

- (void)_presentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pk_paymentSetupSetHideSetupLaterButton:", 1);
    -[PKOrderPhysicalCardAddressConfirmationViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__PKOrderPhysicalCardAddressConfirmationViewController__presentViewController___block_invoke;
    v7[3] = &unk_1E3E62288;
    v7[4] = self;
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v7);

  }
  else
  {
    -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);
    -[PKOrderPhysicalCardAddressConfirmationViewController _terminateFlow](self, "_terminateFlow");
  }

}

uint64_t __79__PKOrderPhysicalCardAddressConfirmationViewController__presentViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
}

- (void)_terminateFlow
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", self);
  else
    -[PKOrderPhysicalCardAddressConfirmationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowSpinner:", v3);
  v6 = v3 ^ 1;
  objc_msgSend(v5, "setEnabled:", v6);
  objc_msgSend(v4, "footerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupLaterButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v6);

}

- (void)_showDisplayableError:(id)a3
{
  id v4;

  v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
  -[PKOrderPhysicalCardAddressConfirmationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  void *v4;
  void *v5;
  CLInUseAssertion *v6;
  CLInUseAssertion *inUseAssertion;
  PKOrderPhysicalCardController *controller;
  _QWORD v9[5];

  if (!self->_inUseAssertion)
  {
    v4 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (CLInUseAssertion *)objc_msgSend(v4, "newAssertionForBundle:withReason:", v5, CFSTR("Ordering physical card"));
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v6;

  }
  -[PKOrderPhysicalCardAddressConfirmationViewController _showSpinner:](self, "_showSpinner:", 1);
  controller = self->_controller;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke;
  v9[3] = &unk_1E3E622B0;
  v9[4] = self;
  -[PKOrderPhysicalCardController startOrderPhysicalCardWithCompletion:](controller, "startOrderPhysicalCardWithCompletion:", v9);
}

void __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67088]), "initWithPaymentRequest:", v7);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 1088);
    *(_QWORD *)(v12 + 1088) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "_setPrivateDelegate:");
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 1088);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke_2;
    v17[3] = &unk_1E3E62288;
    v17[4] = v14;
    objc_msgSend(v15, "presentWithCompletion:", v17);
  }
  else if (v8)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke_4;
    v16[3] = &unk_1E3E612E8;
    v16[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v16);
  }
  else if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_showDisplayableError:", v10);
  }

}

void __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke_3;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
}

uint64_t __89__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectContinue___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentNextViewControllerOrTerminate");
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  id v4;
  PKBusinessChatController *v5;
  PKBusinessChatController *businessChatController;
  PKBusinessChatPhysicalCardContext *v7;
  void *v8;
  PKBusinessChatPhysicalCardContext *v9;
  PKBusinessChatController *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  if (self->_supportsAddressChange)
  {
    if (!self->_businessChatController)
    {
      v5 = objc_alloc_init(PKBusinessChatController);
      businessChatController = self->_businessChatController;
      self->_businessChatController = v5;

    }
    v7 = [PKBusinessChatPhysicalCardContext alloc];
    -[PKOrderPhysicalCardController paymentPass](self->_controller, "paymentPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKBusinessChatPhysicalCardContext initWithPaymentPass:intent:](v7, "initWithPaymentPass:intent:", v8, 0);

    objc_initWeak(&location, self);
    v10 = self->_businessChatController;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectSetupLater___block_invoke;
    v11[3] = &unk_1E3E61DB8;
    objc_copyWeak(&v12, &location);
    -[PKBusinessChatController openBusinessChatWithContext:completion:](v10, "openBusinessChatWithContext:completion:", v9, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

void __91__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectSetupLater___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectSetupLater___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __91__PKOrderPhysicalCardAddressConfirmationViewController_explanationViewDidSelectSetupLater___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v5 = WeakRetained;
    if (v3)
    {
      v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

    }
    else
    {
      objc_msgSend(WeakRetained, "_terminateFlow");
    }
    WeakRetained = v5;
  }

}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  PKPaymentAuthorizationCoordinator *v4;
  NSObject *v5;
  PKPaymentAuthorizationCoordinator *paymentAuthorizationCoordinator;
  _QWORD v7[4];
  PKPaymentAuthorizationCoordinator *v8;
  PKOrderPhysicalCardAddressConfirmationViewController *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  PKOrderPhysicalCardAddressConfirmationViewController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (PKPaymentAuthorizationCoordinator *)a3;
  if (self->_paymentAuthorizationCoordinator == v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[PKOrderPhysicalCardAddressConfirmationViewController paymentAuthorizationCoordinatorDidFinish:]";
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "%s %p: paymentAuthorizationCoordinatorDidFinish: callback called.", buf, 0x16u);
    }

    paymentAuthorizationCoordinator = self->_paymentAuthorizationCoordinator;
    self->_paymentAuthorizationCoordinator = 0;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __97__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
    v7[3] = &unk_1E3E61388;
    v8 = v4;
    v9 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __97__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __97__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  v3[3] = &unk_1E3E612E8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dismissWithCompletion:", v3);
}

void __97__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 1080))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_3;
    block[3] = &unk_1E3E612E8;
    block[4] = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __97__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentNextViewControllerOrTerminate");
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKOrderPhysicalCardAddressConfirmationViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
  id v7;
  PKOrderPhysicalCardController *controller;
  id v9;
  _QWORD v10[5];
  id v11;

  v7 = a5;
  controller = self->_controller;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __131__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke;
  v10[3] = &unk_1E3E62300;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[PKOrderPhysicalCardController completeOrderPhysicalCardWithApplePayTrustSignature:completion:](controller, "completeOrderPhysicalCardWithApplePayTrustSignature:completion:", a4, v10);

}

void __131__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __131__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke_2;
  v10[3] = &unk_1E3E622D8;
  v11 = v5;
  v12 = v6;
  v7 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __131__PKOrderPhysicalCardAddressConfirmationViewController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    LODWORD(v2) = *(_QWORD *)(a1 + 40) == 0;
  v3 = v2 ^ 1;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D670A8]), "initWithStatus:errors:", v3, 0);
  if ((v3 & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(*(id *)(a1 + 48), "_showDisplayableError:");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 1080) = 1;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKPhysicalCardArtworkOption *artworkOption;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  artworkOption = self->_artworkOption;
  if (artworkOption)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__PKOrderPhysicalCardAddressConfirmationViewController_preflightWithCompletion___block_invoke;
    v8[3] = &unk_1E3E62328;
    v9 = v4;
    v7 = -[PKPhysicalCardArtworkOption artworkImage:](artworkOption, "artworkImage:", v8);

  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __80__PKOrderPhysicalCardAddressConfirmationViewController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PKOrderPhysicalCardAddressConfirmationViewController_preflightWithCompletion___block_invoke_2;
    block[3] = &unk_1E3E61590;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __80__PKOrderPhysicalCardAddressConfirmationViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PKPaymentSetupViewControllerDelegate)delegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_paymentAuthorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_physicalCardHeroView, 0);
  objc_storeStrong((id *)&self->_artworkOption, 0);
  objc_storeStrong((id *)&self->_shippingAddress, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
