@implementation VTUIVoiceSelectionProximityView

- (VTUIVoiceSelectionProximityView)initWithTitle:(id)a3 allowsRandomVoiceSelection:(BOOL)a4 forSelectionStyle:(int64_t)a5
{
  id v8;
  VTUIVoiceSelectionProximityView *v9;
  uint64_t v10;
  VTUIStyle *vtStyle;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VTUIVoiceSelectionProximityView;
  v9 = -[VTUIVoiceSelectionProximityView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v9)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v10 = objc_claimAutoreleasedReturnValue();
    vtStyle = v9->_vtStyle;
    v9->_vtStyle = (VTUIStyle *)v10;

    v9->_allowsRandomVoiceSelection = a4;
    v9->_selectionStyle = a5;
    v9->_isHidingCompactBackgroundCardView = 0;
    -[VTUIVoiceSelectionProximityView _setupContentWithTitle:](v9, "_setupContentWithTitle:", v8);
    -[VTUIVoiceSelectionProximityView _setupConstraintsToSize:](v9, "_setupConstraintsToSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIVoiceSelectionProximityView setBackgroundColor:](v9, "setBackgroundColor:", v12);

  }
  return v9;
}

- (void)_setupContentWithTitle:(id)a3
{
  id v4;
  NSObject *v5;
  VTUIProximityContainerView *v6;
  VTUIProximityContainerView *containerView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *titleLabel;
  UILabel *v14;
  VTUIStyle *vtStyle;
  void *v16;
  UILabel *v17;
  void *v18;
  void *v19;
  UIButton *v20;
  UIButton *dismissButton;
  UIView *v22;
  UIView *footerView;
  UIButton *v24;
  UIButton *continueButton;
  UIButton *v26;
  void *v27;
  void *v28;
  UIButton *v29;
  UIButton *chooseRandomVoiceButton;
  void *v31;
  void *v32;
  UIButton *v33;
  VTUIStyle *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[VTUIVoiceSelectionProximityView _setupContentWithTitle:]";
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s Setup content", buf, 0xCu);
  }
  v6 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = v6;

  -[VTUIProximityContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIVoiceSelectionProximityView addSubview:](self, "addSubview:", self->_containerView);
  v8 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("OrbImage"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v10);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_storeStrong((id *)&self->_orbImage, v11);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_orbImage);
  v12 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 3);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = self->_titleLabel;
  vtStyle = self->_vtStyle;
  if (self->_selectionStyle == 1)
  {
    -[VTUIStyle PRXheaderFont](vtStyle, "PRXheaderFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v16);

    v17 = self->_titleLabel;
    -[VTUIStyle PRXheaderColor](self->_vtStyle, "PRXheaderColor");
  }
  else
  {
    -[VTUIStyle proxHeaderFont](vtStyle, "proxHeaderFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v18);

    v17 = self->_titleLabel;
    -[VTUIStyle proxHeaderColor](self->_vtStyle, "proxHeaderColor");
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v17, "setTextColor:", v19);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setText:](self->_titleLabel, "setText:", v4);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_titleLabel);
  +[VTUIButton _vtuiProximityDismissButton](VTUIButton, "_vtuiProximityDismissButton");
  v20 = (UIButton *)objc_claimAutoreleasedReturnValue();
  dismissButton = self->_dismissButton;
  self->_dismissButton = v20;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", self->_dismissButton);
  v22 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  footerView = self->_footerView;
  self->_footerView = v22;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIVoiceSelectionProximityView addSubview:](self, "addSubview:", self->_footerView);
  if (self->_selectionStyle == 1)
    +[VTUIButton _vtuiProximityButtonWithPRXStyle](VTUIButton, "_vtuiProximityButtonWithPRXStyle");
  else
    +[VTUIButton _vtuiProximityButtonWithPrimaryStyle](VTUIButton, "_vtuiProximityButtonWithPrimaryStyle");
  v24 = (UIButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v24;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v26 = self->_continueButton;
  -[VTUIStyle VTUIDeviceSpecificString:](self->_vtStyle, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CONTINUE_SETUP"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v26, "setTitle:forState:", v27, 0);

  -[UIButton titleLabel](self->_continueButton, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNumberOfLines:", 0);

  -[UIView addSubview:](self->_footerView, "addSubview:", self->_continueButton);
  if (self->_allowsRandomVoiceSelection)
  {
    +[VTUIButton _vtuiButtonWithSecondaryStyle](VTUIButton, "_vtuiButtonWithSecondaryStyle");
    v29 = (UIButton *)objc_claimAutoreleasedReturnValue();
    chooseRandomVoiceButton = self->_chooseRandomVoiceButton;
    self->_chooseRandomVoiceButton = v29;

    -[UIButton titleLabel](self->_chooseRandomVoiceButton, "titleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxCancelFont](self->_vtStyle, "proxCancelFont");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFont:", v32);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_chooseRandomVoiceButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v33 = self->_chooseRandomVoiceButton;
    v34 = self->_vtStyle;
    if (self->_selectionStyle == 1)
    {
      -[VTUIStyle homeAppTintColor](v34, "homeAppTintColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](v33, "setTintColor:", v35);

      v33 = self->_chooseRandomVoiceButton;
      v34 = self->_vtStyle;
      v36 = CFSTR("BUTTON_CHOOSE_FOR_ME_CAPITALIZED");
    }
    else
    {
      v36 = CFSTR("BUTTON_CHOOSE_FOR_ME");
    }
    -[VTUIStyle VTUIDeviceSpecificString:](v34, "VTUIDeviceSpecificString:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v33, "setTitle:forState:", v37, 0);

    -[UIButton titleLabel](self->_chooseRandomVoiceButton, "titleLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setNumberOfLines:", 0);

    -[UIView addSubview:](self->_footerView, "addSubview:", self->_chooseRandomVoiceButton);
  }

}

- (void)setContentView:(id)a3
{
  UIView **p_contentView;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  p_contentView = &self->_contentView;
  objc_storeStrong((id *)&self->_contentView, a3);
  v26 = a3;
  -[VTUIProximityContainerView addSubview:](self->_containerView, "addSubview:", *p_contentView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView topAnchor](self->_footerView, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](*p_contentView, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "proxBottomPaddingVoiceSelectionOptions");
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = 1132068864;
  objc_msgSend(v20, "setPriority:", v9);
  v21 = (void *)MEMORY[0x24BDD1628];
  -[UIView topAnchor](*p_contentView, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "proxTopPaddingVoiceSelectionOptions");
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  -[UIView leadingAnchor](*p_contentView, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeadingLandscape](self->_vtStyle, "proxLeadingLandscape");
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v13;
  -[UIView trailingAnchor](*p_contentView, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityContainerView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailingLandscape](self->_vtStyle, "proxTrailingLandscape");
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v18;
  v27[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v19);

}

- (void)_setupConstraintsToSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  VTUIProximityContainerView *containerView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  VTUIProximityContainerView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
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
  int64_t selectionStyle;
  void *v65;
  void *v66;
  VTUIStyle *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  void *v72;
  _QWORD *v73;
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
  VTUIStyle *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  unint64_t v118;
  double v119;
  NSArray *v120;
  NSArray *constraints;
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
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  _BOOL4 v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  _QWORD v148[5];
  _QWORD v149[3];
  _QWORD v150[4];
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[2];
  _QWORD v154[3];
  _QWORD v155[4];
  _QWORD v156[2];
  _QWORD v157[2];
  void *v158;
  _QWORD v159[5];

  height = a3.height;
  width = a3.width;
  v159[3] = *MEMORY[0x24BDAC8D0];
  -[VTUIVoiceSelectionProximityView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = -[VTUIProximityView _shouldUsePhoneLandscapeLayoutForSize:](self, "_shouldUsePhoneLandscapeLayoutForSize:", width, height);
  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDeviceIPad");

  containerView = self->_containerView;
  v146 = v7;
  v138 = v6;
  if ((v9 & 1) != 0)
  {
    -[VTUIProximityContainerView centerYAnchor](containerView, "centerYAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v159[0] = v12;
    -[VTUIProximityContainerView centerXAnchor](self->_containerView, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v159[1] = v15;
    -[VTUIProximityContainerView widthAnchor](self->_containerView, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxViewMaxWidth](self->_vtStyle, "proxViewMaxWidth");
    objc_msgSend(v16, "constraintEqualToConstant:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v159[2] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v159, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "addObjectsFromArray:", v18);

    v7 = v146;
    v19 = v140;
    if (!v140)
      goto LABEL_8;
LABEL_6:
    -[VTUIStyle proxViewHeightPhoneLandscape](self->_vtStyle, "proxViewHeightPhoneLandscape");
    goto LABEL_9;
  }
  -[VTUIProximityContainerView bottomAnchor](containerView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIVoiceSelectionProximityView bottomAnchor](self, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v158, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v24);

  v25 = self->_containerView;
  if (v140)
  {
    -[VTUIProximityContainerView centerXAnchor](v25, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v157[0] = v28;
    -[VTUIProximityContainerView widthAnchor](self->_containerView, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxViewMaxWidthPhoneLandscape](self->_vtStyle, "proxViewMaxWidthPhoneLandscape");
    objc_msgSend(v29, "constraintEqualToConstant:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v157[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v157, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v31);

    v19 = v140;
    goto LABEL_6;
  }
  -[VTUIProximityContainerView leadingAnchor](v25, "leadingAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v144, "constraintEqualToAnchor:constant:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v156[0] = v34;
  -[VTUIProximityContainerView trailingAnchor](self->_containerView, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, -v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v156[1] = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v156, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v39);

  v19 = 0;
LABEL_8:
  -[VTUIStyle proxViewHeight](self->_vtStyle, "proxViewHeight");
LABEL_9:
  v40 = v32;
  -[VTUIProximityContainerView heightAnchor](self->_containerView, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintGreaterThanOrEqualToConstant:", v40);
  v42 = objc_claimAutoreleasedReturnValue();

  v137 = (void *)v42;
  objc_msgSend(v7, "addObject:", v42);
  -[VTUIProximityContainerView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  vtStyle = self->_vtStyle;
  if (v19)
    -[VTUIStyle proxTitleTrailingLandscape](vtStyle, "proxTitleTrailingLandscape");
  else
    -[VTUIStyle proxTrailing](vtStyle, "proxTrailing");
  v46 = v45;
  -[UIImageView firstBaselineAnchor](self->_orbImage, "firstBaselineAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "topAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImageOffsetFromTopEnrollment](self->_vtStyle, "orbImageOffsetFromTopEnrollment");
  objc_msgSend(v134, "constraintEqualToAnchor:constant:", v132);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v155[0] = v129;
  -[UIImageView centerXAnchor](self->_orbImage, "centerXAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIVoiceSelectionProximityView centerXAnchor](self, "centerXAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v155[1] = v49;
  -[UIImageView widthAnchor](self->_orbImage, "widthAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImageLength](self->_vtStyle, "orbImageLength");
  objc_msgSend(v50, "constraintEqualToConstant:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v155[2] = v51;
  -[UIImageView heightAnchor](self->_orbImage, "heightAnchor");
  v145 = v43;
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbImageLength](self->_vtStyle, "orbImageLength");
  objc_msgSend(v52, "constraintEqualToConstant:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v155[3] = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v155, 4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "addObjectsFromArray:", v54);

  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_orbImage, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle titleOffsetFromOrbImage](self->_vtStyle, "titleOffsetFromOrbImage");
  objc_msgSend(v135, "constraintEqualToAnchor:constant:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = v56;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeading](self->_vtStyle, "proxLeading");
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v154[1] = v59;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, -v46);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v154[2] = v62;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v154, 3);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "addObjectsFromArray:", v63);

  selectionStyle = self->_selectionStyle;
  -[UIButton centerYAnchor](self->_dismissButton, "centerYAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = self->_vtStyle;
  v136 = v65;
  if (selectionStyle == 1)
  {
    -[VTUIStyle PRXdismissButtonMargin](v67, "PRXdismissButtonMargin");
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v153[0] = v68;
    -[UIButton centerXAnchor](self->_dismissButton, "centerXAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle PRXdismissButtonMargin](self->_vtStyle, "PRXdismissButtonMargin");
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, -v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v153[1] = v72;
    v73 = v153;
  }
  else
  {
    -[VTUIStyle proxTrainingDismissButtonVerticalPaddingTop](v67, "proxTrainingDismissButtonVerticalPaddingTop");
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v152[0] = v68;
    -[UIButton centerXAnchor](self->_dismissButton, "centerXAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxTrainingDismissButtonHorizontalPadding](self->_vtStyle, "proxTrainingDismissButtonHorizontalPadding");
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v152[1] = v72;
    v73 = v152;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 2);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "addObjectsFromArray:", v74);

  -[UIButton widthAnchor](self->_dismissButton, "widthAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v75, "constraintEqualToConstant:");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = v76;
  -[UIButton heightAnchor](self->_dismissButton, "heightAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v77, "constraintEqualToConstant:");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v151[1] = v78;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v151, 2);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "addObjectsFromArray:", v79);

  -[UIView topAnchor](self->_footerView, "topAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton topAnchor](self->_continueButton, "topAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "constraintEqualToAnchor:", v127);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v150[0] = v125;
  -[UIView bottomAnchor](self->_footerView, "bottomAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "bottomAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "constraintEqualToAnchor:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v150[1] = v81;
  -[UIView leadingAnchor](self->_footerView, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v150[2] = v84;
  -[UIView trailingAnchor](self->_footerView, "trailingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "trailingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v150[3] = v87;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v150, 4);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "addObjectsFromArray:", v88);

  v89 = self->_vtStyle;
  if (v140)
  {
    -[VTUIStyle proxLeadingLandscape](v89, "proxLeadingLandscape");
    v91 = v90;
    -[VTUIStyle proxTrailingLandscape](self->_vtStyle, "proxTrailingLandscape");
  }
  else
  {
    -[VTUIStyle proxLeading](v89, "proxLeading");
    v91 = v93;
    -[VTUIStyle proxTrailing](self->_vtStyle, "proxTrailing");
  }
  v94 = v92;
  -[UIButton heightAnchor](self->_continueButton, "heightAnchor");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPrimaryButtonHeight](self->_vtStyle, "proxPrimaryButtonHeight");
  objc_msgSend(v141, "constraintEqualToConstant:");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v149[0] = v95;
  -[UIButton leadingAnchor](self->_continueButton, "leadingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_footerView, "leadingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:constant:", v97, v91);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v149[1] = v98;
  -[UIButton trailingAnchor](self->_continueButton, "trailingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_footerView, "trailingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:constant:", v100, -v94);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v149[2] = v101;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v149, 3);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "addObjectsFromArray:", v102);

  if (self->_allowsRandomVoiceSelection)
  {
    -[UIButton firstBaselineAnchor](self->_chooseRandomVoiceButton, "firstBaselineAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton bottomAnchor](self->_continueButton, "bottomAnchor");
    v142 = objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxTrainingDismissButtonVerticalPaddingTop](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingTop");
    objc_msgSend(v128, "constraintEqualToAnchor:constant:", v142);
    v133 = objc_claimAutoreleasedReturnValue();
    v148[0] = v133;
    -[UIButton firstBaselineAnchor](self->_chooseRandomVoiceButton, "firstBaselineAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIProximityContainerView bottomAnchor](self->_containerView, "bottomAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxTrainingDismissButtonVerticalPaddingBottom](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingBottom");
    objc_msgSend(v126, "constraintEqualToAnchor:constant:", v139, -v103);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v148[1] = v131;
    -[UIButton leadingAnchor](self->_chooseRandomVoiceButton, "leadingAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](self->_continueButton, "leadingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "constraintEqualToAnchor:", v122);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v148[2] = v104;
    -[UIButton trailingAnchor](self->_chooseRandomVoiceButton, "trailingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](self->_continueButton, "trailingAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:", v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v148[3] = v107;
    -[UIButton bottomAnchor](self->_continueButton, "bottomAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](self->_chooseRandomVoiceButton, "topAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxChooseForMeTopPaddingFromContinueButton](self->_vtStyle, "proxChooseForMeTopPaddingFromContinueButton");
    objc_msgSend(v108, "constraintEqualToAnchor:constant:", v109, -v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v148[4] = v111;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v148, 5);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v146;
    objc_msgSend(v146, "addObjectsFromArray:", v112);

    v114 = v128;
    v115 = v126;

    v116 = (void *)v133;
    v117 = (void *)v142;

    v118 = 0x24BDBC000;
  }
  else
  {
    -[UIButton bottomAnchor](self->_continueButton, "bottomAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIProximityContainerView bottomAnchor](self->_containerView, "bottomAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxPaddingFromBottom](self->_vtStyle, "proxPaddingFromBottom");
    objc_msgSend(v114, "constraintEqualToAnchor:constant:", v117, -v119);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = v116;
    v118 = 0x24BDBC000uLL;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v147, 1);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v146;
    objc_msgSend(v146, "addObjectsFromArray:", v115);
  }

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v113);
  objc_msgSend(*(id *)(v118 + 3632), "arrayWithArray:", v113);
  v120 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v120;

}

- (void)setShouldHideCompactBackgroundCardView:(BOOL)a3
{
  _BOOL8 v3;
  VTUIProximityContainerView *containerView;
  void *v6;
  BOOL v7;

  v3 = a3;
  containerView = self->_containerView;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
  }
  -[VTUIProximityContainerView setBackgroundColor:](containerView, "setBackgroundColor:", v6);

  -[UIButton setHidden:](self->_dismissButton, "setHidden:", v3);
  self->_isHidingCompactBackgroundCardView = v7;
}

- (id)viewConstraints
{
  return self->_constraints;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  VTUIStyle *vtStyle;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGSize result;

  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v4 = v3;
  v6 = v5;
  -[VTUIStyle proxTopPaddingVoiceSelectionOptions](self->_vtStyle, "proxTopPaddingVoiceSelectionOptions");
  v8 = v6 + v7;
  -[VTUIStyle proxBottomPaddingVoiceSelectionOptions](self->_vtStyle, "proxBottomPaddingVoiceSelectionOptions");
  v10 = v8 + v9;
  -[VTUIStyle orbImageLength](self->_vtStyle, "orbImageLength");
  v12 = v10 + v11;
  -[VTUIStyle orbImageOffsetFromTopEnrollment](self->_vtStyle, "orbImageOffsetFromTopEnrollment");
  v14 = v12 + v13;
  -[VTUIStyle titleOffsetFromOrb](self->_vtStyle, "titleOffsetFromOrb");
  v16 = v14 + v15;
  -[UILabel intrinsicContentSize](self->_titleLabel, "intrinsicContentSize");
  v18 = v16 + v17;
  -[VTUIStyle proxPrimaryButtonHeight](self->_vtStyle, "proxPrimaryButtonHeight");
  v20 = v18 + v19;
  vtStyle = self->_vtStyle;
  if (self->_allowsRandomVoiceSelection)
  {
    -[VTUIStyle proxTrainingDismissButtonVerticalPaddingBottom](vtStyle, "proxTrainingDismissButtonVerticalPaddingBottom");
    v23 = v20 + v22;
    -[VTUIStyle proxChooseForMeTopPaddingFromContinueButton](self->_vtStyle, "proxChooseForMeTopPaddingFromContinueButton");
    v25 = v23 + v24;
    -[UIButton intrinsicContentSize](self->_chooseRandomVoiceButton, "intrinsicContentSize");
    v27 = v25 + v26;
  }
  else
  {
    -[VTUIStyle proxPaddingFromBottom](vtStyle, "proxPaddingFromBottom");
    v27 = v20 + v28;
  }
  v29 = v4;
  result.height = v27;
  result.width = v29;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UIView *footerView;
  BOOL v9;
  unsigned __int8 v10;
  UIView *contentView;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!self->_isHidingCompactBackgroundCardView)
  {
    v13.receiver = self;
    v13.super_class = (Class)VTUIVoiceSelectionProximityView;
    v10 = -[VTUIVoiceSelectionProximityView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
LABEL_6:
    v9 = v10;
    goto LABEL_7;
  }
  footerView = self->_footerView;
  -[VTUIVoiceSelectionProximityView convertPoint:toView:](self, "convertPoint:toView:", footerView, x, y);
  if (!-[UIView pointInside:withEvent:](footerView, "pointInside:withEvent:", v7))
  {
    contentView = self->_contentView;
    -[VTUIVoiceSelectionProximityView convertPoint:toView:](self, "convertPoint:toView:", contentView, x, y);
    v10 = -[UIView pointInside:withEvent:](contentView, "pointInside:withEvent:", v7);
    goto LABEL_6;
  }
  v9 = 1;
LABEL_7:

  return v9;
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (UIButton)chooseRandomVoiceButton
{
  return self->_chooseRandomVoiceButton;
}

- (void)setChooseRandomVoiceButton:(id)a3
{
  objc_storeStrong((id *)&self->_chooseRandomVoiceButton, a3);
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_chooseRandomVoiceButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_orbImage, 0);
}

@end
