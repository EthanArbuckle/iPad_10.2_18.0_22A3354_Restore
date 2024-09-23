@implementation PKProvisioningReaderModeViewController

- (PKProvisioningReaderModeViewController)initWithContext:(int64_t)a3 product:(id)a4 isWatch:(BOOL)a5 fieldsModel:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  PKProvisioningReaderModeViewController *v16;
  PKProvisioningReaderModeViewController *v17;
  objc_super v19;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PKProvisioningReaderModeViewController;
  v16 = -[PKProvisioningReaderModeViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v17 = v16;
  if (v16)
  {
    v16->_context = a3;
    objc_storeWeak((id *)&v16->_delegate, v15);
    v17->_isWatch = a5;
    objc_storeStrong((id *)&v17->_fieldsModel, a6);
    objc_storeStrong((id *)&v17->_product, a4);
    v17->_state = 0;
  }

  return v17;
}

- (void)viewDidLoad
{
  int64_t context;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKProvisioningReaderModeViewController;
  -[PKProvisioningReaderModeViewController viewDidLoad](&v5, sel_viewDidLoad);
  context = self->_context;
  -[PKProvisioningReaderModeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKPaymentSetupApplyContextAppearance(context, v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKProvisioningReaderModeViewController;
  -[PKProvisioningReaderModeViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
  if (!self->_state)
    -[PKProvisioningReaderModeViewController _startIngestion](self, "_startIngestion");
}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  unint64_t state;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKProvisioningReaderModeViewController;
  -[PKProvisioningReaderModeViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[PKProvisioningReaderModeViewController _tearDownCardIngester](self, "_tearDownCardIngester");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "provisionedPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    state = self->_state;

    if (state == 6)
      return;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "viewControllerDidFailIngestion:", self);
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  PKReaderModeProvisioningView *v5;
  PKReaderModeProvisioningView *provisioningView;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  UIScrollView *v14;
  UIScrollView *scrollView;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKProvisioningReaderModeViewController;
  -[PKProvisioningReaderModeViewController loadView](&v16, sel_loadView);
  -[PKProvisioningReaderModeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = -[PKReaderModeProvisioningView initWithContext:product:isWatch:]([PKReaderModeProvisioningView alloc], "initWithContext:product:isWatch:", self->_context, self->_product, self->_isWatch);
  provisioningView = self->_provisioningView;
  self->_provisioningView = v5;

  -[PKPaymentSetupProduct imageAssets](self->_product, "imageAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "plasticCardImage");

  -[PKPaymentSetupProduct imageAssets](self->_product, "imageAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "digitalCardImage");

  if (v8)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKReaderModeProvisioningView setPlasticCardImage:](self->_provisioningView, "setPlasticCardImage:", v12);
    -[PKReaderModeProvisioningView setDigitalCardImage:](self->_provisioningView, "setDigitalCardImage:", v13);

  }
  v14 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v14;

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_provisioningView);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 1);
  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v3, "addSubview:", self->_scrollView);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKProvisioningReaderModeViewController;
  -[PKProvisioningReaderModeViewController viewWillLayoutSubviews](&v17, sel_viewWillLayoutSubviews);
  -[PKProvisioningReaderModeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[PKReaderModeProvisioningView sizeThatFits:](self->_provisioningView, "sizeThatFits:", v10, 1.79769313e308);
  v14 = v13;
  v16 = v15;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v6, v8, v10, v12);
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v14, v16);
  -[PKReaderModeProvisioningView setFrame:](self->_provisioningView, "setFrame:", 0.0, 0.0, v14, v16);
  -[PKReaderModeProvisioningView layoutIfNeeded](self->_provisioningView, "layoutIfNeeded");
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", v16 > v12);
}

- (void)_setIdleTimerDisabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_idleTimerDisabled != a3)
  {
    v3 = a3;
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("enabled");
      if (v3)
        v6 = CFSTR("disabled");
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = CFSTR("ReaderModeProvisioning");
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Payment Setup has %@ the Idle Timer. (For: %@)", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setIdleTimerDisabled:forReason:", v3, CFSTR("ReaderModeProvisioning"));

    self->_idleTimerDisabled = v3;
  }
}

- (void)_hideBackButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKProvisioningReaderModeViewController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:animated:", v3, 1);

}

- (void)_updateToUIState:(unint64_t)a3
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD v5[6];
  _QWORD block[4];
  id v7;

  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PKProvisioningReaderModeViewController__updateToUIState___block_invoke;
  v5[3] = &unk_1E3E62010;
  v5[4] = self;
  v5[5] = a3;
  v4 = v5;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E3E61590;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__PKProvisioningReaderModeViewController__updateToUIState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v11 = 138412546;
    v12 = v3;
    v13 = 2048;
    v14 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "%@, Updating UI state to %lu", (uint8_t *)&v11, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(v5 - 4) >= 2)
  {
    if (v5 == 1)
      objc_msgSend(*(id *)(a1 + 32), "_hideBackButton:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v8, 2, *(_QWORD *)(a1 + 32), sel__done_);

    objc_msgSend(v6, "setHidesBackButton:", 1);
    objc_msgSend(v6, "setRightBarButtonItem:", v9);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setState:animated:", *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

}

- (void)_done:(id)a3
{
  id WeakRetained;

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "viewControllerDidComplete:", self);

}

- (void)_setupCardIngester
{
  PKContactlessCardIngester *v3;
  PKContactlessCardIngester *cardIngester;

  if (!self->_cardIngester)
  {
    v3 = (PKContactlessCardIngester *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C68]), "initWithPaymentSetupProduct:delegate:", self->_product, self);
    cardIngester = self->_cardIngester;
    self->_cardIngester = v3;

  }
}

- (void)_tearDownCardIngester
{
  PKContactlessCardIngester *cardIngester;

  -[PKContactlessCardIngester invalidate](self->_cardIngester, "invalidate");
  cardIngester = self->_cardIngester;
  self->_cardIngester = 0;

  -[PKProvisioningReaderModeViewController _setIdleTimerDisabled:](self, "_setIdleTimerDisabled:", 0);
  -[PKProvisioningReaderModeViewController _invalidateCardNotFoundTimer](self, "_invalidateCardNotFoundTimer");
}

- (void)contactlessCardIngester:(id)a3 didFailToIngestCardWithError:(id)a4 resetProvisioning:(BOOL)a5 isRecoverable:(BOOL)a6
{
  id v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  BOOL v16;
  _QWORD block[4];
  id v18;

  v9 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __127__PKProvisioningReaderModeViewController_contactlessCardIngester_didFailToIngestCardWithError_resetProvisioning_isRecoverable___block_invoke;
  v13[3] = &unk_1E3E74900;
  v15 = a5;
  v13[4] = self;
  v14 = v9;
  v16 = a6;
  v11 = v13;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E3E61590;
  v18 = v11;
  v12 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __127__PKProvisioningReaderModeViewController_contactlessCardIngester_didFailToIngestCardWithError_resetProvisioning_isRecoverable___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCardNotFoundTimer");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032) = 0;
  v2 = *(id **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained(v2 + 122);
    objc_msgSend(WeakRetained, "viewControllerDidFailIngestion:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "_resetProvisioningState");
  }
  else
  {
    objc_msgSend(v2, "_updateToUIState:", 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 0.0;
    if (*(_QWORD *)(v4 + 1024) == 5)
    {
      *(_QWORD *)(v4 + 1032) = 4;
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 0.776119403;
    }
    objc_msgSend(*(id *)(v4 + 1008), "setTransferringProgress:duration:", v5, 0.0);
  }
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(unsigned __int8 *)(a1 + 48);
    v9 = *(unsigned __int8 *)(a1 + 49);
    v11 = 136315906;
    v12 = "-[PKProvisioningReaderModeViewController contactlessCardIngester:didFailToIngestCardWithError:resetProvisionin"
          "g:isRecoverable:]_block_invoke";
    v13 = 2112;
    v14 = v7;
    v15 = 1024;
    v16 = v8;
    v17 = 1024;
    v18 = v9;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "%s:%@ (resetProvisioning: %d, isRecoverable: %d)", (uint8_t *)&v11, 0x22u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "showReaderModeError:isRecoverable:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 49));
}

- (void)contactlessCardIngester:(id)a3 didUpdateCardIngestionStatus:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;
  _QWORD block[4];
  id v14;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__PKProvisioningReaderModeViewController_contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke;
  v10[3] = &unk_1E3E63480;
  v11 = v6;
  v12 = a4;
  v10[4] = self;
  v8 = v10;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E3E61590;
  v14 = v8;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __95__PKProvisioningReaderModeViewController_contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  dispatch_time_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 2)
  {
    v3 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__PKProvisioningReaderModeViewController_contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke_2;
    block[3] = &unk_1E3E612E8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCardNotFoundTimer");
    objc_msgSend(*(id *)(a1 + 32), "_hideBackButton:", 1);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 1024);
    if (v5 == 5)
    {
      v6 = *(void **)(v4 + 1008);
      v7 = 0.98;
      v8 = 7.0;
    }
    else
    {
      if (v5 != 1)
        goto LABEL_9;
      v6 = *(void **)(v4 + 1008);
      v7 = 0.179104478;
      v8 = 6.0;
    }
    objc_msgSend(v6, "setTransferringProgress:duration:", v7, v8);
  }
  else if (v2 == 10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_startCardNotFoundTimer");
  }
LABEL_9:
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v14 = v10;
    v15 = 2080;
    v16 = "-[PKProvisioningReaderModeViewController contactlessCardIngester:didUpdateCardIngestionStatus:]_block_invoke";
    v17 = 2048;
    v18 = v11;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "%@, %s:%lu", buf, 0x20u);
  }

}

_QWORD *__95__PKProvisioningReaderModeViewController_contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke_2(uint64_t a1)
{
  _QWORD *result;
  unint64_t v2;
  BOOL v3;
  uint64_t v4;

  result = *(_QWORD **)(a1 + 32);
  v2 = result[128];
  v3 = v2 > 5;
  v4 = (1 << v2) & 0x2E;
  if (!v3 && v4 != 0)
    return (_QWORD *)objc_msgSend(result, "_updateToUIState:", 3);
  return result;
}

- (void)cardNotFoundTimerFired:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Card not found timer fired", v5, 2u);
  }

  -[PKProvisioningReaderModeViewController _updateToUIState:](self, "_updateToUIState:", 1);
  -[PKProvisioningReaderModeViewController _invalidateCardNotFoundTimer](self, "_invalidateCardNotFoundTimer");
}

- (void)_startCardNotFoundTimer
{
  NSTimer *v3;
  NSTimer *cardNotFoundTimer;

  -[PKProvisioningReaderModeViewController _invalidateCardNotFoundTimer](self, "_invalidateCardNotFoundTimer");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_cardNotFoundTimerFired_, 0, 0, 15.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  cardNotFoundTimer = self->_cardNotFoundTimer;
  self->_cardNotFoundTimer = v3;

}

- (void)_invalidateCardNotFoundTimer
{
  NSTimer *cardNotFoundTimer;

  -[NSTimer invalidate](self->_cardNotFoundTimer, "invalidate");
  cardNotFoundTimer = self->_cardNotFoundTimer;
  self->_cardNotFoundTimer = 0;

}

- (void)_startIngestion
{
  unint64_t state;

  if ((self->_state | 4) == 4)
  {
    -[PKProvisioningReaderModeViewController _setIdleTimerDisabled:](self, "_setIdleTimerDisabled:", 1);
    if (!self->_cardIngester)
      -[PKProvisioningReaderModeViewController _setupCardIngester](self, "_setupCardIngester");
    -[PKProvisioningReaderModeViewController _updateToUIState:](self, "_updateToUIState:", 2);
    state = self->_state;
    if (state == 4)
    {
      -[PKProvisioningReaderModeViewController _startTransferringCard](self, "_startTransferringCard");
    }
    else if (!state)
    {
      -[PKProvisioningReaderModeViewController _startReadingCard](self, "_startReadingCard");
    }
  }
}

- (void)_startReadingCard
{
  NSObject *v3;
  PKContactlessCardIngester *cardIngester;
  _QWORD v5[4];
  id v6;
  id buf[2];

  if (self->_state)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Warning! Attempted to ingestCard: while currently ingesting", (uint8_t *)buf, 2u);
    }

    -[PKProvisioningReaderModeViewController contactlessCardIngester:didFailToIngestCardWithError:resetProvisioning:isRecoverable:](self, "contactlessCardIngester:didFailToIngestCardWithError:resetProvisioning:isRecoverable:", self->_cardIngester, 0, 1, 1);
  }
  else
  {
    self->_state = 1;
    objc_initWeak(buf, self);
    cardIngester = self->_cardIngester;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__PKProvisioningReaderModeViewController__startReadingCard__block_invoke;
    v5[3] = &unk_1E3E6F7D8;
    objc_copyWeak(&v6, buf);
    -[PKContactlessCardIngester ingestCardWithSuccessHandler:](cardIngester, "ingestCardWithSuccessHandler:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __59__PKProvisioningReaderModeViewController__startReadingCard__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD block[4];
  id v11;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PKProvisioningReaderModeViewController__startReadingCard__block_invoke_2;
  v7[3] = &unk_1E3E61B68;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v8 = v3;
  v5 = v7;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E3E61590;
  v11 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __59__PKProvisioningReaderModeViewController__startReadingCard__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_invalidateCardNotFoundTimer");
    objc_storeStrong(v5 + 131, *(id *)(a1 + 32));
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D670D8]), "initWithPaymentSetupProduct:cardSessionToken:", v5[124], v5[131]);
    v5[128] = (id)2;
    v4 = objc_loadWeakRetained(v5 + 122);
    objc_msgSend(v4, "provisionWithFieldModel:paymentCredential:", v5[123], v3);

    WeakRetained = v5;
  }

}

- (void)_startTransferringCard
{
  PKContactlessCardIngester *cardIngester;
  NSString *cardSessionToken;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[5];

  if (self->_state == 4)
  {
    self->_state = 5;
    cardIngester = self->_cardIngester;
    cardSessionToken = self->_cardSessionToken;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__PKProvisioningReaderModeViewController__startTransferringCard__block_invoke;
    v7[3] = &unk_1E3E612E8;
    v7[4] = self;
    -[PKContactlessCardIngester ingestCardWithCardSessionToken:successHandler:](cardIngester, "ingestCardWithCardSessionToken:successHandler:", cardSessionToken, v7);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Warning! attempting to ingestCardWithCardSessionToken: while currently ingesting", v6, 2u);
    }

    -[PKProvisioningReaderModeViewController contactlessCardIngester:didFailToIngestCardWithError:resetProvisioning:isRecoverable:](self, "contactlessCardIngester:didFailToIngestCardWithError:resetProvisioning:isRecoverable:", self->_cardIngester, 0, 1, 1);
  }
}

void __64__PKProvisioningReaderModeViewController__startTransferringCard__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD v3[5];
  _QWORD block[4];
  id v5;

  v1 = MEMORY[0x1E0C809B0];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PKProvisioningReaderModeViewController__startTransferringCard__block_invoke_2;
  v3[3] = &unk_1E3E612E8;
  v3[4] = *(_QWORD *)(a1 + 32);
  v2 = v3;
  block[0] = v1;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E3E61590;
  v5 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __64__PKProvisioningReaderModeViewController__startTransferringCard__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  dispatch_time_t v6;
  _QWORD v7[6];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024) = 6;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  objc_msgSend(WeakRetained, "provisionedPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fieldForKey:", *MEMORY[0x1E0D6ADD0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 5;
  else
    v5 = 4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setTransferringProgress:duration:", 1.0, 0.5);
  v6 = dispatch_time(0, 500000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PKProvisioningReaderModeViewController__startTransferringCard__block_invoke_3;
  v7[3] = &unk_1E3E62010;
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], v7);
  objc_msgSend(*(id *)(a1 + 32), "_tearDownCardIngester");

}

uint64_t __64__PKProvisioningReaderModeViewController__startTransferringCard__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateToUIState:", *(_QWORD *)(a1 + 40));
}

- (void)_resetProvisioningState
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD v4[5];
  _QWORD block[4];
  id v6;

  v2 = MEMORY[0x1E0C809B0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__PKProvisioningReaderModeViewController__resetProvisioningState__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  v3 = v4;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E3E61590;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __65__PKProvisioningReaderModeViewController__resetProvisioningState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateToUIState:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1048);
  *(_QWORD *)(v2 + 1048) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setTransferringProgress:duration:", 0.0, 0.0);
}

- (void)showReaderModeError:(id)a3 isRecoverable:(BOOL)a4
{
  _BOOL4 v4;
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  self->_state = self->_stateOnRetry;
  self->_stateOnRetry = 0;
  reporter = self->_reporter;
  v7 = a3;
  -[PKProvisioningAnalyticsSessionUIReporter reportError:context:](reporter, "reportError:context:", v7, 0);
  if (v4)
    v8 = 3;
  else
    v8 = 4;
  objc_msgSend(MEMORY[0x1E0D67548], "errorWithUnderlyingError:defaultSeverity:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Reader mode provisioning failed with error: %@", (uint8_t *)&v11, 0xCu);
  }

  -[PKProvisioningReaderModeViewController showWithProvisioningError:](self, "showWithProvisioningError:", v9);
  -[PKProvisioningReaderModeViewController _hideBackButton:](self, "_hideBackButton:", 0);

}

- (void)showWithProvisioningError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = a3;
  -[PKProvisioningReaderModeViewController _setIdleTimerDisabled:](self, "_setIdleTimerDisabled:", 0);
  -[PKProvisioningReaderModeViewController _hideBackButton:](self, "_hideBackButton:", 0);
  if ((objc_msgSend(v4, "hasLocalizedTitleAndMessage") & 1) == 0)
  {
    PKLocalizedPaymentString(CFSTR("COULD_NOT_ADD_CARD_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocalizedTitle:", v5);

    PKLocalizedPaymentString(CFSTR("COULD_NOT_ADD_CARD_MESSAGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocalizedMessage:", v6);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PKProvisioningReaderModeViewController_showWithProvisioningError___block_invoke;
  v10[3] = &unk_1E3E612E8;
  v10[4] = self;
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__PKProvisioningReaderModeViewController_showWithProvisioningError___block_invoke_2;
  v9[3] = &unk_1E3E612E8;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PKProvisioningReaderModeViewController_showWithProvisioningError___block_invoke_3;
  v8[3] = &unk_1E3E612E8;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertForErrorWithError:acknowledgeButtonText:exitButtonText:onAcknowledge:onExit:onTryAgain:", v4, 0, 0, v10, v9, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningReaderModeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

void __68__PKProvisioningReaderModeViewController_showWithProvisioningError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  objc_msgSend(WeakRetained, "viewControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

void __68__PKProvisioningReaderModeViewController_showWithProvisioningError___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  objc_msgSend(WeakRetained, "viewControllerDidComplete:", *(_QWORD *)(a1 + 32));

}

uint64_t __68__PKProvisioningReaderModeViewController_showWithProvisioningError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startIngestion");
}

- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4
{
  PKReaderModeProvisioningView *provisioningView;
  double v7;

  if (a4)
  {
    -[PKProvisioningReaderModeViewController _updateToUIState:](self, "_updateToUIState:", 3);
    -[PKProvisioningReaderModeViewController _setIdleTimerDisabled:](self, "_setIdleTimerDisabled:", 0);
    -[PKProvisioningReaderModeViewController _hideBackButton:](self, "_hideBackButton:", 1);
    if ((unint64_t)a3 >= 6)
    {
      if ((unint64_t)(a3 - 6) >= 3)
        return;
      provisioningView = self->_provisioningView;
      v7 = 0.776119403;
    }
    else
    {
      provisioningView = self->_provisioningView;
      v7 = 0.537313433;
    }
    -[PKReaderModeProvisioningView setTransferringProgress:duration:](provisioningView, "setTransferringProgress:duration:", v7, 12.0);
  }
  else if (a3 == 8)
  {
    self->_state = 4;
    -[PKProvisioningReaderModeViewController _startTransferringCard](self, "_startTransferringCard");
  }
  else
  {
    -[PKProvisioningReaderModeViewController _resetProvisioningState](self, "_resetProvisioningState");
  }
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
  objc_storeStrong((id *)&self->_cardNotFoundTimer, 0);
  objc_storeStrong((id *)&self->_cardSessionToken, 0);
  objc_storeStrong((id *)&self->_cardIngester, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_provisioningView, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_fieldsModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
