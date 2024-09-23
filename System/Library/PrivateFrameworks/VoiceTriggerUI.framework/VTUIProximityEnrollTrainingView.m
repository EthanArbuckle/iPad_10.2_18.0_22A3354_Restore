@implementation VTUIProximityEnrollTrainingView

- (VTUIProximityEnrollTrainingView)initWithFrame:(CGRect)a3 forEnrollmentStyle:(int64_t)a4
{
  VTUIProximityEnrollTrainingView *v5;
  void *v6;
  UIButton *skipButton;
  void *v8;

  self->_enrollmentStyle = a4;
  v5 = -[VTUIProximityEnrollTrainingView initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (a4 == 1)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    skipButton = v5->_skipButton;
    objc_msgSend(v6, "VTUIDeviceSpecificString:", CFSTR("BUTTON_DONT_RECOGNIZE_VOICE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](skipButton, "setTitle:forState:", v8, 0);

  }
  return v5;
}

- (void)didMoveToWindow
{
  UIView *containerView;
  void *v4;
  UIButton *skipButton;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VTUIProximityEnrollTrainingView;
  -[VTUIProximityEnrollTrainingView didMoveToWindow](&v7, sel_didMoveToWindow);
  if (self->_enrollmentStyle == 1)
  {
    containerView = self->_containerView;
    -[VTUIProximityEnrollTrainingView tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](containerView, "setTintColor:", v4);

    skipButton = self->_skipButton;
    -[VTUIProximityEnrollTrainingView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](skipButton, "setTitleColor:forState:", v6, 0);

  }
}

- (VTUIProximityEnrollTrainingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  VTUIProximityEnrollTrainingView *v5;
  uint64_t v6;
  VTUIStyle *vtStyle;
  uint64_t v8;
  VTPreferences *vtPrefs;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  v11.receiver = self;
  v11.super_class = (Class)VTUIProximityEnrollTrainingView;
  v5 = -[VTUIProximityEnrollTrainingView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v6 = objc_claimAutoreleasedReturnValue();
    vtStyle = v5->_vtStyle;
    v5->_vtStyle = (VTUIStyle *)v6;

    objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
    v8 = objc_claimAutoreleasedReturnValue();
    vtPrefs = v5->_vtPrefs;
    v5->_vtPrefs = (VTPreferences *)v8;

    -[VTUIProximityEnrollTrainingView _setupContent](v5, "_setupContent");
    -[VTUIProximityEnrollTrainingView _setupConstraintsToSize:](v5, "_setupConstraintsToSize:", width, height);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SUICOrbView invalidate](self->_orbView, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)VTUIProximityEnrollTrainingView;
  -[VTUIProximityEnrollTrainingView dealloc](&v3, sel_dealloc);
}

- (void)_setupContent
{
  VTUIProximityContainerView *v3;
  UIView *containerView;
  id v5;
  UIStackView *v6;
  UIStackView *instructionStackView;
  UILabel *v8;
  UILabel *instructionPreludeLabel;
  void *v10;
  void *v11;
  void *v12;
  int64_t enrollmentStyle;
  VTUIPagedLabel *v14;
  VTUIPagedLabel *v15;
  VTUIPagedLabel *instructionPagedLabel;
  UILabel *v17;
  UILabel *statusLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  UILabel *pageLabel;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  UIButton *v29;
  UIButton *skipButton;
  int64_t v31;
  void *v32;
  VTUIStyle *vtStyle;
  void *v34;
  UIButton *v35;
  void *v36;
  UIButton *v37;
  UIButton *dismissButton;
  id v39;
  double v40;
  double v41;
  double v42;
  SUICOrbView *v43;
  SUICOrbView *orbView;
  VTUICheckMarkView *v45;
  VTUICheckMarkView *checkMark;
  id v47;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = &v3->super;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIProximityEnrollTrainingView addSubview:](self, "addSubview:", self->_containerView);
  v5 = objc_alloc(MEMORY[0x24BEBD978]);
  v6 = (UIStackView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  instructionStackView = self->_instructionStackView;
  self->_instructionStackView = v6;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_instructionStackView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_instructionStackView, "setSpacing:", 28.0);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_instructionStackView);
  v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  instructionPreludeLabel = self->_instructionPreludeLabel;
  self->_instructionPreludeLabel = v8;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionPreludeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_instructionPreludeLabel, "setTextAlignment:", 1);
  objc_msgSend(v47, "proxInstructionPreAndPostfixFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_instructionPreludeLabel, "setFont:", v10);

  -[UILabel setNumberOfLines:](self->_instructionPreludeLabel, "setNumberOfLines:", 4);
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uiLocalizedStringForKey:", CFSTR("TEXT_LABEL_SAY"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_instructionPreludeLabel, "setText:", v12);

  -[UIStackView addArrangedSubview:](self->_instructionStackView, "addArrangedSubview:", self->_instructionPreludeLabel);
  -[UIStackView setCustomSpacing:afterView:](self->_instructionStackView, "setCustomSpacing:afterView:", self->_instructionPreludeLabel, 10.0);
  enrollmentStyle = self->_enrollmentStyle;
  v14 = [VTUIPagedLabel alloc];
  -[VTUIProximityEnrollTrainingView frame](self, "frame");
  v15 = -[VTUIPagedLabel initWithFrame:isProximity:forEnrollmentStyle:](v14, "initWithFrame:isProximity:forEnrollmentStyle:", 1, enrollmentStyle == 1);
  instructionPagedLabel = self->_instructionPagedLabel;
  self->_instructionPagedLabel = v15;

  -[VTUIPagedLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionPagedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](self->_instructionStackView, "addArrangedSubview:", self->_instructionPagedLabel);
  v17 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v17;

  -[UILabel setNumberOfLines:](self->_statusLabel, "setNumberOfLines:", 4);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_statusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = self->_statusLabel;
  objc_msgSend(v47, "proxInstructionFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v19, "setFont:", v20);

  v21 = self->_statusLabel;
  objc_msgSend(v47, "proxInstructionColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v21, "setTextColor:", v22);

  -[UILabel setTextAlignment:](self->_statusLabel, "setTextAlignment:", 1);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_statusLabel);
  v23 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  pageLabel = self->_pageLabel;
  self->_pageLabel = v23;

  -[UILabel setNumberOfLines:](self->_pageLabel, "setNumberOfLines:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_pageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v25 = self->_pageLabel;
  if (self->_enrollmentStyle == 1)
    objc_msgSend(v47, "PRXpageFont");
  else
    objc_msgSend(v47, "proxPageFont");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v25, "setFont:", v26);

  v27 = self->_pageLabel;
  objc_msgSend(v47, "proxPageLabelColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v27, "setTextColor:", v28);

  -[UILabel setTextAlignment:](self->_pageLabel, "setTextAlignment:", 1);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_pageLabel);
  +[VTUIButton _vtuiButtonWithSecondaryStyle](VTUIButton, "_vtuiButtonWithSecondaryStyle");
  v29 = (UIButton *)objc_claimAutoreleasedReturnValue();
  skipButton = self->_skipButton;
  self->_skipButton = v29;

  v31 = self->_enrollmentStyle;
  -[UIButton titleLabel](self->_skipButton, "titleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  vtStyle = self->_vtStyle;
  if (v31 == 1)
    -[VTUIStyle PRXcancelFont](vtStyle, "PRXcancelFont");
  else
    -[VTUIStyle proxCancelFont](vtStyle, "proxCancelFont");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFont:", v34);

  v35 = self->_skipButton;
  objc_msgSend(v47, "VTUIDeviceSpecificString:", CFSTR("BUTTON_SET_UP_LATER"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v35, "setTitle:forState:", v36, 0);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_skipButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setClipsToBounds:](self->_skipButton, "setClipsToBounds:", 0);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_skipButton);
  +[VTUIButton _vtuiProximityDismissButton](VTUIButton, "_vtuiProximityDismissButton");
  v37 = (UIButton *)objc_claimAutoreleasedReturnValue();
  dismissButton = self->_dismissButton;
  self->_dismissButton = v37;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_dismissButton);
  v39 = objc_alloc(MEMORY[0x24BEA85D8]);
  -[VTUIStyle orbLength](self->_vtStyle, "orbLength");
  v41 = v40;
  -[VTUIStyle orbLength](self->_vtStyle, "orbLength");
  v43 = (SUICOrbView *)objc_msgSend(v39, "initWithFrame:", 0.0, 0.0, v41, v42);
  orbView = self->_orbView;
  self->_orbView = v43;

  -[SUICOrbView setTranslatesAutoresizingMaskIntoConstraints:](self->_orbView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_orbView);
  v45 = objc_alloc_init(VTUICheckMarkView);
  checkMark = self->_checkMark;
  self->_checkMark = v45;

  -[VTUICheckMarkView setTranslatesAutoresizingMaskIntoConstraints:](self->_checkMark, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_checkMark);

}

- (void)_setupConstraintsToSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  UIView *containerView;
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
  double v22;
  void *v23;
  void *v24;
  UIView *v25;
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
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  VTUIStyle *vtStyle;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
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
  double v73;
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
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  NSArray *v117;
  NSArray *viewConstraints;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  _BOOL4 v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  _QWORD v133[2];
  _QWORD v134[3];
  _QWORD v135[3];
  _QWORD v136[2];
  _QWORD v137[2];
  _QWORD v138[2];
  _QWORD v139[3];
  _QWORD v140[3];
  _QWORD v141[2];
  _QWORD v142[2];
  void *v143;
  _QWORD v144[5];

  height = a3.height;
  width = a3.width;
  v144[3] = *MEMORY[0x24BDAC8D0];
  -[VTUIProximityEnrollTrainingView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView safeAreaLayoutGuide](self->_containerView, "safeAreaLayoutGuide");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = -[VTUIProximityView _shouldUsePhoneLandscapeLayoutForSize:](self, "_shouldUsePhoneLandscapeLayoutForSize:", width, height);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDeviceIPad");

  containerView = self->_containerView;
  v132 = v7;
  v125 = v6;
  if ((v9 & 1) != 0)
  {
    -[UIView centerYAnchor](containerView, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v144[0] = v13;
    -[UIView centerXAnchor](self->_containerView, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v144[1] = v16;
    -[UIView widthAnchor](self->_containerView, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxViewMaxWidth](self->_vtStyle, "proxViewMaxWidth");
    objc_msgSend(v17, "constraintEqualToConstant:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v144[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v144, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "addObjectsFromArray:", v19);

    v7 = v132;
    if (!v126)
      goto LABEL_8;
LABEL_6:
    -[VTUIStyle proxViewHeightPhoneLandscape](self->_vtStyle, "proxViewHeightPhoneLandscape");
    goto LABEL_9;
  }
  -[UIView bottomAnchor](containerView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIProximityEnrollTrainingView bottomAnchor](self, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v143, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v24);

  v25 = self->_containerView;
  if (v126)
  {
    -[UIView centerXAnchor](v25, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v142[0] = v28;
    -[UIView widthAnchor](self->_containerView, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIStyle proxViewMaxWidthPhoneLandscape](self->_vtStyle, "proxViewMaxWidthPhoneLandscape");
    objc_msgSend(v29, "constraintEqualToConstant:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v142[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v142, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v31);

    goto LABEL_6;
  }
  -[UIView leadingAnchor](v25, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v141[0] = v35;
  -[UIView trailingAnchor](self->_containerView, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxContainerHorizontalVerticalPadding](self->_vtStyle, "proxContainerHorizontalVerticalPadding");
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v141[1] = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v141, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v40);

LABEL_8:
  -[VTUIStyle proxViewHeight](self->_vtStyle, "proxViewHeight");
LABEL_9:
  v41 = v32;
  -[UIView heightAnchor](self->_containerView, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", v41);
  v43 = objc_claimAutoreleasedReturnValue();

  v124 = (void *)v43;
  objc_msgSend(v7, "addObject:", v43);
  -[SUICOrbView widthAnchor](self->_orbView, "widthAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbLength](self->_vtStyle, "orbLength");
  objc_msgSend(v121, "constraintEqualToConstant:");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v140[0] = v120;
  -[SUICOrbView heightAnchor](self->_orbView, "heightAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle orbLength](self->_vtStyle, "orbLength");
  objc_msgSend(v119, "constraintEqualToConstant:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v140[1] = v44;
  -[SUICOrbView centerXAnchor](self->_orbView, "centerXAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v140[2] = v47;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v140, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v48);

  -[SUICOrbView topAnchor](self->_orbView, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObject:", v51);

  vtStyle = self->_vtStyle;
  if (v126)
  {
    -[VTUIStyle proxPaddingTrainingTitleLandscape](vtStyle, "proxPaddingTrainingTitleLandscape");
    v54 = v53;
    -[VTUIStyle proxLeadingLandscape](self->_vtStyle, "proxLeadingLandscape");
    v56 = v55;
    -[VTUIStyle proxTrailingLandscape](self->_vtStyle, "proxTrailingLandscape");
  }
  else
  {
    -[VTUIStyle proxPaddingTrainingTitle](vtStyle, "proxPaddingTrainingTitle");
    v54 = v58;
    -[VTUIStyle proxLeading](self->_vtStyle, "proxLeading");
    v56 = v59;
    -[VTUIStyle proxTrailing](self->_vtStyle, "proxTrailing");
  }
  v60 = v57;
  -[UIStackView topAnchor](self->_instructionStackView, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICOrbView bottomAnchor](self->_orbView, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, v54);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObject:", v63);

  -[UIStackView heightAnchor](self->_instructionStackView, "heightAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxStatusLabelMaxHeight](self->_vtStyle, "proxStatusLabelMaxHeight");
  objc_msgSend(v127, "constraintEqualToConstant:");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v139[0] = v122;
  -[UIStackView leadingAnchor](self->_instructionStackView, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, v56);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v139[1] = v66;
  -[UIStackView trailingAnchor](self->_instructionStackView, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68, -v60);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v139[2] = v69;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v139, 3);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObjectsFromArray:", v70);

  -[UIButton firstBaselineAnchor](self->_skipButton, "firstBaselineAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_containerView, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonVerticalPaddingBottom](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingBottom");
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72, -v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v74;
  -[UIButton centerXAnchor](self->_skipButton, "centerXAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "centerXAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v138[1] = v77;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v138, 2);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObjectsFromArray:", v78);

  -[UIButton centerYAnchor](self->_dismissButton, "centerYAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonVerticalPaddingTop](self->_vtStyle, "proxTrainingDismissButtonVerticalPaddingTop");
  v81 = v79;
  objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = v82;
  -[UIButton centerXAnchor](self->_dismissButton, "centerXAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonHorizontalPadding](self->_vtStyle, "proxTrainingDismissButtonHorizontalPadding");
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v85;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v137, 2);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObjectsFromArray:", v86);

  -[UIButton widthAnchor](self->_dismissButton, "widthAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v87, "constraintEqualToConstant:");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = v88;
  -[UIButton heightAnchor](self->_dismissButton, "heightAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrainingDismissButtonWidthOrHeight](self->_vtStyle, "proxTrainingDismissButtonWidthOrHeight");
  objc_msgSend(v89, "constraintEqualToConstant:");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v136[1] = v90;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v136, 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObjectsFromArray:", v91);

  -[UILabel centerYAnchor](self->_statusLabel, "centerYAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "centerYAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle statusLabelVerticalOffsetFromCenter](self->_vtStyle, "statusLabelVerticalOffsetFromCenter");
  objc_msgSend(v129, "constraintEqualToAnchor:constant:", v123);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v135[0] = v92;
  -[UILabel leadingAnchor](self->_statusLabel, "leadingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeading](self->_vtStyle, "proxLeading");
  objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v135[1] = v95;
  -[UILabel trailingAnchor](self->_statusLabel, "trailingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "trailingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailing](self->_vtStyle, "proxTrailing");
  objc_msgSend(v96, "constraintEqualToAnchor:constant:", v97, -v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v135[2] = v99;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v135, 3);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObjectsFromArray:", v100);

  -[UIButton firstBaselineAnchor](self->_skipButton, "firstBaselineAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](self->_pageLabel, "firstBaselineAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxPaddingSkipButtonPageLabel](self->_vtStyle, "proxPaddingSkipButtonPageLabel");
  objc_msgSend(v130, "constraintEqualToAnchor:constant:", v128);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v134[0] = v101;
  -[UILabel leadingAnchor](self->_pageLabel, "leadingAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "leadingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxLeading](self->_vtStyle, "proxLeading");
  objc_msgSend(v102, "constraintEqualToAnchor:constant:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v104;
  -[UILabel trailingAnchor](self->_pageLabel, "trailingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "trailingAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIStyle proxTrailing](self->_vtStyle, "proxTrailing");
  objc_msgSend(v105, "constraintEqualToAnchor:constant:", v106, -v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v134[2] = v108;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v134, 3);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObjectsFromArray:", v109);

  -[VTUICheckMarkView centerYAnchor](self->_checkMark, "centerYAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICOrbView centerYAnchor](self->_orbView, "centerYAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "constraintEqualToAnchor:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = v112;
  -[VTUICheckMarkView centerXAnchor](self->_checkMark, "centerXAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICOrbView centerXAnchor](self->_orbView, "centerXAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v133[1] = v115;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v133, 2);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObjectsFromArray:", v116);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v132);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v132);
  v117 = (NSArray *)objc_claimAutoreleasedReturnValue();
  viewConstraints = self->_viewConstraints;
  self->_viewConstraints = v117;

}

- (UIButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (VTUICheckMarkView)checkMark
{
  return self->_checkMark;
}

- (void)setCheckMark:(id)a3
{
  objc_storeStrong((id *)&self->_checkMark, a3);
}

- (VTUIPagedLabel)instructionPagedLabel
{
  return self->_instructionPagedLabel;
}

- (void)setInstructionPagedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instructionPagedLabel, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabel, a3);
}

- (UILabel)pageLabel
{
  return self->_pageLabel;
}

- (void)setPageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_pageLabel, a3);
}

- (SUICOrbView)orbView
{
  return self->_orbView;
}

- (void)setOrbView:(id)a3
{
  objc_storeStrong((id *)&self->_orbView, a3);
}

- (UILabel)instructionPreludeLabel
{
  return self->_instructionPreludeLabel;
}

- (void)setInstructionPreludeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instructionPreludeLabel, a3);
}

- (UIStackView)instructionStackView
{
  return self->_instructionStackView;
}

- (void)setInstructionStackView:(id)a3
{
  objc_storeStrong((id *)&self->_instructionStackView, a3);
}

- (int64_t)enrollmentStyle
{
  return self->_enrollmentStyle;
}

- (void)setEnrollmentStyle:(int64_t)a3
{
  self->_enrollmentStyle = a3;
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
  objc_storeStrong((id *)&self->_instructionStackView, 0);
  objc_storeStrong((id *)&self->_instructionPreludeLabel, 0);
  objc_storeStrong((id *)&self->_pageLabel, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_instructionPagedLabel, 0);
  objc_storeStrong((id *)&self->_checkMark, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_vtPrefs, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_orbView, 0);
}

@end
