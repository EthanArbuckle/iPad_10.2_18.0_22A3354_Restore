@implementation PKPaymentSetupHeroViewController

- (PKPaymentSetupHeroViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 delegate:(id)a5 product:(id)a6 allowsManualEntry:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  PKPaymentSetupHeroViewController *v16;
  PKPaymentSetupHeroViewController *v17;
  ACAccountStore *v18;
  ACAccountStore *accountStore;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *deviceRegion;
  void *v24;
  uint64_t v25;
  PKPaymentHeroImageController *heroImageController;
  void *v27;
  void *v28;
  char v29;
  char v30;
  objc_super v32;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v32.receiver = self;
  v32.super_class = (Class)PKPaymentSetupHeroViewController;
  v16 = -[PKExplanationViewController initWithContext:](&v32, sel_initWithContext_, a4);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_provisioningController, a3);
    v18 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v17->_accountStore;
    v17->_accountStore = v18;

    objc_storeWeak((id *)&v17->_delegate, v14);
    v17->_allowsManualEntry = a7;
    v17->_paymentSetupMode = 0;
    objc_storeStrong((id *)&v17->_product, a6);
    -[PKPaymentSetupHeroViewController webService](v17, "webService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "targetDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deviceRegion");
    v22 = objc_claimAutoreleasedReturnValue();
    deviceRegion = v17->_deviceRegion;
    v17->_deviceRegion = (NSString *)v22;

    objc_msgSend(MEMORY[0x1E0D67140], "manifestForRegion:", v17->_deviceRegion);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67138]), "initWithManifest:webService:", v24, v20);
    heroImageController = v17->_heroImageController;
    v17->_heroImageController = (PKPaymentHeroImageController *)v25;

    -[PKExplanationViewController context](v17, "context");
    if (PKPaymentSetupContextIsBridge())
      -[PKPaymentHeroImageController setWatchSize:](v17->_heroImageController, "setWatchSize:", +[PKBridgeWatchAttributeController heroWatchSize](PKBridgeWatchAttributeController, "heroWatchSize"));
    -[PKExplanationViewController explanationView](v17, "explanationView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17->_showPaymentCardTitle)
      PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_CREDIT_DEBIT"));
    else
      -[PKPaymentSetupProduct displayName](v17->_product, "displayName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTitleText:", v28);

    objc_msgSend(v27, "setTitleAccessoriesEnabled:", 0);
    objc_msgSend(v27, "setDelegate:", v17);
    v29 = objc_opt_respondsToSelector();
    v30 = 0;
    if ((v29 & 1) != 0)
      v30 = objc_msgSend(v21, "felicaSecureElementIsAvailable");
    v17->_hasFelicaSecureElement = v30;

  }
  return v17;
}

- (void)loadView
{
  int64_t v3;
  NSArray *featuredImages;
  NSArray *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  void *v9;
  PKPaymentSetupHeroView *v10;
  PKPaymentSetupHeroView *splashView;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupHeroViewController;
  -[PKExplanationViewController loadView](&v15, sel_loadView);
  -[PKPaymentSetupHeroViewController _configureDock](self, "_configureDock");
  v3 = -[PKExplanationViewController context](self, "context");
  featuredImages = self->_featuredImages;
  if (featuredImages && -[NSArray count](featuredImages, "count"))
  {
    v5 = self->_featuredImages;
  }
  else
  {
    -[PKPaymentHeroImageController featuredImages](self->_heroImageController, "featuredImages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[PKPaymentHeroImageController featuredDefaultImages](self->_heroImageController, "featuredDefaultImages");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  -[PKPaymentHeroImageController filterImages:](self->_heroImageController, "filterImages:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKPaymentSetupHeroView initWithContext:heroImageController:heroImages:product:]([PKPaymentSetupHeroView alloc], "initWithContext:heroImageController:heroImages:product:", v3, self->_heroImageController, v9, self->_product);
  splashView = self->_splashView;
  self->_splashView = v10;

  -[PKExplanationViewController explanationView](self, "explanationView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHeroView:", self->_splashView);
  if ((PKPearlIsAvailable() & 1) != 0
    || -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    +[PKPaymentSetupHeroView assetBackgroundColor](PKPaymentSetupHeroView, "assetBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTopBackgroundColor:", v13);

  }
  -[PKPaymentSetupHeroViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68040]);

}

- (void)_configureDock
{
  uint64_t IsSetupAssistant;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  PKPaymentSetupProduct *product;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  PKPaymentSetupProduct *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PKMultiHyperlinkView *v30;
  PKTextRangeHyperlink *v31;
  PKTextRangeHyperlink *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id location;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  -[PKExplanationViewController explanationView](self, "explanationView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController context](self, "context");
  IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  objc_msgSend(v37, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequiresAdditionalPrimaryButtonPadding:", IsSetupAssistant);
  objc_msgSend(v38, "setManualEntryButton:", 0);
  if ((_DWORD)IsSetupAssistant)
    objc_msgSend(v38, "setSkipCardButton:", 0);
  if (self->_allowsManualEntry
    && -[PKPaymentSetupHeroViewController _readerModeIsSupported](self, "_readerModeIsSupported"))
  {
    if (self->_showSouthKoreaPrivacyDisclosure)
      v5 = CFSTR("SETUP_PURCHASE_TRANSFER_BALANCE_MESSAGE_SOUTH_KOREA");
    else
      v5 = CFSTR("SETUP_PURCHASE_TRANSFER_BALANCE_MESSAGE");
    PKLocalizedPaymentString(&v5->isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "secondaryActionButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v6, 0);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__transferExistingCardTapped, 0x2000);

  }
  product = self->_product;
  if (product)
  {
    -[PKPaymentSetupProduct configuration](product, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "type");

    v11 = v10 - 3;
  }
  else
  {
    v11 = -3;
  }
  if (self->_hidePrivacyView)
    -[PKExplanationViewController setPrivacyLinkController:](self, "setPrivacyLinkController:", 0);
  if (v11 < 2)
  {
    v12 = 8;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationViewController setPrivacyLinkController:](self, "setPrivacyLinkController:", v15);

    goto LABEL_20;
  }
  if ((PKPaymentSetupContextIsNonExpressSetupAssistant() & 1) != 0
    || (-[PKPaymentProvisioningController associatedCredentials](self->_provisioningController, "associatedCredentials"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "count"),
        v13,
        v14))
  {
    v12 = 255;
    goto LABEL_19;
  }
  if (PKPaymentSetupContextIsIssuerApp())
  {
    v12 = 9;
    goto LABEL_19;
  }
LABEL_20:
  if (self->_showChinaPrivacyDisclosure)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v16, "setLineBreakMode:", 0);
    objc_msgSend(v16, "setAlignment:", 1);
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v18, *MEMORY[0x1E0DC1138]);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v19, *MEMORY[0x1E0DC1140]);

    objc_msgSend(v17, "setObject:forKey:", v16, *MEMORY[0x1E0DC1178]);
    v20 = objc_alloc(MEMORY[0x1E0CB3498]);
    PKLocalizedPaymentString(CFSTR("APPLE_PAY_DESCRIPTION_CHINA_PHONE_NUMBER"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithString:attributes:", v21, v17);

    objc_msgSend(v37, "setAttributedSecondaryBodyText:", v22);
  }
  v23 = self->_product;
  v24 = PKIsChinaSKU();
  if (self->_showSouthKoreaPrivacyDisclosure)
  {
    PKLocalizedPaymentString(CFSTR("CONTINUE_SOUTH_KOREA"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTitle:forState:", v25, 0);

    PKLocalizedPaymentString(CFSTR("HERO_SOUTH_KOREA_PRIVACY_LABEL"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("HERO_SOUTH_KOREA_PRIVACY_HYPERLINK"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PKStringWithValidatedFormat();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc_init(PKMultiHyperlinkView);
    -[PKMultiHyperlinkView setTextAlignment:](v30, "setTextAlignment:", 1, v28);
    -[PKMultiHyperlinkView setText:](v30, "setText:", v29);
    objc_initWeak(&location, self);
    v31 = [PKTextRangeHyperlink alloc];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __50__PKPaymentSetupHeroViewController__configureDock__block_invoke;
    v39[3] = &unk_1E3E61310;
    objc_copyWeak(&v40, &location);
    v32 = -[PKTextRangeHyperlink initWithLinkText:action:](v31, "initWithLinkText:action:", v28, v39);
    v42[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultiHyperlinkView setSources:](v30, "setSources:", v33);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
    objc_msgSend(v4, "setAdditionalLinkView:", v30);
    objc_msgSend(v4, "setAdditionalLinkBottomPadding:", 11.0);

  }
  else
  {
    if (v23)
      v34 = 0;
    else
      v34 = v24;
    if (v34 == 1)
    {
      PKLocalizedPaymentString(CFSTR("CONTINUE_CHINA"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "primaryButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setTitle:forState:", v35, 0);

    }
  }
  if (-[PKExplanationViewController showCancelButton](self, "showCancelButton"))
    -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);

}

void __50__PKPaymentSetupHeroViewController__configureDock__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D699F8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didTapFooterLink:", v3);

}

- (BOOL)_readerModeIsSupported
{
  void *v3;
  BOOL v4;

  if (!self->_product || !objc_msgSend(MEMORY[0x1E0D66C68], "isSupported"))
    return 0;
  -[PKPaymentSetupProduct provisioningMethodMetadataForType:](self->_product, "provisioningMethodMetadataForType:", *MEMORY[0x1E0D6AE40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (-[PKPaymentSetupProduct allSupportedProtocols](self->_product, "allSupportedProtocols") & 4) == 0
      || PKFelicaSecureElementIsAvailable() != 0;
  else
    v4 = 0;

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupHeroViewController;
  -[PKPaymentSetupHeroViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PKPaymentSetupHeroViewController _setUserInteractionEnabled:](self, "_setUserInteractionEnabled:", 1);
  if (!self->_preflightComplete)
  {
    -[PKExplanationViewController context](self, "context");
    if (PKPaymentSetupContextIsMerchantApp())
    {
      -[PKPaymentSetupHeroViewController _setShowActivityIndicator:](self, "_setShowActivityIndicator:", 1);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __51__PKPaymentSetupHeroViewController_viewWillAppear___block_invoke;
      v4[3] = &unk_1E3E62288;
      v4[4] = self;
      -[PKPaymentSetupHeroViewController _preflightWithCompletion:](self, "_preflightWithCompletion:", v4);
    }
  }
}

uint64_t __51__PKPaymentSetupHeroViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setShowActivityIndicator:", 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupHeroViewController;
  -[PKExplanationViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[PKPaymentSetupHeroViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupHeroViewController _bodyText](self, "_bodyText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBodyText:", v5);

  PKProvisioningBackgroundColor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  PKPaymentSetupApplyContextAppearance(-[PKExplanationViewController context](self, "context"), v3);
}

- (void)_preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PKPaymentProvisioningController *provisioningController;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;
  _QWORD aBlock[4];
  id v15;

  v4 = a3;
  v5 = v4;
  if (self->_preflightComplete)
  {
    if (v4)
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
  else
  {
    PKTimeProfileBegin();
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__PKPaymentSetupHeroViewController__preflightWithCompletion___block_invoke;
    aBlock[3] = &unk_1E3E614F0;
    v15 = v5;
    v7 = _Block_copy(aBlock);
    objc_initWeak(&location, self);
    provisioningController = self->_provisioningController;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __61__PKPaymentSetupHeroViewController__preflightWithCompletion___block_invoke_2;
    v10[3] = &unk_1E3E78A58;
    objc_copyWeak(&v12, &location);
    v10[4] = self;
    v9 = v7;
    v11 = v9;
    -[PKPaymentProvisioningController preflightWithRequirements:completionRequirements:completion:](provisioningController, "preflightWithRequirements:completionRequirements:completion:", 165, 165, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

uint64_t __61__PKPaymentSetupHeroViewController__preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t result;

  PKLogFacilityTypeGetObject();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)PKTimeProfileEnd();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __61__PKPaymentSetupHeroViewController__preflightWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1057) = 1;
    if (v4)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __61__PKPaymentSetupHeroViewController__preflightWithCompletion___block_invoke_3;
      v8[3] = &unk_1E3E612E8;
      v8[4] = *(_QWORD *)(a1 + 32);
      v7 = PKAlertForDisplayableErrorWithHandlers(v4, 0, v8, 0);
      if (v7)
        objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __61__PKPaymentSetupHeroViewController__preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "explanationView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "explanationViewDidSelectSetupLater:", v2);

}

- (void)viewWillLayoutSubviews
{
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupHeroViewController;
  -[PKExplanationViewController viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  -[PKExplanationViewController context](self, "context");
  v3 = 0.0;
  if (PKPaymentSetupContextIsSetupAssistant())
  {
    -[PKPaymentSetupHeroViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "orientation") - 1;

      if (v7 > 1)
        goto LABEL_9;
    }
    else if (v5 != 5)
    {
      if (v5 == 6)
        v3 = 74.0;
      else
        v3 = 0.0;
      goto LABEL_9;
    }
    v3 = 54.0;
  }
LABEL_9:
  -[PKExplanationViewController explanationView](self, "explanationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTopMargin:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  PKPaymentSetupHeroView *splashView;
  id WeakRetained;
  char v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupHeroViewController;
  -[PKPaymentSetupHeroViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  self->_nextButtonPushed = 0;
  splashView = self->_splashView;
  if (splashView)
    -[PKPaymentSetupHeroView startAnimation](splashView, "startAnimation");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "viewControllerDidBeginSetupFlow:", self);

  }
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupHeroViewController;
  -[PKPaymentSetupHeroViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[PKPaymentSetupHeroViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PKPaymentSetupHeroViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopAnimation");

  }
}

- (PKPaymentWebService)webService
{
  return (PKPaymentWebService *)-[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
}

- (void)setFeaturedHeroImages:(id)a3
{
  objc_storeStrong((id *)&self->_featuredImages, a3);
}

- (void)_setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[PKPaymentSetupHeroViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  -[PKPaymentSetupHeroViewController _setShowActivityIndicator:](self, "_setShowActivityIndicator:", v3 ^ 1);
}

- (void)_setShowActivityIndicator:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dockView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setButtonsEnabled:", v3 ^ 1);
  objc_msgSend(v6, "primaryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowSpinner:", v3);

}

- (id)_bodyText
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int IsBridge;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  __CFString *v16;
  NSString *v17;

  -[PKPaymentSetupProduct longLocalizedDescription](self->_product, "longLocalizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[PKPaymentSetupHeroViewController webService](self, "webService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "paymentSetupFeaturedNetworksForRegion:", self->_deviceRegion);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationViewController context](self, "context");
    IsBridge = PKPaymentSetupContextIsBridge();
    -[PKPaymentSetupHeroViewController traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    v12 = v11 & 0xFFFFFFFFFFFFFFFBLL;
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0D6AD78])
      && self->_hasFelicaSecureElement
      && !v12)
    {
      PKLocalizedPaymentString(CFSTR("APPLE_PAY_DESCRIPTION_PREPAID"));
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v4 = (id)v13;
LABEL_18:

      goto LABEL_19;
    }
    if (objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0D6AD60]))
      v14 = v12 == 0;
    else
      v14 = 0;
    if (v14)
    {
      PKLocalizedAquamanString(CFSTR("APPLE_PAY_DESCRIPTION_BARCODE"));
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    PKPeerPaymentServiceOverrideURL();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {

    }
    else if ((objc_msgSend(v7, "peerPaymentEnabledForRegion:", self->_deviceRegion) & 1) == 0)
    {
      if ((PKDeviceRegionSupportsDebit() & 1) != 0)
      {
        if (-[NSString isEqualToString:](self->_deviceRegion, "isEqualToString:", CFSTR("HK"))
          || -[NSString isEqualToString:](self->_deviceRegion, "isEqualToString:", CFSTR("CN")))
        {
          v16 = CFSTR("APPLE_PAY_DESCRIPTION_NO_STORE");
        }
        else
        {
          v16 = CFSTR("APPLE_PAY_DESCRIPTION");
        }
      }
      else
      {
        v16 = CFSTR("APPLE_PAY_DESCRIPTION_NO_DEBIT");
      }
      goto LABEL_17;
    }
    v16 = CFSTR("APPLE_PAY_DESCRIPTION_SURF");
LABEL_17:
    PKDeviceSpecificLocalizedStringKeyForKey(v16, IsBridge);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v17);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  v4 = v3;
LABEL_19:

  return v4;
}

- (void)_terminateSetupFlow
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "viewControllerDidTerminateSetupFlow:", self);

  }
  else
  {
    -[PKPaymentSetupHeroViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)didTapFooterLink:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v4);
    -[NSObject setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
    -[PKPaymentSetupHeroViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Error: Could not open url in: %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (void)_transferExistingCardTapped
{
  id WeakRetained;

  -[PKProvisioningAnalyticsSessionUIReporter reportOtherButtonPressed:](self->_reporter, "reportOtherButtonPressed:", CFSTR("transferCard"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(WeakRetained, "heroViewControllerDidRequestTransferBalance:", self);

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id WeakRetained;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_flowDelegate);
    objc_msgSend(v6, "heroViewControllerDidSelectContinue:", self);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "WARNING: explanationViewDidSelectContinue called for hero view, but it should have been overridden", buf, 2u);
    }

    -[PKPaymentSetupHeroViewController _terminateSetupFlow](self, "_terminateSetupFlow");
  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  id WeakRetained;
  id v5;

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_flowDelegate);
    objc_msgSend(v5, "heroViewControllerDidSelectSetupLater:", self);

  }
  else
  {
    -[PKPaymentSetupHeroViewController _terminateSetupFlow](self, "_terminateSetupFlow");
  }
}

- (void)setHideSetupLaterButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "setSetupLaterButton:", 0);

}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  -[PKPaymentSetupHeroViewController _setUserInteractionEnabled:](self, "_setUserInteractionEnabled:", !a3, a4);
}

- (PKPaymentSetupHeroViewControllerFlowDelegate)flowDelegate
{
  return (PKPaymentSetupHeroViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
}

- (void)setFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowDelegate, a3);
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKPaymentSetupViewControllerDelegate)delegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaymentHeroImageController)heroImageController
{
  return self->_heroImageController;
}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  self->_allowsManualEntry = a3;
}

- (int64_t)paymentSetupMode
{
  return self->_paymentSetupMode;
}

- (void)setPaymentSetupMode:(int64_t)a3
{
  self->_paymentSetupMode = a3;
}

- (BOOL)showPaymentCardTitle
{
  return self->_showPaymentCardTitle;
}

- (void)setShowPaymentCardTitle:(BOOL)a3
{
  self->_showPaymentCardTitle = a3;
}

- (BOOL)hidePrivacyView
{
  return self->_hidePrivacyView;
}

- (void)setHidePrivacyView:(BOOL)a3
{
  self->_hidePrivacyView = a3;
}

- (BOOL)showChinaPrivacyDisclosure
{
  return self->_showChinaPrivacyDisclosure;
}

- (void)setShowChinaPrivacyDisclosure:(BOOL)a3
{
  self->_showChinaPrivacyDisclosure = a3;
}

- (BOOL)showSouthKoreaPrivacyDisclosure
{
  return self->_showSouthKoreaPrivacyDisclosure;
}

- (void)setShowSouthKoreaPrivacyDisclosure:(BOOL)a3
{
  self->_showSouthKoreaPrivacyDisclosure = a3;
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
  objc_storeStrong((id *)&self->_heroImageController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_deviceRegion, 0);
  objc_storeStrong((id *)&self->_featuredImages, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_splashView, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
