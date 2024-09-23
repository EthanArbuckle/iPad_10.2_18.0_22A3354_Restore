@implementation PKPaymentAutoReloadSetupCompleteViewController

- (PKPaymentAutoReloadSetupCompleteViewController)initWithPass:(id)a3 amount:(id)a4 threshold:(id)a5 setupMode:(int64_t)a6 paymentDataProvider:(id)a7 delegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKPaymentAutoReloadSetupCompleteViewController *v18;
  PKPaymentAutoReloadSetupCompleteViewController *v19;
  id *p_pass;
  void *v21;
  char v22;
  BOOL v23;
  id v25;
  id v26;
  objc_super v27;

  v15 = a3;
  v26 = a4;
  v25 = a5;
  v16 = a7;
  v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentAutoReloadSetupCompleteViewController;
  v18 = -[PKExplanationViewController init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    p_pass = (id *)&v18->_pass;
    objc_storeStrong((id *)&v18->_pass, a3);
    objc_storeStrong((id *)&v19->_amount, a4);
    objc_storeStrong((id *)&v19->_threshold, a5);
    v19->_setupMode = a6;
    objc_storeWeak((id *)&v19->_delegate, v17);
    objc_storeStrong((id *)&v19->_paymentDataProvider, a7);
    objc_msgSend(*p_pass, "autoTopUpMerchantTokenIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      v22 = objc_msgSend(*p_pass, "isAutoTopEnabled");
    else
      v22 = 0;

    if (a6 == 1)
      v23 = 0;
    else
      v23 = v22;
    v19->_passUpdated = v23;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PKPaymentDataProvider addDelegate:](v19->_paymentDataProvider, "addDelegate:", v19);
  }

  return v19;
}

- (void)dealloc
{
  NSObject *timer;
  OS_dispatch_source *v4;
  objc_super v5;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAutoReloadSetupCompleteViewController;
  -[PKPaymentAutoReloadSetupCompleteViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *timer;
  OS_dispatch_source *v19;
  OS_dispatch_source *v20;
  OS_dispatch_source *v21;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PKPaymentAutoReloadSetupCompleteViewController;
  -[PKExplanationViewController viewDidLoad](&v28, sel_viewDidLoad);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKPaymentAutoReloadSetupCompleteViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[PKPaymentAutoReloadSetupCompleteViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:", 1);

  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTopMargin:", 80.0);
  objc_msgSend(v4, "setShowPrivacyView:", 0);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 60.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurrencyAmount currency](self->_amount, "currency");
  v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 == CFSTR("KRW")
    || v6 && (v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("KRW")), v7, v8))
  {
    PKPassKitUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLForResource:withExtension:", CFSTR("WonIconArrowCirclePath"), CFSTR("pdf"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = PKUIScreenScale();
    PKUIImageFromPDF(v10, 80.0, 80.0, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("dollarsign.arrow.circlepath"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithTintColor:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PKUIImageWithBackground(v13, v14, 80.0, 80.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v15);
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  objc_msgSend(v17, "setCornerRadius:", 14.0);
  objc_msgSend(v17, "setMasksToBounds:", 1);
  objc_msgSend(v4, "setHeroView:", v16);
  if (self->_passUpdated)
  {
    -[PKPaymentAutoReloadSetupCompleteViewController showBalanceUpdatedUIWithAnimation:](self, "showBalanceUpdatedUIWithAnimation:", 0);
  }
  else
  {
    -[PKPaymentAutoReloadSetupCompleteViewController showWaitingOnBalanceUpdateUI](self, "showWaitingOnBalanceUpdateUI");
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      v19 = self->_timer;
      self->_timer = 0;

    }
    objc_initWeak(&location, self);
    v20 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v21 = self->_timer;
    self->_timer = v20;

    v22 = self->_timer;
    v23 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v24 = self->_timer;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __61__PKPaymentAutoReloadSetupCompleteViewController_viewDidLoad__block_invoke;
    v25[3] = &unk_1E3E61310;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v24, v25);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

}

void __61__PKPaymentAutoReloadSetupCompleteViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentAutoReloadSetupCompleteViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __61__PKPaymentAutoReloadSetupCompleteViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  NSObject *v4;
  NSObject **v5;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[134];
    v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = v5[134];
      v5[134] = 0;

      v2 = v5;
    }
    objc_msgSend(v2, "showBalanceUpdatedUIWithAnimation:", 1);
    v2 = v5;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAutoReloadSetupCompleteViewController;
  -[PKPaymentAutoReloadSetupCompleteViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)showWaitingOnBalanceUpdateUI
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowSpinner:", 1);
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_SETTING_UP"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleText:", v2);

  objc_msgSend(v5, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setButtonsEnabled:", 0);
  objc_msgSend(v3, "primaryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)showBalanceUpdatedUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowSpinner:", 0);
  -[PKCurrencyAmount formattedStringValue](self->_amount, "formattedStringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurrencyAmount formattedStringValue](self->_threshold, "formattedStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_SETUP_COMPLETE_MESSAGE"), CFSTR("%@%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBodyText:", v7);

  objc_msgSend(v13, "showCheckmark:animated:", 1, v3);
  if (self->_setupMode == 1)
    v8 = CFSTR("PASS_DETAILS_AUTO_RELOAD_SETUP_COMPLETE_CHANGES_SAVED");
  else
    v8 = CFSTR("PASS_DETAILS_AUTO_RELOAD_SETUP_COMPLETE");
  PKLocalizedPaymentString(&v8->isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitleText:", v9);

  objc_msgSend(v13, "dockView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setButtonsEnabled:", 1);
  objc_msgSend(v10, "primaryButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 0);
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_SETUP_COMPLETE_DONE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v12, 0);

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__PKPaymentAutoReloadSetupCompleteViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __106__PKPaymentAutoReloadSetupCompleteViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  if (v3)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1072);
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 1072);
      *(_QWORD *)(v5 + 1072) = 0;

      objc_msgSend(*(id *)(a1 + 32), "showBalanceUpdatedUIWithAnimation:", 1);
    }
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  reporter = self->_reporter;
  v7 = *MEMORY[0x1E0D69418];
  v8[0] = *MEMORY[0x1E0D69420];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:context:](reporter, "reportButtonPressed:context:", 0, v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "autoReloadSetupCompleteViewControllerDidComplete");

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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
