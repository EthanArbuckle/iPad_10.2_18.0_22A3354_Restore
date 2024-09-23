@implementation PKFeatureOnBoardingViewController

- (PKFeatureOnBoardingViewController)initWithParentFlowController:(id)a3 setupDelegate:(id)a4 setupContext:(int64_t)a5 onboardingContext:(int64_t)a6 featureIdentifier:(unint64_t)a7 provisioningController:(id)a8 paymentSetupProduct:(id)a9 currentPage:(id)a10
{
  id v17;
  PKFeatureOnBoardingViewController *v18;
  PKFeatureOnBoardingViewController *v19;
  void *v20;
  NSMutableArray *v21;
  NSMutableArray *defaultFeatureAccountCompletions;
  char v23;
  objc_super v25;

  v17 = a10;
  v25.receiver = self;
  v25.super_class = (Class)PKFeatureOnBoardingViewController;
  v18 = -[PKOnBoardingViewController initWithParentFlowController:setupDelegate:context:provisioningController:paymentSetupProduct:currentPage:](&v25, sel_initWithParentFlowController_setupDelegate_context_provisioningController_paymentSetupProduct_currentPage_, a3, a4, a5, a8, a9, v17);
  v19 = v18;
  if (v18)
  {
    v18->_featureIdentifier = a7;
    v18->_onboardingContext = a6;
    objc_msgSend(v17, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_isMainFeatureOnboardingPage = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D6A500]);

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    defaultFeatureAccountCompletions = v19->_defaultFeatureAccountCompletions;
    v19->_defaultFeatureAccountCompletions = v21;

    if (a7 <= 5)
    {
      v23 = ((1 << a7) & 0x13) == 0 || v19->_isMainFeatureOnboardingPage;
      v19->_featureSupportsAnalytics = v23;
    }
  }

  return v19;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  char v23;
  unint64_t featureIdentifier;
  char v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  char v44;
  __CFString *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  const __CFString *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  const __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSString *v101;
  void *v102;
  objc_super v103;

  v103.receiver = self;
  v103.super_class = (Class)PKFeatureOnBoardingViewController;
  -[PKOnBoardingViewController viewDidLoad](&v103, sel_viewDidLoad);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKFeatureOnBoardingViewController navigationItem](self, "navigationItem");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setHidesBackButton:", 1);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerView");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setManualEntryButton:", 0);
  +[PKApplyController preferredLanguageForFeatureIdentifier:account:](PKApplyController, "preferredLanguageForFeatureIdentifier:account:", self->_featureIdentifier, 0);
  v101 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[PKOnBoardingViewController currentPage](self, "currentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOnBoardingViewController provisioningController](self, "provisioningController");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "associatedCredentials");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAccountCredential");

  v9 = objc_msgSend(v5, "layout");
  self->_layout = v9;
  if (!v9)
  {
    if (self->_installmentConfiguration)
      v9 = 2;
    else
      v9 = 1;
    self->_layout = v9;
  }
  self->_useCompactLayout = v9 == 2;
  if (self->_isMainFeatureOnboardingPage)
  {
    +[PKApplyController preferredLanguageForFeatureIdentifier:account:](PKApplyController, "preferredLanguageForFeatureIdentifier:account:", self->_featureIdentifier, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    switch(self->_featureIdentifier)
    {
      case 0uLL:
      case 3uLL:
        v11 = (void *)MEMORY[0x1E0D65190];
        v12 = 1;
        goto LABEL_13;
      case 1uLL:
        v11 = (void *)MEMORY[0x1E0D65190];
        v12 = 2;
        goto LABEL_13;
      case 2uLL:
        v13 = (void *)MEMORY[0x1E0D65190];
        v14 = 4;
        goto LABEL_58;
      case 4uLL:
        v11 = (void *)MEMORY[0x1E0D65190];
        v12 = 8;
LABEL_13:
        objc_msgSend(v11, "pk_privacyLinkForContext:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          goto LABEL_14;
        break;
      case 5uLL:
        v13 = (void *)MEMORY[0x1E0D65190];
        v14 = 128;
LABEL_58:
        objc_msgSend(v13, "pk_privacyLinkForContext:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setDisplayLanguage:", v10);
        if (!v15)
          break;
LABEL_14:
        objc_msgSend(v3, "setShowPrivacyView:", 1);
        -[PKExplanationViewController setPrivacyLinkController:](self, "setPrivacyLinkController:", v15);

        break;
      default:
        break;
    }
    v16 = v4;
    v17 = (void *)v10;
    -[PKFeatureOnBoardingViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "viewControllers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20 < 2)
    {
      if (self->_featureIdentifier == 2)
        -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 1);
      else
        -[PKExplanationViewController setShowCloseButton:](self, "setShowCloseButton:", 1);
    }
    else
    {
      -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
      -[PKFeatureOnBoardingViewController navigationItem](self, "navigationItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setHidesBackButton:", 0);

    }
    v4 = v16;
  }
  else
  {
    objc_msgSend(v3, "setShowPrivacyView:", 0);
    -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  }
  -[PKFeatureOnBoardingViewController updateForHeroImage](self, "updateForHeroImage");
  objc_msgSend(v5, "title");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
    v23 = v8;
  else
    v23 = 1;
  v102 = v3;
  v97 = (void *)v22;
  if ((v23 & 1) != 0)
  {
    featureIdentifier = self->_featureIdentifier;
    if (featureIdentifier - 4 < 2 || featureIdentifier == 1)
    {
      v31 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v31, "setNumberStyle:", 3);
      objc_msgSend(v31, "setMinimumFractionDigits:", 2);
      objc_msgSend(v31, "setMultiplier:", &unk_1E3FAD4B0);
      -[PKOnBoardingViewController paymentSetupProduct](self, "paymentSetupProduct");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "clientInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKey:", *MEMORY[0x1E0D6AFB8]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "stringFromNumber:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedApplyFeatureString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTitleText:", v36, v35);

      objc_msgSend(v3, "setTitleAccessoriesEnabled:", 0);
      -[PKOnBoardingViewController paymentSetupProduct](self, "paymentSetupProduct");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "clientInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKey:", *MEMORY[0x1E0D6B008]);
      v39 = v4;
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "stringFromNumber:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedApplyFeatureString();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setBodyText:", v42, v41);

      v4 = v39;
      v3 = v102;

    }
    else
    {
      if (featureIdentifier != 2)
        goto LABEL_36;
      if (self->_useCompactLayout)
        v25 = v8;
      else
        v25 = 1;
      if ((v25 & 1) != 0)
      {
        objc_msgSend(v3, "setTitleText:", 0);
        PKPassKitUIBundle();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "URLForResource:withExtension:", CFSTR("AppleCardLogo"), CFSTR("pdf"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = PKUIScreenScale();
        PKUIImageFromPDF(v27, 105.0, 31.0, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "imageWithRenderingMode:", 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "setTitleImage:", v30);
        goto LABEL_36;
      }
      PKLocalizedApplyFeatureString();
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTitleText:", v31);
    }

  }
  else
  {
    objc_msgSend(v3, "setTitleText:", v22);
    objc_msgSend(v3, "setTitleAccessoriesEnabled:", 0);
  }
LABEL_36:
  objc_msgSend(v5, "subtitle");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
    v44 = v8;
  else
    v44 = 1;
  if ((v44 & 1) == 0)
  {
    objc_msgSend(v3, "setBodyText:", v43);
    goto LABEL_50;
  }
  if (!self->_isMainFeatureOnboardingPage)
    goto LABEL_50;
  if (self->_installmentConfiguration)
  {
    if (v8)
      v45 = CFSTR("INSTALLMENTS_FEATURE_ADD_CARD_EXPLANATION_MESSAGE");
    else
      v45 = CFSTR("INSTALLMENTS_FEATURE_OFFER_EXPLANATION_MESSAGE");
    PKLocalizedBeekmanStringWithLocalization(&v45->isa, v101);
    v46 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_featureIdentifier != 2)
      goto LABEL_50;
    PKLocalizedApplyFeatureString();
    v46 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v46;
  objc_msgSend(v3, "setBodyText:", v46);

LABEL_50:
  objc_msgSend(v5, "body");
  v48 = objc_claimAutoreleasedReturnValue();
  v99 = v4;
  v95 = (void *)v48;
  v96 = (void *)v43;
  if (v48)
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v48);
  }
  else if (self->_featureIdentifier == 2 && self->_isMainFeatureOnboardingPage)
  {
    v50 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v50, "setLineBreakMode:", 0);
    objc_msgSend(v50, "setAlignment:", 1);
    objc_msgSend(v50, "setLineSpacing:", 10.0);
    v51 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKey:");
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v51, "setObject:forKey:", v52);

    v53 = *MEMORY[0x1E0DC1178];
    v93 = v50;
    objc_msgSend(v51, "setObject:forKey:", v50, *MEMORY[0x1E0DC1178]);
    objc_msgSend(v5, "footnote");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (v54)
    {
      v56 = v54;
    }
    else
    {
      PKLocalizedApplyFeatureString();
      v56 = (id)objc_claimAutoreleasedReturnValue();
    }
    v57 = v56;

    v58 = (void *)MEMORY[0x1E0CB3940];
    v59 = objc_msgSend(v57, "length");
    v60 = CFSTR("\n");
    if (!v59)
      v60 = &stru_1E3E7D690;
    v90 = v57;
    objc_msgSend(v58, "stringWithFormat:", CFSTR("%@%@"), v60, v57);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v51;
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v61, v51);
    v62 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v62, "setLineBreakMode:", 0);
    objc_msgSend(v62, "setAlignment:", 1);
    v63 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setObject:forKey:");
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setObject:forKey:", v64, v89);

    objc_msgSend(v63, "setObject:forKey:", v62, v53);
    objc_msgSend(v5, "footnoteDisclosure");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v65;
    if (v65)
    {
      v67 = v65;
    }
    else
    {
      PKLocalizedApplyFeatureString();
      v67 = (id)objc_claimAutoreleasedReturnValue();
    }
    v68 = v67;

    v69 = (void *)MEMORY[0x1E0CB3940];
    v70 = objc_msgSend(v61, "length");
    v71 = CFSTR("\n");
    if (!v70)
      v71 = &stru_1E3E7D690;
    objc_msgSend(v69, "stringWithFormat:", CFSTR("%@%@"), v71, v68);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v72, v63);
    objc_msgSend(v49, "appendAttributedString:", v73);

    v4 = v99;
  }
  else
  {
    v49 = 0;
  }
  objc_msgSend(v3, "setAttributedSecondaryBodyText:", v49);
  objc_msgSend(v5, "learnMore");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "buttonTitle");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
    objc_msgSend(v3, "setBodyButtonText:", v75);
  objc_msgSend(v5, "disclosureTitle");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76)
    objc_msgSend(v4, "setButtonExplanationText:", v76);
  objc_msgSend(v5, "primaryActionTitle");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryButton");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v78;
  if (v77)
  {
    objc_msgSend(v78, "setTitle:forState:", v77, 0);
  }
  else
  {
    PKLocalizedApplyFeatureString();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setTitle:forState:", v80, 0);

  }
  objc_msgSend(v5, "secondaryActionItem");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "buttonTitle");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82 || (objc_msgSend(v5, "secondaryActionTitle"), (v82 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v83 = v49;
    objc_msgSend(v102, "setForceShowSetupLaterButton:", 1);
    objc_msgSend(v100, "setupLaterButton");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v84;
    v86 = v82;
  }
  else
  {
    v83 = v49;
    if (!self->_isMainFeatureOnboardingPage || self->_featureIdentifier != 2)
    {
      objc_msgSend(v102, "setForceShowSetupLaterButton:", 0);
      goto LABEL_81;
    }
    objc_msgSend(v102, "setForceShowSetupLaterButton:", 1);
    objc_msgSend(v100, "setupLaterButton");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedApplyFeatureString();
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v82;
    v86 = v85;
  }
  objc_msgSend(v84, "setTitle:forState:", v86, 0);

LABEL_81:
  if (self->_isMainFeatureOnboardingPage && self->_featureIdentifier == 2)
  {
    -[PKFeatureOnBoardingViewController loadHeroImageFromWelcomeExperiment](self, "loadHeroImageFromWelcomeExperiment");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (v87)
      -[PKOnBoardingViewController setHeroImage:](self, "setHeroImage:", v87);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKFeatureOnBoardingViewController;
  -[PKFeatureOnBoardingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKFeatureOnBoardingViewController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
  -[PKFeatureOnBoardingViewController _reportAnalyticsViewDidAppear:](self, "_reportAnalyticsViewDidAppear:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKFeatureOnBoardingViewController;
  -[PKFeatureOnBoardingViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PKFeatureOnBoardingViewController _reportAnalyticsViewDidAppear:](self, "_reportAnalyticsViewDidAppear:", 0);
  -[PKFeatureOnBoardingViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKFeatureOnBoardingViewController;
  -[PKFeatureOnBoardingViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  if (!a3)
    -[PKFeatureOnBoardingViewController _reportCancelTapped](self, "_reportCancelTapped");
}

- (void)updateForHeroImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  PKApplyHeroCardView *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PKOnBoardingViewController currentPage](self, "currentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOnBoardingViewController heroImage](self, "heroImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_useCompactLayout && self->_isMainFeatureOnboardingPage)
  {
    PKFeatureApplicationHeaderImageWithImage(self->_featureIdentifier, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v7);
    objc_msgSend(v4, "setTopMargin:", 30.0);
    PKProvisioningBackgroundColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTopBackgroundColor:", v8);

    goto LABEL_13;
  }
  if (v5)
  {
    v9 = v4;
    v10 = v6;
LABEL_6:
    objc_msgSend(v9, "setImage:", v10);
    goto LABEL_13;
  }
  objc_msgSend(v3, "heroImageURL");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = -[PKOnBoardingViewController preflightCalled](self, "preflightCalled");

    if (!v13)
    {
      PKLogFacilityTypeGetObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v3;
        _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "heroImageURL is set for the current page but we haven't been preflighted: %@", (uint8_t *)&v17, 0xCu);
      }

      v9 = v4;
      v10 = 0;
      goto LABEL_6;
    }
  }
  if (self->_featureIdentifier == 5)
    PKProvisioningBackgroundColor();
  else
    PKProvisioningSecondaryBackgroundColor();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PKApplyHeroCardView initWithFeatureIdentifier:]([PKApplyHeroCardView alloc], "initWithFeatureIdentifier:", self->_featureIdentifier);
  -[PKApplyHeroCardView setBackgroundColor:](v15, "setBackgroundColor:", v14);
  objc_msgSend(v4, "setHeroView:", v15);
  objc_msgSend(v4, "setTopBackgroundColor:", v14);

LABEL_13:
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[PKFeatureOnBoardingViewController _reportCancelTapped](self, "_reportCancelTapped");
  v5.receiver = self;
  v5.super_class = (Class)PKFeatureOnBoardingViewController;
  -[PKOnBoardingViewController explanationViewControllerDidSelectCancel:](&v5, sel_explanationViewControllerDidSelectCancel_, v4);

}

- (void)explanationViewDidUpdateLayout:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PKExplanationViewController explanationView](self, "explanationView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFeatureOnBoardingViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v5);

}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[16];

  v4 = a3;
  if (self->_isMainFeatureOnboardingPage
    && self->_featureIdentifier == 2
    && (-[PKOnBoardingViewController paymentSetupProduct](self, "paymentSetupProduct"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "augmentedProduct"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D672B0]);
    PKLogFacilityTypeGetObject();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19D178000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "request:augmentedProduct", ", buf, 2u);
      }
    }

    -[PKFeatureOnBoardingViewController _appleCardWelcomeExperiment](self, "_appleCardWelcomeExperiment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFeatureOnBoardingViewController installmentConfiguration](self, "installmentConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "experimentDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__PKFeatureOnBoardingViewController_preflightWithCompletion___block_invoke;
    v15[3] = &unk_1E3E66940;
    v15[4] = self;
    v16 = v4;
    objc_msgSend(v7, "augmentedProductForInstallmentConfiguration:experimentDetails:withCompletion:", v12, v13, v15);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PKFeatureOnBoardingViewController;
    -[PKOnBoardingViewController preflightWithCompletion:](&v14, sel_preflightWithCompletion_, v4);
  }

}

void __61__PKFeatureOnBoardingViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PKFeatureOnBoardingViewController_preflightWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E65388;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __61__PKFeatureOnBoardingViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  uint8_t v11[16];
  objc_super v12;

  objc_msgSend(*(id *)(a1 + 32), "product");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "paymentSetupProduct");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "augmentWithProduct:", v2);
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v3, "onboardingItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCurrentPage:", v6);

  }
  v7 = *(_QWORD *)(a1 + 48);
  v12.receiver = *(id *)(a1 + 40);
  v12.super_class = (Class)PKFeatureOnBoardingViewController;
  objc_msgSendSuper2(&v12, sel_preflightWithCompletion_, v7);
  PKLogFacilityTypeGetObject();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 40));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_19D178000, v8, OS_SIGNPOST_INTERVAL_END, v10, "request:augmentedProduct", ", v11, 2u);
    }
  }

}

- (void)_reportAnalyticsViewDidAppear:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_featureSupportsAnalytics)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __67__PKFeatureOnBoardingViewController__reportAnalyticsViewDidAppear___block_invoke;
    v3[3] = &unk_1E3E6D9B8;
    v4 = a3;
    v3[4] = self;
    -[PKFeatureOnBoardingViewController _defaultFeatureAccountAnalyticsWithCompletion:](self, "_defaultFeatureAccountAnalyticsWithCompletion:", v3);
  }
}

void __67__PKFeatureOnBoardingViewController__reportAnalyticsViewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v9 = objc_alloc_init(v3);
  objc_msgSend(v9, "addEntriesFromDictionary:", v4);

  if (*(_BYTE *)(a1 + 40))
    v5 = (_QWORD *)MEMORY[0x1E0D68C50];
  else
    v5 = (_QWORD *)MEMORY[0x1E0D68C58];
  objc_msgSend(v9, "setObject:forKey:", *v5, *MEMORY[0x1E0D68AA0]);
  v6 = (void *)MEMORY[0x1E0D66A58];
  objc_msgSend(*(id *)(a1 + 32), "_subjectForFeature:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v6, "subject:sendEvent:", v7, v8);

}

- (void)handleSetupLater
{
  void *v3;
  id v4;

  if (self->_isMainFeatureOnboardingPage)
  {
    -[PKOnBoardingViewController currentPage](self, "currentPage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secondaryActionItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[PKFeatureOnBoardingViewController _openSecondaryActionItem](self, "_openSecondaryActionItem");
    else
      -[PKFeatureOnBoardingViewController _openTermsAndConditions](self, "_openTermsAndConditions");
    -[PKFeatureOnBoardingViewController _reportRatesAndTermsTapped](self, "_reportRatesAndTermsTapped");

  }
  else
  {
    -[PKOnBoardingViewController terminateSetupFlow](self, "terminateSetupFlow");
  }
}

- (void)handleProductAvailable
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  PKFeatureOnBoardingViewController *v9;

  -[PKFeatureOnBoardingViewController _reportContinueTapped](self, "_reportContinueTapped");
  -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  -[PKOnBoardingViewController provisioningController](self, "provisioningController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associatedCredentials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_onboardingContext == 1
    && objc_msgSend(v4, "count") == 1
    && objc_msgSend(v5, "isAccountCredential"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke;
    v7[3] = &unk_1E3E619E0;
    v8 = v5;
    v9 = self;
    -[PKFeatureOnBoardingViewController _checkSecurityCapabilities:nextStep:](self, "_checkSecurityCapabilities:nextStep:", 58, v7);

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke_3;
    v6[3] = &unk_1E3E62288;
    v6[4] = self;
    -[PKFeatureOnBoardingViewController _checkSecurityCapabilities:nextStep:](self, "_checkSecurityCapabilities:nextStep:", 56, v6);
  }

}

void __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountCredential");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke_2;
    v5[3] = &unk_1E3E612E8;
    v5[4] = v4;
    objc_msgSend(v4, "_handleAccountCredential:completion:", v3, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "showNavigationBarSpinner:", 0);
  }
}

uint64_t __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
}

uint64_t __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke_3(uint64_t a1, int a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  if (!a2)
    return objc_msgSend(v2, "showNavigationBarSpinner:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke_4;
  v4[3] = &unk_1E3E612E8;
  v4[4] = v2;
  return objc_msgSend(v2, "_handleApplyFlowWithCompletion:", v4);
}

uint64_t __59__PKFeatureOnBoardingViewController_handleProductAvailable__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
}

- (id)nextOnboardingViewControllerWithPage:(id)a3 product:(id)a4
{
  id v6;
  id v7;
  PKFeatureOnBoardingViewController *v8;
  void *v9;
  void *v10;
  int64_t v11;
  int64_t onboardingContext;
  unint64_t featureIdentifier;
  void *v14;
  PKFeatureOnBoardingViewController *v15;

  v6 = a4;
  v7 = a3;
  v8 = [PKFeatureOnBoardingViewController alloc];
  -[PKOnBoardingViewController parentFlowController](self, "parentFlowController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOnBoardingViewController setupDelegate](self, "setupDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKExplanationViewController context](self, "context");
  onboardingContext = self->_onboardingContext;
  featureIdentifier = self->_featureIdentifier;
  -[PKOnBoardingViewController provisioningController](self, "provisioningController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PKFeatureOnBoardingViewController initWithParentFlowController:setupDelegate:setupContext:onboardingContext:featureIdentifier:provisioningController:paymentSetupProduct:currentPage:](v8, "initWithParentFlowController:setupDelegate:setupContext:onboardingContext:featureIdentifier:provisioningController:paymentSetupProduct:currentPage:", v9, v10, v11, onboardingContext, featureIdentifier, v14, v6, v7);

  return v15;
}

- (void)_handleAccountCredential:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKAccountFlowController *v8;
  void *v9;
  void *v10;
  PKAccountFlowController *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = [PKAccountFlowController alloc];
  -[PKOnBoardingViewController provisioningController](self, "provisioningController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOnBoardingViewController setupDelegate](self, "setupDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKAccountFlowController initWithAccountCredential:provisioningController:setupDelegate:context:operations:](v8, "initWithAccountCredential:provisioningController:setupDelegate:context:operations:", v7, v9, v10, -[PKExplanationViewController context](self, "context"), 63);

  -[PKOnBoardingViewController parentFlowController](self, "parentFlowController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountFlowController setParentFlowController:](v11, "setParentFlowController:", v12);

  -[PKFeatureOnBoardingViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountFlowController firstAccountViewController](v11, "firstAccountViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__PKFeatureOnBoardingViewController__handleAccountCredential_completion___block_invoke;
  v16[3] = &unk_1E3E614F0;
  v17 = v6;
  v15 = v6;
  objc_msgSend(v13, "pk_presentPaymentSetupViewController:animated:completion:", v14, 1, v16);

}

uint64_t __73__PKFeatureOnBoardingViewController__handleAccountCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_handleApplyFlowWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PKFeatureOnBoardingViewController *v17;
  id v18;
  id v19;
  id v20;

  v4 = a3;
  -[PKOnBoardingViewController provisioningController](self, "provisioningController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentSetupProductModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "productsForFeatureIdentifier:", self->_featureIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "featureApplications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_107);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_2;
  v15[3] = &unk_1E3E6DA20;
  v16 = v10;
  v17 = self;
  v18 = v5;
  v19 = v8;
  v20 = v4;
  v11 = v4;
  v12 = v8;
  v13 = v5;
  v14 = v10;
  -[PKFeatureOnBoardingViewController _defaultFeatureAccountWithCompletion:](self, "_defaultFeatureAccountWithCompletion:", v15);

}

uint64_t __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "lastUpdated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastUpdated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  PKApplyControllerConfiguration *v6;
  void *v7;
  PKApplyControllerConfiguration *v8;
  PKApplyController *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PKApplyControllerConfiguration alloc];
  objc_msgSend(*(id *)(a1 + 40), "setupDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:](v6, "initWithSetupDelegate:context:provisioningController:", v7, objc_msgSend(*(id *)(a1 + 40), "context"), *(_QWORD *)(a1 + 48));

  -[PKApplyControllerConfiguration setFeatureApplication:](v8, "setFeatureApplication:", v5);
  -[PKApplyControllerConfiguration setFeature:](v8, "setFeature:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1088));
  -[PKApplyControllerConfiguration setApplicationType:](v8, "setApplicationType:", 1);
  v9 = -[PKApplyController initWithApplyConfiguration:]([PKApplyController alloc], "initWithApplyConfiguration:", v8);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(v10 + 1096);
  *(_QWORD *)(v10 + 1096) = v9;

  v12 = *(void **)(*(_QWORD *)(a1 + 40) + 1096);
  objc_msgSend(MEMORY[0x1E0D66820], "analyticsAccountTypeForAccount:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setAnalyticsExistingAccountType:", v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1096), "setInstallmentConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1168));
  v14 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v14 + 1088) == 5)
    objc_msgSend(*(id *)(v14 + 1096), "setAssociatedIntent:", 1);
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 56), "regionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v24 = *(void **)(*(_QWORD *)(a1 + 40) + 1096);
      objc_msgSend(*(id *)(a1 + 48), "webService");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "regions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "applyServiceURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setApplyServiceURL:", v20);

    }
  }
  v21 = *(_QWORD **)(a1 + 40);
  v22 = (void *)v21[137];
  objc_msgSend(v21, "parentFlowController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setParentFlowController:", v23);

  v25 = *(id *)(a1 + 64);
  PKRequestContactAccessWithCompletion();

}

void __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 1096);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_4;
  v4[3] = &unk_1E3E61720;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "nextViewControllerWithCompletion:", v4);

}

void __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_5;
    v12[3] = &unk_1E3E614F0;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v12);

    v7 = v13;
  }
  else
  {
    v7 = PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v8, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_6;
      v10[3] = &unk_1E3E61590;
      v11 = *(id *)(a1 + 40);
      objc_msgSend(v9, "presentViewController:animated:completion:", v7, 1, v10);

    }
    else
    {
      objc_msgSend(v8, "terminateSetupFlow");
    }
  }

}

uint64_t __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __68__PKFeatureOnBoardingViewController__handleApplyFlowWithCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_checkSecurityCapabilities:(unint64_t)a3 nextStep:(id)a4
{
  id v6;
  NSObject *v7;
  PKSecurityCapabilitiesController *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v6 = a4;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Checking security capabilities for feature", buf, 2u);
  }

  v8 = -[PKSecurityCapabilitiesController initWithRequirements:feature:context:]([PKSecurityCapabilitiesController alloc], "initWithRequirements:feature:context:", a3, self->_featureIdentifier, -[PKExplanationViewController context](self, "context"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PKFeatureOnBoardingViewController__checkSecurityCapabilities_nextStep___block_invoke;
  v10[3] = &unk_1E3E6DA48;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[PKSecurityCapabilitiesController presentSecurityRepairFlowWithPresentingViewController:completion:](v8, "presentSecurityRepairFlowWithPresentingViewController:completion:", self, v10);

}

void __73__PKFeatureOnBoardingViewController__checkSecurityCapabilities_nextStep___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PKFeatureOnBoardingViewController__checkSecurityCapabilities_nextStep___block_invoke_2;
  v8[3] = &unk_1E3E64370;
  v12 = a2;
  v9 = v5;
  v6 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __73__PKFeatureOnBoardingViewController__checkSecurityCapabilities_nextStep___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(void);
  void *v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    PKSecurityCapabilitiesErrorToString(*(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138412546;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking security capabilities with upgrade error %@, error %@", (uint8_t *)&v9, 0x16u);

  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 == 3)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_7;
  }
  if (!v5)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_7:
    v6();
    return;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1088), 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)_openTermsAndConditions
{
  NSObject *v3;
  PKApplyControllerConfiguration *v4;
  void *v5;
  int64_t v6;
  void *v7;
  PKApplyControllerConfiguration *v8;
  PKApplyController *v9;
  PKApplyController *applyController;
  PKApplyTermsAndConditionsViewController *v11;
  PKApplyController *v12;
  void *v13;
  PKApplyTermsAndConditionsViewController *v14;
  void *v15;
  uint8_t v16[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Opening feature terms and conditions", v16, 2u);
  }

  if (!self->_applyController)
  {
    v4 = [PKApplyControllerConfiguration alloc];
    -[PKOnBoardingViewController setupDelegate](self, "setupDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKExplanationViewController context](self, "context");
    -[PKOnBoardingViewController provisioningController](self, "provisioningController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:](v4, "initWithSetupDelegate:context:provisioningController:", v5, v6, v7);

    -[PKApplyControllerConfiguration setFeature:](v8, "setFeature:", self->_featureIdentifier);
    -[PKApplyControllerConfiguration setApplicationType:](v8, "setApplicationType:", 1);
    v9 = -[PKApplyController initWithApplyConfiguration:]([PKApplyController alloc], "initWithApplyConfiguration:", v8);
    applyController = self->_applyController;
    self->_applyController = v9;

  }
  v11 = [PKApplyTermsAndConditionsViewController alloc];
  v12 = self->_applyController;
  -[PKOnBoardingViewController setupDelegate](self, "setupDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKApplyTermsAndConditionsViewController initWithController:setupDelegate:context:termsIdentifier:](v11, "initWithController:setupDelegate:context:termsIdentifier:", v12, v13, -[PKExplanationViewController context](self, "context"), 0);

  -[PKFeatureTermsAndConditionsViewController setUseModalPresentation:](v14, "setUseModalPresentation:", 1);
  -[PKFeatureOnBoardingViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pk_presentPaymentSetupViewController:animated:completion:", v14, 1, 0);

}

- (void)_openSecondaryActionItem
{
  void *v3;
  PKPaymentMoreInformationViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  PKNavigationController *v8;
  void *v9;
  id v10;

  -[PKOnBoardingViewController currentPage](self, "currentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryActionItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v4 = -[PKPaymentMoreInformationViewController initWithContext:]([PKPaymentMoreInformationViewController alloc], "initWithContext:", -[PKExplanationViewController context](self, "context"));
    objc_msgSend(v10, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setDetailTitle:](v4, "setDetailTitle:", v5);

    objc_msgSend(v10, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setDetailSubtitle:](v4, "setDetailSubtitle:", v6);

    objc_msgSend(v10, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMoreInformationViewController setDetailBody:](v4, "setDetailBody:", v7);

    v8 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v4);
    -[PKFeatureOnBoardingViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentModalViewController:withPaymentSetupContext:", v8, -[PKExplanationViewController context](self, "context"));

  }
}

- (void)_reportContinueTapped
{
  void *v3;
  id v4;

  -[PKFeatureOnBoardingViewController _analyticsPartialEventDictionaryForButtonTapWithButtonTagKey:](self, "_analyticsPartialEventDictionaryForButtonTapWithButtonTagKey:", *MEMORY[0x1E0D68958]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKFeatureOnBoardingViewController _subjectForFeature:](self, "_subjectForFeature:", self->_featureIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFeatureOnBoardingViewController _reportAnalyticsSubject:withPartialEventDictionary:](self, "_reportAnalyticsSubject:withPartialEventDictionary:", v3, v4);

  if (self->_featureIdentifier == 2)
    -[PKFeatureOnBoardingViewController _reportAnalyticsSubject:withPartialEventDictionary:](self, "_reportAnalyticsSubject:withPartialEventDictionary:", *MEMORY[0x1E0D698C0], v4);

}

- (void)_reportCancelTapped
{
  void *v3;
  id v4;

  -[PKFeatureOnBoardingViewController _analyticsPartialEventDictionaryForButtonTapWithButtonTagKey:](self, "_analyticsPartialEventDictionaryForButtonTapWithButtonTagKey:", *MEMORY[0x1E0D688E8]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKFeatureOnBoardingViewController _subjectForFeature:](self, "_subjectForFeature:", self->_featureIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFeatureOnBoardingViewController _reportAnalyticsSubject:withPartialEventDictionary:](self, "_reportAnalyticsSubject:withPartialEventDictionary:", v3, v4);

}

- (void)_reportRatesAndTermsTapped
{
  id v3;

  -[PKFeatureOnBoardingViewController _analyticsPartialEventDictionaryForButtonTapWithButtonTagKey:](self, "_analyticsPartialEventDictionaryForButtonTapWithButtonTagKey:", *MEMORY[0x1E0D69390]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKFeatureOnBoardingViewController _reportAnalyticsSubject:withPartialEventDictionary:](self, "_reportAnalyticsSubject:withPartialEventDictionary:", *MEMORY[0x1E0D698C8], v3);

}

- (id)_analyticsPartialEventDictionaryForButtonTapWithButtonTagKey:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68B18], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D68858]);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (void)_reportAnalyticsSubject:(id)a3 withPartialEventDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && self->_featureSupportsAnalytics)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __88__PKFeatureOnBoardingViewController__reportAnalyticsSubject_withPartialEventDictionary___block_invoke;
    v9[3] = &unk_1E3E6DA70;
    v10 = v7;
    v11 = v6;
    -[PKFeatureOnBoardingViewController _defaultFeatureAccountAnalyticsWithCompletion:](self, "_defaultFeatureAccountAnalyticsWithCompletion:", v9);

  }
}

void __88__PKFeatureOnBoardingViewController__reportAnalyticsSubject_withPartialEventDictionary___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithDictionary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *(_QWORD *)(a1 + 40), v5);
}

- (void)_defaultFeatureAccountAnalyticsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_featureSupportsAnalytics)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __83__PKFeatureOnBoardingViewController__defaultFeatureAccountAnalyticsWithCompletion___block_invoke;
      v6[3] = &unk_1E3E6DA98;
      v6[4] = self;
      v7 = v4;
      -[PKFeatureOnBoardingViewController _defaultFeatureAccountWithCompletion:](self, "_defaultFeatureAccountWithCompletion:", v6);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

void __83__PKFeatureOnBoardingViewController__defaultFeatureAccountAnalyticsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  id v18;

  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "installmentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)MEMORY[0x1E0D68648];
  if (!v2)
    v3 = (id *)MEMORY[0x1E0D68650];
  v4 = *v3;

  objc_msgSend(v18, "setObject:forKey:", v4, *MEMORY[0x1E0D68F50]);
  PKFeatureIdentifierToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v5, *MEMORY[0x1E0D68C90]);

  objc_msgSend(*(id *)(a1 + 32), "currentPage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentPage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v9, *MEMORY[0x1E0D68670]);

  }
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1128);
  if (v10)
  {
    objc_msgSend(v10, "analyticsEventAccountType");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (id)*MEMORY[0x1E0D68AB8];
  }
  v12 = v11;
  if (v11)
    objc_msgSend(v18, "setObject:forKey:", v11, *MEMORY[0x1E0D68AA8]);
  objc_msgSend(*(id *)(a1 + 32), "currentPage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layout");
  PKDynamicProvisioningPageLayoutToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v18, "setObject:forKey:", v14, *MEMORY[0x1E0D68DA8]);
  objc_msgSend(*(id *)(a1 + 32), "provisioningController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "referrerIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = (__CFString *)v16;
  else
    v17 = CFSTR("cid%3Dapy-510-510001");
  objc_msgSend(v18, "setObject:forKey:", v17, *MEMORY[0x1E0D688E0]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_defaultFeatureAccountWithCompletion:(id)a3
{
  _QWORD *v4;
  void *v5;
  void (*v6)(void);
  NSMutableArray *defaultFeatureAccountCompletions;
  void *v8;
  void *v9;
  unint64_t featureIdentifier;
  _QWORD v11[5];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_featureSupportsAnalytics)
    {
      if (!self->_defaultFeatureAccount && !self->_fetchedDefaultFeatureAccount)
      {
        defaultFeatureAccountCompletions = self->_defaultFeatureAccountCompletions;
        v8 = _Block_copy(v4);
        -[NSMutableArray addObject:](defaultFeatureAccountCompletions, "addObject:", v8);

        objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        featureIdentifier = self->_featureIdentifier;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __74__PKFeatureOnBoardingViewController__defaultFeatureAccountWithCompletion___block_invoke;
        v11[3] = &unk_1E3E61D40;
        v11[4] = self;
        objc_msgSend(v9, "defaultAccountForFeature:completion:", featureIdentifier, v11);

        goto LABEL_8;
      }
      v6 = (void (*)(void))v4[2];
    }
    else
    {
      v6 = (void (*)(void))v4[2];
    }
    v6();
  }
LABEL_8:

}

void __74__PKFeatureOnBoardingViewController__defaultFeatureAccountWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__PKFeatureOnBoardingViewController__defaultFeatureAccountWithCompletion___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __74__PKFeatureOnBoardingViewController__defaultFeatureAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1128), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1136) = 1;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "removeAllObjects");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_beginReportingIfNecessary
{
  void *v3;
  void *v4;
  void *v5;

  -[PKFeatureOnBoardingViewController _subjectForFeature:](self, "_subjectForFeature:", self->_featureIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v5;
    if (!v4)
    {
      self->_didBeginOnboardingSubject = 1;
      objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v5);
      v3 = v5;
    }
  }

}

- (void)_endReportingIfNecessary
{
  void *v2;
  id v3;

  if (self->_didBeginOnboardingSubject)
  {
    v2 = (void *)MEMORY[0x1E0D66A58];
    -[PKFeatureOnBoardingViewController _subjectForFeature:](self, "_subjectForFeature:", self->_featureIdentifier);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endSubjectReporting:", v3);

  }
}

- (id)_subjectForFeature:(unint64_t)a3
{
  id *v3;

  switch(a3)
  {
    case 2uLL:
      v3 = (id *)MEMORY[0x1E0D698C8];
      break;
    case 3uLL:
      v3 = (id *)MEMORY[0x1E0D69920];
      break;
    case 5uLL:
      v3 = (id *)MEMORY[0x1E0D698F0];
      break;
    default:
      return 0;
  }
  return *v3;
}

- (id)_appleCardWelcomeExperiment
{
  PKAppleCardWelcomeExperiment *appleCardWelcomeExperiment;
  PKAppleCardWelcomeExperiment *v4;
  PKAppleCardWelcomeExperiment *v5;

  appleCardWelcomeExperiment = self->_appleCardWelcomeExperiment;
  if (!appleCardWelcomeExperiment)
  {
    if (self->_featureIdentifier == 2)
    {
      v4 = (PKAppleCardWelcomeExperiment *)objc_alloc_init(MEMORY[0x1E0D66A80]);
      v5 = self->_appleCardWelcomeExperiment;
      self->_appleCardWelcomeExperiment = v4;

      appleCardWelcomeExperiment = self->_appleCardWelcomeExperiment;
    }
    else
    {
      appleCardWelcomeExperiment = 0;
    }
  }
  return appleCardWelcomeExperiment;
}

- (id)loadHeroImageFromWelcomeExperiment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKFeatureOnBoardingViewController _appleCardWelcomeExperiment](self, "_appleCardWelcomeExperiment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_installmentConfiguration)
    objc_msgSend(v3, "heroInstallmentImagePath");
  else
    objc_msgSend(v3, "heroImagePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithContentsOfFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_installmentConfiguration, a3);
}

- (PKApplyController)applyController
{
  return self->_applyController;
}

- (void)setApplyController:(id)a3
{
  objc_storeStrong((id *)&self->_applyController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_appleCardWelcomeExperiment, 0);
  objc_storeStrong((id *)&self->_defaultFeatureAccountCompletions, 0);
  objc_storeStrong((id *)&self->_defaultFeatureAccount, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
}

@end
