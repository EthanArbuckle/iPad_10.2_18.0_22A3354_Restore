@implementation PKAuthorizationCoverSheetViewController

- (PKAuthorizationCoverSheetViewController)initWithDelegate:(id)a3 authenticator:(id)a4 source:(int64_t)a5
{
  id v8;
  id v9;
  PKAuthorizationCoverSheetViewController *v10;
  PKAuthorizationCoverSheetViewController *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKAuthorizationCoverSheetViewController;
  v10 = -[PKAuthorizationCoverSheetViewController init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeStrong((id *)&v11->_authenticator, a4);
    -[PKAuthenticator setDelegate:](v11->_authenticator, "setDelegate:", v11);
    v11->_presentationSource = a5;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAuthorizationCoverSheetViewController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKAuthorizationCoverSheetViewController;
  -[PKAuthorizationCoverSheetViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAuthorizationCoverSheetViewController;
  -[PKAuthorizationCoverSheetViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (self->_isErrorRecovery)
    AudioServicesPlaySystemSound(0x573u);
}

- (void)loadView
{
  void *v3;
  void *v4;
  char IsAvailable;
  PKGlyphView *v6;
  PKGlyphView *glyphView;
  uint64_t v8;
  PKContinuousButton *v9;
  UIButton *enterPasscodeButton;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *titleLabelView;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  NSString *v18;
  NSString *v19;
  void *v20;
  UILabel *v21;
  UILabel *subtitleLabelView;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  UIAccessibilityElement *v27;
  UIAccessibilityElement *textAccessibilityElement;
  UIAccessibilityElement *v29;
  UIAccessibilityElement *passcodeAccessibilityElement;
  UIAccessibilityElement *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  int64x2_t v37;
  objc_super v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)PKAuthorizationCoverSheetViewController;
  -[PKAuthorizationCoverSheetViewController loadView](&v38, sel_loadView);
  -[PKAuthorizationCoverSheetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  IsAvailable = PKSystemApertureIsAvailable();
  self->_shouldDrawGlyph = IsAvailable ^ 1;
  if ((IsAvailable & 1) == 0)
  {
    v6 = (PKGlyphView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFF0]), "initWithStyle:", 6);
    glyphView = self->_glyphView;
    self->_glyphView = v6;

    objc_msgSend(v3, "addSubview:", self->_glyphView);
  }
  PKLocalizedPaymentString(CFSTR("GENERIC_PASSCODE"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A90], (NSString *)*MEMORY[0x1E0DC48D0]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lineHeight");
  PKFloatRoundToPixel();
  v35 = v8;
  v36 = xmmword_19DEE0240;
  v37 = vdupq_n_s64(2uLL);
  v9 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v35);
  enterPasscodeButton = self->_enterPasscodeButton;
  self->_enterPasscodeButton = &v9->super;

  objc_msgSend(MEMORY[0x1E0DC3520], "pkui_plainConfigurationWithTitle:font:lineBreakMode:textAlignment:", v34, v33, 4, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentInsets:", 8.0, 25.0, 8.0, 25.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBaseForegroundColor:", v12);

  objc_msgSend(v11, "setTitleAlignment:", 2);
  -[UIButton setConfiguration:](self->_enterPasscodeButton, "setConfiguration:", v11);
  -[UIButton addTarget:action:forControlEvents:](self->_enterPasscodeButton, "addTarget:action:forControlEvents:", self, sel__fallbackToPasscode, 64);
  -[UIButton sizeToFit](self->_enterPasscodeButton, "sizeToFit");
  -[UIButton setAlpha:](self->_enterPasscodeButton, "setAlpha:", 0.0);
  objc_msgSend(v3, "addSubview:", self->_enterPasscodeButton);
  v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabelView = self->_titleLabelView;
  self->_titleLabelView = v13;

  -[UILabel setAlpha:](self->_titleLabelView, "setAlpha:", 0.0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabelView, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setTextAlignment:](self->_titleLabelView, "setTextAlignment:", 1);
  v15 = self->_titleLabelView;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v15, "setTextColor:", v16);

  -[UILabel setNumberOfLines:](self->_titleLabelView, "setNumberOfLines:", 2);
  v17 = self->_titleLabelView;
  v18 = (NSString *)*MEMORY[0x1E0DC4B60];
  v19 = (NSString *)*MEMORY[0x1E0DC48C0];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B60], (NSString *)*MEMORY[0x1E0DC48C0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v17, "setFont:", v20);

  -[UILabel setLineBreakMode:](self->_titleLabelView, "setLineBreakMode:", 4);
  -[UILabel setIsAccessibilityElement:](self->_titleLabelView, "setIsAccessibilityElement:", 0);
  objc_msgSend(v3, "addSubview:", self->_titleLabelView);
  v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  subtitleLabelView = self->_subtitleLabelView;
  self->_subtitleLabelView = v21;

  -[UILabel setAlpha:](self->_subtitleLabelView, "setAlpha:", 0.0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_subtitleLabelView, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setTextAlignment:](self->_subtitleLabelView, "setTextAlignment:", 1);
  v23 = self->_subtitleLabelView;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v23, "setTextColor:", v24);

  -[UILabel setNumberOfLines:](self->_subtitleLabelView, "setNumberOfLines:", 2);
  v25 = self->_subtitleLabelView;
  PKFontForDefaultDesign(v18, v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v25, "setFont:", v26);

  -[UILabel setLineBreakMode:](self->_subtitleLabelView, "setLineBreakMode:", 4);
  -[UILabel setIsAccessibilityElement:](self->_subtitleLabelView, "setIsAccessibilityElement:", 0);
  objc_msgSend(v3, "addSubview:", self->_subtitleLabelView);
  v27 = (UIAccessibilityElement *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3408]), "initWithAccessibilityContainer:", v3);
  textAccessibilityElement = self->_textAccessibilityElement;
  self->_textAccessibilityElement = v27;

  -[UIAccessibilityElement setAccessibilityTraits:](self->_textAccessibilityElement, "setAccessibilityTraits:", *MEMORY[0x1E0DC4698] | *MEMORY[0x1E0DC46E0]);
  v29 = (UIAccessibilityElement *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3408]), "initWithAccessibilityContainer:", v3);
  passcodeAccessibilityElement = self->_passcodeAccessibilityElement;
  self->_passcodeAccessibilityElement = v29;

  -[UIAccessibilityElement setAccessibilityLabel:](self->_passcodeAccessibilityElement, "setAccessibilityLabel:", v34);
  -[UIAccessibilityElement setAccessibilityTraits:](self->_passcodeAccessibilityElement, "setAccessibilityTraits:", *MEMORY[0x1E0DC4660]);
  v31 = self->_passcodeAccessibilityElement;
  v39[0] = self->_textAccessibilityElement;
  v39[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityElements:", v32);

  -[PKAuthorizationCoverSheetViewController _transitionToState:animated:](self, "_transitionToState:animated:", 1, 0);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  NSString *v18;
  NSComparisonResult v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  PKGlyphView *glyphView;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  UILabel *titleLabelView;
  UILabel *subtitleLabelView;
  UIButton *enterPasscodeButton;
  UIAccessibilityElement *textAccessibilityElement;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  UIAccessibilityElement *passcodeAccessibilityElement;
  UIViewController *passcodeViewController;
  void *v50;
  void *v51;
  double v52;
  double v53;
  CGRect remainder;
  CGRect slice;
  objc_super v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v56.receiver = self;
  v56.super_class = (Class)PKAuthorizationCoverSheetViewController;
  -[PKAuthorizationCoverSheetViewController viewWillLayoutSubviews](&v56, sel_viewWillLayoutSubviews);
  -[PKAuthorizationCoverSheetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v52 = v12;
  objc_msgSend(v3, "readableContentGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutFrame");
  v15 = v14;

  v16 = fmin(v9, v15);
  -[PKAuthorizationCoverSheetViewController traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferredContentSizeCategory");
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  v19 = UIContentSizeCategoryCompareToCategory(v18, (UIContentSizeCategory)*MEMORY[0x1E0DC48C8]);

  -[UILabel sizeThatFits:](self->_titleLabelView, "sizeThatFits:", v16, 1.79769313e308);
  v21 = v20;
  -[UILabel sizeThatFits:](self->_subtitleLabelView, "sizeThatFits:", v16, 1.79769313e308);
  v23 = v22;
  -[UIButton sizeThatFits:](self->_enterPasscodeButton, "sizeThatFits:", v16, 1.79769313e308);
  v25 = v24;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v5;
  remainder.origin.y = v7;
  remainder.size.width = v9;
  remainder.size.height = v11;
  if (self->_shouldDrawGlyph)
  {
    v57.origin.x = v5;
    v57.origin.y = v7;
    v57.size.width = v9;
    v57.size.height = v11;
    CGRectDivide(v57, &slice, &remainder, v52 + 5.0, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 32.0, CGRectMinYEdge);
    glyphView = self->_glyphView;
    PKSizeAlignedInRect();
    -[PKGlyphView setFrame:](glyphView, "setFrame:");
  }
  remainder.origin.x = v5;
  remainder.origin.y = v7;
  remainder.size.width = v9;
  remainder.size.height = v11;
  v27 = v25 + 15.0;
  if (v19 == NSOrderedAscending)
    v27 = 0.0;
  v28 = (v11 - (v21 + v23 + v27)) * 0.5;
  v53 = v5;
  v58.origin.x = v5;
  v29 = v7;
  v58.origin.y = v7;
  v30 = v9;
  v58.size.width = v9;
  v31 = v11;
  v58.size.height = v11;
  CGRectDivide(v58, &slice, &remainder, v28, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v21, CGRectMinYEdge);
  titleLabelView = self->_titleLabelView;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](titleLabelView, "setFrame:");
  CGRectDivide(remainder, &slice, &remainder, v23, CGRectMinYEdge);
  subtitleLabelView = self->_subtitleLabelView;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](subtitleLabelView, "setFrame:");
  CGRectDivide(remainder, &slice, &remainder, 15.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v25, CGRectMinYEdge);
  enterPasscodeButton = self->_enterPasscodeButton;
  PKSizeAlignedInRect();
  -[UIButton setFrame:](enterPasscodeButton, "setFrame:");
  textAccessibilityElement = self->_textAccessibilityElement;
  -[UILabel frame](self->_titleLabelView, "frame");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  -[UILabel frame](self->_subtitleLabelView, "frame");
  v61.origin.x = v44;
  v61.origin.y = v45;
  v61.size.width = v46;
  v61.size.height = v47;
  v59.origin.x = v37;
  v59.origin.y = v39;
  v59.size.width = v41;
  v59.size.height = v43;
  v60 = CGRectUnion(v59, v61);
  -[UIAccessibilityElement setAccessibilityFrameInContainerSpace:](textAccessibilityElement, "setAccessibilityFrameInContainerSpace:", v60.origin.x, v60.origin.y, v60.size.width, v60.size.height);
  passcodeAccessibilityElement = self->_passcodeAccessibilityElement;
  -[UIButton frame](self->_enterPasscodeButton, "frame");
  -[UIAccessibilityElement setAccessibilityFrameInContainerSpace:](passcodeAccessibilityElement, "setAccessibilityFrameInContainerSpace:");
  passcodeViewController = self->_passcodeViewController;
  if (passcodeViewController)
  {
    -[UIViewController parentViewController](passcodeViewController, "parentViewController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      -[UIViewController view](self->_passcodeViewController, "view");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setFrame:", v53, v29, v30, v31);

    }
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAuthorizationCoverSheetViewController;
  -[PKAuthorizationCoverSheetViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[PKAuthorizationCoverSheetViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)startEvaluation
{
  NSObject *v2;
  _BOOL4 isInvalid;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  PKAuthenticator *authenticator;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  PKAuthorizationCoverSheetViewController *v15;
  id v16;
  id buf[2];

  if (self->_authenticating)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Skipping Evaluation, because already authenticating.", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    isInvalid = self->_isInvalid;
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (isInvalid)
    {
      if (v6)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Skipping Evaluation, because already invalidated.", (uint8_t *)buf, 2u);
      }

    }
    else
    {
      if (v6)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Starting Evaluation", (uint8_t *)buf, 2u);
      }

      self->_authenticating = 1;
      self->_hasAttemptedBiometricAuth = 0;
      objc_initWeak(buf, self);
      if (self->_presentationSource == 6)
      {
        PKLocalizedCredentialString(CFSTR("UWB_BIOLOCKOUT_PASSCODE_TITLE_CONFIRM"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedCredentialString(CFSTR("UWB_BIOLOCKOUT_PASSCODE_REASON_CONFIRM"));
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_PASSCODE_TITLE_CONFIRM"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("PRIVACY_COVER_SHEET_AUTHENTICATION_REASON"));
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFE0]), "initWithPolicy:", 10);
      objc_msgSend(v9, "setPasscodeTitle:", v7);
      objc_msgSend(v9, "setReason:", v8);
      authenticator = self->_authenticator;
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __58__PKAuthorizationCoverSheetViewController_startEvaluation__block_invoke;
      v14 = &unk_1E3E63240;
      objc_copyWeak(&v16, buf);
      v15 = self;
      -[PKAuthenticator evaluateRequest:withCompletion:](authenticator, "evaluateRequest:withCompletion:", v9, &v11);
      if ((objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForPolicy:", 10, v11, v12, v13, v14) & 6) == 0)
        -[PKAuthorizationCoverSheetViewController _transitionToState:animated:](self, "_transitionToState:animated:", 6, 0);
      objc_destroyWeak(&v16);

      objc_destroyWeak(buf);
    }
  }
}

void __58__PKAuthorizationCoverSheetViewController_startEvaluation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PKAuthorizationCoverSheetViewController_startEvaluation__block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __58__PKAuthorizationCoverSheetViewController_startEvaluation__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  id *v7;
  uint64_t v8;
  NSObject *v9;
  id *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 985) = 0;
    switch(objc_msgSend(*(id *)(a1 + 32), "result"))
    {
      case 0:
        PKLogFacilityTypeGetObject();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Authentication successful.", (uint8_t *)&v16, 2u);
        }

        if (objc_msgSend(*(id *)(a1 + 32), "biometricMatch"))
        {
          v7 = v3;
          v8 = 7;
        }
        else
        {
          v7 = v3;
          v8 = 8;
        }
        objc_msgSend(v7, "_transitionToState:animated:", v8, 1);
        goto LABEL_24;
      case 1:
        PKLogFacilityTypeGetObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Authentication canceled by user.", (uint8_t *)&v16, 2u);
        }

        v10 = (id *)(*(_QWORD *)(a1 + 40) + 1096);
        goto LABEL_22;
      case 2:
      case 3:
        PKLogFacilityTypeGetObject();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        LOWORD(v16) = 0;
        v5 = "PKAuthorizationCoverSheetViewController: Authentication canceled by app.";
        break;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "processName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "processIdentifier");
        PKLogFacilityTypeGetObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138412546;
          v17 = v12;
          v18 = 2048;
          v19 = v13;
          _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Authentication by %@[%ld] preempted by another process.", (uint8_t *)&v16, 0x16u);
        }

        v15 = objc_loadWeakRetained(v3 + 137);
        objc_msgSend(v15, "authorizationCoverSheetViewControllerDidCompleteWithSuccess:", 0);

        goto LABEL_23;
      case 5:
        PKLogFacilityTypeGetObject();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        LOWORD(v16) = 0;
        v5 = "PKAuthorizationCoverSheetViewController: Failed to authenticate";
        break;
      case 6:
        objc_msgSend(v3, "_transitionToState:animated:", 5, 1);
        objc_msgSend(v3, "_presentPasscodeToExitLockout");
        goto LABEL_24;
      case 7:
        PKLogFacilityTypeGetObject();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        LOWORD(v16) = 0;
        v5 = "PKAuthorizationCoverSheetViewController: Authentication selected fallback - this is not supported";
        break;
      default:
        goto LABEL_24;
    }
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v16, 2u);
LABEL_21:

    v10 = v3 + 137;
LABEL_22:
    v11 = objc_loadWeakRetained(v10);
    objc_msgSend(v11, "authorizationCoverSheetViewControllerDidCompleteWithSuccess:", 0);
LABEL_23:

  }
LABEL_24:

}

- (void)fadeOutUIWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[PKAuthorizationCoverSheetViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__PKAuthorizationCoverSheetViewController_fadeOutUIWithCompletion___block_invoke;
    v8[3] = &unk_1E3E614F0;
    v9 = v4;
    objc_msgSend(v7, "pkui_animateToOpacity:withCompletion:", v8, 0.0);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

uint64_t __67__PKAuthorizationCoverSheetViewController_fadeOutUIWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fadeInUIAnimated:(BOOL)a3 performSynchronizedAnimation:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id performSynchronizedFadeInAnimationBlock;
  void *aBlock;

  v4 = a3;
  v6 = a4;
  if (!self->_shouldUIBeShown)
  {
    self->_shouldUIBeShown = 1;
    aBlock = v6;
    if (self->_currentState != 6)
    {
      if (v4)
      {
        -[PKAuthorizationCoverSheetViewController _transitionToState:animated:](self, "_transitionToState:animated:");
        v6 = aBlock;
      }
      if (v6)
        (*((void (**)(void))aBlock + 2))();
      -[PKAuthorizationCoverSheetViewController _transitionToState:animated:](self, "_transitionToState:animated:", self->_currentState, v4);
      goto LABEL_10;
    }
    self->_isWaitingForPasscodeUI = 1;
    v7 = _Block_copy(v6);
    performSynchronizedFadeInAnimationBlock = self->_performSynchronizedFadeInAnimationBlock;
    self->_performSynchronizedFadeInAnimationBlock = v7;

    v6 = aBlock;
    if (self->_passcodeViewController)
    {
      -[PKAuthorizationCoverSheetViewController _animateInPasscodeViewController](self, "_animateInPasscodeViewController");
LABEL_10:
      v6 = aBlock;
    }
  }

}

- (void)invalidate
{
  PKAuthenticator *authenticator;

  if (!self->_isInvalid)
  {
    self->_isInvalid = 1;
    -[PKAuthenticator setDelegate:](self->_authenticator, "setDelegate:", 0);
    authenticator = self->_authenticator;
    self->_authenticator = 0;

    self->_authenticating = 0;
  }
}

- (void)_presentPasscodeToExitLockout
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  PKAuthenticator *authenticator;
  _QWORD v8[5];
  id v9;
  id buf[2];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Prompting user to exit bio lockout", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFE0]), "initWithPolicy:", 0);
  objc_msgSend(v4, "setPasscodeOnly:", 1);
  PKLocalizedPaymentString(CFSTR("PRESENTMENT_FOOTER_PASSCODE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPasscodeTitle:", v5);

  PKLocalizedPaymentString(CFSTR("PRIVACY_COVER_SHEET_AUTHENTICATION_REASON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReason:", v6);

  authenticator = self->_authenticator;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PKAuthorizationCoverSheetViewController__presentPasscodeToExitLockout__block_invoke;
  v8[3] = &unk_1E3E63240;
  objc_copyWeak(&v9, buf);
  v8[4] = self;
  -[PKAuthenticator evaluateRequest:withCompletion:](authenticator, "evaluateRequest:withCompletion:", v4, v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(buf);
}

void __72__PKAuthorizationCoverSheetViewController__presentPasscodeToExitLockout__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKAuthorizationCoverSheetViewController__presentPasscodeToExitLockout__block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __72__PKAuthorizationCoverSheetViewController__presentPasscodeToExitLockout__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "result"))
    {
      PKLogFacilityTypeGetObject();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Failed to exit lockout", v5, 2u);
      }

      v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1096));
      objc_msgSend(v4, "authorizationCoverSheetViewControllerDidCompleteWithSuccess:", 0);

    }
    else
    {
      objc_msgSend(WeakRetained, "startEvaluation");
    }
  }

}

- (void)_fallbackToPasscode
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Falling back to passcode", v4, 2u);
  }

  self->_hasPresentedPasscodePrompt = 1;
  if (self->_authenticating)
    -[PKAuthenticator fallbackToSystemPasscodeUI](self->_authenticator, "fallbackToSystemPasscodeUI");
  else
    -[PKAuthorizationCoverSheetViewController _presentPasscodeToExitLockout](self, "_presentPasscodeToExitLockout");
}

- (void)_transitionToState:(unint64_t)a3 animated:(BOOL)a4
{
  void *v5;
  _BOOL4 v6;
  _BOOL4 shouldDrawGlyph;
  int v8;
  _BOOL4 v9;
  int v10;
  int v11;
  unint64_t v12;
  void *v13;
  unint64_t currentState;
  _BOOL4 v16;
  _BOOL4 shouldUIBeShown;
  double v18;
  int v19;
  _BOOL4 v20;
  NSString **v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  PKGlyphView *glyphView;
  void *v39;
  id WeakRetained;
  void *v41;
  void *v42;
  id v43;
  int v44;
  unint64_t v45;
  id v46;
  id v47;
  id v48;
  int v50;
  _BOOL4 v51;
  int v52;
  uint64_t v53;
  int v54;
  _QWORD v55[4];
  id v56;
  char v57;
  id location;
  _QWORD aBlock[4];
  id v60;
  PKAuthorizationCoverSheetViewController *v61;
  id v62;
  id v63;

  if (self->_isInvalid)
    return;
  v5 = 0;
  v6 = 0;
  shouldDrawGlyph = self->_shouldDrawGlyph;
  v53 = 0;
  v51 = a4;
  v52 = 1;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v54 = 0;
  v11 = 0;
  v12 = a3;
  switch(a3)
  {
    case 0uLL:
      v5 = 0;
      v13 = 0;
      v53 = 0;
      v11 = 0;
      v54 = 0;
      v10 = 0;
      v52 = 0;
      v8 = 0;
      LOBYTE(v6) = 0;
      v9 = 1;
      v12 = 2;
      if (self->_shouldDrawGlyph)
        goto LABEL_44;
      goto LABEL_53;
    case 1uLL:
      goto LABEL_7;
    case 2uLL:
      v6 = 1;
LABEL_7:
      -[PKAuthorizationCoverSheetViewController _genericBiometricLabelAccessibilityLabel:](self, "_genericBiometricLabelAccessibilityLabel:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 1;
      -[PKAuthorizationCoverSheetViewController _genericBiometricLabelAccessibilityLabel:](self, "_genericBiometricLabelAccessibilityLabel:", 1);
      v53 = objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v13 = 0;
      v54 = 0;
      v10 = 0;
      v52 = 0;
      v8 = 0;
      v11 = v6;
      goto LABEL_12;
    case 3uLL:
      if (PKPearlIsAvailable())
        v12 = 4;
      else
        v12 = 0;
      -[PKAuthorizationCoverSheetViewController _genericBiometricLabelAccessibilityLabel:](self, "_genericBiometricLabelAccessibilityLabel:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 1;
      -[PKAuthorizationCoverSheetViewController _genericBiometricLabelAccessibilityLabel:](self, "_genericBiometricLabelAccessibilityLabel:", 1);
      v53 = objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v11 = 0;
      v54 = 0;
      v10 = 0;
      v52 = 0;
      v8 = 0;
LABEL_12:
      LOBYTE(v6) = 0;
      if (!shouldDrawGlyph)
        goto LABEL_53;
      goto LABEL_44;
    case 4uLL:
      if (PKPearlIsAvailable())
        v12 = 5;
      else
        v12 = 1;
      if (self->_currentState == 9)
      {
        -[PKAuthorizationCoverSheetViewController _genericBiometricFailureLabelAccessibilityLabel:](self, "_genericBiometricFailureLabelAccessibilityLabel:", 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 1;
        -[PKAuthorizationCoverSheetViewController _genericBiometricFailureLabelAccessibilityLabel:](self, "_genericBiometricFailureLabelAccessibilityLabel:", 1);
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = 0;
        if (!shouldDrawGlyph)
        {
          LOBYTE(v6) = 0;
          v8 = 0;
          v52 = 0;
          v10 = 0;
          v9 = 1;
          goto LABEL_53;
        }
        v13 = 0;
        v10 = 0;
        v9 = 1;
        v52 = 0;
        v8 = 0;
      }
      else
      {
        -[PKAuthorizationCoverSheetViewController _genericBiometricLabelAccessibilityLabel:](self, "_genericBiometricLabelAccessibilityLabel:", 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 1;
        -[PKAuthorizationCoverSheetViewController _genericBiometricLabelAccessibilityLabel:](self, "_genericBiometricLabelAccessibilityLabel:", 1);
        v53 = objc_claimAutoreleasedReturnValue();
        v11 = 0;
        if (!shouldDrawGlyph)
        {
          LOBYTE(v6) = 0;
          v8 = 0;
          v52 = 0;
          v10 = 0;
          v54 = 0;
          goto LABEL_53;
        }
        v13 = 0;
        v54 = 0;
        v10 = 0;
        v52 = 0;
        v8 = 0;
      }
LABEL_44:
      v6 = (objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForPolicy:", 10) & 6) != 0;
LABEL_45:
      if (!v13)
      {
LABEL_53:
        if ((PKPearlIsAvailable() & 1) != 0)
          PKLocalizedPearlString(CFSTR("PRIVACY_COVER_SHEET_SUBTITLE_PEARL"));
        else
          PKLocalizedPaymentString(CFSTR("PRIVACY_COVER_SHEET_SUBTITLE_TOUCH_ID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
          goto LABEL_47;
        goto LABEL_57;
      }
      if (!v6)
      {
LABEL_47:
        v45 = v12;
        v44 = v8;
        if (!v11)
        {
          shouldUIBeShown = 0;
          v50 = 0;
          v19 = 0;
          v18 = 0.0;
          if (v5)
            goto LABEL_60;
          goto LABEL_78;
        }
        v16 = 0;
        v50 = 0;
        shouldUIBeShown = self->_shouldUIBeShown;
        v18 = 0.0;
        goto LABEL_59;
      }
LABEL_57:
      v45 = v12;
      shouldUIBeShown = self->_shouldUIBeShown;
      v18 = (double)shouldUIBeShown;
      v50 = 1;
      v44 = v8;
      if ((v11 & 1) != 0)
      {
        v16 = self->_shouldUIBeShown;
LABEL_59:
        v19 = shouldUIBeShown;
        shouldUIBeShown = v16;
        if (v5)
          goto LABEL_60;
        goto LABEL_78;
      }
      v19 = 0;
      if (v5)
      {
LABEL_60:
        v20 = self->_shouldUIBeShown;
        if (!v9)
          goto LABEL_62;
        goto LABEL_61;
      }
LABEL_78:
      v20 = 0;
      if (v9)
LABEL_61:
        v9 = self->_shouldUIBeShown;
LABEL_62:
      v21 = (NSString **)MEMORY[0x1E0DC4A88];
      if (!v10)
        v21 = (NSString **)MEMORY[0x1E0DC4B60];
      PKFontForDefaultDesign(*v21, (NSString *)*MEMORY[0x1E0DC48C0]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__PKAuthorizationCoverSheetViewController__transitionToState_animated___block_invoke;
      aBlock[3] = &unk_1E3E62460;
      v48 = v5;
      v60 = v48;
      v61 = self;
      v47 = v13;
      v62 = v47;
      v46 = v22;
      v63 = v46;
      v23 = _Block_copy(aBlock);
      v24 = v23;
      if (v51 && self->_shouldUIBeShown)
      {
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v23, 0.25);
        -[PKGlyphView layer](self->_glyphView, "layer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "pkui_animateToOpacity:withCompletion:", 0, v18);

        v26 = 1048;
        -[UIButton layer](self->_enterPasscodeButton, "layer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "pkui_animateToOpacity:withCompletion:", 0, (double)v19);

        -[UILabel layer](self->_titleLabelView, "layer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "pkui_animateToOpacity:withCompletion:", 0, (double)v20);

        -[UILabel layer](self->_subtitleLabelView, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "pkui_animateToOpacity:withCompletion:", 0, (double)v9);
        v30 = 1;
      }
      else
      {
        (*((void (**)(void *))v23 + 2))(v23);
        -[PKGlyphView layer](self->_glyphView, "layer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v32 = (float)shouldUIBeShown;
        objc_msgSend(v31, "setOpacity:", v32);

        v26 = 1048;
        -[UIButton layer](self->_enterPasscodeButton, "layer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v34 = (float)v19;
        objc_msgSend(v33, "setOpacity:", v34);

        -[UILabel layer](self->_titleLabelView, "layer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v36 = (float)v20;
        objc_msgSend(v35, "setOpacity:", v36);

        -[UILabel layer](self->_subtitleLabelView, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v37 = (float)v9;
        objc_msgSend(v29, "setOpacity:", v37);
        v30 = 0;
      }

      if (!v50)
      {
        v39 = (void *)v53;
        if (v54)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "authorizationCoverSheetViewControllerDidCompleteWithSuccess:", 1);

        }
        goto LABEL_83;
      }
      if (v54)
        objc_msgSend(MEMORY[0x1E0D6BFF0], "invokeSuccessFeedback");
      objc_initWeak(&location, self);
      glyphView = self->_glyphView;
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __71__PKAuthorizationCoverSheetViewController__transitionToState_animated___block_invoke_2;
      v55[3] = &unk_1E3E62FC8;
      objc_copyWeak(&v56, &location);
      v57 = v54;
      -[PKGlyphView setState:animated:completionHandler:](glyphView, "setState:animated:completionHandler:", v45, v30, v55);
      v39 = (void *)v53;
      if (v44)
      {
        if ((PKPearlIsAvailable() & 1) != 0)
        {
          if ((v30 & 1) == 0)
            goto LABEL_82;
          goto LABEL_81;
        }
        AudioServicesPlaySystemSound(0x573u);
        v26 = 1056;
        if ((_DWORD)v30)
        {
LABEL_81:
          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v26), "layer");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD26F8], "pkui_shakeAnimation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (id)objc_msgSend(v41, "pkui_addAdditiveAnimation:", v42);

        }
      }
LABEL_82:
      objc_destroyWeak(&v56);
      objc_destroyWeak(&location);
LABEL_83:
      -[UIAccessibilityElement setAccessibilityLabel:](self->_textAccessibilityElement, "setAccessibilityLabel:", v39);
      if (v52)
      {
        if (!self->_hasPresentedPasscodePrompt)
          -[PKAuthorizationCoverSheetViewController _fallbackToPasscode](self, "_fallbackToPasscode");
      }
      self->_currentState = a3;

      return;
    case 5uLL:
      -[PKAuthorizationCoverSheetViewController _passcodeLabelAccessibilityLabel:](self, "_passcodeLabelAccessibilityLabel:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 1;
      -[PKAuthorizationCoverSheetViewController _passcodeLabelAccessibilityLabel:](self, "_passcodeLabelAccessibilityLabel:", 1);
      v53 = objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v13 = 0;
      v54 = 0;
      v10 = 0;
      v8 = 0;
      LOBYTE(v6) = 0;
      v9 = 1;
      v52 = 1;
      if (!shouldDrawGlyph)
        goto LABEL_53;
      goto LABEL_44;
    case 6uLL:
      goto LABEL_53;
    case 7uLL:
      v5 = 0;
      v13 = 0;
      v53 = 0;
      v11 = 0;
      v10 = 0;
      v9 = 0;
      v52 = 0;
      v8 = 0;
      LOBYTE(v6) = 0;
      if (PKPearlIsAvailable())
        v12 = 5;
      else
        v12 = 1;
      v54 = 1;
      if (!shouldDrawGlyph)
        goto LABEL_53;
      goto LABEL_44;
    case 8uLL:
      LOBYTE(v6) = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v53 = 0;
      v5 = 0;
      v52 = 1;
      v12 = 6;
      v54 = 1;
      goto LABEL_53;
    case 9uLL:
      if (PKPearlIsAvailable())
        v12 = 3;
      else
        v12 = 0;
      -[PKAuthorizationCoverSheetViewController _genericBiometricFailureLabelAccessibilityLabel:](self, "_genericBiometricFailureLabelAccessibilityLabel:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 1;
      -[PKAuthorizationCoverSheetViewController _genericBiometricFailureLabelAccessibilityLabel:](self, "_genericBiometricFailureLabelAccessibilityLabel:", 1);
      v53 = objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("PRIVACY_COVER_SHEET_PASSCODE_REQUIRED_TEXT"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      currentState = self->_currentState;
      if (currentState != 4 && currentState != 1)
        goto LABEL_38;
      v54 = 0;
      v52 = 0;
      v6 = 0;
      v11 = 1;
      v10 = 1;
      v9 = 1;
      v8 = 1;
      if (!shouldDrawGlyph)
        goto LABEL_45;
      goto LABEL_44;
    case 0xAuLL:
      -[PKAuthorizationCoverSheetViewController _genericBiometricUnavailableLabelAccessibilityLabel:](self, "_genericBiometricUnavailableLabelAccessibilityLabel:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 1;
      -[PKAuthorizationCoverSheetViewController _genericBiometricUnavailableLabelAccessibilityLabel:](self, "_genericBiometricUnavailableLabelAccessibilityLabel:", 1);
      v53 = objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v13 = 0;
      v54 = 0;
      v10 = 0;
      v52 = 0;
      v8 = 0;
      LOBYTE(v6) = 0;
      v9 = 1;
      if (!shouldDrawGlyph)
        goto LABEL_53;
      goto LABEL_44;
    default:
      v12 = 6;
      v13 = 0;
LABEL_38:
      v54 = 0;
      v52 = 0;
      v8 = 0;
      v9 = 1;
      v11 = v6;
      v10 = v6;
      v6 = 0;
      if (!shouldDrawGlyph)
        goto LABEL_45;
      goto LABEL_44;
  }
}

void __71__PKAuthorizationCoverSheetViewController__transitionToState_animated___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1056), "setText:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "setText:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "setFont:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "view");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

  }
}

void __71__PKAuthorizationCoverSheetViewController__transitionToState_animated___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_BYTE *)(a1 + 40))
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 137);
    objc_msgSend(v3, "authorizationCoverSheetViewControllerDidCompleteWithSuccess:", 1);

    WeakRetained = v4;
  }

}

- (id)_genericBiometricLabelAccessibilityLabel:(BOOL)a3
{
  _BOOL4 v3;
  char IsAvailable;
  __CFString *v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  IsAvailable = PKPearlIsAvailable();
  if (!v3)
  {
    if ((IsAvailable & 1) != 0)
    {
      v5 = CFSTR("GENERIC_PEARL");
      goto LABEL_6;
    }
    v7 = CFSTR("GENERIC_TOUCH_ID");
LABEL_9:
    PKLocalizedPaymentString(&v7->isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if ((IsAvailable & 1) == 0)
  {
    v7 = CFSTR("PRIVACY_COVER_SHEET_TOUCH_ID_ACCESSIBILITY_TEXT");
    goto LABEL_9;
  }
  v5 = CFSTR("PRIVACY_COVER_SHEET_PEARL_ACCESSIBILITY_TEXT");
LABEL_6:
  PKLocalizedPearlString(&v5->isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)_passcodeLabelAccessibilityLabel:(BOOL)a3
{
  __CFString *v3;

  if (a3)
    v3 = CFSTR("PRIVACY_COVER_SHEET_PASSCODE_ACCESSIBILITY_TEXT");
  else
    v3 = CFSTR("PAYMENT_ERROR_NO_TOUCH_ID_OR_PASSCODE");
  PKLocalizedPaymentString(&v3->isa);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_genericBiometricFailureLabelAccessibilityLabel:(BOOL)a3
{
  _BOOL4 v3;
  char IsAvailable;
  __CFString *v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  IsAvailable = PKPearlIsAvailable();
  if (!v3)
  {
    if ((IsAvailable & 1) != 0)
    {
      v5 = CFSTR("GENERIC_PEARL_FAILURE");
      goto LABEL_6;
    }
    v7 = CFSTR("GENERIC_TOUCH_ID_FAILURE");
LABEL_9:
    PKLocalizedPaymentString(&v7->isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if ((IsAvailable & 1) == 0)
  {
    v7 = CFSTR("PRIVACY_COVER_SHEET_TOUCH_ID_FAILURE_ACCESSIBILITY_TEXT");
    goto LABEL_9;
  }
  v5 = CFSTR("PRIVACY_COVER_SHEET_PEARL_FAILURE_ACCESSIBILITY_TEXT");
LABEL_6:
  PKLocalizedPearlString(&v5->isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)_genericBiometricUnavailableLabelAccessibilityLabel:(BOOL)a3
{
  _BOOL4 v3;
  char IsAvailable;
  __CFString *v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  IsAvailable = PKPearlIsAvailable();
  if (!v3)
  {
    if ((IsAvailable & 1) != 0)
    {
      v5 = CFSTR("GENERIC_PEARL_UNAVAILABLE");
      goto LABEL_6;
    }
    v7 = CFSTR("GENERIC_TOUCH_ID_UNAVAILABLE");
LABEL_9:
    PKLocalizedPaymentString(&v7->isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if ((IsAvailable & 1) == 0)
  {
    v7 = CFSTR("PRIVACY_COVER_SHEET_TOUCH_ID_UNAVAILABLE_ACCESSIBILITY_TEXT");
    goto LABEL_9;
  }
  v5 = CFSTR("PRIVACY_COVER_SHEET_PEARL_UNAVAILABLE_ACCESSIBILITY_TEXT");
LABEL_6:
  PKLocalizedPearlString(&v5->isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (void)_animateInPasscodeViewController
{
  _BOOL4 isWaitingForPasscodeUI;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void (**performSynchronizedFadeInAnimationBlock)(void);
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;
  BOOL v18;
  id location;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  isWaitingForPasscodeUI = self->_isWaitingForPasscodeUI;
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKAuthorizationCoverSheetViewController__animateInPasscodeViewController__block_invoke;
  aBlock[3] = &unk_1E3E61C08;
  objc_copyWeak(&v17, &location);
  v18 = isWaitingForPasscodeUI;
  v5 = _Block_copy(aBlock);
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Yes");
    if (!isWaitingForPasscodeUI)
      v7 = CFSTR("No");
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Presenting passcode VC fadeIn: %@", buf, 0xCu);
  }

  if (isWaitingForPasscodeUI)
  {
    -[UIViewController view](self->_passcodeViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 0;
    objc_msgSend(v9, "setOpacity:", v10);
    -[PKAuthorizationCoverSheetViewController addChildViewController:](self, "addChildViewController:", self->_passcodeViewController);
    -[PKAuthorizationCoverSheetViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v8);

    -[UIViewController didMoveToParentViewController:](self->_passcodeViewController, "didMoveToParentViewController:", self);
    objc_msgSend(v8, "setNeedsLayout");
    objc_msgSend(v8, "layoutIfNeeded");
    performSynchronizedFadeInAnimationBlock = (void (**)(void))self->_performSynchronizedFadeInAnimationBlock;
    if (performSynchronizedFadeInAnimationBlock)
    {
      performSynchronizedFadeInAnimationBlock[2]();
      v13 = self->_performSynchronizedFadeInAnimationBlock;
      self->_performSynchronizedFadeInAnimationBlock = 0;

    }
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __75__PKAuthorizationCoverSheetViewController__animateInPasscodeViewController__block_invoke_83;
    v14[3] = &unk_1E3E614F0;
    v15 = v5;
    objc_msgSend(v9, "pkui_animateToOpacity:withCompletion:", v14, 1.0);

  }
  else
  {
    -[PKAuthorizationCoverSheetViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_passcodeViewController, 1, v5);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __75__PKAuthorizationCoverSheetViewController__animateInPasscodeViewController__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *((_QWORD *)WeakRetained + 128);
    v6 = v3;
    if (v4)
    {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
      v5 = (void *)*((_QWORD *)v6 + 128);
      *((_QWORD *)v6 + 128) = 0;

      v3 = v6;
    }
    if (*(_BYTE *)(a1 + 40))
      v3[1016] = 0;
    objc_msgSend(v3, "_transitionToState:animated:", 6, 1);
    v3 = v6;
  }

}

uint64_t __75__PKAuthorizationCoverSheetViewController__animateInPasscodeViewController__block_invoke_83(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1;
  int64_t var0;
  BOOL v7;
  unint64_t currentState;
  id WeakRetained;
  NSObject *v11;
  int v12;
  int64_t v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_authenticating)
  {
    var1 = a4.var1;
    var0 = a4.var0;
    if (PKPearlIsAvailable())
      v7 = (unint64_t)(self->_coachingState - 3) < 2;
    else
      v7 = 0;
    switch(var0)
    {
      case 0:
        if (var1 == 3)
          v7 = 1;
        if (v7)
        {
          if (var1 != 3)
            goto LABEL_25;
          currentState = 10;
        }
        else
        {
          if (self->_hasAttemptedBiometricAuth || (unint64_t)(var1 - 1) < 2)
            goto LABEL_25;
          currentState = self->_currentState;
          if (currentState == 3)
          {
            currentState = 2;
            goto LABEL_27;
          }
          if (currentState != 6)
            goto LABEL_15;
        }
        break;
      case 1:
        currentState = 3;
        break;
      case 2:
        self->_hasAttemptedBiometricAuth = 1;
        currentState = 4;
        break;
      case 3:
        if (self->_currentState == 9)
        {
LABEL_25:
          currentState = 9;
          goto LABEL_27;
        }
LABEL_15:
        currentState = 1;
        break;
      case 4:
        if (self->_currentState == 6)
        {
          currentState = 6;
        }
        else
        {
          currentState = 5;
LABEL_27:
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "authorizationCoverSheetViewControllerDidGetBiometricUnavailableOrFailure");

        }
        break;
      case 5:
        if (self->_currentState == 6)
          currentState = 8;
        else
          currentState = 7;
        break;
      default:
        currentState = 0;
        break;
    }
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218496;
      v13 = var0;
      v14 = 2048;
      v15 = var1;
      v16 = 2048;
      v17 = currentState;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Evaluating authenticator state %lu - %lu and  transitioning to state %lu", (uint8_t *)&v12, 0x20u);
    }

    -[PKAuthorizationCoverSheetViewController _transitionToState:animated:](self, "_transitionToState:animated:", currentState, 1);
  }
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t);
  id v11;
  NSObject *v12;
  void *v13;
  id showPasscodeUICompletion;
  uint8_t v15[16];

  v9 = a3;
  v10 = (void (**)(id, uint64_t))a4;
  v11 = a5;
  if (self->_passcodeViewController)
  {
    if (v10)
      v10[2](v10, 1);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: requested passcode presentation", v15, 2u);
    }

    objc_storeStrong((id *)&self->_passcodeViewController, a3);
    -[UIViewController setModalPresentationStyle:](self->_passcodeViewController, "setModalPresentationStyle:", 5);
    v13 = _Block_copy(v10);
    showPasscodeUICompletion = self->_showPasscodeUICompletion;
    self->_showPasscodeUICompletion = v13;

    if (self->_shouldUIBeShown)
      -[PKAuthorizationCoverSheetViewController _animateInPasscodeViewController](self, "_animateInPasscodeViewController");
  }

}

- (void)dismissPasscodeViewController
{
  NSObject *v3;
  void *v4;
  UIViewController *passcodeViewController;
  void *v6;
  void *v7;
  UIViewController *v8;
  uint8_t v9[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Dismissing passcode view controller", v9, 2u);
  }

  -[UIViewController parentViewController](self->_passcodeViewController, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  passcodeViewController = self->_passcodeViewController;
  if (v4)
  {
    -[UIViewController view](passcodeViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[UIViewController removeFromParentViewController](self->_passcodeViewController, "removeFromParentViewController");
    -[UIViewController didMoveToParentViewController:](self->_passcodeViewController, "didMoveToParentViewController:", 0);
  }
  else
  {
    -[UIViewController presentingViewController](passcodeViewController, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  v8 = self->_passcodeViewController;
  self->_passcodeViewController = 0;

}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
  self->_coachingState = a4;
}

- (BOOL)isErrorRecovery
{
  return self->_isErrorRecovery;
}

- (void)setIsErrorRecovery:(BOOL)a3
{
  self->_isErrorRecovery = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeViewController, 0);
  objc_storeStrong((id *)&self->_passcodeAccessibilityElement, 0);
  objc_storeStrong((id *)&self->_textAccessibilityElement, 0);
  objc_storeStrong((id *)&self->_subtitleLabelView, 0);
  objc_storeStrong((id *)&self->_titleLabelView, 0);
  objc_storeStrong((id *)&self->_enterPasscodeButton, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong(&self->_performSynchronizedFadeInAnimationBlock, 0);
  objc_storeStrong(&self->_showPasscodeUICompletion, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
}

@end
