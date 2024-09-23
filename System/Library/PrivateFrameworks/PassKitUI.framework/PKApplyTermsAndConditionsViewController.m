@implementation PKApplyTermsAndConditionsViewController

- (PKApplyTermsAndConditionsViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 termsIdentifier:(id)a6
{
  id v10;
  id v11;
  PKApplyTermsAndConditionsViewController *v12;
  PKApplyTermsAndConditionsViewController *v13;
  uint64_t v14;
  NSString *termsIdentifier;
  objc_super v17;

  v10 = a3;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKApplyTermsAndConditionsViewController;
  v12 = -[PKFeatureTermsAndConditionsViewController initWithSetupDelegate:context:](&v17, sel_initWithSetupDelegate_context_, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_applyController, v10);
    v14 = objc_msgSend(v11, "copy");
    termsIdentifier = v13->_termsIdentifier;
    v13->_termsIdentifier = (NSString *)v14;

    v13->_preflightPDFTerms = 0;
  }

  return v13;
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
  v5.super_class = (Class)PKApplyTermsAndConditionsViewController;
  -[PKApplyTermsAndConditionsViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  PKApplyController **p_applyController;
  id WeakRetained;
  id v6;
  uint64_t v7;
  id *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PKApplyTermsAndConditionsViewController;
  -[PKApplyTermsAndConditionsViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  p_applyController = &self->_applyController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  objc_msgSend(WeakRetained, "applyFlowDidAppear");

  v6 = objc_loadWeakRetained((id *)&self->_applyController);
  v7 = objc_msgSend(v6, "featureIdentifier");

  if (v7 == 2)
  {
    if (self->_termsIdentifier)
      v8 = (id *)MEMORY[0x1E0D698C0];
    else
      v8 = (id *)MEMORY[0x1E0D698C8];
    v9 = *v8;
    v10 = objc_loadWeakRetained((id *)p_applyController);
    v11 = *MEMORY[0x1E0D68688];
    v14 = *MEMORY[0x1E0D68AA0];
    v15[0] = *MEMORY[0x1E0D68C50];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reportAnalyticsDictionaryForPage:subject:pageTag:additionalValues:", 0, v9, v11, v12);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  PKApplyController **p_applyController;
  id WeakRetained;
  uint64_t v6;
  id *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PKApplyTermsAndConditionsViewController;
  -[PKApplyTermsAndConditionsViewController viewDidDisappear:](&v12, sel_viewDidDisappear_, a3);
  p_applyController = &self->_applyController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  v6 = objc_msgSend(WeakRetained, "featureIdentifier");

  if (v6 == 2)
  {
    if (self->_termsIdentifier)
      v7 = (id *)MEMORY[0x1E0D698C0];
    else
      v7 = (id *)MEMORY[0x1E0D698C8];
    v8 = *v7;
    v9 = objc_loadWeakRetained((id *)p_applyController);
    v10 = *MEMORY[0x1E0D68688];
    v13 = *MEMORY[0x1E0D68AA0];
    v14[0] = *MEMORY[0x1E0D68C58];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportAnalyticsDictionaryForPage:subject:pageTag:additionalValues:", 0, v8, v10, v11);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKApplyTermsAndConditionsViewController;
  -[PKApplyTermsAndConditionsViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
}

- (id)displayTitle
{
  PKApplyController **p_applyController;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  p_applyController = &self->_applyController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  v4 = objc_msgSend(WeakRetained, "featureIdentifier");

  if (v4 == 5)
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)p_applyController);
    objc_msgSend(v6, "preferredLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedApplyFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)initalTermsDataWithCompletion:(id)a3
{
  if (self->_preflightPDFTerms)
    -[PKApplyTermsAndConditionsViewController pdfTermsDataWithIdentifier:completion:](self, "pdfTermsDataWithIdentifier:completion:", self->_termsIdentifier, a3);
  else
    -[PKApplyTermsAndConditionsViewController htmlTermsDataWithCompletion:](self, "htmlTermsDataWithCompletion:", a3);
}

- (void)htmlTermsDataWithCompletion:(id)a3
{
  NSString *termsIdentifier;
  PKApplyController **p_applyController;
  id v6;
  id WeakRetained;
  id v8;

  termsIdentifier = self->_termsIdentifier;
  p_applyController = &self->_applyController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_applyController);
  v8 = WeakRetained;
  if (termsIdentifier)
    objc_msgSend(WeakRetained, "termsDataForIdentifier:format:completion:", self->_termsIdentifier, *MEMORY[0x1E0D6BA20], v6);
  else
    objc_msgSend(WeakRetained, "termsDataForFeatureWithIdentifier:format:completion:", 0, *MEMORY[0x1E0D6BA20], v6);

}

- (void)pdfTermsDataWithIdentifier:(id)a3 completion:(id)a4
{
  NSString *termsIdentifier;
  PKApplyController **p_applyController;
  id v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  id v11;

  termsIdentifier = self->_termsIdentifier;
  p_applyController = &self->_applyController;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_applyController);
  v10 = *MEMORY[0x1E0D6BA28];
  v11 = WeakRetained;
  if (termsIdentifier)
    objc_msgSend(WeakRetained, "termsDataForIdentifier:format:completion:", v8, v10, v7);
  else
    objc_msgSend(WeakRetained, "termsDataForFeatureWithIdentifier:format:completion:", v8, v10, v7);

}

- (void)reportAnalyticsForTermsLink:(id)a3
{
  __CFString *v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "PKStringForKey:", CFSTR("termsFileName"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  v6 = *MEMORY[0x1E0D68C08];
  v7 = *MEMORY[0x1E0D69438];
  v12[0] = *MEMORY[0x1E0D68AA0];
  v12[1] = v7;
  v8 = *MEMORY[0x1E0D69700];
  v13[0] = v6;
  v13[1] = v8;
  v12[2] = *MEMORY[0x1E0D68670];
  v9 = *MEMORY[0x1E0D68688];
  if (v4)
    v10 = v4;
  else
    v10 = &stru_1E3E7D690;
  v13[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", 0, v9, v11);

}

- (void)termsShown
{
  id WeakRetained;

  if (self->_termsIdentifier)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
    objc_msgSend(WeakRetained, "termsShownWithIdentifier:", self->_termsIdentifier);

  }
}

- (void)termsAccepted:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  id *v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  PKApplyTermsVerifyingViewController *v15;
  id v16;
  void *v17;
  int64_t v18;
  void *v19;
  PKApplyTermsVerifyingViewController *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  CLInUseAssertion *v27;
  CLInUseAssertion *inUseAssertion;
  id v29;
  NSString *termsIdentifier;
  _QWORD v31[5];
  void (**v32)(_QWORD);
  id v33;
  id location;
  _QWORD v35[5];
  void (**v36)(_QWORD);
  _QWORD v37[2];
  _QWORD v38[3];

  v4 = a3;
  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  v7 = (id *)MEMORY[0x1E0D68750];
  if (!v4)
    v7 = (id *)MEMORY[0x1E0D68A40];
  v8 = *v7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  v10 = *MEMORY[0x1E0D68B18];
  v11 = *MEMORY[0x1E0D68858];
  v37[0] = *MEMORY[0x1E0D68AA0];
  v37[1] = v11;
  v38[0] = v10;
  v38[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", 0, *MEMORY[0x1E0D68688], v12);

  v13 = objc_loadWeakRetained((id *)&self->_applyController);
  v14 = objc_msgSend(v13, "featureIdentifier");

  if (v14 == 5 || !v4)
  {
    if (!self->_inUseAssertion)
    {
      v24 = (void *)MEMORY[0x1E0C9E3A8];
      PKPassKitCoreBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v26 = CFSTR("Accepting application terms");
      else
        v26 = CFSTR("Declining application terms");
      v27 = (CLInUseAssertion *)objc_msgSend(v24, "newAssertionForBundle:withReason:", v25, v26);
      inUseAssertion = self->_inUseAssertion;
      self->_inUseAssertion = v27;

    }
    objc_initWeak(&location, self);
    v29 = objc_loadWeakRetained((id *)&self->_applyController);
    termsIdentifier = self->_termsIdentifier;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke_2;
    v31[3] = &unk_1E3E70DE0;
    objc_copyWeak(&v33, &location);
    v31[4] = self;
    v32 = v6;
    objc_msgSend(v29, "termsAccepted:termsIdentifier:secondaryIdentifier:actionIdentifier:completion:", v4, termsIdentifier, 0, 0, v31);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    v15 = [PKApplyTermsVerifyingViewController alloc];
    v16 = objc_loadWeakRetained((id *)&self->_applyController);
    -[PKFeatureTermsAndConditionsViewController setupDelegate](self, "setupDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PKFeatureTermsAndConditionsViewController context](self, "context");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", self->_termsIdentifier, 0);
    v20 = -[PKApplyTermsVerifyingViewController initWithController:setupDelegate:context:termsIdentifiers:applyPage:](v15, "initWithController:setupDelegate:context:termsIdentifiers:applyPage:", v16, v17, v18, v19, 0);

    -[PKFeatureTermsAndConditionsViewController containerNavigationController](self, "containerNavigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyTermsAndConditionsViewController presentingViewController](self, "presentingViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v18) = objc_opt_isKindOfClass();

    if ((v18 & 1) != 0)
    {
      -[PKApplyTermsAndConditionsViewController presentingViewController](self, "presentingViewController");
      v23 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v23;
    }
    if (v21)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke;
      v35[3] = &unk_1E3E61338;
      v35[4] = self;
      v36 = v6;
      objc_msgSend(v21, "pk_presentPaymentSetupViewController:animated:completion:", v20, 0, v35);

    }
    else if (v6)
    {
      v6[2](v6);
    }

  }
}

uint64_t __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerWithCompletion:", 0);
}

void __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  char isKindOfClass;
  uint64_t v11;
  void (**v12)(void);
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void (**v25)(void);
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(a1[4], "containerNavigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(a1[4], "presentingViewController");
        v11 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v11;
      }
      if (v8)
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke_3;
        v29[3] = &unk_1E3E61338;
        v31 = a1[5];
        v30 = WeakRetained;
        objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 0, v29);

      }
      else
      {
        v25 = (void (**)(void))a1[5];
        if (v25)
          v25[2]();
      }

    }
    else
    {
      v12 = (void (**)(void))a1[5];
      if (v6)
      {
        if (v12)
          v12[2]();
        PKTitleForDisplayableError();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x1A1AE46BC](v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v26, v13, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_loadWeakRetained((id *)a1[4] + 186);
        objc_msgSend(v15, "featureIdentifier");

        v16 = objc_loadWeakRetained((id *)a1[4] + 186);
        objc_msgSend(v16, "preferredLanguage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedApplyFeatureString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAction:", v20);

        v21 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedApplyFeatureString();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke_4;
        v27[3] = &unk_1E3E61D68;
        v23 = WeakRetained;
        v28 = v23;
        objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 1, v27);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAction:", v24);

        objc_msgSend(v23, "presentViewController:animated:completion:", v14, 1, 0);
      }
      else
      {
        if (v12)
          v12[2]();
        objc_msgSend(WeakRetained, "_terminateSetupFlow");
      }
    }
  }

}

uint64_t __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  result = objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerWithCompletion:", 0);
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_terminateSetupFlow");
  return result;
}

uint64_t __68__PKApplyTermsAndConditionsViewController_termsAccepted_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateSetupFlow");
}

- (void)presentErrorAlert
{
  PKApplyController **p_applyController;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  p_applyController = &self->_applyController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_applyController);
  objc_msgSend(WeakRetained, "featureIdentifier");

  v5 = objc_loadWeakRetained((id *)p_applyController);
  objc_msgSend(v5, "preferredLanguage");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  PKLocalizedApplyFeatureString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedApplyFeatureString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedApplyFeatureString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v11);

  -[PKApplyTermsAndConditionsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)_terminateSetupFlow
{
  NSObject *v3;
  void *v4;
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

  -[PKFeatureTermsAndConditionsViewController setupDelegate](self, "setupDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKApplyTermsAndConditionsViewController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (BOOL)preflightPDFTerms
{
  return self->_preflightPDFTerms;
}

- (void)setPreflightPDFTerms:(BOOL)a3
{
  self->_preflightPDFTerms = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_destroyWeak((id *)&self->_applyController);
}

@end
