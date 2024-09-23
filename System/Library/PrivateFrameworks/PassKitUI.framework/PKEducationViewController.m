@implementation PKEducationViewController

+ (BOOL)shouldPresentForPass:(id)a3 inEducationContext:(unint64_t)a4
{
  return objc_msgSend(a1, "shouldPresentForPass:inEducationContext:reason:", a3, a4, 0);
}

+ (BOOL)shouldPresentForPass:(id)a3 inEducationContext:(unint64_t)a4 reason:(id *)a5
{
  id v7;
  char v8;
  BOOL v9;
  __CFString *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;

  v7 = a3;
  v8 = PKForceCardEducation();
  v9 = 1;
  if (!a4 && (v8 & 1) == 0)
  {
    if (PKHasSeenApplePayEducation())
    {
      if (a5)
      {
        v10 = CFSTR("user has already seen education");
LABEL_20:
        v9 = 0;
        *a5 = v10;
        goto LABEL_30;
      }
    }
    else
    {
      v11 = PKIsPhone();
      if ((v11 & 1) != 0 || PKIsPad() && (PKPearlIsAvailable() & 1) != 0)
      {
        if (objc_msgSend(v7, "isTransitPass"))
        {
          if (a5)
          {
            v10 = CFSTR("pass is transit pass");
            goto LABEL_20;
          }
        }
        else if (objc_msgSend(v7, "isAccessPass"))
        {
          if (a5)
          {
            v10 = CFSTR("pass is access pass");
            goto LABEL_20;
          }
        }
        else if (objc_msgSend(v7, "isAppleBalancePass"))
        {
          if (a5)
          {
            v10 = CFSTR("pass is apple balance");
            goto LABEL_20;
          }
        }
        else
        {
          if (!v11)
            goto LABEL_26;
          objc_msgSend(v7, "devicePrimaryContactlessPaymentApplication");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            if (a5)
            {
              v10 = CFSTR("pass doesn't support contactless transaction");
              goto LABEL_20;
            }
            goto LABEL_29;
          }
          objc_msgSend(v7, "issuerCountryCode");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("JP"));

          if (!v14)
          {
LABEL_26:
            v9 = 1;
            goto LABEL_30;
          }
          if (a5)
          {
            v10 = CFSTR("pass has Japan issuer");
            goto LABEL_20;
          }
        }
      }
      else if (a5)
      {
        v10 = CFSTR("device does not have expected biometric authentication type");
        goto LABEL_20;
      }
    }
LABEL_29:
    v9 = 0;
  }
LABEL_30:

  return v9;
}

+ (id)assetBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.843137255, 0.843137255, 0.843137255, 1.0);
}

+ (id)assetBackgroundColorPad
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.831372549, 0.831372549, 0.831372549, 1.0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PKEducationViewController)init
{
  return -[PKEducationViewController initWithPaymentPass:setupContext:educationContext:](self, "initWithPaymentPass:setupContext:educationContext:", 0, 0, 0);
}

- (PKEducationViewController)initWithPaymentPass:(id)a3 setupContext:(int64_t)a4 educationContext:(unint64_t)a5
{
  id v9;
  PKEducationViewController *v10;
  PKEducationViewController *v11;
  int IsAvailable;
  unint64_t biometricAuthenticationType;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKEducationViewController;
  v10 = -[PKExplanationViewController initWithContext:](&v17, sel_initWithContext_, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_paymentPass, a3);
    v11->_educationContext = a5;
    IsAvailable = PKPearlIsAvailable();
    biometricAuthenticationType = v11->_biometricAuthenticationType;
    if (IsAvailable)
    {
      v14 = biometricAuthenticationType | 2;
    }
    else
    {
      if (biometricAuthenticationType)
      {
LABEL_7:
        -[PKEducationViewController navigationItem](v11, "navigationItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setHidesBackButton:animated:", 1, 0);

        -[PKExplanationViewController setShowDoneButton:](v11, "setShowDoneButton:", 0);
        -[PKExplanationViewController setShowCancelButton:](v11, "setShowCancelButton:", 0);
        goto LABEL_8;
      }
      v14 = 1;
    }
    v11->_biometricAuthenticationType = v14;
    goto LABEL_7;
  }
LABEL_8:

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[PKEducationViewController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKEducationViewController;
  -[PKEducationViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  _BOOL4 v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  PKEducationPhone *v7;
  PKEducationPhone *educationBodyView;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t biometricAuthenticationType;
  id v15;
  void *v16;
  void *v17;
  NSUInteger v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIView *v24;
  UIView *largeLayoutHeroBackground;
  UIView *v26;
  void *v27;
  id v28;
  void *v29;
  UIImageView *v30;
  UIImageView *largeLayoutHeroImageView;
  void *v32;
  uint64_t v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  PKSecureElementPass *paymentPass;
  void *v43;
  void *v44;
  void *v45;
  PKEducationPhone *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  _QWORD v58[5];
  objc_super v59;
  _QWORD v60[2];
  _QWORD v61[2];
  uint64_t v62;
  _QWORD v63[2];

  v63[1] = *MEMORY[0x1E0C80C00];
  v59.receiver = self;
  v59.super_class = (Class)PKEducationViewController;
  -[PKExplanationViewController loadView](&v59, sel_loadView);
  v3 = -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  if (v3)
  {
    -[PKEducationViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom") != 6;

  }
  else
  {
    v5 = 0;
  }
  -[PKExplanationViewController explanationView](self, "explanationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setShowPrivacyView:", 0);
  v7 = objc_alloc_init(PKEducationPhone);
  educationBodyView = self->_educationBodyView;
  self->_educationBodyView = v7;

  if (self->_educationContext)
  {
    if (v3)
      goto LABEL_26;
    goto LABEL_23;
  }
  PKLocalizedPaymentString(CFSTR("APPLE_PAY_EDUCATION_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleText:", v9);

  objc_msgSend(v6, "setTitleImage:", 0);
  v56 = *MEMORY[0x1E0DC1140];
  v62 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("APPLE_PAY_EDUCATION"));
  v13 = v12;
  biometricAuthenticationType = self->_biometricAuthenticationType;
  if ((biometricAuthenticationType & 1) != 0)
  {
    objc_msgSend(v12, "appendString:", CFSTR("_TOUCH_ID"));
    if (!v5)
      goto LABEL_13;
  }
  else
  {
    if ((biometricAuthenticationType & 2) == 0)
      goto LABEL_13;
    objc_msgSend(v12, "appendString:", CFSTR("_FACE_ID"));
    if (!v5)
      goto LABEL_13;
  }
  objc_msgSend(v13, "appendString:", CFSTR("_PAD"));
LABEL_13:
  v15 = objc_alloc(MEMORY[0x1E0CB3778]);
  PKLocalizedPaymentString((NSString *)v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", v16, v11);

  v18 = -[NSString length](self->_bodyAddition, "length");
  v19 = objc_alloc(MEMORY[0x1E0CB3498]);
  v20 = v19;
  if (v18)
  {
    v21 = (void *)objc_msgSend(v19, "initWithString:attributes:", self->_bodyAddition, v11);
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("APPLE_PAY_EDUCATION_STRING_SUFFIX"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "initWithString:attributes:", v22, v11);

  }
  v23 = (void *)v11;
  objc_msgSend(v17, "appendAttributedString:", v21);

  if (v3)
  {
    v24 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    largeLayoutHeroBackground = self->_largeLayoutHeroBackground;
    self->_largeLayoutHeroBackground = v24;

    v26 = self->_largeLayoutHeroBackground;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v27);

    v28 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[PKEducationViewController _heroPadImage](self, "_heroPadImage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (UIImageView *)objc_msgSend(v28, "initWithImage:", v29);
    largeLayoutHeroImageView = self->_largeLayoutHeroImageView;
    self->_largeLayoutHeroImageView = v30;

    -[UIImageView setContentMode:](self->_largeLayoutHeroImageView, "setContentMode:", 1);
    v23 = (void *)v11;
    -[UIView addSubview:](self->_largeLayoutHeroBackground, "addSubview:", self->_largeLayoutHeroImageView);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTopBackgroundColor:", v32);

    objc_msgSend(v6, "setTopMargin:", 44.0);
    objc_msgSend(v6, "setHeroView:", self->_largeLayoutHeroBackground);
  }
  else
  {
    objc_msgSend(v6, "setBodyView:", self->_educationBodyView);
    objc_msgSend(v6, "setHeroView:", 0);
    objc_msgSend(v6, "setImage:", 0);
    objc_msgSend(v6, "setBodyViewPadding:", 0.0);
    v33 = PKUIGetMinScreenWidthType();
    v34 = 20.0;
    if (!v33)
      v34 = 0.0;
    objc_msgSend(v6, "setTopLogoPadding:", v34);
    -[PKExplanationViewController context](self, "context");
    if ((PKPaymentSetupContextIsSetupAssistant() & 1) == 0)
    {
      v55 = objc_alloc(MEMORY[0x1E0CB3498]);
      PKLocalizedPaymentString(CFSTR("LEARN_MORE_LINK"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v56;
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v57 = v13;
      v36 = (void *)v11;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v37;
      v60[1] = *MEMORY[0x1E0DC1160];
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/HT201239"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v61[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)objc_msgSend(v55, "initWithString:attributes:", v35, v39);

      v23 = v36;
      v13 = v57;

      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v23);
      objc_msgSend(v17, "appendAttributedString:", v40);

      objc_msgSend(v17, "appendAttributedString:", v54);
    }
  }
  v41 = (void *)objc_msgSend(v17, "copy", v54);
  objc_msgSend(v6, "setAttributedBodyText:", v41);

  if (!v3)
  {
LABEL_23:
    paymentPass = self->_paymentPass;
    if (paymentPass)
    {
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __37__PKEducationViewController_loadView__block_invoke;
      v58[3] = &unk_1E3E612E8;
      v58[4] = self;
      -[PKSecureElementPass loadContentAsyncWithCompletion:](paymentPass, "loadContentAsyncWithCompletion:", v58);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D67138], "defaultImages");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "pk_shuffledArray");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = self->_educationBodyView;
      v47 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v45, "imageWithScale:", PKUIScreenScale());
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "imageWithData:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKEducationPhone setPassImage:](v46, "setPassImage:", v49);

    }
  }
LABEL_26:
  objc_msgSend(v6, "dockView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "primaryButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("CONTINUE"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setTitle:forState:", v52, 0);

  objc_msgSend(v50, "footerView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setSkipCardButton:", 0);
  objc_msgSend(v53, "setSetupLaterButton:", 0);
  objc_msgSend(v53, "setManualEntryButton:", 0);

}

uint64_t __37__PKEducationViewController_loadView__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1056);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__PKEducationViewController_loadView__block_invoke_2;
  v4[3] = &unk_1E3E612E8;
  v4[4] = v1;
  return objc_msgSend(v2, "loadImageSetAsync:preheat:withCompletion:", 0, 1, v4);
}

void __37__PKEducationViewController_loadView__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PKEducationViewController_loadView__block_invoke_3;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __37__PKEducationViewController_loadView__block_invoke_3(uint64_t a1)
{
  void *v2;
  PKPassView *v3;

  v3 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056), 5, 887);
  -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v3, "snapshotOfFrontFaceWithRequestedSize:", 220.0, 134.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setPassImage:", v2);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double Width;
  double v7;
  UIImageView *largeLayoutHeroImageView;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)PKEducationViewController;
  -[PKExplanationViewController viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  if (self->_largeLayoutHeroBackground && self->_largeLayoutHeroImageView)
  {
    -[PKEducationViewController traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") != 6)
    {
      -[PKEducationViewController traitCollection](self, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "verticalSizeClass");

    }
    -[PKEducationViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    Width = CGRectGetWidth(v10);

    -[UIImageView frame](self->_largeLayoutHeroImageView, "frame");
    PKSizeAspectFit();
    -[UIView setFrame:](self->_largeLayoutHeroBackground, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), Width, v7);
    PKContentAlignmentMake();
    largeLayoutHeroImageView = self->_largeLayoutHeroImageView;
    -[UIView bounds](self->_largeLayoutHeroBackground, "bounds");
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](largeLayoutHeroImageView, "setFrame:");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  dispatch_time_t v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKEducationViewController;
  -[PKEducationViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
  v4 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PKEducationViewController_viewDidAppear___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

uint64_t __43__PKEducationViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "startAnimation");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKEducationViewController;
  -[PKEducationViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[PKEducationViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEducationViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    objc_msgSend(v5, "leftBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      objc_msgSend(v5, "rightBarButtonItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        self->_wasNavigationBarHidden = objc_msgSend(v4, "isNavigationBarHidden");
        objc_msgSend(v4, "setNavigationBarHidden:", 1);
        -[PKExplanationViewController explanationView](self, "explanationView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = 20.0;
        goto LABEL_6;
      }
    }
  }
  -[PKExplanationViewController explanationView](self, "explanationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 0.0;
LABEL_6:
  objc_msgSend(v8, "setTopMargin:", v10);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKEducationViewController;
  -[PKEducationViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (!-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKEducationViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNavigationBarHidden:", self->_wasNavigationBarHidden);

  }
}

- (BOOL)suppressFieldDetect
{
  return 1;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  reporter = self->_reporter;
  v6 = *MEMORY[0x1E0D69418];
  v7[0] = *MEMORY[0x1E0D69420];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:context:](reporter, "reportButtonPressed:context:", 0, v5);

  -[PKEducationViewController performContinue](self, "performContinue");
}

- (void)performContinue
{
  void (**v3)(void *, _QWORD *);
  id continueHandler;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = (void (**)(void *, _QWORD *))_Block_copy(self->_continueHandler);
  continueHandler = self->_continueHandler;
  self->_continueHandler = 0;

  if (v3)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__PKEducationViewController_performContinue__block_invoke;
    v5[3] = &unk_1E3E61310;
    objc_copyWeak(&v6, &location);
    v3[2](v3, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKEducationViewController invalidate](self, "invalidate");
  }

}

void __44__PKEducationViewController_performContinue__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "invalidate");
    WeakRetained = v2;
  }

}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  PKEducationViewController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134349056;
      v5 = self;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKFieldDetectEducationViewController (%{public}p): invalidated.", (uint8_t *)&v4, 0xCu);
    }

    self->_invalidated = 1;
  }
}

- (id)_heroPadImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("EducationPad"));
  v4 = v3;
  if ((self->_biometricAuthenticationType & 2) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("-FaceID"));
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("-Dark"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKUIDynamicImageNamed(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a3;
  -[PKEducationViewController view](self, "view", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4 ^ 1);

  -[PKExplanationViewController showSpinner:](self, "showSpinner:", v4);
}

- (id)continueHandler
{
  return self->_continueHandler;
}

- (void)setContinueHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (NSString)titleOverride
{
  return self->_titleOverride;
}

- (void)setTitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (NSString)bodyAddition
{
  return self->_bodyAddition;
}

- (void)setBodyAddition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
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
  objc_storeStrong((id *)&self->_bodyAddition, 0);
  objc_storeStrong((id *)&self->_titleOverride, 0);
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_educationBodyView, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_largeLayoutHeroImageView, 0);
  objc_storeStrong((id *)&self->_largeLayoutHeroBackground, 0);
  objc_storeStrong((id *)&self->_heroImageController, 0);
}

@end
