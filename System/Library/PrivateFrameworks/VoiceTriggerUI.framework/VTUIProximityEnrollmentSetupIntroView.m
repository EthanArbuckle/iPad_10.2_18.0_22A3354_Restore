@implementation VTUIProximityEnrollmentSetupIntroView

- (VTUIProximityEnrollmentSetupIntroView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  VTUIProximityEnrollmentSetupIntroView *v5;
  uint64_t v6;
  VTUIStyle *vtStyle;
  uint64_t v8;
  SSRVoiceProfileManager *voiceProfileMgr;
  void *v10;
  uint64_t v11;
  NSString *languageCode;
  _BOOL4 v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  v15.receiver = self;
  v15.super_class = (Class)VTUIProximityEnrollmentSetupIntroView;
  v5 = -[VTUIProximityEnrollmentSetupIntroView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v6 = objc_claimAutoreleasedReturnValue();
    vtStyle = v5->_vtStyle;
    v5->_vtStyle = (VTUIStyle *)v6;

    objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    voiceProfileMgr = v5->_voiceProfileMgr;
    v5->_voiceProfileMgr = (SSRVoiceProfileManager *)v8;

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "languageCode");
    v11 = objc_claimAutoreleasedReturnValue();
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v11;

    v13 = -[VTUIStyle currentLocaleSupportsCompactVoiceTrigger](v5->_vtStyle, "currentLocaleSupportsCompactVoiceTrigger");
    if (v13)
      LOBYTE(v13) = -[VTUIStyle proxAccessorySupportsCompactTrigger](v5->_vtStyle, "proxAccessorySupportsCompactTrigger");
    v5->_supportsCompactTrigger = v13;
    -[VTUIProximityEnrollmentSetupIntroView _setupContent](v5, "_setupContent");
    -[VTUIProximityEnrollmentSetupIntroView _setupConstraintsToSize:](v5, "_setupConstraintsToSize:", width, height);
  }
  return v5;
}

- (void)_setupContent
{
  NSObject *v3;
  VTUIProximityContainerView *v4;
  VTUIProximityContainerView *containerView;
  __CFString *v6;
  objc_class *v7;
  __CFString *v8;
  UILabel *v9;
  UILabel *titleLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  UIButton *v18;
  UIButton *dismissButton;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UILabel *v24;
  UILabel *subtitleLabel;
  UILabel *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  const __CFString *v30;
  UILabel *v31;
  void *v32;
  VTUIButton *v33;
  VTUIButton *setupButton;
  int v35;
  VTUIButton *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  VTUIButton *v40;
  VTUIButton *notNowButton;
  void *v42;
  void *v43;
  VTUIButton *v44;
  void *v45;
  void *v46;
  int v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v47 = 136315138;
    v48 = "-[VTUIProximityEnrollmentSetupIntroView _setupContent]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Setup content", (uint8_t *)&v47, 0xCu);
  }
  v4 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = v4;

  -[VTUIProximityContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityEnrollmentSetupIntroView addSubview:](self, "addSubview:", self->_containerView);
  if (self->_supportsCompactTrigger)
    v6 = CFSTR("PROX_INTRO_TITLE_JS");
  else
    v6 = CFSTR("PROX_INTRO_TITLE");
  v7 = (objc_class *)MEMORY[0x24BEBD708];
  v8 = v6;
  v9 = (UILabel *)objc_alloc_init(v7);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = self->_titleLabel;
  -[VTUIStyle proxHeaderFont](self->_vtStyle, "proxHeaderFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v11, "setFont:", v12);

  v13 = self->_titleLabel;
  -[VTUIStyle proxHeaderColor](self->_vtStyle, "proxHeaderColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v13, "setTextColor:", v14);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  v15 = self->_titleLabel;
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uiLocalizedStringForKey:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](v15, "setText:", v17);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_titleLabel);
  +[VTUIButton _vtuiProximityDismissButton](VTUIButton, "_vtuiProximityDismissButton");
  v18 = (UIButton *)objc_claimAutoreleasedReturnValue();
  dismissButton = self->_dismissButton;
  self->_dismissButton = v18;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_dismissButton);
  v20 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("OrbImage"), v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v22);
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_storeStrong((id *)&self->_orbImage, v23);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_orbImage);
  v24 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v24;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v26 = self->_subtitleLabel;
  -[VTUIStyle proxSubtitleFont](self->_vtStyle, "proxSubtitleFont");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v26, "setFont:", v27);

  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 2);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_subtitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v28 = self->_subtitleLabel;
  -[VTUIStyle proxSubtitleColor](self->_vtStyle, "proxSubtitleColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v28, "setTextColor:", v29);

  if (self->_supportsCompactTrigger)
    v30 = CFSTR("SIRI_AND_HEY_SIRI_DESCRIPTION_PROX");
  else
    v30 = CFSTR("HEY_SIRI_DESCRIPTION_PROX");
  v31 = self->_subtitleLabel;
  -[VTUIStyle proxHSDescription:](self->_vtStyle, "proxHSDescription:", v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v31, "setText:", v32);

  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_subtitleLabel);
  -[VTUIProximityEnrollmentSetupIntroView _setupTermsAndConditions](self, "_setupTermsAndConditions");
  +[VTUIButton _vtuiProximityButtonWithPrimaryStyle](VTUIButton, "_vtuiProximityButtonWithPrimaryStyle");
  v33 = (VTUIButton *)objc_claimAutoreleasedReturnValue();
  setupButton = self->_setupButton;
  self->_setupButton = v33;

  -[VTUIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_setupButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v35 = -[SSRVoiceProfileManager isSATEnrolledForSiriProfileId:forLanguageCode:](self->_voiceProfileMgr, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, self->_languageCode);
  v36 = self->_setupButton;
  if (v35)
    v37 = CFSTR("BUTTON_USE_SIRI");
  else
    v37 = CFSTR("BUTTON_SET_UP");
  -[VTUIStyle VTUIDeviceSpecificString:](self->_vtStyle, "VTUIDeviceSpecificString:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton setTitle:forState:](v36, "setTitle:forState:", v38, 0);

  -[VTUIButton titleLabel](self->_setupButton, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setNumberOfLines:", 0);

  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_setupButton);
  +[VTUIButton _vtuiButtonWithSecondaryStyle](VTUIButton, "_vtuiButtonWithSecondaryStyle");
  v40 = (VTUIButton *)objc_claimAutoreleasedReturnValue();
  notNowButton = self->_notNowButton;
  self->_notNowButton = v40;

  -[VTUIButton titleLabel](self->_notNowButton, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxCancelFont](self->_vtStyle, "proxCancelFont");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFont:", v43);

  -[VTUIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_notNowButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v44 = self->_notNowButton;
  -[VTUIStyle VTUIDeviceSpecificString:](self->_vtStyle, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CONS_NOT_NOW"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton setTitle:forState:](v44, "setTitle:forState:", v45, 0);

  -[VTUIButton titleLabel](self->_notNowButton, "titleLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setNumberOfLines:", 0);

  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_notNowButton);
}

- (void)_setupTermsAndConditions
{
  id v3;
  UITextView *v4;
  UITextView *termsAndConds;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  UITextView *v30;
  void *v31;
  UITextView *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBDA88]);
  -[VTUIProximityEnrollmentSetupIntroView bounds](self, "bounds");
  v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:");
  termsAndConds = self->_termsAndConds;
  self->_termsAndConds = v4;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_termsAndConds, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setTextContainerInset:](self->_termsAndConds, "setTextContainerInset:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  -[UITextView textContainer](self->_termsAndConds, "textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineFragmentPadding:", 0.0);

  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_termsAndConds);
  -[UITextView setDelegate:](self->_termsAndConds, "setDelegate:", self);
  v7 = CFSTR("PROX_FOOTER_CONS_JS");
  if (self->_supportsCompactTrigger)
    v8 = CFSTR("TEXT_FOOTER_CONS_REGULATORY_DISCLOSURE_JS");
  else
    v8 = CFSTR("TEXT_FOOTER_CONS_REGULATORY_DISCLOSURE");
  if (!self->_supportsCompactTrigger)
    v7 = CFSTR("PROX_FOOTER_CONS");
  v9 = v7;
  v10 = v8;
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isGreenTeaCapableDevice"))
    v13 = v10;
  else
    v13 = v9;
  objc_msgSend(v11, "VTUIDeviceSpecificString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CONS_ABOUT_SIRI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB490], "defaultParagraphStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "setAlignment:", 1);
  v19 = objc_alloc(MEMORY[0x24BDD1688]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v14, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *MEMORY[0x24BEBB3A8];
  v35[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "initWithString:attributes:", v20, v21);

  if (objc_msgSend(v16, "length"))
  {
    v23 = objc_msgSend(v14, "length") + 1;
    v24 = objc_msgSend(v16, "length");
    v25 = *MEMORY[0x24BEBB368];
    -[VTUIStyle footerTextColor](self->_vtStyle, "footerTextColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAttribute:value:range:", v25, v26, 0, v23);

    -[VTUIStyle buttonTextColor](self->_vtStyle, "buttonTextColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAttribute:value:range:", v25, v27, v23, v24);

    v28 = *MEMORY[0x24BEBB388];
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24F340078);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAttribute:value:range:", v28, v29, v23, v24);

    v30 = self->_termsAndConds;
    -[VTUIStyle footerFont](self->_vtStyle, "footerFont");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v30, "setFont:", v31);

    v32 = self->_termsAndConds;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v32, "setBackgroundColor:", v33);

    -[UITextView setAttributedText:](self->_termsAndConds, "setAttributedText:", v22);
    -[UITextView setEditable:](self->_termsAndConds, "setEditable:", 0);
    -[UITextView setScrollEnabled:](self->_termsAndConds, "setScrollEnabled:", 0);
    -[UITextView setDataDetectorTypes:](self->_termsAndConds, "setDataDetectorTypes:", 2);
    -[UITextView _setInteractiveTextSelectionDisabled:](self->_termsAndConds, "_setInteractiveTextSelectionDisabled:", 1);
  }

}

- (void)_setupConstraintsToSize:(CGSize)a3
{
  _BOOL8 v4;

  v4 = -[VTUIProximityView _shouldUsePhoneLandscapeLayoutForSize:](self, "_shouldUsePhoneLandscapeLayoutForSize:", a3.width, a3.height);
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", v4);
  if (v4)
    -[VTUIProximityEnrollmentSetupIntroView _setupPhoneLandscapeConstraints](self, "_setupPhoneLandscapeConstraints");
  else
    -[VTUIProximityEnrollmentSetupIntroView _setupPortraitConstraints](self, "_setupPortraitConstraints");
}

- (void)_setupPhoneLandscapeConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSArray *v62;
  NSArray *viewConstraints;
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
  void *v87;
  void *v88;
  _QWORD v89[4];
  _QWORD v90[4];
  _QWORD v91[2];
  _QWORD v92[4];
  _QWORD v93[3];
  _QWORD v94[4];
  _QWORD v95[6];

  v95[4] = *MEMORY[0x24BDAC8D0];
  -[VTUIProximityEnrollmentSetupIntroView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView centerXAnchor](self->_containerView, "centerXAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "centerXAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v73);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v68;
  -[VTUIProximityContainerView widthAnchor](self->_containerView, "widthAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxViewMaxWidthPhoneLandscape](self->_vtStyle, "proxViewMaxWidthPhoneLandscape");
  objc_msgSend(v65, "constraintEqualToConstant:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v3;
  -[VTUIProximityContainerView heightAnchor](self->_containerView, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxViewHeightPhoneLandscape](self->_vtStyle, "proxViewHeightPhoneLandscape");
  objc_msgSend(v4, "constraintEqualToConstant:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v95[2] = v5;
  -[VTUIProximityContainerView bottomAnchor](self->_containerView, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityEnrollmentSetupIntroView bottomAnchor](self, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v95[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addObjectsFromArray:", v10);

  -[UIImageView widthAnchor](self->_orbImage, "widthAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImageLength](self->_vtStyle, "orbImageLength");
  objc_msgSend(v80, "constraintEqualToConstant:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v74;
  -[UIImageView heightAnchor](self->_orbImage, "heightAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImageLength](self->_vtStyle, "orbImageLength");
  objc_msgSend(v69, "constraintEqualToConstant:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v94[1] = v11;
  -[UIImageView centerXAnchor](self->_orbImage, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v94[2] = v14;
  -[UIImageView topAnchor](self->_orbImage, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxIntroOrbImageFromTopLandscape](self->_vtStyle, "proxIntroOrbImageFromTopLandscape");
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v94[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addObjectsFromArray:", v18);

  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxIntroTitleFromTopLandscape](self->_vtStyle, "proxIntroTitleFromTopLandscape");
  objc_msgSend(v81, "constraintEqualToAnchor:constant:", v75);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v19;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeadingLandscape](self->_vtStyle, "proxLeadingLandscape");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v22;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailingLandscape](self->_vtStyle, "proxTrailingLandscape");
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v93[2] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addObjectsFromArray:", v27);

  -[UIButton centerYAnchor](self->_dismissButton, "centerYAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "topAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonVerticalPaddingTop](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingTop");
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v76);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v70;
  -[UIButton centerXAnchor](self->_dismissButton, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonHorizontalPadding](self->_vtStyle, "proxTrainingDismissButtonHorizontalPadding");
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v30;
  -[UIButton heightAnchor](self->_dismissButton, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v31, "constraintEqualToConstant:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v92[2] = v32;
  -[UIButton widthAnchor](self->_dismissButton, "widthAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v33, "constraintEqualToConstant:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v92[3] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v92, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addObjectsFromArray:", v35);

  -[UITextView leadingAnchor](self->_termsAndConds, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton leadingAnchor](self->_setupButton, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingFootnoteButton](self->_vtStyle, "proxPaddingFootnoteButton");
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, v38 * 0.5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v39;
  -[UITextView trailingAnchor](self->_termsAndConds, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton trailingAnchor](self->_setupButton, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingFootnoteButton](self->_vtStyle, "proxPaddingFootnoteButton");
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, v42 * -0.5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addObjectsFromArray:", v44);

  -[VTUIButton topAnchor](self->_setupButton, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView bottomAnchor](self->_termsAndConds, "bottomAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingFootnoteButton](self->_vtStyle, "proxPaddingFootnoteButton");
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v77);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v71;
  -[VTUIButton leadingAnchor](self->_setupButton, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeadingLandscape](self->_vtStyle, "proxLeadingLandscape");
  objc_msgSend(v66, "constraintEqualToAnchor:constant:", v64);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = v45;
  -[VTUIButton trailingAnchor](self->_setupButton, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailingLandscape](self->_vtStyle, "proxTrailingLandscape");
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, -v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v90[2] = v49;
  -[VTUIButton heightAnchor](self->_setupButton, "heightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPrimaryButtonHeight](self->_vtStyle, "proxPrimaryButtonHeight");
  objc_msgSend(v50, "constraintEqualToConstant:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v90[3] = v51;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v90, 4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addObjectsFromArray:", v52);

  -[VTUIButton firstBaselineAnchor](self->_notNowButton, "firstBaselineAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton bottomAnchor](self->_setupButton, "bottomAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonVerticalPaddingTop](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingTop");
  objc_msgSend(v84, "constraintEqualToAnchor:constant:", v78);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v72;
  -[VTUIButton firstBaselineAnchor](self->_notNowButton, "firstBaselineAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView bottomAnchor](self->_containerView, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonVerticalPaddingBottom](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingBottom");
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v85, -v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v54;
  -[VTUIButton leadingAnchor](self->_notNowButton, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton leadingAnchor](self->_setupButton, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v57;
  -[VTUIButton trailingAnchor](self->_notNowButton, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton trailingAnchor](self->_setupButton, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v89[3] = v60;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addObjectsFromArray:", v61);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v88);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v88);
  v62 = (NSArray *)objc_claimAutoreleasedReturnValue();
  viewConstraints = self->_viewConstraints;
  self->_viewConstraints = v62;

}

- (void)_setupPortraitConstraints
{
  void *v3;
  void *v4;
  int v5;
  VTUIProximityContainerView *containerView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSArray *v84;
  NSArray *viewConstraints;
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
  _QWORD v112[4];
  _QWORD v113[4];
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[4];
  _QWORD v118[4];
  _QWORD v119[2];
  void *v120;
  _QWORD v121[5];

  v121[3] = *MEMORY[0x24BDAC8D0];
  -[VTUIProximityEnrollmentSetupIntroView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDeviceIPad");

  containerView = self->_containerView;
  v108 = v3;
  if (v5)
  {
    -[VTUIProximityContainerView centerYAnchor](containerView, "centerYAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = v9;
    -[VTUIProximityContainerView centerXAnchor](self->_containerView, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v121[1] = v12;
    -[VTUIProximityContainerView widthAnchor](self->_containerView, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxViewMaxWidth](self->_vtStyle, "proxViewMaxWidth");
    objc_msgSend(v13, "constraintEqualToConstant:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v121[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "addObjectsFromArray:", v15);

  }
  else
  {
    -[VTUIProximityContainerView bottomAnchor](containerView, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIProximityEnrollmentSetupIntroView bottomAnchor](self, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v120, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "addObjectsFromArray:", v20);

    -[VTUIProximityContainerView leadingAnchor](self->_containerView, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = v9;
    -[VTUIProximityContainerView trailingAnchor](self->_containerView, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v119[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v119, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "addObjectsFromArray:", v13);
  }

  -[VTUIProximityContainerView heightAnchor](self->_containerView, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxViewHeight](self->_vtStyle, "proxViewHeight");
  objc_msgSend(v22, "constraintEqualToConstant:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addObject:", v23);

  -[VTUIProximityContainerView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView heightAnchor](self->_orbImage, "heightAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImageLength](self->_vtStyle, "orbImageLength");
  objc_msgSend(v95, "constraintEqualToConstant:");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v89;
  -[UIImageView widthAnchor](self->_orbImage, "widthAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImageLength](self->_vtStyle, "orbImageLength");
  objc_msgSend(v24, "constraintEqualToConstant:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v25;
  -[UIImageView centerXAnchor](self->_orbImage, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v118[2] = v28;
  -[UIImageView topAnchor](self->_orbImage, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImagePadding](self->_vtStyle, "orbImagePadding");
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v118[3] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v118, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addObjectsFromArray:", v32);

  -[UIButton centerYAnchor](self->_dismissButton, "centerYAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "topAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonVerticalPaddingTop](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingTop");
  objc_msgSend(v96, "constraintEqualToAnchor:constant:", v90);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v86;
  -[UIButton centerXAnchor](self->_dismissButton, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonHorizontalPadding](self->_vtStyle, "proxTrainingDismissButtonHorizontalPadding");
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v35;
  -[UIButton widthAnchor](self->_dismissButton, "widthAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v36, "constraintEqualToConstant:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v117[2] = v37;
  -[UIButton heightAnchor](self->_dismissButton, "heightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v38, "constraintEqualToConstant:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v117[3] = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addObjectsFromArray:", v40);

  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "topAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxIntroTitleFromTop](self->_vtStyle, "proxIntroTitleFromTop");
  objc_msgSend(v97, "constraintEqualToAnchor:constant:", v91);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v87;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeading](self->_vtStyle, "proxLeading");
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v43;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailing](self->_vtStyle, "proxTrailing");
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, -v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v116[2] = v47;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addObjectsFromArray:", v48);

  -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingIntroSubtitle](self->_vtStyle, "proxPaddingIntroSubtitle");
  objc_msgSend(v98, "constraintEqualToAnchor:constant:", v92);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v49;
  -[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeading](self->_vtStyle, "proxLeading");
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v52;
  -[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailing](self->_vtStyle, "proxTrailing");
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, -v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v115[2] = v56;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v115, 3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addObjectsFromArray:", v57);

  -[UITextView topAnchor](self->_termsAndConds, "topAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_orbImage, "bottomAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImagePadding](self->_vtStyle, "orbImagePadding");
  objc_msgSend(v102, "constraintGreaterThanOrEqualToAnchor:constant:", v105);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v99;
  -[UITextView leadingAnchor](self->_termsAndConds, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton leadingAnchor](self->_setupButton, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingFootnoteButton](self->_vtStyle, "proxPaddingFootnoteButton");
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, v60 * 0.5);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v114[1] = v61;
  -[UITextView trailingAnchor](self->_termsAndConds, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton trailingAnchor](self->_setupButton, "trailingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingFootnoteButton](self->_vtStyle, "proxPaddingFootnoteButton");
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, v64 * -0.5);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v114[2] = v65;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v114, 3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addObjectsFromArray:", v66);

  -[VTUIButton topAnchor](self->_setupButton, "topAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView lastBaselineAnchor](self->_termsAndConds, "lastBaselineAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingFootnoteButton](self->_vtStyle, "proxPaddingFootnoteButton");
  objc_msgSend(v106, "constraintEqualToAnchor:constant:", v103);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v100;
  -[VTUIButton leadingAnchor](self->_setupButton, "leadingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeading](self->_vtStyle, "proxLeading");
  objc_msgSend(v93, "constraintEqualToAnchor:constant:", v88);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = v67;
  -[VTUIButton trailingAnchor](self->_setupButton, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailing](self->_vtStyle, "proxTrailing");
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, -v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v71;
  -[VTUIButton heightAnchor](self->_setupButton, "heightAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPrimaryButtonHeight](self->_vtStyle, "proxPrimaryButtonHeight");
  objc_msgSend(v72, "constraintEqualToConstant:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v113[3] = v73;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v113, 4);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addObjectsFromArray:", v74);

  -[VTUIButton firstBaselineAnchor](self->_notNowButton, "firstBaselineAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton bottomAnchor](self->_setupButton, "bottomAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonVerticalPaddingTop](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingTop");
  objc_msgSend(v107, "constraintEqualToAnchor:constant:", v104);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v101;
  -[VTUIButton firstBaselineAnchor](self->_notNowButton, "firstBaselineAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView bottomAnchor](self->_containerView, "bottomAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonVerticalPaddingBottom](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingBottom");
  objc_msgSend(v94, "constraintEqualToAnchor:constant:", v109, -v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v112[1] = v76;
  -[VTUIButton leadingAnchor](self->_notNowButton, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton leadingAnchor](self->_setupButton, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v112[2] = v79;
  -[VTUIButton trailingAnchor](self->_notNowButton, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton trailingAnchor](self->_setupButton, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v112[3] = v82;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v112, 4);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addObjectsFromArray:", v83);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v111);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v111);
  v84 = (NSArray *)objc_claimAutoreleasedReturnValue();
  viewConstraints = self->_viewConstraints;
  self->_viewConstraints = v84;

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_enrollmentDelegate);
  objc_msgSend(WeakRetained, "aboutTapped:", self);

  return 0;
}

- (VTUIEnrollmentDelegate)enrollmentDelegate
{
  return (VTUIEnrollmentDelegate *)objc_loadWeakRetained((id *)&self->_enrollmentDelegate);
}

- (void)setEnrollmentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_enrollmentDelegate, a3);
}

- (VTUIButton)setupButton
{
  return self->_setupButton;
}

- (VTUIButton)notNowButton
{
  return self->_notNowButton;
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (NSArray)viewConstraints
{
  return self->_viewConstraints;
}

- (void)setViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_viewConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConstraints, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_setupButton, 0);
  objc_destroyWeak((id *)&self->_enrollmentDelegate);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_voiceProfileMgr, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_termsAndConds, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_orbImage, 0);
}

@end
