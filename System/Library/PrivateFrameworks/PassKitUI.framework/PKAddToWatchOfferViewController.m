@implementation PKAddToWatchOfferViewController

- (PKAddToWatchOfferViewController)initWithPass:(id)a3 context:(int64_t)a4
{
  id v7;
  PKAddToWatchOfferViewController *v8;
  PKAddToWatchOfferViewController *v9;
  PKHeroCardWatchExplainationHeaderView *v10;
  PKHeroCardWatchExplainationHeaderView *heroView;
  PKPassSnapshotter *v12;
  PKSecureElementPass *pass;
  double v14;
  double v15;
  double v16;
  double v17;
  PKAddToWatchOfferViewController *v18;
  _QWORD v20[4];
  PKAddToWatchOfferViewController *v21;

  v7 = a3;
  v8 = -[PKExplanationViewController initWithContext:](self, "initWithContext:", a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pass, a3);
    v10 = objc_alloc_init(PKHeroCardWatchExplainationHeaderView);
    heroView = v9->_heroView;
    v9->_heroView = v10;

    v12 = objc_alloc_init(PKPassSnapshotter);
    pass = v9->_pass;
    -[PKHeroCardWatchExplainationHeaderView recommendedCardImageSize](v9->_heroView, "recommendedCardImageSize");
    v15 = v14;
    v17 = v16;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__PKAddToWatchOfferViewController_initWithPass_context___block_invoke;
    v20[3] = &unk_1E3E613B0;
    v18 = v9;
    v21 = v18;
    -[PKPassSnapshotter snapshotWithPass:size:completion:](v12, "snapshotWithPass:size:completion:", pass, v20, v15, v17);
    -[PKAddToWatchOfferViewController _configureNavigationItem](v18, "_configureNavigationItem");

  }
  return v9;
}

void __56__PKAddToWatchOfferViewController_initWithPass_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PKAddToWatchOfferViewController_initWithPass_context___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __56__PKAddToWatchOfferViewController_initWithPass_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setCardImage:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v3;

  -[PKAddToWatchOfferViewController _clearInteractionDisabledView](self, "_clearInteractionDisabledView");
  v3.receiver = self;
  v3.super_class = (Class)PKAddToWatchOfferViewController;
  -[PKAddToWatchOfferViewController dealloc](&v3, sel_dealloc);
}

- (void)_configureNavigationItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PKAddToWatchOfferViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:", 1);

  v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedString(CFSTR("DONE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 2, self, sel__addLater);

  -[PKAddToWatchOfferViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v8);

  -[PKAddToWatchOfferViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", &stru_1E3E7D690);

}

- (unint64_t)edgesForExtendedLayout
{
  return 15;
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKAddToWatchOfferViewController;
  -[PKExplanationViewController loadView](&v13, sel_loadView);
  -[PKAddToWatchOfferViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  objc_msgSend(v5, "setHeroView:", self->_heroView);
  objc_msgSend(v5, "setTopBackgroundColor:", 0);
  -[PKExplanationViewController setPrivacyLinkController:](self, "setPrivacyLinkController:", 0);
  PKLocalizedPaymentString(CFSTR("ADD_TO_APPLE_WATCH"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleText:", v6);

  -[PKSecureElementPass paymentPass](self->_pass, "paymentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("ADD_TO_APPLE_WATCH_BODY_FORMAT"), CFSTR("%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBodyText:", v9);

  objc_msgSend(v5, "dockView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("ADD_NOW"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v12, 0);

  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__addToWatch, 64);
}

- (void)viewWillLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKAddToWatchOfferViewController;
  -[PKExplanationViewController viewWillLayoutSubviews](&v2, sel_viewWillLayoutSubviews);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAddToWatchOfferViewController;
  -[PKAddToWatchOfferViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKAddToWatchOfferViewController _clearInteractionDisabledView](self, "_clearInteractionDisabledView");
}

- (void)showSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *interactionDisabledView;
  UIView *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = !v3;
  objc_msgSend(v6, "setEnabled:", v7);
  if (v7)
  {
    objc_msgSend(v6, "setShowSpinner:", 0);
    -[PKAddToWatchOfferViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rightBarButtonItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEnabled:", 1);

    -[PKAddToWatchOfferViewController _clearInteractionDisabledView](self, "_clearInteractionDisabledView");
  }
  else
  {
    objc_msgSend(v6, "setShowSpinner:", 1);
    -[PKAddToWatchOfferViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rightBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 0);

    if (!self->_interactionDisabledView)
    {
      -[PKAddToWatchOfferViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10)
        v10 = self;
      objc_msgSend(v10, "view");
      v12 = (UIView *)objc_claimAutoreleasedReturnValue();
      interactionDisabledView = self->_interactionDisabledView;
      self->_interactionDisabledView = v12;

      v14 = self->_interactionDisabledView;
      if (v14)
      {
        -[UIView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 0);
        -[PKAddToWatchOfferViewController _setIdleTimerDisabled:](self, "_setIdleTimerDisabled:", 1);
      }
    }
  }

}

- (void)_clearInteractionDisabledView
{
  UIView *interactionDisabledView;
  UIView *v4;

  interactionDisabledView = self->_interactionDisabledView;
  if (interactionDisabledView)
  {
    -[UIView setUserInteractionEnabled:](interactionDisabledView, "setUserInteractionEnabled:", 1);
    v4 = self->_interactionDisabledView;
    self->_interactionDisabledView = 0;

    -[PKAddToWatchOfferViewController _setIdleTimerDisabled:](self, "_setIdleTimerDisabled:", 0);
  }
}

- (void)_setIdleTimerDisabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("enabled");
    if (v3)
      v5 = CFSTR("disabled");
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = CFSTR("PKAddToWatchOfferViewController");
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Payment Setup has %@ the Idle Timer. (For: %@)", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setIdleTimerDisabled:forReason:", v3, CFSTR("PKAddToWatchOfferViewController"));

}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a3;
  -[PKAddToWatchOfferViewController view](self, "view", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4 ^ 1);

  -[PKAddToWatchOfferViewController showSpinner:](self, "showSpinner:", v4);
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_interactionDisabledView, 0);
}

@end
