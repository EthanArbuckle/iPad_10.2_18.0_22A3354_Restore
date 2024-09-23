@implementation PKOnBoardingViewController

- (PKOnBoardingViewController)initWithParentFlowController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 provisioningController:(id)a6 paymentSetupProduct:(id)a7 currentPage:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  PKOnBoardingViewController *v19;
  PKOnBoardingViewController *v20;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)PKOnBoardingViewController;
  v19 = -[PKExplanationViewController initWithContext:](&v22, sel_initWithContext_, a5);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_parentFlowController, v14);
    objc_storeWeak((id *)&v20->_setupDelegate, v15);
    objc_storeStrong((id *)&v20->_provisioningController, a6);
    objc_storeStrong((id *)&v20->_paymentSetupProduct, a7);
    objc_storeStrong((id *)&v20->_currentPage, a8);
    -[PKExplanationViewController setExplanationViewControllerDelegate:](v20, "setExplanationViewControllerDelegate:", v20);
    -[PKOnBoardingViewController setModalInPresentation:](v20, "setModalInPresentation:", 1);
  }

  return v20;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
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
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKOnBoardingViewController;
  -[PKExplanationViewController viewDidLoad](&v23, sel_viewDidLoad);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKOnBoardingViewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidesBackButton:", 1);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setManualEntryButton:", 0);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKDynamicProvisioningPageContent title](self->_currentPage, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setTitleText:", v5);
  v19 = (void *)v5;
  -[PKDynamicProvisioningPageContent subtitle](self->_currentPage, "subtitle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setBodyText:", v6);
  v18 = (void *)v6;
  -[PKDynamicProvisioningPageContent body](self->_currentPage, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v7);
    objc_msgSend(v3, "setAttributedSecondaryBodyText:", v8);

  }
  -[PKDynamicProvisioningPageContent learnMore](self->_currentPage, "learnMore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buttonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v3, "setBodyButtonText:", v10);
  -[PKDynamicProvisioningPageContent disclosureTitle](self->_currentPage, "disclosureTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v4, "setButtonExplanationText:", v11);
  -[PKDynamicProvisioningPageContent primaryActionTitle](self->_currentPage, "primaryActionTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v4;
  objc_msgSend(v4, "primaryButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "setTitle:forState:", v12, 0);
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("CONTINUE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:forState:", v15, 0);

  }
  -[PKDynamicProvisioningPageContent secondaryActionTitle](self->_currentPage, "secondaryActionTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v3, "setForceShowSetupLaterButton:", 1);
    objc_msgSend(v22, "setupLaterButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:forState:", v16, 0);

  }
  else
  {
    objc_msgSend(v3, "setForceShowSetupLaterButton:", 0);
  }
  if (-[PKDynamicProvisioningPageContent contentAlignment](self->_currentPage, "contentAlignment") == 4)
  {
    objc_msgSend(v3, "setTitleTextAlignment:", 4);
    objc_msgSend(v3, "setBodyTextAlignment:", 4);
  }
  -[PKOnBoardingViewController updateForHeroImage](self, "updateForHeroImage");

}

- (void)setHeroImage:(id)a3
{
  objc_storeStrong((id *)&self->_heroImage, a3);
  -[PKOnBoardingViewController updateForHeroImage](self, "updateForHeroImage");
}

- (void)updateForHeroImage
{
  void *v3;
  id v4;

  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_heroImage)
  {
    objc_msgSend(v4, "setImage:");
    objc_msgSend(v4, "setTopBackgroundColor:", 0);
  }
  else
  {
    objc_msgSend(v4, "setImage:");
    PKProvisioningSecondaryBackgroundColor();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTopBackgroundColor:", v3);

  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  void (**v11)(void *, void *);
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(void *, void *);
  _QWORD aBlock[5];
  id v19;
  void (**v20)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  self->_preflightCalled = 1;
  if (self->_heroImage)
  {
    if (v4)
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
  else
  {
    -[PKDynamicProvisioningPageContent heroImageURL](self->_currentPage, "heroImageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKOnboardingViewController preflighting", buf, 2u);
        }

        v10 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __54__PKOnBoardingViewController_preflightWithCompletion___block_invoke;
        aBlock[3] = &unk_1E3E6A748;
        aBlock[4] = self;
        v19 = v6;
        v20 = v5;
        v11 = (void (**)(void *, void *))_Block_copy(aBlock);
        objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cachedDataForURL:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v11[2](v11, v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = v10;
          v16[1] = 3221225472;
          v16[2] = __54__PKOnBoardingViewController_preflightWithCompletion___block_invoke_2;
          v16[3] = &unk_1E3E65260;
          v17 = v11;
          objc_msgSend(v15, "downloadFromUrl:completionHandler:", v7, v16);

        }
      }
      else
      {
        if (v9)
        {
          *(_DWORD *)buf = 138412290;
          v22 = v6;
          _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Could not create valid URL for :%@", buf, 0xCu);
        }

        if (v5)
          v5[2](v5, 1);
      }

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "PKOnboardingViewController - nothing to preflight", buf, 2u);
      }

      if (v5)
        v5[2](v5, 1);
    }

  }
}

void __54__PKOnBoardingViewController_preflightWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  _QWORD block[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    PKScreenScale();
    objc_msgSend(v4, "imageWithData:scale:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = a1[4];
    v7 = *(void **)(v6 + 1080);
    *(_QWORD *)(v6 + 1080) = v5;

    v8 = *(_QWORD *)(a1[4] + 1080);
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v11 = a1[5];
        *(_DWORD *)buf = 138543362;
        v18 = v11;
        v12 = "Created image for URL: %{public}@";
LABEL_7:
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }
    else if (v10)
    {
      v13 = a1[5];
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      v12 = "Failed to create image for URL: %{public}@";
      goto LABEL_7;
    }

  }
  v14 = (void *)a1[6];
  if (v14)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__PKOnBoardingViewController_preflightWithCompletion___block_invoke_41;
    block[3] = &unk_1E3E61590;
    v16 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __54__PKOnBoardingViewController_preflightWithCompletion___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__PKOnBoardingViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[8];
  _QWORD v15[5];

  v4 = -[PKDynamicProvisioningPageContent pageNumber](self->_currentPage, "pageNumber", a3) + 1;
  -[PKPaymentSetupProduct onboardingItems](self->_paymentSetupProduct, "onboardingItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 < objc_msgSend(v5, "count")
    && (objc_msgSend(v5, "objectAtIndex:", v4), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    -[PKOnBoardingViewController nextOnboardingViewControllerWithPage:product:](self, "nextOnboardingViewControllerWithPage:product:", v6, self->_paymentSetupProduct);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
    -[PKOnBoardingViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__PKOnBoardingViewController_explanationViewDidSelectContinue___block_invoke;
    v15[3] = &unk_1E3E62288;
    v15[4] = self;
    objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v8, 1, v15);

  }
  else
  {
    -[PKPaymentSetupProduct configuration](self->_paymentSetupProduct, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "state");

    if (v11 >= 3)
    {
      if (v11 == 3)
      {
        PKLogFacilityTypeGetObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "State is notify making request", v14, 2u);
        }

        -[PKOnBoardingViewController handleNotifyRequested](self, "handleNotifyRequested");
      }
      else if (v11 == 4)
      {
        PKLogFacilityTypeGetObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "State is notify requested or invalid state transition - terminating setup flow", v14, 2u);
        }

        -[PKOnBoardingViewController terminateSetupFlow](self, "terminateSetupFlow");
      }
    }
    else
    {
      -[PKOnBoardingViewController handleProductAvailable](self, "handleProductAvailable");
    }
  }

}

uint64_t __63__PKOnBoardingViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  PKPaymentMoreInformationViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKNavigationController *v14;
  void *v15;
  id v16;

  -[PKDynamicProvisioningPageContent learnMore](self->_currentPage, "learnMore", a3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "buttonURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsString:", CFSTR("http"));

    if (v7)
    {
      v8 = (PKPaymentMoreInformationViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v5);
      -[PKPaymentMoreInformationViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
      -[PKOnBoardingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v8 = (PKPaymentMoreInformationViewController *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentMoreInformationViewController openSensitiveURL:withOptions:](v8, "openSensitiveURL:withOptions:", v5, 0);
    }
  }
  else
  {
    v8 = -[PKPaymentMoreInformationViewController initWithContext:]([PKPaymentMoreInformationViewController alloc], "initWithContext:", -[PKExplanationViewController context](self, "context"));
    objc_msgSend(v16, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setDetailTitle:](v8, "setDetailTitle:", v9);

    objc_msgSend(v16, "subtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setDetailSubtitle:](v8, "setDetailSubtitle:", v10);

    objc_msgSend(v16, "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setDetailBody:](v8, "setDetailBody:", v11);

    objc_msgSend(v16, "businessChatIntentName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setBusinessChatIntentName:](v8, "setBusinessChatIntentName:", v12);

    objc_msgSend(v16, "businessChatButtonTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setBusinessChatButtonTitle:](v8, "setBusinessChatButtonTitle:", v13);

    v14 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
    -[PKOnBoardingViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentModalViewController:withPaymentSetupContext:", v14, -[PKExplanationViewController context](self, "context"));

  }
}

- (void)terminateSetupFlow
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKOnBoardingViewController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)handleNotifyRequested
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PKOnBoardingViewController *v11;

  -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
    -[PKPaymentSetupProduct configuration](self->_paymentSetupProduct, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "productIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0D67228]);
    objc_msgSend(v7, "addDiagnosticReason:", CFSTR("Product Action"));
    objc_msgSend(v7, "setAction:", *MEMORY[0x1E0D6B020]);
    objc_msgSend(v7, "setProductIdentifier:", v6);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke;
    v9[3] = &unk_1E3E78E68;
    v10 = v6;
    v11 = self;
    v8 = v6;
    objc_msgSend(v4, "performProductActionRequest:completion:", v7, v9);

  }
  else
  {
    -[PKOnBoardingViewController terminateSetupFlow](self, "terminateSetupFlow");
  }

}

void __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke_2;
  v11[3] = &unk_1E3E62460;
  v12 = v5;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D67328]);
    objc_msgSend(*(id *)(a1 + 32), "JSONObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateWithPaymentSetupProductsResponse:productsFilter:sectionsFilter:", v3, 0, 0);

    objc_msgSend(v2, "productForProductIdentifier:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "state");

      objc_msgSend(v5, "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "featureIdentifier");

      if (v7 <= 4)
      {
        if (((1 << v7) & 0xD) == 0)
        {
          v12 = *(void **)(a1 + 48);
          if (v7 == 1 && v9 == 3)
          {
            objc_msgSend(*(id *)(a1 + 48), "_presentPayLaterSetupFlowForProduct:", v5);
          }
          else
          {
            objc_msgSend(v5, "onboardingItems");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "firstObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "nextOnboardingViewControllerWithPage:product:", v14, v5);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 48), "navigationController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v18[0] = MEMORY[0x1E0C809B0];
            v18[1] = 3221225472;
            v18[2] = __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke_59;
            v18[3] = &unk_1E3E62288;
            v18[4] = *(_QWORD *)(a1 + 48);
            objc_msgSend(v16, "pk_presentPaymentSetupViewController:animated:completion:", v15, 1, v18);

          }
          goto LABEL_11;
        }
        PKLogFacilityTypeGetObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Error: Request notify me but got incorrect state. Showing error", buf, 2u);
        }

      }
    }

  }
  v2 = PKAlertForDisplayableErrorWithHandlers(*(void **)(a1 + 56), 0, 0, 0);
  v11 = *(void **)(a1 + 48);
  if (!v2)
  {
    objc_msgSend(v11, "showNavigationBarSpinner:", 0);
    objc_msgSend(*(id *)(a1 + 48), "terminateSetupFlow");
    goto LABEL_13;
  }
  objc_msgSend(v11, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke_2_60;
  v17[3] = &unk_1E3E612E8;
  v17[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v5, "presentViewController:animated:completion:", v2, 1, v17);
LABEL_11:

LABEL_13:
}

uint64_t __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke_59(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
}

uint64_t __51__PKOnBoardingViewController_handleNotifyRequested__block_invoke_2_60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
}

- (id)nextOnboardingViewControllerWithPage:(id)a3 product:(id)a4
{
  id v6;
  id v7;
  PKOnBoardingViewController *v8;
  id WeakRetained;
  id v10;
  PKOnBoardingViewController *v11;

  v6 = a4;
  v7 = a3;
  v8 = [PKOnBoardingViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentFlowController);
  v10 = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v11 = -[PKOnBoardingViewController initWithParentFlowController:setupDelegate:context:provisioningController:paymentSetupProduct:currentPage:](v8, "initWithParentFlowController:setupDelegate:context:provisioningController:paymentSetupProduct:currentPage:", WeakRetained, v10, -[PKExplanationViewController context](self, "context"), self->_provisioningController, v6, v7);

  return v11;
}

- (void)_presentPayLaterSetupFlowForProduct:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id buf[2];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Completed notify me flow for pay later. The product action response says the feature is now available. Going straight to pay later setup flow", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  objc_msgSend(v4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureIdentifier");

  v7 = objc_alloc(MEMORY[0x1E0D67230]);
  -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithWebService:", v8);

  v10 = (void *)MEMORY[0x1E0C99E60];
  PKFeatureIdentifierToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowedFeatureIdentifiers:", v12);

  -[PKPaymentProvisioningController referrerIdentifier](self->_provisioningController, "referrerIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReferrerIdentifier:", v13);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke;
  v16[3] = &unk_1E3E65C48;
  objc_copyWeak(&v19, buf);
  v16[4] = self;
  v14 = v9;
  v17 = v14;
  v15 = v4;
  v18 = v15;
  objc_msgSend(v14, "preflightWithRequirements:completionRequirements:completion:", 41, 41, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(buf);

}

void __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  PKNavigationController *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke_2;
      v16[3] = &unk_1E3E612E8;
      v16[4] = WeakRetained;
      v7 = PKAlertForDisplayableErrorWithHandlers(v4, 0, v16, 0);
      if (v7)
        objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", objc_msgSend(*(id *)(a1 + 32), "context"), *(_QWORD *)(a1 + 40), 0);
      v9 = objc_alloc_init(PKNavigationController);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke_3;
      v14[3] = &unk_1E3E61310;
      objc_copyWeak(&v15, (id *)(a1 + 56));
      v12[0] = v11;
      v12[1] = 3221225472;
      v12[2] = __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke_4;
      v12[3] = &unk_1E3E61310;
      objc_copyWeak(&v13, (id *)(a1 + 56));
      +[PKProvisioningFlowBridge startProductManualEntryFlowWithNavController:context:product:presentNavController:completion:](PKProvisioningFlowBridge, "startProductManualEntryFlowWithNavController:context:product:presentNavController:completion:", v9, v8, v10, v14, v12);
      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v9, 1, 0);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);

    }
  }

}

uint64_t __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "terminateSetupFlow");
}

void __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 0);

}

void __66__PKOnBoardingViewController__presentPayLaterSetupFlowForProduct___block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "terminateSetupFlow");

}

- (unint64_t)paymentSetupMarker
{
  return 3;
}

- (PKSetupFlowControllerProtocol)parentFlowController
{
  return (PKSetupFlowControllerProtocol *)objc_loadWeakRetained((id *)&self->_parentFlowController);
}

- (void)setParentFlowController:(id)a3
{
  objc_storeWeak((id *)&self->_parentFlowController, a3);
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningController, a3);
}

- (PKPaymentSetupProduct)paymentSetupProduct
{
  return self->_paymentSetupProduct;
}

- (void)setPaymentSetupProduct:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSetupProduct, a3);
}

- (PKDynamicProvisioningPageContent)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentPage:(id)a3
{
  objc_storeStrong((id *)&self->_currentPage, a3);
}

- (UIImage)heroImage
{
  return self->_heroImage;
}

- (BOOL)preflightCalled
{
  return self->_preflightCalled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImage, 0);
  objc_storeStrong((id *)&self->_currentPage, 0);
  objc_storeStrong((id *)&self->_paymentSetupProduct, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_destroyWeak((id *)&self->_parentFlowController);
}

@end
