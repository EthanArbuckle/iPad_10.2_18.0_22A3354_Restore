@implementation SBLostModeBiometricAuthenticationTransientOverlayViewController

- (SBLostModeBiometricAuthenticationTransientOverlayViewController)initWithLockScreenManager:(id)a3 biometricResource:(id)a4
{
  id v7;
  id v8;
  SBLostModeBiometricAuthenticationTransientOverlayViewController *v9;
  SBLostModeBiometricAuthenticationTransientOverlayViewController *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBLostModeBiometricAuthenticationTransientOverlayViewController;
  v9 = -[SBLostModeBiometricAuthenticationTransientOverlayViewController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lockScreenManager, a3);
    objc_storeStrong((id *)&v10->_biometricResource, a4);
    objc_msgSend(v7, "coverSheetViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerExternalLockProvider:", v10);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SBLockScreenManager coverSheetViewController](self->_lockScreenManager, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterExternalLockProvider:", self);
  if (!self->_didAuthenticate)
  {
    -[SBLostModeBiometricAuthenticationTransientOverlayViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lostModeBiometricAuthenticationViewControllerDidFailOrCancelAuthentication:", self);

  }
  v5.receiver = self;
  v5.super_class = (Class)SBLostModeBiometricAuthenticationTransientOverlayViewController;
  -[SBTransientOverlayViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CSPasscodeBackgroundView *v12;
  CSPasscodeBackgroundView *backgroundView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UILabel *v19;
  UILabel *titleLabel;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  UILabel *v30;
  UILabel *subtitleLabel;
  UILabel *v32;
  void *v33;
  UILabel *v34;
  void *v35;
  id v36;
  UILabel *v37;
  void *v38;
  UIStackView *v39;
  UIStackView *labelsStackView;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  UIButton *v47;
  UIButton *biometricAuthButton;
  UIButton *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  UIButton *v57;
  UIButton *cancelButton;
  UIButton *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  UIButton *v65;
  UIButton *emergencyButton;
  UIButton *v67;
  void *v68;
  UILayoutGuide *v69;
  UILayoutGuide *layoutGuide;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  UIButton *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  void *v89;
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
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  objc_super v127;
  _QWORD v128[2];
  _QWORD v129[13];
  _QWORD v130[4];

  v130[2] = *MEMORY[0x1E0C80C00];
  v127.receiver = self;
  v127.super_class = (Class)SBLostModeBiometricAuthenticationTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v127, sel_viewDidLoad);
  -[SBLostModeBiometricAuthenticationTransientOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (CSPasscodeBackgroundView *)objc_alloc_init(MEMORY[0x1E0D1BC08]);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v12;

  -[CSPasscodeBackgroundView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
  -[CSPasscodeBackgroundView setFrame:](self->_backgroundView, "setFrame:", v5, v7, v9, v11);
  -[CSPasscodeBackgroundView setWeighting:](self->_backgroundView, "setWeighting:", 1.0);
  objc_msgSend(v3, "addSubview:", self->_backgroundView);
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("LOST_MODE_BIO_AUTHENTICATION_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLostModeBiometricAuthenticationTransientOverlayViewController _biometricCapabilityText](self, "_biometricCapabilityText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();

  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v19;

  v21 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinKeypadStatusTitleViewTitleFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v21, "setFont:", v22);

  v23 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v23, "setTextColor:", v24);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v125 = (void *)v18;
  -[UILabel setText:](self->_titleLabel, "setText:", v18);
  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("LOST_MODE_BIO_AUTHENTICATION_SUBTITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLostModeBiometricAuthenticationTransientOverlayViewController _biometricCapabilityText](self, "_biometricCapabilityText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", v27, v28);
  v29 = objc_claimAutoreleasedReturnValue();

  v30 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v30;

  v32 = self->_subtitleLabel;
  objc_msgSend(MEMORY[0x1E0DA9E68], "pinKeypadStatusSubtitleViewTitleFont");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v32, "setFont:", v33);

  v34 = self->_subtitleLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v34, "setTextColor:", v35);

  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_subtitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v124 = (void *)v29;
  -[UILabel setText:](self->_subtitleLabel, "setText:", v29);
  v36 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  v37 = self->_subtitleLabel;
  v130[0] = self->_titleLabel;
  v130[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (UIStackView *)objc_msgSend(v36, "initWithArrangedSubviews:", v38);
  labelsStackView = self->_labelsStackView;
  self->_labelsStackView = v39;

  -[UIStackView setAxis:](self->_labelsStackView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_labelsStackView, "setSpacing:", 5.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_labelsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_labelsStackView);
  objc_msgSend(MEMORY[0x1E0CEA3A8], "filledButtonConfiguration");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setBaseBackgroundColor:", v42);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setBaseForegroundColor:", v43);

  objc_msgSend(v41, "setCornerStyle:", 4);
  -[SBLostModeBiometricAuthenticationTransientOverlayViewController _biometricCapabilityText](self, "_biometricCapabilityText");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTitle:", v44);

  v45 = (void *)MEMORY[0x1E0CEA3A0];
  -[SBLostModeBiometricAuthenticationTransientOverlayViewController _biometricAuthenticationButtonAction](self, "_biometricAuthenticationButtonAction");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v41;
  objc_msgSend(v45, "buttonWithConfiguration:primaryAction:", v41, v46);
  v47 = (UIButton *)objc_claimAutoreleasedReturnValue();
  biometricAuthButton = self->_biometricAuthButton;
  self->_biometricAuthButton = v47;

  v49 = self->_biometricAuthButton;
  v50 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB5C0], 0x8000, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "fontWithDescriptor:size:", v51, 0.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setFont:](v49, "setFont:", v52);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_biometricAuthButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", self->_biometricAuthButton);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("LOST_MODE_BIO_AUTHENTICATION_CANCEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v54 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = (void *)v54;
  objc_msgSend(v55, "setTitle:", v54);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setBaseForegroundColor:", v56);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v57 = (UIButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v57;

  v121 = v55;
  -[UIButton setConfiguration:](self->_cancelButton, "setConfiguration:", v55);
  v59 = self->_cancelButton;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v59, "setTitleColor:forState:", v60, 0);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_cancelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, sel__handleCancelButtonAction, 64);
  v126 = v3;
  objc_msgSend(v3, "addSubview:", self->_cancelButton);
  if (-[SBLostModeBiometricAuthenticationTransientOverlayViewController _hasTelephonyCapability](self, "_hasTelephonyCapability"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("LOST_MODE_BIO_AUTHENTICATION_EMERGENCY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setTitle:", v62);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setBaseForegroundColor:", v64);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v65 = (UIButton *)objc_claimAutoreleasedReturnValue();
    emergencyButton = self->_emergencyButton;
    self->_emergencyButton = v65;

    -[UIButton setConfiguration:](self->_emergencyButton, "setConfiguration:", v63);
    v67 = self->_emergencyButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v67, "setTitleColor:forState:", v68, 0);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_emergencyButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](self->_emergencyButton, "addTarget:action:forControlEvents:", self, sel__handleEmergencyButtonAction, 64);
    objc_msgSend(v3, "addSubview:", self->_emergencyButton);

  }
  v69 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
  layoutGuide = self->_layoutGuide;
  self->_layoutGuide = v69;

  objc_msgSend(v3, "addLayoutGuide:", self->_layoutGuide);
  v105 = (void *)MEMORY[0x1E0CB3718];
  -[UILayoutGuide topAnchor](self->_layoutGuide, "topAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToAnchor:", v119);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v118;
  -[UILayoutGuide leadingAnchor](self->_layoutGuide, "leadingAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "constraintEqualToAnchor:", v116);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v129[1] = v115;
  -[UILayoutGuide trailingAnchor](self->_layoutGuide, "trailingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:", v113);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v129[2] = v112;
  -[UILayoutGuide heightAnchor](self->_layoutGuide, "heightAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:multiplier:", v110, 0.5);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v129[3] = v109;
  -[UIStackView bottomAnchor](self->_labelsStackView, "bottomAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_layoutGuide, "bottomAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:constant:", v107, -10.0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v129[4] = v106;
  -[UIStackView leadingAnchor](self->_labelsStackView, "leadingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToAnchor:constant:", v103, 50.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v129[5] = v102;
  -[UIStackView trailingAnchor](self->_labelsStackView, "trailingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:constant:", v100, -50.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v129[6] = v99;
  -[UIButton heightAnchor](self->_biometricAuthButton, "heightAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToConstant:", 50.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v129[7] = v97;
  -[UIButton centerXAnchor](self->_biometricAuthButton, "centerXAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v95);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v129[8] = v94;
  -[UIButton topAnchor](self->_biometricAuthButton, "topAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_layoutGuide, "bottomAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:constant:", v92, 10.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v129[9] = v91;
  -[UIButton widthAnchor](self->_biometricAuthButton, "widthAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToConstant:", 175.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v129[10] = v72;
  -[UIButton trailingAnchor](self->_cancelButton, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74, -30.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v129[11] = v75;
  -[UIButton bottomAnchor](self->_cancelButton, "bottomAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "bottomAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLostModeBiometricAuthenticationTransientOverlayViewController _buttonsBottomSpacing](self, "_buttonsBottomSpacing");
  objc_msgSend(v76, "constraintLessThanOrEqualToAnchor:constant:", v77, -v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v129[12] = v79;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 13);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "activateConstraints:", v80);

  v81 = self->_emergencyButton;
  if (v81)
  {
    v82 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton leadingAnchor](v81, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:constant:", v84, 30.0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v128[0] = v85;
    -[UIButton bottomAnchor](self->_emergencyButton, "bottomAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "bottomAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLostModeBiometricAuthenticationTransientOverlayViewController _buttonsBottomSpacing](self, "_buttonsBottomSpacing");
    objc_msgSend(v86, "constraintLessThanOrEqualToAnchor:constant:", v87, -v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v128[1] = v89;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 2);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "activateConstraints:", v90);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBLostModeBiometricAuthenticationTransientOverlayViewController;
  -[SBLostModeBiometricAuthenticationTransientOverlayViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (!self->_didAuthenticate)
  {
    -[SBLostModeBiometricAuthenticationTransientOverlayViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lostModeBiometricAuthenticationViewControllerDidFailOrCancelAuthentication:", self);

  }
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return 1;
}

- (BOOL)isLocked
{
  return 1;
}

- (BOOL)showPasscode
{
  return 0;
}

- (BOOL)unlockFromSource:(int)a3
{
  return 0;
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (double)_buttonsBottomSpacing
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  double v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  double v22;
  int v23;
  int v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v33;
  int v34;
  double v35;
  int v36;
  double v37;
  double v38;
  int v39;
  int v40;
  double v41;
  double v42;
  double v43;
  int v44;
  int v45;
  double v46;
  double v47;
  int v48;
  int v49;
  int v50;
  int v51;
  double v52;
  int v53;
  double v54;
  double v55;
  int v56;
  int v57;
  double v58;
  double v59;
  double v60;
  int v61;
  int v62;
  int v63;
  double v64;
  double v65;
  int v66;
  int v67;
  int v68;
  int v69;
  double v70;
  double v71;
  double v72;
  int v73;
  double v74;
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
  void *v89;
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
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  int v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  int v130;
  int v131;
  uint64_t v132;
  int v133;
  __int128 v134;
  _BYTE v135[12];
  _BYTE v136[40];
  _BYTE v137[12];
  __int128 v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  uint64_t v145;
  int v146;

  if ((unint64_t)(objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") - 1) > 1)
  {
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    v138 = 0uLL;
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v139 = 0;
    v140 = 0;
    v129 = 0;
    v141 = 0;
    v128 = 0;
    v142 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v143 = 0;
    v125 = 0;
    v144 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v145 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v146 = 0;
    v15 = 21.0;
    goto LABEL_69;
  }
  v6 = __sb__runningInSpringBoard();
  if (v6)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v7 = 0;
      v8 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v123, "userInterfaceIdiom") != 1)
    {
      v7 = 0;
      v8 = 1;
      goto LABEL_12;
    }
  }
  v8 = v6 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "_referenceBounds");
    }
    v7 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v27 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      HIDWORD(v145) = v2 ^ 1;
      v146 = v8;
      memset(v136, 0, sizeof(v136));
      memset(v135, 0, sizeof(v135));
      memset(v137, 0, sizeof(v137));
      v138 = 0uLL;
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v139 = 0;
      v140 = 0;
      v129 = 0;
      v141 = 0;
      v128 = 0;
      v142 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v143 = 0;
      v125 = 0;
      v144 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      LODWORD(v145) = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 208);
      goto LABEL_69;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_12:
  v16 = __sb__runningInSpringBoard();
  HIDWORD(v145) = v7;
  v146 = v8;
  if (v16)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v3 = 0;
      v17 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v122, "userInterfaceIdiom") != 1)
    {
      v3 = 0;
      v17 = 1;
      goto LABEL_21;
    }
  }
  v17 = v16 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "_referenceBounds");
    }
    v3 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v144 = v2 ^ 1;
      LODWORD(v145) = v17;
      memset(v136, 0, sizeof(v136));
      memset(v135, 0, sizeof(v135));
      memset(v137, 0, sizeof(v137));
      v138 = 0uLL;
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v139 = 0;
      v140 = 0;
      v129 = 0;
      v141 = 0;
      v128 = 0;
      v142 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v143 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 248);
      goto LABEL_69;
    }
  }
  else
  {
    v3 = 0;
  }
LABEL_21:
  v18 = __sb__runningInSpringBoard();
  v144 = v3;
  LODWORD(v145) = v17;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v4 = 0;
      v19 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v121, "userInterfaceIdiom") != 1)
    {
      v4 = 0;
      v19 = 1;
      goto LABEL_30;
    }
  }
  v19 = v18 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "_referenceBounds");
    }
    v4 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v142 = v2 ^ 1;
      v143 = v19;
      memset(v136, 0, sizeof(v136));
      memset(v135, 0, sizeof(v135));
      memset(v137, 0, sizeof(v137));
      v138 = 0uLL;
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v139 = 0;
      v140 = 0;
      v129 = 0;
      v141 = 0;
      v128 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 232);
      goto LABEL_69;
    }
  }
  else
  {
    v4 = 0;
  }
LABEL_30:
  v20 = __sb__runningInSpringBoard();
  v142 = v4;
  v143 = v19;
  if (v20)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v21 = 0;
      v5 = 0;
      goto LABEL_39;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v120, "userInterfaceIdiom") != 1)
    {
      v21 = 0;
      v5 = 1;
      goto LABEL_39;
    }
  }
  v5 = v20 ^ 1u;
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "_referenceBounds");
  }
  v21 = v2 ^ 1;
  BSSizeRoundForScale();
  if (v22 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v140 = v2 ^ 1;
    v141 = v5;
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    v138 = 0uLL;
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v139 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 240);
    goto LABEL_69;
  }
LABEL_39:
  v23 = __sb__runningInSpringBoard();
  v140 = v21;
  v141 = v5;
  if (v23)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v138) = 0;
      v24 = 0;
      goto LABEL_49;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v119, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v138) = 0;
      v24 = 1;
      goto LABEL_49;
    }
  }
  v24 = v23 ^ 1;
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "_referenceBounds");
  }
  HIDWORD(v138) = v2 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v139 = v24;
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    *(_QWORD *)&v138 = 0;
    v134 = 0uLL;
    DWORD2(v138) = 0;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 224);
    goto LABEL_69;
  }
LABEL_49:
  v26 = __sb__runningInSpringBoard();
  v139 = v24;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v138 + 4) = 0;
      goto LABEL_180;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v118, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v138 + 4) = 0x100000000;
      goto LABEL_180;
    }
  }
  DWORD2(v138) = v26 ^ 1;
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "_referenceBounds");
  }
  DWORD1(v138) = v2 ^ 1;
  BSSizeRoundForScale();
  if (v33 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    LODWORD(v138) = 0;
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 216);
    goto LABEL_69;
  }
LABEL_180:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_182;
LABEL_188:
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 200);
    LODWORD(v138) = v2 ^ 1;
    goto LABEL_69;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v116, "userInterfaceIdiom") == 1)
    goto LABEL_188;
LABEL_182:
  LODWORD(v138) = v2 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_186:
    *(_QWORD *)v137 = 0;
    goto LABEL_196;
  }
  v34 = __sb__runningInSpringBoard();
  if (v34)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_186;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v109, "userInterfaceIdiom"))
    {
      *(_DWORD *)v137 = 0;
      *(_DWORD *)&v137[4] = 1;
      goto LABEL_196;
    }
  }
  *(_DWORD *)&v137[4] = v34 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "_referenceBounds");
    }
    *(_DWORD *)v137 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v37 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      memset(v136, 0, sizeof(v136));
      *(_DWORD *)&v137[8] = 0;
      memset(v135, 0, sizeof(v135));
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 168);
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)v137 = 0;
  }
LABEL_196:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v136[36] = 0;
      *(_DWORD *)&v137[8] = 0;
      goto LABEL_206;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v110, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v136[36] = 0;
      *(_DWORD *)&v137[8] = 1;
      goto LABEL_206;
    }
  }
  *(_DWORD *)&v137[8] = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "_referenceBounds");
    }
    *(_DWORD *)&v136[36] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v35 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_210;
  }
  else
  {
    *(_DWORD *)&v136[36] = 0;
  }
LABEL_206:
  if (_SBF_Private_IsD94Like())
  {
    memset(v136, 0, 36);
    memset(v135, 0, sizeof(v135));
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 176);
    goto LABEL_69;
  }
LABEL_210:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_214:
    *(_QWORD *)&v136[28] = 0;
    goto LABEL_224;
  }
  v36 = __sb__runningInSpringBoard();
  if (v36)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_214;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v106, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v136[28] = 0;
      *(_DWORD *)&v136[32] = 1;
      goto LABEL_224;
    }
  }
  *(_DWORD *)&v136[32] = v36 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "_referenceBounds");
    }
    *(_DWORD *)&v136[28] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v42 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v136, 0, 28);
      memset(v135, 0, sizeof(v135));
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 184);
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)&v136[28] = 0;
  }
LABEL_224:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v136[24] = 0;
      *(_DWORD *)&v136[16] = 0;
      goto LABEL_234;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v108, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v136[16] = 0;
      *(_DWORD *)&v136[24] = 1;
      goto LABEL_234;
    }
  }
  *(_DWORD *)&v136[24] = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "_referenceBounds");
    }
    *(_DWORD *)&v136[16] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_238;
  }
  else
  {
    *(_DWORD *)&v136[16] = 0;
  }
LABEL_234:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v136[20] = 0;
    *(_OWORD *)v136 = 0uLL;
    memset(v135, 0, sizeof(v135));
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 192);
    goto LABEL_69;
  }
LABEL_238:
  v39 = __sb__runningInSpringBoard();
  if (v39)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v136[20] = 0;
      *(_DWORD *)&v136[12] = 0;
      goto LABEL_248;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v107, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v136[12] = 0;
      *(_DWORD *)&v136[20] = 1;
      goto LABEL_248;
    }
  }
  *(_DWORD *)&v136[20] = v39 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v40 = __sb__runningInSpringBoard();
    if (v40)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "_referenceBounds");
    }
    v2 = v40 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v136[12] = v2;
    if (v41 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      *(_QWORD *)v136 = 0;
      memset(v135, 0, sizeof(v135));
      *(_DWORD *)&v136[8] = 0;
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 152);
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)&v136[12] = 0;
  }
LABEL_248:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v136 = 0;
      *(_DWORD *)v135 = 0;
      goto LABEL_258;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v104, "userInterfaceIdiom"))
    {
      *(_DWORD *)v135 = 0;
      *(_DWORD *)v136 = 1;
      goto LABEL_258;
    }
  }
  *(_DWORD *)v136 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "_referenceBounds");
    }
    *(_DWORD *)v135 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_268;
  }
  else
  {
    *(_DWORD *)v135 = 0;
  }
LABEL_258:
  if (_SBF_Private_IsD54())
  {
    *(_QWORD *)&v136[4] = 0;
    *(_QWORD *)&v135[4] = 0;
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 160);
    goto LABEL_69;
  }
LABEL_268:
  v44 = __sb__runningInSpringBoard();
  if (v44)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v136[4] = 0;
      goto LABEL_278;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v103, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v136[4] = 0;
      *(_DWORD *)&v136[8] = 1;
      goto LABEL_278;
    }
  }
  *(_DWORD *)&v136[8] = v44 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v45 = __sb__runningInSpringBoard();
    if (v45)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "_referenceBounds");
    }
    v2 = v45 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v136[4] = v2;
    if (v46 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && _SBF_Private_IsN84OrSimilarDevice())
    {
      *(_QWORD *)&v135[4] = 0;
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 104);
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)&v136[4] = 0;
  }
LABEL_278:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v135[4] = 0;
      goto LABEL_288;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v100, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v135[4] = 0;
      *(_DWORD *)&v135[8] = 1;
      goto LABEL_288;
    }
  }
  *(_DWORD *)&v135[8] = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "_referenceBounds");
    }
    *(_DWORD *)&v135[4] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v47 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_297;
  }
  else
  {
    *(_DWORD *)&v135[4] = 0;
  }
LABEL_288:
  if (_SBF_Private_IsD33OrSimilarDevice() && _SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 112);
    goto LABEL_69;
  }
LABEL_297:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_301:
    HIDWORD(v134) = 0;
    LODWORD(v134) = 0;
    goto LABEL_308;
  }
  v48 = __sb__runningInSpringBoard();
  if (v48)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_301;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v95, "userInterfaceIdiom"))
    {
      LODWORD(v134) = 0;
      HIDWORD(v134) = 1;
      goto LABEL_308;
    }
  }
  HIDWORD(v134) = v48 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "_referenceBounds");
    }
    v2 = v49 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v134) = v2;
    if (v54 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      *(_QWORD *)((char *)&v134 + 4) = 0;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 88);
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v134) = 0;
  }
LABEL_308:
  v50 = __sb__runningInSpringBoard();
  if (v50)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      DWORD2(v134) = 0;
      v2 = 0;
      goto LABEL_318;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v99, "userInterfaceIdiom"))
    {
      v2 = 0;
      DWORD2(v134) = 1;
      goto LABEL_318;
    }
  }
  DWORD2(v134) = v50 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v51 = __sb__runningInSpringBoard();
    if (v51)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "_referenceBounds");
    }
    v2 = v51 ^ 1u;
    BSSizeRoundForScale();
    if (v52 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_322;
  }
  else
  {
    v2 = 0;
  }
LABEL_318:
  if (_SBF_Private_IsD93Like())
  {
    DWORD1(v134) = v2;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 96);
    goto LABEL_69;
  }
LABEL_322:
  DWORD1(v134) = v2;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_326:
    v132 = 0;
    goto LABEL_336;
  }
  v53 = __sb__runningInSpringBoard();
  if (v53)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_326;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v90, "userInterfaceIdiom"))
    {
      v132 = 0x100000000;
      goto LABEL_336;
    }
  }
  HIDWORD(v132) = v53 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "_referenceBounds");
    }
    LODWORD(v132) = v2 ^ 1;
    BSSizeRoundForScale();
    if (v59 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v133 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 136);
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v132) = 0;
  }
LABEL_336:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v133 = 0;
      v131 = 0;
      goto LABEL_346;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v94, "userInterfaceIdiom"))
    {
      v131 = 0;
      v133 = 1;
      goto LABEL_346;
    }
  }
  v133 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "_referenceBounds");
    }
    v131 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v55 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_350;
  }
  else
  {
    v131 = 0;
  }
LABEL_346:
  if (_SBF_Private_IsD63Like())
  {
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 144);
    goto LABEL_69;
  }
LABEL_350:
  v56 = __sb__runningInSpringBoard();
  if (v56)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v129) = 0;
      HIDWORD(v127) = 0;
      goto LABEL_360;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v91, "userInterfaceIdiom"))
    {
      HIDWORD(v127) = 0;
      HIDWORD(v129) = 1;
      goto LABEL_360;
    }
  }
  HIDWORD(v129) = v56 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "_referenceBounds");
    }
    v2 = v57 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v127) = v2;
    if (v58 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      LODWORD(v129) = 0;
      v128 = 0;
      LODWORD(v127) = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 120);
      goto LABEL_69;
    }
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_360:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v129) = 0;
      HIDWORD(v128) = 0;
      goto LABEL_370;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v88, "userInterfaceIdiom"))
    {
      HIDWORD(v128) = 0;
      LODWORD(v129) = 1;
      goto LABEL_370;
    }
  }
  LODWORD(v129) = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "_referenceBounds");
    }
    HIDWORD(v128) = v2 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_380;
  }
  else
  {
    HIDWORD(v128) = 0;
  }
LABEL_370:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    LODWORD(v128) = 0;
    LODWORD(v127) = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 128);
    goto LABEL_69;
  }
LABEL_380:
  v61 = __sb__runningInSpringBoard();
  if (v61)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v128) = 0;
      LODWORD(v127) = 0;
      goto LABEL_390;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v87, "userInterfaceIdiom"))
    {
      LODWORD(v127) = 0;
      LODWORD(v128) = 1;
      goto LABEL_390;
    }
  }
  LODWORD(v128) = v61 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "_referenceBounds");
    }
    LODWORD(v127) = v2 ^ 1;
    BSSizeRoundForScale();
    if (v64 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 72);
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v127) = 0;
  }
LABEL_390:
  v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v126 = 0;
      v2 = 0;
      goto LABEL_400;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v84, "userInterfaceIdiom"))
    {
      v2 = 0;
      v126 = 1;
      goto LABEL_400;
    }
  }
  v126 = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v63 = __sb__runningInSpringBoard();
    if (v63)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "_referenceBounds");
    }
    v2 = v63 ^ 1u;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_407;
  }
  else
  {
    v2 = 0;
  }
LABEL_400:
  if (_SBF_Private_IsD53())
  {
    v130 = v2;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 80);
    goto LABEL_69;
  }
LABEL_407:
  v130 = v2;
  if (_SBF_Private_IsD16() && _SBF_Private_IsD52OrSimilarDevice())
  {
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 40);
    goto LABEL_69;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && _SBF_Private_IsD16())
  {
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 48);
    goto LABEL_69;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 24);
    goto LABEL_69;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 32);
    goto LABEL_69;
  }
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v125 = 0;
      v124 = 0;
      goto LABEL_427;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v78, "userInterfaceIdiom"))
    {
      v124 = 0;
      v125 = 1;
      goto LABEL_427;
    }
  }
  v125 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v66 = __sb__runningInSpringBoard();
    if (v66)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "_referenceBounds");
    }
    v124 = v66 ^ 1;
    BSSizeRoundForScale();
    if (v71 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 56);
      goto LABEL_69;
    }
  }
  else
  {
    v124 = 0;
  }
LABEL_427:
  v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_437;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v77, "userInterfaceIdiom"))
    {
      v10 = 0;
      v9 = 1;
      goto LABEL_437;
    }
  }
  v9 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v68 = __sb__runningInSpringBoard();
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "_referenceBounds");
    }
    v10 = v68 ^ 1;
    BSSizeRoundForScale();
    if (v72 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(double *)(MEMORY[0x1E0D1BB30] + 64);
      goto LABEL_69;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_437:
  v69 = __sb__runningInSpringBoard();
  if (v69)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v11 = 0;
      v12 = 0;
      goto LABEL_447;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v2, "userInterfaceIdiom"))
    {
      v12 = 0;
      v11 = 1;
      goto LABEL_447;
    }
  }
  v11 = v69 ^ 1;
  v3 = __sb__runningInSpringBoard();
  if ((_DWORD)v3)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "_referenceBounds");
  }
  v12 = v3 ^ 1;
  BSSizeRoundForScale();
  if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v13 = 0;
    v14 = 0;
    v15 = *(double *)(MEMORY[0x1E0D1BB30] + 16);
    goto LABEL_69;
  }
LABEL_447:
  v3 = __sb__runningInSpringBoard();
  if ((_DWORD)v3)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v13 = 0;
      v14 = 0;
LABEL_464:
      v15 = *MEMORY[0x1E0D1BB30];
      goto LABEL_69;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v5, "userInterfaceIdiom"))
    {
      v14 = 0;
      v13 = 1;
      goto LABEL_464;
    }
  }
  v13 = v3 ^ 1;
  v73 = __sb__runningInSpringBoard();
  if (v73)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v3, "_referenceBounds");
  }
  v14 = v73 ^ 1;
  BSSizeRoundForScale();
  if (v74 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_464;
  v15 = *(double *)(MEMORY[0x1E0D1BB30] + 8);
LABEL_69:
  if (v14)

  if (v13)
  if (v12)

  if (v11)
  if (v10)

  if (v9)
  if (v124)

  if (v125)
  if (v130)

  if (v126)
  if ((_DWORD)v127)

  if ((_DWORD)v128)
  if (HIDWORD(v128))

  if ((_DWORD)v129)
  if (HIDWORD(v127))

  if (HIDWORD(v129))
  if (v131)

  if (v133)
  if ((_DWORD)v132)

  if (HIDWORD(v132))
  if (DWORD1(v134))

  if (DWORD2(v134))
  if ((_DWORD)v134)

  if (HIDWORD(v134))
  if (*(_DWORD *)&v135[4])

  if (*(_DWORD *)&v135[8])
  if (*(_DWORD *)&v136[4])

  if (*(_DWORD *)&v136[8])
  if (*(_DWORD *)v135)

  if (*(_DWORD *)v136)
  if (*(_DWORD *)&v136[12])

  if (*(_DWORD *)&v136[20])
  if (*(_DWORD *)&v136[16])

  if (*(_DWORD *)&v136[24])
  if (*(_DWORD *)&v136[28])

  if (*(_DWORD *)&v136[32])
  if (*(_DWORD *)&v136[36])

  if (*(_DWORD *)&v137[8])
  if (*(_DWORD *)v137)

  if (*(_DWORD *)&v137[4])
  if ((_DWORD)v138)

  if (DWORD1(v138))
  if (DWORD2(v138))

  if (HIDWORD(v138))
  {

    if (!v139)
      goto LABEL_157;
  }
  else if (!v139)
  {
LABEL_157:
    if (v140)
      goto LABEL_158;
    goto LABEL_168;
  }

  if (v140)
  {
LABEL_158:

    if (!v141)
      goto LABEL_159;
    goto LABEL_169;
  }
LABEL_168:
  if (!v141)
  {
LABEL_159:
    if (v142)
      goto LABEL_160;
    goto LABEL_170;
  }
LABEL_169:

  if (v142)
  {
LABEL_160:

    if (!v143)
      goto LABEL_161;
    goto LABEL_171;
  }
LABEL_170:
  if (!v143)
  {
LABEL_161:
    if (v144)
      goto LABEL_162;
    goto LABEL_172;
  }
LABEL_171:

  if (v144)
  {
LABEL_162:

    if (!(_DWORD)v145)
      goto LABEL_163;
    goto LABEL_173;
  }
LABEL_172:
  if (!(_DWORD)v145)
  {
LABEL_163:
    if (HIDWORD(v145))
      goto LABEL_164;
    goto LABEL_174;
  }
LABEL_173:

  if (HIDWORD(v145))
  {
LABEL_164:

    if (!v146)
      return v15;
    goto LABEL_175;
  }
LABEL_174:
  if (v146)
LABEL_175:

  return v15;
}

- (void)_handleCancelButtonAction
{
  id v3;

  -[SBLostModeBiometricAuthenticationTransientOverlayViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lostModeBiometricAuthenticationViewControllerDidFailOrCancelAuthentication:", self);

}

- (void)_handleEmergencyButtonAction
{
  id v3;

  -[SBLostModeBiometricAuthenticationTransientOverlayViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lostModeBiometricAuthenticationViewControllerDidTapEmergencyButton:", self);

}

- (BOOL)_hasTelephonyCapability
{
  return MGGetBoolAnswer();
}

- (id)_biometricCapabilityText
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (-[SBUIBiometricResource hasMesaSupport](self->_biometricResource, "hasMesaSupport"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("LOST_MODE_BIO_AUTHENTICATION_TOUCH_ID");
  }
  else
  {
    if (!-[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport"))
    {
      v6 = 0;
      return v6;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("LOST_MODE_BIO_AUTHENTICATION_FACE_ID");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_biometricAuthenticationButtonAction
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA2A8];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __103__SBLostModeBiometricAuthenticationTransientOverlayViewController__biometricAuthenticationButtonAction__block_invoke;
  v5[3] = &unk_1E8EA3C88;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "actionWithHandler:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __103__SBLostModeBiometricAuthenticationTransientOverlayViewController__biometricAuthenticationButtonAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_runLocalAuthenticationEvaluation");
    WeakRetained = v2;
  }

}

- (void)_runLocalAuthenticationEvaluation
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Cannot evaluate local authentication policy with error: %@", a5, a6, a7, a8, 2u);
}

void __100__SBLostModeBiometricAuthenticationTransientOverlayViewController__runLocalAuthenticationEvaluation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __100__SBLostModeBiometricAuthenticationTransientOverlayViewController__runLocalAuthenticationEvaluation__block_invoke_2;
  v6[3] = &unk_1E8E9E820;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __100__SBLostModeBiometricAuthenticationTransientOverlayViewController__runLocalAuthenticationEvaluation__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(a1 + 40))
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __100__SBLostModeBiometricAuthenticationTransientOverlayViewController__runLocalAuthenticationEvaluation__block_invoke_2_cold_1(a1 + 40, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(v3, "lostModeBiometricAuthenticationViewControllerDidFailOrCancelAuthentication:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1472) = 1;
    objc_msgSend(v2, "lostModeBiometricAuthenticationViewControllerDidSucceedAuthentication:", *(_QWORD *)(a1 + 32));
  }

}

- (SBLostModeBiometricAuthenticationTransientOverlayViewControllerDelegate)delegate
{
  return (SBLostModeBiometricAuthenticationTransientOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_emergencyButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_biometricAuthButton, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
}

void __100__SBLostModeBiometricAuthenticationTransientOverlayViewController__runLocalAuthenticationEvaluation__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Failed lost mode biometric authentication with error: %@", a5, a6, a7, a8, 2u);
}

@end
