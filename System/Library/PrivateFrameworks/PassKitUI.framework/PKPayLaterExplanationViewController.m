@implementation PKPayLaterExplanationViewController

- (PKPayLaterExplanationViewController)initWithSetupFlowController:(id)a3
{
  id v5;
  PKPayLaterExplanationViewController *v6;
  PKPayLaterExplanationViewController *v7;
  uint64_t v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPayLaterExplanationViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v10, sel_initWithContext_, objc_msgSend(v5, "setupContext"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_setupController, a3);
    -[PKPayLaterExplanationViewController _setDynamicContentPage](v7, "_setDynamicContentPage");
    v8 = 1;
    -[PKPayLaterExplanationViewController setModalInPresentation:](v7, "setModalInPresentation:", 1);
    -[PKExplanationViewController setExplanationViewControllerDelegate:](v7, "setExplanationViewControllerDelegate:", v7);
    switch(objc_msgSend(v5, "controllerContext"))
    {
      case 0:
        v8 = PKOslo2024UIUpdatesEnabled() ^ 1;
        goto LABEL_5;
      case 1:
      case 3:
      case 4:
        goto LABEL_5;
      case 2:
        v8 = 0;
LABEL_5:
        -[PKExplanationViewController setShowCancelButton:](v7, "setShowCancelButton:", v8);
        break;
      default:
        break;
    }
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKApplyHeroCardView *v9;
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
  uint64_t v20;
  void *v21;
  void *v22;
  PKMultiHyperlinkView *v23;
  void *v24;
  PKApplyHeroCardView *v25;
  _QWORD v26[4];
  id v27;
  PKPayLaterExplanationViewController *v28;
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)PKPayLaterExplanationViewController;
  -[PKExplanationViewController viewDidLoad](&v31, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSetupFlowController preferredLanguage](self->_setupController, "preferredLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayLanguage:", v5);

  -[PKPayLaterExplanationViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v3, "setPrivacyLink:", v4);
  objc_msgSend(v3, "setShowPrivacyView:", 1);
  objc_msgSend(v4, "didMoveToParentViewController:", self);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setBodyDataDetectorTypes:", 0);
  -[PKPayLaterDynamicContentPage headerTitle](self->_dynamicContentPage, "headerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v6);

  -[PKPayLaterDynamicContentPage headerSubtitle](self->_dynamicContentPage, "headerSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v7);

  PKProvisioningSecondaryBackgroundColor();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKApplyHeroCardView initWithFeatureIdentifier:]([PKApplyHeroCardView alloc], "initWithFeatureIdentifier:", 3);
  -[PKApplyHeroCardView setBackgroundColor:](v9, "setBackgroundColor:", v8);
  v25 = v9;
  objc_msgSend(v3, "setHeroView:", v9);
  objc_msgSend(v3, "setTopBackgroundColor:", v8);
  -[PKPayLaterExplanationViewController parentViewController](self, "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v8);

  objc_msgSend(v3, "dockView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "footerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterDynamicContentPage primaryActionTitle](self->_dynamicContentPage, "primaryActionTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v13, "primaryButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:forState:", v15, 0);

  }
  v24 = v14;
  objc_msgSend(v14, "setManualEntryButton:", 0);
  -[PKPayLaterSetupFlowController financingController](self->_setupController, "financingController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "payLaterAccount");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterDynamicContentPage footerContent](self->_dynamicContentPage, "footerContent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "footerText");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v19 && v20)
  {
    objc_initWeak(&location, self);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __50__PKPayLaterExplanationViewController_viewDidLoad__block_invoke;
    v26[3] = &unk_1E3E703D8;
    objc_copyWeak(&v29, &location);
    v27 = v18;
    v28 = self;
    +[PKTextRangeHyperlink hyperlinkSourcesFromApplyFooter:linkTapped:](PKTextRangeHyperlink, "hyperlinkSourcesFromApplyFooter:linkTapped:", v19, v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(PKMultiHyperlinkView);
    -[PKMultiHyperlinkView setText:](v23, "setText:", v21);
    -[PKMultiHyperlinkView setTextAlignment:](v23, "setTextAlignment:", 1);
    -[PKMultiHyperlinkView setSources:](v23, "setSources:", v22);
    objc_msgSend(v13, "setAdditionalLinkView:", v23);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

}

void __50__PKPayLaterExplanationViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  PKAccountTermsAndConditionsController *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(v3, "linkURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "termsIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (*(_QWORD *)(a1 + 32))
      {
        v7 = [PKAccountTermsAndConditionsController alloc];
        v8 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PKAccountTermsAndConditionsController initWithAccount:webService:context:termsIdentifier:](v7, "initWithAccount:webService:context:termsIdentifier:", v8, v9, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "setupContext"), v6);
        v11 = (void *)WeakRetained[133];
        WeakRetained[133] = v10;

        v12 = (void *)WeakRetained[133];
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __50__PKPayLaterExplanationViewController_viewDidLoad__block_invoke_13;
        v17[3] = &unk_1E3E62598;
        objc_copyWeak(&v18, (id *)(a1 + 48));
        objc_msgSend(v12, "termsViewControllerWithCompletion:", v17);
        objc_destroyWeak(&v18);
      }
      else
      {
        PKLogFacilityTypeGetObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v6;
          _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Error: there is no account on PKApplyController in order to open termsIdentifier %@", buf, 0xCu);
        }

      }
    }
    else if (v5)
    {
      objc_msgSend(v5, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsString:", CFSTR("http"));

      if (v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v5);
        objc_msgSend(v15, "setModalPresentationStyle:", 2);
        objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v15, 1, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "openSensitiveURL:withOptions:", v5, 0);
      }

    }
  }

}

void __50__PKPayLaterExplanationViewController_viewDidLoad__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      objc_msgSend(WeakRetained, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else if (v9)
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);
    }
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  UIColor *v7;
  UIColor *originalNavBarColor;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  objc_super v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterExplanationViewController;
  -[PKPayLaterExplanationViewController viewWillAppear:](&v24, sel_viewWillAppear_, a3);
  self->_didTapContinue = 0;
  -[PKPayLaterExplanationViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColor");
  v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  originalNavBarColor = self->_originalNavBarColor;
  self->_originalNavBarColor = v7;

  -[PKPayLaterExplanationViewController parentViewController](self, "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningSecondaryBackgroundColor();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);

  v13 = *MEMORY[0x1E0D69920];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69920]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    self->_didBeginAnalyticsReporter = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v13);
  }
  -[PKPayLaterExplanationViewController parentViewController](self, "parentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "navigationBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningSecondaryBackgroundColor();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v18);

  v25 = *MEMORY[0x1E0D68AA0];
  v26[0] = *MEMORY[0x1E0D68C50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0D66A58];
  -[PKPayLaterExplanationViewController _analyticsDictionaryWithAdditionalDictionary:](self, "_analyticsDictionaryWithAdditionalDictionary:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "subject:sendEvent:", v13, v21);

  if (!-[PKPayLaterSetupFlowController controllerContext](self->_setupController, "controllerContext"))
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v22, "addEntriesFromDictionary:", v19);
    if (-[PKPayLaterSetupFlowController selectedProductType](self->_setupController, "selectedProductType"))
    {
      PKPayLaterAccountProductTypeToString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "safelySetObject:forKey:", v23, *MEMORY[0x1E0D68BD0]);

    }
    objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D698F8], v22);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKPayLaterExplanationViewController;
  -[PKPayLaterExplanationViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  v9 = *MEMORY[0x1E0D68AA0];
  v10[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D66A58];
  v6 = *MEMORY[0x1E0D69920];
  -[PKPayLaterExplanationViewController _analyticsDictionaryWithAdditionalDictionary:](self, "_analyticsDictionaryWithAdditionalDictionary:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject:sendEvent:", v6, v7);

  if (self->_didBeginAnalyticsReporter)
  {
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", v6);
    self->_didBeginAnalyticsReporter = 0;
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterExplanationViewController;
  -[PKPayLaterExplanationViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[PKPayLaterExplanationViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", self->_originalNavBarColor);

  if (!-[PKExplanationViewController showCancelButton](self, "showCancelButton") && !self->_didTapContinue)
  {
    -[PKPayLaterExplanationViewController _reportAnalyticsBackPressed](self, "_reportAnalyticsBackPressed");
    -[PKPayLaterSetupFlowController endSetupFlowFromViewController:shouldDismiss:](self->_setupController, "endSetupFlowFromViewController:shouldDismiss:", self, 0);
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKPayLaterSetupFlowController *setupController;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_dynamicContentPage)
    {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }
    else
    {
      setupController = self->_setupController;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __63__PKPayLaterExplanationViewController_preflightWithCompletion___block_invoke;
      v7[3] = &unk_1E3E642A8;
      v7[4] = self;
      v8 = v4;
      -[PKPayLaterSetupFlowController fetchPayLaterDynamicContentWithCompletion:](setupController, "fetchPayLaterDynamicContentWithCompletion:", v7);

    }
  }

}

void __63__PKPayLaterExplanationViewController_preflightWithCompletion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  _QWORD block[5];
  id v5;
  char v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPayLaterExplanationViewController_preflightWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E66830;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __63__PKPayLaterExplanationViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setDynamicContentPage");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  id location;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterExplanationViewController _showSpinner:](self, "_showSpinner:", 1);
  self->_didTapContinue = 1;
  v16 = *MEMORY[0x1E0D68858];
  v17[0] = *MEMORY[0x1E0D68958];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterExplanationViewController _analyticsDictionaryWithAdditionalDictionary:](self, "_analyticsDictionaryWithAdditionalDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D69920], v6);
  -[PKPayLaterSetupFlowController reportAnalyticsEvent:](self->_setupController, "reportAnalyticsEvent:", v6);
  objc_initWeak(&location, self);
  v7 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke;
  v13[3] = &unk_1E3E677A0;
  v13[4] = self;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v7, "addOperation:", v13);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_3;
  v11[3] = &unk_1E3E6D800;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  v10 = (id)objc_msgSend(v7, "evaluateWithInput:completion:", v9, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_2;
  v13[3] = &unk_1E3E61968;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v11 = v9;
  v15 = v11;
  v12 = v8;
  v14 = v12;
  objc_msgSend(v10, "_showLanguageDisclosureIfNecessaryWithCompletion:", v13);

  objc_destroyWeak(&v16);
}

void __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

void __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  _QWORD *WeakRetained;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (objc_msgSend(v7, "isCanceled"))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1073) = 0;
      objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "endSetupFlowFromViewController:shouldDismiss:", *(_QWORD *)(a1 + 32), 1);
    }
    else
    {
      v9 = (void *)WeakRetained[129];
      v10 = *(_QWORD *)(a1 + 32);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_4;
      v11[3] = &unk_1E3E63C50;
      objc_copyWeak(&v12, (id *)(a1 + 40));
      v11[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v9, "nextViewControllerFromState:parentViewController:completion:", 0, v10, v11);
      objc_destroyWeak(&v12);
    }
  }

}

void __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_5;
      v12[3] = &unk_1E3E62288;
      v12[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v12);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1073) = 0;
      if (!v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "endSetupFlowFromViewController:shouldDismiss:", *(_QWORD *)(a1 + 32), 1);
        goto LABEL_5;
      }
      PKAccountDisplayableError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = PKAlertForDisplayableErrorWithHandlers(v10, 0, 0, 0);

      if (v9)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_6;
        v11[3] = &unk_1E3E612E8;
        v11[4] = v8;
        objc_msgSend(v8, "presentViewController:animated:completion:", v9, 1, v11);
      }
    }

  }
LABEL_5:

}

uint64_t __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
}

uint64_t __72__PKPayLaterExplanationViewController_explanationViewDidSelectContinue___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  -[PKPayLaterExplanationViewController _reportAnalyticsBackPressed](self, "_reportAnalyticsBackPressed", a3);
  -[PKPayLaterSetupFlowController endSetupFlowFromViewController:shouldDismiss:](self->_setupController, "endSetupFlowFromViewController:shouldDismiss:", self, 1);
}

- (void)_reportAnalyticsBackPressed
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0D68858];
  v8[0] = *MEMORY[0x1E0D687C0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D69920];
  -[PKPayLaterExplanationViewController _analyticsDictionaryWithAdditionalDictionary:](self, "_analyticsDictionaryWithAdditionalDictionary:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", v5, v6);

}

- (void)_showLanguageDisclosureIfNecessaryWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  NSObject *v16;
  void *v17;
  void *v18;
  void (**v19)(id, uint64_t);
  void *v20;
  void *v21;
  void (**v22)(id, uint64_t);
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  void (**v26)(id, uint64_t);
  _QWORD v27[4];
  void (**v28)(id, uint64_t);
  uint8_t buf[16];

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    if (!self->_languageDisclosureDynamicContentPage)
    {
LABEL_5:
      v4[2](v4, 1);
      goto LABEL_6;
    }
    v5 = -[PKPayLaterSetupFlowController controllerContext](self->_setupController, "controllerContext");
    if (v5 <= 4)
    {
      if (v5 != 2)
        goto LABEL_5;
      -[PKPayLaterDynamicContentPage contentItem](self->_languageDisclosureDynamicContentPage, "contentItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPayLaterDynamicContentPage contentItem](self->_languageDisclosureDynamicContentPage, "contentItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contentSubtitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPayLaterDynamicContentPage primaryActionTitle](self->_languageDisclosureDynamicContentPage, "primaryActionTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterDynamicContentPage secondaryActionTitle](self->_languageDisclosureDynamicContentPage, "secondaryActionTitle");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v7)
        v13 = v9 == 0;
      else
        v13 = 1;
      if (v13 || v10 == 0 || v11 == 0)
      {
        PKLogFacilityTypeGetObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Error forming lanauge disclosure alert", buf, 2u);
        }

        v4[2](v4, 1);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0DC3448];
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __88__PKPayLaterExplanationViewController__showLanguageDisclosureIfNecessaryWithCompletion___block_invoke;
        v27[3] = &unk_1E3E61CA8;
        v19 = v4;
        v28 = v19;
        objc_msgSend(v18, "actionWithTitle:style:handler:", v10, 0, v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addAction:", v20);

        v21 = (void *)MEMORY[0x1E0DC3448];
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __88__PKPayLaterExplanationViewController__showLanguageDisclosureIfNecessaryWithCompletion___block_invoke_2;
        v25[3] = &unk_1E3E61CA8;
        v22 = v19;
        v26 = v22;
        objc_msgSend(v21, "actionWithTitle:style:handler:", v12, 1, v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addAction:", v23);

        if (v17)
        {
          -[PKPayLaterExplanationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "Error forming lanauge disclosure alert", buf, 2u);
          }

          v22[2](v22, 1);
        }

      }
    }
  }
LABEL_6:

}

uint64_t __88__PKPayLaterExplanationViewController__showLanguageDisclosureIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PKPayLaterExplanationViewController__showLanguageDisclosureIfNecessaryWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_analyticsDictionaryWithAdditionalDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "analyticsDictionaryWithAdditionalDictionary:pageTag:setupController:", v4, *MEMORY[0x1E0D68F70], self->_setupController);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)analyticsDictionaryWithAdditionalDictionary:(id)a3 pageTag:(id)a4 setupController:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E0C99E08];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  objc_msgSend(v11, "addEntriesFromDictionary:", v10);

  objc_msgSend(v11, "setObject:forKey:", v9, *MEMORY[0x1E0D68F50]);
  if (objc_msgSend(v7, "selectedProductType"))
  {
    PKPayLaterAccountProductTypeToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, *MEMORY[0x1E0D68BD0]);

  }
  objc_msgSend(v7, "financingController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transactionCurrencyAmount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "amount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "floatValue");
    v17 = v16 / 50.0 + 0.5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)(floorf(v17) * 50.0));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v19, *MEMORY[0x1E0D68C38]);

  }
  objc_msgSend(v7, "financingController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "channelType");

  if (v22)
  {
    PKPayLaterFinancingControllerChannelTypeToString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v23, *MEMORY[0x1E0D68B20]);

  }
  v24 = (void *)objc_msgSend(v11, "copy");

  return v24;
}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  v5 = !a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dockView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setButtonsEnabled:", v5);

  -[PKExplanationViewController showSpinner:](self, "showSpinner:", v3);
  -[PKPayLaterExplanationViewController navigationController](self, "navigationController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInteractionEnabled:", v5);

  objc_msgSend(v13, "interactivePopGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v5);

  -[PKPayLaterExplanationViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leftBarButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v5);

  objc_msgSend(v10, "rightBarButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", v5);

}

- (id)_genericError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKPayLaterSetupFlowController preferredLanguage](self->_setupController, "preferredLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedApplyFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterSetupFlowController preferredLanguage](self->_setupController, "preferredLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedApplyFeatureString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PKDisplayableErrorCustom();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_setDynamicContentPage
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  PKPayLaterDynamicContentPage *v7;
  PKPayLaterDynamicContentPage *dynamicContentPage;
  PKPayLaterDynamicContentPage *v9;
  PKPayLaterDynamicContentPage *languageDisclosureDynamicContentPage;
  id v11;

  -[PKPayLaterSetupFlowController financingController](self->_setupController, "financingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicContent");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[PKPayLaterSetupFlowController selectedProductType](self->_setupController, "selectedProductType");
  -[PKPayLaterSetupFlowController selectedFinancingOption](self->_setupController, "selectedFinancingOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dynamicContentPageForPageType:productType:optionIdentifier:", 2, v4, v6);
  v7 = (PKPayLaterDynamicContentPage *)objc_claimAutoreleasedReturnValue();
  dynamicContentPage = self->_dynamicContentPage;
  self->_dynamicContentPage = v7;

  objc_msgSend(v11, "dynamicContentPageForPageType:", 13);
  v9 = (PKPayLaterDynamicContentPage *)objc_claimAutoreleasedReturnValue();
  languageDisclosureDynamicContentPage = self->_languageDisclosureDynamicContentPage;
  self->_languageDisclosureDynamicContentPage = v9;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalNavBarColor, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_languageDisclosureDynamicContentPage, 0);
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_setupController, 0);
}

@end
