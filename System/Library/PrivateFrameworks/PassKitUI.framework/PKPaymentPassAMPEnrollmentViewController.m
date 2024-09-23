@implementation PKPaymentPassAMPEnrollmentViewController

+ (void)shouldOfferAMPEnrollmentForPass:(id)a3 provisioningController:(id)a4 withCompletion:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD aBlock[4];
  id v19;

  v6 = a3;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0D66800], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "shouldOfferAMPEnrollmentForPaymentPass:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __114__PKPaymentPassAMPEnrollmentViewController_shouldOfferAMPEnrollmentForPass_provisioningController_withCompletion___block_invoke;
    aBlock[3] = &unk_1E3E653D8;
    v19 = v7;
    v12 = _Block_copy(aBlock);
    objc_msgSend(v6, "paymentPass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __114__PKPaymentPassAMPEnrollmentViewController_shouldOfferAMPEnrollmentForPass_provisioningController_withCompletion___block_invoke_8;
    v15[3] = &unk_1E3E64398;
    v16 = v6;
    v17 = v12;
    v14 = v12;
    objc_msgSend(v8, "enrollmentStatusForPaymentPass:completion:progress:", v13, v15, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __114__PKPaymentPassAMPEnrollmentViewController_shouldOfferAMPEnrollmentForPass_provisioningController_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
    a2 = 0;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "AMP offer should be presented:%d (%@)", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __114__PKPaymentPassAMPEnrollmentViewController_shouldOfferAMPEnrollmentForPass_provisioningController_withCompletion___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "secureElementPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "devicePrimaryBarcodePaymentApplication");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v11, "paymentNetworkIdentifier");
  v10 = a2 == 1 && v8 == 123;
  (*(void (**)(_QWORD, _BOOL8, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10, v6);

}

- (PKPaymentPassAMPEnrollmentViewController)initWithProvisioningController:(id)a3 paymentPass:(id)a4 context:(int64_t)a5
{
  id v9;
  id v10;
  PKPaymentPassAMPEnrollmentViewController *v11;
  PKPaymentPassAMPEnrollmentViewController *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentPassAMPEnrollmentViewController;
  v11 = -[PKExplanationViewController initWithContext:](&v14, sel_initWithContext_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_provisioningController, a3);
    objc_storeStrong((id *)&v12->_pass, a4);
  }

  return v12;
}

- (void)loadView
{
  void *v3;
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
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentPassAMPEnrollmentViewController;
  -[PKExplanationViewController loadView](&v28, sel_loadView);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSecureElementPass organizationName](self->_pass, "organizationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PAYMENT_AMP_ENROLLMENT_TITLE_FMT"), CFSTR("%@"), v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setTitleText:", v27);
  objc_msgSend(v4, "primaryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PAYMENT_AMP_ENROLLMENT_CONFIRM_BUTTON"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

  objc_msgSend(v3, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v25, "setManualEntryButton:", 0);
  -[PKSecureElementPass organizationName](self->_pass, "organizationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PAYMENT_AMP_ENROLLMENT_BODY_FMT"), CFSTR("%@"), v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setBodyText:", v26);
  objc_msgSend(v4, "buttonExplanationTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSecureElementPass organizationName](self->_pass, "organizationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PAYMENT_AMP_ENROLLMENT_TNC_FMT"), CFSTR("%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "setLineBreakMode:", 0);
  objc_msgSend(v13, "setAlignment:", 1);
  v31[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(v9, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0DC1178];
  v32[0] = v14;
  v32[1] = v13;
  v16 = *MEMORY[0x1E0DC1140];
  v31[1] = v15;
  v31[2] = v16;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  PKAttributedStringByParsingLinksInString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedText:", v19);
  objc_msgSend(v9, "setDataDetectorTypes:", 2);
  objc_msgSend(v9, "setDelegate:", self);
  v29 = v16;
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLinkTextAttributes:", v21);

  objc_msgSend(v25, "setupLaterButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PAYMENT_AMP_ENROLLMENT_SETUP_LATER_BUTTON"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTitle:forState:", v23, 0);

  objc_msgSend(v3, "setImage:", 0);
  -[PKPaymentPassAMPEnrollmentViewController _updateBodyImage](self, "_updateBodyImage");
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "showCheckmark:animated:", 0, 0);
  objc_msgSend(v3, "setNeedsLayout");
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKPaymentPassAMPEnrollmentViewController navigationItem](self, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidesBackButton:animated:", 1, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPassAMPEnrollmentViewController;
  -[PKPaymentPassAMPEnrollmentViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PKExplanationViewController explanationView](self, "explanationView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonsEnabled:", 0);

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  -[PKSecureElementPass paymentPass](self->_pass, "paymentPass");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassAMPEnrollmentViewController _performAMPEnrollmentWithPass:asDefault:completion:](self, "_performAMPEnrollmentWithPass:asDefault:completion:", v6, 0, 0);

}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  void *v4;
  void *v5;
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[PKExplanationViewController explanationView](self, "explanationView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonsEnabled:", 0);

  reporter = self->_reporter;
  v8 = *MEMORY[0x1E0D69418];
  v9[0] = *MEMORY[0x1E0D69410];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:context:](reporter, "reportButtonPressed:context:", 3, v7);

  -[PKPaymentPassAMPEnrollmentViewController proceedToNextScreen](self, "proceedToNextScreen");
}

- (void)proceedToNextScreen
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  objc_msgSend(WeakRetained, "ampEnrollmentViewControllerDidFinish:", self);

}

- (void)_performTerms
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__PKPaymentPassAMPEnrollmentViewController__performTerms__block_invoke;
  v2[3] = &unk_1E3E612E8;
  v2[4] = self;
  -[PKPaymentPassAMPEnrollmentViewController _displayTermsWithCompletion:](self, "_displayTermsWithCompletion:", v2);
}

uint64_t __57__PKPaymentPassAMPEnrollmentViewController__performTerms__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showSpinner:", 0);
}

- (void)_displayTermsWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  RemoteUIController *v9;
  RemoteUIController *termsController;
  id v11;
  PKExplanationView *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  RemoteUIController *v28;
  PKExplanationView *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void (**v34)(_QWORD);
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  PKExplanationView *v39;
  PKPaymentPassAMPEnrollmentViewController *v40;
  id v41;
  id v42;
  id v43;
  _QWORD aBlock[4];
  void (**v45)(_QWORD);
  id v46;
  id location;
  id v48[2];

  v4 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", *MEMORY[0x1E0D677C8], *MEMORY[0x1E0D677D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForKey:", CFSTR("alipay-terms-url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = 0;
  objc_msgSend(v6, "valueWithError:", v48);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v48[0];

  if (v7)
  {
    v9 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E0D872F0]);
    termsController = self->_termsController;
    self->_termsController = v9;

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke;
    aBlock[3] = &unk_1E3E61C80;
    objc_copyWeak(&v46, &location);
    v45 = v4;
    v36 = _Block_copy(aBlock);
    v11 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
    v35 = v8;
    v12 = -[PKExplanationView initWithContext:delegate:]([PKExplanationView alloc], "initWithContext:delegate:", -[PKExplanationViewController context](self, "context"), self);
    -[PKExplanationView dockView](v12, "dockView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPrimaryButton:", 0);

    PKProvisioningBackgroundColor();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationView setBackgroundColor:](v12, "setBackgroundColor:", v14);

    PKLocalizedAquamanString(CFSTR("TERMS_AND_CONDITIONS_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationView setTitleText:](v12, "setTitleText:", v15);

    -[PKExplanationView setTitleTextNumberOfLines:](v12, "setTitleTextNumberOfLines:", 1);
    objc_msgSend(v11, "setView:", v12);
    objc_msgSend(v11, "setModalInPresentation:", 1);
    v16 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedAquamanString(CFSTR("DONE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithTitle:style:target:action:", v17, 2, self, sel__done);

    objc_msgSend(v11, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRightBarButtonItem:", v18);

    objc_msgSend(v11, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidesBackButton:", 1);
    v32 = (void *)v18;
    v33 = v5;
    v34 = v4;

    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v22, "setLineBreakMode:", 0);
    objc_msgSend(v22, "setAlignment:", 1);
    v23 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v23, "configureWithOpaqueBackground");
    objc_msgSend(v11, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setStandardAppearance:", v23);

    -[RemoteUIController loader](self->_termsController, "loader");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAllowNonSecureHTTP:", objc_msgSend(v27, "devSigned"));

    v28 = self->_termsController;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke_2;
    v37[3] = &unk_1E3E70298;
    objc_copyWeak(&v43, &location);
    v38 = v7;
    v29 = v12;
    v39 = v29;
    v40 = self;
    v30 = v11;
    v41 = v30;
    v31 = v36;
    v42 = v31;
    -[RemoteUIController loadURL:postBody:completion:](v28, "loadURL:postBody:completion:", v38, 0, v37);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
    v5 = v33;
    v4 = v34;
    v8 = v35;
  }
  else
  {
    v4[2](v4);
  }

}

void __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 131);
    *((_QWORD *)WeakRetained + 131) = 0;
    v6 = WeakRetained;

    v3 = v6;
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
      v3 = v6;
    }
  }

}

void __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  char v14;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E6A088;
  objc_copyWeak(&v13, (id *)(a1 + 72));
  v14 = a2;
  v8 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
}

void __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", *(_QWORD *)(a1 + 32), 4, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v3, "dataUsingEncoding:", 10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x1E0DC1118];
      v17[0] = *MEMORY[0x1E0DC1148];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v4, "initWithData:options:documentAttributes:error:", v5, v6, 0, 0);

      objc_msgSend(*(id *)(a1 + 40), "setAttributedBodyText:", v7);
      objc_msgSend(*(id *)(a1 + 40), "setBodyTextAlignment:", 0);
      objc_msgSend(*(id *)(a1 + 48), "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke_4;
      v12[3] = &unk_1E3E614F0;
      v9 = *(_QWORD *)(a1 + 56);
      v13 = *(id *)(a1 + 64);
      objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v9, 1, v12);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v15 = v11;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Error loading terms UI at %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
  }

}

uint64_t __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_done
{
  id v3;

  -[PKPaymentPassAMPEnrollmentViewController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pk_popToViewController:animated:", self, 1);

}

- (CGSize)_snapshotSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 220.0;
  v3 = 134.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_createBodyImage:(id)a3
{
  id v3;
  unint64_t v4;
  CGFloat v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double x;
  double width;
  double y;
  double height;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGSize v24;
  CGRect v25;
  CGRect v26;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = (double)(v4 - 1) * 25.0 + (double)v4 * 48.0;
    v6 = PKUIScreenScale();
    v24.width = v5;
    v24.height = 48.0;
    UIGraphicsBeginImageContextWithOptions(v24, 0, v6);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      x = 0.0;
      width = 48.0;
      y = 0.0;
      height = 48.0;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "drawInRect:", x, y, width, height, (_QWORD)v18);
          v25.origin.x = x;
          v25.origin.y = y;
          v25.size.width = width;
          v25.size.height = height;
          v26 = CGRectOffset(v25, 73.0, 0.0);
          x = v26.origin.x;
          y = v26.origin.y;
          width = v26.size.width;
          height = v26.size.height;
          ++v15;
        }
        while (v9 != v15);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    UIGraphicsGetImageFromCurrentImageContext();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_updateBodyImage
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PKPaymentPassAMPEnrollmentViewController__updateBodyImage__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __60__PKPaymentPassAMPEnrollmentViewController__updateBodyImage__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  v4 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", *MEMORY[0x1E0D6A5C0], 1, 0);
  PKUIGetAppIconForApplicationRecord(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v5);

  v6 = objc_alloc(MEMORY[0x1E0CA5870]);
  v7 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:allowPlaceholder:error:", *MEMORY[0x1E0D69960], 1, 0);
  PKUIGetAppIconForApplicationRecord(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v8);

  PKUIImageNamed(CFSTR("iCloud"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v9);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__PKPaymentPassAMPEnrollmentViewController__updateBodyImage__block_invoke_2;
  v11[3] = &unk_1E3E61388;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v2;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __60__PKPaymentPassAMPEnrollmentViewController__updateBodyImage__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "explanationView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_createBodyImage:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyImage:", v2);

}

- (void)_performAMPEnrollmentWithPass:(id)a3 asDefault:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  _QWORD aBlock[5];
  id v26;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D66800], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AMPEnrollmentDismissedKeyForPass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKPaymentPassAMPEnrollmentViewController__performAMPEnrollmentWithPass_asDefault_completion___block_invoke;
  aBlock[3] = &unk_1E3E64E38;
  aBlock[4] = self;
  v26 = v11;
  v13 = v11;
  v14 = _Block_copy(aBlock);
  -[PKExplanationViewController showSpinner:](self, "showSpinner:", 1);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __95__PKPaymentPassAMPEnrollmentViewController__performAMPEnrollmentWithPass_asDefault_completion___block_invoke_2;
  v19[3] = &unk_1E3E702C0;
  v20 = v10;
  v21 = v8;
  v24 = a4;
  v22 = v14;
  v23 = v9;
  v15 = v9;
  v16 = v14;
  v17 = v8;
  v18 = v10;
  objc_msgSend(v18, "enrollmentStatusForPaymentPass:completion:progress:", v17, v19, v16);

}

void __95__PKPaymentPassAMPEnrollmentViewController__performAMPEnrollmentWithPass_asDefault_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v9 = a2;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "AMP enrollment completed:%d (%@)", buf, 0x12u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "reportPageCompleted:context:", a2, 0);
  PKSharedCacheSetBoolForKey();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__PKPaymentPassAMPEnrollmentViewController__performAMPEnrollmentWithPass_asDefault_completion___block_invoke_51;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __95__PKPaymentPassAMPEnrollmentViewController__performAMPEnrollmentWithPass_asDefault_completion___block_invoke_51(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "showSpinner:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "proceedToNextScreen");
}

void __95__PKPaymentPassAMPEnrollmentViewController__performAMPEnrollmentWithPass_asDefault_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;
  id v8;

  v8 = a3;
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "enrollPaymentPass:isDefault:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
      v5 = *(_QWORD *)(a1 + 56);
      if (v5)
      {
        v6 = *(void (**)(void))(v5 + 16);
LABEL_8:
        v6();
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
  {
    v6 = *(void (**)(void))(v7 + 16);
    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v7;

  objc_msgSend(a4, "absoluteString", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("OPEN_TERMS_AND_CONDITIONS")))
  {
    -[PKExplanationViewController showSpinner:](self, "showSpinner:", 1);
    -[PKPaymentPassAMPEnrollmentViewController _performTerms](self, "_performTerms");
  }

  return 0;
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v6;

  if (self->_termsController == a3)
  {
    v6 = a4;
    PKPaymentSetupApplyContextAppearance(-[PKExplanationViewController context](self, "context"), v6);

  }
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a3;
  -[PKPaymentPassAMPEnrollmentViewController view](self, "view", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4 ^ 1);

  -[PKExplanationViewController showSpinner:](self, "showSpinner:", v4);
}

- (PKPaymentPassAMPEnrollmentViewControllerFlowDelegate)flowItemDelegate
{
  return (PKPaymentPassAMPEnrollmentViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowItemDelegate);
}

- (void)setFlowItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowItemDelegate, a3);
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
