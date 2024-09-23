@implementation VTUIEnrollTrainingView

- (VTUIEnrollTrainingView)initWithFrame:(CGRect)a3
{
  VTUIEnrollTrainingView *v3;
  VTUIEnrollTrainingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollTrainingView;
  v3 = -[VTUIEnrollTrainingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VTUIEnrollTrainingView _setupUI](v3, "_setupUI");
  return v4;
}

- (void)_setupUI
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  SUICOrbView *v9;
  SUICOrbView *orbView;
  VTUICheckMarkView *v11;
  VTUICheckMarkView *checkMark;
  id v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *instructionPreludeLabel;
  void *v18;
  void *v19;
  VTUIPagedLabel *v20;
  VTUIPagedLabel *v21;
  VTUIPagedLabel *instructionPagedLabel;
  UILabel *v23;
  UILabel *instructionContinuationLabel;
  void *v25;
  void *v26;
  UILabel *v27;
  UILabel *statusLabel;
  void *v29;
  void *v30;
  UIButton *v31;
  UIButton *skipButton;
  UIButton *v33;
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
  double v59;
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
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  SiriUIContentButton *v80;
  SiriUIContentButton *radarButton;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
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
  _QWORD v116[2];
  _QWORD v117[3];
  _QWORD v118[3];
  _QWORD v119[3];
  _QWORD v120[2];
  _QWORD v121[6];

  v121[4] = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingView readableContentGuide](self, "readableContentGuide");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingView setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = objc_alloc(MEMORY[0x24BEA85D8]);
  objc_msgSend(v3, "orbLength");
  v7 = v6;
  objc_msgSend(v3, "orbLength");
  v9 = (SUICOrbView *)objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v7, v8);
  orbView = self->_orbView;
  self->_orbView = v9;

  -[SUICOrbView setTranslatesAutoresizingMaskIntoConstraints:](self->_orbView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIEnrollTrainingView addSubview:](self, "addSubview:", self->_orbView);
  v11 = objc_alloc_init(VTUICheckMarkView);
  checkMark = self->_checkMark;
  self->_checkMark = v11;

  -[VTUICheckMarkView setTranslatesAutoresizingMaskIntoConstraints:](self->_checkMark, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VTUIEnrollTrainingView addSubview:](self, "addSubview:", self->_checkMark);
  v13 = objc_alloc(MEMORY[0x24BEBD978]);
  v14 = (void *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "setAxis:", 1);
  objc_msgSend(v14, "setSpacing:", 28.0);
  v15 = v14;
  -[VTUIEnrollTrainingView addSubview:](self, "addSubview:", v14);
  v16 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  instructionPreludeLabel = self->_instructionPreludeLabel;
  self->_instructionPreludeLabel = v16;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionPreludeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_instructionPreludeLabel, "setTextAlignment:", 1);
  objc_msgSend(v3, "instructionPreAndPostfixFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_instructionPreludeLabel, "setFont:", v18);

  -[UILabel setNumberOfLines:](self->_instructionPreludeLabel, "setNumberOfLines:", 4);
  objc_msgSend(v3, "VTUIDeviceSpecificString:", CFSTR("TEXT_LABEL_SAY_FIRST"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_instructionPreludeLabel, "setText:", v19);

  objc_msgSend(v15, "addArrangedSubview:", self->_instructionPreludeLabel);
  objc_msgSend(v15, "setCustomSpacing:afterView:", self->_instructionPreludeLabel, 10.0);
  v20 = [VTUIPagedLabel alloc];
  -[VTUIEnrollTrainingView frame](self, "frame");
  v21 = -[VTUIPagedLabel initWithFrame:isProximity:forEnrollmentStyle:](v20, "initWithFrame:isProximity:forEnrollmentStyle:", 0, 0);
  instructionPagedLabel = self->_instructionPagedLabel;
  self->_instructionPagedLabel = v21;

  -[VTUIPagedLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionPagedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v113 = v15;
  objc_msgSend(v15, "addArrangedSubview:", self->_instructionPagedLabel);
  v23 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  instructionContinuationLabel = self->_instructionContinuationLabel;
  self->_instructionContinuationLabel = v23;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionContinuationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_instructionContinuationLabel, "setTextAlignment:", 1);
  objc_msgSend(v3, "instructionPreAndPostfixFont");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_instructionContinuationLabel, "setFont:", v25);

  -[UILabel setNumberOfLines:](self->_instructionContinuationLabel, "setNumberOfLines:", 4);
  objc_msgSend(v3, "VTUIDeviceSpecificString:", CFSTR("TEXT_LABEL_TO_FIRST"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_instructionContinuationLabel, "setText:", v26);

  objc_msgSend(v15, "addArrangedSubview:", self->_instructionContinuationLabel);
  v27 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v27;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_statusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_statusLabel, "setTextAlignment:", 1);
  v29 = v3;
  objc_msgSend(v3, "instructionLabelFont");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_statusLabel, "setFont:", v30);

  -[UILabel setNumberOfLines:](self->_statusLabel, "setNumberOfLines:", 4);
  -[VTUIEnrollTrainingView addSubview:](self, "addSubview:", self->_statusLabel);
  +[VTUIButton _vtuiButtonWithSecondaryStyle](VTUIButton, "_vtuiButtonWithSecondaryStyle");
  v31 = (UIButton *)objc_claimAutoreleasedReturnValue();
  skipButton = self->_skipButton;
  self->_skipButton = v31;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_skipButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v33 = self->_skipButton;
  objc_msgSend(v3, "VTUIDeviceSpecificString:", CFSTR("BUTTON_SET_UP_LATER"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v33, "setTitle:forState:", v34, 0);

  -[VTUIEnrollTrainingView addSubview:](self, "addSubview:", self->_skipButton);
  v97 = (void *)MEMORY[0x24BDD1628];
  -[SUICOrbView topAnchor](self->_orbView, "topAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "topAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orbOffsetFromTopTraining");
  objc_msgSend(v100, "constraintEqualToAnchor:constant:", v99);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = v98;
  -[SUICOrbView centerXAnchor](self->_orbView, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingView centerXAnchor](self, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v121[1] = v37;
  -[SUICOrbView widthAnchor](self->_orbView, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v3;
  objc_msgSend(v3, "orbLength");
  objc_msgSend(v38, "constraintEqualToConstant:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v121[2] = v39;
  -[SUICOrbView heightAnchor](self->_orbView, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "orbLength");
  objc_msgSend(v40, "constraintEqualToConstant:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v121[3] = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "activateConstraints:", v42);

  v43 = (void *)MEMORY[0x24BDD1628];
  -[VTUICheckMarkView centerXAnchor](self->_checkMark, "centerXAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICOrbView centerXAnchor](self->_orbView, "centerXAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v46;
  -[VTUICheckMarkView centerYAnchor](self->_checkMark, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICOrbView centerYAnchor](self->_orbView, "centerYAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v120, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "activateConstraints:", v50);

  v101 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v113, "topAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICOrbView bottomAnchor](self->_orbView, "bottomAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:", v104);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v51;
  objc_msgSend(v113, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v119[1] = v54;
  objc_msgSend(v113, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v119[2] = v57;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v119, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "activateConstraints:", v58);

  LODWORD(v59) = 1148846080;
  objc_msgSend(v113, "setContentHuggingPriority:forAxis:", 1, v59);
  v102 = (void *)MEMORY[0x24BDD1628];
  -[UILabel topAnchor](self->_statusLabel, "topAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "topAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "constraintEqualToAnchor:", v105);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v60;
  -[UILabel leadingAnchor](self->_statusLabel, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v63;
  -[UILabel trailingAnchor](self->_statusLabel, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v118[2] = v66;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v118, 3);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "activateConstraints:", v67);

  v106 = (void *)MEMORY[0x24BDD1628];
  -[UIButton leftAnchor](self->_skipButton, "leftAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "leftAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:", v107);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v68;
  -[UIButton rightAnchor](self->_skipButton, "rightAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "rightAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v71;
  -[UIButton bottomAnchor](self->_skipButton, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "bottomAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "footerSkipButtonBaselineFromBottom");
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v74, -v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v117[2] = v76;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 3);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "activateConstraints:", v77);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("radarBug"), v78, 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "imageWithRenderingMode:", 2);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEA84F8], "buttonWithImageTemplate:style:", v112, 0);
    v80 = (SiriUIContentButton *)objc_claimAutoreleasedReturnValue();
    radarButton = self->_radarButton;
    self->_radarButton = v80;

    -[SiriUIContentButton setTranslatesAutoresizingMaskIntoConstraints:](self->_radarButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "colorWithAlphaComponent:", 0.6);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIContentButton setDefaultColorForTemplate:](self->_radarButton, "setDefaultColorForTemplate:", v83);

    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "colorWithAlphaComponent:", 0.2);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIContentButton setHighlightColorForTemplate:](self->_radarButton, "setHighlightColorForTemplate:", v85);

    -[VTUIEnrollTrainingView setRadarButtonHidden:](self, "setRadarButtonHidden:", 0);
    -[VTUIEnrollTrainingView addSubview:](self, "addSubview:", self->_radarButton);
    v108 = (void *)MEMORY[0x24BDD1628];
    -[SiriUIContentButton trailingAnchor](self->_radarButton, "trailingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollTrainingView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "trailingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "radarBtnHorizontalPadding");
    objc_msgSend(v86, "constraintEqualToAnchor:constant:", v88, -v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v116[0] = v90;
    -[SiriUIContentButton bottomAnchor](self->_radarButton, "bottomAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollTrainingView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "bottomAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "radarBtnVerticalPadding");
    objc_msgSend(v91, "constraintEqualToAnchor:constant:", v93, -v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v116[1] = v95;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 2);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "activateConstraints:", v96);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[SUICOrbView invalidate](self->_orbView, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingView;
  -[VTUIEnrollTrainingView dealloc](&v3, sel_dealloc);
}

- (void)showRadarExitButton:(id)a3
{
  void *v4;
  id v5;
  UIButton *v6;
  UIButton *radarExitButton;
  void *v8;
  UIButton *v9;
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
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BEBD430];
  v5 = a3;
  objc_msgSend(v4, "buttonWithType:", 0);
  v6 = (UIButton *)objc_claimAutoreleasedReturnValue();
  radarExitButton = self->_radarExitButton;
  self->_radarExitButton = v6;

  -[SiriUIContentButton setTranslatesAutoresizingMaskIntoConstraints:](self->_radarButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton titleLabel](self->_radarExitButton, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextAlignment:", 1);

  -[UIButton setTitle:forState:](self->_radarExitButton, "setTitle:forState:", v5, 0);
  v9 = self->_radarExitButton;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v9, "setTitleColor:forState:", v10, 0);

  -[VTUIEnrollTrainingView addSubview:](self, "addSubview:", self->_radarExitButton);
  v21 = (void *)MEMORY[0x24BDD1628];
  -[UIButton leftAnchor](self->_radarExitButton, "leftAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingView readableContentGuide](self, "readableContentGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leftAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  -[UIButton rightAnchor](self->_radarExitButton, "rightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingView readableContentGuide](self, "readableContentGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v15;
  -[UIButton bottomAnchor](self->_radarExitButton, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollTrainingView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v20);

}

- (void)startCheckMarkAnimation:(BOOL)a3 completion:(id)a4
{
  -[VTUICheckMarkView animateForSuccess:completion:](self->_checkMark, "animateForSuccess:completion:", a3, a4);
}

- (void)setDelegate:(id)a3
{
  SiriUIContentButton *radarButton;
  id v5;

  v5 = a3;
  -[UIButton addTarget:action:forControlEvents:](self->_skipButton, "addTarget:action:forControlEvents:");
  radarButton = self->_radarButton;
  if (radarButton)
    -[SiriUIContentButton addTarget:action:forControlEvents:](radarButton, "addTarget:action:forControlEvents:", v5, sel_enrollTrainingViewRadarButtonPressed_, 64);

}

- (void)setSkipButtonHidden:(BOOL)a3
{
  -[UIButton setHidden:](self->_skipButton, "setHidden:", a3);
}

- (void)setCheckMarkViewHidden:(BOOL)a3
{
  -[VTUICheckMarkView setHidden:](self->_checkMark, "setHidden:", a3);
}

- (void)setRadarButtonHidden:(BOOL)a3
{
  -[SiriUIContentButton setHidden:](self->_radarButton, "setHidden:", a3);
}

- (void)slideInText:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
  -[VTUIPagedLabel slideInText:afterDelay:completion:](self->_instructionPagedLabel, "slideInText:afterDelay:completion:", a3, a5, a4);
}

- (void)clearInstructionLabel
{
  -[VTUIPagedLabel clear](self->_instructionPagedLabel, "clear");
}

- (void)setContinuationAndPreludeLabelHidden:(BOOL)a3
{
  _BOOL8 v3;
  double v5;

  v3 = a3;
  v5 = 1.0;
  if (a3)
    v5 = 0.0;
  -[UILabel setAlpha:](self->_instructionPreludeLabel, "setAlpha:", v5);
  -[VTUIEnrollTrainingView setContinuationLabelHidden:animated:](self, "setContinuationLabelHidden:animated:", v3, 0);
}

- (void)setPreludeLabelHidden:(BOOL)a3
{
  double v3;

  v3 = 1.0;
  if (a3)
    v3 = 0.0;
  -[UILabel setAlpha:](self->_instructionPreludeLabel, "setAlpha:", v3);
}

- (void)setContinuationLabelHidden:(BOOL)a3 animated:(BOOL)a4
{
  double v5;
  UILabel *instructionContinuationLabel;
  _BOOL4 v7;
  int v8;
  _QWORD v9[6];

  if (a3)
    v5 = 0.0;
  else
    v5 = 1.0;
  instructionContinuationLabel = self->_instructionContinuationLabel;
  if (!a4)
  {
    -[UILabel setAlpha:](instructionContinuationLabel, "setAlpha:", v5);
    return;
  }
  v7 = a3;
  v8 = -[UILabel isHidden](instructionContinuationLabel, "isHidden");
  if (!v7)
  {
    if (!v8)
      return;
    goto LABEL_10;
  }
  if ((v8 & 1) == 0)
  {
LABEL_10:
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __62__VTUIEnrollTrainingView_setContinuationLabelHidden_animated___block_invoke;
    v9[3] = &unk_24F33E180;
    v9[4] = self;
    *(double *)&v9[5] = v5;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v9, &__block_literal_global_3, 0.3, 0.0);
  }
}

uint64_t __62__VTUIEnrollTrainingView_setContinuationLabelHidden_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", *(double *)(a1 + 40));
}

- (BOOL)skipButtonHidden
{
  return self->_skipButtonHidden;
}

- (BOOL)checkMarkViewHidden
{
  return self->_checkMarkViewHidden;
}

- (BOOL)radarButtonHidden
{
  return self->_radarButtonHidden;
}

- (SUICOrbView)orbView
{
  return self->_orbView;
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (UILabel)instructionPreludeLabel
{
  return self->_instructionPreludeLabel;
}

- (UILabel)instructionContinuationLabel
{
  return self->_instructionContinuationLabel;
}

- (UIButton)radarExitButton
{
  return self->_radarExitButton;
}

- (VTUIEnrollTrainingViewDelegate)delegate
{
  return (VTUIEnrollTrainingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
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

- (SiriUIContentButton)radarButton
{
  return self->_radarButton;
}

- (void)setRadarButton:(id)a3
{
  objc_storeStrong((id *)&self->_radarButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarButton, 0);
  objc_storeStrong((id *)&self->_instructionPagedLabel, 0);
  objc_storeStrong((id *)&self->_checkMark, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radarExitButton, 0);
  objc_storeStrong((id *)&self->_instructionContinuationLabel, 0);
  objc_storeStrong((id *)&self->_instructionPreludeLabel, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_orbView, 0);
}

@end
