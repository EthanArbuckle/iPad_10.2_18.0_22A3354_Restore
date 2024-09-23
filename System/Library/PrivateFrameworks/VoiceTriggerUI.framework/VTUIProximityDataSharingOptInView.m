@implementation VTUIProximityDataSharingOptInView

- (VTUIProximityDataSharingOptInView)initWithFrame:(CGRect)a3
{
  VTUIProximityDataSharingOptInView *v3;
  VTUIProximityDataSharingOptInView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIProximityDataSharingOptInView;
  v3 = -[VTUIProximityDataSharingOptInView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[VTUIProximityDataSharingOptInView _setupContent](v3, "_setupContent");
    -[VTUIProximityDataSharingOptInView _setupPortraitConstraints](v4, "_setupPortraitConstraints");
  }
  return v4;
}

- (void)_setupContent
{
  NSObject *v3;
  void *v4;
  VTUIProximityContainerView *v5;
  VTUIProximityContainerView *containerView;
  UILabel *v7;
  UILabel *titleLabel;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  UIButton *v16;
  UIButton *dismissButton;
  UILabel *v18;
  UILabel *subtitleLabel;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  UIButton *v26;
  UIButton *aboutLink;
  void *v28;
  void *v29;
  UIButton *v30;
  void *v31;
  void *v32;
  void *v33;
  VTUIButton *v34;
  VTUIButton *shareButton;
  VTUIButton *v36;
  void *v37;
  void *v38;
  void *v39;
  VTUIButton *v40;
  VTUIButton *notNowButton;
  VTUIButton *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v46 = 136315138;
    v47 = "-[VTUIProximityDataSharingOptInView _setupContent]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s Setup content", (uint8_t *)&v46, 0xCu);
  }
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = v5;

  -[VTUIProximityContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityDataSharingOptInView addSubview:](self, "addSubview:", self->_containerView);
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = self->_titleLabel;
  objc_msgSend(v4, "proxHeaderFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v9, "setFont:", v10);

  v11 = self->_titleLabel;
  objc_msgSend(v4, "proxHeaderColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v11, "setTextColor:", v12);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v13 = self->_titleLabel;
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_TITLE_SIRI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v13, "setText:", v15);

  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_titleLabel);
  +[VTUIButton _vtuiProximityDismissButton](VTUIButton, "_vtuiProximityDismissButton");
  v16 = (UIButton *)objc_claimAutoreleasedReturnValue();
  dismissButton = self->_dismissButton;
  self->_dismissButton = v16;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_dismissButton);
  v18 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v18;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v20 = self->_subtitleLabel;
  objc_msgSend(v4, "proxSubtitleFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v20, "setFont:", v21);

  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  v22 = self->_subtitleLabel;
  objc_msgSend(v4, "VTUIDeviceSpecificString:", CFSTR("DATA_SHARING_DETAIL"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v22, "setText:", v23);

  v24 = self->_subtitleLabel;
  objc_msgSend(v4, "proxSubtitleColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v24, "setTextColor:", v25);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_subtitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_subtitleLabel);
  +[VTUIButton _vtuiButtonWithSecondaryStyle](VTUIButton, "_vtuiButtonWithSecondaryStyle");
  v26 = (UIButton *)objc_claimAutoreleasedReturnValue();
  aboutLink = self->_aboutLink;
  self->_aboutLink = v26;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_aboutLink, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton titleLabel](self->_aboutLink, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proxSubtitleFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFont:", v29);

  v30 = self->_aboutLink;
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_DETAIL_LINK"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v30, "setTitle:forState:", v32, 0);

  -[UIButton titleLabel](self->_aboutLink, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setNumberOfLines:", 0);

  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_aboutLink);
  +[VTUIButton _vtuiProximityButtonWithPrimaryStyle](VTUIButton, "_vtuiProximityButtonWithPrimaryStyle");
  v34 = (VTUIButton *)objc_claimAutoreleasedReturnValue();
  shareButton = self->_shareButton;
  self->_shareButton = v34;

  -[VTUIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_shareButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v36 = self->_shareButton;
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_CONFIRMATION_BUTTON_TITLE"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton setTitle:forState:](v36, "setTitle:forState:", v38, 0);

  -[VTUIButton titleLabel](self->_shareButton, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setNumberOfLines:", 0);

  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_shareButton);
  +[VTUIButton _vtuiButtonWithSecondaryStyle](VTUIButton, "_vtuiButtonWithSecondaryStyle");
  v40 = (VTUIButton *)objc_claimAutoreleasedReturnValue();
  notNowButton = self->_notNowButton;
  self->_notNowButton = v40;

  -[VTUIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_notNowButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v42 = self->_notNowButton;
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_DECLINE_BUTTON_TITLE"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton setTitle:forState:](v42, "setTitle:forState:", v44, 0);

  -[VTUIButton titleLabel](self->_notNowButton, "titleLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setNumberOfLines:", 0);

  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_notNowButton);
}

- (void)_setupPortraitConstraints
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  VTUIProximityContainerView *containerView;
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
  double v20;
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
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
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
  _QWORD v110[4];
  _QWORD v111[3];
  _QWORD v112[4];
  _QWORD v113[4];
  _QWORD v114[4];
  _QWORD v115[3];
  _QWORD v116[5];
  _QWORD v117[5];

  v117[3] = *MEMORY[0x24BDAC8D0];
  -[VTUIProximityDataSharingOptInView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDeviceIPad");

  containerView = self->_containerView;
  v108 = v3;
  if (v7)
  {
    -[VTUIProximityContainerView centerYAnchor](containerView, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VTUIProximityContainerView centerXAnchor](self->_containerView, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[VTUIProximityContainerView widthAnchor](self->_containerView, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proxViewMaxWidth");
    objc_msgSend(v15, "constraintEqualToConstant:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v117[0] = v11;
    v117[1] = v14;
    v117[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIProximityDataSharingOptInView addConstraints:](self, "addConstraints:", v17);
  }
  else
  {
    -[VTUIProximityContainerView bottomAnchor](containerView, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIProximityDataSharingOptInView bottomAnchor](self, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proxContainerHorizontalVerticalPadding");
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VTUIProximityContainerView leadingAnchor](self->_containerView, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proxContainerHorizontalVerticalPadding");
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[VTUIProximityContainerView trailingAnchor](self->_containerView, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proxContainerHorizontalVerticalPadding");
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[VTUIProximityContainerView heightAnchor](self->_containerView, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proxViewHeight");
    objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[VTUIProximityContainerView heightAnchor](self->_containerView, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:constant:", v28, 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v116[0] = v11;
    v116[1] = v14;
    v116[2] = v16;
    v116[3] = v17;
    v116[4] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v30);

  }
  -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxTitleFirstBaselineFromTop");
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxLeading");
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxTrailing");
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, -v37);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v115[0] = v107;
  v115[1] = v106;
  v115[2] = v105;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v115, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v38);

  -[UIButton centerYAnchor](self->_dismissButton, "centerYAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxTrainingDismissButtonVerticalPaddingTop");
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton centerXAnchor](self->_dismissButton, "centerXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxTrainingDismissButtonHorizontalPadding");
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton widthAnchor](self->_dismissButton, "widthAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v43, "constraintEqualToConstant:");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton heightAnchor](self->_dismissButton, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v44, "constraintEqualToConstant:");
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  v114[0] = v104;
  v114[1] = v103;
  v114[2] = v102;
  v114[3] = v101;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v114, 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v45);

  -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxPaddingDataSharingSubtitle");
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxLeading");
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxTrailing");
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, -v52);
  v90 = v4;
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton topAnchor](self->_aboutLink, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 0.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v113[0] = v100;
  v113[1] = v99;
  v113[2] = v98;
  v113[3] = v97;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v113, 4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v55);

  -[UIButton firstBaselineAnchor](self->_aboutLink, "firstBaselineAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxAboutLinkFirstBaselineFromTop");
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton leadingAnchor](self->_aboutLink, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxLeading");
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton trailingAnchor](self->_aboutLink, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxTrailing");
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, -v62);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton bottomAnchor](self->_aboutLink, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton topAnchor](self->_shareButton, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintLessThanOrEqualToAnchor:constant:", v64, 0.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v112[0] = v96;
  v112[1] = v95;
  v112[2] = v94;
  v112[3] = v93;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v112, 4);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v65);

  -[VTUIButton leadingAnchor](self->_notNowButton, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxLeading");
  objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  -[VTUIButton trailingAnchor](self->_notNowButton, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxTrailing");
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, -v70);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  -[VTUIButton firstBaselineAnchor](self->_notNowButton, "firstBaselineAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView bottomAnchor](self->_containerView, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxTrainingDismissButtonVerticalPaddingBottom");
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72, -v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v111[0] = v92;
  v111[1] = v91;
  v111[2] = v74;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v111, 3);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v75);

  -[VTUIButton leadingAnchor](self->_shareButton, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxLeading");
  objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  -[VTUIButton trailingAnchor](self->_shareButton, "trailingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxTrailing");
  objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, -v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  -[VTUIButton firstBaselineAnchor](self->_shareButton, "firstBaselineAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton topAnchor](self->_notNowButton, "topAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxTrainingDismissButtonVerticalPaddingTop");
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v84, -v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  -[VTUIButton heightAnchor](self->_shareButton, "heightAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxPrimaryButtonHeight");
  objc_msgSend(v87, "constraintEqualToConstant:");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v110[0] = v78;
  v110[1] = v82;
  v110[2] = v86;
  v110[3] = v88;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v110, 4);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addObjectsFromArray:", v89);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v90);
  -[VTUIProximityDataSharingOptInView addConstraints:](self, "addConstraints:", v90);

}

- (VTUIButton)shareButton
{
  return self->_shareButton;
}

- (void)setShareButton:(id)a3
{
  objc_storeStrong((id *)&self->_shareButton, a3);
}

- (VTUIButton)notNowButton
{
  return self->_notNowButton;
}

- (void)setNotNowButton:(id)a3
{
  objc_storeStrong((id *)&self->_notNowButton, a3);
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (UIButton)aboutLink
{
  return self->_aboutLink;
}

- (void)setAboutLink:(id)a3
{
  objc_storeStrong((id *)&self->_aboutLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aboutLink, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
