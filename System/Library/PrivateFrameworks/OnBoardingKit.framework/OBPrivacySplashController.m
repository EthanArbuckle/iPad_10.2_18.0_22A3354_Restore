@implementation OBPrivacySplashController

+ (id)splashPageWithBundleIdentifier:(id)a3
{
  id v3;
  OBPrivacySplashController *v4;

  v3 = a3;
  v4 = -[OBPrivacySplashController initWithPrivacyIdentifier:]([OBPrivacySplashController alloc], "initWithPrivacyIdentifier:", v3);

  return v4;
}

- (OBPrivacySplashController)initWithPrivacyIdentifier:(id)a3
{
  void *v4;
  void *v5;
  OBPrivacySplashController *v6;

  if (a3)
  {
    +[OBBundle bundleWithIdentifier:](OBBundle, "bundleWithIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privacyFlow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[OBPrivacySplashController initWithFlow:](self, "initWithFlow:", v5);

  }
  else
  {
    v6 = -[OBPrivacySplashController initWithFlow:](self, "initWithFlow:");
  }

  return v6;
}

- (id)_defaultButtonTitle
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashController displayLanguage](self, "displayLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("SPLASH_CONTINUE"), CFSTR("Localizable"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBPrivacySplashController;
  -[OBWelcomeController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (!-[OBPrivacySplashController suppressPerPageAnalyticsLogging](self, "suppressPerPageAnalyticsLogging"))
  {
    if (-[OBPrivacySplashController isMovingToParentViewController](self, "isMovingToParentViewController"))
    {
      +[OBAnalyticsManager sharedManager](OBAnalyticsManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacyFlow identifier](self->_flow, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logPresentationOfPrivacySplashWithIdentifier:", v5);

    }
  }
}

- (OBPrivacySplashController)initWithFlow:(id)a3
{
  id v5;
  OBPrivacySplashController *v6;
  void *v7;
  void *v8;
  OBPrivacySplashController *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OBPrivacySplashController;
  v6 = -[OBWelcomeController initWithTitle:detailText:icon:contentLayout:](&v11, sel_initWithTitle_detailText_icon_contentLayout_, &stru_1E37AB0D0, 0, 0, 2);
  if (v6)
  {
    if (!objc_msgSend(v5, "platformSupported"))
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_flow, a3);
    +[OBCapabilities sharedCapabilities](OBCapabilities, "sharedCapabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacySplashController setAllowsOpeningSafari:](v6, "setAllowsOpeningSafari:", objc_msgSend(v7, "preventOpeningSafari") ^ 1);

    -[OBPrivacySplashController setDisplayDeviceType:](v6, "setDisplayDeviceType:", 0);
    -[OBWelcomeController buttonTray](v6, "buttonTray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

  }
  v9 = v6;
LABEL_6:

  return v9;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBPrivacySplashController;
  -[OBWelcomeController loadView](&v6, sel_loadView);
  -[OBPrivacySplashController customTintColor](self, "customTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[OBPrivacySplashController customTintColor](self, "customTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacySplashController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v4);

  }
}

- (void)showUnifiedAbout:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  +[OBPrivacyPresenter presenterForPrivacyUnifiedAbout](OBPrivacyPresenter, "presenterForPrivacyUnifiedAbout", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashController displayLanguage](self, "displayLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "combinedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayLanguage:", v4);

  v6 = -[OBPrivacySplashController underlineLinks](self, "underlineLinks");
  objc_msgSend(v11, "combinedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUnderlineLinks:", v6);

  -[OBPrivacySplashController customTintColor](self, "customTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "combinedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCustomTintColor:", v8);

  objc_msgSend(v11, "setDarkMode:", -[OBWelcomeController darkMode](self, "darkMode"));
  objc_msgSend(v11, "setPresentingViewController:", self);
  -[OBPrivacySplashController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentInNavigationStack:animated:", v10, 1);

}

- (void)showPrivacyGateway:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashController displayLanguage](self, "displayLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("PRIVACY_HTTP_WEB_LINK"), CFSTR("Localizable"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openURL:options:completionHandler:", v8, MEMORY[0x1E0C9AA70], 0);

}

- (void)viewDidLoad
{
  void *v3;
  int v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBPrivacySplashController;
  -[OBBaseWelcomeController viewDidLoad](&v6, sel_viewDidLoad);
  -[OBPrivacySplashController _initializeFromBundle](self, "_initializeFromBundle");
  -[OBPrivacyFlow identifier](self->_flow, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.onboarding.privacypane"));

  if (v4)
    v5 = 2;
  else
    v5 = 1;
  -[OBWelcomeController setTemplateType:](self, "setTemplateType:", v5);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBPrivacySplashController;
  -[OBWelcomeController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", 0);

}

- (void)setCustomTintColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_customTintColor, a3);
  v5 = a3;
  -[OBPrivacySplashController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

}

- (void)_initializeFromBundle
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  OBPrivacyFlow *flow;
  void *v8;
  uint64_t v9;
  OBPrivacySplashListView *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  void *v43;
  _BOOL8 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
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
  OBPrivacyFlow *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  unint64_t v93;
  OBPrivacySplashListView *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  OBPrivacySplashListView *v118;
  _QWORD v119[2];
  void *v120;
  _QWORD v121[5];

  v121[3] = *MEMORY[0x1E0C80C00];
  +[OBCapabilities sharedCapabilities](OBCapabilities, "sharedCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "preventURLDataDetection"))
    v4 = 0;
  else
    v4 = 2;

  -[OBPrivacyFlow identifier](self->_flow, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.onboarding.privacypane"));

  flow = self->_flow;
  -[OBPrivacySplashController displayLanguage](self, "displayLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyFlow localizedContentListForLanguage:preferredDeviceType:](flow, "localizedContentListForLanguage:preferredDeviceType:", v8, -[OBPrivacySplashController displayDeviceType](self, "displayDeviceType"));
  v9 = objc_claimAutoreleasedReturnValue();

  v117 = (void *)v9;
  v10 = -[OBPrivacySplashListView initWithContentList:dataDetectorTypes:displayingPrivacyPane:]([OBPrivacySplashListView alloc], "initWithContentList:dataDetectorTypes:displayingPrivacyPane:", v9, v4, v6);
  -[OBPrivacySplashListView setUnderlineLinks:](v10, "setUnderlineLinks:", -[OBPrivacySplashController underlineLinks](self, "underlineLinks"));
  -[OBPrivacySplashListView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v118 = v10;
  if (-[OBPrivacySplashController showLinkToPrivacyGateway](self, "showLinkToPrivacyGateway"))
  {
    if (-[OBPrivacySplashController allowsOpeningSafari](self, "allowsOpeningSafari"))
    {
      +[OBPrivacyButton buttonWithType:](OBPrivacyButton, "buttonWithType:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacySplashController setLinkToPrivacyGatewayButton:](self, "setLinkToPrivacyGatewayButton:", v11);

      v12 = -[OBPrivacySplashController underlineLinks](self, "underlineLinks");
      -[OBPrivacySplashController linkToPrivacyGatewayButton](self, "linkToPrivacyGatewayButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setUnderlineLinks:", v12);

      -[OBPrivacySplashController linkToPrivacyGatewayButton](self, "linkToPrivacyGatewayButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacySplashController displayLanguage](self, "displayLanguage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("MANAGE_YOUR_DATA"), CFSTR("Localizable"), v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTitle:forState:", v17, 0);

      -[OBPrivacySplashController linkToPrivacyGatewayButton](self, "linkToPrivacyGatewayButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel_showPrivacyGateway_, 0x2000);

      -[OBPrivacySplashController linkToPrivacyGatewayButton](self, "linkToPrivacyGatewayButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "titleLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAdjustsFontSizeToFitWidth:", 1);

      -[OBPrivacySplashController linkToPrivacyGatewayButton](self, "linkToPrivacyGatewayButton");
    }
    else
    {
      v21 = objc_alloc(MEMORY[0x1E0DC3990]);
      v22 = *MEMORY[0x1E0C9D648];
      v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v26 = (void *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E0C9D648], v23, v24, v25);
      -[OBPrivacySplashController setPrivacyGatewayDescription:](self, "setPrivacyGatewayDescription:", v26);

      -[OBPrivacySplashController privacyGatewayDescription](self, "privacyGatewayDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacySplashController displayLanguage](self, "displayLanguage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("PRIVACY_WEB_DESCRIPTION"), CFSTR("Localizable"), v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setText:", v30);

      -[OBPrivacySplashController privacyGatewayDescription](self, "privacyGatewayDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setNumberOfLines:", 0);

      -[OBPrivacySplashController privacyGatewayDescription](self, "privacyGatewayDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAdjustsFontSizeToFitWidth:", 1);

      -[OBPrivacySplashController privacyGatewayDescription](self, "privacyGatewayDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTextAlignment:", 1);

      -[OBPrivacySplashController privacyGatewayDescription](self, "privacyGatewayDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacySplashListView addArrangedSubview:](v10, "addArrangedSubview:", v34);

      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v22, v23, v24, v25);
      -[OBPrivacySplashController setLinkToPrivacyGateway:](self, "setLinkToPrivacyGateway:", v35);

      -[OBPrivacySplashController linkToPrivacyGateway](self, "linkToPrivacyGateway");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacySplashController displayLanguage](self, "displayLanguage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("PRIVACY_WEB_LINK"), CFSTR("Localizable"), v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setText:", v39);

      -[OBPrivacySplashController linkToPrivacyGateway](self, "linkToPrivacyGateway");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setAdjustsFontSizeToFitWidth:", 1);

      -[OBPrivacySplashController linkToPrivacyGateway](self, "linkToPrivacyGateway");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setTextAlignment:", 1);

      -[OBPrivacySplashController linkToPrivacyGateway](self, "linkToPrivacyGateway");
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacySplashListView addArrangedSubview:](v10, "addArrangedSubview:", v42);

  }
  if (-[OBPrivacySplashController showsLinkToUnifiedAbout](self, "showsLinkToUnifiedAbout"))
  {
    +[OBPrivacyButton buttonWithType:](OBPrivacyButton, "buttonWithType:", 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacySplashController setUnifiedAboutButton:](self, "setUnifiedAboutButton:", v43);

    v44 = -[OBPrivacySplashController underlineLinks](self, "underlineLinks");
    -[OBPrivacySplashController unifiedAboutButton](self, "unifiedAboutButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setUnderlineLinks:", v44);

    -[OBPrivacySplashController unifiedAboutButton](self, "unifiedAboutButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacySplashController displayLanguage](self, "displayLanguage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("LEARN_MORE_FOOTER"), CFSTR("Localizable"), v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setTitle:forState:", v49, 0);

    -[OBPrivacySplashController unifiedAboutButton](self, "unifiedAboutButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addTarget:action:forControlEvents:", self, sel_showUnifiedAbout_, 0x2000);

    -[OBPrivacySplashController unifiedAboutButton](self, "unifiedAboutButton");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "titleLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setAdjustsFontSizeToFitWidth:", 1);

    v53 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v54 = (void *)objc_msgSend(v53, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[OBPrivacySplashController unifiedAboutButton](self, "unifiedAboutButton");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addSubview:", v55);

    -[OBPrivacySplashController unifiedAboutButton](self, "unifiedAboutButton");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v110 = (void *)MEMORY[0x1E0CB3718];
    -[OBPrivacySplashController unifiedAboutButton](self, "unifiedAboutButton");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "centerXAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "centerXAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:", v113);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = v112;
    -[OBPrivacySplashController unifiedAboutButton](self, "unifiedAboutButton");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v121[1] = v59;
    -[OBPrivacySplashController unifiedAboutButton](self, "unifiedAboutButton");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v121[2] = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 3);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "activateConstraints:", v64);

    -[OBPrivacySplashController customTintColor](self, "customTintColor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      -[OBPrivacySplashController customTintColor](self, "customTintColor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController headerView](self, "headerView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setTintColor:", v66);

    }
    v10 = v118;
    -[OBPrivacySplashListView addArrangedSubview:](v118, "addArrangedSubview:", v54);

  }
  -[OBWelcomeController contentView](self, "contentView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addSubview:", v10);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "topAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashListView topAnchor](v10, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v73;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addObjectsFromArray:", v74);

  -[OBWelcomeController contentView](self, "contentView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "bottomAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashListView bottomAnchor](v10, "bottomAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addObject:", v78);

  -[OBWelcomeController contentView](self, "contentView");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashListView leadingAnchor](v10, "leadingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v81;
  -[OBWelcomeController contentView](self, "contentView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "trailingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashListView trailingAnchor](v10, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v119[1] = v85;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addObjectsFromArray:", v86);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v69);
  -[OBPrivacySplashController updateFontForPrivacyGateway](self, "updateFontForPrivacyGateway");
  -[OBPrivacySplashController updateFontForUnifiedAboutButton](self, "updateFontForUnifiedAboutButton");
  v87 = self->_flow;
  -[OBPrivacySplashController displayLanguage](self, "displayLanguage");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyFlow localizedTitleForLanguage:preferredDeviceType:](v87, "localizedTitleForLanguage:preferredDeviceType:", v88, -[OBPrivacySplashController displayDeviceType](self, "displayDeviceType"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashController setTitle:](self, "setTitle:", v89);

  -[OBWelcomeController headerView](self, "headerView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashController title](self, "title");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setTitle:", v91);

  -[OBPrivacyFlow identifier](self->_flow, "identifier");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v92, "isEqualToString:", CFSTR("com.apple.onboarding.privacypane")))
  {
    v93 = -[OBWelcomeController templateType](self, "templateType");

    v94 = v118;
    if (v93 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacySplashController displayLanguage](self, "displayLanguage");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("PRIVACY_ICON_DESCRIPTION"), CFSTR("Localizable"), v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController headerView](self, "headerView");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "animationView");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setAccessibilityLabel:", v97);

      -[OBWelcomeController headerView](self, "headerView");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "animationView");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setIsAccessibilityElement:", 1);
LABEL_20:

      goto LABEL_21;
    }
  }
  else
  {

    v94 = v118;
  }
  -[OBPrivacyFlow buttonIcon](self->_flow, "buttonIcon");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  if (v102)
  {
    -[OBWelcomeController headerView](self, "headerView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyFlow buttonIcon](self->_flow, "buttonIcon");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacySplashController displayLanguage](self, "displayLanguage");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("PRIVACY_ICON_DESCRIPTION"), CFSTR("Localizable"), v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setIcon:accessibilityLabel:", v104, v107);

    -[OBWelcomeController headerView](self, "headerView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setIconInheritsTint:", 1);

    -[OBPrivacySplashController customTintColor](self, "customTintColor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    if (v109)
    {
      -[OBPrivacySplashController customTintColor](self, "customTintColor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController headerView](self, "headerView");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setTintColor:", v100);
      goto LABEL_20;
    }
  }
LABEL_21:

}

- (void)setDismissHandlerForDefaultButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[OBPrivacySplashController setDefaultButtonHandler:](self, "setDefaultButtonHandler:", a3);
  +[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[OBPrivacySplashController _defaultButtonTitle](self, "_defaultButtonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v4, 0);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_defaultButtonPressed_, 0x2000);
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addButton:", v7);

  -[OBWelcomeController buttonTray](self, "buttonTray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBPrivacySplashController;
  -[OBWelcomeController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[OBPrivacySplashController updateFontForPrivacyGateway](self, "updateFontForPrivacyGateway");
  -[OBPrivacySplashController updateFontForUnifiedAboutButton](self, "updateFontForUnifiedAboutButton");
}

- (void)updateFontForPrivacyGateway
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[OBPrivacySplashController linkToPrivacyGatewayButton](self, "linkToPrivacyGatewayButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  -[OBPrivacySplashController privacyGatewayDescription](self, "privacyGatewayDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v8);

  -[OBPrivacySplashController linkToPrivacyGateway](self, "linkToPrivacyGateway");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

}

- (void)updateFontForUnifiedAboutButton
{
  void *v2;
  void *v3;
  id v4;

  -[OBPrivacySplashController unifiedAboutButton](self, "unifiedAboutButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

}

- (void)defaultButtonPressed:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[OBPrivacySplashController defaultButtonHandler](self, "defaultButtonHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[OBPrivacySplashController defaultButtonHandler](self, "defaultButtonHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIColor)customTintColor
{
  return self->_customTintColor;
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

- (BOOL)suppressPerPageAnalyticsLogging
{
  return self->_suppressPerPageAnalyticsLogging;
}

- (void)setSuppressPerPageAnalyticsLogging:(BOOL)a3
{
  self->_suppressPerPageAnalyticsLogging = a3;
}

- (BOOL)allowsOpeningSafari
{
  return self->_allowsOpeningSafari;
}

- (void)setAllowsOpeningSafari:(BOOL)a3
{
  self->_allowsOpeningSafari = a3;
}

- (BOOL)showLinkToPrivacyGateway
{
  return self->_showLinkToPrivacyGateway;
}

- (void)setShowLinkToPrivacyGateway:(BOOL)a3
{
  self->_showLinkToPrivacyGateway = a3;
}

- (BOOL)showsLinkToUnifiedAbout
{
  return self->_showsLinkToUnifiedAbout;
}

- (void)setShowsLinkToUnifiedAbout:(BOOL)a3
{
  self->_showsLinkToUnifiedAbout = a3;
}

- (BOOL)forceLargeMargins
{
  return self->_forceLargeMargins;
}

- (void)setForceLargeMargins:(BOOL)a3
{
  self->_forceLargeMargins = a3;
}

- (NSString)displayLanguage
{
  return (NSString *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setDisplayLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (unint64_t)displayDeviceType
{
  return self->_displayDeviceType;
}

- (void)setDisplayDeviceType:(unint64_t)a3
{
  self->_displayDeviceType = a3;
}

- (BOOL)useModalStyle
{
  return self->_useModalStyle;
}

- (void)setUseModalStyle:(BOOL)a3
{
  self->_useModalStyle = a3;
}

- (BOOL)isCombined
{
  return self->_isCombined;
}

- (void)setIsCombined:(BOOL)a3
{
  self->_isCombined = a3;
}

- (OBPrivacyFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
  objc_storeStrong((id *)&self->_flow, a3);
}

- (UIButton)linkToPrivacyGatewayButton
{
  return (UIButton *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setLinkToPrivacyGatewayButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (UILabel)privacyGatewayDescription
{
  return (UILabel *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setPrivacyGatewayDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (UILabel)linkToPrivacyGateway
{
  return (UILabel *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setLinkToPrivacyGateway:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1232);
}

- (UIButton)unifiedAboutButton
{
  return (UIButton *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setUnifiedAboutButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1240);
}

- (id)defaultButtonHandler
{
  return objc_getProperty(self, a2, 1248, 1);
}

- (void)setDefaultButtonHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1248);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultButtonHandler, 0);
  objc_storeStrong((id *)&self->_unifiedAboutButton, 0);
  objc_storeStrong((id *)&self->_linkToPrivacyGateway, 0);
  objc_storeStrong((id *)&self->_privacyGatewayDescription, 0);
  objc_storeStrong((id *)&self->_linkToPrivacyGatewayButton, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_displayLanguage, 0);
  objc_storeStrong((id *)&self->_customTintColor, 0);
}

@end
