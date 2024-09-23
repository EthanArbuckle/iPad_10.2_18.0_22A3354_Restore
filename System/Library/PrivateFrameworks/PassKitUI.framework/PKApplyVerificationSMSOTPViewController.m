@implementation PKApplyVerificationSMSOTPViewController

- (PKApplyVerificationSMSOTPViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 verificationPage:(id)a6
{
  id v11;
  PKApplyVerificationSMSOTPViewController *v12;
  PKApplyVerificationSMSOTPViewController *v13;
  id v14;
  void *v15;
  uint64_t v16;
  UIBarButtonItem *nextButton;
  void *v18;
  objc_super v20;

  v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKApplyVerificationSMSOTPViewController;
  v12 = -[PKApplyExplanationViewController initWithController:setupDelegate:context:applyPage:](&v20, sel_initWithController_setupDelegate_context_applyPage_, a3, a4, a5, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_verificationPage, a6);
    -[PKExplanationViewController setShowCancelButton:](v13, "setShowCancelButton:", 1);
    v14 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithTitle:style:target:action:", v15, 0, v13, sel__nextButtonPressed);
    nextButton = v13->_nextButton;
    v13->_nextButton = (UIBarButtonItem *)v16;

    -[PKApplyVerificationSMSOTPViewController navigationItem](v13, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRightBarButtonItem:", v13->_nextButton);

  }
  return v13;
}

- (void)showNavigationBarSpinner:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKApplyVerificationSMSOTPViewController;
  -[PKApplyExplanationViewController showNavigationBarSpinner:](&v5, sel_showNavigationBarSpinner_);
  self->_showingSpinner = v3;
  -[PKOneTimeCodeView setDisableEntry:](self->_otpView, "setDisableEntry:", v3);
}

- (id)analyticsPageTag
{
  return (id)*MEMORY[0x1E0D68678];
}

- (void)viewDidLoad
{
  void *v3;
  PKOneTimeCodeView *v4;
  PKOneTimeCodeView *otpView;
  PKOneTimeCodeView *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKApplyVerificationSMSOTPViewController;
  -[PKApplyExplanationViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKOneTimeCodeView initWithCodeLength:delegate:]([PKOneTimeCodeView alloc], "initWithCodeLength:delegate:", -[PKApplyVerificationPage verificationCodeLength](self->_verificationPage, "verificationCodeLength"), self);
  otpView = self->_otpView;
  self->_otpView = v4;

  v6 = self->_otpView;
  -[PKApplyVerificationSMSOTPViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOneTimeCodeView setBackgroundColor:](v6, "setBackgroundColor:", v8);

  objc_msgSend(v3, "setBodyView:", self->_otpView);
  objc_msgSend(v3, "setReverseBodyViewAndBodyButtonOrder:", 1);
  -[PKApplyVerificationSMSOTPViewController _updateViewWithEntryError:source:](self, "_updateViewWithEntryError:source:", 0, 0);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__PKApplyVerificationSMSOTPViewController_viewDidLoad__block_invoke;
  v12[3] = &unk_1E3E63AE8;
  objc_copyWeak(&v13, &location);
  -[PKApplyExplanationViewController setLearnMoreAction:](self, "setLearnMoreAction:", v12);
  v10[0] = v9;
  v10[1] = 3221225472;
  v10[2] = __54__PKApplyVerificationSMSOTPViewController_viewDidLoad__block_invoke_2;
  v10[3] = &unk_1E3E61310;
  objc_copyWeak(&v11, &location);
  -[PKDynamicProvisioningPageViewController setCancelButtonAction:](self, "setCancelButtonAction:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

uint64_t __54__PKApplyVerificationSMSOTPViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[1201])
  {
    if (WeakRetained[1200])
      objc_msgSend(WeakRetained, "_submitCode:skippedVerification:", 0, 1);
    else
      objc_msgSend(WeakRetained, "_requestNewCode");
  }

  return 0;
}

void __54__PKApplyVerificationSMSOTPViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancelApplication");
    WeakRetained = v2;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKApplyVerificationSMSOTPViewController;
  -[PKApplyExplanationViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKApplyVerificationSMSOTPViewController _updateViewWithEntryError:source:](self, "_updateViewWithEntryError:source:", 0, 0);
  -[PKOneTimeCodeView becomeFirstResponder](self->_otpView, "becomeFirstResponder");
}

- (void)oneTimeCodeView:(id)a3 didEnterCode:(id)a4
{
  if (self->_otpView == a3)
    -[PKApplyVerificationSMSOTPViewController _updateViewWithEntryError:source:](self, "_updateViewWithEntryError:source:", 0, 1);
}

- (void)_nextButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyVerificationSMSOTPViewController analyticsPageTag](self, "analyticsPageTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D68858];
  v9[0] = *MEMORY[0x1E0D68E58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v4, v5, v6);

  -[PKOneTimeCodeView currentCode](self->_otpView, "currentCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyVerificationSMSOTPViewController _submitCode:skippedVerification:](self, "_submitCode:skippedVerification:", v7, 0);

}

- (void)_requestNewCode
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKApplyVerificationPage *verificationPage;
  _QWORD v9[4];
  id v10;
  id location;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PKApplyVerificationSMSOTPViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PKApplyExplanationViewController controller](self, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Requesting new otp code for application %@", buf, 0xCu);

  }
  -[PKApplyExplanationViewController controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  verificationPage = self->_verificationPage;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PKApplyVerificationSMSOTPViewController__requestNewCode__block_invoke;
  v9[3] = &unk_1E3E65F18;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "resendVerificationForPage:completion:", verificationPage, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __58__PKApplyVerificationSMSOTPViewController__requestNewCode__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PKApplyVerificationSMSOTPViewController__requestNewCode__block_invoke_2;
  v6[3] = &unk_1E3E61B68;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v8);
}

void __58__PKApplyVerificationSMSOTPViewController__requestNewCode__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 0);
    v4 = objc_msgSend(v11, "_smsOTPViewEntryErrorFromError:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v11, "_updateViewWithEntryError:source:", v4, 0);
    if (!*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v11[147], "clearCurrentCode");
LABEL_8:
      v3 = v11;
      goto LABEL_9;
    }
    objc_msgSend(v11, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "currentPage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "analyticsPageTag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportAnalyticsError:page:pageTag:additionalValues:", v6, v7, v8, 0);

    v9 = objc_msgSend(v11, "_shouldDisplayErrorForEntryError:", v4);
    v3 = v11;
    if (v9)
    {
      v10 = PKAlertForDisplayableErrorWithHandlers(*(void **)(a1 + 32), 0, 0, 0);
      if (v10)
        objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)_submitCode:(id)a3 skippedVerification:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  id v13;
  void *v14;
  PKApplyVerificationPage *verificationPage;
  _QWORD v16[4];
  id v17;
  id location;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_initWeak(&location, self);
  -[PKApplyVerificationSMSOTPViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  -[PKApplyExplanationViewController controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "featureApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      v12 = "User skipped sms otp for application %@";
LABEL_6:
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    }
  }
  else if (v11)
  {
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    v12 = "Submitting otp code for application %@";
    goto LABEL_6;
  }

  v13 = objc_alloc_init(MEMORY[0x1E0D66B18]);
  objc_msgSend(v13, "setData:", v6);
  objc_msgSend(v13, "setSkippedVerification:", v4);
  -[PKApplyExplanationViewController controller](self, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  verificationPage = self->_verificationPage;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke;
  v16[3] = &unk_1E3E62598;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v14, "submitVerificationPage:verificationInfo:completion:", verificationPage, v13, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke_3;
    aBlock[3] = &unk_1E3E62288;
    aBlock[4] = WeakRetained;
    v5 = _Block_copy(aBlock);
    v6 = objc_msgSend(v3, "_smsOTPViewEntryErrorFromError:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_updateViewWithEntryError:source:", v6, 0);
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v3, "controller");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "currentPage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "analyticsPageTag");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reportAnalyticsError:page:pageTag:additionalValues:", v8, v9, v10, 0);

      if (objc_msgSend(v3, "_shouldDisplayErrorForEntryError:", v6))
      {
        v11 = PKAlertForDisplayableErrorWithHandlers(*(void **)(a1 + 32), 0, 0, 0);
        if (v11)
        {
          v14[0] = v4;
          v14[1] = 3221225472;
          v14[2] = __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke_4;
          v14[3] = &unk_1E3E61590;
          v15 = v5;
          objc_msgSend(v3, "presentViewController:animated:completion:", v11, 1, v14);

        }
        else
        {
          (*((void (**)(void *, uint64_t))v5 + 2))(v5, 1);
        }

      }
      else
      {
        (*((void (**)(void *, uint64_t))v5 + 2))(v5, 1);
      }
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3[147], "resignFirstResponder");
      if (v12)
      {
        objc_msgSend(v3, "navigationController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pk_presentPaymentSetupViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, v5);

      }
      else
      {
        (*((void (**)(void *, _QWORD))v5 + 2))(v5, 0);
      }
    }

  }
}

uint64_t __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t result;
  void *v5;

  result = objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endApplyFlow");

    return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
  }
  return result;
}

uint64_t __75__PKApplyVerificationSMSOTPViewController__submitCode_skippedVerification___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)_smsOTPViewEntryErrorFromError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  unint64_t v15;
  uint64_t v16;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

    if (v6)
    {
      objc_msgSend(v4, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }
    objc_msgSend(v4, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0D6B0B8];
    v11 = v9;
    v12 = v10;
    if (v11 == v12)
    {

    }
    else
    {
      v13 = v12;
      if (!v11 || !v12)
      {

        goto LABEL_16;
      }
      v14 = objc_msgSend(v11, "isEqualToString:", v12);

      if (!v14)
        goto LABEL_16;
    }
    v16 = objc_msgSend(v4, "code");
    if (v16 > 40455)
    {
      if (v16 == 40456)
      {
        v15 = 2;
        goto LABEL_17;
      }
      if (v16 == 40457)
      {
        v15 = 3;
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    if (v16 == 40423)
    {
      v15 = 5;
      goto LABEL_17;
    }
    if (v16 == 40454)
    {
      v15 = 4;
      goto LABEL_17;
    }
LABEL_16:
    v15 = 1;
    goto LABEL_17;
  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (void)_cancelApplication
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKApplyVerificationSMSOTPViewController__cancelApplication__block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PKApplyExplanationViewController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAlertWithContinueAction:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKApplyVerificationSMSOTPViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

  }
  else
  {
    v3[2](v3);
  }

}

uint64_t __61__PKApplyVerificationSMSOTPViewController__cancelApplication__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "analyticsPageTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D68858];
  v9[0] = *MEMORY[0x1E0D68AA0];
  v9[1] = v5;
  v6 = *MEMORY[0x1E0D688C0];
  v10[0] = *MEMORY[0x1E0D68B18];
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v3, v4, v7);

  return objc_msgSend(*(id *)(a1 + 32), "_withdrawApplication");
}

- (void)_withdrawApplication
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[PKApplyVerificationSMSOTPViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PKApplyVerificationSMSOTPViewController__withdrawApplication__block_invoke;
  v4[3] = &unk_1E3E62598;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "withdrawApplicationWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__PKApplyVerificationSMSOTPViewController__withdrawApplication__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __63__PKApplyVerificationSMSOTPViewController__withdrawApplication__block_invoke_2;
      v12[3] = &unk_1E3E62288;
      v12[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v12);
    }
    else
    {
      objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 0);
      if (!v6)
      {
        objc_msgSend(v8, "controller");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "endApplyFlow");

        objc_msgSend(v8, "_terminateFlow");
        goto LABEL_7;
      }
      v9 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
      objc_msgSend(v8, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1, 0);

    }
  }
LABEL_7:

}

uint64_t __63__PKApplyVerificationSMSOTPViewController__withdrawApplication__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
  return result;
}

- (void)_terminateFlow
{
  void *v3;
  void *v4;
  id v5;

  -[PKApplyExplanationViewController setupDelegate](self, "setupDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKApplyVerificationSMSOTPViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_updateViewWithEntryError:(unint64_t)a3 source:(unint64_t)a4
{
  int v7;
  double v8;
  _BOOL8 v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  -[PKExplanationViewController explanationView](self, "explanationView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
    a3 = -[PKOneTimeCodeView entryError](self->_otpView, "entryError");
  v7 = 0;
  v8 = 36.0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  switch(a3)
  {
    case 0uLL:
      -[PKOneTimeCodeView currentCode](self->_otpView, "currentCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");
      v16 = -[PKApplyVerificationPage verificationCodeLength](self->_verificationPage, "verificationCodeLength");

      v10 = 0;
      v9 = v15 == v16;
      v11 = v15 == v16 && a4 == 1;
      v7 = !v11;
      v8 = 24.0;
      goto LABEL_13;
    case 1uLL:
      goto LABEL_13;
    case 2uLL:
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v7 = 1;
      goto LABEL_11;
    case 3uLL:
      v7 = 0;
      v9 = 0;
      v11 = 0;
      v10 = 1;
LABEL_11:
      v8 = 36.0;
      goto LABEL_13;
    case 4uLL:
    case 5uLL:
      PKLocalizedPaymentString(CFSTR("CONTINUE_WITH_PHOTO_ID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setBodyButtonText:", v12);

      v9 = 0;
      v11 = 0;
      v13 = 1;
      v8 = 36.0;
      v10 = 1;
      goto LABEL_16;
    default:
      v9 = 0;
      v10 = 0;
      v11 = 0;
LABEL_13:
      PKLocalizedPaymentString(CFSTR("SEND_NEW_CODE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setBodyButtonText:", v17);

      if (v7)
      {
        -[PKOneTimeCodeView becomeFirstResponder](self->_otpView, "becomeFirstResponder");
        v13 = 0;
      }
      else
      {
        v13 = 0;
LABEL_16:
        -[PKOneTimeCodeView resignFirstResponder](self->_otpView, "resignFirstResponder");
      }
      self->_isBodyButtonSkipToDocUpload = v13;
      objc_msgSend(v18, "setBodyViewPadding:", v8);
      -[PKOneTimeCodeView setDisableEntry:](self->_otpView, "setDisableEntry:", v10);
      -[UIBarButtonItem setEnabled:](self->_nextButton, "setEnabled:", v9);
      -[PKOneTimeCodeView setEntryError:](self->_otpView, "setEntryError:", a3);
      objc_msgSend(v18, "setNeedsLayout");
      if (v11)
        -[PKApplyVerificationSMSOTPViewController _nextButtonPressed](self, "_nextButtonPressed");

      return;
  }
}

- (BOOL)_shouldDisplayErrorForEntryError:(unint64_t)a3
{
  return a3 == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_activityButton, 0);
  objc_storeStrong((id *)&self->_otpView, 0);
  objc_storeStrong((id *)&self->_verificationPage, 0);
}

@end
