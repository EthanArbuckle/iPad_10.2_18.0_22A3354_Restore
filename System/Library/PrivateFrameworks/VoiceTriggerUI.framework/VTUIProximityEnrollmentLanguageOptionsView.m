@implementation VTUIProximityEnrollmentLanguageOptionsView

- (VTUIProximityEnrollmentLanguageOptionsView)initWithFrame:(CGRect)a3 languageOptions:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  VTUIProximityEnrollmentLanguageOptionsView *v11;
  uint64_t v12;
  VTUIStyle *vtStyle;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VTUIProximityEnrollmentLanguageOptionsView;
  v11 = -[VTUIProximityEnrollmentLanguageOptionsView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v12 = objc_claimAutoreleasedReturnValue();
    vtStyle = v11->_vtStyle;
    v11->_vtStyle = (VTUIStyle *)v12;

    objc_storeStrong((id *)&v11->_continueButtonsLanguages, a4);
    -[VTUIProximityEnrollmentLanguageOptionsView _setupContent](v11, "_setupContent");
    -[VTUIProximityEnrollmentLanguageOptionsView _setupConstraintsToSize:](v11, "_setupConstraintsToSize:", width, height);
  }

  return v11;
}

- (void)_setupContent
{
  NSObject *v3;
  VTUIProximityContainerView *v4;
  VTUIProximityContainerView *containerView;
  UILabel *v6;
  UILabel *titleLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  UIButton *v15;
  UIButton *dismissButton;
  UIView *v17;
  UIView *footerView;
  UIView *v19;
  UIView *languagesView;
  UIView *v21;
  void *v22;
  UIPickerView *v23;
  UIPickerView *languagesPickerView;
  UILabel *v25;
  UILabel *settingsLabel;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  UILabel *v31;
  void *v32;
  VTUIButton *v33;
  VTUIButton *continueButton;
  VTUIButton *v35;
  void *v36;
  void *v37;
  int v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 136315138;
    v39 = "-[VTUIProximityEnrollmentLanguageOptionsView _setupContent]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Setup content", (uint8_t *)&v38, 0xCu);
  }
  v4 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = v4;

  -[VTUIProximityContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityEnrollmentLanguageOptionsView addSubview:](self, "addSubview:", self->_containerView);
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v6;

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 3);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = self->_titleLabel;
  -[VTUIStyle proxHeaderFont](self->_vtStyle, "proxHeaderFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v8, "setFont:", v9);

  v10 = self->_titleLabel;
  -[VTUIStyle proxInstructionColor](self->_vtStyle, "proxInstructionColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v10, "setTextColor:", v11);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  v12 = self->_titleLabel;
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uiLocalizedStringForKey:", CFSTR("TEXT_TITLE_LANGUAGE_OPTIONS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v12, "setText:", v14);

  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_titleLabel);
  +[VTUIButton _vtuiProximityDismissButton](VTUIButton, "_vtuiProximityDismissButton");
  v15 = (UIButton *)objc_claimAutoreleasedReturnValue();
  dismissButton = self->_dismissButton;
  self->_dismissButton = v15;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_dismissButton);
  v17 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  footerView = self->_footerView;
  self->_footerView = v17;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityEnrollmentLanguageOptionsView addSubview:](self, "addSubview:", self->_footerView);
  v19 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  languagesView = self->_languagesView;
  self->_languagesView = v19;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_languagesView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = self->_languagesView;
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

  -[VTUIProximityEnrollmentLanguageOptionsView addSubview:](self, "addSubview:", self->_languagesView);
  v23 = (UIPickerView *)objc_alloc_init(MEMORY[0x24BEBD800]);
  languagesPickerView = self->_languagesPickerView;
  self->_languagesPickerView = v23;

  -[UIPickerView setDelegate:](self->_languagesPickerView, "setDelegate:", self);
  -[UIPickerView setDataSource:](self->_languagesPickerView, "setDataSource:", self);
  -[UIPickerView setTranslatesAutoresizingMaskIntoConstraints:](self->_languagesPickerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_languagesView, "addSubview:", self->_languagesPickerView);
  v25 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  settingsLabel = self->_settingsLabel;
  self->_settingsLabel = v25;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_settingsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v27 = self->_settingsLabel;
  -[VTUIStyle proxFooterFont](self->_vtStyle, "proxFooterFont");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v27, "setFont:", v28);

  v29 = self->_settingsLabel;
  -[VTUIStyle footerTextColor](self->_vtStyle, "footerTextColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v29, "setTextColor:", v30);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_settingsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_settingsLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_settingsLabel, "setNumberOfLines:", 0);
  v31 = self->_settingsLabel;
  -[VTUIStyle VTUIDeviceSpecificString:](self->_vtStyle, "VTUIDeviceSpecificString:", CFSTR("TEXT_CHANGE_IN_SETTINGS"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v31, "setText:", v32);

  -[UIView addSubview:](self->_footerView, "addSubview:", self->_settingsLabel);
  +[VTUIButton _vtuiProximityButtonWithPrimaryStyle](VTUIButton, "_vtuiProximityButtonWithPrimaryStyle");
  v33 = (VTUIButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v33;

  -[VTUIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v35 = self->_continueButton;
  -[VTUIStyle VTUIDeviceSpecificString:](self->_vtStyle, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CONTINUE_SETUP"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton setTitle:forState:](v35, "setTitle:forState:", v36, 0);

  -[VTUIButton titleLabel](self->_continueButton, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setNumberOfLines:", 0);

  -[UIView addSubview:](self->_footerView, "addSubview:", self->_continueButton);
}

- (void)_setupConstraintsToSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  char v10;
  VTUIProximityContainerView *containerView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  VTUIProximityContainerView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  uint64_t v43;
  VTUIStyle *vtStyle;
  double v45;
  double v46;
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
  VTUIStyle *v64;
  double v65;
  double v66;
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
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  VTUIStyle *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  double v113;
  void *v114;
  void *v115;
  NSArray *v116;
  NSArray *viewConstraints;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  _BOOL4 v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  _QWORD v145[3];
  _QWORD v146[4];
  _QWORD v147[4];
  _QWORD v148[3];
  _QWORD v149[4];
  _QWORD v150[4];
  _QWORD v151[3];
  _QWORD v152[2];
  _QWORD v153[2];
  void *v154;
  _QWORD v155[5];

  height = a3.height;
  width = a3.width;
  v155[3] = *MEMORY[0x24BDAC8D0];
  -[VTUIProximityEnrollmentLanguageOptionsView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VTUIProximityView _shouldUsePhoneLandscapeLayoutForSize:](self, "_shouldUsePhoneLandscapeLayoutForSize:", width, height);
  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDeviceIPad");

  containerView = self->_containerView;
  v144 = v7;
  v140 = v8;
  v134 = v6;
  if ((v10 & 1) != 0)
  {
    -[VTUIProximityContainerView centerYAnchor](containerView, "centerYAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v155[0] = v13;
    -[VTUIProximityContainerView centerXAnchor](self->_containerView, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v155[1] = v16;
    -[VTUIProximityContainerView widthAnchor](self->_containerView, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxViewMaxWidth](self->_vtStyle, "proxViewMaxWidth");
    objc_msgSend(v17, "constraintEqualToConstant:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v155[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v155, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "addObjectsFromArray:", v19);

    v7 = v144;
    v20 = v140;

    if (!v140)
      goto LABEL_8;
LABEL_6:
    -[VTUIStyle proxViewHeightPhoneLandscape](self->_vtStyle, "proxViewHeightPhoneLandscape");
    goto LABEL_9;
  }
  -[VTUIProximityContainerView bottomAnchor](containerView, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityEnrollmentLanguageOptionsView bottomAnchor](self, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v154, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v25);

  v26 = self->_containerView;
  if (v8)
  {
    -[VTUIProximityContainerView centerXAnchor](v26, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v153[0] = v29;
    -[VTUIProximityContainerView widthAnchor](self->_containerView, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxViewMaxWidthPhoneLandscape](self->_vtStyle, "proxViewMaxWidthPhoneLandscape");
    objc_msgSend(v30, "constraintEqualToConstant:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v153[1] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v153, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v32);

    v20 = v140;
    goto LABEL_6;
  }
  -[VTUIProximityContainerView leadingAnchor](v26, "leadingAnchor");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v138, "constraintEqualToAnchor:constant:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v35;
  -[VTUIProximityContainerView trailingAnchor](self->_containerView, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v152[1] = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v152, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v40);

  v20 = v140;
LABEL_8:
  -[VTUIStyle proxViewHeight](self->_vtStyle, "proxViewHeight");
LABEL_9:
  v41 = v33;
  -[VTUIProximityContainerView heightAnchor](self->_containerView, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", v41);
  v43 = objc_claimAutoreleasedReturnValue();

  v133 = (void *)v43;
  objc_msgSend(v7, "addObject:", v43);
  -[VTUIProximityContainerView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  vtStyle = self->_vtStyle;
  if (v20)
    -[VTUIStyle proxTitleTrailingLandscape](vtStyle, "proxTitleTrailingLandscape");
  else
    -[VTUIStyle proxTrailing](vtStyle, "proxTrailing");
  v46 = v45;
  -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "topAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTitleFirstBaselineFromTop](self->_vtStyle, "proxTitleFirstBaselineFromTop");
  objc_msgSend(v135, "constraintEqualToAnchor:constant:", v127);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = v47;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeading](self->_vtStyle, "proxLeading");
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v151[1] = v50;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, -v46);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v151[2] = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v151, 3);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "addObjectsFromArray:", v54);

  -[UIButton centerYAnchor](self->_dismissButton, "centerYAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "topAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonVerticalPaddingTop](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingTop");
  objc_msgSend(v136, "constraintEqualToAnchor:constant:", v128);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v150[0] = v55;
  -[UIButton centerXAnchor](self->_dismissButton, "centerXAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonHorizontalPadding](self->_vtStyle, "proxTrainingDismissButtonHorizontalPadding");
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v150[1] = v58;
  -[UIButton widthAnchor](self->_dismissButton, "widthAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v59, "constraintEqualToConstant:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v150[2] = v60;
  -[UIButton heightAnchor](self->_dismissButton, "heightAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v61, "constraintEqualToConstant:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v150[3] = v62;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v150, 4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "addObjectsFromArray:", v63);

  v64 = self->_vtStyle;
  if (v140)
    -[VTUIStyle proxViewLanguageOptionsHeightPhoneLandscape](v64, "proxViewLanguageOptionsHeightPhoneLandscape");
  else
    -[VTUIStyle proxViewLanguageOptionsHeight](v64, "proxViewLanguageOptionsHeight");
  v66 = v65;
  -[UIView leadingAnchor](self->_languagesView, "leadingAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView leadingAnchor](self->_containerView, "leadingAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "constraintEqualToAnchor:", v124);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v149[0] = v121;
  -[UIView trailingAnchor](self->_languagesView, "trailingAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView trailingAnchor](self->_containerView, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "constraintEqualToAnchor:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v149[1] = v68;
  -[UIPickerView centerYAnchor](self->_languagesPickerView, "centerYAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView centerYAnchor](self->_containerView, "centerYAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v149[2] = v71;
  -[UIView heightAnchor](self->_languagesView, "heightAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToConstant:", v66);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v149[3] = v73;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v149, 4);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "addObjectsFromArray:", v74);

  -[UIPickerView centerXAnchor](self->_languagesPickerView, "centerXAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_languagesView, "centerXAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "constraintEqualToAnchor:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v148[0] = v76;
  -[UIPickerView centerYAnchor](self->_languagesPickerView, "centerYAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_languagesView, "centerYAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v148[1] = v79;
  -[UIPickerView heightAnchor](self->_languagesPickerView, "heightAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_languagesView, "heightAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v148[2] = v82;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v148, 3);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "addObjectsFromArray:", v83);

  -[UIView topAnchor](self->_footerView, "topAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPickerView bottomAnchor](self->_languagesPickerView, "bottomAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:", v125);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v122;
  -[UIView bottomAnchor](self->_footerView, "bottomAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "bottomAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "constraintEqualToAnchor:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = v85;
  -[UIView leadingAnchor](self->_footerView, "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "leadingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v147[2] = v88;
  -[UIView trailingAnchor](self->_footerView, "trailingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "trailingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:", v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v147[3] = v91;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v147, 4);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "addObjectsFromArray:", v92);

  v93 = self->_vtStyle;
  if (v140)
  {
    -[VTUIStyle proxLeadingLandscape](v93, "proxLeadingLandscape");
    v95 = v94;
    -[VTUIStyle proxTrailingLandscape](self->_vtStyle, "proxTrailingLandscape");
  }
  else
  {
    -[VTUIStyle proxLeading](v93, "proxLeading");
    v95 = v97;
    -[VTUIStyle proxTrailing](self->_vtStyle, "proxTrailing");
  }
  v98 = v96;
  -[VTUIButton heightAnchor](self->_continueButton, "heightAnchor");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPrimaryButtonHeight](self->_vtStyle, "proxPrimaryButtonHeight");
  objc_msgSend(v141, "constraintEqualToConstant:");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v146[0] = v132;
  -[VTUIButton leadingAnchor](self->_continueButton, "leadingAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_footerView, "leadingAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "constraintEqualToAnchor:constant:", v123, v95);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v146[1] = v120;
  -[VTUIButton trailingAnchor](self->_continueButton, "trailingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_footerView, "trailingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:constant:", v100, -v98);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v146[2] = v101;
  -[VTUIButton bottomAnchor](self->_continueButton, "bottomAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView bottomAnchor](self->_containerView, "bottomAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingFromBottom](self->_vtStyle, "proxPaddingFromBottom");
  objc_msgSend(v102, "constraintEqualToAnchor:constant:", v103, -v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v146[3] = v105;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v146, 4);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "addObjectsFromArray:", v106);

  -[UILabel leadingAnchor](self->_settingsLabel, "leadingAnchor");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_footerView, "leadingAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "constraintEqualToAnchor:", v142);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = v107;
  -[UILabel trailingAnchor](self->_settingsLabel, "trailingAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_footerView, "trailingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v145[1] = v110;
  -[UILabel bottomAnchor](self->_settingsLabel, "bottomAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton topAnchor](self->_continueButton, "topAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxSettingsLabelBottomMargin](self->_vtStyle, "proxSettingsLabelBottomMargin");
  objc_msgSend(v111, "constraintEqualToAnchor:constant:", v112, -v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v145[2] = v114;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v145, 3);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "addObjectsFromArray:", v115);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v144);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v144);
  v116 = (NSArray *)objc_claimAutoreleasedReturnValue();
  viewConstraints = self->_viewConstraints;
  self->_viewConstraints = v116;

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return -[NSArray count](self->_continueButtonsLanguages, "count", a3, a4);
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NSArray objectAtIndex:](self->_continueButtonsLanguages, "objectAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedCompactNameForSiriLanguage:inDisplayLanguage:", v10, v8);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v10;
  v15 = v14;

  v16 = (void *)MEMORY[0x24BDD17C8];
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uiLocalizedStringForKey:", CFSTR("BUTTON_LANG_OPTION"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uiLocalizedStringForKey:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringWithFormat:", v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (UIPickerView)languagesPickerView
{
  return self->_languagesPickerView;
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
  objc_storeStrong((id *)&self->_languagesPickerView, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_languagesView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_settingsLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_continueButtonsLanguages, 0);
}

@end
