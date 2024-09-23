@implementation VTUIProximityEnrollmentSuccessView

- (VTUIProximityEnrollmentSuccessView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  VTUIProximityEnrollmentSuccessView *v5;
  uint64_t v6;
  VTUIStyle *vtStyle;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  v9.receiver = self;
  v9.super_class = (Class)VTUIProximityEnrollmentSuccessView;
  v5 = -[VTUIProximityEnrollmentSuccessView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v6 = objc_claimAutoreleasedReturnValue();
    vtStyle = v5->_vtStyle;
    v5->_vtStyle = (VTUIStyle *)v6;

    -[VTUIProximityEnrollmentSuccessView _setupContent](v5, "_setupContent");
    -[VTUIProximityEnrollmentSuccessView _setupConstraintsToSize:](v5, "_setupConstraintsToSize:", width, height);
  }
  return v5;
}

- (void)_setupContent
{
  NSObject *v3;
  void *v4;
  NSString *v5;
  NSString *languageCode;
  VTUIProximityContainerView *v7;
  VTUIProximityContainerView *containerView;
  unint64_t v9;
  UILabel *v10;
  UILabel *titleLabel;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  UIButton *v19;
  UIButton *dismissButton;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  VTUIStyle *vtStyle;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  UILabel *v34;
  UILabel *subtitleLabel;
  UILabel *v36;
  void *v37;
  VTUIButton *v38;
  VTUIButton *continueButton;
  VTUIButton *v40;
  void *v41;
  void *v42;
  void *v43;
  VTUIStyle *v44;
  void *v45;
  uint8_t buf[4];
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "-[VTUIProximityEnrollmentSuccessView _setupContent]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Setup content", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  languageCode = self->_languageCode;
  self->_languageCode = v5;

  v7 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = v7;

  -[VTUIProximityContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityEnrollmentSuccessView addSubview:](self, "addSubview:", self->_containerView);
  v9 = 0x24BEBD000uLL;
  v10 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v10;

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = self->_titleLabel;
  -[VTUIStyle proxHeaderFont](self->_vtStyle, "proxHeaderFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v12, "setFont:", v13);

  v14 = self->_titleLabel;
  -[VTUIStyle proxHeaderColor](self->_vtStyle, "proxHeaderColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v14, "setTextColor:", v15);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v16 = self->_titleLabel;
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uiLocalizedStringForKey:", CFSTR("TEXT_TITLE_READY"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v16, "setText:", v18);

  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_titleLabel);
  +[VTUIButton _vtuiProximityDismissButton](VTUIButton, "_vtuiProximityDismissButton");
  v19 = (UIButton *)objc_claimAutoreleasedReturnValue();
  dismissButton = self->_dismissButton;
  self->_dismissButton = v19;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_dismissButton);
  v21 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("OrbImage"), v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v23);
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_storeStrong((id *)&self->_orbImage, v24);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_orbImage);
  if (!-[VTUIStyle currentLocaleSupportsCompactVoiceTrigger](self->_vtStyle, "currentLocaleSupportsCompactVoiceTrigger"))
  {
    v25 = (void *)MEMORY[0x24BDD16A8];
    vtStyle = self->_vtStyle;
    v27 = CFSTR("PROX_TEXT_MAIN_READY");
    goto LABEL_7;
  }
  if (-[VTUIStyle proxAccessorySupportsCompactTrigger](self->_vtStyle, "proxAccessorySupportsCompactTrigger"))
  {
    v25 = (void *)MEMORY[0x24BDD16A8];
    vtStyle = self->_vtStyle;
    v27 = CFSTR("PROX_TEXT_MAIN_READY_MIXED");
LABEL_7:
    -[VTUIStyle VTUIDeviceSpecificString:](vtStyle, "VTUIDeviceSpecificString:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v29 = (void *)v28;
    objc_msgSend(v25, "stringWithString:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[VTUIStyle audioAccessoryName](self->_vtStyle, "audioAccessoryName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x24BDD16A8];
  v44 = self->_vtStyle;
  if (!v43)
  {
    -[VTUIStyle proxHSDescription:](v44, "proxHSDescription:", CFSTR("PROX_TEXT_MAIN_READY_MIXED_UNSUPPORTED_ACCESSORY"));
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[VTUIStyle VTUIDeviceSpecificString:](v44, "VTUIDeviceSpecificString:", CFSTR("PROX_TEXT_MAIN_READY_MIXED_UNSUPPORTED_ACCESSORY"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle audioAccessoryName](self->_vtStyle, "audioAccessoryName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", v29, v45);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 9863680000;
LABEL_9:

  if (-[VTUIStyle supportsSiriConversationsAndBargeIn](self->_vtStyle, "supportsSiriConversationsAndBargeIn"))
  {
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "uiLocalizedStringForKey:", CFSTR("PROX_READY_SPEAK_FREELY_SUFFIX"));
    v32 = v9;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "appendString:", v33);

    v9 = v32;
  }
  v34 = (UILabel *)objc_alloc_init(*(Class *)(v9 + 1800));
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v34;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v36 = self->_subtitleLabel;
  -[VTUIStyle proxSubtitleFont](self->_vtStyle, "proxSubtitleFont");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v36, "setFont:", v37);

  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setText:](self->_subtitleLabel, "setText:", v30);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_subtitleLabel);
  +[VTUIButton _vtuiProximityButtonWithPrimaryStyle](VTUIButton, "_vtuiProximityButtonWithPrimaryStyle");
  v38 = (VTUIButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v38;

  -[VTUIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v40 = self->_continueButton;
  -[VTUIStyle VTUIDeviceSpecificString:](self->_vtStyle, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CONTINUE_SETUP"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton setTitle:forState:](v40, "setTitle:forState:", v41, 0);

  -[VTUIButton titleLabel](self->_continueButton, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setNumberOfLines:", 0);

  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_continueButton);
}

- (void)_setupConstraintsToSize:(CGSize)a3
{
  _BOOL8 v4;

  v4 = -[VTUIProximityView _shouldUsePhoneLandscapeLayoutForSize:](self, "_shouldUsePhoneLandscapeLayoutForSize:", a3.width, a3.height);
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", v4);
  if (v4)
    -[VTUIProximityEnrollmentSuccessView _setupPhoneLandscapeConstraints](self, "_setupPhoneLandscapeConstraints");
  else
    -[VTUIProximityEnrollmentSuccessView _setupPortraitConstraints](self, "_setupPortraitConstraints");
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
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
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
  _QWORD v85[4];
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[4];
  _QWORD v89[4];
  _QWORD v90[2];
  void *v91;
  _QWORD v92[5];

  v92[3] = *MEMORY[0x24BDAC8D0];
  -[VTUIProximityEnrollmentSuccessView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDeviceIPad");

  containerView = self->_containerView;
  v82 = v3;
  if (v5)
  {
    -[VTUIProximityContainerView centerYAnchor](containerView, "centerYAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v9;
    -[VTUIProximityContainerView centerXAnchor](self->_containerView, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v12;
    -[VTUIProximityContainerView widthAnchor](self->_containerView, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxViewMaxWidth](self->_vtStyle, "proxViewMaxWidth");
    objc_msgSend(v13, "constraintEqualToConstant:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v92[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v92, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "addObjectsFromArray:", v15);

  }
  else
  {
    -[VTUIProximityContainerView bottomAnchor](containerView, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIProximityEnrollmentSuccessView bottomAnchor](self, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v91, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "addObjectsFromArray:", v20);

    -[VTUIProximityContainerView leadingAnchor](self->_containerView, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v9;
    -[VTUIProximityContainerView trailingAnchor](self->_containerView, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v90, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "addObjectsFromArray:", v13);
  }

  -[VTUIProximityContainerView heightAnchor](self->_containerView, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxViewHeight](self->_vtStyle, "proxViewHeight");
  objc_msgSend(v22, "constraintEqualToConstant:");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v84, "addObject:", v81);
  -[UIImageView widthAnchor](self->_orbImage, "widthAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImageLength](self->_vtStyle, "orbImageLength");
  objc_msgSend(v73, "constraintEqualToConstant:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v69;
  -[UIImageView heightAnchor](self->_orbImage, "heightAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImageLength](self->_vtStyle, "orbImageLength");
  objc_msgSend(v66, "constraintEqualToConstant:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v23;
  -[UIImageView centerXAnchor](self->_orbImage, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v26;
  -[UIImageView topAnchor](self->_orbImage, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImagePadding](self->_vtStyle, "orbImagePadding");
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v89[3] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObjectsFromArray:", v30);

  -[UIButton centerYAnchor](self->_dismissButton, "centerYAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "topAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonVerticalPaddingTop](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingTop");
  objc_msgSend(v74, "constraintEqualToAnchor:constant:", v70);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v67;
  -[UIButton centerXAnchor](self->_dismissButton, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonHorizontalPadding](self->_vtStyle, "proxTrainingDismissButtonHorizontalPadding");
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v33;
  -[UIButton widthAnchor](self->_dismissButton, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v34, "constraintEqualToConstant:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v35;
  -[UIButton heightAnchor](self->_dismissButton, "heightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v36, "constraintEqualToConstant:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v88[3] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObjectsFromArray:", v38);

  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_orbImage, "bottomAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImagePadding](self->_vtStyle, "orbImagePadding");
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v78);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v71;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeading](self->_vtStyle, "proxLeading");
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v41;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailing](self->_vtStyle, "proxTrailing");
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, -v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObjectsFromArray:", v46);

  -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingSuccessSubtitle](self->_vtStyle, "proxPaddingSuccessSubtitle");
  objc_msgSend(v79, "constraintEqualToAnchor:constant:", v76);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v47;
  -[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeading](self->_vtStyle, "proxLeading");
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v50;
  -[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailing](self->_vtStyle, "proxTrailing");
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, -v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v54;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObjectsFromArray:", v55);

  -[VTUIButton leadingAnchor](self->_continueButton, "leadingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeading](self->_vtStyle, "proxLeading");
  objc_msgSend(v80, "constraintEqualToAnchor:constant:", v77);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v72;
  -[VTUIButton trailingAnchor](self->_continueButton, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailing](self->_vtStyle, "proxTrailing");
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v56, -v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v58;
  -[VTUIButton bottomAnchor](self->_continueButton, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView bottomAnchor](self->_containerView, "bottomAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingSuccessFromBottom](self->_vtStyle, "proxPaddingSuccessFromBottom");
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, -v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v62;
  -[VTUIButton heightAnchor](self->_continueButton, "heightAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPrimaryButtonHeight](self->_vtStyle, "proxPrimaryButtonHeight");
  objc_msgSend(v63, "constraintEqualToConstant:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v64;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v85, 4);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObjectsFromArray:", v65);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v84);
  -[VTUIProximityEnrollmentSuccessView setViewConstraints:](self, "setViewConstraints:", v84);

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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
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
  _QWORD v65[4];
  _QWORD v66[4];
  _QWORD v67[3];
  _QWORD v68[4];
  _QWORD v69[6];

  v69[4] = *MEMORY[0x24BDAC8D0];
  -[VTUIProximityEnrollmentSuccessView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView centerXAnchor](self->_containerView, "centerXAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "centerXAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v52);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v48;
  -[VTUIProximityContainerView widthAnchor](self->_containerView, "widthAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxViewMaxWidthPhoneLandscape](self->_vtStyle, "proxViewMaxWidthPhoneLandscape");
  objc_msgSend(v47, "constraintEqualToConstant:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v3;
  -[VTUIProximityContainerView heightAnchor](self->_containerView, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxViewHeightPhoneLandscape](self->_vtStyle, "proxViewHeightPhoneLandscape");
  objc_msgSend(v4, "constraintEqualToConstant:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v5;
  -[VTUIProximityContainerView bottomAnchor](self->_containerView, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityEnrollmentSuccessView bottomAnchor](self, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObjectsFromArray:", v10);

  -[UIImageView widthAnchor](self->_orbImage, "widthAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImageLength](self->_vtStyle, "orbImageLength");
  objc_msgSend(v58, "constraintEqualToConstant:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v53;
  -[UIImageView heightAnchor](self->_orbImage, "heightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImageLength](self->_vtStyle, "orbImageLength");
  objc_msgSend(v49, "constraintEqualToConstant:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v11;
  -[UIImageView centerXAnchor](self->_orbImage, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v14;
  -[UIImageView topAnchor](self->_orbImage, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImagePadding](self->_vtStyle, "orbImagePadding");
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v68[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObjectsFromArray:", v18);

  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingSuccessTitleLandscape](self->_vtStyle, "proxPaddingSuccessTitleLandscape");
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v54);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v19;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeadingLandscape](self->_vtStyle, "proxLeadingLandscape");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v22;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailingLandscape](self->_vtStyle, "proxTrailingLandscape");
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObjectsFromArray:", v27);

  -[UIButton centerYAnchor](self->_dismissButton, "centerYAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonVerticalPaddingTop](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingTop");
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v55);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v50;
  -[UIButton centerXAnchor](self->_dismissButton, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonHorizontalPadding](self->_vtStyle, "proxTrainingDismissButtonHorizontalPadding");
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v30;
  -[UIButton widthAnchor](self->_dismissButton, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v31, "constraintEqualToConstant:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v32;
  -[UIButton heightAnchor](self->_dismissButton, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v33, "constraintEqualToConstant:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObjectsFromArray:", v35);

  -[VTUIButton leadingAnchor](self->_continueButton, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeadingLandscape](self->_vtStyle, "proxLeadingLandscape");
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v56);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v51;
  -[VTUIButton trailingAnchor](self->_continueButton, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailingLandscape](self->_vtStyle, "proxTrailingLandscape");
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v39;
  -[VTUIButton bottomAnchor](self->_continueButton, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView bottomAnchor](self->_containerView, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingSuccessFromBottomLandscape](self->_vtStyle, "proxPaddingSuccessFromBottomLandscape");
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, -v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v43;
  -[VTUIButton heightAnchor](self->_continueButton, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPrimaryButtonHeight](self->_vtStyle, "proxPrimaryButtonHeight");
  objc_msgSend(v44, "constraintEqualToConstant:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v65[3] = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObjectsFromArray:", v46);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v63);
}

- (VTUIButton)continueButton
{
  return self->_continueButton;
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
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_orbImage, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

@end
