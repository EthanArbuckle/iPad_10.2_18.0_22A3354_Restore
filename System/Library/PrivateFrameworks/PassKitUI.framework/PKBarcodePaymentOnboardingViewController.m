@implementation PKBarcodePaymentOnboardingViewController

- (PKBarcodePaymentOnboardingViewController)initWithIssuerName:(id)a3 context:(int64_t)a4
{
  id v7;
  PKBarcodePaymentOnboardingViewController *v8;
  PKBarcodePaymentOnboardingViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBarcodePaymentOnboardingViewController;
  v8 = -[PKExplanationViewController initWithContext:](&v11, sel_initWithContext_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_issuerName, a3);
    -[PKExplanationViewController setExplanationViewControllerDelegate:](v9, "setExplanationViewControllerDelegate:", v9);
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKWatchDeviceImageOverlayView *v7;
  PKWatchDeviceImageOverlayView *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  PKEducationPhone *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)PKBarcodePaymentOnboardingViewController;
  -[PKExplanationViewController viewDidLoad](&v32, sel_viewDidLoad);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKExplanationViewController context](self, "context");
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", PKPaymentSetupContextIsIssuerApp());
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedAquamanString(CFSTR("BARCODE_PAYMENT_INTRO_TITLE"), CFSTR("%@"), self->_issuerName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v5);

  -[PKExplanationViewController context](self, "context");
  if (PKPaymentSetupContextIsBridge())
  {
    PKLocalizedAquamanString(CFSTR("BARCODE_PAYMENT_INTRO_BODY_WATCH"), CFSTR("%@"), self->_issuerName);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [PKWatchDeviceImageOverlayView alloc];
    v8 = -[PKWatchDeviceImageOverlayView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PKBarcodePaymentOnboardingViewController _imageForWatchView](self, "_imageForWatchView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWatchDeviceImageOverlayView setOverlayImage:](v8, "setOverlayImage:", v9);

    objc_msgSend(v3, "setBodyView:", v8);
    v10 = 1048;
  }
  else
  {
    if (PKPearlIsAvailable())
      v11 = CFSTR("BARCODE_PAYMENT_INTRO_BODY_FACEID");
    else
      v11 = CFSTR("BARCODE_PAYMENT_INTRO_BODY_TOUCHID");
    PKLocalizedAquamanString(&v11->isa, CFSTR("%@"), self->_issuerName);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [PKEducationPhone alloc];
    v8 = -[PKEducationPhone initWithFrame:displayOptions:](v12, "initWithFrame:displayOptions:", 3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    PKUIImageNamed(CFSTR("BarcodePaymentEducation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWatchDeviceImageOverlayView setPassImage:](v8, "setPassImage:", v13);

    objc_msgSend(v3, "setBodyView:", v8);
    v10 = 1040;
  }
  v14 = *(Class *)((char *)&self->super.super.super.super.isa + v10);
  *(Class *)((char *)&self->super.super.super.super.isa + v10) = (Class)v8;

  objc_msgSend(v3, "setBodyText:", v6);
  v15 = PKUIGetMinScreenType() - 4;
  v16 = 0.0;
  if (v15 <= 0xD)
    v16 = dbl_19DF14A88[v15];
  objc_msgSend(v3, "setBodyViewPadding:", v16);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v4, "buttonExplanationTextView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedAquamanString(CFSTR("BARCODE_PAYMENT_INTRO_PRIVACY_TEXT"), CFSTR("%@%@"), self->_issuerName, self->_issuerName);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v19, "setLineBreakMode:", 0);
  objc_msgSend(v19, "setAlignment:", 1);
  v33[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(v17, "font");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0DC1178];
  v34[0] = v20;
  v34[1] = v19;
  v22 = *MEMORY[0x1E0DC1140];
  v33[1] = v21;
  v33[2] = v22;
  objc_msgSend(v17, "textColor");
  v31 = v4;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  PKAttributedStringByParsingLinksInString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAttributedText:", v25);
  objc_msgSend(v17, "setDelegate:", self);
  objc_msgSend(v17, "setDataDetectorTypes:", 2);
  -[PKExplanationViewController context](self, "context");
  if ((PKPaymentSetupContextIsIssuerApp() & 1) == 0)
  {
    objc_msgSend(v31, "primaryButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedAquamanString(CFSTR("BARCODE_PAYMENT_INTRO_BUTTON_TITLE"), CFSTR("%@"), self->_issuerName);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTitle:forState:", v27, 0);

  }
  objc_msgSend(v30, "setManualEntryButton:", 0);
  -[PKBarcodePaymentOnboardingViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v29);

  PKPaymentSetupApplyContextAppearance(-[PKExplanationViewController context](self, "context"), v28);
}

- (void)viewDidAppear:(BOOL)a3
{
  dispatch_time_t v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKBarcodePaymentOnboardingViewController;
  -[PKBarcodePaymentOnboardingViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
  if (self->_educationPhone)
  {
    v4 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PKBarcodePaymentOnboardingViewController_viewDidAppear___block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __58__PKBarcodePaymentOnboardingViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "startAnimation");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v7;
  int v8;
  PKBarcodePaymentPrivacyViewController *v9;
  PKPortraitNavigationController *v10;

  objc_msgSend(a4, "absoluteString", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("OPEN_BARCODE_PAYMENT_PRIVACY_TEXT"));

  if (v8)
  {
    v9 = -[PKBarcodePaymentPrivacyViewController initWithIssuerName:displayContext:paymentSetupContext:]([PKBarcodePaymentPrivacyViewController alloc], "initWithIssuerName:displayContext:paymentSetupContext:", self->_issuerName, 0, -[PKExplanationViewController context](self, "context"));
    v10 = -[PKPortraitNavigationController initWithRootViewController:]([PKPortraitNavigationController alloc], "initWithRootViewController:", v9);
    -[PKBarcodePaymentOnboardingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

  }
  return 0;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**continueHandler)(id, _QWORD *);
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  if (self->_continueHandler)
  {
    -[PKExplanationViewController explanationView](self, "explanationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dockView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setButtonsEnabled:", 0);

    objc_initWeak(&location, self);
    continueHandler = (void (**)(id, _QWORD *))self->_continueHandler;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__PKBarcodePaymentOnboardingViewController_explanationViewDidSelectContinue___block_invoke;
    v8[3] = &unk_1E3E61310;
    objc_copyWeak(&v9, &location);
    continueHandler[2](continueHandler, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKBarcodePaymentOnboardingViewController _terminateSetupFlow](self, "_terminateSetupFlow");
  }

}

void __77__PKBarcodePaymentOnboardingViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PKBarcodePaymentOnboardingViewController_explanationViewDidSelectContinue___block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __77__PKBarcodePaymentOnboardingViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "explanationView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dockView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setButtonsEnabled:", 1);

    WeakRetained = v4;
  }

}

- (void)_terminateSetupFlow
{
  NSObject *v3;
  void (**terminationHandler)(void);
  void *v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v6, 2u);
  }

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 2);
  terminationHandler = (void (**)(void))self->_terminationHandler;
  if (terminationHandler)
  {
    terminationHandler[2]();
  }
  else
  {
    -[PKBarcodePaymentOnboardingViewController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (id)_imageForWatchView
{
  unint64_t v2;
  void *v3;

  v2 = +[PKBridgeWatchAttributeController heroWatchSize](PKBridgeWatchAttributeController, "heroWatchSize");
  if (v2 <= 4)
  {
    PKUIImageNamed(off_1E3E61E68[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)continueHandler
{
  return self->_continueHandler;
}

- (void)setContinueHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (id)terminationHandler
{
  return self->_terminationHandler;
}

- (void)setTerminationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
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
  objc_storeStrong(&self->_terminationHandler, 0);
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
  objc_storeStrong((id *)&self->_educationPhone, 0);
  objc_storeStrong((id *)&self->_issuerName, 0);
}

@end
